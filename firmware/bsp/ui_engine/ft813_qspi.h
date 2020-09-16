/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    FT813 QSPI display driver header file
    https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT81x.pdf
*/

#ifndef __FT813_QSPI_H
#define __FT813_QSPI_H


#include <stdint.h>
#include <stdbool.h>


void ft813_qspi_start(void);
void ft813_qspi_stop(void);
void ft813_qspi_cmd(uint8_t cmd, uint8_t arg, bool mode_4x);
void ft813_qspi_wr(uint32_t addr, const void * data, uint32_t size, bool mode_4x);
void ft813_qspi_rd(uint32_t addr, void * data, uint32_t size, bool mode_4x);


#endif
