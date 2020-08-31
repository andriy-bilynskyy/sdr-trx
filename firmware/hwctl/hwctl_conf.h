/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    hwctl driver configuration file
    GPO expander based on 74HC595
*/

#ifndef __HWCTL_CONF_H
#define __HWCTL_CONF_H


#define HWCTL_PORT      GPIOB
#define HWCTL_DATA      GPIO_Pin_8
#define HWCTL_CLK       GPIO_Pin_0
#define HWCTL_LAT       GPIO_Pin_2
#define HWCTL_EN        GPIO_Pin_10


#endif
