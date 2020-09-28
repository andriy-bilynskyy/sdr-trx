/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    hwctl driver OS dependencies source file
    It's good idea to re-implement next functions in case of using RTOS
    GPO expander based on 74HC595
    https://www.ti.com/lit/ds/symlink/sn74hc595.pdf
*/


#include "hwctl_os_dep.h"
#include "stm32f4xx_conf.h"

static volatile uint8_t hwctl_tx_complete = 0;  /* operation complete semaphore */


void hwctl_post_sync_obj(void) {

    hwctl_tx_complete = 1;
}

void hwctl_pend_sync_obj(void) {

    for(;;) {
        uint8_t val = __LDREXB(&hwctl_tx_complete);
        if(val) {
            if(!__STREXB(0, &hwctl_tx_complete)) {
                __DMB();
                break;
            }
        }
    }
}
