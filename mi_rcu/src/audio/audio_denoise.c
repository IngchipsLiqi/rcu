
#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "platform_api.h"
#include "profile.h"
#include "audio_denoise.h"
#include "arm_math.h"
#include "arm_const_structs.h"

#ifdef AUDIO_DENOISE

audio_denoise_handle_s* denoise_handle;
const float audio_denoise_hanning[AUDIO_DENOISE_FRAME_LEN] = { 0.074202, 0.074587, 0.075228, 0.076125, 0.077277, 0.078684, 0.080345, 0.082258, 0.084423, 0.086839, 0.089503, 0.092414, 
0.095571, 0.098972, 0.102614, 0.106496, 0.110614, 0.114968, 0.119553, 0.124367, 0.129407, 0.134671, 0.140155, 0.145856, 0.151769, 0.157893, 0.164223, 0.170755, 0.177485, 0.184410, 
0.191524, 0.198825, 0.206307, 0.213966, 0.221797, 0.229795, 0.237957, 0.246276, 0.254748, 0.263368, 0.272131, 0.281030, 0.290062, 0.299220, 0.308499, 0.317893, 0.327397, 0.337005, 
0.346711, 0.356510, 0.366395, 0.376360, 0.386400, 0.396508, 0.406679, 0.416906, 0.427183, 0.437504, 0.447862, 0.458252, 0.468667, 0.479101, 0.489547, 0.500000, 0.510453, 0.520899, 
0.531333, 0.541748, 0.552138, 0.562496, 0.572817, 0.583094, 0.593321, 0.603492, 0.613600, 0.623640, 0.633605, 0.643490, 0.653289, 0.662995, 0.672603, 0.682107, 0.691501, 0.700780, 
0.709938, 0.718970, 0.727869, 0.736632, 0.745252, 0.753724, 0.762043, 0.770205, 0.778203, 0.786034, 0.793693, 0.801175, 0.808476, 0.815590, 0.822515, 0.829245, 0.835777, 0.842107, 
0.848231, 0.854144, 0.859845, 0.865329, 0.870593, 0.875633, 0.880447, 0.885032, 0.889386, 0.893504, 0.897386, 0.901028, 0.904429, 0.907586, 0.910497, 0.913161, 0.915577, 0.917742, 
0.919655, 0.921316, 0.922723, 0.923875, 0.924772, 0.925413, 0.925798, 0.925926, 0.925798, 0.925413, 0.924772, 0.923875, 0.922723, 0.921316, 0.919655, 0.917742, 0.915577, 0.913161, 
0.910497, 0.907586, 0.904429, 0.901028, 0.897386, 0.893504, 0.889386, 0.885032, 0.880447, 0.875633, 0.870593, 0.865329, 0.859845, 0.854144, 0.848231, 0.842107, 0.835777, 0.829245, 
0.822515, 0.815590, 0.808476, 0.801175, 0.793693, 0.786034, 0.778203, 0.770205, 0.762043, 0.753724, 0.745252, 0.736632, 0.727869, 0.718970, 0.709938, 0.700780, 0.691501, 0.682107, 
0.672603, 0.662995, 0.653289, 0.643490, 0.633605, 0.623640, 0.613600, 0.603492, 0.593321, 0.583094, 0.572817, 0.562496, 0.552138, 0.541748, 0.531333, 0.520899, 0.510453, 0.500000, 
0.489547, 0.479101, 0.468667, 0.458252, 0.447862, 0.437504, 0.427183, 0.416906, 0.406679, 0.396508, 0.386400, 0.376360, 0.366395, 0.356510, 0.346711, 0.337005, 0.327397, 0.317893, 
0.308499, 0.299220, 0.290062, 0.281030, 0.272131, 0.263368, 0.254748, 0.246276, 0.237957, 0.229795, 0.221797, 0.213966, 0.206307, 0.198825, 0.191524, 0.184410, 0.177485, 0.170755, 
0.164223, 0.157893, 0.151769, 0.145856, 0.140155, 0.134671, 0.129407, 0.124367, 0.119553, 0.114968, 0.110614, 0.106496, 0.102614, 0.098972, 0.095571, 0.092414, 0.089503, 0.086839, 
0.084423, 0.082258, 0.080345, 0.078684, 0.077277, 0.076125, 0.075228, 0.074587, 0.074202, 0.074074, };

const float audio_denoise_a4[AUDIO_DENOISE_FRAME_LEN] = { 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 
2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 
2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 
5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 
5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 
5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 
5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 
5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 
5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 
5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 
5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 
5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 5.000000, 2.000000, 
2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 
2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 
2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, 2.000000, };

