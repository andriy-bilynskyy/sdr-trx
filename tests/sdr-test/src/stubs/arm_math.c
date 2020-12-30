/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    arm_math CMSIS stub source file
    used fftw library
    see: http://www.fftw.org/
    debian package is available: libfftw3-dev
*/


#include "arm_math.h"
#include <fftw3.h>
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

    fftw_complex * buf_inp = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * S->length);
    fftw_complex * buf_out = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * S->length);

    if(buf_inp && buf_out) {

        fftw_plan fft = fftw_plan_dft_1d(S->length, buf_inp, buf_out, ifftFlag ? FFTW_FORWARD : FFTW_BACKWARD, FFTW_ESTIMATE);

        for(uint16_t i = 0; i < S->length; i++) {
            buf_inp[i][0] = p1[2 * i];
            buf_inp[i][1] = p1[2 * i + 1];
        }

        fftw_execute(fft);

        for(uint16_t i = 0; i < S->length; i++) {
            p1[2 * i]     = (float32_t)(ifftFlag ? buf_out[i][0] / S->length : buf_out[i][0]);
            p1[2 * i + 1] = (float32_t)(ifftFlag ? buf_out[i][1] / S->length : buf_out[i][1]);
        }

        fftw_destroy_plan(fft);
    } else {
        DBG_OUT("malloc failed");
    }
    if(buf_out) {
        fftw_free(buf_out);
    }
    if(buf_inp) {
        fftw_free(buf_inp);
    }
}

void arm_cmplx_mag_f32(const float32_t * pSrc, float32_t * pDst, uint32_t numSamples) {

    for(uint32_t i = 0; i < numSamples; i++) {
        pDst[i] = sqrtf(pSrc[2 * i] * pSrc[2 * i] + pSrc[2 * i + 1] * pSrc[2 * i + 1]);
    }
}

arm_status arm_sqrt_f32(float32_t in, float32_t * pOut) {

    arm_status result = ARM_MATH_ARGUMENT_ERROR;

    if(in >= 0) {
        *pOut = sqrtf(in);
        result = ARM_MATH_SUCCESS;
    }
    return result;
}
