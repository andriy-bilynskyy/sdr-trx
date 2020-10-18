/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Codec driver types header file
    https://statics.cirrus.com/pubs/proDatasheet/WM8731_v4.9.pdf
*/


#ifndef __CODEC_TYPES_H
#define __CODEC_TYPES_H


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
    OUT_MUTE,
    OUT_MIC,
    OUT_LINE,
    OUT_DAC
} out_src_t;

typedef enum {
    INP_MIC,
    INP_LINE,
} inp_src_t;


#endif
