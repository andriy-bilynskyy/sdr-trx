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
#include <stdint.h>
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

char * gcvtf(float value, int precision, char * buf) {

    char * ptr = buf;

    if (precision < 0 || precision > 7) {
        *ptr = '\0';
        return buf;
    }

    union {
        float    real;
        uint32_t integer;
    } val = {.real = value};

    if((val.integer & 0x7F800000) == 0x7F800000) {
        if(val.integer & 0x7FFFFF) {
            *ptr++ = 'N';
            *ptr++ = 'a';
            *ptr++ = 'N';
            *ptr++ = '\0';
            return buf;
        } else {
            if(val.integer & 0x80000000) {
                *ptr++ = '-';
            }
            *ptr++ = 'I';
            *ptr++ = 'n';
            *ptr++ = 'f';
            *ptr++ = '\0';
            return buf;
        }
    }

    if(val.integer & 0x80000000) {
        *ptr++ = '-';
    }

    int8_t exp = (int8_t)((val.integer >> 23 ) & 0xFF) - 127;

    if(exp > 31) {
        *ptr++ = 'O';
        *ptr++ = 'v';
        *ptr++ = 'f';
        *ptr++ = '\0';
        return buf;
    }

    if(exp > 27) {
        precision = 0;
    } else if(exp > 24) {
        precision = (precision < 1) ? precision : 1;
    } else if(exp > 21) {
        precision = (precision < 2) ? precision : 2;
    } else if(exp > 17) {
        precision = (precision < 3) ? precision : 3;
    } else if(exp > 14) {
        precision = (precision < 4) ? precision : 4;
    } else if(exp > 11) {
        precision = (precision < 5) ? precision : 5;
    } else if(exp > 7) {
        precision = (precision < 6) ? precision : 6;
    }

    static const uint32_t mul[] = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000};

    uint64_t vf = (uint64_t)((exp != -127) ? (val.integer & 0x7FFFFF) | 0x800000 : (val.integer & 0x7FFFFF) << 1) * mul[precision];

    if(exp > 23) {
        vf <<= (exp - 23);
    } else {
        vf >>= (23 - exp);
    }

    uint32_t v = (uint32_t)vf;
    char * ptr1 = ptr;
    uint8_t cnt = 0;
    do {
        if(precision && cnt == precision) {
            *ptr++ = '.';
        } else {
            *ptr++ = v % 10 + '0';
            v /= 10;
        }
        cnt++;
    } while(v || (precision && cnt <= precision + 1));

    *ptr-- = '\0';

    while(ptr1 < ptr) {
        char tmp = *ptr;
        *ptr--= *ptr1;
        *ptr1++ = tmp;
    }

    return buf;
}
