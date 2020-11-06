/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Task UI header file
*/

#ifndef __TASK_UI_H
#define __TASK_UI_H


void task_ui(void * param);
void task_ui_notify_low_voltage(void);
void task_ui_notify_overheat(void);
void task_ui_notify_storage_fail(void);
void task_ui_notify_rtc_fail(void);


#endif
