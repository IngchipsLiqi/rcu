
#ifndef _PROFILESTASK_H_
#define _PROFILESTASK_H_

#include <stdint.h>

#include "bluetooth.h"

#include "platform_api.h"

// release DEBUG=0 RELEASE_VER=1
#define DEBUG 1
#define RELEASE_VER 0

#ifndef DEBUG
    #warning DEBUG should be defined 0 or 1
    #define DEBUG 0
#endif

#ifndef RELEASE_VER
    #warning RELEASE_VER should be defined 0 or 1
    #define RELEASE_VER 1
#endif

#if (DEBUG == 0)
    #define dbg_printf(...)
    #define debug_out(...)
#else
    #define dbg_printf(...) platform_printf(__VA_ARGS__)
    #define debug_out(...) platform_printf(__VA_ARGS__)
#endif

#if (RELEASE_VER == 1)
    #define log_printf(...)
#else
    #define log_printf(...) platform_printf(__VA_ARGS__)
#endif

#define INVALID_HANDLE 0xFFFF

#define OVER_SAMPLING        1                      // must be 2^n
#define OVER_SAMPLING_MASK   (OVER_SAMPLING - 1)

#define RCU_HARDWARE_VERSION_INGCHIPS_1P3    0xA1
#define RCU_HARDWARE_VERSION_4617_A_1P0      0xA2
#define RCU_HARDWARE_VERSION_4617_C_1P0      0xA3
#define RCU_HARDWARE_VERSION_PENG_C_1P0      0xA4

#define RCU_HARDWARE_VERSION                 RCU_HARDWARE_VERSION_PENG_C_1P0

#if (RCU_HARDWARE_VERSION == RCU_HARDWARE_VERSION_INGCHIPS_1P3)
#elif (RCU_HARDWARE_VERSION == RCU_HARDWARE_VERSION_4617_A_1P0)
#elif (RCU_HARDWARE_VERSION == RCU_HARDWARE_VERSION_4617_C_1P0)
#define LED_NUM_MAX                      0x01
#define LED_ON_LEVEL                     0
#define LED_OFF_LEVEL                    1

#define LED_RED                          GIO_GPIO_20
#define LED_GREEN                        GIO_GPIO_26

#define IR_POWER_PORT                    GIO_GPIO_27
#define PWM_PIN                          GIO_GPIO_6

#define MIC_POWER_PIN                    GIO_GPIO_18

#define KEYBOARD_ROW_0                   GIO_GPIO_9
#define KEYBOARD_ROW_1                   GIO_GPIO_5
#define KEYBOARD_ROW_2                   GIO_GPIO_23
#define KEYBOARD_ROW_3                   GIO_GPIO_36
#define KEYBOARD_ROW_4                   GIO_GPIO_21
#define KEYBOARD_ROW_5                   GIO_GPIO_22
#define KEYBOARD_ROW_NUM                 6

#define KEYBOARD_COL_0                   GIO_GPIO_10
#define KEYBOARD_COL_1                   GIO_GPIO_14
#define KEYBOARD_COL_2                   GIO_GPIO_13
#define KEYBOARD_COL_3                   GIO_GPIO_12
#define KEYBOARD_COL_4                   GIO_GPIO_11
#define KEYBOARD_COL_5                   GIO_GPIO_31
#define KEYBOARD_COL_6                   GIO_GPIO_35
#define KEYBOARD_COL_7                   GIO_GPIO_15
#define KEYBOARD_COL_NUM                 8

#define KEY_FACTORY_TEST                 KEY_MEDIA_BACK
#define KEY_RELEASE_CODE                 0x0000

#define SAMPLE_BUF_16BIT_LEN       120
#define SAMPLE_BUF_8BIT_LEN        (SAMPLE_BUF_16BIT_LEN * 2)
#define SAMPLE_BUF_CNT             2

#define MSBC_FRAME_OUTPUT_LEN      57
#define VOICE_BLE_SEND_BLOCK_SIZE  60
#define VOICE_BUF_BLOCK_NUM        5

