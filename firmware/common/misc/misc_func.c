/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Miscellaneous functions source file
*/


#include "misc_func.h"
#include <stdbool.h>


char * itoa(int value, char * buf, int base) {

    if (base < 2 || base > 36) {
        *buf = '\0';
        return buf;
    }

    char * ptr = buf;

    if(value < 0) {
        value =-value;
        *ptr++ = '-';
    }
    utoa(value, ptr, base);

    return buf;
}

char * utoa(unsigned int value, char * buf, int base) {

    if (base < 2 || base > 36) {
        *buf = '\0';
        return buf;
    }

    char * ptr = buf, * ptr1 = buf;

    do {
        *ptr++ = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"[value % base];
        value /= base;
    } while(value);

    *ptr-- = '\0';

    while(ptr1 < ptr) {
        char tmp = *ptr;
        *ptr--= *ptr1;
        *ptr1++ = tmp;
    }
    return buf;
}
