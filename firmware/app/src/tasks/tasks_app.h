/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Tasks header file
*/

#ifndef __TASKS_APP_H
#define __TASKS_APP_H


#include "app_data_types.h"
#include "task_system.h"
#include "task_rtc_start.h"
#include "task_dsp.h"
#include "task_ui.h"


#define TASK_SYSTEM_NAME                "System"
#define TASK_SYSTEM_PRIO                4
#define TASK_SYSTEM_STACK               256

#define TASK_DSP_NAME                   "DSP"
#define TASK_DSP_PRIO                   3
#define TASK_DSP_STACK                  1024

#define TASK_UI_NAME                    "UI"
#define TASK_UI_PRIO                    1
#define TASK_UI_STACK                   512

#define TASK_RTC_START_NAME             "RTC"
#define TASK_RTC_START_PRIO             0
#define TASK_RTC_START_STACK            256


#endif
