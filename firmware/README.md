# SDR transceiver firmware

## Folder structure

#### - Project relative sources

- **app/** - SDR transceiver application sources.
- **app/config/** - system configuration files.
- **app/src/app_hal/** - high level HAL facilities.
- **app/src/dsp_proc/** - SDR DSP processing.
- **app/src/rtos_ext/** - BSP RTOS extensions (RTOS depending synchronization).
- **app/src/tasks/** - application threads.
- **app/src/widget/s** - UI windows for each mode.
- **bsp/** - Board support package.
- **bsp/adc/** - MCU builtin ADC.
- **bsp/codec/** - WM8731 audio codec driver.
- **bsp/critical_err/** - MCU critical errors handlers (crashes, stack overflowing, failed malloc, ...) This kind of errors are shown on display with additional information.
- **bsp/dco/** - Si5351 Digitally Controlled Oscillator driver.
- **bsp/hwctl/** - General Purpose Output Ports expander driver based on IC 74HC595.
- **bsp/led/** - simple GPIO based LED driver.
- **bsp/mem24/** - I2C flash/FRAM memory 24LCXX driver.
- **bsp/misc/** - miscellaneous BSP functionality. Mainly delays.
- **bsp/rf_amp/** - Radio Frequency amplifier driver. Controlling output amplifier LDMOSes biasing using digital potentiometer AD5243.
- **bsp/rtc/** - MCU builtin RTC driver.
- **bsp/system/** - HW buttons and power hold circuit driver.
- **bsp/trxctl/** - transmit/receive circuit driver.
- **bsp/ui_engine/** - user interface engine (TFT and touchscreen) driver. Engine is based on FT813 connected in QSPI mode.
- **common/** - Generic software components.
- **common/debug/** - debug facilities (semihosting).
- **common/misc/** - general project functions (Mainly digital types to strings conversions in order to avoid sprintf usage due to low performance and big stack consumption).
- **sw_version/** - Component to generate SW version based on git state.

#### - Third party sources

- **cm/** - Cortex M libraries (core and DSP). Obtained as part of [STM32F4 SPL](https://www.st.com/content/st_com/en/products/embedded-software/mcu-mpu-embedded-software/stm32-embedded-software/stm32-standard-peripheral-libraries/stsw-stm32065.html).
- **free_rtos/** - FreeRTOS sources [https://www.freertos.org/](https://www.freertos.org/).
- **openocd/** - openocd configuration files [http://openocd.org/](http://openocd.org/).
- **stm/** - STM32F4 Standard Peripheral Library and MCU startup code [https://www.st.com/content/st_com/en.html](https://www.st.com/content/st_com/en.html). Obtained as part of [STM32F4 SPL](https://www.st.com/content/st_com/en/products/embedded-software/mcu-mpu-embedded-software/stm32-embedded-software/stm32-standard-peripheral-libraries/stsw-stm32065.html).

## Development environment

- Make build system. Under Debian package **build-essential**.
- Compiler GNU Arm Embedded Toolchain. [https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads). Just unpack into folder you want.
- Debuger OpenOCD [http://openocd.org/](http://openocd.org/). Under Debian package **openocd**. The main problem is that usually Debian has obsolete version of **openocd** which do not support project MCU. In that case **openocd** should be compiled from sources. Actually this process is simple there are lot of manuals online, for example refer to this [https://hackaday.io/page/4991-compiling-openocd-from-source-on-ubuntu-1604](https://hackaday.io/page/4991-compiling-openocd-from-source-on-ubuntu-1604).
- **openocd** GUI ddd [https://www.gnu.org/software/ddd/](https://www.gnu.org/software/ddd/). Under Debian package **ddd**.
- Static analyse cppcheck. [http://cppcheck.sourceforge.net/](http://cppcheck.sourceforge.net/).
- Code formatting Artistic Style. [http://astyle.sourceforge.net/](http://astyle.sourceforge.net/). Under Debian package **astyle**.

And finally code editor up to you. Personally I'm using Eclipse CDT with OpenOCD debugging plug-in [https://eclipse-embed-cdt.github.io/debug/openocd/](https://eclipse-embed-cdt.github.io/debug/openocd/) just because of debugging. DDD has ancient interface which sometimes could be terrible Eclipse doing this much more better.

## Building project

From **app/** folder run **make help** for targets details. 

