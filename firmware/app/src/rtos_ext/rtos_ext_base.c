/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    FreeRTOS base application extension
*/


#include "FreeRTOS.h"
#include "task.h"
#include "critical_err.h"


/******************************************************************************
 * Free RTOS hooks
 ******************************************************************************/

void vApplicationStackOverflowHook(TaskHandle_t xTask, char * pcTaskName) {

    (void)xTask;
    critical_err_task_stack_overflowed(pcTaskName);
}

void vApplicationMallocFailedHook(void) {

    critical_err_malloc_failed();
}
