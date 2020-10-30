/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    WM8731 i2s interface driver source file
    https://statics.cirrus.com/pubs/proDatasheet/WM8731_v4.9.pdf
*/


#include "wm8731_i2s.h"
#include "wm8731_def.h"
#include "codec_conf.h"
#include "stm32f4xx_conf.h"
#include <stddef.h>


/******************************************************************************
 * WM8231 I2S interface connection
 ******************************************************************************/
/* I2S common */
#define CODEC_I2S               SPI2
#define CODEC_I2S_EXT           I2S2ext
#define CODEC_I2S_APB_CMD       RCC_APB1PeriphClockCmd
#define CODEC_I2S_PERIPH        RCC_APB1Periph_SPI2
/* I2S CLK */
#define CODEC_SCLK_PORT         GPIOB
#define CODEC_SCLK_PIN          GPIO_Pin_13
#define CODEC_SCLK_PIN_SRC      GPIO_PinSource13
#define CODEC_SCLK_AF           GPIO_AF_SPI2
/* I2S LR */
#define CODEC_LRCK_PORT         GPIOB
#define CODEC_LRCK_PIN          GPIO_Pin_12
#define CODEC_LRCK_PIN_SRC      GPIO_PinSource12
#define CODEC_LRCK_AF           GPIO_AF_SPI2
/* I2S SDO */
#define CODEC_SD_PORT           GPIOB
#define CODEC_SD_PIN            GPIO_Pin_15
#define CODEC_SD_PIN_SRC        GPIO_PinSource15
#define CODEC_SD_AF             GPIO_AF_SPI2
/* I2S SDI */
#define CODEC_SDEXT_PORT        GPIOB
#define CODEC_SDEXT_PIN         GPIO_Pin_14
#define CODEC_SDEXT_PIN_SRC     GPIO_PinSource14
#define CODEC_SDEXT_AF          GPIO_AF_I2S2ext
/* I2S MCLK */
#define CODEC_MCLK_PORT         GPIOC
#define CODEC_MCLK_PIN          GPIO_Pin_6
#define CODEC_MCLK_PIN_SRC      GPIO_PinSource6
#define CODEC_MCLK_AF           GPIO_AF_SPI2
/* I2S DMA TX */
#define CODEC_I2S_TX_CHANNEL    DMA_Channel_0
#define CODEC_I2S_TX_STREAM     DMA1_Stream4
/* I2S DMA RX */
#define CODEC_I2S_RX_CHANNEL    DMA_Channel_3
#define CODEC_I2S_RX_STREAM     DMA1_Stream3
#define CODEC_I2S_RX_TCIF       DMA_FLAG_TCIF3
#define CODEC_I2S_RX_HTIF       DMA_FLAG_HTIF3
/* I2S IRQ */
#define CODEC_I2S_IRQn          DMA1_Stream3_IRQn
#define CODEC_I2S_IRQHandler    DMA1_Stream3_IRQHandler


static uint16_t                 wm8731_dac_buffer[2][CODEC_BUF_SIZE] = {0};
static uint16_t                 wm8731_adc_buffer[2][CODEC_BUF_SIZE] = {0};
static volatile uint8_t         wm8731_active_buf = 1;
static codec_data_ready_cb_t    wm8731_data_ready_cb = NULL;


