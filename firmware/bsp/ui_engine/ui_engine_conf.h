/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    UI engine configuration file
    https://brtchip.com/wp-content/uploads/Support/Documentation/Programming_Guides/ICs/EVE/FT81X_Series_Programmer_Guide.pdf
*/

#ifndef __UI_ENGINE_CONF_H
#define __UI_ENGINE_CONF_H


/******************************************************************************
 * F813 QSPI misc
 ******************************************************************************/
#define UI_FT813_QSPI_IRQ_PRIO      6
#define UI_FT813_QSPI_DMA_PRIO      DMA_Priority_High

/******************************************************************************
 * F813 interrupt
 ******************************************************************************/
#define UI_FT813_INT_PORT           GPIOB
#define UI_FT813_INT_PIN            GPIO_Pin_9
#define UI_FT813_INT_PORT_SRC       EXTI_PortSourceGPIOB
#define UI_FT813_INT_PIN_SRC        EXTI_PinSource9
#define UI_FT813_INT_LINE           EXTI_Line9
#define UI_FT813_INT_IRQ            EXTI9_5_IRQn
#define UI_FT813_INT_IRQ_PRIO       7
#define UI_FT813_INT_IRQ_HANDL      EXTI9_5_IRQHandler

/******************************************************************************
 * UI engine wait events unblock timeout
 ******************************************************************************/
#define UI_ENGINE_UNBLOCK_MS        100


#endif
