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


static volatile bool hwctl_tx_complete = false;


void hwctl_wait_sync_obj(void) {
    while(!hwctl_tx_complete);
}

void hwctl_set_sync_obj(void) {
    hwctl_tx_complete = true;
}

void hwctl_clr_sync_obj(void) {
    hwctl_tx_complete = false;
}
