
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __MI_RCU_KEY_H__
#define __MI_RCU_KEY_H__


#if defined __cplusplus
    extern "C" {
#endif

extern uint8_t voice_key_pressed;

void vr_system_start(void);
void vr_system_before_sleep(void);
void app_setup_peripherals(void);

void Wait_ClearBox(void);

#if defined __cplusplus
    }
#endif

#endif
