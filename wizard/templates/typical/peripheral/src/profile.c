#include <stdio.h>
#include "platform_api.h"
#include "att_db.h"
#include "gap.h"
#include "btstack_event.h"
#include "btstack_defines.h"{{if coding_profile}}
#include "att_db_util.h"{{endif}}{{if ota}}
#include "ota_service.h"{{endif}}{{if security}}
#include "sm.h"{{if key_incode}}
const sm_persistent_t sm_persistent =
{
    .er = { {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}},
            {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}} },
    .ir = { {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}},
            {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}} },
    .identity_addr_type = BD_ADDR_TYPE_LE_RANDOM,
    .identity_addr      = { {{randc0}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}} }
};{{endif}}

#define SECURITY_PERSISTENT_DATA    ({{if key_incode}}&sm_persistent{{else}}(const sm_persistent_t *){{key_addr}}{{endif}})
#define PRIVATE_ADDR_MODE           {{priv_addr}}{{else}}{{endif}}{{if coding_profile}}{{else}}

// GATT characteristic handles
#include "../data/gatt.const"
{{endif}}
const static uint8_t adv_data[] = {
    #include "../data/advertising.adv"
};

#include "../data/advertising.const"{{if legacy_adv}}

const static uint8_t scan_data[] = {
    #include "../data/scan_response.adv"
};

#include "../data/scan_response.const"{{endif}}{{if coding_profile}}{{else}}

const static uint8_t profile_data[] = {
    #include "../data/gatt.profile"
};{{endif}}

static uint16_t att_read_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t offset,
                                  uint8_t * buffer, uint16_t buffer_size)
{
    switch (att_handle)
    {
{{loop readable_handle}}    case {{gatt_handle.key}}:
        if (buffer)
        {
            // add your code
            return buffer_size;
        }
        else
            return 1; // TODO: return required buffer size
{{endloop}}
    default:
        {{if ota}}return ota_read_callback(att_handle, offset, buffer, buffer_size);{{else}}return 0;{{endif}}
    }
}

static int att_write_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t transaction_mode,
                              uint16_t offset, const uint8_t *buffer, uint16_t buffer_size)
{
    switch (att_handle)
    {
{{loop writable_handle}}    case {{gatt_handle.key}}:
        // add your code
        return 0;
{{endloop}}
    default:
        {{if ota}}return ota_write_callback(att_handle, transaction_mode, offset, buffer, buffer_size);{{else}}return 0;{{endif}}
    }
}

static void user_msg_handler(uint32_t msg_id, void *data, uint16_t size)
{
    switch (msg_id)
    {
        // add your code
    //case MY_MESSAGE_ID:
    //    break;
    default:
        ;
    }
}

const static ext_adv_set_en_t adv_sets_en[] = { {.handle = 0, .duration = 0, .max_events = 0} };

static void setup_adv(void)
{
    gap_set_ext_adv_para(0,
                            CONNECTABLE_ADV_BIT{{if legacy_adv}} | SCANNABLE_ADV_BIT | LEGACY_PDU_BIT{{endif}},
                            0x00a1, 0x00a1,            // Primary_Advertising_Interval_Min, Primary_Advertising_Interval_Max
                            PRIMARY_ADV_ALL_CHANNELS,  // Primary_Advertising_Channel_Map
                            BD_ADDR_TYPE_LE_RANDOM,    // Own_Address_Type
                            BD_ADDR_TYPE_LE_PUBLIC,    // Peer_Address_Type (ignore)
                            NULL,                      // Peer_Address      (ignore)
                            ADV_FILTER_ALLOW_ALL,      // Advertising_Filter_Policy
                            0x00,                      // Advertising_Tx_Power
                            PHY_1M,                    // Primary_Advertising_PHY
                            0,                         // Secondary_Advertising_Max_Skip
                            PHY_1M,                    // Secondary_Advertising_PHY
                            0x00,                      // Advertising_SID
                            0x00);                     // Scan_Request_Notification_Enable
    gap_set_ext_adv_data(0, sizeof(adv_data), (uint8_t*)adv_data);{{if legacy_adv}}
    gap_set_ext_scan_response_data(0, sizeof(scan_data), (uint8_t*)scan_data);{{endif}}
    gap_set_ext_adv_enable(1, sizeof(adv_sets_en) / sizeof(adv_sets_en[0]), adv_sets_en);
}{{if coding_profile}}

// TODO: check required ATT DB size, and update accordingly
static uint8_t att_db_storage[500];

uint8_t *init_service()
{
    static char dev_name[] = "{{proj_name}}";
    att_db_util_init(att_db_storage, sizeof(att_db_storage));

    att_db_util_add_service_uuid16(GAP_SERVICE_UUID);
    att_db_util_add_characteristic_uuid16(GAP_DEVICE_NAME_UUID, ATT_PROPERTY_READ, (uint8_t *)dev_name, sizeof(dev_name) - 1);

    {{if ota}}ota_init_service();
    {{endif}}// TODO: add your services by calling att_db_util_add_...

    return att_db_util_get_address();
}{{endif}}