void wm8731_i2s_start(codec_sample_rate_t sr) {

    CODEC_I2S_APB_CMD(CODEC_I2S_PERIPH, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1, ENABLE);

    GPIO_WriteBit(CODEC_SCLK_PORT,  CODEC_SCLK_PIN,  Bit_RESET);
    GPIO_WriteBit(CODEC_LRCK_PORT,  CODEC_LRCK_PIN,  Bit_RESET);
    GPIO_WriteBit(CODEC_SD_PORT,    CODEC_SD_PIN,    Bit_RESET);
    GPIO_WriteBit(CODEC_SDEXT_PORT, CODEC_SDEXT_PIN, Bit_RESET);
    GPIO_WriteBit(CODEC_MCLK_PORT,  CODEC_MCLK_PIN,  Bit_RESET);

    GPIO_PinAFConfig(CODEC_SCLK_PORT,  CODEC_SCLK_PIN_SRC,  CODEC_SCLK_AF);
    GPIO_PinAFConfig(CODEC_LRCK_PORT,  CODEC_LRCK_PIN_SRC,  CODEC_LRCK_AF);
    GPIO_PinAFConfig(CODEC_SD_PORT,    CODEC_SD_PIN_SRC,    CODEC_SD_AF);
    GPIO_PinAFConfig(CODEC_SDEXT_PORT, CODEC_SDEXT_PIN_SRC, CODEC_SDEXT_AF);
    GPIO_PinAFConfig(CODEC_MCLK_PORT,  CODEC_MCLK_PIN_SRC,  CODEC_MCLK_AF);

    GPIO_InitTypeDef  gpio = {
        .GPIO_Mode = GPIO_Mode_AF,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_High_Speed
    };

    gpio.GPIO_Pin = CODEC_SCLK_PIN;
    GPIO_Init(CODEC_SCLK_PORT, &gpio);
    gpio.GPIO_Pin = CODEC_LRCK_PIN;
    GPIO_Init(CODEC_LRCK_PORT, &gpio);
    gpio.GPIO_Pin = CODEC_SD_PIN;
    GPIO_Init(CODEC_SD_PORT, &gpio);
    gpio.GPIO_Pin = CODEC_SDEXT_PIN;
    GPIO_Init(CODEC_SDEXT_PORT, &gpio);
    gpio.GPIO_Pin = CODEC_MCLK_PIN;
    GPIO_Init(CODEC_MCLK_PORT, &gpio);

    I2S_InitTypeDef i2s = {
        .I2S_Mode = I2S_Mode_MasterTx,
        .I2S_Standard = I2S_Standard_Phillips,
        .I2S_DataFormat = I2S_DataFormat_16b,
        .I2S_MCLKOutput = I2S_MCLKOutput_Enable,
        .I2S_CPOL = I2S_CPOL_Low
    };
    switch(sr) {
    case CODEC_SR_8K:
        i2s.I2S_AudioFreq = I2S_AudioFreq_8k;
        break;
    case CODEC_SR_32K:
        i2s.I2S_AudioFreq = I2S_AudioFreq_32k;
        break;
    case CODEC_SR_48K:
        i2s.I2S_AudioFreq = I2S_AudioFreq_48k;
        break;
    case CODEC_SR_96K:
    default:
        i2s.I2S_AudioFreq = I2S_AudioFreq_96k;
        break;
    }
    I2S_Init(CODEC_I2S, &i2s);
    I2S_FullDuplexConfig(CODEC_I2S_EXT, &i2s);

    I2S_Cmd(CODEC_I2S, ENABLE);
    I2S_Cmd(CODEC_I2S_EXT, ENABLE);
    SPI_I2S_DMACmd(CODEC_I2S, SPI_I2S_DMAReq_Tx, ENABLE);
    SPI_I2S_DMACmd(CODEC_I2S_EXT, SPI_I2S_DMAReq_Rx, ENABLE);

    for(uint32_t i = 0; i < CODEC_BUF_SIZE; i++) {
        wm8731_dac_buffer[0][i] = ((uint16_t)(-1) / 2);
        wm8731_dac_buffer[1][i] = ((uint16_t)(-1) / 2);
    }
    wm8731_active_buf = 1;
    wm8731_data_ready_cb = NULL;

    DMA_InitTypeDef dma;
    DMA_StructInit(&dma);
    dma.DMA_Priority = CODEC_DMA_PRIO;
    dma.DMA_BufferSize = CODEC_BUF_SIZE * 2;
    dma.DMA_MemoryInc = DMA_MemoryInc_Enable;
    dma.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
    dma.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
    dma.DMA_Mode = DMA_Mode_Circular;
    /* DAC */
    dma.DMA_Channel = CODEC_I2S_TX_CHANNEL;
    dma.DMA_DIR = DMA_DIR_MemoryToPeripheral;
    dma.DMA_PeripheralBaseAddr = (uint32_t)&(CODEC_I2S->DR);
    dma.DMA_Memory0BaseAddr = (uint32_t)wm8731_dac_buffer;
    DMA_Init(CODEC_I2S_TX_STREAM, &dma);
    DMA_Cmd(CODEC_I2S_TX_STREAM, ENABLE);
    /* ADC */
    dma.DMA_Channel = CODEC_I2S_RX_CHANNEL;
    dma.DMA_DIR = DMA_DIR_PeripheralToMemory;
    dma.DMA_PeripheralBaseAddr = (uint32_t)&(CODEC_I2S_EXT->DR);
    dma.DMA_Memory0BaseAddr = (uint32_t)wm8731_adc_buffer;
    DMA_Init(CODEC_I2S_RX_STREAM, &dma);
    DMA_Cmd(CODEC_I2S_RX_STREAM, ENABLE);

    DMA_ITConfig(CODEC_I2S_RX_STREAM, DMA_IT_TC | DMA_IT_HT, ENABLE);
    NVIC_SetPriority(CODEC_I2S_IRQn, CODEC_IRQ_PRIO);
    NVIC_EnableIRQ(CODEC_I2S_IRQn);
}

