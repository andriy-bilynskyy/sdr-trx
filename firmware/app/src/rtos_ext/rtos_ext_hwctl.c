/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    hwctl BSP FreeRTOS extensions
*/


#include "FreeRTOS.h"
#include "semphr.h"
#include <stdbool.h>


static SemaphoreHandle_t hwctl_lock_mtx = NULL;
static volatile bool     hwctl_sync     = false;
static SemaphoreHandle_t hwctl_sync_sem = NULL;


void hwctl_create_lock(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        if(!hwctl_lock_mtx) {
            taskENTER_CRITICAL();
            if(!hwctl_lock_mtx) {
                hwctl_lock_mtx = xSemaphoreCreateMutex();
            }
            taskEXIT_CRITICAL();
        }
    }
}

void hwctl_delete_lock(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        if(hwctl_lock_mtx) {
            taskENTER_CRITICAL();
            if(hwctl_lock_mtx) {
                vSemaphoreDelete(hwctl_lock_mtx);
                hwctl_lock_mtx = NULL;
            }
            taskEXIT_CRITICAL();
        }
    }
}

void hwctl_lock(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        (void)xSemaphoreTake(hwctl_lock_mtx, portMAX_DELAY);
    }
}

void hwctl_unlock(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        (void)xSemaphoreGive(hwctl_lock_mtx);
    }
}

void hwctl_create_sync(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        hwctl_sync_sem = xSemaphoreCreateBinary();
    } else {
        hwctl_sync = false;
    }
}

void hwctl_delete_sync(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        vSemaphoreDelete(hwctl_sync_sem);
        hwctl_sync_sem = NULL;
    }
}

void hwctl_sync_set_isr(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        BaseType_t hprio;
        (void)xSemaphoreGiveFromISR(hwctl_sync_sem, &hprio);
        portYIELD_FROM_ISR(hprio);
    } else {
        hwctl_sync = true;
    }
}

void hwctl_sync_wait(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        (void)xSemaphoreTake(hwctl_sync_sem, portMAX_DELAY);
    } else {
        while(!hwctl_sync);
        hwctl_sync = false;
    }
}
