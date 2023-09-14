
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include "string.h"

#include "gap.h"
#include "btstack_event.h"

#include "platform_api.h"

#include "mi_rcu_adv.h"
#include "profile.h"
#include "pair_bond.h"
#include "sdk_private_flash_data.h"
#include "key_board.h"

#if defined __cplusplus
    extern "C" {
#endif

//const static uint8_t adv_data[] = {
//    #include "../data/advertising.adv"
//};
const static uint8_t adv_data_pairing[] = {
    #include "../data/advertising_pairing.adv"
};
const static uint8_t adv_data_reconnect[] = {
    #include "../data/advertising_reconnect.adv"
};
const static uint8_t adv_data_prompt[] = {
    #include "../data/advertising_prompt.adv"
};
uint8_t adv_data_power[] = {
    #include "../data/advertising_power.adv"
};
const static uint8_t scan_data[] = {
    #include "../data/scan_response.adv"
};

typedef struct {
    adv_event_properties_t properties;
    uint32_t interval;
    bd_addr_type_t addr_type;
    bd_addr_type_t peer_addr_type;
    uint8_t *peer_addr;
    adv_filter_policy_t adv_filter_policy;
    const uint8_t *adv_data;
    uint8_t adv_data_size;
    const uint8_t *scan_response_data;
    uint8_t scan_response_data_size;
} set_adv_para_t;

static set_adv_para_t adv_para[ADV_MAX_IDLE] = {
    { // ADV_DIRECT_HDC          = 0, // reconnect mode
        .properties = DIRECT_ADV_BIT | CONNECTABLE_ADV_BIT | HIGH_DUTY_CIR_DIR_ADV_BIT | LEGACY_PDU_BIT,
        .interval = 16 * 3, // 16 -> 10ms
        // .addr_type = BD_ADDR_TYPE_LE_RANDOM,
        .addr_type = BD_ADDR_TYPE_LE_PUBLIC, // PUB_ADDR_TEST
        .peer_addr_type = BD_ADDR_TYPE_LE_PUBLIC,
        .peer_addr = NULL ,
        .adv_filter_policy = ADV_FILTER_ALLOW_ALL,
        .adv_data = NULL,
        .adv_data_size = 0,
        .scan_response_data = NULL,
        .scan_response_data_size = 0,
    },
    { // ADV_UNDIRECT_RECONNECT     , // 1 reconncet mode
        .properties = CONNECTABLE_ADV_BIT | SCANNABLE_ADV_BIT | LEGACY_PDU_BIT,
        .interval = 16 * 3,
        // .addr_type = BD_ADDR_TYPE_LE_RANDOM,
        .addr_type = BD_ADDR_TYPE_LE_PUBLIC, // PUB_ADDR_TEST
        .peer_addr_type = BD_ADDR_TYPE_LE_PUBLIC,
        .peer_addr = NULL,
        .adv_filter_policy = ADV_FILTER_ALLOW_ALL,
        .adv_data = adv_data_reconnect,
        .adv_data_size = sizeof(adv_data_reconnect),
        .scan_response_data = scan_data,
        .scan_response_data_size = sizeof(scan_data),
    },
    { // ADV_UNDIRECT_PAIRING       , // 2 pair mode
        .properties = CONNECTABLE_ADV_BIT | SCANNABLE_ADV_BIT | LEGACY_PDU_BIT,
        .interval = 16 * 10,
        // .addr_type = BD_ADDR_TYPE_LE_RANDOM,
        .addr_type = BD_ADDR_TYPE_LE_PUBLIC, // PUB_ADDR_TEST
        .peer_addr_type = BD_ADDR_TYPE_LE_PUBLIC,
        .peer_addr = NULL,
        .adv_filter_policy = ADV_FILTER_ALLOW_ALL,
        .adv_data = adv_data_pairing,
        .adv_data_size = sizeof(adv_data_pairing),
        .scan_response_data = scan_data,
        .scan_response_data_size = sizeof(scan_data),
    },
    { // ADV_UNDIRECT_PROMPT        , // 3 prompt pair mode
        .properties = CONNECTABLE_ADV_BIT | SCANNABLE_ADV_BIT | LEGACY_PDU_BIT,
        .interval = 16 * 3,
        // .addr_type = BD_ADDR_TYPE_LE_RANDOM,
        .addr_type = BD_ADDR_TYPE_LE_PUBLIC, // PUB_ADDR_TEST
        .peer_addr_type = BD_ADDR_TYPE_LE_PUBLIC,
        .peer_addr = NULL,
        .adv_filter_policy = ADV_FILTER_ALLOW_ALL,
        .adv_data = adv_data_prompt,
        .adv_data_size = sizeof(adv_data_prompt),
        .scan_response_data = scan_data,
        .scan_response_data_size = sizeof(scan_data),
    },
    { // ADV_UNDIRECT_POWER         , // 4 power on mode
        .properties = CONNECTABLE_ADV_BIT | SCANNABLE_ADV_BIT | LEGACY_PDU_BIT,
        .interval = 16 * 2,
        .addr_type = BD_ADDR_TYPE_LE_PUBLIC,
        //.addr_type = BD_ADDR_TYPE_LE_RANDOM,
        .peer_addr_type = BD_ADDR_TYPE_LE_PUBLIC,
        .peer_addr = NULL,
        .adv_filter_policy = ADV_FILTER_ALLOW_ALL,
        .adv_data = adv_data_power,
        .adv_data_size = sizeof(adv_data_power),
        .scan_response_data = 0,
        .scan_response_data_size = 0,
    },
};

static ext_adv_set_en_t adv_sets_en[] = { {.handle = 0, .duration = 0, .max_events = 0} };
static bd_addr_t vr_adv_addr;

static BaseType_t xHigherPriorityTaskWoken = pdFALSE;
TimerCallbackFunction_t adv_timer_call_back_fun = NULL;
static uint32_t adv_timer_ms = 1000;
static TimerHandle_t adv_time_out_timer = 0;
static void adv_time_out_callback(TimerHandle_t xTimer)
{
    if (adv_timer_call_back_fun == NULL) {
        return;
    }
    adv_timer_call_back_fun(xTimer);
    return;
}

static void set_adv_in_stack(VR_ADV_TYPE advType)
{
    uint8_t para_index = advType;

    log_printf("[adv]: type%d\r\n", advType);
    if(advType == ADV_DIRECT_HDC)
    {
        log_printf("peer_addr_type = %d \n",g_power_off_save_data_in_ram.peer_addr_type);
        if(g_power_off_save_data_in_ram.peer_addr_type != BD_ADDR_TYPE_LE_PUBLIC)
        {
            adv_para[para_index].peer_addr_type = BD_ADDR_TYPE_LE_RANDOM;
        }
        else
            adv_para[para_index].peer_addr_type = BD_ADDR_TYPE_LE_PUBLIC;//dir_peer_type;
        adv_para[para_index].peer_addr = direct_param.addr;
        printf_hexdump(adv_para[para_index].peer_addr, 6);
    }

    gap_set_ext_adv_enable(0, 0, NULL);
    gap_set_adv_set_random_addr(0, vr_adv_addr);
    gap_set_ext_adv_para(0,
                         adv_para[para_index].properties,
                         adv_para[para_index].interval, adv_para[para_index].interval,
                         PRIMARY_ADV_ALL_CHANNELS,  // Primary_Advertising_Channel_Map
                         adv_para[para_index].addr_type,    // Own_Address_Type
                         adv_para[para_index].peer_addr_type,
                         adv_para[para_index].peer_addr,
                         adv_para[para_index].adv_filter_policy,
                         0x00,                      // Advertising_Tx_Power
                         PHY_1M,                    // Primary_Advertising_PHY
                         0,                         // Secondary_Advertising_Max_Skip
                         PHY_1M,                    // Secondary_Advertising_PHY
                         0x00,                      // Advertising_SID
                         0x00);                     // Scan_Request_Notification_Enable
    gap_set_ext_adv_data(0, adv_para[para_index].adv_data_size, adv_para[para_index].adv_data);
    gap_set_ext_scan_response_data(0, adv_para[para_index].scan_response_data_size, adv_para[para_index].scan_response_data);
    gap_set_ext_adv_enable(1, sizeof(adv_sets_en) / sizeof(adv_sets_en[0]), adv_sets_en);

    if (adv_timer_ms == 0) {
    } else if (adv_time_out_timer == 0) {
        adv_time_out_timer = xTimerCreate("adv time out",
                            pdMS_TO_TICKS(adv_timer_ms),
                            pdFALSE,
                            NULL,
                            adv_time_out_callback);
        xTimerStartFromISR(adv_time_out_timer, &xHigherPriorityTaskWoken);
    } else {
        xTimerStopFromISR(adv_time_out_timer, &xHigherPriorityTaskWoken);
        xTimerChangePeriodFromISR(adv_time_out_timer, pdMS_TO_TICKS(adv_timer_ms), &xHigherPriorityTaskWoken);
        xTimerStartFromISR(adv_time_out_timer, &xHigherPriorityTaskWoken);
    }
    return;
}

static void stop_adv_in_stack(void)
{
    log_printf("[stop adv]:in stack\r\n");
    gap_set_ext_adv_enable(0, 0, NULL);
    return;
}

static VR_ADV_TYPE msg_adv_type = ADV_MAX_IDLE;
static void start_adv(VR_ADV_TYPE adv_type)
{
    msg_adv_type = adv_type;
    btstack_push_user_msg(USER_MSG_ID_START_ADV, &msg_adv_type, sizeof(msg_adv_type));
    return;
}

void vr_start_adv(VR_ADV_TYPE advType, const bd_addr_t addr, uint32_t ms, TimerCallbackFunction_t call_back_fun)
{
    memcpy(vr_adv_addr, addr, sizeof(vr_adv_addr));
    adv_timer_ms = ms;
    adv_timer_call_back_fun = call_back_fun;
    start_adv(advType);
    vr_set_sys_status(VR_STATUS_ADVERTISING);
    return;
}

void vr_stop_adv(void)
{
    btstack_push_user_msg(USER_MSG_ID_STOP_ADV, 0, 0);
    log_printf("[adv]: stop\r\n");
    return;
}

void adv_user_msg_handler(uint32_t msg_id, void *data, uint16_t size)
{
    switch (msg_id) {
    case USER_MSG_ID_START_ADV: {
        VR_ADV_TYPE adv_type = *(VR_ADV_TYPE *)data;
        set_adv_in_stack(adv_type);
        break;
    }
    case USER_MSG_ID_STOP_ADV:
        stop_adv_in_stack();
        break;
    default:
        break;
    }
    return;
}

#if defined __cplusplus
    }
#endif
