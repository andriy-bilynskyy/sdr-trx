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
#include <stdbool.h>


static volatile bool hwctl_sync = false;


void hwctl_create_lock(void) {
}

void hwctl_delete_lock(void) {
}

void hwctl_lock(void) {
}

void hwctl_unlock(void) {
}

void hwctl_create_sync(void) {

    hwctl_sync = false;
}

void hwctl_delete_sync(void) {
}

void hwctl_sync_set_isr(void) {

    hwctl_sync = true;
}

void hwctl_sync_wait(void) {

    while(!hwctl_sync);
    hwctl_sync = false;
}
