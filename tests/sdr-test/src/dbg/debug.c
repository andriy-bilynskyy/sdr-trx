/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    debug stub source file
*/


#include "debug.h"


#ifdef DEBUG


void debug_print_buf(const void * buf, unsigned int size, const char * file, unsigned int line) {
    printf("%s:%04u ", file, line);
    for(unsigned int i = 0; i < (size); i++) {
        printf(" %02X", ((unsigned char *)buf)[i]);
    }
    printf("\n");
}


#endif
