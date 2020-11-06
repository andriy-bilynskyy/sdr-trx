/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Task system source file
*/


#include "tasks_app.h"
#include "FreeRTOS.h"
#include "task.h"
#include "debug.h"
#include "stm32f4xx_conf.h"
#include "critical_err.h"
#include "hwctl.h"
#include "trxctl.h"
#include "adc.h"
#include "i2c_master.h"
#include "app_data.h"


#define TASK_SYSTEM_PERIOD_MS                     1000
#define TASK_SYSTEM_JOIN_MS                       50
#define TASK_SYSTEM_NOTIFY_LO_VOLTAGE_MS          (5UL * 60 * 1000)
#define TASK_SYSTEM_NOTIFY_HIGH_TEMPERATURE_MS    (1UL * 60 * 1000)


void task_system(void * param) {

    app_handle_t * app_handle = (app_handle_t *)param;
    DBG_OUT("system task started");

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1 | RCC_AHB1Periph_DMA2, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_BKPSRAM, ENABLE);
    RCC_AHB1PeriphClockCmd( RCC_AHB1Periph_GPIOA |
                            RCC_AHB1Periph_GPIOB |
                            RCC_AHB1Periph_GPIOC |
                            RCC_AHB1Periph_GPIOD, ENABLE);
    hwctl_start();
    trxctl_start();
    adc_start();
    i2c_master_start();

    if(!app_settings_load()) {
        task_ui_notify_storage_fail();
    }

    (void)xTaskCreate(task_rtc_start, TASK_RTC_START_NAME, TASK_RTC_START_STACK, param, TASK_RTC_START_PRIO, NULL);
    (void)xTaskCreate(task_dsp,       TASK_DSP_NAME,       TASK_DSP_STACK,       param, TASK_DSP_PRIO,       NULL);
    (void)xTaskCreate(task_ui,        TASK_UI_NAME,        TASK_UI_STACK,        param, TASK_UI_PRIO,        NULL);

    TickType_t wake_time = xTaskGetTickCount();

    bool       low_voltage_warn           = false;
    TickType_t low_voltage_warn_time      = xTaskGetTickCount();

    bool       high_temperature_warn      = false;
    TickType_t high_temperature_warn_time = xTaskGetTickCount();

    for(; app_handle->system_ctive;) {

        vTaskDelayUntil(&wake_time, TASK_SYSTEM_PERIOD_MS);

        critical_err_stack_check();

        if(adc_batt_voltage_value() < adc_batt_lo_voltage_warn_value) {
            if(!low_voltage_warn || (xTaskGetTickCount() - low_voltage_warn_time > TASK_SYSTEM_NOTIFY_LO_VOLTAGE_MS)) {
                low_voltage_warn_time = xTaskGetTickCount();
                task_ui_notify_low_voltage();
            }
            low_voltage_warn = true;
        } else {
            low_voltage_warn = false;
        }

        if(adc_temperature1_value() < adc_temperature_high_warn_value || adc_temperature2_value() < adc_temperature_high_warn_value) {
            if(!high_temperature_warn || (xTaskGetTickCount() - high_temperature_warn_time > TASK_SYSTEM_NOTIFY_HIGH_TEMPERATURE_MS)) {
                high_temperature_warn_time = xTaskGetTickCount();
                task_ui_notify_overheat();
            }
            high_temperature_warn = true;
        } else {
            high_temperature_warn = false;
        }
    }

    for(; app_handle->running_tasks_cnt ;) {
        vTaskDelay(TASK_SYSTEM_JOIN_MS);
    }

    (void)app_setting_save();

    i2c_master_stop();
    adc_stop();
    trxctl_stop();
    hwctl_stop();
    RCC_AHB1PeriphClockCmd( RCC_AHB1Periph_GPIOA |
                            RCC_AHB1Periph_GPIOB |
                            RCC_AHB1Periph_GPIOC |
                            RCC_AHB1Periph_GPIOD, DISABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_BKPSRAM, DISABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1 | RCC_AHB1Periph_DMA2, DISABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, DISABLE);

    DBG_OUT("system task stopped");

    vTaskDelete(NULL);
}
