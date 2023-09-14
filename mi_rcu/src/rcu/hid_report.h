
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __HID_REPORT_H__
#define __HID_REPORT_H__

#include "stdint.h"
#include "bluetooth.h"
#include "btstack_event.h"

#if defined __cplusplus
    extern "C" {
#endif

#define INPUT_REPORT_KEYS_MAX   6
#define INVALID_HANDLE  (0xffff)

#pragma pack (push, 1)
typedef struct kb_report
{
    uint8_t modifier;
    uint8_t reserved;
    uint8_t codes[INPUT_REPORT_KEYS_MAX];
} kb_report_t;
#pragma pack (pop)

#pragma pack (push, 1)
typedef struct GOOGLE_kb_report
{
    uint8_t codes[INPUT_REPORT_KEYS_MAX];
} GOOGLE_kb_report_t;
#pragma pack (pop)

extern uint16_t g_att_notify_hid_google_report;

void hid_service_init(void);
void hid_user_msg_handler(uint32_t msg_id, void *data, uint16_t size);
int16_t hid_att_write_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t transaction_mode,
                              uint16_t offset, const uint8_t *buffer, uint16_t buffer_size);
int16_t hid_att_read_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t offset,
                                  uint8_t *buffer, uint16_t buffer_size);
void hid_event_connected(const le_meta_event_enh_create_conn_complete_t *cmpl);
void hid_event_disconnect(const event_disconn_complete_t *cmpl);

#if defined __cplusplus
    }
#endif

#endif

