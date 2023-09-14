

#include "att_db.h"
#include "platform_api.h"
#include "btstack_event.h"

#include "app_cfg.h"
#include "VR_battery.h"

#include "peripheral_adc.h"
#include "projdefs.h"
#include "semphr.h"

#include "att_db_util.h"
#include "sig_uuid.h"
#include "main.h"
#include "key_board.h"

#define BATTERY_ADC_BASE_TIME                1000 /*1000 indicate 1 s*/
#define BATTERY_ADC_SAMPLE_PERIOD           BATTERY_ADC_BASE_TIME * 30

#define INVALID_HANDLE  (0xffff)
static hci_con_handle_t battery_con_handle = INVALID_HANDLE;
extern uint16_t att_handle_battery;

battery_param_t battery_param = {0};

#define BATTERY_POOR_VOLTAGE 1800
const static uint16_t battery_and_level[][2] =
{
    {3000, 100},
    {2800, 90 },
    {2600, 70 },
    {2400, 40 },
    {2200, 10 },
};
const static uint16_t battery_and_level_size = sizeof(battery_and_level) / sizeof(battery_and_level[0]);

/*缺少电池波动的时候的处理*/
static void Battery_LevelHandler(uint16_t bat_v)
{
    uint8_t index = 0;

    battery_param.battery_level = 0;
    for(index = 0; index < battery_and_level_size; index++) {
        if(bat_v > battery_and_level[index][0]) {
            battery_param.battery_level = battery_and_level[index][1];
            break;
        }
    }

    if (battery_param.battery_level == 0) {
        vr_set_sys_status(VR_STATUS_BATTERY_LOW);
    }

    if (battery_con_handle != INVALID_HANDLE) {
        log_printf("[bat]: lev:%d/%d\r\n", battery_param.battery_level, battery_and_level_size);
        att_server_notify(battery_con_handle, att_handle_battery, (uint8_t*)&(battery_param.battery_level), sizeof(battery_param.battery_level));
    }
    return;
}

void battery_user_msg_handler(uint32_t msg_id, void *data, uint16_t size)
{
    switch (msg_id)
    {
    case USER_MSG_ID_BATTERY_ADC:
    {
        uint16_t batt_value = *(uint16_t *)data;
        dbg_printf("[bat]: value = %d\n",batt_value);
        Battery_LevelHandler(batt_value);
        break;
    }
    default:
        break;
    }
    return;
}

void battery_event_connected(const le_meta_event_enh_create_conn_complete_t *cmpl)
{
    battery_con_handle = cmpl->handle;
    return;
}

void battery_event_disconnect(const event_disconn_complete_t *cmpl)
{
    battery_con_handle = INVALID_HANDLE;
    return;
}

#define VREF12_ADC_IN    ADC_CH_9
static uint8_t adc_pga_en = 1;
static uint8_t trig_int_num = 10;
static uint8_t dma_trig_num = 0;
static uint16_t battery_voltage_mv = 0;
static uint32_t battery_adc_cb_isr(void *user_data)
{
    uint32_t data;
    SADC_channelId channel;
    uint32_t sample;

    uint32_t sum = 0;
    uint32_t sample_max = 0;
    uint32_t sample_min = 0x3FFF;
    uint32_t sample_cnt = 0;

    //ADC_AdcClose();
    ADC_Start(0);

    while (!ADC_GetFifoEmpty()) {
        data = ADC_PopFifoData();
        channel = ADC_GetDataChannel(data);
        sample = ADC_GetData(data);

        if (channel != VREF12_ADC_IN) {
            continue;
        }

        sum += sample;
        sample_cnt++;
        if (sample > sample_max) {
            sample_max = sample;
        }
        if (sample < sample_min) {
            sample_min = sample;
        }
        //log_printf("[adc]: ch:%d data:%d(0.%04d)\r\n", channel, sample, sample * 10000 / 0x3FFF);
    }

    if (sample_cnt > 2) {
        sample = ((sum - sample_max - sample_min) / (sample_cnt - 2));
        battery_voltage_mv = ((0x3FFF * 1200) / sample); // * 3233 / 3315;
        log_printf("[adc]: vrefp:%dmv cnt:%d\r\n", battery_voltage_mv, sample_cnt);
        if (battery_voltage_mv < BATTERY_POOR_VOLTAGE) {
            log_printf("[bat]: poor!\r\n*****************");
            platform_shutdown(0, 0, 0);
        }
        btstack_push_user_msg(USER_MSG_ID_BATTERY_ADC, &battery_voltage_mv, sizeof(battery_voltage_mv));
    }
    //float voltage = ADC_GetVol(sample);
    return 0;
}

