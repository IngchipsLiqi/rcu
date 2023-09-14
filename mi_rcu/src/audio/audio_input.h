
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __AUDIO_INPUT_H__
#define __AUDIO_INPUT_H__

#include "stdint.h"

#if defined __cplusplus
    extern "C" {
#endif

void audio_adc_input_setup(void);
void audio_adc_input_start(void);
void audio_adc_input_stop(void);

#if defined __cplusplus
    }
#endif

#endif

