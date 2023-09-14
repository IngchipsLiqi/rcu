
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include "stdint.h"
#include "string.h"

#include "att_db.h"
#include "att_db_util.h"
#include "bluetooth.h"
#include "btstack_event.h"
#include "gatt_client.h"
#include "btstack_defines.h"
#include "sig_uuid.h"
#include "att_dispatch.h"

#include "platform_api.h"

#include "mi_rcu_key.h"
#include "profile.h"
#include "USBHID_Types.h"
#include "audio/audio_service.h"
#include "low_power.h"
#include "sdk_private_flash_data.h"

#if defined __cplusplus
    extern "C" {
#endif

//const static uint8_t mi_rcu_service_uuid128[16] =           {0x00,0x00,0xFF,0xE0,0x00,0x00,0x10,0x00,0x80,0x00,0x00,0x80,0x5f,0x9b,0x34,0xfb};
//const static uint8_t mi_rcu_char_write_notify_uuid128[16] = {0x00,0x00,0xFF,0xE1,0x00,0x00,0x10,0x00,0x80,0x00,0x00,0x80,0x5f,0x9b,0x34,0xfb};
//const static uint8_t mi_rcu_char_io_uuid128[16] =           {0x00,0x00,0xFF,0xE2,0x00,0x00,0x10,0x00,0x80,0x00,0x00,0x80,0x5f,0x9b,0x34,0xfb};
//const static uint8_t mi_rcu_char_info_uuid128[16] =         {0x00,0x00,0xFF,0xE3,0x00,0x00,0x10,0x00,0x80,0x00,0x00,0x80,0x5f,0x9b,0x34,0xfb};

const static uint8_t mi_rcu_service_uuid128[16] =                 {0x6E,0x40,0xFF,0x01,0xB5,0xA3,0xF3,0x93,0xE0,0xA9,0xE5,0x0E,0x24,0xDC,0xCA,0x9E};
const static uint8_t mi_rcu_char_write_no_resp_uuid128[16] =      {0x6E,0x40,0xFF,0x02,0xB5,0xA3,0xF3,0x93,0xE0,0xA9,0xE5,0x0E,0x24,0xDC,0xCA,0x9E};
const static uint8_t mi_rcu_char_notify_uuid128[16] =             {0x6E,0x40,0xFF,0x03,0xB5,0xA3,0xF3,0x93,0xE0,0xA9,0xE5,0x0E,0x24,0xDC,0xCA,0x9E};
const static uint8_t mi_rcu_char_write_uuid128[16] =              {0x6E,0x40,0xFF,0x04,0xB5,0xA3,0xF3,0x93,0xE0,0xA9,0xE5,0x0E,0x24,0xDC,0xCA,0x9E};

const static uint8_t mi_rcu_char_dfu_control_point_uuid128[16] =  {0x8E,0xC9,0x00,0x01,0xF3,0x15,0x4F,0x60,0x9F,0xB8,0x83,0x88,0x30,0xDA,0xEA,0x50};
const static uint8_t mi_rcu_char_dfu_packet_uuid128[16] =         {0x8E,0xC9,0x00,0x02,0xF3,0x15,0x4F,0x60,0x9F,0xB8,0x83,0x88,0x30,0xDA,0xEA,0x50};

#pragma pack (push, 1)

typedef struct
{
    uint8_t report_id;
    uint8_t report_type;
} mi_rcu_report_ref_t;

typedef struct
{
    uint16_t bcd_hid;
    uint8_t  b_country_code;
    uint8_t  flags;
} mi_rcu_hid_info_t;

#pragma pack (pop)

static mi_rcu_hid_info_t mi_rcu_hid_info =
{
    .bcd_hid = 0x0111,
    .b_country_code = 0,
    .flags = 0x3
};

static mi_rcu_kb_report_t mi_rcu_report =
{
    .modifier = 0,
    .reserved = 0,
    .codes = {0}
};

typedef struct {
    uint8_t report1[12];
    uint8_t report2[6];
    uint8_t report3[1];
} mi_rcu_ver_report_t;

static mi_rcu_ver_report_t mi_rcu_ver_report =
{
//    .report1 =
//    {
//        0x27,
//        0x17,
//        0x32,
//        0xB8,
//        0xA2,
//        0x16,
//        0x64,
//        0x19,
//        0xA4,
//        0x00,
//        0x00,
//        0x00,
//    },
    .report1 =
    {
        0x27,
        0x17,
        0x32,
        0xB8,
        0x36,
        0x04,
        0x64,
        0x19,
        0xA2,
        0x00,
        0x00,
        0x00,
    },
    .report2 =
    {
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x20,
    },
    .report3 =
    {
        0x02,
    }
};

enum
{
    HID_PROTO_BOOT,
    HID_PROTO_REPORT
};
static uint8_t mi_rcu_protocol_mode = HID_PROTO_REPORT;

const static uint8_t KB_REPORT_MAP[] = {
    0x05,    0x01,
    0x09,    0x06,
    0xA1,    0x01,
        0x85,    0x01,
        0x05,    0x07,
        0x19,    0xE0,
        0x29,    0xE7,
        0x15,    0x00,
        0x25,    0x01,
        0x75,    0x01,
        0x95,    0x08,
        0x81,    0x02,
        0x95,    0x01,
        0x75,    0x08,
        0x81,    0x01,
        0x95,    0x05,
        0x75,    0x01,
        0x05,    0x08,
        0x19,    0x01,
        0x29,    0x05,
        0x91,    0x02,
        0x95,    0x01,
        0x75,    0x03,
        0x91,    0x01,
        0x95,    0x06,
        0x75,    0x08,
        0x15,    0x28,
        0x25,    0xFE,
        0x05,    0x07,
        0x19,    0x28,
        0x29,    0xFE,
        0x81,    0x00,
        0x05,    0x0C,
        0x09,    0x01,
        0xA1,    0x01,
            0x85,    0xF1,
            0x15,    0x00,
            0x25,    0x01,
            0x75,    0x01,
            0x95,    0x18,
            0x09,    0xB5,
            0x09,    0xB6,
            0x09,    0xB7,
            0x09,    0xCD,
            0x09,    0xE2,
            0x09,    0xE5,
            0x09,    0xE7,
            0x09,    0xE9,
            0x09,    0xEA,
            0x0A,    0x52,    0x01,
            0x0A,    0x53,    0x01,
            0x0A,    0x54,    0x01,
            0x0A,    0x55,    0x01,
            0x0A,    0x83,    0x01,
            0x0A,    0x8A,    0x01,
            0x0A,    0x92,    0x01,
            0x0A,    0x94,    0x01,
            0x0A,    0x21,    0x02,
            0x0A,    0x23,    0x02,
            0x0A,    0x24,    0x02,
            0x0A,    0x25,    0x02,
            0x0A,    0x26,    0x02,
            0x0A,    0x27,    0x02,
            0x0A,    0x2A,    0x02,
            0x81,    0x02,
        0xC0,
    0xC0,
};

#define REPORT_TYPE_INPUT               1
#define REPORT_TYPE_OUTPUT              2
#define REPORT_TYPE_FEATURE             3

static mi_rcu_report_ref_t mi_rcu_kb_desc_input_report =
{
    .report_id      = 1,
    .report_type    = REPORT_TYPE_INPUT
};

const static mi_rcu_report_ref_t mi_rcu_kb_desc_output_report =
{
    .report_id      = 2,
    .report_type    = REPORT_TYPE_OUTPUT
};

static mi_rcu_report_ref_t mi_rcu_kb_desc_feature_report =
{
    .report_id      = 4,
    .report_type    = REPORT_TYPE_FEATURE
};

static uint8_t mi_rcu_notify_enable = 0;
static uint16_t mi_rcu_con_handle = INVALID_HANDLE;

static uint16_t mi_rcu_att_notify_hid_report_handle;
static uint16_t mi_rcu_att_write_voice_control_handle;
static uint16_t mi_rcu_att_notify_voice_control_handle;
static uint16_t mi_rcu_att_notify_voice_handle_ch1;
static uint16_t mi_rcu_att_notify_voice_handle_ch2;
static uint16_t mi_rcu_att_notify_voice_handle_ch3;

static uint8_t notify_voice_handle_index = 0;
static uint8_t notify_voice_handle[3] = {0};
static uint16_t send_next_block_index = 0;

static uint16_t mi_rcu_att_notify_battery_handle = INVALID_HANDLE;


static uint8_t notify_battery_data[1] = {100};
static void notify_battery_level(void)
{
    att_server_notify(mi_rcu_con_handle, mi_rcu_att_notify_battery_handle, notify_battery_data, sizeof(notify_battery_data));
    return;
}

//#define PRINT_DBG_ATT_HANDLE(handle)     log_printf("[%d]: %d\r\n", __LINE__, handle)
#define PRINT_DBG_ATT_HANDLE(handle)
static uint8_t att_read_con_para[8] = {0x10,0x00,0x10,0x00,0x31,0x00,0x58,0x02};
static uint8_t att_read_pnp_id_data[7] = {0x01,0x17,0x27,0xB8,0x32,0xA4,0x00};
void mi_rcu_service_init(void)
{
    uint16_t chr_handle;
    // GA
    att_db_util_add_service_uuid16(SIG_UUID_SERVICE_GENERIC_ACCESS);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_GAP_DEVICE_NAME,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_GAP_APPEARANCE,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_GAP_PERIPHERAL_PREFERRED_CONNECTION_PARAMETERS,
        ATT_PROPERTY_READ,
        att_read_con_para, sizeof(att_read_con_para));
    PRINT_DBG_ATT_HANDLE(chr_handle);

    // Device
    att_db_util_add_service_uuid16(SIG_UUID_SERVICE_DEVICE_INFORMATION);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_MANUFACTURER_NAME_STRING,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_MODEL_NUMBER_STRING,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_SERIAL_NUMBER_STRING,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_HARDWARE_REVISION_STRING,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_FIRMWARE_REVISION_STRING,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_SOFTWARE_REVISION_STRING,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_SYSTEM_ID,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_IEEE_11073_20601_REGULATORY_CERTIFICATION_DATA_LIST,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_PNP_ID,
        ATT_PROPERTY_READ,
        att_read_pnp_id_data, sizeof(att_read_pnp_id_data));
    PRINT_DBG_ATT_HANDLE(chr_handle);

    // battery
    att_db_util_add_service_uuid16(SIG_UUID_SERVICE_BATTERY_SERVICE);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_BATTERY_LEVEL,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_att_notify_battery_handle = chr_handle;

    // HID
    att_db_util_add_service_uuid16(SIG_UUID_SERVICE_HUMAN_INTERFACE_DEVICE);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_HID_INFORMATION,
        ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_hid_info, sizeof(mi_rcu_hid_info));
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_HID_CONTROL_POINT,
        ATT_PROPERTY_WRITE_WITHOUT_RESPONSE,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT_MAP,
        ATT_PROPERTY_READ,
        (uint8_t *)KB_REPORT_MAP, sizeof(KB_REPORT_MAP));
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_PROTOCOL_MODE,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE_WITHOUT_RESPONSE | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_BOOT_KEYBOARD_INPUT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_BOOT_KEYBOARD_OUTPUT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE_WITHOUT_RESPONSE | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    // 1
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_DYNAMIC | ATT_PROPERTY_AUTHENTICATION_REQUIRED,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_att_notify_hid_report_handle = chr_handle;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_input_report, sizeof(mi_rcu_kb_desc_input_report));
    // 2
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE_WITHOUT_RESPONSE | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_output_report, sizeof(mi_rcu_kb_desc_output_report));
    // 3
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_DYNAMIC | ATT_PROPERTY_AUTHENTICATION_REQUIRED,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_input_report.report_id = 3;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_input_report, sizeof(mi_rcu_kb_desc_input_report));
    // 4
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_att_write_voice_control_handle = chr_handle;
    mi_rcu_kb_desc_feature_report.report_id = 4;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 5
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC | ATT_PROPERTY_AUTHENTICATION_REQUIRED,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_att_notify_voice_control_handle = chr_handle;
    mi_rcu_kb_desc_feature_report.report_id = 5;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 6
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC | ATT_PROPERTY_AUTHENTICATION_REQUIRED,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_att_notify_voice_handle_ch1 = chr_handle;
    mi_rcu_kb_desc_feature_report.report_id = 6;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 7
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC | ATT_PROPERTY_AUTHENTICATION_REQUIRED,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_att_notify_voice_handle_ch2 = chr_handle;
    mi_rcu_kb_desc_feature_report.report_id = 7;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 8
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC | ATT_PROPERTY_AUTHENTICATION_REQUIRED,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_att_notify_voice_handle_ch3 = chr_handle;
    mi_rcu_kb_desc_feature_report.report_id = 8;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 9
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 67;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 10
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC | ATT_PROPERTY_AUTHENTICATION_REQUIRED,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 83;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 11
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE,
        mi_rcu_ver_report.report1, sizeof(mi_rcu_ver_report.report1));
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 224;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 12
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE,
        mi_rcu_ver_report.report2, sizeof(mi_rcu_ver_report.report2));
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 225;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 13
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 226;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 14
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE,
        mi_rcu_ver_report.report3, sizeof(mi_rcu_ver_report.report3));
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 227;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 15
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 228;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 16
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 229;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 17
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 230;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 18
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 231;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 19
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 232;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 20
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 233;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 21
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 234;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 22
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 235;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 23
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 236;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 24
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 237;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 25
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 238;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));
    // 26
    chr_handle = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_REPORT,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC | ATT_PROPERTY_AUTHENTICATION_REQUIRED,
        (uint8_t *)&mi_rcu_report, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);
    mi_rcu_kb_desc_feature_report.report_id = 165;
    att_db_util_add_descriptor_uuid16(SIG_UUID_DESCRIP_REPORT_REFERENCE, ATT_PROPERTY_READ,
        (uint8_t *)&mi_rcu_kb_desc_feature_report, sizeof(mi_rcu_kb_desc_feature_report));

    // un
    att_db_util_add_service_uuid128(mi_rcu_service_uuid128);
    att_db_util_add_characteristic_uuid128(mi_rcu_char_write_no_resp_uuid128,
        ATT_PROPERTY_WRITE_WITHOUT_RESPONSE | ATT_PROPERTY_DYNAMIC,
        0, 0);
    att_db_util_add_characteristic_uuid128(mi_rcu_char_notify_uuid128,
        ATT_PROPERTY_NOTIFY | ATT_PROPERTY_DYNAMIC,
        0, 0);
    att_db_util_add_characteristic_uuid128(mi_rcu_char_write_uuid128,
        ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        0, 0);

    // dfu
    att_db_util_add_service_uuid16(0xFE59);
    att_db_util_add_characteristic_uuid128(mi_rcu_char_dfu_control_point_uuid128,
        ATT_PROPERTY_NOTIFY | ATT_PROPERTY_WRITE | ATT_PROPERTY_DYNAMIC,
        0, 0);
    att_db_util_add_characteristic_uuid128(mi_rcu_char_dfu_packet_uuid128,
        ATT_PROPERTY_READ | ATT_PROPERTY_WRITE_WITHOUT_RESPONSE | ATT_PROPERTY_DYNAMIC,
        0, 0);
    chr_handle = att_db_util_add_characteristic_uuid16(0x0003,
        ATT_PROPERTY_READ | ATT_PROPERTY_DYNAMIC,
        0, 0);
    PRINT_DBG_ATT_HANDLE(chr_handle);

    log_printf("[service]: mi_rcu handle: %d %d %d %d %d %d\r\n",
        mi_rcu_att_notify_hid_report_handle,
        mi_rcu_att_write_voice_control_handle,
        mi_rcu_att_notify_voice_control_handle,
        mi_rcu_att_notify_voice_handle_ch1,
        mi_rcu_att_notify_voice_handle_ch2,
        mi_rcu_att_notify_voice_handle_ch3);

    notify_voice_handle[0] = mi_rcu_att_notify_voice_handle_ch1;
    notify_voice_handle[1] = mi_rcu_att_notify_voice_handle_ch2;
    notify_voice_handle[2] = mi_rcu_att_notify_voice_handle_ch3;
    return;
}

