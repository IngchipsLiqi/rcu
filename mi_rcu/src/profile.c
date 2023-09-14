#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "platform_api.h"
#include "att_db.h"
#include "gap.h"
#include "btstack_util.h"
#include "btstack_event.h"
#include "btstack_defines.h"
#include "gatt_client.h"

#include "att_db_util.h"

#include "USBHID_Types.h"
#include "USBKeyboard.h"

#include "profile.h"
#include "mi_rcu_service.h"
#include "sdk_private_flash_data.h"
#include "pair_bond.h"
#include "mi_rcu_key.h"
#include "mi_rcu_adv.h"
#include "key_board.h"
#include "low_power.h"

hci_con_handle_t handle_send = INVALID_HANDLE;

#define CON_INTERVAL 0x0010
#define CON_LATENCY  0x0031
#define CON_TIMEOUT  0x0640
#define CON_CE       (CON_INTERVAL * 2)
static conn_para_t con_parameters = {
    .scan_int = 200,
    .scan_win = 180,
    .interval_min = CON_INTERVAL, // * 1.25 ms
    .interval_max = CON_INTERVAL,
    .latency = CON_LATENCY,
    .supervision_timeout = CON_TIMEOUT, // * 10 ms
    .min_ce_len = CON_CE, // * 0.625 ms
    .max_ce_len = CON_CE  // * 0.625 ms
};

void update_connection_parameter(void)
{
    btstack_push_user_msg(USER_MSG_ID_UPDATE_CON_PARAMETERS, &con_parameters, sizeof(con_parameters));
}

static uint16_t att_read_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t offset,
                                  uint8_t * buffer, uint16_t buffer_size)
{
    int16_t ret;

    dbg_printf("[>d:att]: read handle = %d\n", att_handle);

    ret = mi_rcu_att_read_callback(connection_handle, att_handle, offset, buffer, buffer_size);
    if (ret != -1) {
        return ret;
    }

    return 0;
}

static btstack_packet_callback_registration_t hci_event_callback_registration;

static int att_write_callback(hci_con_handle_t connection_handle, uint16_t att_handle, uint16_t transaction_mode,
                              uint16_t offset, const uint8_t *buffer, uint16_t buffer_size)
{
    int16_t ret;

    dbg_printf("[>d:att]: write handle = %d\n", att_handle);

    ret = mi_rcu_att_write_callback(connection_handle, att_handle, transaction_mode, offset, buffer, buffer_size);
    if (ret != -1) {
        return ret;
    }

    return 0;
}

static uint8_t update_parameters_flag = 0;
uint16_t con_para_latency = 0;
static void profile_user_msg_handler(uint32_t msg_id, void *data, uint16_t size)
{
    switch (msg_id)
    {
    case USER_MSG_ID_UPDATE_CON_PARAMETERS:
    {
        low_power_enter_saving();
        if (handle_send == INVALID_HANDLE) {
            break;
        }
        
        if (con_para_latency == 0) {
            ll_set_conn_latency(handle_send, 0);
        } else {
            ll_set_conn_latency(handle_send, con_para_latency);
        }
        
        if (!update_parameters_flag) {
            conn_para_t *con_parameters = data;
            if (size != sizeof(conn_para_t)) {
                break;
            }
            gap_update_connection_parameters(handle_send,
                con_parameters->interval_min,
                con_parameters->interval_max,
                con_parameters->latency,
                con_parameters->supervision_timeout,
                con_parameters->min_ce_len,
                con_parameters->max_ce_len);
            update_parameters_flag = 1;
        }
        break;
    }
    case USER_MSG_ID_PAIR_BOND_OK:
//        vr_set_sys_status(VR_STATUS_PAIRED);
//        led_on_red(3000, 3000);
        break;
    case USER_MSG_ID_DISCONNECT_DEV:
        gap_disconnect_in_stack(0);
        break;
    default:
        break;
    }
}

static void user_msg_handler(uint32_t msg_id, void *data, uint16_t size)
{
    dbg_printf("[>d:msg]: id:0x%x, size:%d\r\n", msg_id, size);
    if ((msg_id >= USER_MSG_ID_PROFILE) && (msg_id <= USER_MSG_ID_PROFILE_END)) {
        profile_user_msg_handler(msg_id, data, size);
    } else if ((msg_id >= USER_MSG_ID_MI_RCU) && (msg_id <= USER_MSG_ID_MI_RCU_END)) {
        mi_rcu_user_msg_handler(msg_id, data, size);
    } else if ((msg_id >= USER_MSG_ID_ADV) && (msg_id <= USER_MSG_ID_ADV_END)) {
        adv_user_msg_handler(msg_id, data, size);
    } else {
    }
}

static void send_data(void)
{
    log_printf("[>i:profile]: send data\n");
    return;
}

static void profile_adv_time_out_callback(TimerHandle_t xTimer)
{
    vr_stop_adv();
    return;
}

static void profile_reconnect_adv_time_out_callback(TimerHandle_t xTimer)
{
    if (handle_send == INVALID_HANDLE) {
        vr_start_adv(ADV_UNDIRECT_RECONNECT, g_power_off_save_data_in_ram.module_mac_address, 30000, profile_adv_time_out_callback);
    }
    return;
}

