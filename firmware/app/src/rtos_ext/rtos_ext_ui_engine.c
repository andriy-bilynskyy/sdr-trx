/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    UI engine BSP FreeRTOS extensions
*/


#include "FreeRTOS.h"
#include "semphr.h"
#include "misc_hal.h"
#include <stdbool.h>


static volatile bool     ft813_qspi_sync     = false;
static SemaphoreHandle_t ft813_qspi_sync_sem = NULL;
static volatile bool     ft813_int_sync      = false;
static SemaphoreHandle_t ft813_int_sync_sem  = NULL;


void ft813_qspi_create_sync(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        ft813_qspi_sync_sem = xSemaphoreCreateBinary();
    } else {
        ft813_qspi_sync = false;
    }
}

void ft813_qspi_delete_sync(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        vSemaphoreDelete(ft813_qspi_sync_sem);
        ft813_qspi_sync_sem = NULL;
    }
}

void ft813_qspi_sync_set(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        (void)xSemaphoreGive(ft813_qspi_sync_sem);
    } else {
        ft813_qspi_sync = true;
    }
}

void ft813_qspi_sync_set_isr(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        BaseType_t hprio;
        (void)xSemaphoreGiveFromISR(ft813_qspi_sync_sem, &hprio);
        portYIELD_FROM_ISR(hprio);
    } else {
        ft813_qspi_sync = true;
    }
}

void ft813_qspi_sync_wait(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        (void)xSemaphoreTake(ft813_qspi_sync_sem, portMAX_DELAY);
    } else {
        while(!ft813_qspi_sync);
        ft813_qspi_sync = false;
    }
}

void ft813_int_create_sync(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        ft813_int_sync_sem = xSemaphoreCreateBinary();
    } else {
        ft813_int_sync = false;
    }
}

void ft813_int_delete_sync(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        vSemaphoreDelete(ft813_int_sync_sem);
        ft813_int_sync_sem = NULL;
    }
}

void ft813_int_sync_set_isr(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        BaseType_t hprio;
        (void)xSemaphoreGiveFromISR(ft813_int_sync_sem, &hprio);
        portYIELD_FROM_ISR(hprio);
    } else {
        ft813_int_sync = true;
    }
}

void ft813_int_sync_wait(uint32_t timeout_ms) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        (void)xSemaphoreTake(ft813_int_sync_sem, timeout_ms);
    } else {
        while(!ft813_int_sync && timeout_ms) {
            misc_hal_sleep_ms(1);
            timeout_ms--;
        }
        ft813_int_sync = false;
    }
}