void battery_setup_peripherals_adc_continues(void)
{
    static uint8_t adc_is_calibrated = 0;
    SYSCTRL_ClearClkGate(SYSCTRL_ITEM_APB_ADC);
    SYSCTRL_SetAdcClkDiv(24 / ADC_CLK_MHZ);
    SYSCTRL_ReleaseBlock(SYSCTRL_ITEM_APB_ADC);

    ADC_Reset();
    dbg_printf("[bat]: ft\n");
    ADC_ftInit();
//extern SADC_ftCali_t *ftCali;
//    dbg_printf("[adc]: vp:%d v12:%d\r\n", ftCali->Vp, ftCali->V12Data);
//    while (1) {};

    if (adc_is_calibrated == 0) {
        adc_is_calibrated = 1;
        dbg_printf("[bat]: calib\n");
        ADC_Calibration(SINGLE_END_MODE);
        dbg_printf("[bat]: ref calib\n");
        ADC_VrefCalibration();      // calibrate the referenced voltage
    }

    ADC_ConvCfg(CONTINUES_MODE, PGA_PARA_2, adc_pga_en, VREF12_ADC_IN, trig_int_num, dma_trig_num, SINGLE_END_MODE, 0);
    //ADC_EnableChannel(ADC_CH_0, 1);
    //ADC_EnableChannel(ADC_CHANNEL_NTC, 1);
    //ADC_EnableChannel(ADC_CHANNEL_V12, 1);

    //platform_set_irq_callback(PLATFORM_CB_IRQ_SADC, battery_adc_cb_isr, 0);
    ADC_Start(1);

    dbg_printf("[bat]: adc sample\n");
    while (!ADC_GetIntStatus());
    dbg_printf("[bat]: sample end\n");
    battery_adc_cb_isr(0);
    return;
}

static TimerHandle_t battery_adc_sample_timer = 0;

static void battery_adc_sample_timer_callback(TimerHandle_t xTimer)
{
    VOICE_REMORER_STATUS status = vr_get_sys_status();
    log_printf("[bat]: status%d\r\n", status);
    if (status == VR_STATUS_VOICE) {
        return;
    }
    battery_setup_peripherals_adc_continues();
}

void battery_task_init(void)
{
    battery_adc_sample_timer = xTimerCreate("adc sample timer",
                                            pdMS_TO_TICKS(BATTERY_ADC_SAMPLE_PERIOD),
                                            pdTRUE,
                                            NULL,
                                            battery_adc_sample_timer_callback);
    xTimerStart(battery_adc_sample_timer, portMAX_DELAY);
}


void bettery_service_init(void)
{
    uint8_t level = 98;
    level = battery_param.battery_level;
    att_db_util_add_service_uuid16(SIG_UUID_SERVICE_BATTERY_SERVICE);
    att_handle_battery = att_db_util_add_characteristic_uuid16(SIG_UUID_CHARACT_BATTERY_LEVEL,
        ATT_PROPERTY_READ | ATT_PROPERTY_NOTIFY | ATT_PROPERTY_DYNAMIC, &level, 1);
}

////#define BATTERY_TEST                        0
//#define BATTERYH_ADC_time                    BATTERY_ADC_BASE_TIME * 10
//#define BATTERY_ADC_INTERVAL                BATTERY_ADC_BASE_TIME * 60 * 5

//extern void Audio_AdcRecofig(void);
//void Battery_AdcReconfig(void);


//TimerHandle_t battery_adctimer = 0;
//TimerHandle_t start_adctimer = 0;
//uint16_t battery_raw_value = 0;

//#define BAT_ADC_CHANNEL    ADC_CH_10

//static void Battery_ADCCallback(TimerHandle_t xTimer)
//{
//    dbg_printf(" Battery_ADCCallback STATUS = %d  \n", GetAudioWorkStatus());
//    if(GetAudioWorkStatus() == 0)
//    {
//        Battery_AdcReconfig();
//    }

//}


//#if BATTERY_TEST
//uint16_t battery_level_test = 3200;
//#endif