void adv_start(void)
{
    if (is_already_paired()) {
        log_printf("[>i:profile]: reconnect\r\n");
        //vr_start_adv(ADV_UNDIRECT_RECONNECT, g_power_off_save_data_in_ram.module_mac_address, 60000, profile_adv_time_out_callback);
        vr_start_adv(ADV_DIRECT_HDC, g_power_off_save_data_in_ram.module_mac_address, 1300, profile_reconnect_adv_time_out_callback);
    } else {
        log_printf("[>i:profile]: adv\r\n");
        vr_start_adv(ADV_UNDIRECT_PAIRING, g_power_off_save_data_in_ram.module_mac_address, 30000, profile_adv_time_out_callback);
    }
    return;
}

f_bt_send_data g_fun_bt_send_data = send_data;
static void user_packet_handler(uint8_t packet_type, uint16_t channel, const uint8_t *packet, uint16_t size)
{
    const static ext_adv_set_en_t adv_sets_en[] = {{.handle = 0, .duration = 0, .max_events = 0}};
    uint8_t event = hci_event_packet_get_type(packet);
    const btstack_user_msg_t *p_user_msg;
    if (packet_type != HCI_EVENT_PACKET) return;

    switch (event)
    {
    case BTSTACK_EVENT_STATE:
        if (btstack_event_state_get_state(packet) != HCI_STATE_WORKING)
            break;

        adv_start();

        break;

    case HCI_EVENT_LE_META:
        switch (hci_event_le_meta_get_subevent_code(packet))
        {
        case HCI_SUBEVENT_LE_ENHANCED_CONNECTION_COMPLETE:
        {
            const le_meta_event_enh_create_conn_complete_t *cmpl =
                decode_hci_le_meta_event(packet, le_meta_event_enh_create_conn_complete_t);

            if (0 != cmpl->status) {
                break;
            }
            log_printf("[>i:connect]:\r\n");

            gatt_client_is_ready(cmpl->handle);
            att_set_db(cmpl->handle, att_db_util_get_address());
            handle_send = cmpl->handle;

            mi_rcu_event_connected(cmpl);
            pair_bond_connected(cmpl);

            ll_set_conn_tx_power(cmpl->handle, 0);

            vr_set_sys_status(VR_STATUS_CONNECTED_PAIRING);
            update_parameters_flag = 0;
            break;
        }
        case HCI_SUBEVENT_LE_CONNECTION_UPDATE_COMPLETE:
        {
            const le_meta_event_conn_update_complete_t *cmpl = decode_hci_le_meta_event(packet, le_meta_event_conn_update_complete_t);
            log_printf("[>i:evt]: interval %.2f ms lat:%d timeout:%d\r\n",
                cmpl->interval * 1.25,
                cmpl->latency,
                cmpl->sup_timeout
                );
            con_para_latency = cmpl->latency;
            if (g_exit_saving) {
                ll_set_conn_latency(cmpl->handle, 0);
            } else {
                ll_set_conn_latency(cmpl->handle, cmpl->latency);
            }

            break;
        }
        default:
            break;
        }

        break;

    case HCI_EVENT_DISCONNECTION_COMPLETE:
    {
        const event_disconn_complete_t *cmpl = decode_hci_event_disconn_complete(packet);

        handle_send = INVALID_HANDLE;
        log_printf("[>i:disconnect]: reason:0x%x see ERROR_CODE_XXX\r\n",cmpl->reason);

        pair_bond_event_disconnect(cmpl);
        mi_rcu_event_disconnect(cmpl);

        adv_start();

        if((platform_read_persistent_reg() & 0x02) != 0x00)
        {
            platform_write_persistent_reg(0x01);
            clear_pairing_data();
            // platform_reset();
            Reload_Ir();
        }

        break;
    }

    case ATT_EVENT_CAN_SEND_NOW:
        g_fun_bt_send_data();
        break;

    case BTSTACK_EVENT_USER_MSG:
        p_user_msg = hci_event_packet_get_user_msg(packet);
        user_msg_handler(p_user_msg->msg_id, p_user_msg->data, p_user_msg->len);
        break;
    default:
        break;
    }
}

static uint8_t att_db_storage[2000];
static uint8_t *init_service()
{
    att_db_util_init(att_db_storage, sizeof(att_db_storage));
    mi_rcu_service_init();
    return att_db_util_get_address();
}

void gap_disconnect_in_stack(hci_con_handle_t handle)
{
    gap_disconnect(0);
    log_printf("[>i:disconnect]: dev\r\n");
    return;
}

void print_addr(const uint8_t *addr)
{
    log_printf("addr: %02X_%02X_%02X_%02X_%02X_%02X\r\n", addr[0], addr[1], addr[2], addr[3], addr[4], addr[5]);
}

void print_data(const uint8_t *data, uint16_t data_len)
{
    int i;
    log_printf("[>i:data]: ");
    for (i = 0; i < data_len; i++) {
        log_printf("0x%02x, ", data[i]);
    }
    log_printf("\r\n");
}

uint32_t setup_profile(void *data, void *user_data)
{
    init_service();
    att_server_init(att_read_callback, att_write_callback);
    hci_event_callback_registration.callback = &user_packet_handler;
    hci_add_event_handler(&hci_event_callback_registration);
    att_server_register_packet_handler(&user_packet_handler);

    pair_bond_init(g_power_off_save_data_in_ram.module_mac_address);

    vr_system_start();
    log_printf("[>i:profile]: setup\n");
    return 0;
}
