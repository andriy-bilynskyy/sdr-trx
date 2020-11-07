/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    System off driver configuration file
*/


#ifndef __SYSTEM_CONF_H
#define __SYSTEM_CONF_H


/******************************************************************************
 * System power hold pin (set logical 1 to keep MCU power on state)
 * power on/off circuit keeps power ~50mS after release pin,
 * this is used to show critical errors - when reboot is applied
 ******************************************************************************/
#define SYSTEM_PWR_OFF_PORT             GPIOC
#define SYSTEM_PWR_OFF_PIN              GPIO_Pin_13

/******************************************************************************
 * System hardware keys (tactile switches)
 ******************************************************************************/
#define SYSTEM_HW_KEY_PWR_PORT          GPIOC
#define SYSTEM_HW_KEY_PWR_PIN           GPIO_Pin_2
#define SYSTEM_HW_KEY_PTT_PORT          GPIOC
#define SYSTEM_HW_KEY_PTT_PIN           GPIO_Pin_9


#endif
