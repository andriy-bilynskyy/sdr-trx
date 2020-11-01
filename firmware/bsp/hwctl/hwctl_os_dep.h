/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    hwctl driver OS dependencies header file
    GPO expander based on 74HC595
    https://www.ti.com/lit/ds/symlink/sn74hc595.pdf
*/

#ifndef __HWCTL_OS_DEP_H
#define __HWCTL_OS_DEP_H

void hwctl_create_lock(void)      __attribute__((weak));
void hwctl_delete_lock(void)      __attribute__((weak));
void hwctl_lock(void)             __attribute__((weak));
void hwctl_unlock(void)           __attribute__((weak));

void hwctl_create_sync(void)       __attribute__((weak));
void hwctl_delete_sync(void)       __attribute__((weak));
void hwctl_sync_set_isr(void)      __attribute__((weak));
void hwctl_sync_wait(void)         __attribute__((weak));

#endif
