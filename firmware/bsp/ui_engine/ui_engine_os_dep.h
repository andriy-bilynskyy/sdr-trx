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


void ft813_lock_sync_obj(void)                          __attribute__((weak));
void ft813_unlock_sync_obj(void)                        __attribute__((weak));
void ft813_qspi_post_sync_obj(void)                     __attribute__((weak));
void ft813_qspi_pend_sync_obj(void)                     __attribute__((weak));

void ft813_interrupt_post_sync_obj(void)                __attribute__((weak));
void ft813_interrupt_pend_sync_obj(uint32_t timeout_ms) __attribute__((weak));


#endif
