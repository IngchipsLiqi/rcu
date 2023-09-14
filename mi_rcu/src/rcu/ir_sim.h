
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __IR_SIM_H__
#define __IR_SIM_H__

#include <stdio.h>
#include <string.h>

#include "peripheral_dma.h"

#if defined __cplusplus
    extern "C" {
#endif

void ir_setup_tx(const GIO_Index_t io_index);
void ir_setup_rx(const GIO_Index_t io_index);
void ir_task_init(void);

#if defined __cplusplus
    }
#endif

#endif

