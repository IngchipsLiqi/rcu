
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include <stdio.h>
#include <string.h>

#include "ingsoc.h"
#include "platform_api.h"
#include "hid_report.h"
#include "profile.h"

#include "bluetooth.h"
#include "audio_google_service.h"
#include "att_db.h"
#include "att_db_util.h"
#include "btstack_event.h"
#include "main.h"

#if defined __cplusplus
    extern "C" {
#endif

#define GATT_CLIENT_CHARACTERISTICS_DESC_REPORT_REF     0x2908

kb_report_t report =
{
    .modifier = 0,
    .reserved = 0,
    .codes = {0}
};

GOOGLE_kb_report_t GOOGLE_report =
{
    .codes = {0}
};

static const uint8_t KB_REPORT_MAP[] =
{
    //keyboard report in
    0x05, 0x01,     // Usage Pg (Generic Desktop)
    0x09, 0x06,     // Usage (Keyboard)
    0xA1, 0x01,     // Collection: (Application)
    0x85, 0x01,     // Report Id (keyboard)

    0x05, 0x07,     // Usage Pg (Key Codes)
    0x19, 0xE0,     // Usage Min (224)  VK_CTRL:0xe0
    0x29, 0xE7,     // Usage Max (231)  VK_RWIN:0xe7
    0x15, 0x00,     // Log Min (0)
    0x25, 0x01,     // Log Max (1)

                  // Modifier byte
    0x75, 0x01,     // Report Size (1)   1 bit * 8
    0x95, 0x08,     // Report Count (8)
    0x81, 0x02,     // Input: (Data, Variable, Absolute)
                  //
                  // Reserved byte
    0x95, 0x01,     // Report Count (1)
    0x75, 0x08,     // Report Size (8)
    0x81, 0x01,     // Input: (static constant)

    //keyboard output
    //5 bit led ctrl: NumLock CapsLock ScrollLock Compose kana
    0x95, 0x05,    //Report Count (5)
    0x75, 0x01,    //Report Size (1)
    0x05, 0x08,    //Usage Pg (LEDs )
    0x19, 0x01,    //Usage Min
    0x29, 0x05,    //Usage Max
    0x91, 0x02,    //Output (Data, Variable, Absolute)
    //3 bit reserved
    0x95, 0x01,    //Report Count (1)
    0x75, 0x03,    //Report Size (3)
    0x91, 0x01,    //Output (static constant)

    // Key arrays (6 bytes)
    0x95, 0x06,     // Report Count (6)
    0x75, 0x08,     // Report Size (8)
    0x15, 0x1e,     // Log Min (0)
    0x25, 0xF1,     // Log Max (241)
    0x05, 0x07,     // Usage Pg (Key Codes)
    0x19, 0x1e,     // Usage Min (0)
    0x29, 0xf1,     // Usage Max (241)
    0x81, 0x00,     // Input: (Data, Array)

    0xC0,            // End Collection

    //consumer report in
    0x05, 0x0C,   // Usage Page (Consumer)
    0x09, 0x01,   // Usage (Consumer Control)
    0xA1, 0x01,   // Collection (Application)
    0x85, 2,   //     Report Id
    0x75,0x10,     //global, report size 16 bits
    0x95,0x02,     //global, report count 2
    0x15,0x01,     //global, min  0x01
    0x26,0x8c,0x02,  //global, max  0x28c
    0x19,0x01,     //local, min   0x01
    0x2a,0x8c,0x02,  //local, max    0x28c
    0x81,0x00,     //main,  input data variable, absolute
    0xc0,        //main, end collection
};

#pragma pack (push, 1)
typedef struct
{
    uint8_t report_id;
    uint8_t report_type;
} report_ref_t;

typedef struct
{
    uint16_t bcd_hid;
    uint8_t  b_country_code;
    uint8_t  flags;
} hid_info_t;
#pragma pack (pop)

hid_info_t hid_info =
{
    .bcd_hid = 0x0111,
    .b_country_code = 0,
    .flags = 0x1        // The device is normally connectable
};

#define REPORT_TYPE_INPUT               1
#define REPORT_TYPE_OUTPUT              2
#define REPORT_TYPE_FEATURE             3

static const uint8_t reportRefKeyIn[2] =
             { 1, 2 };

// Key out Report characteristic variables
static const uint8_t reportRefKeyOut[2] =
             { 2, 1 };

// Consumer Control input Report
static const uint8_t reportRefConsumerControlIn[2] =
             { 1, 1 };
static uint16_t extServiceUUID;
static uint8_t bootKeyInReport;
static uint8_t bootKeyOutReport;

static uint16_t att_handle_protocol_mode;
static uint16_t att_handle_hid_ctrl_point;
static uint16_t att_handle_report;
static uint16_t att_handle_boot_kb_input_report;
static uint16_t att_handle_boot_kb_output_report;

uint16_t g_att_notify_hid_google_report = 0;

enum
{
    HID_PROTO_BOOT,
    HID_PROTO_REPORT
};
uint8_t protocol_mode = HID_PROTO_REPORT;

enum
{
    HID_CTRL_SUSPEND,
    HID_CTRL_EXIT_SUSPEND
};
uint8_t suspended = 0;

static uint16_t hid_att_handle_notify = 0;
static hci_con_handle_t hid_con_handle = INVALID_HANDLE;

void kb_send_report(void)
{
    if (protocol_mode != HID_PROTO_REPORT) {
        return;
    }

    if (hid_con_handle == INVALID_HANDLE) {
        return;
    }
    if (0 == hid_att_handle_notify) {
        return;
    }
    log_printf("[hid]: 1:%02X-%02X-%02X\n", report.codes[0], report.codes[1], report.codes[2]);
    att_server_notify(hid_con_handle, hid_att_handle_notify, (uint8_t*)&report, sizeof(report));
}
void GOOGLE_kb_send_report(void)
{
    if (protocol_mode != HID_PROTO_REPORT) {
        return;
    }

    if (hid_con_handle == INVALID_HANDLE) {
        return;
    }
    if (0 == hid_att_handle_notify) {
        return;
    }
    log_printf("[hid]: 2:%02X-%02X-%02X\n", report.codes[0], report.codes[1], report.codes[2]);
    att_server_notify(hid_con_handle, g_att_notify_hid_google_report, (uint8_t*)&GOOGLE_report, sizeof(GOOGLE_report));
}
void KB_StateReport(uint16_t key_state)
{
    btstack_push_user_msg(USER_MSG_ID_INPUT_HW_KEYS, NULL, key_state);
}

void hid_user_msg_handler(uint32_t msg_id, void *data, uint16_t size)
{
    switch (msg_id) {
    case USER_MSG_ID_GOOGLE_KEY_REPORT:
        GOOGLE_report.codes[0] = size;
        GOOGLE_report.codes[1] = size >> 8;
        GOOGLE_kb_send_report();
//#if FEATURE_SUPPORT_RESEND_KEY_RECONNECT
//        if(key_value_to_be_send.write_idx != key_value_to_be_send.read_idx){
//            xTimerStart(resendkeyvaluetimer, portMAX_DELAY);
//        }
//#endif
        break;
    case USER_MSG_ID_INPUT_HW_KEYS:
        report.modifier = 0;
        report.codes[0] = size;
        report.codes[1] = size >> 8;
        kb_send_report();

//#if FEATURE_SUPPORT_RESEND_KEY_RECONNECT
//        if(key_value_to_be_send.write_idx != key_value_to_be_send.read_idx){
//            xTimerStart(resendkeyvaluetimer, portMAX_DELAY);
//        }
//#endif
        break;
    }
    return;
}

int16_t hid_att_read_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t offset,
                                  uint8_t *buffer, uint16_t buffer_size)
{
    if (att_handle == att_handle_protocol_mode) {
        if (buffer) {
            *buffer = protocol_mode;
        }
        return sizeof(protocol_mode);
    } else {
        return -1;
    }
}

