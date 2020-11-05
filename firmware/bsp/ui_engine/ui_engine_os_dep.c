/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    UI engine OS dependencies source file
    It's good idea to re-implement next functions in case of using RTOS
    https://brtchip.com/wp-content/uploads/Support/Documentation/Programming_Guides/ICs/EVE/FT81X_Series_Programmer_Guide.pdf
*/


#include "ui_engine_os_dep.h"
#include "misc_hal.h"
#include <stdbool.h>


static volatile bool        ft813_qspi_sync = false;
static volatile uint32_t    ui_engine_sync  = 0;


void ft813_qspi_create_sync(void) {

    ft813_qspi_sync = false;
}

void ft813_qspi_delete_sync(void) {
}

void ft813_qspi_sync_set(void) {

    ft813_qspi_sync = true;
}

void ft813_qspi_sync_set_isr(void) {

    ft813_qspi_sync = true;
}

void ft813_qspi_sync_wait(void) {

    while(!ft813_qspi_sync);
    ft813_qspi_sync = false;
}

void ui_engine_create_sync(void) {

    ui_engine_sync = 0;
}

void ui_engine_delete_sync(void) {
}

void ui_engine_sync_set(uint32_t flags) {

    ui_engine_sync = flags;
}

void ui_engine_sync_set_isr(uint32_t flags) {

    ui_engine_sync = flags;
}

uint32_t ui_engine_sync_wait(uint32_t flags, uint32_t timeout_ms) {

    while(!(ui_engine_sync & flags) && timeout_ms) {
        misc_hal_sleep_ms(1);
        timeout_ms--;
    }
    uint32_t result = ui_engine_sync & flags;
    ui_engine_sync &= ~flags;
    return result;
}
