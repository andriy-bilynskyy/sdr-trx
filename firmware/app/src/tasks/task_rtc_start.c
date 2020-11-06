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


#include <tasks_app.h>
#include "FreeRTOS.h"
#include "task.h"
#include "atomic.h"
#include "debug.h"
#include "rtc.h"


void task_rtc_start(void * param) {

    app_handle_t * app_handle = (app_handle_t *)param;
    (void)Atomic_Increment_u32(&app_handle->running_tasks_cnt);
    DBG_OUT("rtc startup task started");

    if(!rtc_init()) {
        task_ui_notify_rtc_fail();
        DBG_OUT("rtc failed");
    }

    DBG_OUT("rtc startup task stopped");
    (void)Atomic_Decrement_u32(&app_handle->running_tasks_cnt);
    vTaskDelete(NULL);
}