// the size of in and out must be equal to SAMPLE_BUF_LEN
int audio_denoise_process(int16_t *in, int16_t *out)
{
    size_t n = 0;
    size_t k = 0;

    float cumsum_real = 0.0;
    float cumsum_imag = 0.0;
    float val;
    float spe_pre_dec = 0.0, smooth_factor = 0.0, smoothed_power = 0.0;

    if((in == NULL) || (out == NULL) || (denoise_handle == NULL)){return -1;}
    
    int frame_sz = AUDIO_DENOISE_FRAME_LEN;
    int hop_len = frame_sz / 2;

    const arm_cfft_instance_f32 *S = &arm_cfft_sR_f32_len256;
    float mean = 0, ave = 0;
    for (n = 0; n < hop_len; n++) { mean += in[n]; } ave = mean/hop_len; for (n = 0; n < hop_len; n++) { in[n] -= ave; }
    
    for (n = 0; n < hop_len; n++) {
        denoise_handle->fft1[denoise_handle->cnt_x + n][0] = *(denoise_handle->win_hanning + denoise_handle->cnt_x + n) * ((float)*(in + n));
        denoise_handle->fft1[denoise_handle->cnt_x + n][1] = 0;
    }
    if ((denoise_handle->cnt_x + hop_len) == frame_sz) { denoise_handle->cnt_x = 0; } else { denoise_handle->cnt_x += hop_len; }

    if (denoise_handle->cnt_y == -1)//first frame
    {
        for (k = 0; k < hop_len; k++) {
            (*(out + (k))) = (*(in + (k)));
        }
        denoise_handle->cnt_y = 0;
        return 1;
    }

    for (n = 0; n < hop_len; n++) {
        denoise_handle->fft2[denoise_handle->cnt_y + n][0] = (*(denoise_handle->win_hanning + denoise_handle->cnt_y + n)) * ((float)(*(in + n)));
        denoise_handle->fft2[denoise_handle->cnt_y + n][1] = 0;
    }
    if ((denoise_handle->cnt_y + hop_len) == frame_sz) { denoise_handle->cnt_y = 0; } else { denoise_handle->cnt_y += hop_len; }

    if (denoise_handle->cnt_x == 0)
    {
        arm_cfft_f32(S, (float*)(denoise_handle->fft1), 0, 1);
        for (k = 0; k < frame_sz; k++) {
            arm_atan2_f32(denoise_handle->fft1[k][1], denoise_handle->fft1[k][0], (denoise_handle->w_dft.phase + k));
        }
        arm_cmplx_mag_f32((const float*)(denoise_handle->fft1), denoise_handle->w_dft.mag, AUDIO_DENOISE_FRAME_LEN);

        for (k = 0; k < frame_sz; k++) {
            smoothed_power = denoise_handle->a1 * denoise_handle->smoothed_power[k] + (1 - denoise_handle->a1) * (*(denoise_handle->w_dft.mag + k));// ((*(denoise_handle->w_dft.mag + k)) * (*(denoise_handle->w_dft.mag + k)));
            denoise_handle->power_min[k] = (denoise_handle->power_min[k] < smoothed_power) ? denoise_handle->power_min[k] + ((1 - denoise_handle->a2) / (1 - denoise_handle->a3)) * (smoothed_power - denoise_handle->a3 * denoise_handle->smoothed_power[k]) : smoothed_power;
            spe_pre_dec = ((smoothed_power / denoise_handle->power_min[k]) > denoise_handle->a4[k]) ? 1 : 0;
            denoise_handle->spe_pre_pro = denoise_handle->a5 * denoise_handle->spe_pre_pro + (1 - denoise_handle->a5) * spe_pre_dec;
            smooth_factor = denoise_handle->a6 + (1 - denoise_handle->a6) * denoise_handle->spe_pre_pro;
            (*(denoise_handle->noise_estimated + (k))) = smooth_factor * (*(denoise_handle->noise_estimated + (k))) + (1 - smooth_factor) * (*(denoise_handle->w_dft.mag + k));// ((*(denoise_handle->w_dft.mag + k)) * (*(denoise_handle->w_dft.mag + k)));
            denoise_handle->smoothed_power[k] = smoothed_power;
        }

        for (k = 0; k < frame_sz; k++) {
            (*(denoise_handle->w_dft.mag + k)) -= (*(denoise_handle->noise_estimated + (k)));
            if ((*(denoise_handle->w_dft.mag + k)) < 0) {
                (*(denoise_handle->w_dft.mag + k)) = 0;
            }
        }

        for (k = 0; k < frame_sz; k++) {
            denoise_handle->fft1[k][0] = (*(denoise_handle->w_dft.mag + (k))) * (arm_cos_f32((*(denoise_handle->w_dft.phase + (k)))));
            denoise_handle->fft1[k][1] = (*(denoise_handle->w_dft.mag + (k))) * (arm_sin_f32((*(denoise_handle->w_dft.phase + (k)))));
        }

        arm_cfft_f32(S, (float*)(denoise_handle->fft1), 1, 1);
        for (k = 0; k < frame_sz; k++) {
            (*(denoise_handle->w1_idft.real + k)) = denoise_handle->fft1[k][0];// / frame_sz;
        }

        for (k = 0; k < hop_len; k++) {
            val = (*(denoise_handle->w1_idft.real + (k))) + (*(denoise_handle->w2_idft.real + (k + hop_len)));
            (*(out + (k))) = (val >= 0) ? (short)(val + 0.5) : (short)(val - 0.5);
        }

    }

    if (denoise_handle->cnt_y == 0)
    {

        arm_cfft_f32(S, (float*)(denoise_handle->fft2), 0, 1);

        for (k = 0; k < frame_sz; k++) {
            arm_atan2_f32(denoise_handle->fft2[k][1], denoise_handle->fft2[k][0], (denoise_handle->w_dft.phase + k));
        }
        arm_cmplx_mag_f32((const float*)(denoise_handle->fft2), denoise_handle->w_dft.mag, AUDIO_DENOISE_FRAME_LEN);

        for (k = 0; k < frame_sz; k++) {
            (*(denoise_handle->w_dft.mag + k)) -= (*(denoise_handle->noise_estimated + (k)));
            if ((*(denoise_handle->w_dft.mag + k)) < 0) {
                (*(denoise_handle->w_dft.mag + k)) = 0;
            }
        }

        for (k = 0; k < frame_sz; k++) {
            denoise_handle->fft2[k][0] = (*(denoise_handle->w_dft.mag + (k))) * (arm_cos_f32((*(denoise_handle->w_dft.phase + (k)))));
            denoise_handle->fft2[k][1] = (*(denoise_handle->w_dft.mag + (k))) * (arm_sin_f32((*(denoise_handle->w_dft.phase + (k)))));
        }

        arm_cfft_f32(S, (float*)(denoise_handle->fft2), 1, 1);
        for (k = 0; k < frame_sz; k++) {
            (*(denoise_handle->w2_idft.real + k)) = denoise_handle->fft2[k][0];// / frame_sz;
        }

        for (k = 0; k < hop_len; k++) {
            val = (*(denoise_handle->w1_idft.real + hop_len + (k))) + (*(denoise_handle->w2_idft.real + (k)));
            (*(out + (k))) = (val >= 0) ? (short)(val + 0.5) : (short)(val - 0.5);
        }

    }
    
    return 0;
}

