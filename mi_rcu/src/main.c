
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include <string.h>
#include <stdio.h>

#include "btstack_event.h"
#include "btstack_util.h"

#include "ingsoc.h"
#include "platform_api.h"
#include "kv_storage.h"
#include "eflash.h"

#include "profile.h"
#include "board.h"
#include "sdk_private_flash_data.h"
#include "low_power.h"
#include "kv_impl.h"

#define PRINT_UART    APB_UART0

static uint32_t cb_hard_fault(hard_fault_info_t *info, void *_)
{
    platform_printf("HARDFAULT:\nPC : 0x%08X\nLR : 0x%08X\nPSR: 0x%08X\n"
                    "R0 : 0x%08X\nR1 : 0x%08X\nR2 : 0x%08X\nP3 : 0x%08X\n"
                    "R12: 0x%08X\n",
                    info->pc, info->lr, info->psr,
                    info->r0, info->r1, info->r2, info->r3, info->r12);
    platform_reset();
    for (;;);
}

static uint32_t cb_assertion(assertion_info_t *info, void *_)
{
    platform_printf("[ASSERTION] @ %s:%d\n",
                    info->file_name,
                    info->line_no);
    platform_reset();
    for (;;);
}

static uint32_t cb_heap_out_of_mem(uint32_t tag, void *_)
{
    platform_printf("[OOM] @ %d\n", tag);
    platform_reset();
    for (;;);
}

static platform_evt_cb_table_t evt_cb_table =
{
    .callbacks = {
        [PLATFORM_CB_EVT_HARD_FAULT] = {
            .f = (f_platform_evt_cb)cb_hard_fault,
        },
        [PLATFORM_CB_EVT_ASSERTION] = {
            .f = (f_platform_evt_cb)cb_assertion,
        },
        [PLATFORM_CB_EVT_HEAP_OOM] = {
            .f = (f_platform_evt_cb)cb_heap_out_of_mem,
        },
        [PLATFORM_CB_EVT_PROFILE_INIT] = {
            .f = setup_profile,
        },
        [PLATFORM_CB_EVT_ON_DEEP_SLEEP_WAKEUP] = {
            .f = (f_platform_evt_cb)m_on_deep_sleep_wakeup,
        },
        [PLATFORM_CB_EVT_QUERY_DEEP_SLEEP_ALLOWED] = {
            .f = m_query_deep_sleep_allowed,
        },
        [PLATFORM_CB_EVT_PUTC] = {
            .f = (f_platform_evt_cb)cb_putc,
        },
//        [PLATFORM_CB_EVT_TRACE] = {
//            .f = (f_platform_evt_cb)cb_trace_rtt,
//            .user_data = &trace_ctx,
//        },
    }
};

static int db_write_to_flash(const void *db, const int size)
{
    log_printf("[>i:db]: write size %d\r\n", size);
    printf_hexdump(db, size);
    program_flash(DB_FLASH_ADDRESS, (const uint8_t *)db, size);
    return KV_OK;
}

static int read_from_flash(void *db, const int max_size)
{
    log_printf("[>i:db]: read size %d\r\n", max_size);
    memcpy(db, (void *)DB_FLASH_ADDRESS, max_size);
    return KV_OK;
}

static void kb_input_char(char c)
{
    btstack_push_user_msg(USER_MSG_ID_MI_RCU_KEY_REPORT_SEND, NULL, c);
    log_printf("rx");
}

static uint32_t uart_isr(void *user_data)
{
    uint32_t status;

    while(1)
    {
        status = apUART_Get_all_raw_int_stat(PRINT_UART);
        if (status == 0)
            break;

        PRINT_UART->IntClear = status;

        // rx int
        if (status & (1 << bsUART_RECEIVE_INTENAB))
        {
            while (apUART_Check_RXFIFO_EMPTY(PRINT_UART) != 1)
            {
                char c = PRINT_UART->DataRead;
                kb_input_char(c);
            }
        }
    }
    return 0;
}

static void trim_rf_freq(void)
{
#define w32(a,b) *(volatile uint32_t*)(a) = (uint32_t)(b);
//#define rf_ctrl0_data 0x4A6E00C8
#define rf_ctrl0_data 0x4A4200C8 // chenyi 82c new
    w32(0x40100160, rf_ctrl0_data);
    return;
}

#define HCLK_48M     SYSCTRL_CLK_PLL_DIV_7
#define HCLK_84M     SYSCTRL_CLK_PLL_DIV_4
#define HCLK_112M     SYSCTRL_CLK_PLL_DIV_3
static void setup_pll_clk_and_sleep_para(void)
{
#define PLL_EN     1
#define PLL_LOOP   70
#define HCLK_DIV   HCLK_48M
#define FLASH_DIV  SYSCTRL_CLK_PLL_DIV_2
#define TIME_REDUCTION 4500
#define LL_DELAY       700
#define LATENCY_PRE    10

    platform_config(PLATFORM_CFG_DEEP_SLEEP_TIME_REDUCTION, TIME_REDUCTION);
    platform_config(PLATFORM_CFG_LL_DELAY_COMPENSATION, LL_DELAY);
    ll_config(LL_CFG_SLAVE_LATENCY_PRE_WAKE_UP, LATENCY_PRE);

    SYSCTRL_EnableConfigClocksAfterWakeup(PLL_EN, PLL_LOOP, HCLK_DIV, FLASH_DIV, 0);

    SYSCTRL_EnableSlowRC(0, SYSCTRL_SLOW_RC_24M);

    return;
}

