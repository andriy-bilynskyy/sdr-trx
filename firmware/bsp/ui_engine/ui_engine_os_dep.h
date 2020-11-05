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


void     ft813_qspi_create_sync(void)                               __attribute__((weak));
void     ft813_qspi_delete_sync(void)                               __attribute__((weak));
void     ft813_qspi_sync_set(void)                                  __attribute__((weak));
void     ft813_qspi_sync_set_isr(void)                              __attribute__((weak));
void     ft813_qspi_sync_wait(void)                                 __attribute__((weak));

void     ui_engine_create_sync(void)                                __attribute__((weak));
void     ui_engine_delete_sync(void)                                __attribute__((weak));
void     ui_engine_sync_set(uint32_t flags)                         __attribute__((weak));
void     ui_engine_sync_set_isr(uint32_t flags)                     __attribute__((weak));
uint32_t ui_engine_sync_wait(uint32_t flags, uint32_t timeout_ms)   __attribute__((weak));


#endif
