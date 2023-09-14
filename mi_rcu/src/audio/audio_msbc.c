
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include "sbc.h"

#include "profile.h"
#include "audio_codec.h"

#if defined __cplusplus
    extern "C" {
#endif

//const uint8_t msbc_data[][60] = {
//#include "../../data/16k_16bit_msbc.m"
//};
//static int msbc_data_num = sizeof(msbc_data);
//static int msbc_data_frame_num = sizeof(msbc_data) / VOICE_BLE_SEND_BLOCK_SIZE;
//static int msbc_data_frame_index = 0;

// static uint8_t voice_data_header_seq[] = {0x08, 0x38, 0xC8, 0xF8};
// void print_hex_data(uint8_t *data, int data_len)
// {
//     int data_index;
//     static uint32_t seq_cnt = 0;

//     dbg_printf("    {0x%02x, 0x%02x, ", 0x01, voice_data_header_seq[seq_cnt % sizeof(voice_data_header_seq)]);
//     for (data_index = 0; data_index < data_len; data_index++) {
//         dbg_printf("0x%02x, ", data[data_index]);
//     }
//     dbg_printf("0x%02x},\r\n", 0x00);

//     seq_cnt++;
//     return;
// }


// static unsigned char output_data[60] = {0};
// void audio_msbc_encode_test(void)
// {
//     sbc_t sbc;
//     int codesize;
//     int input_data_frame_size;
//     int input_data_index;
//     ssize_t encode_input_len;
//     ssize_t encoded_output_len;
//     const unsigned char *input = NULL;
//     int ret;

//     dbg_printf("[>d:encode]: init\r\n");
//     ret = sbc_init_msbc(&sbc, 0);
//     dbg_printf("[>d:encode]: init ret %d\r\n", ret);
//     sbc.endian = SBC_BE;

//     dbg_printf("[>d:encode]: coded\r\n");
//     codesize = sbc_get_codesize(&sbc);
//     input_data_frame_size = sizeof(input_data) / codesize;s
//     for (input_data_index = 0; input_data_index < input_data_frame_ize; input_data_index++) {
//         input = &input_data[input_data_index][0];
//         encode_input_len = sbc_encode(&sbc,
//             input, codesize,
//             output_data, sizeof(output_data),
//             &encoded_output_len);
//         print_hex_data(output_data, encoded_output_len);
//     }
//     sbc_finish(&sbc);
//     while (1);
//     return;
// }

// codesize是240，相当于sbc_encode每次的输入是240字节的数据，编码后的数据大小保存在encoded，57个字节，编码后的数据形如：
// 0xad, 0x00, 0x00, 0x92, 0x54, 0x23, 0x22, 0x53, 0x7b, 0xb6,
// 0xdb, 0x5e, 0xed, 0xb6, 0xd7, 0xbb, 0x6d, 0xb5, 0xee, 0xdb,
// 0x6d, 0x7b, 0xb6, 0xdb, 0x5e, 0xed, 0xb6, 0xd7, 0xbb, 0x6d,
// 0xb5, 0xee, 0xdb, 0x6d, 0x7b, 0xb6, 0xdb, 0x5e, 0xed, 0xb6,
// 0xd8, 0x45, 0x6d, 0xb6, 0x54, 0xd9, 0x6d, 0xd1, 0x05, 0x5c,
// 0x3c, 0x41, 0xd7, 0x2d, 0x5a, 0xb6, 0x80
static sbc_t sbc = {0};
static int codesize = 0;
static f_audio_codec_output_fun msbc_output_fun = NULL;
static uint8_t msbc_output_data[MSBC_FRAME_OUTPUT_LEN] = {0};
static void audio_msbc_encoded(uint8_t *data, int data_len)
{
    ssize_t encode_input_len;
    ssize_t encoded_output_len;

    if (data_len != codesize) {
        return;
    }

    encode_input_len = sbc_encode(&sbc,
        data, data_len,
        msbc_output_data, sizeof(msbc_output_data),
        &encoded_output_len);

    if (encode_input_len != SAMPLE_BUF_8BIT_LEN) {
        return;
    }

    if (encoded_output_len != MSBC_FRAME_OUTPUT_LEN) {
        return;
    }

    msbc_output_fun(msbc_output_data, encoded_output_len);
    return;
}

int audio_encode_init(f_audio_codec_input_fun *input_fun, f_audio_codec_output_fun output_fun)
{
    int ret;

    dbg_printf("[>d:encode]: init\r\n");
    ret = sbc_init_msbc(&sbc, 0);
    if (ret != 0) {
        dbg_printf("[>d:encode]: init ret %d\r\n", ret);
        return ret;
    }
    sbc.endian = SBC_BE;

    codesize = sbc_get_codesize(&sbc);

    *input_fun = audio_msbc_encoded;
    msbc_output_fun = output_fun;

    return ret;
}

void audio_encode_finish(void)
{
    sbc_finish(&sbc);
}

#if defined __cplusplus
    }
#endif
