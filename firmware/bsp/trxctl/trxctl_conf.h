/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    transmit receive control driver configuration file
*/

#ifndef __TRX_CONF_CONF_H
#define __TRX_CONF_CONF_H


/* transmit enable pin */
#define TRXCTL_PORT_TXEN        GPIOC
#define TRXCTL_PIN_TXEN         GPIO_Pin_0
/* receive enable pin */
#define TRXCTL_PORT_RXEN        GPIOC
#define TRXCTL_PIN_RXEN         GPIO_Pin_1


#endif
