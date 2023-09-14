
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __MI_RCU_SERVICE_H__
#define __MI_RCU_SERVICE_H__

#include "stdint.h"
#include "bluetooth.h"
#include "btstack_event.h"

#if defined __cplusplus
    extern "C" {
#endif

void mi_rcu_service_init(void);
void mi_rcu_user_msg_handler(uint32_t msg_id, void *data, uint16_t size);
void mi_rcu_event_connected(const le_meta_event_enh_create_conn_complete_t *cmpl);
void mi_rcu_event_disconnect(const event_disconn_complete_t *cmpl);

int16_t mi_rcu_att_read_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t offset,
                                  uint8_t *buffer, uint16_t buffer_size);
int16_t mi_rcu_att_write_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t transaction_mode,
                              uint16_t offset, const uint8_t *buffer, uint16_t buffer_size);

void mi_rcu_send_data(void);
void mi_rcu_set_power_on_adv_data(void);

#if defined __cplusplus
    }
#endif

#endif
