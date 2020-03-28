/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    ad9850 IQ driver header file (2 x AD9850 all control pins except data parallel)
    output frequencies of both chips are the same.
    output phases are shifted by 90 degrees.
    https://www.analog.com/media/en/technical-documentation/data-sheets/AD9850.pdf
*/

#ifndef __AD9850IQ_CONF_H
#define __AD9850IQ_CONF_H

#define AD9850IQ_CLK_HZ   125000000
#define AD9850IQ_PORT     GPIOA
#define AD9850IQ_DATA_I   GPIO_Pin_7
#define AD9850IQ_DATA_Q   GPIO_Pin_8
#define AD9850IQ_W_CLK    GPIO_Pin_5
#define AD9850IQ_FQ_UD    GPIO_Pin_6
#define AD9850IQ_RESET    GPIO_Pin_4

#endif
