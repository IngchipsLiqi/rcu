
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __CMD_UART_H__
#define __CMD_UART_H__

#include <stdint.h>

#if defined __cplusplus
    extern "C" {
#endif

uint32_t bt_cmd_data_uart_isr(void *user_data);
uint8_t cmd_uart_send_data(int16_t *data, int16_t data_len);

#if defined __cplusplus
    }
#endif

#endif

