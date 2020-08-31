/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    trxctl driver header file
*/

#ifndef __TRXCTL_H
#define __TRXCTL_H

#include <stdint.h>
#include <stdbool.h>


void trxctl_start(void);
void trxctl_stop(void);
void trxctl_txen(bool enable);
void trxctl_rxen(bool enable);
bool trxctl_txget(void);
bool trxctl_rxget(void);


#endif
