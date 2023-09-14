
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include <string.h>
#include "ingsoc.h"
#include "profile.h"
#include "./audio/audio_service.h"
#include "cmd_uart.h"
#include "main.h"

#if defined __cplusplus
    extern "C" {
#endif

static void cmd_test(char data)
{
    return;
}

static void uart_audio_trigger_send(void)
{
    static int cnt = 0;
}

static uint8_t voice_is_sampling = 0;
static void voice_sample_start(void)
{
    voice_is_sampling = 1;
    audio_start(uart_audio_trigger_send);
    return;
}

static void voice_sample_stop(void)
{
    voice_is_sampling = 0;
    audio_stop_sample();
    return;
}

static void cmd_sample_data(char data)
{
    if (data == '1') {
        log_printf("[log]: stop\n");
        stop_log();
        voice_sample_start();
    } else {
        voice_sample_stop();
    }
    return;
}

//AT+SAMPLE=1
#define CMD_LENGTH 7
static void bt_cmd_data_uart_rx_data_fun(char data)
{
    static int rx_state = 0;
    static uint8_t cmd_buf[CMD_LENGTH];
    static uint8_t cmd_buf_cnt = 0;

    switch (rx_state)
    {
    case 0:
        if (data == 'A') {
            rx_state = 1;
        } else {
            rx_state = 0;
        }
    break;
    
    case 1:
        if (data == 'T') {
            rx_state = 2;
        } else if (data == 'A') {
            rx_state = 1;
        } else {
            rx_state = 0;
        }
    break;
    
    case 2:
        if (data == '+') {
            rx_state = 3;
            cmd_buf_cnt = 0;
        } else {
            rx_state = 0;
        }
    break;
    
    case 3: // rx cmd
        cmd_buf[cmd_buf_cnt] = data;
        cmd_buf_cnt++;
        if (cmd_buf_cnt >= CMD_LENGTH) {
            rx_state = 4;
        }
    break;
    
    case 4: // rx para
        if (memcmp("TESTTT=", cmd_buf, CMD_LENGTH) == 0) {
            cmd_test(data);
        } else if (memcmp("SAMPLE=", cmd_buf, CMD_LENGTH) == 0) {
            cmd_sample_data(data);
        } else {
        }
        rx_state = 0;
    break;
    
    default:
        rx_state = 0;
    break;
        
    }

    return;
}

static void bt_cmd_data_uart_handle_task_recv_data(void)
{
    while (apUART_Check_RXFIFO_EMPTY(APB_UART0) != 1) {
        char c = APB_UART0->DataRead;
        bt_cmd_data_uart_rx_data_fun(c);
    }
    return;
}

uint32_t bt_cmd_data_uart_isr(void *user_data)
{
    uint32_t status;

    while(1)
    {
        status = apUART_Get_all_raw_int_stat(APB_UART0);
        if (status == 0)
            break;

        APB_UART0->IntClear = status;

        // rx int
        if (status & (1 << bsUART_RECEIVE_INTENAB))
        {
            bt_cmd_data_uart_handle_task_recv_data();
        }
    }
    return 0;
}

// {0x00, 0xff, 0xaa, 0x55, 0x00, 0x11, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x00, 0x88};
char cmd_uart_send_data_buf[] = {0x00, 0xff, 0xaa, 0x55};
uint8_t cmd_uart_send_data(int16_t *data, int16_t data_len)
{
    int index;
    char *p_data = NULL;
    char send_data;
    uint16_t data_sum = 0;

    if (voice_is_sampling) {
        
        p_data = cmd_uart_send_data_buf;
        for (index = 0; index < sizeof(cmd_uart_send_data_buf); index++) {
            cb_putc(p_data, 0);
            p_data++;
        }
        
        send_data = (((data_len * 2) >> 8) & 0xFF);
        cb_putc(&send_data, 0);
        send_data = ((data_len * 2) & 0xFF);
        cb_putc(&send_data, 0);
        
        for (index = 0; index < data_len; index++) {
            send_data = (data[index] & 0xFF);
            cb_putc(&send_data, 0);
            data_sum+= send_data;
            
            send_data = ((data[index] >> 8) & 0xFF);
            cb_putc(&send_data, 0);
            data_sum+= send_data;
        }
        
        send_data = ((data_sum >> 8) & 0xFF);
        cb_putc(&send_data, 0);
        send_data = (data_sum & 0xFF);
        cb_putc(&send_data, 0);
        return 1;
    } else {
        return 0;
    }
}

#if defined __cplusplus
    }
#endif

