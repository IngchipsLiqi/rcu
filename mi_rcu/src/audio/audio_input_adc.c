

#include "ingsoc.h"
#include "platform_api.h"
#include "FreeRTOS.h"
#include "semphr.h"
#include <stdio.h>

//#include "audio.h"
//#include "audio_sbc.h"
#include "profile.h"
//#include "audio_denoise.h"

extern void audio_rx_sample(int16_t sample);

#include "pingpong.h"

#define ADC_CHANNEL           ADC_CH_0
#define DMA_CHANNEL           0
#define ADC_CLK_MHZ           6
#define LOOP_DELAY(c, s)      ((((c) * (1000000)) / (s)) - (21))

static DMA_PingPong_t PingPong;

uint16_t filter(uint16_t data)
{
    uint16_t results;
    if((data&0x3f)<48){
        results = (64*(data/64)) + ((4*(data&0x3f))/3);
        return results;
    } else {
        results = (64*(data/64)) + 64;
        return results;
    }
}


//const pcm_sample_t sim_pcm[] =
//#include "../../data/itu_female_16k.m"
//;
uint16_t audio_input_temp_cnt = 0;
#define MULTI_SAMPLE_NUM 3
#define ADC_RAW_DATA_AMPLIFY 0
static uint16_t pcm_index = 0;
static uint32_t DMA_cb_isr(void *user_data)
{
    static uint16_t multi_sample_sum = 0;
    static uint8_t multi_sample_cnt = 0;
    uint32_t state = DMA_GetChannelIntState(DMA_CHANNEL);
    DMA_ClearChannelIntState(DMA_CHANNEL, state);

    uint32_t *buff = DMA_PingPongIntProc(&PingPong, DMA_CHANNEL);
    uint32_t tranSize = DMA_PingPongGetTransSize(&PingPong);
    for (uint32_t i = 0; i < tranSize; ++i) {
        if (ADC_GetDataChannel(buff[i]) != ADC_CHANNEL) continue;
        //uint16_t sample = (ADC_GetData(buff[i]) << 2);
        uint16_t sample = ADC_GetData(buff[i]);

        //there is a very large spike at the begining
        if (++audio_input_temp_cnt < 800) { continue; }
        multi_sample_sum += sample;
        multi_sample_cnt++;
        if (multi_sample_cnt >= MULTI_SAMPLE_NUM) {
            sample = multi_sample_sum / MULTI_SAMPLE_NUM;
            sample = (sample << ADC_RAW_DATA_AMPLIFY);





            audio_rx_sample((uint16_t)(sample - (0x2000 << ADC_RAW_DATA_AMPLIFY)));


//            if (pcm_index >= (sizeof(sim_pcm) / sizeof(sim_pcm[0]))) {
//                pcm_index = 0;
//            }
//
//            sample = sim_pcm[pcm_index];
//            audio_rx_sample(sample);
//            pcm_index++;





            multi_sample_sum = 0;
            multi_sample_cnt = 0;
        }
    }
    return 0;
}

uint16_t g_sample_rate = 8000;
#define AUDIO_ADC_SAMPLE_MODE    DIFFERENTAIL_MODE
//#define AUDIO_ADC_SAMPLE_MODE    SINGLE_END_MODE
void audio_adc_input_setup(void)
{
    log_printf("[>i:audio] input setup\n");
    SYSCTRL_ClearClkGateMulti((1 << SYSCTRL_ITEM_APB_DMA));

    SYSCTRL_ClearClkGate(SYSCTRL_ITEM_APB_ADC);
    SYSCTRL_SetAdcClkDiv(24 / ADC_CLK_MHZ);
    SYSCTRL_ReleaseBlock(SYSCTRL_ITEM_APB_ADC);
    ADC_Reset();
    ADC_ftInit();
    ADC_Calibration(AUDIO_ADC_SAMPLE_MODE);
    ADC_ConvCfg(CONTINUES_MODE, PGA_PARA_5, 1, ADC_CHANNEL, 0, 8,
                AUDIO_ADC_SAMPLE_MODE, LOOP_DELAY(ADC_CLK_MHZ, (g_sample_rate * MULTI_SAMPLE_NUM)));

    SYSCTRL_SelectUsedDmaItems(1 << 9);
    DMA_PingPongSetup(&PingPong, SYSCTRL_DMA_ADC, 80, 8);
    platform_set_irq_callback(PLATFORM_CB_IRQ_DMA, DMA_cb_isr, 0);
}
void audio_adc_input_start(void)
{
    log_printf("[>i:audio] input start\n");
    //audio_denoise_init(g_sample_rate);
    DMA_PingPongEnable(&PingPong, DMA_CHANNEL);
    ADC_Start(1);
    audio_input_temp_cnt = 0;
}

void audio_adc_input_stop(void)
{
    log_printf("[>i:audio] input stop\n");
    ADC_Start(0);
    DMA_PingPongDisable(&PingPong, DMA_CHANNEL);
}
