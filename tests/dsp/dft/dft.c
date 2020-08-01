/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#include "dft.h"
#include <stdlib.h>
#include <math.h>

#include <stdio.h>


#define M_PI (double)3.14159265358979323846

size_t dft(double x[], size_t n, double * re[], double * im[]) {

    *re = malloc(sizeof(double)*n);
    *im = malloc(sizeof(double)*n);
    for(size_t i = 0; i < n; i++) {
        (*re)[i] = 0;
        (*im)[i] = 0;
    }

    for(size_t k = 0; k < n; k++) {
        for(size_t i = 0; i < n; i++) {

            double sr = cos(2.*M_PI * (double)(k * i) / n);
            double si = -sin(2.*M_PI * (double)(k * i) / n);
            (*re)[k] += x[i] * sr;
            (*im)[k] += x[i] * si;
        }
    }


    return n;
}
