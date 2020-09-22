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

#ifndef __HW_CTL_OS_DEP_H
#define __HW_CTL_OS_DEP_H


void hwctl_post_sync_obj(void)          __attribute__((weak));
void hwctl_pend_sync_obj(void)          __attribute__((weak));


#endif
