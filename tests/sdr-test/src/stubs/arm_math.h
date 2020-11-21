/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    arm_math CMSIS stub header file
*/


#ifndef __ARM_MATH_STUB_H
#define __ARM_MATH_STUB_H


#include <stdint.h>
#include <math.h>


#ifndef PI
#define PI               3.14159265358979f
#endif


typedef enum {
    ARM_MATH_SUCCESS        =  0,        /**< No error */
    ARM_MATH_ARGUMENT_ERROR = -1,        /**< One or more arguments are incorrect */
    ARM_MATH_LENGTH_ERROR   = -2,        /**< Length of data buffer is incorrect */
    ARM_MATH_SIZE_MISMATCH  = -3,        /**< Size of matrices is not compatible with the operation */
    ARM_MATH_NANINF         = -4,        /**< Not-a-number (NaN) or infinity is generated */
    ARM_MATH_SINGULAR       = -5,        /**< Input matrix is singular and cannot be inverted */
    ARM_MATH_TEST_FAILURE   = -6         /**< Test Failed */
} arm_status;

typedef struct {
    uint16_t    length;
} arm_cfft_instance_f32;

typedef float float32_t;


arm_status  arm_cfft_init_f32(arm_cfft_instance_f32 * S, uint16_t fftLen);
void        arm_cfft_f32(const arm_cfft_instance_f32 * S, float32_t * p1, uint8_t ifftFlag, uint8_t bitReverseFlag);
void        arm_cmplx_mag_f32(const float32_t * pSrc, float32_t * pDst, uint32_t numSamples);


#endif
