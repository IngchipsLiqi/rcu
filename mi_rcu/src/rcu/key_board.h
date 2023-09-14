
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __KEY_BOARD_H__
#define __KEY_BOARD_H__

#include "stdint.h"
#include "peripheral_keyscan.h"
#include "btstack_event.h"
#include "profile.h"

#if defined __cplusplus
    extern "C" {
#endif

typedef uint16_t key_code_t;
typedef struct
{
    key_code_t key_code;
    char *intro;
} keyFuncMap_t;

typedef struct
{
    key_code_t key_code1;
    key_code_t key_code2;
    uint64_t interval;
    char *intro;
    void (*DKHandler)(void);
} doubleKeyMap_t;

typedef struct
{
    key_code_t key_code1;
    key_code_t key_code2;
    uint32_t interval;
    char *intro;
    void (*KP_Handler)(void);
} keepPressedKeyMap_t;

typedef struct
{
    void (*single_key_fun)(key_code_t key_code);
    keyFuncMap_t *key_map;
    int key_map_size;
    doubleKeyMap_t *double_key_map;
    int double_key_map_size;
    keepPressedKeyMap_t *keep_pressed_key_map;
    int keep_pressed_key_map_size;
} key_board_map_t;

void key_board_task_init(key_board_map_t *map);
void key_board_start_scan(const KEYSCAN_SetStateStruct *set);
void key_board_start_int_trig(void);
void key_board_wake_up_enable(uint8_t en);
uint8_t have_key_is_pressing(void);


void key_board_event_connected(const le_meta_event_enh_create_conn_complete_t *conn_complete);
void key_board_event_disconnect(const event_disconn_complete_t *cmpl);
VOICE_REMORER_STATUS vr_get_sys_status(void);
void vr_set_sys_status(VOICE_REMORER_STATUS status);

uint8_t key_state_is_changed(uint8_t row, uint8_t col);
uint8_t key_current_state(uint8_t row, uint8_t col);
uint8_t key_row_col_to_id(uint8_t row, uint8_t col);
void Write_TobeSEND_KeyValue(uint16_t *key_value);
void Read_TobeSEND_KeyValue(void);
const KEYSCAN_SetStateStruct *Get_KeyScan_Set(void);

extern keyFuncMap_t keyIRFuncMap[];

#if defined __cplusplus
    }
#endif

#endif
