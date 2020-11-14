/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    codec configuration file
    https://statics.cirrus.com/pubs/proDatasheet/WM8731_v4.9.pdf
*/

#ifndef __CODEC_CONF_H
#define __CODEC_CONF_H

/******************************************************************************
 * Codec audio ADC/DAC half buffer size
 ******************************************************************************/
#define CODEC_BUF_SIZE              2048
/******************************************************************************
 * Codec DMA priority
 ******************************************************************************/
#define CODEC_DMA_PRIO              DMA_Priority_VeryHigh

/******************************************************************************
 * Codec input audio ready interrupt priority
 ******************************************************************************/
#define CODEC_IRQ_PRIO              5


#endif
