/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Miscellaneous functions header file
*/

#ifndef __MISC_FUNC_H
#define __MISC_FUNC_H


char * itoa(int value, char * buf, int base);
char * utoa(unsigned int value, char * buf, int base);
char * gcvtf(float value, int precision, char * buf);

#endif
