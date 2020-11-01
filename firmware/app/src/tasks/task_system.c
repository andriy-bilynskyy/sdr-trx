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


#define TASK_SYSTEM_PERIOD_MS       1000
#define TASK_SYSTEM_JOIN_MS         5


static volatile tasks_app_handle_t app_hnd = {
    .system_ctive = true,
    .running_tasks_cnt = 0
};


void task_system(void * param) {

    (void)param;
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

    (void)xTaskCreate(task_rtc_start, TASK_RTC_START_NAME, TASK_RTC_START_STACK, (void *)&app_hnd, TASK_RTC_START_PRIO, NULL);
    (void)xTaskCreate(task_ui,        TASK_UI_NAME,        TASK_UI_STACK,        (void *)&app_hnd, TASK_UI_PRIO,        NULL);

    TickType_t wake_time = xTaskGetTickCount();
    for(; app_hnd.system_ctive;) {

        vTaskDelayUntil(&wake_time, TASK_SYSTEM_PERIOD_MS);
        critical_err_stack_check();
    }

    for(; app_hnd.running_tasks_cnt ;) {
        vTaskDelay(TASK_SYSTEM_JOIN_MS);
    }

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