int16_t mi_rcu_att_read_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t offset,
                                  uint8_t *buffer, uint16_t buffer_size)
{
    if (att_handle == mi_rcu_att_notify_hid_report_handle) {
        if (buffer) {
            *(int8_t *)buffer = 0xff;
            return buffer_size;
        } else {
            return 1;
        }
    } else if (att_handle == mi_rcu_att_notify_hid_report_handle + 1) {
        if (buffer) {
            *(int8_t *)buffer = mi_rcu_notify_enable;
            return buffer_size;
        } else {
            return 1;
        }
    } else if (att_handle == mi_rcu_att_notify_battery_handle) {
        if (buffer) {
            *(int8_t *)buffer = notify_battery_data[0];
            return buffer_size;
        } else {
            return 1;
        }
    }else {
        return -1;
    }
}

static void mi_rcu_audio_trigger_send_data(void)
{
    static int cnt = 0;
    btstack_push_user_msg(USER_MSG_ID_MI_RCU_VOICE_REQUEST_SEND_DATA, NULL, 0);
    dbg_printf("[>d:mi]\r\n");
}

extern uint8_t adv_data_power[];
void mi_rcu_set_power_on_adv_data(void)
{
    if (g_power_off_save_data_in_ram.version <= 0x4006) {
        adv_data_power[28] = 0x4F;
        adv_data_power[29] = 0x65;
        adv_data_power[30] = 0x3F;
    } else if (g_power_off_save_data_in_ram.version >= 0x7017) {
        adv_data_power[28] = 0x83;
        adv_data_power[29] = 0xA1;
        adv_data_power[30] = 0x45;
    } else {
        adv_data_power[28] = 0x83;
        adv_data_power[29] = 0xA1;
        adv_data_power[30] = 0x45;
    }
    log_printf("[>d:mi]: ver0x%x\r\n", g_power_off_save_data_in_ram.version);
    return;
}