void audio_denoise_upsample(int16_t* in, uint32_t in_len, int16_t* out, uint8_t upsample_factor)
{
    // the base sampling rate is 8000 due to ram and speed limitation
    // if upsample_factor == 2: the output sampling rate is 16000, and the size of out should be in_len * 2
    // this is the fastest way to upsample(lose quality to a certain limit)
    uint32_t out_len = in_len * upsample_factor;
    for (uint32_t i = 0; i < in_len; i++)
    {
        for (uint8_t j = upsample_factor; j > 0; j--)
        {
            out[out_len - i * 2 - j] = out[in_len - 1 - i];
        }
    }
}

// audio_denoise_a4 is provided at sample rate of 8k
// with 8k sample rate, fft frame window is 256 = 32ms, which is within the suggest time interval[20~40ms] for speech process 
int audio_denoise_init(uint32_t sample_rate)
{
    static uint8_t init_done = 0;
    int status = 0;
    
    if(init_done){return 0;}
    if(!sample_rate){return -1;}

    if (denoise_handle == NULL)
    {
      denoise_handle = ll_malloc(sizeof(audio_denoise_handle_s));
      if (denoise_handle == NULL)
      {
          return -1;
      }
    }

    memset(denoise_handle, 0x00, sizeof(audio_denoise_handle_s));

    denoise_handle->win_hanning = (const float*)&audio_denoise_hanning;

    denoise_handle->cnt_y = -1;
    denoise_handle->a1 = 0.7;
    denoise_handle->a2 = 0.998;
    denoise_handle->a3 = 0.8;
    denoise_handle->a5 = 0.2;
    denoise_handle->a6 = 0.85;
    denoise_handle->a4 = (float *)&audio_denoise_a4;
    init_done = 1;
    return status;
}

int audio_denoise_deinit(void)
{
    if (denoise_handle)
    {
      ll_free(denoise_handle);
    }
    return 0;
}

#endif

#ifdef __cplusplus
}
#endif
