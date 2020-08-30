#****************************************************************************
#*
#*  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
#*
#*  This code is licensed under the GPLv3.
#*
#****************************************************************************


CDIR = ${dir ${lastword ${MAKEFILE_LIST}}}

PROJECT_SRC += \
  ${wildcard ${CDIR}*.c} \
  ${wildcard ${CDIR}*.s} \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_adc.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_crc.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dbgmcu.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_exti.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_flash.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_i2c.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_iwdg.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_pwr.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rtc.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_sdio.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_spi.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_syscfg.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_wwdg.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/misc.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_cryp.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_fmpi2c.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rng.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_can.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_qspi.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_fsmc.c \
  ${CDIR}STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dfsdm.c \

PROJECT_INC += \
  ${CDIR} \
  ${CDIR}STM32F4xx_StdPeriph_Driver/inc \

PROJECT_LIB += \

PROJECT_STYLE += \
  ${wildcard ${CDIR}*.[c,s]} \
  ${wildcard ${CDIR}*.h} \