#define power_on_flag 0x01
static void system_tune_32k(void)
{
    setup_pll_clk_and_sleep_para();
    if (platform_read_persistent_reg() != 0) {
        platform_write_persistent_reg(0);
        log_printf("[>i:32k]: before %x\r\n", platform_calibrate_32k());
        platform_32k_rc_auto_tune();
        log_printf("[>i:32k]: %x\r\n", platform_calibrate_32k());
    }
    else {
        log_printf("[>i:power on]:%d*******************\r\n", platform_read_persistent_reg());
        platform_write_persistent_reg(power_on_flag);
        platform_shutdown(32768 / 10, 0, 0);
    }
    return;
}

void test_shutdown_wakeup(void)
{
    SYSCTRL_ClearClkGateMulti((1 << SYSCTRL_ClkGate_APB_WDT) |
                              (1 << SYSCTRL_ClkGate_APB_GPIO0) |
                              (1 << SYSCTRL_ClkGate_APB_GPIO1) |
                              (1 << SYSCTRL_ClkGate_APB_PinCtrl) |
                              (1 << SYSCTRL_ClkGate_APB_UART0));
    PINCTRL_SetPadMux(GIO_GPIO_21, IO_SOURCE_GPIO);
    PINCTRL_Pull(GIO_GPIO_21, PINCTRL_PULL_DOWN);
    GIO_SetDirection(GIO_GPIO_21, GIO_DIR_INPUT);
    GIO_ConfigIntSource(GIO_GPIO_21, GIO_INT_EN_LOGIC_HIGH_OR_RISING_EDGE, GIO_INT_EDGE);
    GIO_EnableDeepSleepWakeupSource(GIO_GPIO_21, 1, 1, PINCTRL_PULL_DOWN);
    GIO_EnableDeeperSleepWakeupSourceGroupA(1, 1);
    GIO_EnableRetentionGroupA(1);
    log_printf("[>i:platform_shutdown]:%d*******************\r\n", platform_read_persistent_reg());
    platform_shutdown(32768 * 30, 0, 0);
    return;
}

void test_wfi(void)
{
    __DSB();
    __WFI();
    __ISB();
    while(1) {};
}

static void set_reg_bits(volatile uint32_t *reg, uint32_t v, uint8_t bit_width, uint8_t bit_offset)
{
    uint32_t mask = ((1 << bit_width) - 1) << bit_offset;
    *reg = (*reg & ~mask) | (v << bit_offset);
}

static void set_reg_bit(volatile uint32_t *reg, uint8_t v, uint8_t bit_offset)
{
    uint32_t mask = 1 << bit_offset;
    *reg = (*reg & ~mask) | (v << bit_offset);
}

static void init_por(void)
{
    set_reg_bit((volatile uint32_t *)(AON1_CTRL_BASE + 0x10), 0, 16);  // PDR
    set_reg_bit((volatile uint32_t *)(AON1_CTRL_BASE + 0x1c), 0, 4);
    set_reg_bit((volatile uint32_t *)(AON1_CTRL_BASE + 0x10), 1, 17);  // PVD
    set_reg_bit((volatile uint32_t *)(AON1_CTRL_BASE + 0x1c), 0, 5);
    set_reg_bits((volatile uint32_t *)(AON1_CTRL_BASE + 0x8), 8, 4, 0);
    return;
}

static uint8_t pub_addr_r[6] = {0x1C, 0x70, 0xC9, 0x27, 0x8E, 0x93};
static uint8_t pub_addr[6] = {0};
int app_main()
{
    SYSCTRL_ConfigBOR(SYSCTRL_BOR_1V5, 1, 1);

    int ret = sdk_load_private_flash_data();
    //kv_init(db_write_to_flash, read_from_flash);

    platform_config(PLATFORM_CFG_OSC32K_EN, PLATFORM_CFG_DISABLE);
    platform_config(PLATFORM_CFG_32K_CLK_ACC, 800);
    m_setup_peripherals();
    SYSCTRL_Init();

    platform_set_evt_callback_table(&evt_cb_table);

    system_tune_32k();

    kv_impl_init();
    trim_rf_freq();

    log_printf("[>i:main]: %d\r\n", ret);

//    reverse_bd_addr(g_power_off_save_data_in_ram.module_mac_address, pub_addr);

    reverse_bd_addr(pub_addr_r, pub_addr);
    reverse_bd_addr(pub_addr, g_power_off_save_data_in_ram.module_mac_address);

    sysSetPublicDeviceAddr(pub_addr); // PUB_ADDR_TEST

    SYSCTRL_SelectMemoryBlocks(SYSCTRL_MEM_BLOCK_0 | SYSCTRL_MEM_BLOCK_1 | SYSCTRL_SHARE_BLOCK_0 | SYSCTRL_SHARE_BLOCK_1 | SYSCTRL_SHARE_BLOCK_2);
    // test_wfi();

    return 0;
}
