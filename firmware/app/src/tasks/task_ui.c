/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Task UI source file
*/


#include "tasks_app.h"
#include "FreeRTOS.h"
#include "task.h"
#include "atomic.h"
#include "debug.h"
#include "led.h"
#include "hwctl.h"
#include "ui_engine.h"
#include "widgets.h"
#include "rtc.h"


#define TASK_UI_ERROR_PERIOD_MS         500


void task_ui(void * param) {

    app_handle_t * app_handle = (app_handle_t *)param;
    (void)Atomic_Increment_u32(&app_handle->running_tasks_cnt);
    DBG_OUT("ui task started");

    led_start();
    bool ui_ok = ui_engine_start();
    if(ui_ok) {
        ui_engine_set_brightness(app_handle->settings->ui_engine_brightness);
    }

    TickType_t wake_time = xTaskGetTickCount();
    for(; app_handle->system_ctive;) {

        if(ui_ok) {
            widget_main(app_handle);
        } else {
            vTaskDelayUntil(&wake_time, TASK_UI_ERROR_PERIOD_MS);
            led_invert();
        }
    }

    ui_engine_stop();
    led_stop();

    DBG_OUT("ui task stopped");
    (void)Atomic_Decrement_u32(&app_handle->running_tasks_cnt);

    vTaskDelete(NULL);
}

void task_ui_notify_low_voltage(void) {

    ui_engine_event_set(WIDGET_EVENT_LOW_BATT);
}

void task_ui_notify_overheat(void) {

    ui_engine_event_set(WIDGET_EVENT_OVER_HEAT);
}

void task_ui_notify_storage_fail(void) {

    ui_engine_event_set(WIDGET_EVENT_STORAGE_FAIL);
}

void task_ui_notify_rtc_fail(void) {

    ui_engine_event_set(WIDGET_EVENT_RTC_FAIL);
}
