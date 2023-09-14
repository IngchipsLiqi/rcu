
#ifndef __VR_BATTERY_H__
#define __VR_BATTERY_H__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "profile.h"

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "btstack_event.h"

typedef void (*handle_process)( uint16_t );

typedef struct
{
    uint16_t battery_level;
    uint16_t pre_level;
    uint16_t adc_counter;
    handle_process process_handle;
}battery_param_t;


#if BAT_UTILity_BY_TASK
extern TaskHandle_t BatteryTask_handler;
#endif
extern battery_param_t battery_param;
extern TimerHandle_t battery_adctimer;
extern TimerHandle_t start_adctimer;
extern battery_param_t battery_param;

void battery_task_init(void);
void bettery_service_init(void);

void battery_user_msg_handler(uint32_t msg_id, void *data, uint16_t size);
void battery_event_connected(const le_meta_event_enh_create_conn_complete_t *cmpl);
void battery_event_disconnect(const event_disconn_complete_t *cmpl);
void battery_setup_peripherals_adc_continues(void);


#endif
