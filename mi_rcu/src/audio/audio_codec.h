
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __AUDIO_CODEC_H__
#define __AUDIO_CODEC_H__

#include "stdint.h"

#if defined __cplusplus
    extern "C" {
#endif

typedef void (*f_audio_codec_output_fun)(uint8_t *data, int data_len);
typedef void (*f_audio_codec_input_fun)(uint8_t *data, int data_len);

int audio_encode_init(f_audio_codec_input_fun *input_fun, f_audio_codec_output_fun output_fun);
void audio_encode_finish(void);

#if defined __cplusplus
    }
#endif

#endif
