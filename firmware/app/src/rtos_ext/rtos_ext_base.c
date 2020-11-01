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
#include <string.h>


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

/******************************************************************************
 * stdlib memory management
 ******************************************************************************/

void * malloc(size_t size) {

    void * result = NULL;
    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        result = pvPortMalloc(size);
    } else {
        critical_err_malloc_failed();
    }
    return result;
}

void * calloc(size_t num, size_t size) {

    void * result = NULL;
    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        result = pvPortMalloc(num * size);
        if(result) {
            memset(result, 0, num * size);
        }
    } else {
        critical_err_malloc_failed();
    }
    return result;
}

void * realloc(void * ptr, size_t new_size) {

    void * result = NULL;
    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        result = pvPortMalloc(new_size);
        if(result) {
            extern UBaseType_t _estack;
            memcpy(result, ptr, ((new_size < (void *)&_estack - ptr) ? new_size : (void *)&_estack - ptr));
            vPortFree(ptr);
        }
    } else {
        critical_err_malloc_failed();
    }
    return result;
}

void free(void * ptr) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        vPortFree(ptr);
    } else {
        assert_param(ptr == NULL);
    }
}
