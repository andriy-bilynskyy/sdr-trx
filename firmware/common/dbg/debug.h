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
void debug_print_buf(const void * buf, unsigned int size, const char * file, unsigned int line);

#define DBG_INIT() initialise_monitor_handles()
#define DBG_OUT(fmt, ...)                                                                                  \
                printf("%s:%04u " fmt "\n",                                                                \
                (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__),      \
                (unsigned)__LINE__, ##__VA_ARGS__)
#define DBG_BUF(buf, size) debug_print_buf(buf, size,                                                      \
                (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__),      \
                __LINE__)
#else
#define DBG_INIT()
#define DBG_OUT(fmt, ...)
#define DBG_BUF(buf, size)
#endif

#endif