static void user_packet_handler(uint8_t packet_type, uint16_t channel, const uint8_t *packet, uint16_t size)
{
    {{if security}}{{else}}static const bd_addr_t rand_addr = { {{randc0}}, {{rand}}, {{rand}}, {{rand}}, {{rand}}, {{rand}} };{{endif}}
    uint8_t event = hci_event_packet_get_type(packet);
    const btstack_user_msg_t *p_user_msg;
    if (packet_type != HCI_EVENT_PACKET) return;

    switch (event)
    {
    case BTSTACK_EVENT_STATE:
        if (btstack_event_state_get_state(packet) != HCI_STATE_WORKING)
            break;
{{if security}}#if (PRIVATE_ADDR_MODE == GAP_RANDOM_ADDRESS_OFF)
        if (SECURITY_PERSISTENT_DATA->identity_addr_type != BD_ADDR_TYPE_LE_PUBLIC)
            gap_set_adv_set_random_addr(0, SECURITY_PERSISTENT_DATA->identity_addr);
        setup_adv();
#else
        sm_private_random_address_generation_set_mode(PRIVATE_ADDR_MODE);
#endif{{else}}        gap_set_adv_set_random_addr(0, rand_addr);
        setup_adv();{{endif}}
        break;

    case HCI_EVENT_COMMAND_COMPLETE:
        switch (hci_event_command_complete_get_command_opcode(packet))
        {
        // add your code to check command complete response
        // case :
        //     break;
        default:
            break;
        }
        break;

    case HCI_EVENT_LE_META:
        switch (hci_event_le_meta_get_subevent_code(packet))
        {
        case HCI_SUBEVENT_LE_ENHANCED_CONNECTION_COMPLETE:
            att_set_db(decode_hci_le_meta_event(packet, le_meta_event_enh_create_conn_complete_t)->handle,
                       {{if coding_profile}}att_db_util_get_address(){{else}}profile_data{{endif}});
            break;
        default:
            break;
        }

        break;

    case HCI_EVENT_DISCONNECTION_COMPLETE:
        gap_set_ext_adv_enable(1, sizeof(adv_sets_en) / sizeof(adv_sets_en[0]), adv_sets_en);
        break;

    case ATT_EVENT_CAN_SEND_NOW:
        // add your code
        break;

    case BTSTACK_EVENT_USER_MSG:
        p_user_msg = hci_event_packet_get_user_msg(packet);
        user_msg_handler(p_user_msg->msg_id, p_user_msg->data, p_user_msg->len);
        break;

    default:
        break;
    }
}

static btstack_packet_callback_registration_t hci_event_callback_registration;{{if security}}

static void sm_packet_handler(uint8_t packet_type, uint16_t channel, const uint8_t *packet, uint16_t size)
{
    uint8_t event = hci_event_packet_get_type(packet);
#if (PRIVATE_ADDR_MODE != GAP_RANDOM_ADDRESS_OFF)
    static uint8_t addr_ready = 0;
#endif

    if (packet_type != HCI_EVENT_PACKET) return;
    switch (event)
    {
    case SM_EVENT_PRIVATE_RANDOM_ADDR_UPDATE:
#if (PRIVATE_ADDR_MODE != GAP_RANDOM_ADDRESS_OFF)
        gap_set_adv_set_random_addr(0, sm_private_random_addr_update_get_address(packet));
        if (0 == addr_ready)
        {
            addr_ready = 1;
            setup_adv();
        }
#endif
        break;
    case SM_EVENT_JUST_WORKS_REQUEST:
        sm_just_works_confirm(sm_event_just_works_request_get_handle(packet));
        break;{{if io_cap in IO_CAPABILITY_DISPLAY_ONLY IO_CAPABILITY_DISPLAY_YES_NO IO_CAPABILITY_KEYBOARD_DISPLAY}}
    case SM_EVENT_PASSKEY_DISPLAY_NUMBER:
        platform_printf("===================\npasskey: %06d\n===================\n",
            sm_event_passkey_display_number_get_passkey(packet));
        break;
    case SM_EVENT_PASSKEY_DISPLAY_CANCEL:
        platform_printf("TODO: DISPLAY_CANCEL\n");
        break;{{endif}}{{if io_cap in IO_CAPABILITY_KEYBOARD_ONLY IO_CAPABILITY_KEYBOARD_DISPLAY}}
    case SM_EVENT_PASSKEY_INPUT_NUMBER:
        // TODO: ask user to input number & call sm_passkey_input
        platform_printf("===================\ninput number:\n");
        break;
    case SM_EVENT_PASSKEY_INPUT_CANCEL:
        platform_printf("TODO: INPUT_CANCEL\n");
        break;{{endif}}
    default:
        break;
    }
}

static btstack_packet_callback_registration_t sm_event_callback_registration  = {.callback = &sm_packet_handler};{{endif}}

uint32_t setup_profile(void *data, void *user_data)
{
    platform_printf("setup profile\n");
    {{if security}}sm_add_event_handler(&sm_event_callback_registration);
    sm_config(1, {{io_cap}}, 0, SECURITY_PERSISTENT_DATA);
    sm_add_event_handler(&sm_event_callback_registration);{{else}}// Note: security has not been enabled.{{endif}}{{if coding_profile}}
    init_service();{{endif}}
    att_server_init(att_read_callback, att_write_callback);
    hci_event_callback_registration.callback = &user_packet_handler;
    hci_add_event_handler(&hci_event_callback_registration);
    att_server_register_packet_handler(&user_packet_handler);
    return 0;
}

