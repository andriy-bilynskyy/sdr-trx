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


#define CODEC_INPUT_GAIN_OFFSET     (-34.5f)
#define CODEC_INPUT_GAIN_STEP       (1.5f)


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

typedef void (*codec_data_ready_cb_t)(void);


#endif
