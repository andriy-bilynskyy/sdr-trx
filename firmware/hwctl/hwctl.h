/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    hwctl driver header file
    GPO expander based on 74HC595
*/

#ifndef __HWCTL_H
#define __HWCTL_H

#include <stdint.h>


typedef enum {
    DEV_OFF = 0,
    DEV_ON,
} hwctl_mode_t;


void hwctl_start(void);
void hwctl_stop(void);
void hwctl_set_band(uint8_t band);
void hwctl_tx_power(hwctl_mode_t mode);
void hwctl_rx_power(hwctl_mode_t mode);
void hwctl_bkl_power(hwctl_mode_t mode);
void hwctl_usb_power(hwctl_mode_t mode);
void hwctl_ext_mic(hwctl_mode_t mode);


#endif
