
#ifndef _AUDIO_DENOISE_H
#define _AUDIO_DENOISE_H
#include <stdint.h>

#include "profile.h"

#ifdef AUDIO_DENOISE

#define AUDIO_DENOISE_FRAME_LEN (AUDIO_DENOISE_HOP_LEN << 1)

/*************************************************************

*/
#define M_PI       3.14159265358979323846   // pi

typedef float audio_complex[2];

typedef struct {
    float mag[AUDIO_DENOISE_FRAME_LEN];
    float phase[AUDIO_DENOISE_FRAME_LEN];
} audio_denoise_complex_s;

typedef struct {
    float real[AUDIO_DENOISE_FRAME_LEN];
} audio_denoise_complex_i_s;

typedef struct
{
    audio_denoise_complex_s w_dft;
    audio_denoise_complex_i_s w1_idft;
    audio_denoise_complex_i_s w2_idft;

    const float* win_hanning;

    float noise_estimated[AUDIO_DENOISE_FRAME_LEN];
    float smoothed_power[AUDIO_DENOISE_FRAME_LEN];
    float power_min[AUDIO_DENOISE_FRAME_LEN];

    float spe_pre_pro;
    float a1, a2, a3, *a4, a5, a6;

    int cnt_x;
    int cnt_y;
    
    audio_complex fft1[AUDIO_DENOISE_FRAME_LEN];
    audio_complex fft2[AUDIO_DENOISE_FRAME_LEN];
}audio_denoise_handle_s;

/*************************************************************
    1. use this api after audio_denoise_init to reduce noise in the audio signal
    2. currently, the fft size is 256(SAMPLE_BUF_LEN * 2), == 32ms, !!! the fft len should be in the range between 20ms and 40ms
    3. out can be the same as in, they have same size
    4. the process time on 8000 sample rate for each 128(SAMPLE_BUF_LEN) sample is between 11~13ms, which is less than the signal interval(16ms)
    5. the first 128 sample returns 1(not changed, out is same as in), otherwise return 0;
*/
int audio_denoise_process(int16_t *in, int16_t *out);

/*************************************************************
    1. fast way to convert audio signal to a higher sample rate, e.g. 8000 to 16000
    2. in the case of 8000 to 16000, upsample_factor should be 2
    3. in the case of 8000 to 16000, uthe size of out should be 2*in_len
    4. out and in can be same pointer
*/
void audio_denoise_upsample(int16_t* in, uint32_t in_len, int16_t* out, uint8_t upsample_factor);

/*************************************************************
    1. initialize global parameters, allocate memory from link layer, the size is about 12k
    2. noise related info is saved in handle, this piece of memory should remained unchanged during audio process,
*/
int audio_denoise_init(uint32_t sample_rate);

/*************************************************************
    1. deinit the handle and reinit again to reset the status.
*/
int audio_denoise_deinit(void);

#endif
#endif
