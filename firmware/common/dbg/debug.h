/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    semihosting debug header file
*/

#ifndef __DEBUG_H
#define __DEBUG_H


#ifdef DEBUG
#include <stdio.h>

extern void initialise_monitor_handles(void);

#define DBG_INIT() initialise_monitor_handles()
#define DBG_OUT(fmt, ...)                                                                                  \
                printf("%s:%04u " fmt "\n",                                                                \
                (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__),      \
                (unsigned)__LINE__, ##__VA_ARGS__)
#else
#define DBG_INIT()
#define DBG_OUT(fmt, ...)
#endif

#endif
