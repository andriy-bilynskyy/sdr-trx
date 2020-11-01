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


static volatile bool ft813_qspi_sync = false;
static volatile bool ft813_int_sync  = false;


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

void ft813_int_create_sync(void) {

    ft813_int_sync = false;
}

void ft813_int_delete_sync(void) {
}

void ft813_int_sync_set_isr(void) {

    ft813_int_sync = true;
}

void ft813_int_sync_wait(uint32_t timeout_ms) {

    while(!ft813_int_sync && timeout_ms) {
        misc_hal_sleep_ms(1);
        timeout_ms--;
    }
    ft813_int_sync = false;
}
