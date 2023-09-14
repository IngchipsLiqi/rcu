

#ifndef _VR_KEY_H_
#define _VR_KEY_H_

#include <string.h>
#include "ingsoc.h"
#include "peripheral_keyscan.h"
#include "key_board.h"
#include "FreeRTOS.h"
#include "timers.h"


extern TimerHandle_t check_sleep_timer;
typedef void (*f_key_pressed_callback)(uint8_t row, uint8_t col);
typedef void (*f_key_scan_one_cycle_callback)(void);
typedef void (*f_key_all_release_callback)(void);

void VR_key_Init(key_board_map_t               *map, 
                 f_key_pressed_callback        pressed_callback,
                 f_key_scan_one_cycle_callback scan_one_cycle_callback,
                 f_key_all_release_callback    all_release_call_back);

void KEYSCAN_Setup(const KEYSCAN_SetStateStruct* keyscan_set);


#endif


