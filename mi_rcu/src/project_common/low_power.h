
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __LOW_POWER_H__
#define __LOW_POWER_H__

#include "stdint.h"

#include "FreeRTOS.h"
#include "semphr.h"

#include "platform_api.h"

#if defined __cplusplus
    extern "C" {
#endif

typedef enum {
    LOW_POWER_EXIT_REASON_COM_RX_DATA     =  0,
    LOW_POWER_EXIT_REASON_COM_TX_DATA         ,
    LOW_POWER_EXIT_REASON_GPIO                ,
    LOW_POWER_EXIT_REASON_SYS_START           ,
    LOW_POWER_EXIT_REASON_VOICE                ,
    LOW_POWER_EXIT_REASON_MAX             = 15,
} low_power_exit_reason_t;

extern uint16_t g_connection_interval;

void low_power_exit_saving(low_power_exit_reason_t reason);
void low_power_enter_saving(void);
void low_power_clear_exit_reason(low_power_exit_reason_t reason);
void low_power_create_timer(void);

uint32_t m_on_deep_sleep_wakeup(const platform_wakeup_call_info_t *info, void *user_data);
uint32_t m_query_deep_sleep_allowed(void *dummy, void *user_data);
uint32_t cb_putc(char *c, void *dummy);
void m_setup_peripherals(void);

extern uint8_t g_exit_saving;

#if defined __cplusplus
    }
#endif

#endif
