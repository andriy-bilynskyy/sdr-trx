/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#ifndef DFT_H_
#define DFT_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stddef.h>

size_t dft(double x[], size_t n, double * re[], double * im[]);

#ifdef __cplusplus
}
#endif

#endif
