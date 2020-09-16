/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    FT813 interrupt display driver header file
    https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT81x.pdf
*/

#ifndef __FT813_INTERRUPT_H
#define __FT813_INTERRUPT_H


void ft813_interrupt_start(void);
void ft813_interrupt_stop(void);
void ft813_interrupt_wait(void);


#endif
