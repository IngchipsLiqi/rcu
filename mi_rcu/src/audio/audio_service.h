#ifndef _AUDIO_SERVICE_H
#define _AUDIO_SERVICE_H

#include <stdint.h>

//#include "audio.h"
//#include "audio_sbc.h"

uint32_t audio_sample_isr(void *user_data);

typedef void (*f_audio_data_porcess_callback)(void);
void audio_start(f_audio_data_porcess_callback call_back); // start audio
void audio_stop_sample(void);

uint16_t audio_get_curr_block(void);
uint8_t *audio_get_block_buff(uint16_t index);

void audio_rx_sample(int16_t sample);
void audio_create_queue_task(void); // init

#endif