int16_t mi_rcu_att_write_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t transaction_mode,
                              uint16_t offset, const uint8_t *buffer, uint16_t buffer_size)
{
    if (att_handle == mi_rcu_att_notify_hid_report_handle) {
        return 0;
    } else if (att_handle == (mi_rcu_att_notify_hid_report_handle + 1)) {
        if(*(uint16_t *)buffer == GATT_CLIENT_CHARACTERISTICS_CONFIGURATION_NOTIFICATION) {
            mi_rcu_notify_enable = 1;
        } else {
            mi_rcu_notify_enable = 0;
        }
        return 0;
    } else if (att_handle == mi_rcu_att_write_voice_control_handle) {
        // Attribute Data 10 bytes (04 00 00 80 10 10 00 31 17 70)
        // Attribute Data 20 bytes (00 00 00 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00)
        // Attribute Data 20 bytes (00 00 00 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00)
        uint32_t cmd = buffer[0] | (buffer[1] << 8) | (buffer[2] << 16) | (buffer[3] << 24);
        log_printf("[>i:mi]: cmd 0x%x\r\n", cmd);
        switch (cmd)
        {
        case 0x80000000:
        {
            uint8_t audio_opt = buffer[4];
            log_printf("[>i:mi]: voice %d\r\n", audio_opt);
            if (audio_opt == 0x01) {
                notify_voice_handle_index = 0;
                send_next_block_index = 0;
                if (voice_key_pressed == 1) {
                    low_power_exit_saving(LOW_POWER_EXIT_REASON_VOICE);
                    audio_start(mi_rcu_audio_trigger_send_data);
                }
            } else if (audio_opt == 0x00) {
//                low_power_clear_exit_reason(LOW_POWER_EXIT_REASON_VOICE);
//                audio_stop_sample();
            } else {
            }
            break;
        }
        case 0x80000004:
        {
            uint32_t cmd1 = buffer[4] | (buffer[5] << 8) | (buffer[6] << 16) | (buffer[7] << 24);
            uint16_t cmd2 = buffer[8] | (buffer[9] << 8);
            if (cmd1 == 0x31001010) {
                if (g_power_off_save_data_in_ram.version != cmd2) {
                    g_power_off_save_data_in_ram.version = cmd2;
                    sdk_private_data_write_to_flash();
                }
            }
            notify_battery_level();
            log_printf("[>i:mi]: start %x %x\r\n", cmd1, cmd2);
            update_connection_parameter();
            break;
        }
        default:
            break;
        }
        return 0;
    } else {
        return -1;
    }
}

