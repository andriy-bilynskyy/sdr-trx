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
#include "event_groups.h"
#include "misc_hal.h"
#include <stdint.h>
#include <stdbool.h>


static volatile bool      ft813_qspi_sync     = false;
static SemaphoreHandle_t  ft813_qspi_sync_sem = NULL;
static volatile uint32_t  ui_engine_sync      = 0;
static EventGroupHandle_t ui_engine_sync_flg  = NULL;


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

void ui_engine_create_sync(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        ui_engine_sync_flg = xEventGroupCreate();
    } else {
        ui_engine_sync = 0;
    }
}

void ui_engine_delete_sync(void) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        vEventGroupDelete(ui_engine_sync_flg);
        ui_engine_sync_flg = NULL;
    }
}

void ui_engine_sync_set(uint32_t flags) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        if(ui_engine_sync_flg) {
            (void)xEventGroupSetBits(ui_engine_sync_flg, flags);
        }
    } else {
        ui_engine_sync = flags;
    }
}

void ui_engine_sync_set_isr(uint32_t flags) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        BaseType_t hprio;
        (void)xEventGroupSetBitsFromISR(ui_engine_sync_flg, flags, &hprio);
        portYIELD_FROM_ISR(hprio);
    } else {
        ui_engine_sync = flags;
    }
}

uint32_t ui_engine_sync_wait(uint32_t flags, uint32_t timeout_ms) {

    uint32_t result = 0;
    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        result = xEventGroupWaitBits(ui_engine_sync_flg, flags, pdTRUE, pdFALSE, timeout_ms);
    } else {
        while(!(ui_engine_sync & flags) && timeout_ms) {
            misc_hal_sleep_ms(1);
            timeout_ms--;
        }
        result = ui_engine_sync & flags;
        ui_engine_sync &= ~flags;
    }
    return result;
}
