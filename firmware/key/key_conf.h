/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    key driver configuration file
*/

#ifndef __KEY_CONF_H
#define __KEY_CONF_H


#define KEY_PWR_PORT    GPIOC
#define KEY_PWR_PIN     GPIO_Pin_2
#define KEY_PTT_PORT    GPIOC
#define KEY_PTT_PIN     GPIO_Pin_9
#define KEY_TIMER_ID    8
#define KEY_SCAN_T_MS   100
#define KEY_HOLD_T_MS   1000

#endif
