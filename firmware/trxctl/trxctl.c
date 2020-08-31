/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    trxctl driver source file
*/

#include "trxctl.h"
#include "trxctl_conf.h"
#include "stm32f4xx_conf.h"


void trxctl_start(void) {
    GPIO_WriteBit(TRXCTL_PORT, TRXCTL_TXEN, Bit_RESET);
    GPIO_WriteBit(TRXCTL_PORT, TRXCTL_RXEN, Bit_RESET);

    GPIO_InitTypeDef  ctl;

    ctl.GPIO_Mode = GPIO_Mode_OUT;
    ctl.GPIO_OType = GPIO_OType_PP;
    ctl.GPIO_PuPd = GPIO_PuPd_NOPULL;
    ctl.GPIO_Speed = GPIO_Low_Speed;
    ctl.GPIO_Pin = TRXCTL_TXEN | TRXCTL_RXEN;

    GPIO_Init(TRXCTL_PORT, &ctl);
}

void trxctl_stop(void) {
    GPIO_InitTypeDef  ctl;

    ctl.GPIO_Mode = GPIO_Mode_IN;
    ctl.GPIO_OType = GPIO_OType_PP;
    ctl.GPIO_PuPd = GPIO_PuPd_NOPULL;
    ctl.GPIO_Speed = GPIO_Low_Speed;
    ctl.GPIO_Pin = TRXCTL_TXEN | TRXCTL_RXEN;

    GPIO_Init(TRXCTL_PORT, &ctl);

    GPIO_WriteBit(TRXCTL_PORT, TRXCTL_TXEN, Bit_RESET);
    GPIO_WriteBit(TRXCTL_PORT, TRXCTL_RXEN, Bit_RESET);
}

void trxctl_txen(bool enable) {
    GPIO_WriteBit(TRXCTL_PORT, TRXCTL_TXEN, (BitAction)enable);
}

void trxctl_rxen(bool enable) {
    GPIO_WriteBit(TRXCTL_PORT, TRXCTL_RXEN, (BitAction)enable);
}

bool trxctl_txget(void) {
    return (bool)GPIO_ReadOutputDataBit(TRXCTL_PORT, TRXCTL_TXEN);
}

bool trxctl_rxget(void) {
    return (bool)GPIO_ReadOutputDataBit(TRXCTL_PORT, TRXCTL_RXEN) && !trxctl_txget();
}

