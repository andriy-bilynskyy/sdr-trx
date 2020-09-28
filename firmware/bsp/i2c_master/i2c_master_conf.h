/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    i2c master driver configuration file
*/


#ifndef __I2C_MASTER_CONF_H
#define __I2C_MASTER_CONF_H


/* I2C general */
#define I2C_APB_CMD         RCC_APB1PeriphClockCmd
#define I2C_PERIPH          RCC_APB1Periph_I2C1
#define I2C_I2C             I2C1
#define I2C_SPEED           400000UL
/* I2C GPIO port */
#define I2C_PORT            GPIOB
/* I2C SCL */
#define I2C_SCL_PIN         GPIO_Pin_6
#define I2C_SCL_PIN_SRC     GPIO_PinSource6
#define I2C_SCL_AF          GPIO_AF_I2C1
/* I2C SDA */
#define I2C_SDA_PIN         GPIO_Pin_7
#define I2C_SDA_PIN_SRC     GPIO_PinSource7
#define I2C_SDA_AF          GPIO_AF_I2C1
/* I2C IRQ */
#define I2C_EV_IRQn         I2C1_EV_IRQn
#define I2C_ER_IRQn         I2C1_ER_IRQn
#define I2C_RC_IRQn         DMA1_Stream5_IRQn
#define I2C_EV_IRQ_HANDLER  I2C1_EV_IRQHandler
#define I2C_ER_IRQ_HANDLER  I2C1_ER_IRQHandler
#define I2C_RC_IRQ_HANDLER  DMA1_Stream5_IRQHandler
#define I2C_IRQS_PRIO       9
/* I2C DMA common */
#define I2C_APB_DMA_CMD     RCC_AHB1PeriphClockCmd
#define I2C_DMA_PERIPH      RCC_AHB1Periph_DMA1
#define I2C_DMA_PRIO        DMA_Priority_Medium
/* I2C DMA TX */
#define I2C_DMA_TX_CHANNEL  DMA_Channel_1
#define I2C_DMA_TX_STREAM   DMA1_Stream6
#define I2C_DMA_TX_FLAGS    (DMA_FLAG_TCIF6 | DMA_FLAG_HTIF6 | DMA_FLAG_TEIF6 | DMA_FLAG_DMEIF6 | DMA_FLAG_FEIF6)
#define I2C_DMA_TX_TCIF     DMA_FLAG_TCIF6
/* I2C DMA RX */
#define I2C_DMA_RX_CHANNEL  DMA_Channel_1
#define I2C_DMA_RX_STREAM   DMA1_Stream5
#define I2C_DMA_RX_FLAGS    (DMA_FLAG_TCIF5 | DMA_FLAG_HTIF5 | DMA_FLAG_TEIF5 | DMA_FLAG_DMEIF5 | DMA_FLAG_FEIF5)
#define I2C_DMA_RX_TCIF     DMA_FLAG_TCIF5


#endif