void wm8731_i2s_stop(void) {

    NVIC_DisableIRQ(CODEC_I2S_IRQn);
    DMA_ITConfig(CODEC_I2S_RX_STREAM, DMA_IT_TC | DMA_IT_HT, DISABLE);

    DMA_Cmd(CODEC_I2S_RX_STREAM, DISABLE);
    DMA_Cmd(CODEC_I2S_TX_STREAM, DISABLE);
    DMA_DeInit(CODEC_I2S_RX_STREAM);
    DMA_DeInit(CODEC_I2S_TX_STREAM);

    SPI_I2S_DMACmd(CODEC_I2S_EXT, SPI_I2S_DMAReq_Rx, DISABLE);
    SPI_I2S_DMACmd(CODEC_I2S, SPI_I2S_DMAReq_Tx, DISABLE);
    I2S_Cmd(CODEC_I2S_EXT, ENABLE);
    I2S_Cmd(CODEC_I2S, DISABLE);

    SPI_I2S_DeInit(CODEC_I2S);

    GPIO_InitTypeDef  gpio = {
        .GPIO_Mode = GPIO_Mode_IN,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_Low_Speed
    };

    gpio.GPIO_Pin = CODEC_SCLK_PIN;
    GPIO_Init(CODEC_SCLK_PORT, &gpio);
    gpio.GPIO_Pin = CODEC_LRCK_PIN;
    GPIO_Init(CODEC_LRCK_PORT, &gpio);
    gpio.GPIO_Pin = CODEC_SD_PIN;
    GPIO_Init(CODEC_SD_PORT, &gpio);
    gpio.GPIO_Pin = CODEC_SDEXT_PIN;
    GPIO_Init(CODEC_SDEXT_PORT, &gpio);
    gpio.GPIO_Pin = CODEC_MCLK_PIN;
    GPIO_Init(CODEC_MCLK_PORT, &gpio);

    GPIO_WriteBit(CODEC_SCLK_PORT,  CODEC_SCLK_PIN,  Bit_RESET);
    GPIO_WriteBit(CODEC_LRCK_PORT,  CODEC_LRCK_PIN,  Bit_RESET);
    GPIO_WriteBit(CODEC_SD_PORT,    CODEC_SD_PIN,    Bit_RESET);
    GPIO_WriteBit(CODEC_SDEXT_PORT, CODEC_SDEXT_PIN, Bit_RESET);
    GPIO_WriteBit(CODEC_MCLK_PORT,  CODEC_MCLK_PIN,  Bit_RESET);

    CODEC_I2S_APB_CMD(CODEC_I2S_PERIPH, DISABLE);
}

void CODEC_I2S_IRQHandler(void) {

    if(DMA_GetFlagStatus(CODEC_I2S_RX_STREAM, CODEC_I2S_RX_HTIF)) {
        wm8731_active_buf = 0;
        DMA_ClearFlag(CODEC_I2S_RX_STREAM, CODEC_I2S_RX_HTIF);
    }
    if(DMA_GetFlagStatus(CODEC_I2S_RX_STREAM, CODEC_I2S_RX_TCIF)) {
        wm8731_active_buf = 1;
        DMA_ClearFlag(CODEC_I2S_RX_STREAM, CODEC_I2S_RX_TCIF);
    }
    if(wm8731_data_ready_cb) {
        wm8731_data_ready_cb();
    }
}

void wm8731_i2s_set_callback(codec_data_ready_cb_t adc_data_ready) {

    wm8731_data_ready_cb = adc_data_ready;
}

const uint16_t * wm8731_i2s_get_input_buf() {

    return wm8731_adc_buffer[wm8731_active_buf];
}

uint16_t * wm8731_i2s_get_output_buf() {

    return wm8731_dac_buffer[wm8731_active_buf];
}
