/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    UI engine OS dependencies header file
    It's good idea to re-implement next functions in case of using RTOS
    https://brtchip.com/wp-content/uploads/Support/Documentation/Programming_Guides/ICs/EVE/FT81X_Series_Programmer_Guide.pdf
*/

#ifndef __UI_ENGINE_OS_DEP_H
#define __UI_ENGINE_OS_DEP_H


#include <stdint.h>
#include <stdbool.h>


void ui_engine_sleep_ms(uint32_t ms)     __attribute__((weak));

void ft813_qspi_wait_sync_obj(void)      __attribute__((weak));
void ft813_qspi_set_sync_obj(void)       __attribute__((weak));
void ft813_qspi_clr_sync_obj(void)       __attribute__((weak));

void ft813_interrupt_wait_sync_obj(void) __attribute__((weak));
void ft813_interrupt_set_sync_obj(void)  __attribute__((weak));
void ft813_interrupt_clr_sync_obj(void)  __attribute__((weak));


#endif
