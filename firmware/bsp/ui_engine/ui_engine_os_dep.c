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
#include "ui_engine_conf.h"
#include "stm32f4xx_conf.h"


static volatile bool ft813_qspi_tx_complete = false;
static volatile bool ft813_int_touch_detected = false;


void ui_engine_sleep_ms(uint32_t ms) {
    const uint32_t delay_ms = (uint64_t)system_ahb_clk() * 126 / 1000000;
    while(ms--) {
        volatile uint32_t tmp = delay_ms;
        while(tmp--) {
            __asm("nop");
        }
    }
}

void ft813_qspi_wait_sync_obj(void) {
    while(!ft813_qspi_tx_complete);
}

void ft813_qspi_set_sync_obj(void) {
    ft813_qspi_tx_complete = true;
}

void ft813_qspi_clr_sync_obj(void) {
    ft813_qspi_tx_complete = false;
}

void ft813_interrupt_wait_sync_obj(void) {
    uint32_t cnt = UI_ENGINE_TOUCH_UNBLOCK_MS;
    while(!ft813_int_touch_detected && cnt) {
        cnt --;
        ui_engine_sleep_ms(1);
    }
}

void ft813_interrupt_set_sync_obj(void) {
    ft813_int_touch_detected = true;
}

void ft813_interrupt_clr_sync_obj(void) {
    ft813_int_touch_detected = false;
}
