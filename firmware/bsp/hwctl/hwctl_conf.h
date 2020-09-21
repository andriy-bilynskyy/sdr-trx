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
    https://www.ti.com/lit/ds/symlink/sn74hc595.pdf
*/

#ifndef __HWCTL_CONF_H
#define __HWCTL_CONF_H


/* 74HC595 connection GPIO port*/
#define HWCTL_PORT              GPIOB
/* SPI pins (SRCLK, SER)*/
#define HWCTL_DATA_PIN          GPIO_Pin_8
#define HWCTL_DATA_PIN_SRC      GPIO_PinSource8
#define HWCTL_CLK_PIN           GPIO_Pin_0
#define HWCTL_CLK_PIN_SRC       GPIO_PinSource0
/* GPIO pins (RCLK, OE#)*/
#define HWCTL_LAT_PIN           GPIO_Pin_2
#define HWCTL_EN_PIN            GPIO_Pin_10
/* SPI interface */
#define HWCTL_SPI               SPI5
#define HWCTL_SPI_APB_CMD       RCC_APB2PeriphClockCmd
#define HWCTL_SPI_PERIPH        RCC_APB2Periph_SPI5
#define HWCTL_SPI_DATA_AF       GPIO_AF6_SPI5
#define HWCTL_SPI_CLK_AF        GPIO_AF6_SPI5
/* SPI interrupt */
#define HWCTL_SPI_IRQ           SPI5_IRQn
#define HWCTL_SPI_IRQ_PRIO      12
#define HWCTL_SPI_IRQ_HANDLER   SPI5_IRQHandler


#endif