void mi_rcu_event_connected(const le_meta_event_enh_create_conn_complete_t *cmpl)
{
    mi_rcu_con_handle = cmpl->handle;

    return;
}

void mi_rcu_event_disconnect(const event_disconn_complete_t *cmpl)
{
    mi_rcu_con_handle = INVALID_HANDLE;
    mi_rcu_notify_enable = 0;
    return;
}

static uint32_t i_am_slave_send_data_num = 0;
static uint8_t mi_rcu_i_am_slave_send_data(void)
{
    uint16_t mtu = 0;
    uint16_t this_time_send_len;
    uint8_t *p_data = NULL;
    int ret;

    mtu = att_server_get_mtu(mi_rcu_con_handle);
    mtu -= 3;
    return 0;
}

static void mi_rcu_send_voice_data(void)
{
    uint16_t att_handle;
    int ret;

    if (mi_rcu_con_handle == INVALID_HANDLE) {
        return;
    }

    dbg_printf("[>d:ing]: hdl%d:%d\n", mi_rcu_con_handle, notify_voice_handle_index);
    while (1)
    {
        int i;
        const uint8_t *send_data = NULL;
        uint16_t sample_buf_block_index = audio_get_curr_block();

        if (send_next_block_index >= sample_buf_block_index) {
            return;
        }

        if (!att_server_can_send_packet_now(mi_rcu_con_handle)) {
            att_server_request_can_send_now_event(mi_rcu_con_handle);
            return;
        }

        send_data = audio_get_block_buff(send_next_block_index);

        att_handle = notify_voice_handle[notify_voice_handle_index];
        ret = att_server_notify(mi_rcu_con_handle, att_handle, send_data, VOICE_BLE_SEND_BLOCK_SIZE);
        if (ret == 0) {
            log_printf("[>i:att]: n %d %d 0x%x\n", att_handle, send_next_block_index, send_data[1]);
            notify_voice_handle_index++;
            if (notify_voice_handle_index >= sizeof(notify_voice_handle)) {
                notify_voice_handle_index = 0;
            }

            send_next_block_index++;
        } else {
            continue;
        }
    }
    return;
}

