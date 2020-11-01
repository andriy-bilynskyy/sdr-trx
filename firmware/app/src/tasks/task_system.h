/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Task system header file
*/

#ifndef __TASK_SYSTEM_H
#define __TASK_SYSTEM_H

#include <stdbool.h>
#include <stdint.h>


typedef struct {
    bool        system_ctive;
    uint32_t    running_tasks_cnt;
} tasks_app_handle_t;


void task_system(void * param);


#endif