//#if BAT_UTILity_BY_TASK
//static void Battery_Task(void *pvParameters)
//{
//    uint16_t batt_value = 0;
//    while(1)
//    {
//        BaseType_t r = xSemaphoreTake(Battery_BinarySemaphore, portMAX_DELAY);
//        if(r == pdTRUE)
//        {
//            batt_value = battery_raw_value >> 2;
//            battery_raw_value = 0;

//            dbg_printf("Battery_Task batt_value = %d  \n",batt_value);
//        #if BATTERY_TEST
//            battery_level_test = battery_level_test - 100;
//            Battery_LevelHandler(battery_level_test);
//            if(battery_level_test == 2000)
//                battery_level_test = 3200;
//        #else
//            //Battery_LevelHandler(batt_value);
//            battery_param.process_handle(batt_value);

//        #endif
//        }
//    }
//}
//#endif

//static uint32_t ADC_cb_isr(void *user_data)
//{
//#if BAT_UTILity_BY_TASK
//    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
//#endif

//    if (channel == BAT_ADC_CHANNEL) {
//        uint16_t sample = ADC_GetData(data);
//        float voltage = ADC_GetVol(sample);
//        battery_raw_value = battery_raw_value + (uint16_t)(voltage * 1000);
//        battery_param.adc_counter ++;

//    }
//    else
//        return 0;

//    ADC_Start(0);

//    if(battery_param.adc_counter < 4)
//    {
//        ADC_Start(1);
//    }
//    else
//    {
//        battery_param.adc_counter = 0;
//#if BAT_UTILity_BY_TASK
//        xSemaphoreGiveFromISR(Battery_BinarySemaphore, &xHigherPriorityTaskWoken);
//        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
//#else
//        btstack_push_user_msg(USER_MSG_ID_BATTERY_ADC, NULL, battery_raw_value);
//        battery_raw_value = 0;

//#endif
//    }
//    return 0;
//}


//static void battery_adc_init(void)
//{
//    SYSCTRL_ClearClkGate(SYSCTRL_ITEM_APB_ADC);

//    SYSCTRL_SetAdcClkDiv(24 / ADC_CLK_MHZ);
//    SYSCTRL_ReleaseBlock(SYSCTRL_ITEM_APB_ADC);
//    ADC_Reset();
//    ADC_ftInit();
//    ADC_Calibration(SINGLE_END_MODE);
//    ADC_VrefCalibration();      // calibrate the referenced voltage
//    ADC_ConvCfg(SINGLE_MODE, PGA_GAIN_4, 1, BAT_ADC_CHANNEL, 1, 0, SINGLE_END_MODE, 0);
//    platform_set_irq_callback(PLATFORM_CB_IRQ_SADC, ADC_cb_isr, 0);
//    ADC_Start(1);
//}

//void Battery_AdcReconfig(void)
//{
//    ADC_DisableAllChannels();
//    ADC_ConvCfg(SINGLE_MODE, PGA_GAIN_4, 1, BAT_ADC_CHANNEL, 1, 0, SINGLE_END_MODE, 0);
//    platform_set_irq_callback(PLATFORM_CB_IRQ_SADC, ADC_cb_isr, 0);
//    ADC_Start(1);
//}



//void Battery_Init(void)
//{
//#if BAT_UTILity_BY_TASK
//    Battery_BinarySemaphore = xSemaphoreCreateBinary();

////    xTaskCreate((TaskFunction_t)Battery_Task,
////           "Led",
////           128,
////           NULL,
////           1,
////           (TaskHandle_t*)&BatteryTask_handler);
//#endif

//    battery_adctimer = xTimerCreate("battery_adctimer",
//                                            pdMS_TO_TICKS(BATTERYH_ADC_time),
//                                            pdTRUE,
//                                            NULL,
//                                            Battery_ADCCallback);
//    start_adctimer = xTimerCreate("start_adctimer",
//                                            pdMS_TO_TICKS(BATTERY_ADC_INTERVAL),
//                                            pdTRUE,
//                                            NULL,
//                                            Battery_ADCCallback);

//    xTimerStart(battery_adctimer, portMAX_DELAY);

//    battery_param.process_handle = Battery_LevelHandler;

//    if(GetAudioWorkStatus() == 0) /* it indicate audio dont busy */
//        battery_adc_init();

//}