static void mi_rcu_kb_send_report(uint16_t report)
{
    if (mi_rcu_protocol_mode != HID_PROTO_REPORT)
        return;

    if (mi_rcu_con_handle == INVALID_HANDLE)
        return;
    if (0 == mi_rcu_att_notify_hid_report_handle)
        return;

    notify_battery_level();

    mi_rcu_report.modifier = 0;
    memset(mi_rcu_report.codes, 0, sizeof(mi_rcu_report.codes));
    mi_rcu_report.codes[0] = (report & 0xFF);
    mi_rcu_report.codes[1] = ((report >> 8) & 0xFF);
    att_server_notify(mi_rcu_con_handle, mi_rcu_att_notify_hid_report_handle, (uint8_t *)&mi_rcu_report, sizeof(mi_rcu_report));
}

uint8_t notify_voice_control_data[20] = {
    0x01, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00
};
static void mi_rcu_request_start_voice(uint16_t report)
{
    notify_voice_control_data[0]     = 0x01;
    att_server_notify(mi_rcu_con_handle, mi_rcu_att_notify_voice_control_handle, notify_voice_control_data, sizeof(notify_voice_control_data));
    mi_rcu_kb_send_report(report);
    return;
}

static void mi_rcu_request_stop_voice(uint16_t report)
{
    notify_voice_control_data[0]     = 0x00;
    att_server_notify(mi_rcu_con_handle, mi_rcu_att_notify_voice_control_handle, notify_voice_control_data, sizeof(notify_voice_control_data));
    mi_rcu_kb_send_report(report);
    return;
}

