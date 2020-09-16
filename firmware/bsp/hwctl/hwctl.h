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
#include <stdbool.h>


void hwctl_start(void);
void hwctl_stop(void);
void hwctl_set_band(uint8_t band);
void hwctl_tx_power(bool dev_on);
void hwctl_rx_power(bool dev_on);
void hwctl_bkl_power(bool dev_on);
void hwctl_usb_power(bool dev_on);
void hwctl_ext_mic(bool dev_on);


#endif
