
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include "FreeRTOS.h"
#include "timers.h"

#include "peripheral_keyscan.h"

#include "profile.h"
#include "key_board.h"
#include "low_power.h"
#include "USBKeyboard.h"
#include "audio/audio_service.h"
#include "sdk_private_flash_data.h"
#include "mi_rcu_adv.h"
#include "pair_bond.h"
#include "mi_rcu_service.h"
#include "ir_sim.h"

#if defined __cplusplus
    extern "C" {
#endif

// state changed event
// each bit represent the state of one key
//           COL[0]  COL[1] ....
//             |       |
// ROW[0] ----K0------K1---------  K[RN -1]
//             |       |
// ROW[1] ---K[RN]----.....................
// ....        |       |
// ....   .................................

KEYSCAN_OutRowList key_out_row[KEYBOARD_ROW_NUM] = {
    {KEYBOARD_OUT_ROW_0, KEYBOARD_ROW_0},
    {KEYBOARD_OUT_ROW_1, KEYBOARD_ROW_1},
    {KEYBOARD_OUT_ROW_2, KEYBOARD_ROW_2},
    {KEYBOARD_OUT_ROW_3, KEYBOARD_ROW_3},
};

KEYSCAN_InColList key_in_col[KEYBOARD_COL_NUM] = {
    {KEYBOARD_IN_COL_0, KEYBOARD_COL_0},
    {KEYBOARD_IN_COL_1, KEYBOARD_COL_1},
    {KEYBOARD_IN_COL_2, KEYBOARD_COL_2},
};

typedef enum
{
    RCU4617_KEY_Power     = KEY_POWER,      // KEY_
    RCU4617_KEY_Voice     = KEY_F5,         // KEY_
    RCU4617_KEY_Home      = KEY_HOME,       // KEY_
    RCU4617_KEY_Up        = KEY_UP,         // KEY_
    RCU4617_KEY_MENU      = KEY_COMPOSE,    // KEY_
    RCU4617_KEY_Left      = KEY_LEFT,       // KEY_
    RCU4617_KEY_OK        = KEY_ENTER,      // KEY_
    RCU4617_KEY_Right     = KEY_RIGHT,      // KEY_
    RCU4617_KEY_Down      = KEY_DOWN,       // KEY_
    RCU4617_KEY_Back      = KEY_MEDIA_BACK, // KEY_
    RCU4617_KEY_Vol_up    = KEY_VOLUMEUP,   // KEY_
    RCU4617_KEY_Vol_down  = KEY_VOLUMEDOWN, // KEY_
} key_4617_t;

static keyFuncMap_t keyFuncMap[] = {
    {RCU4617_KEY_Power,     "KEY_Power"},           // s1
    {RCU4617_KEY_Voice,     "KEY_Voice"},           // s2
    {RCU4617_KEY_Up,        "KEY_UP"},              // s3
    {RCU4617_KEY_OK,        "KEY_OK"},              // s4
    {RCU4617_KEY_Left,      "KEY_Left"},            // s5
    {RCU4617_KEY_Right,     "KEY_Right"},           // s6
    {RCU4617_KEY_Down,      "KEY_Down"},            // s7
    {RCU4617_KEY_Back,      "KEY_Back"},            // s8
    {RCU4617_KEY_Home,      "KEY_Home"},            // s9
    {RCU4617_KEY_Vol_up,    "KEY_Vol_up"},          // s10
    {RCU4617_KEY_MENU,      "KEY_MENU"},            // s11
    {RCU4617_KEY_Vol_down,  "KEY_Vol_down"},        // s12
};

//static keyFuncMap_t keyFuncMap[] = {
//    {RCU4617_KEY_OK,        "KEY_OK"},              // s1
//    {RCU4617_KEY_Voice,     "KEY_Voice"},           // s2
//    {RCU4617_KEY_Up,        "KEY_UP"},              // s3
//    {RCU4617_KEY_Power,     "KEY_Power"},           // s4
//    {RCU4617_KEY_Down,      "KEY_Down"},            // s5
//    {RCU4617_KEY_MENU,      "KEY_MENU"},            // s6
//    {RCU4617_KEY_Right,     "KEY_Right"},           // s7
//    {RCU4617_KEY_Back,      "KEY_Back"},            // s8
//    {RCU4617_KEY_Home,      "KEY_Home"},            // s9
//    {RCU4617_KEY_Vol_down,  "KEY_Vol_down"},        // s10
//    {RCU4617_KEY_Left,      "KEY_Left"},            // s11
//    {RCU4617_KEY_Vol_up,    "KEY_Vol_up"},          // s12
//};

static void DKHandler_NoWork(void)
{
    log_printf("[>i:dk]: null\r\n");
}

static void mi_rcu_pair_adv_time_out_callback(TimerHandle_t xTimer)
{
    log_printf("[>i:key]: pair adv time out\r\n");
    return;
}

static void key_clear_db_data_and_repair()
{
    log_printf("[>i:dk]: repair\r\n");
    btstack_push_user_msg(USER_MSG_ID_DISCONNECT_DEV, 0, 0);
    clear_pairing_data();
    vr_start_adv(ADV_UNDIRECT_PAIRING, g_power_off_save_data_in_ram.module_mac_address, 60000, mi_rcu_pair_adv_time_out_callback);
    return;
}

#define KB_INVALID            0xff
#define DOUBLE_KEY_MIDDLE_INTERVAL  ((500)*(1000))
#define DOUBLE_KEY_SHORT_INTERVAL   ((DOUBLE_KEY_MIDDLE_INTERVAL)/(2))
static doubleKeyMap_t doubleKeyMap[] = {
    {RCU4617_KEY_OK,    RCU4617_KEY_Left, DOUBLE_KEY_MIDDLE_INTERVAL, "Start IR learning.",                DKHandler_NoWork},
    {RCU4617_KEY_Right, RCU4617_KEY_Left, DOUBLE_KEY_SHORT_INTERVAL,  "Test double key DKHandler_NoWork.", DKHandler_NoWork}
};

#define PRESSED_KEY_DELAY_0             (0)
#define PRESSED_KEY_DELAY_500           (500)
#define PRESSED_KEY_DELAY_1500          (1500)
static keepPressedKeyMap_t keepPressedKeyMap[] = {
    { RCU4617_KEY_Left,     0xff,              PRESSED_KEY_DELAY_0,    "keep press KEY_LEFT, adv paired!", DKHandler_NoWork},
    { RCU4617_KEY_Back,     0xff,              3000,                   "keep press back, factory test!",   DKHandler_NoWork},
    { RCU4617_KEY_MENU,     RCU4617_KEY_Home,  PRESSED_KEY_DELAY_500,  "Enter pairing mode.",              key_clear_db_data_and_repair},
};

uint8_t voice_key_pressed = 0;
static void key_board_proc_default(key_code_t key_code)
{
    switch (key_code) {
    case KEY_RELEASE_CODE:
    {
        if (voice_key_pressed == 1) {
            voice_key_pressed = 0;
            btstack_push_user_msg(USER_MSG_ID_MI_RCU_VOICE_STOP_REQUEST, NULL, key_code);
            low_power_clear_exit_reason(LOW_POWER_EXIT_REASON_VOICE);
            audio_stop_sample();
        } else {
            btstack_push_user_msg(USER_MSG_ID_MI_RCU_KEY_REPORT_SEND, NULL, key_code);
        }
        low_power_clear_exit_reason(LOW_POWER_EXIT_REASON_GPIO);
        break;
    }
    case RCU4617_KEY_Voice:
    {
        voice_key_pressed = 1;
        btstack_push_user_msg(USER_MSG_ID_MI_RCU_VOICE_START_REQUEST, NULL, key_code);
        break;
    }
    default:
    {
        btstack_push_user_msg(USER_MSG_ID_MI_RCU_KEY_REPORT_SEND, NULL, key_code);
        break;
    }
    }
    return;
}

static uint8_t power_adv_start = 0;
static void mi_rcu_reconnect_adv_time_out_callback(TimerHandle_t xTimer)
{
    power_adv_start = 0;
    vr_stop_adv();
    log_printf("[>i:key]: adv time out\r\n");
    return;
}

static void mi_rcu_power_adv_time_out_callback(TimerHandle_t xTimer)
{
    vr_start_adv(ADV_UNDIRECT_POWER, g_power_off_save_data_in_ram.module_mac_address, 10000, mi_rcu_reconnect_adv_time_out_callback);
    return;
}

// static uint8_t temp_peer_addr[6] = {0x10 , 0xBB , 0xF3 , 0x3F , 0x65 , 0x4f};
static void key_board_proc_adv(key_code_t key_code)
{
    switch (key_code) {
    case RCU4617_KEY_Power:
    {
        if (power_adv_start == 0) {
            power_adv_start = 1;
            mi_rcu_set_power_on_adv_data();
            vr_start_adv(ADV_DIRECT_HDC, g_power_off_save_data_in_ram.module_mac_address, 1300, mi_rcu_power_adv_time_out_callback);
        }
        break;
    }
    case KEY_RELEASE_CODE:
    {
        if (voice_key_pressed == 1) {
            voice_key_pressed = 0;
            // audio_stop_sample(); // AUDIO_TEST
        } else {
        }
        low_power_clear_exit_reason(LOW_POWER_EXIT_REASON_GPIO);
        break;
    }
    case RCU4617_KEY_Voice:
        voice_key_pressed = 1;
        // audio_start(DKHandler_NoWork); // AUDIO_TEST
    default:
        adv_start();
        break;
    }
    return;
}

static void key_board_proc_paired(key_code_t key_code)
{
    key_board_proc_default(key_code);
    return;
}

static void key_board_proc_battery_low(key_code_t key_code)
{
    key_board_proc_default(key_code);
    return;
}

static void key_board_proc_factory_test_single_wave(key_code_t key_code)
{
    key_board_proc_default(key_code);
    return;
}

static void factory_test_single_wave(void)
{
    uint64_t rtc_us = platform_get_us_time();
    uint32_t rtc_us_h = (rtc_us >> 32) & 0xFFFFFFFF;
    uint32_t rtc_us_l = rtc_us & 0xFFFFFFFF;
    log_printf("[>i:TM]: time0x%08x%08x\r\n", rtc_us_h, rtc_us_l);
    if ((rtc_us_h == 0) && (rtc_us_l < 2000000)) {
        log_printf("[>i:TM]: power on factory single wave*********************\r\n");
        vr_set_sys_status(VR_STATUS_FACTORY_TEST_SINGLE_WAVE);
    }
    return;
}

static void mi_rcu_single_key_handle(key_code_t key_code)
{
    VOICE_REMORER_STATUS status = vr_get_sys_status();
    static uint8_t is_first_key = 1;

    if (is_first_key) {
        is_first_key = 0;
        if (key_code == KEY_FACTORY_TEST) {
            factory_test_single_wave();
        }
    }

    switch (status)
    {
    case VR_STATUS_ADVERTISING:
    case VR_STATUS_STOP_ADVERTISING:
    case VR_STATUS_DISCONNECTING:
        key_board_proc_adv(key_code);
        break;

    case VR_STATUS_CONNECTED_PAIRING:
    case VR_STATUS_PAIRED:
    case VR_STATUS_VOICE:
        key_board_proc_paired(key_code);
        break;

    case VR_STATUS_BATTERY_LOW:
        key_board_proc_battery_low(key_code);
        break;

    case VR_STATUS_FACTORY_TEST_SINGLE_WAVE:
        key_board_proc_factory_test_single_wave(key_code);
        break;

    default:
        key_board_proc_default(key_code);
        break;
    }
    return;
}

static key_board_map_t mi_rcu_key_fun_map = {
    .single_key_fun = mi_rcu_single_key_handle,

    .key_map = keyFuncMap,
    .key_map_size = (sizeof(keyFuncMap) / sizeof(keyFuncMap[0])),

    .double_key_map = doubleKeyMap,
    .double_key_map_size = (sizeof(doubleKeyMap) / sizeof(doubleKeyMap[0])),

    .keep_pressed_key_map = keepPressedKeyMap,
    .keep_pressed_key_map_size = (sizeof(keepPressedKeyMap) / sizeof(keepPressedKeyMap[0])),
};

const static KEYSCAN_SetStateStruct mi_rcu_key_set = {
    .col               = key_in_col,
    .col_num           = KEYBOARD_COL_NUM,
    .row               = key_out_row,
    .row_num           = KEYBOARD_ROW_NUM,
    .fifo_num_trig_int = 1,
    .release_time      = 110,
    .scan_interval     = 1600,
    .debounce_counter  = 50,
    .dma_num_trig_int  = 0x10,
    .dma_en            = 0,
    .int_trig_en       = 1,
};

void app_setup_peripherals(void)
{
    SYSCTRL_ClearClkGateMulti((1 << SYSCTRL_ClkGate_APB_PinCtrl) |
                             (1 << SYSCTRL_ClkGate_APB_PinCtrl) |
                             (1 << SYSCTRL_ClkGate_APB_GPIO0) |
                             (1 << SYSCTRL_ClkGate_APB_GPIO1));

    key_board_start_scan(&mi_rcu_key_set);
    
    ir_setup_tx(IR_TX_PIN);

    return;
}

void vr_system_start(void)
{
    key_board_task_init(&mi_rcu_key_fun_map);

    app_setup_peripherals();

    low_power_create_timer();

    audio_create_queue_task();
    ir_task_init();
    log_printf("[>i:sys]: started\r\n");

    return;
}

void vr_system_before_sleep(void)
{
    key_board_wake_up_enable(1);
    SYSCTRL_EnableWakeupSourceDetection();
    return;
}

#if defined __cplusplus
    }
#endif