#define RAW_16K_16BIT_DATA_POSITION  0x2045000
#define PRIVATE_FLASH_DATA_START_ADD 0x2041000
#define DB_FLASH_ADDRESS             0x2042000
#define PRIVATE_FlASH_DATA_IS_INIT   0xA55A0201
#define COM_PORT_DEFAULT_BAUD_RATE   115200

#define AUDIO_DENOISE_HOP_LEN    128
#define AUDIO_DENOISE

#define AUDIO_TEST
#elif (RCU_HARDWARE_VERSION == RCU_HARDWARE_VERSION_PENG_C_1P0)
//#define LED_NUM_MAX                      0x01
//#define LED_ON_LEVEL                     0
//#define LED_OFF_LEVEL                    1

//#define LED_RED                          GIO_GPIO_20
//#define LED_GREEN                        GIO_GPIO_26

//#define IR_POWER_PORT                    GIO_GPIO_27
//#define PWM_PIN                          GIO_GPIO_6

#define MIC_POWER_PIN                    GIO_GPIO_3
#define IR_TX_PIN                        GIO_GPIO_28
#define IR_RX_PIN                        GIO_GPIO_28

#define KEYBOARD_ROW_0                   GIO_GPIO_5
#define KEYBOARD_ROW_1                   GIO_GPIO_6
#define KEYBOARD_ROW_2                   GIO_GPIO_9
#define KEYBOARD_ROW_3                   GIO_GPIO_10
#define KEYBOARD_OUT_ROW_0               KEY_OUT_ROW_5
#define KEYBOARD_OUT_ROW_1               KEY_OUT_ROW_6
#define KEYBOARD_OUT_ROW_2               KEY_OUT_ROW_9
#define KEYBOARD_OUT_ROW_3               KEY_OUT_ROW_10
#define KEYBOARD_ROW_NUM                 4

#define KEYBOARD_COL_0                   GIO_GPIO_4
#define KEYBOARD_COL_1                   GIO_GPIO_16
#define KEYBOARD_COL_2                   GIO_GPIO_17
#define KEYBOARD_IN_COL_0                KEY_IN_COL_4
#define KEYBOARD_IN_COL_1                KEY_IN_COL_16
#define KEYBOARD_IN_COL_2                KEY_IN_COL_17
#define KEYBOARD_COL_NUM                 3

#define KEY_FACTORY_TEST                 KEY_MEDIA_BACK
#define KEY_RELEASE_CODE                 0x0000

#define SAMPLE_BUF_16BIT_LEN       120
#define SAMPLE_BUF_8BIT_LEN        (SAMPLE_BUF_16BIT_LEN * 2)
#define SAMPLE_BUF_CNT             2

#define MSBC_FRAME_OUTPUT_LEN      57
#define VOICE_BLE_SEND_BLOCK_SIZE  60
#define VOICE_BUF_BLOCK_NUM        5

#define RAW_16K_16BIT_DATA_POSITION  0x2045000
#define PRIVATE_FLASH_DATA_START_ADD 0x2041000
#define DB_FLASH_ADDRESS             0x2042000
#define PRIVATE_FlASH_DATA_IS_INIT   0xA55A0201
#define COM_PORT_DEFAULT_BAUD_RATE   115200

#define AUDIO_DENOISE_HOP_LEN    128
#define AUDIO_DENOISE

#define AUDIO_TEST
#define PUB_ADDR_TEST
#endif

uint32_t setup_profile(void *data, void *user_data);

#define INPUT_REPORT_KEYS_MAX   6
#pragma pack (push, 1)
typedef struct
{
    uint8_t modifier;
    uint8_t reserved;
    uint8_t codes[INPUT_REPORT_KEYS_MAX];
} mi_rcu_kb_report_t;

