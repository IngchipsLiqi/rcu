
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include <stdio.h>
#include <string.h>

#include "ingsoc.h"
#include "platform_api.h"
#include "peripheral_keyscan.h"

#include "USBKeyboard.h"
#include "USBKeyboard.h"

#include "key_board.h"
#include "keyscan_bsp.h"
#include "VR_key.h"
#include "sdk_private_flash_data.h"
#include "low_power.h"

#if defined __cplusplus
    extern "C" {
#endif

static VOICE_REMORER_STATUS vr_sys_status = VR_STATUS_INI; // g_VoiceRemoterStatus

static uint8_t key_state_buf[2][KEYBOARD_ROW_NUM][KEYBOARD_COL_NUM] = {0};
static uint8_t key_state_last_index = 0;
static uint8_t key_state_now_index = 1;
static uint8_t have_key_pressing = 0;

uint8_t have_key_is_pressing(void)
{
    return have_key_pressing;
}

static void key_board_all_release_callback(void) // this fun is run in isr
{
    memset(key_state_buf, 0, sizeof(key_state_buf));
    have_key_pressing = 0;
    return;
}

static void key_board_pressed(uint8_t row, uint8_t col)
{
    key_state_buf[key_state_now_index][row][col] = 1;
    return;
}

static void key_board_scan_one_cycle_end(void)
{
    key_state_now_index ^= 1;
    key_state_last_index ^= 1;
    memset(key_state_buf[key_state_now_index], 0, sizeof(key_state_buf[key_state_now_index]));
    return;
}

void key_board_task_init(key_board_map_t *map)
{
    VR_key_Init(map,
                key_board_pressed,
                key_board_scan_one_cycle_end,
                key_board_all_release_callback);
    return;
}

void key_board_event_connected(const le_meta_event_enh_create_conn_complete_t *cmpl)
{
    vr_set_sys_status(VR_STATUS_CONNECTED_PAIRING);
    return;
}

void key_board_event_disconnect(const event_disconn_complete_t *cmpl)
{
    vr_set_sys_status(VR_STATUS_DISCONNECTING);
    return;
}

VOICE_REMORER_STATUS vr_get_sys_status(void)
{
    return vr_sys_status;
}

void vr_set_sys_status(VOICE_REMORER_STATUS status)
{
    if (vr_sys_status == VR_STATUS_FACTORY_TEST_SINGLE_WAVE) {
        return;
    }
    vr_sys_status = status;
    log_printf("[>i:kb]: set status%d\r\n", vr_sys_status);
    return;
}

uint8_t key_state_is_changed(uint8_t row, uint8_t col)
{
    return (key_state_buf[key_state_now_index][row][col] != key_state_buf[key_state_last_index][row][col]);
}

uint8_t key_current_state(uint8_t row, uint8_t col)
{
    return (key_state_buf[key_state_now_index][row][col]);
}

const static KEYSCAN_SetStateStruct *key_board_set = NULL;

uint8_t key_row_col_to_id(uint8_t row, uint8_t col)
{
    uint8_t key_id = 0;

    key_id = col * key_board_set->row_num + row;

    //dbg_printf("[>d:key id]:%d r[%u] c[%u]\r\n", key_id, row, col);
    have_key_pressing = 1;
    return key_id;
}

static void key_board_have_pressed_interrupt(void)
{
    log_printf("[>i:kb]: gpio interrupt\r\n");
    low_power_exit_saving(LOW_POWER_EXIT_REASON_GPIO);
}

void key_board_start_scan(const KEYSCAN_SetStateStruct *set)
{
    key_board_set = set;
    KEYSCAN_Setup(key_board_set);
    KEYSCAN_SetScannerEn(1);
    return;
}

void key_board_start_int_trig(void)
{
    KEYSCAN_SetScannerEn(0);
    keyscan_bsp_enable_press_interrupt(key_board_set, key_board_have_pressed_interrupt);

    return;
}

void key_board_wake_up_enable(uint8_t en)
{
    if (en) {
        keyscan_bsp_enable_wakeup_before_sleep(key_board_set);
    }
    return;
}

const KEYSCAN_SetStateStruct *Get_KeyScan_Set(void)
{
    return key_board_set;
}

#if defined __cplusplus
    }
#endif
