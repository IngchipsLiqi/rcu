
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include <stdio.h>
#include <string.h>

#include "ingsoc.h"
#include "platform_api.h"
#include "profile.h"

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "semphr.h"
#include "pair_bond.h"
#include "btstack_defines.h"
#include "le_device_db.h"
#include "sdk_private_flash_data.h"

#if defined __cplusplus
    extern "C" {
#endif

sm_persistent_t sm_persistent =
{
    .er = {1, 2, 3},
    .ir = {4, 5, 6},
    // .identity_addr_type     = BD_ADDR_TYPE_LE_RANDOM,
    .identity_addr_type     = BD_ADDR_TYPE_LE_PUBLIC, // PUB_ADDR_TEST
    .identity_addr          = {0x00}
};

direct_reconnect_param_t direct_param = {0};

void generate_rpa(uint8_t *addr, const uint8_t *irk)
{
    uint8_t key[16];
    uint8_t plain[16];
    uint8_t cipher[16];

    reverse_bytes(irk, key, sizeof(key));

    reverse_24(addr, plain);
    memset(plain + 3, 0, 13);

    while (ll_aes_encrypt(key, plain, cipher) != 0)
        vTaskDelay(10);

    memcpy(addr + 3, cipher + 13, 3);
}


int is_already_paired(void)
{
    int res = 0;
    le_device_memory_db_iter_t device_db_iter;
    le_device_memory_db_t * device_memory_db;
    le_device_db_iter_init(&device_db_iter);

    device_memory_db = le_device_db_iter_next(&device_db_iter);
    if(device_memory_db != NULL)
    {
        memcpy(direct_param.addr, device_db_iter.cur->addr, 6);
        direct_param.addr_type = (bd_addr_type_t)device_db_iter.cur->addr_type;
        memcpy(direct_param.irk, device_db_iter.cur->irk, 16);
        res = 1;
    }

    return res;
}

void clear_pairing_data(void)
{
    log_printf("[>i:pair]: clear db!\r\n");
    le_device_memory_db_iter_t device_db_iter;
    le_device_db_iter_init(&device_db_iter);
    while (le_device_db_iter_next(&device_db_iter)) {
        le_device_db_remove_key(device_db_iter.key);
    }
    update_ir();
    //kv_commit(0);
    return;
}

static int peer_is_paired(uint8_t index, bd_addr_t addr)
{
    le_device_memory_db_iter_t iter;
    le_device_db_iter_init(&iter);
    while (le_device_db_iter_next(&iter)) {
        le_device_memory_db_t *cur = le_device_db_iter_cur(&iter);
        if(index == iter.key) {
            memcpy(addr, cur->addr, sizeof(bd_addr_t));
            return 1;
        }
    }
    return 0;
}

static void traversing_device_db(void)
{
    le_device_memory_db_iter_t iter;
    le_device_db_iter_init(&iter);
    while (le_device_db_iter_next(&iter)) {
        le_device_memory_db_t *cur = le_device_db_iter_cur(&iter);
        log_printf("[>i:db]: key:%d addr type:%d\r\n", iter.key, cur->addr_type);
        print_addr(cur->addr);
    }
    return;
}

static void pair_bond_ok(void)
{
    btstack_push_user_msg(USER_MSG_ID_PAIR_BOND_OK, 0, 0);
    return;
}

static uint8_t resolve_fail = 0;
static bd_addr_t PeerAddr;

static void wait_master_clear_pair_info(void)
{
    return;
}

static void sm_packet_handler(uint8_t packet_type, uint16_t channel, const uint8_t *packet, uint16_t size)
{
    uint8_t event = hci_event_packet_get_type(packet);
    uint16_t idx;
    int i;

    if (packet_type != HCI_EVENT_PACKET) {
        return;
    }

    dbg_printf("[>d:sm]: event:0x%x\r\n", event);
    switch (event)
    {
    case SM_EVENT_PRIVATE_RANDOM_ADDR_UPDATE:
        //static uint8_t addr_ready = 0;
        //gap_set_adv_set_random_addr(0, sm_private_random_addr_update_get_address(packet));
        //if (0 == addr_ready) {
        //    addr_ready = 1;
        //    setup_adv();
        //}
        break;
    case SM_EVENT_JUST_WORKS_REQUEST:
        sm_just_works_confirm(sm_event_just_works_request_get_handle(packet));
        break;
    case SM_EVENT_PASSKEY_INPUT_NUMBER: {
        hci_con_handle_t handle = sm_event_passkey_input_number_get_handle(packet);
        uint32_t key2 = 123456;
        log_printf("SM PASSKEY_INPUT: %6d\n", key2);
        sm_passkey_input(handle, key2);
        break;
    }
    case SM_EVENT_PASSKEY_DISPLAY_NUMBER: {
        hci_con_handle_t handle = sm_event_passkey_display_number_get_handle(packet);
        uint32_t key1 = sm_event_passkey_display_number_get_passkey(packet);
        uint32_t key2 = 123456;
        log_printf("SM PASSKEY_DISPLAY: override %6d -> %6d\n", key1, key2);
        sm_passkey_input(handle, key2);
        break;
    }
    case SM_EVENT_PASSKEY_DISPLAY_CANCEL:
        log_printf("SM DISPLAY_CANCEL\n");
        break;

    case SM_EVENT_STATE_CHANGED: {
        const sm_event_state_changed_t *state_changed = decode_hci_event(packet, sm_event_state_changed_t);
        switch (state_changed->reason) {
        case SM_STARTED:
            log_printf("SM STARTED\n");
            break;
        case SM_FINAL_PAIRED:
            log_printf("SM PAIRED\n");
            pair_bond_ok();

            //kv_commit(0);
            for (i = 1; i < 6; i++) {
                if (peer_is_paired(i, PeerAddr) == 0) {
                    break;
                }
            }
            print_addr(PeerAddr);
            sdk_private_data_write_to_flash();
            break;
        case SM_FINAL_REESTABLISHED:
            log_printf("SM REESTABLISHED\n");
            pair_bond_ok();

            break;
        case SM_FINAL_FAIL_TIMEOUT:
            log_printf("SM SM_FINAL_FAIL_TIMEOUT\n");
            break;
        case SM_FINAL_FAIL_DISCONNECT:
            gap_disconnect_in_stack(state_changed->conn_handle);
            log_printf("SM FINAL ERROR: %d %d\n", state_changed->conn_handle, state_changed->reason);
            break;

        case SM_FINAL_FAIL_PROTOCOL:
            log_printf("SM_FINAL_FAIL_PROTOCOL  :  \n");
            platform_set_timer(wait_master_clear_pair_info, 1600);
            break;
        default:
            log_printf("SM default: %d %d\n", state_changed->conn_handle, state_changed->reason);
            break;
        }
        break;
    }
    case SM_EVENT_IDENTITY_RESOLVING_SUCCEEDED:
        log_printf("SM RESOLVING SUCCEEDED\n");

        idx = sm_event_identity_resolving_succeeded_get_le_device_db_index(packet);
        peer_is_paired(idx,PeerAddr);
        log_printf("idx: %d\n",idx);
        print_addr(PeerAddr);
        break;

    case SM_EVENT_IDENTITY_RESOLVING_FAILED: {
        hci_con_handle_t handle = sm_event_identity_resolving_failed_get_handle(packet);
        log_printf("SM RESOLVING FAILED handle = %d  \n",handle);

        //btstack_push_user_msg(USER_MSG_ID_DISCONNECT_DEV, 0, 0);

        break;
    }

    default:
        break;
    }
}

static btstack_packet_callback_registration_t sm_event_callback_registration  = {.callback = &sm_packet_handler};

void pair_bond_connected(const le_meta_event_enh_create_conn_complete_t *conn_complete)
{
    bd_addr_t r_peer_addr;
    resolve_fail = 0;
    if (conn_complete->status == 0) {
        reverse_bd_addr(conn_complete->peer_addr, r_peer_addr);
        log_printf("[>i:peer]: adr type:%d ret=%d\r\n", conn_complete->peer_addr_type, sm_address_resolution_lookup(conn_complete->peer_addr_type, r_peer_addr));
        print_addr(r_peer_addr);
        sm_config_conn(conn_complete->handle, IO_CAPABILITY_NO_INPUT_NO_OUTPUT, SM_AUTHREQ_BONDING);
//        sm_config_conn(conn_complete->handle,
//                       IO_CAPABILITY_NO_INPUT_NO_OUTPUT,
//                       SM_AUTHREQ_BONDING | SM_AUTHREQ_MITM_PROTECTION);
    }
    return;
}

void pair_bond_event_disconnect(const event_disconn_complete_t *cmpl)
{
    if ((cmpl->reason == ERROR_CODE_CONNECTION_TERMINATED_BY_LOCAL_HOST) || (cmpl->reason == 0x3d)) {
        clear_pairing_data();
    }
    return;
}

#define KV_KEY_IR           (KV_USER_KEY_START)

void Reload_Ir(void)
{
    if (kv_get(KV_KEY_IR, NULL) == NULL)
    {
        // init IR
        kv_put(KV_KEY_IR, NULL, sizeof(sm_persistent.ir));
        update_ir();
    }
    else
    {
        memcpy((uint8_t *)sm_persistent.ir, kv_get(KV_KEY_IR, NULL), sizeof(sm_persistent.ir));
    }
}

void update_ir(void)
{
    uint8_t *ir = (uint8_t *)kv_get(KV_KEY_IR, NULL);
    int i;
    for (i = 0; i < sizeof(sm_persistent.ir); i++)
        ir[i] = platform_rand() & 0xff;
    //kv_value_modified();
    memcpy((uint8_t *)sm_persistent.ir, ir, sizeof(sm_persistent.ir));
    //hex_print("IR", sm_persistent.ir, sizeof(sm_persistent.ir));
}



void pair_bond_init(const bd_addr_t addr)
{
    memcpy(sm_persistent.identity_addr, addr, sizeof(sm_persistent.identity_addr));
    sm_add_event_handler(&sm_event_callback_registration);
    sm_config(0, IO_CAPABILITY_NO_INPUT_NO_OUTPUT,
              0,
              &sm_persistent);
    sm_set_authentication_requirements(SM_AUTHREQ_BONDING);
    dbg_printf("addr %02x%02x\r\n", sm_persistent.identity_addr[4], sm_persistent.identity_addr[5]);
    traversing_device_db();

    if (kv_get(KV_KEY_IR, NULL) == NULL)
    {
        // init IR
        kv_put(KV_KEY_IR, NULL, sizeof(sm_persistent.ir));
        update_ir();
    }
    else
    {
        memcpy((uint8_t *)sm_persistent.ir, kv_get(KV_KEY_IR, NULL), sizeof(sm_persistent.ir));
    }
   // hex_print("IR", sm_persistent.ir, sizeof(sm_persistent.ir));
}

void sm_user_msg_handler(uint32_t msg_id, void *data, uint16_t size)
{
}

#if defined __cplusplus
    }
#endif
