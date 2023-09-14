
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __MI_RCU_ADV_H__
#define __MI_RCU_ADV_H__

#include "profile.h"

#include "FreeRTOS.h"
#include "timers.h"

#if defined __cplusplus
    extern "C" {
#endif

typedef enum {
    STOP_ADV_REASON_IDLE = 0,
    STOP_ADV_REASON_PAIRING,
    STOP_ADV_REASON_TIMEOUT,
    STOP_ADV_REASON_POWERKEY,
    STOP_ADV_REASON_LOWPOWER,
    STOP_ADV_REASON_UART_CMD,
    STOP_ADV_REASON_INI,
} VR_STOP_ADV_REASON;

void vr_start_adv(VR_ADV_TYPE advType, const bd_addr_t addr, uint32_t ms, TimerCallbackFunction_t call_back_fun);
void adv_user_msg_handler(uint32_t msg_id, void *data, uint16_t size);
void vr_stop_adv(void);

#if defined __cplusplus
    }
#endif

#endif