void mi_rcu_user_msg_handler(uint32_t msg_id, void *data, uint16_t size)
{
    switch (msg_id)
    {
    case USER_MSG_ID_MI_RCU_KEY_REPORT_SEND:
    {
        ll_set_conn_latency(mi_rcu_con_handle, 0);
        mi_rcu_kb_send_report(size);
        break;
    }
    case USER_MSG_ID_MI_RCU_VOICE_START_REQUEST:
    {
        ll_set_conn_latency(mi_rcu_con_handle, 0);
        mi_rcu_request_start_voice(size);
        break;
    }
    case USER_MSG_ID_MI_RCU_VOICE_STOP_REQUEST:
    {
        ll_set_conn_latency(mi_rcu_con_handle, 0);
        mi_rcu_request_stop_voice(size);
        break;
    }
    case USER_MSG_ID_MI_RCU_VOICE_REQUEST_SEND_DATA:
    {
        int ret = att_server_can_send_packet_now(mi_rcu_con_handle);
        g_fun_bt_send_data = mi_rcu_send_voice_data;
        ll_set_conn_latency(mi_rcu_con_handle, 0);
        dbg_printf("[>d:send]: %d\r\n", ret);
        if (ret) {
            mi_rcu_send_voice_data();
        } else {
            att_server_request_can_send_now_event(mi_rcu_con_handle);
        }
        break;
    }
    default:
        break;
    }
    return;
}

#if defined __cplusplus
    }
#endif
