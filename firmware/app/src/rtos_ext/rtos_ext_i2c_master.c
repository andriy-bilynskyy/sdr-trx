/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    i2c master FreeRTOS application extension
*/


#include "FreeRTOS.h"
#include "semphr.h"
#include <stdbool.h>


static SemaphoreHandle_t i2c_master_lock_mtx = NULL;
static volatile bool     i2c_master_sync     = false;
static SemaphoreHandle_t i2c_master_sync_sem = NULL;


void i2c_master_create_lock(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        if(!i2c_master_lock_mtx) {
            taskENTER_CRITICAL();
            if(!i2c_master_lock_mtx) {
                i2c_master_lock_mtx = xSemaphoreCreateMutex();
            }
            taskEXIT_CRITICAL();
        }
    }
}

void i2c_master_delete_lock(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        if(i2c_master_lock_mtx) {
            taskENTER_CRITICAL();
            if(i2c_master_lock_mtx) {
                vSemaphoreDelete(i2c_master_lock_mtx);
                i2c_master_lock_mtx = NULL;
            }
            taskEXIT_CRITICAL();
        }
    }
}

void i2c_master_lock(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        (void)xSemaphoreTake(i2c_master_lock_mtx, portMAX_DELAY);
    }
}

void i2c_master_unlock(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        (void)xSemaphoreGive(i2c_master_lock_mtx);
    }
}

void i2c_master_create_sync(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        i2c_master_sync_sem = xSemaphoreCreateBinary();
    } else {
        i2c_master_sync = false;
    }
}

void i2c_master_delete_sync(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        vSemaphoreDelete(i2c_master_sync_sem);
        i2c_master_sync_sem = NULL;
    }
}

void i2c_master_sync_set_isr(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        BaseType_t hprio;
        (void)xSemaphoreGiveFromISR(i2c_master_sync_sem, &hprio);
        portYIELD_FROM_ISR(hprio);
    } else {
        i2c_master_sync = true;
    }
}

void i2c_master_sync_wait(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        (void)xSemaphoreTake(i2c_master_sync_sem, portMAX_DELAY);
    } else {
        while(!i2c_master_sync);
        i2c_master_sync = false;
    }
}
