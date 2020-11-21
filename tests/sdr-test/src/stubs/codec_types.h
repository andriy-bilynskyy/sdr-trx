/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    codec stub types header file
*/


#ifndef __CODEC_TYPES_STUB_H
#define __CODEC_TYPES_STUB_H


#include <stdint.h>
#include <stdbool.h>


#define CODEC_OUTPUT_MAX_VOLUME     (0x7F-0x30)
#define CODEC_INPUT_MAX_VOLUME      0x1F
#define CODEC_MIC_MAX_VOLUME        0x1


typedef struct {
    uint8_t volume;
    bool    mute;
} codec_volume_t;

typedef enum {
    CODEC_OUT_MUTE,
    CODEC_OUT_MIC,
    CODEC_OUT_LINE,
    CODEC_OUT_DAC
} codec_out_src_t;

typedef enum {
    CODEC_INP_MIC,
    CODEC_INP_LINE
} codec_inp_src_t;

typedef enum {
    CODEC_SR_8K,
    CODEC_SR_32K,
    CODEC_SR_48K,
    CODEC_SR_96K
} codec_sample_rate_t;

typedef struct {
    int16_t left;
    int16_t right;
} codec_sample_t;


#endif