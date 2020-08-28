#****************************************************************************
#*
#*  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
#*
#*  This code is licensed under the GPLv3.
#*
#****************************************************************************


TOOLCHAIN_PATH := /opt/gcc-arm-none-eabi-9-2020-q2-update


CC     := ${TOOLCHAIN_PATH}/bin/arm-none-eabi-gcc
CXX    := ${TOOLCHAIN_PATH}/bin/arm-none-eabi-g++
AS     := ${TOOLCHAIN_PATH}/bin/arm-none-eabi-gcc
LD     := ${TOOLCHAIN_PATH}/bin/arm-none-eabi-ld
OBJCPY := ${TOOLCHAIN_PATH}/bin/arm-none-eabi-objcopy
SIZE   := ${TOOLCHAIN_PATH}/bin/arm-none-eabi-size
GDB    := ${TOOLCHAIN_PATH}/bin/arm-none-eabi-gdb


PROJECT ?= sdr-trx-bl


PROJECT_CSRC := \
  ${wildcard ../stm/*.c} \
  ${wildcard ../stm/*.s} \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_adc.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_crc.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dbgmcu.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_exti.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_flash.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_i2c.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_iwdg.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_pwr.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rtc.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_sdio.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_spi.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_syscfg.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_wwdg.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/misc.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_cryp.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_fmpi2c.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rng.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_can.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_qspi.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_fsmc.c \
  ../stm/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dfsdm.c \
  ${wildcard src/*.c} \
  ${wildcard src/*.cpp} \
  ${wildcard ../led/*.c} \

INCLUDE_PATH := \
  ../cm/Include \
  ../stm \
  ../stm/STM32F4xx_StdPeriph_Driver/inc \
  config \
  src \
  ../led \

LDLIBS := \
  stdc++ \

LD_SCRIPT := STM32F413ZH_FLASH.ld

OBJECTS := ${addsuffix .o, ${PROJECT_CSRC}}

CFLAGS  := -Wall -std=c99 -fdata-sections -ffunction-sections
CFLAGS  += -mlittle-endian -mthumb -mcpu=cortex-m3
CFLAGS  += -DSTM32F413_423xx -DHSE_VALUE=24000000u -DUSE_STDPERIPH_DRIVER

ASFLAGS  := -Wall -std=c99
ASFLAGS  += -mlittle-endian -mthumb -mcpu=cortex-m3
ASFLAGS  += -DSTM32F413_423xx -DHSE_VALUE=24000000u -DUSE_STDPERIPH_DRIVER

CXXFLAGS  := -Wall -fno-exceptions -fdata-sections -ffunction-sections
CXXFLAGS  += -mlittle-endian -mthumb -mcpu=cortex-m3
CXXFLAGS  += -DSTM32F413_423xx -DHSE_VALUE=24000000u -DUSE_STDPERIPH_DRIVER

LDFLAGS := -T${LD_SCRIPT}
LDFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m4
LDFLAGS += -Wl,--gc-sections
LDFLAGS += -Xlinker -Map=${PROJECT}.map
LDFLAGS += ${addprefix -l, ${LDLIBS}}

BINFLAGS := -r -b binary


ifndef BUILD
  BUILD := DEBUG
endif

ifeq ($(BUILD),DEBUG)
  CFLAGS  += -g3 -O1 -DUSE_FULL_ASSERT -DDEBUG
  ASFLAGS += -g3 -O1 -DUSE_FULL_ASSERT -DDEBUG
  CXXFLAGS += -g3 -O1 -DUSE_FULL_ASSERT -DDEBUG
  LDFLAGS += --specs=rdimon.specs
else ifeq ($(BUILD),RELEASE)
  CFLAGS  += -g0 -O3
  ASFLAGS += -g0 -O3
  CXXFLAGS += -g0 -O3
  LDFLAGS += --specs=nosys.specs
else
  $(error Wrong BUILD '$(BUILD)'! Should be: DEBUG or RELEASE)
endif

CFLAGS  += ${addprefix -I, ${INCLUDE_PATH}}
CXXFLAGS  += ${addprefix -I, ${INCLUDE_PATH}}

.PHONY: all build clean flash erase debug help

all: ${PROJECT}.elf

build: ${PROJECT}.elf

${PROJECT}.elf: ${OBJECTS}
	$(info $(BUILD) BUILD)
	${CC} $^ -o $@ ${LDFLAGS}
	${OBJCPY} -O ihex $@ ${PROJECT}.hex
	${SIZE} --format=berkeley $@

%.c.o: %.c
	${CC} ${CFLAGS} -MD -c $< -o $@

%.s.o: %.s
	${CC} ${ASFLAGS} -MD -c $< -o $@

%.cpp.o: %.cpp
	${CXX} ${CXXFLAGS} -MD -c $< -o $@

%.bin.o: %.bin
	${LD} ${BINFLAGS} $< -o $@

clean:
	rm -f ${OBJECTS} $(OBJECTS:.o=.d) ${PROJECT}.elf ${PROJECT}.hex ${PROJECT}.map

flash:
	@if [ -f "${PROJECT}.hex" ] ;                                               \
  then                                                                          \
    openocd -f ../openocd/jlink.cfg -f ../openocd/stm32f4x.cfg                  \
            -c "init"                                                           \
            -c "reset init"                                                     \
            -c "flash write_image erase $(PROJECT).hex"                         \
            -c "reset"                                                          \
            -c "shutdown";                                                      \
  else                                                                          \
    echo "Output .hex file doesn't exist. Run 'make all' before!";              \
  fi

erase:
	openocd -f ../openocd/jlink.cfg -f ../openocd/stm32f4x.cfg                  \
            -c "init"                                                           \
            -c "reset init"                                                     \
            -c "flash protect 0 0 last off"                                     \
            -c "stm32f4x unlock 0"                                              \
            -c "reset halt"                                                     \
            -c "reset init"                                                     \
            -c "stm32f4x mass_erase 0"                                          \
            -c "reset"                                                          \
            -c "shutdown";                                                      \

debug:
	@if [ -f "${PROJECT}.elf" ] ;                                               \
  then                                                                          \
    openocd -f ../openocd/jlink.cfg -f ../openocd/stm32f4x.cfg &                \
    ddd "${PROJECT}.elf" --debugger "${GDB} -ex 'target extended-remote :3333'  \
                                            -ex 'monitor arm semihosting enable'\
                                            -ex 'monitor reset halt'            \
                                            -ex 'load'                          \
                                            -ex 'monitor reset halt'";          \
    kill $$!;                                                                   \
  else                                                                          \
    echo "Output .elf file doesn't exist. Run 'make all' before!";              \
  fi

help:
	$(info Help)
	$(info ---------------------------------------------------------------------)
	$(info make help                     - this help text)
	$(info make BUILD=<build_type> build - create binary files (.elf, .hex))
	$(info make BUILD=<build_type> all   - create binary files (.elf, .hex). same as build)
	$(info make clean                    - remove generated files)
	$(info make flash                    - flash target)
	$(info make erase                    - flash erase)
	$(info make debug                    - start debugging session DDD(gdb))
	$(info ---------------------------------------------------------------------)
	$(info Available build_type [DEBUG RELEASE], eg: make BUILD=RELEASE ...)
	$(info Default build_type DEBUG)

-include $(OBJECTS:.o=.d)
