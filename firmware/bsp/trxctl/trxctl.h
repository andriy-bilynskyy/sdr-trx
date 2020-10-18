/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    transmit receive control driver header file
*/

#ifndef __TRXCTL_H
#define __RTXCTL_H


#include <stdbool.h>


void trxctl_start(void);
void trxctl_stop(void);
void trxctl_transmit(bool enable);
void trxctl_receive(bool enable);


#endif
