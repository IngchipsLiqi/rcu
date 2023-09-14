
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "audio_service.h"
//#include "audio.h"
//#include "audio_sbc.h"
#include "ingsoc.h"

#include "FreeRTOS.h"
#include "semphr.h"
#include "queue.h"

#include "platform_api.h"
#include "audio_input.h"
#include "profile.h"
#include "audio_codec.h"
#include "audio_denoise.h"

//#include "audio_denoise.h"
//#include "audio_encoder.h"

uint16_t seq_cnt;
//adpcm_enc_t enc;
//audio_encoder_t aud_enc_t;
void *enc = NULL;

static uint8_t send_data_buffer[VOICE_BUF_BLOCK_NUM][VOICE_BLE_SEND_BLOCK_SIZE] = {0};
static uint16_t send_data_frame_index;

static uint16_t sample_buf[SAMPLE_BUF_CNT][SAMPLE_BUF_16BIT_LEN];
static int sample_buf_index = 0;
static int sample_index = 0;

static f_audio_data_porcess_callback audio_data_porcess_callback = NULL;

static uint8_t voice_data_header_seq[] = {0x08, 0x38, 0xC8, 0xF8};
static void enc_output_cb_fun(uint8_t *data, int data_len)
{
    uint16_t index = send_data_frame_index % VOICE_BUF_BLOCK_NUM;
    dbg_printf("[>d:audio]: encode %d\r\n", data_len);
    if (data_len != MSBC_FRAME_OUTPUT_LEN) {
        return;
    }
    send_data_buffer[index][0] = 0x01;
    send_data_buffer[index][1] = voice_data_header_seq[seq_cnt % sizeof(voice_data_header_seq)];
    memcpy(&send_data_buffer[index][2], data, MSBC_FRAME_OUTPUT_LEN);
    send_data_buffer[index][VOICE_BLE_SEND_BLOCK_SIZE - 1] = 0x00;

    audio_data_porcess_callback();
    log_printf("[>i:audio]: enc:[%d]\n", send_data_frame_index);
    send_data_frame_index++;
    seq_cnt++;

    return;
}

#define QUEUE_LENGTH    (SAMPLE_BUF_CNT + 1)
#define ITEM_SIZE       sizeof(int16_t)
static StaticQueue_t xStaticSampleQueue;
static uint8_t ucQueueStorageArea[ITEM_SIZE * QUEUE_LENGTH];
static QueueHandle_t xSampleQueue;

static void audio_input_setup(void)
{
    audio_adc_input_setup();
    return;
}

static void audio_input_start(void)
{
    audio_adc_input_start();
    return;
}

static void mic_power_open(void)
{
    GIO_WriteValue(MIC_POWER_PIN, 1);
    return;
}

static f_audio_codec_input_fun enc_input_fun = NULL;
void audio_start(f_audio_data_porcess_callback call_back)
{
    if (call_back == NULL) {
        return;
    }

    audio_data_porcess_callback = call_back;

    mic_power_open();

    audio_input_setup();

    audio_input_start();

    sample_buf_index = 0;
    sample_index = 0;
    send_data_frame_index = 0;
    seq_cnt = 0;
}

static void audio_input_stop(void)
{
    audio_adc_input_stop();
    return;
}

static void mic_power_down(void)
{
    GIO_WriteValue(MIC_POWER_PIN, 0);
    return;
}

void audio_stop_sample(void)
{
    //xQueueReset(xSampleQueue);
    audio_input_stop();

    mic_power_down();
    //audio_encode_finish();

    sample_buf_index = 0;
    sample_index = 0;
    send_data_frame_index = 0;
    seq_cnt = 0;
}

static uint8_t outp[512] = {0};
static void audio_task(void *pdata)
{
    int input_size, output_size;

    //audio_adc_agc_denoise_coded_test(); // AUDIO_TEST

    uint16_t *buf;
    for (;;) {
        int16_t index;
        int i;

        if (xQueueReceive(xSampleQueue, &index, portMAX_DELAY ) != pdPASS) {
            continue;
        }

        dbg_printf("[>d:frame]: %d\n", index);
        buf = sample_buf[index];

        // print_data(buf, 20); // AUDIO_TEST
        // continue;

        // if(audio_denoise_process(buf, buf)) {continue;} // AUDIO_TEST

        enc_input_fun((uint8_t *)buf, SAMPLE_BUF_8BIT_LEN);
    }
}

void audio_create_queue_task(void)
{
    xSampleQueue = xQueueCreateStatic(QUEUE_LENGTH,
                                 ITEM_SIZE,
                                 ucQueueStorageArea,
                                 &xStaticSampleQueue);
    xTaskCreate(audio_task,
               "b",
               600,
               NULL,
               (configMAX_PRIORITIES - 1),
               NULL);

    if (audio_encode_init(&enc_input_fun, enc_output_cb_fun) != 0) {
        log_printf("[>i:audio]: codec init error\r\n");
        return;
    } else {
        log_printf("[>i:audio]: codec init ok\r\n");
    }
}

uint16_t audio_get_curr_block(void)
{
    return send_data_frame_index;
}

uint8_t *audio_get_block_buff(uint16_t index)
{
    return send_data_buffer[index % VOICE_BUF_BLOCK_NUM];
}

#define CNT_NK 16000
void audio_rx_sample(int16_t sample)
{
    static uint32_t sample_cnt = 0;
    BaseType_t xHigherPriorityTaskWoke = pdFALSE;

    if (sample_cnt % CNT_NK == 0) {
        log_printf("[>i:audio]: rx %d NK\r\n", sample_cnt / CNT_NK);
    }
    sample_cnt++;

    sample_buf[sample_buf_index][sample_index] = sample;
    sample_index++;
    if (sample_index >= SAMPLE_BUF_16BIT_LEN) {
        log_printf("[>i:audio]: sample:[%d]\r\n", sample_buf_index);
        xQueueSendFromISR(xSampleQueue, &sample_buf_index, &xHigherPriorityTaskWoke);

        sample_buf_index++;
        if (sample_buf_index >= SAMPLE_BUF_CNT) {
            sample_buf_index = 0;
        }

        sample_index = 0;
    }
}
