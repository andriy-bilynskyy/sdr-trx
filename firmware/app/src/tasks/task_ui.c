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

    tasks_app_handle_t * app_hnd = (tasks_app_handle_t *)param;
    (void)Atomic_Increment_u32(&app_hnd->running_tasks_cnt);
    DBG_OUT("ui task started");

    led_start();
    bool ui_ok = ui_engine_start();

    TickType_t wake_time = xTaskGetTickCount();
    widget_t current_widget = widget_main;
    for(; app_hnd->system_ctive;) {

        if(ui_ok) {
            current_widget = current_widget(widget_main);
            if(current_widget == widget_date_time && !rtc_is_inited()) {
                current_widget = widget_date_time_lse_fail;
            }
        } else {
            vTaskDelayUntil(&wake_time, TASK_UI_ERROR_PERIOD_MS);
            led_invert();
        }
    }

    ui_engine_stop();
    led_stop();

    DBG_OUT("ui task stopped");
    (void)Atomic_Decrement_u32(&app_hnd->running_tasks_cnt);

    vTaskDelete(NULL);
}
