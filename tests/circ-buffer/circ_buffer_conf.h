/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    circular buffer configuration file
    FIFO buffer for storing any type of elements.
*/

#ifndef __CIRC_BUFFER_CONF_H
#define __CIRC_BUFFER_CONF_H

#include <stdint.h>
#include <stdlib.h>

/*******************************************************************************
 * base unsigned platform dependent type
 * usually 32-bit but check platform documentation
 * huge type than platform will affect the performance
 ******************************************************************************/
#define CIRC_BUFFER_BASE_T  uint32_t

/*******************************************************************************
 * platform dependent memory allocate function
 * usually malloc but for example in case of using FreeRTOS pvPortMalloc
 ******************************************************************************/
#define CIRC_BUFFER_MALLOC  malloc

/*******************************************************************************
 * platform dependent memory free function
 * usually free but for example in case of using FreeRTOS vPortFree
 ******************************************************************************/
#define CIRC_BUFFER_FREE    free

#endif