typedef enum {
    USER_MSG_ID_PROFILE                               = 0x90,
    USER_MSG_ID_INPUT_HW_KEYS                               ,
    USER_MSG_ID_UPDATE_CON_PARAMETERS                       ,
    USER_MSG_ID_STOP_CONNECTION                             ,
    USER_MSG_ID_PAIR_BOND_OK                                ,
    USER_MSG_ID_TEST_MODE_CONTINUOUS_WAVE                   ,
    USER_MSG_ID_DISCONNECT_DEV                              ,
    USER_MSG_ID_PROFILE_END                                 ,

    USER_MSG_ID_ADV                                   = 0xA0,
    USER_MSG_ID_START_ADV                                   ,
    USER_MSG_ID_STOP_ADV                                    ,
    USER_MSG_ID_ADV_END                                     ,

    USER_MSG_ID_HID                                   = 0xB0,
    USER_MSG_ID_GOOGLE_KEY_REPORT                           ,
    USER_MSG_ID_HID_END                                     ,

    USER_MSG_ID_AUDIO                                 = 0xC0,
    ATV_USER_MSG_ID_MIC_CHAR_CTL_AUDIO_STOP                 ,
    ATV_USER_MSG_ID_MIC_CHAR_CTL_AUDIO_START                ,
    ATV_USER_MSG_ID_MIC_CHAR_CTL_SEARCH                     ,
    ATV_USER_MSG_ID_MIC_CHAR_CTL_SYNC                       ,
    ATV_USER_MSG_ID_MIC_CHAR_CTL_CAPS_RESP                  ,
    ATV_USER_MSG_ID_MIC_CHAR_CTL_MIC_OPEN_ERROR             ,
    ATV_USER_MSG_ID_MIC_CHAR_CTL_DPAD_SELECT                ,
    USER_MSG_ID_REQUEST_SEND_AUDIO                          ,
    USER_MSG_ID_AUDIO_END                                   ,

    USER_MSG_ID_BATTERY                               = 0xD0,
    USER_MSG_ID_BATTERY_ADC                                 ,
    USER_MSG_ID_BATTERY_RESERVE                             ,
    USER_MSG_ID_BATTERY_END                                 ,

    USER_MSG_ID_SM                                    = 0xE0,
    USER_MSG_ID_SM_END                                      ,

    USER_MSG_ID_INGCHIPS_VOICE                        = 0xF0,
    USER_MSG_ID_INGCHIPS_VOICE_REQUEST_SEND                 ,
    USER_MSG_ID_INGCHIPS_VOICE_END                          ,

    USER_MSG_ID_MI_RCU                               = 0x100,
    USER_MSG_ID_MI_RCU_VOICE_START_REQUEST                  ,
    USER_MSG_ID_MI_RCU_VOICE_STOP_REQUEST                   ,
    USER_MSG_ID_MI_RCU_VOICE_REQUEST_SEND_DATA              ,
    USER_MSG_ID_MI_RCU_KEY_REPORT_SEND                      ,
    USER_MSG_ID_MI_RCU_END                                  ,

    USER_MSG_ID_MAX,
} user_msg_id_all_t;

// VR status
typedef enum {
    VR_STATUS_ADVERTISING,              // 0
    VR_STATUS_STOP_ADVERTISING,         // 1
    VR_STATUS_CONNECTED_PAIRING,        // 2
    VR_STATUS_PAIRED,                   // 3
    VR_STATUS_DISCONNECTING,            // 4
    VR_STATUS_VOICE,                    // 5
    VR_STATUS_BATTERY_LOW,              // 6
    VR_STATUS_FACTORY_TEST_SINGLE_WAVE, // 7

//    VR_STATUS_IDLE,
//    VR_STATUS_PAIRED,
//    VR_STATUS_LOW_POWER,
    VR_STATUS_INI,
} VOICE_REMORER_STATUS;

typedef enum {
    ADV_DIRECT_HDC          = 0, //
    ADV_UNDIRECT_RECONNECT     , // 1 reconncet mode
    ADV_UNDIRECT_PAIRING       , // 2 pair mode
    ADV_UNDIRECT_PROMPT        , // 3 prompt pair mode
    ADV_UNDIRECT_POWER         , // 4 power on mode
    ADV_MAX_IDLE               ,
} VR_ADV_TYPE;

typedef void (*f_bt_send_data)(void);
extern f_bt_send_data g_fun_bt_send_data;
void gap_disconnect_in_stack(hci_con_handle_t handle);
void update_connection_parameter(void);

void print_addr(const uint8_t *addr);
void print_data(const uint8_t *data, uint16_t data_len);
void adv_start(void);

#pragma pack (pop)

#endif