static void set_led_state(const uint8_t state)
{
    return;
}

int16_t hid_att_write_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t transaction_mode,
                              uint16_t offset, const uint8_t *buffer, uint16_t buffer_size)
{
    if (att_handle == att_handle_protocol_mode) {
        protocol_mode = *buffer;
        return 0;
    } else if (att_handle == att_handle_hid_ctrl_point) {
        if (*buffer == HID_CTRL_SUSPEND)
            suspended = 1;
        else if (*buffer == HID_CTRL_EXIT_SUSPEND)
            suspended = 0;
        return 0;
    } else if ((att_handle == att_handle_boot_kb_output_report) || (att_handle == att_handle_report)) {
        set_led_state(*buffer);
        return 0;
    } else if (att_handle == att_handle_report + 1) {
        if (*(uint16_t *)buffer == GATT_CLIENT_CHARACTERISTICS_CONFIGURATION_NOTIFICATION) {
            hid_att_handle_notify = att_handle_report;
        }
        return 0;
    } else if (att_handle == att_handle_boot_kb_input_report) {
        return 0;
    } else {
        return -1;
    }
}

void hid_service_init(void)
{
    // Service Human Interface Device: 1812
    att_db_util_add_service_uuid16(0x1812);

    // Characteristic Protocol Mode: 2A4E
    att_handle_protocol_mode = att_db_util_add_characteristic_uuid16(0x2A4E,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE_WITHOUT_RESPONSE | ATT_PROPERTY_DYNAMIC, &protocol_mode, sizeof(protocol_mode));

    // Characteristic Boot Keyboard Input Report: 2A22
    att_handle_boot_kb_input_report = att_db_util_add_characteristic_uuid16(0x2A22, ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY,
        (uint8_t *) &bootKeyInReport, sizeof(bootKeyInReport));
    // Characteristic Boot Keyboard Output Report: 2A32
    att_handle_boot_kb_output_report = att_db_util_add_characteristic_uuid16(0x2A32, ATT_PROPERTY_READ | ATT_PROPERTY_WRITE
        | ATT_PROPERTY_WRITE_WITHOUT_RESPONSE, (uint8_t *)&bootKeyOutReport, sizeof(bootKeyOutReport));

    // Characteristic Report: 2A4D
    g_att_notify_hid_google_report = att_db_util_add_characteristic_uuid16(0x2A4D, ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_AUTHENTICATION_REQUIRED,
        (uint8_t *)&report, sizeof(report));
    att_db_util_add_descriptor_uuid16(GATT_CLIENT_CHARACTERISTICS_DESC_REPORT_REF, ATT_PROPERTY_READ,
        (uint8_t *)&reportRefKeyOut, sizeof(reportRefKeyOut));
    att_handle_report = att_db_util_add_characteristic_uuid16(0x2A4D, ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_AUTHENTICATION_REQUIRED,
        (uint8_t *)&report, sizeof(report));
    att_db_util_add_descriptor_uuid16(GATT_CLIENT_CHARACTERISTICS_DESC_REPORT_REF, ATT_PROPERTY_READ ,
        (uint8_t *)&reportRefConsumerControlIn, sizeof(reportRefConsumerControlIn));
    att_db_util_add_characteristic_uuid16(0x2A4D, ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_WRITE_WITHOUT_RESPONSE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&report, sizeof(report));
    att_db_util_add_descriptor_uuid16(GATT_CLIENT_CHARACTERISTICS_DESC_REPORT_REF, ATT_PROPERTY_READ ,
        (uint8_t *)&reportRefKeyIn, sizeof(reportRefKeyIn));

    // Characteristic Report Map: 2A4B
    att_db_util_add_characteristic_uuid16(0x2A4B, ATT_PROPERTY_READ, (uint8_t *)KB_REPORT_MAP, sizeof(KB_REPORT_MAP));
    att_db_util_add_descriptor_uuid16(0x2907, ATT_PROPERTY_READ | ATT_PROPERTY_WRITE, (uint8_t *)&extServiceUUID, sizeof(extServiceUUID));

    // Characteristic HID Information: 2A4A
    att_db_util_add_characteristic_uuid16(0x2A4A, ATT_PROPERTY_READ, (uint8_t *)&hid_info, sizeof(hid_info));

    // Characteristic HID Control Point: 2A4C
    att_handle_hid_ctrl_point = att_handle_protocol_mode = att_db_util_add_characteristic_uuid16(0x2A4C, ATT_PROPERTY_WRITE_WITHOUT_RESPONSE,
        NULL, 0);
    log_printf("[hid]: handle boot:%d %d report:%d\n",
        att_handle_boot_kb_input_report, g_att_notify_hid_google_report, att_handle_report);
    return;
}

void hid_event_connected(const le_meta_event_enh_create_conn_complete_t *cmpl)
{
    hid_con_handle = cmpl->handle;
    hid_att_handle_notify = att_handle_report;
    return;
}

void hid_event_disconnect(const event_disconn_complete_t *cmpl)
{
    hid_con_handle = INVALID_HANDLE;
    hid_att_handle_notify = 0;
    return;
}

#if defined __cplusplus
    }
#endif

