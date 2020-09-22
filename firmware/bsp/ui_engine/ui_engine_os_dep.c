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
#include "stm32f4xx_conf.h"


static volatile uint8_t ft813_qspi_tx_complete = 0;
static volatile uint8_t ft813_int_touch_detected = 0;


void ft813_qspi_post_sync_obj(void) {

    for(;;) {
        (void)__LDREXB(&ft813_qspi_tx_complete);
        if(!__STREXB(1, &ft813_qspi_tx_complete)) {
            __DMB();
            break;
        }
    }
}

void ft813_qspi_pend_sync_obj(void) {

    for(;;) {
        uint8_t val = __LDREXB(&ft813_qspi_tx_complete);
        if(val) {
            if(!__STREXB(0, &ft813_qspi_tx_complete)) {
                __DMB();
                break;
            }
        }
    }
}

void ft813_interrupt_post_sync_obj(void) {

    for(;;) {
        (void)__LDREXB(&ft813_int_touch_detected);
        if(!__STREXB(1, &ft813_int_touch_detected)) {
            __DMB();
            break;
        }
    }
}

void ft813_interrupt_pend_sync_obj(uint32_t timeout_ms) {

    for(; timeout_ms; timeout_ms--) {
        uint8_t val = __LDREXB(&ft813_int_touch_detected);
        if(val) {
            if(!__STREXB(0, &ft813_int_touch_detected)) {
                __DMB();
                break;
            }
        }
        misc_hal_sleep_ms(1);
    }
}
