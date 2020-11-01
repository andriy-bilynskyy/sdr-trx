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

    tasks_app_handle_t * app_hnd = (tasks_app_handle_t *)param;
    (void)Atomic_Increment_u32(&app_hnd->running_tasks_cnt);
    DBG_OUT("rtc startup task started");

    if(rtc_init()) {
        DBG_OUT("rtc Ok");
    }

    DBG_OUT("rtc startup task stopped");
    (void)Atomic_Decrement_u32(&app_hnd->running_tasks_cnt);
    vTaskDelete(NULL);
}
