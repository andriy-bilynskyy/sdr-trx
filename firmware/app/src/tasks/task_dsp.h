/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Task audio digital processing header file
*/


#ifndef __TASK_DSP_H
#define __TASK_DSP_H


#include "dsp_proc.h"


extern dsp_proc_t dsp_proc;


void task_dsp(void * param);


#endif
