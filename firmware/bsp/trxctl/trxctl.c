/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    transmit receive control driver source file
*/

#include "trxctl.h"
#include "trxctl_conf.h"
#include "stm32f4xx_conf.h"


static volatile bool trxctl_started  = false;


void trxctl_start(void) {

    if(!trxctl_started) {
        GPIO_WriteBit(TRXCTL_PORT_TXEN, TRXCTL_PIN_TXEN, Bit_RESET);
        GPIO_WriteBit(TRXCTL_PORT_RXEN, TRXCTL_PIN_RXEN, Bit_RESET);

        GPIO_InitTypeDef  gpio = {
            .GPIO_Mode = GPIO_Mode_OUT,
            .GPIO_OType = GPIO_OType_PP,
            .GPIO_PuPd = GPIO_PuPd_NOPULL,
            .GPIO_Speed = GPIO_Low_Speed
        };

        gpio.GPIO_Pin = TRXCTL_PIN_TXEN;
        GPIO_Init(TRXCTL_PORT_TXEN, &gpio);

        gpio.GPIO_Pin = TRXCTL_PIN_RXEN;
        GPIO_Init(TRXCTL_PORT_RXEN, &gpio);
        trxctl_started = true;
    }
}

void trxctl_stop(void) {

    if(trxctl_started) {
        trxctl_started = false;
        GPIO_InitTypeDef  gpio = {
            .GPIO_Mode = GPIO_Mode_IN,
            .GPIO_OType = GPIO_OType_PP,
            .GPIO_PuPd = GPIO_PuPd_NOPULL,
            .GPIO_Speed = GPIO_Low_Speed
        };

        gpio.GPIO_Pin = TRXCTL_PIN_TXEN;
        GPIO_Init(TRXCTL_PORT_TXEN, &gpio);

        gpio.GPIO_Pin = TRXCTL_PIN_RXEN;
        GPIO_Init(TRXCTL_PORT_RXEN, &gpio);

        GPIO_WriteBit(TRXCTL_PORT_TXEN, TRXCTL_PIN_TXEN, Bit_RESET);
        GPIO_WriteBit(TRXCTL_PORT_RXEN, TRXCTL_PIN_RXEN, Bit_RESET);
    }
}

void trxctl_transmit(bool enable) {

    if(trxctl_started) {
        GPIO_WriteBit(TRXCTL_PORT_TXEN, TRXCTL_PIN_TXEN, enable ? Bit_SET : Bit_RESET);
    }
}

void trxctl_receive(bool enable) {

    if(trxctl_started) {
        GPIO_WriteBit(TRXCTL_PORT_RXEN, TRXCTL_PIN_RXEN, enable ? Bit_SET : Bit_RESET);
    }
}
