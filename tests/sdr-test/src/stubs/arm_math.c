/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    arm_math CMSIS stub source file
*/


#include "arm_math.h"
#include <fftw.h>
#include <math.h>
#include "debug.h"


arm_status  arm_cfft_init_f32(arm_cfft_instance_f32 * S, uint16_t fftLen) {

    arm_status result = ARM_MATH_LENGTH_ERROR;

    if(!(fftLen & (fftLen - 1))) {
        S->length = fftLen;
        result = ARM_MATH_SUCCESS;
    }

    return result;
}

void arm_cfft_f32(const arm_cfft_instance_f32 * S, float32_t * p1, uint8_t ifftFlag, uint8_t bitReverseFlag) {

    (void)bitReverseFlag;
    fftw_plan fft = fftw_create_plan(S->length, ifftFlag ? FFTW_FORWARD : FFTW_BACKWARD, FFTW_ESTIMATE);
    fftw_complex * buf_inp = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * S->length);
    fftw_complex * buf_out = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * S->length);

    if(buf_inp && buf_out) {
        for(uint16_t i = 0; i < S->length; i++) {
            buf_inp[i].re = p1[2 * i];
            buf_inp[i].im = p1[2 * i + 1];
        }

        fftw_one(fft, buf_inp, buf_out);

        for(uint16_t i = 0; i < S->length; i++) {
            p1[2 * i]     = (float32_t)(ifftFlag ? buf_out[i].re / S->length : buf_out[i].re);
            p1[2 * i + 1] = (float32_t)(ifftFlag ? buf_out[i].im / S->length : buf_out[i].im);
        }
    } else {
        DBG_OUT("malloc failed");
    }

    fftw_free(buf_out);
    fftw_free(buf_inp);
    fftw_destroy_plan(fft);
}

void arm_cmplx_mag_f32(const float32_t * pSrc, float32_t * pDst, uint32_t numSamples) {

    for(uint32_t i = 0; i < numSamples; i++) {
        pDst[i] = sqrtf(pSrc[2 * i] * pSrc[2 * i] + pSrc[2 * i + 1] * pSrc[2 * i + 1]);
    }
}
