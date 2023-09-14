
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#include "key_board.h"
#include "VR_key.h"
#include "low_power.h"
#include "platform_api.h"
#include "btstack_event.h"

static key_board_map_t *vr_key_map = NULL;

static f_key_pressed_callback        vr_key_pressed_callback = 0;
static f_key_scan_one_cycle_callback vr_key_scan_one_cycle_callback = 0;
static f_key_all_release_callback    vr_key_all_release_callback = 0;

#define KEEP_PRESS_DELAY 20

typedef struct
{
    uint8_t doubleKeyCnt;
    key_code_t first_key_code;
    uint64_t startTime;
} doubleKey_t;

static doubleKey_t doubleKey = {0, 0xff, 0};

static void KB_StateChanged(uint8_t *keyId, uint8_t keyNum)
{
    //log_printf("[>i:kb]: num:%d id0:0x%x\n", keyNum, keyId[0]);
    uint8_t i;
    uint8_t mapSize = vr_key_map->double_key_map_size; //   sizeof(doubleKeyMap) / sizeof(doubleKeyMap[0]);

    if (keyNum == 2) {
        key_code_t key_code_1, key_code_2;
        key_code_1 = vr_key_map->key_map[keyId[0]].key_code;
        key_code_2 = vr_key_map->key_map[keyId[1]].key_code;

        for (i = 0; i < mapSize; i++) {
            if (((vr_key_map->double_key_map[i].key_code1 == key_code_1 && vr_key_map->double_key_map[i].key_code2 == key_code_2) ||
                (vr_key_map->double_key_map[i].key_code2 == key_code_1 && vr_key_map->double_key_map[i].key_code1 == key_code_2)) &&
                (vr_key_map->double_key_map[i].DKHandler != NULL)) {
                goto result;
            }
        }
    }

    if (keyNum != 1) {
        return;
    }

    if (keyId[0] != 0xff) {
        key_code_t key_code_1;

        key_code_1 = vr_key_map->key_map[keyId[0]].key_code;
        log_printf("[>i:key]: id:%d fun:%s\r\n",keyId[0] , vr_key_map->key_map[keyId[0]].intro);
        vr_key_map->single_key_fun(key_code_1);

        doubleKey.doubleKeyCnt++;
        if (doubleKey.doubleKeyCnt >= 2) {
            for (i = 0; i < mapSize; i++) {
                if (((vr_key_map->double_key_map[i].key_code1 == key_code_1 && vr_key_map->double_key_map[i].key_code2 == doubleKey.first_key_code) ||
                    (vr_key_map->double_key_map[i].key_code2 == key_code_1 && vr_key_map->double_key_map[i].key_code1 == doubleKey.first_key_code)) &&
                    (platform_get_us_time() - doubleKey.startTime <= vr_key_map->double_key_map[i].interval) &&
                    (vr_key_map->double_key_map[i].DKHandler != NULL)) {
                    goto result;
                }
            }
        } else {
            doubleKey.first_key_code = key_code_1;
            doubleKey.startTime = platform_get_us_time();
        }
    } else {
        log_printf("[>i:key]: release\r\n");
        vr_key_map->single_key_fun(KEY_RELEASE_CODE);
        doubleKey.doubleKeyCnt = 0;
        doubleKey.first_key_code = 0xff;
        doubleKey.startTime = 0;
    }
    return;
result:
    if (i < mapSize) {
        log_printf("%s\n", vr_key_map->double_key_map[i].intro);
        vr_key_map->double_key_map[i].DKHandler();
    }
}

static void KB_KeepPressed(uint8_t *keyId, uint8_t keyNum)
{
    dbg_printf("[>d:kb]: key id:0x%x\n", keyId);
    uint8_t i;
    uint8_t mapSize = vr_key_map->keep_pressed_key_map_size; //  sizeof(keepPressedKeyMap) / sizeof(keepPressedKeyMap[0]);
    key_code_t key_code_1, key_code_2;
    key_code_1 = vr_key_map->key_map[keyId[0]].key_code;

    if (keyNum == 1 && keyId[1] == 0xff) {
        for (i = 0; i < mapSize; i++) {
            if (vr_key_map->keep_pressed_key_map[i].key_code1 == key_code_1 &&
                vr_key_map->keep_pressed_key_map[i].key_code2 == 0xff) {
                goto result;
            }
        }
    } else if (keyNum == 2) {
        key_code_2 = vr_key_map->key_map[keyId[1]].key_code;
        for (i = 0; i < mapSize; i++) {
            if ((vr_key_map->keep_pressed_key_map[i].key_code1 == key_code_1 && vr_key_map->keep_pressed_key_map[i].key_code2 == key_code_2) ||
                (vr_key_map->keep_pressed_key_map[i].key_code1 == key_code_2 && vr_key_map->keep_pressed_key_map[i].key_code2 == key_code_1)) {
                goto result;
            }
        }
    }
result:
    if (i < mapSize) {
        log_printf("[>i:kb]: %s\n", vr_key_map->keep_pressed_key_map[i].intro);
        if (vr_key_map->keep_pressed_key_map[i].KP_Handler != NULL) {
            vr_key_map->keep_pressed_key_map[i].KP_Handler();
        }
    }
}


static KEYSCAN_Ctx key_ctx = {0};

static uint8_t scan_cycle_keyId[2] = {0xff, 0xff};
static uint8_t scan_cycle_keyNum = 0;
static uint8_t scan_cycle_key_state_changed = 0;

