/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    ad9850 driver configuration file
    https://www.analog.com/media/en/technical-documentation/data-sheets/AD9850.pdf
*/

#ifndef __AD9850_CONF_H
#define __AD9850_CONF_H

#define AD9850_CLK_HZ   125000000
#define AD9850_PORT     GPIOA
#define AD9850_DATA     GPIO_Pin_7
#define AD9850_W_CLK    GPIO_Pin_5
#define AD9850_FQ_UD    GPIO_Pin_6
#define AD9850_RESET    GPIO_Pin_4

//#define AD9851_EXT_EN

#endif
