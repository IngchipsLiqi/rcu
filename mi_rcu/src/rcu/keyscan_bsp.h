
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __KEYSCAN_BSP_H__
#define __KEYSCAN_BSP_H__

#include "ingsoc.h"
#include "peripheral_keyscan.h"

#ifdef __cplusplus
    extern "C" {
#endif

#if (INGCHIPS_FAMILY == INGCHIPS_FAMILY_918)

#elif (INGCHIPS_FAMILY == INGCHIPS_FAMILY_916)

typedef void (*key_pressed_callback_t)(void);

/**
 * @brief Before sleep should enable gpios of keyboard wakeup
 *
 * @param[in] keyscan_set       Initial parameter struct
 */
void keyscan_bsp_enable_wakeup_before_sleep(const KEYSCAN_SetStateStruct* keyscan_set);


/**
 * @brief After wakeup should disable gpios of keyboard wakeup first
 *
 * @param[in] keyscan_set       Initial parameter struct
 */
void keyscan_bsp_disable_wakeup_after_sleep(const KEYSCAN_SetStateStruct* keyscan_set);

void keyscan_bsp_enable_press_interrupt(const KEYSCAN_SetStateStruct* keyscan_set, key_pressed_callback_t fun);

#endif

#ifdef __cplusplus
    }
#endif

#endif