static void KEYSCAN_KeyStateUpdate(void)
{
    static uint32_t pressCnt = 0;
    static uint8_t pressKeyNum = 0;
    static uint8_t pressKeyId[2] = {0xff, 0xff};

    if (scan_cycle_keyNum) {
        KB_StateChanged(scan_cycle_keyId, scan_cycle_keyNum);
        pressKeyId[pressKeyNum] = scan_cycle_keyId[0];
        pressKeyNum ++;
        pressCnt = 0;
    } else {
        if (scan_cycle_key_state_changed) {
            KB_StateChanged(scan_cycle_keyId, 1);
            memset(pressKeyId, 0xff, sizeof(pressKeyId));
            pressKeyNum = 0;
        }
    }

    if (pressKeyNum) {
        pressCnt++;
        if (pressCnt > KEEP_PRESS_DELAY) {
            KB_KeepPressed(pressKeyId, pressKeyNum);
            pressKeyNum = 0;
        }
    }

    return;
}

TaskHandle_t KeyTask_handler;
SemaphoreHandle_t Key_BinarySemaphore;
static void Key_Task(void *pvParameters)
{
    //platform_32k_rc_auto_tune();
    log_printf("[>i:32k]: tune:%x\r\n", platform_calibrate_32k());
    while(1) {

        BaseType_t r = xSemaphoreTake(Key_BinarySemaphore, portMAX_DELAY);
        if (pdTRUE != r) {
            continue;
        }
        KEYSCAN_KeyStateUpdate();
    }
}

static void KEYSCAN_GetKeyNumAndId(void)
{
    uint8_t row, col, keyState;
    uint8_t id;

    scan_cycle_keyNum = 0;
    scan_cycle_key_state_changed = 0;
    memset(scan_cycle_keyId, 0xff, sizeof(scan_cycle_keyId));

    const KEYSCAN_SetStateStruct *keyscan_set = Get_KeyScan_Set();
    for (row = 0; row < keyscan_set->row_num; row++) {
        for (col = 0; col < keyscan_set->col_num; col++) {
            if (key_state_is_changed(row, col)) {
                scan_cycle_key_state_changed = 1;
                keyState = key_current_state(row, col);
                id = key_row_col_to_id(row, col);

                if (keyState) {
                    scan_cycle_keyId[scan_cycle_keyNum] = id;
                    scan_cycle_keyNum++;
                }
            }
        }
    }
    vr_key_scan_one_cycle_callback();
    return;
}

static uint32_t KEYSCAN_cb_isr(void *user_data)
{
    static uint8_t have_key_pressed = 0;
    static uint8_t no_key_pressed_cnt = 0;

    uint32_t key_data;
    uint8_t row = 0;
    uint8_t col = 0;
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;

    while (!KEYSCAN_GetIntStateFifoEmptyRaw()) {
        key_data = KEYSCAN_GetKeyData();
        if (KEYSCAN_KeyDataToRowColIdx(&key_ctx, key_data, &row, &col)) {
            vr_key_pressed_callback(row, col);
            have_key_pressed = 1;
            no_key_pressed_cnt = 0;
        } else {
            if (no_key_pressed_cnt >= 2) {
                return 0;
            }
            no_key_pressed_cnt++;

            if (have_key_pressed == 1) {
                KEYSCAN_GetKeyNumAndId();
                have_key_pressed = 0;
            }

            if (no_key_pressed_cnt == 2) {
                KEYSCAN_GetKeyNumAndId();
                vr_key_all_release_callback();
            }

            xSemaphoreGiveFromISR(Key_BinarySemaphore, &xHigherPriorityTaskWoken);
            portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
        }
    }
    return 0;
}

void KEYSCAN_Setup(const KEYSCAN_SetStateStruct* keyscan_set)
{
    SYSCTRL_SelectKeyScanClk(SYSCTRL_CLK_32k);
    SYSCTRL_ClearClkGateMulti(1 << SYSCTRL_ITEM_APB_KeyScan);
    SYSCTRL_ClearClkGateMulti(1 << SYSCTRL_ITEM_APB_SysCtrl);
    SYSCTRL_ClearClkGateMulti(1 << SYSCTRL_ITEM_APB_PinCtrl);

    KEYSCAN_Initialize(keyscan_set);
    KEYSCAN_InitKeyScanToIdx(keyscan_set, &key_ctx);

    platform_set_irq_callback(PLATFORM_CB_IRQ_KEYSCAN, KEYSCAN_cb_isr, 0);

    return;
}

void VR_key_Init(key_board_map_t               *map,
                 f_key_pressed_callback        pressed_callback,
                 f_key_scan_one_cycle_callback scan_one_cycle_callback,
                 f_key_all_release_callback    all_release_call_back)
{
    if (map == NULL) {
        return;
    }

    vr_key_pressed_callback = pressed_callback;
    vr_key_scan_one_cycle_callback = scan_one_cycle_callback;
    vr_key_all_release_callback = all_release_call_back;

    vr_key_map = map;
    Key_BinarySemaphore = xSemaphoreCreateBinary();

    xTaskCreate((TaskFunction_t)Key_Task,
               "key",
               configMINIMAL_STACK_SIZE,
               NULL,
               (configMAX_PRIORITIES - 1),
               (TaskHandle_t*)&KeyTask_handler);

    return;
}
