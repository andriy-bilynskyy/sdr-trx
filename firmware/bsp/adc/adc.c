/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    ADC driver source file
*/

#include "adc.h"
#include "adc_conf.h"
#include "stm32f4xx_conf.h"
#include <math.h>


static volatile uint16_t adc_data[ADC_FILTER_ORDER][ADC_NUM_CH] = {0};


static float       adc_ntc_temperature(float r);
static swr_meter_t adc_swr_meter(uint16_t adc_fwd, uint16_t adc_rev);


void adc_start(void) {

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2, ENABLE);    /* See RM p218 */

    GPIO_WriteBit(ADC_PORT, ADC_VBAT_PIN,         Bit_RESET);
    GPIO_WriteBit(ADC_PORT, ADC_TEMPERATURE1_PIN, Bit_RESET);
    GPIO_WriteBit(ADC_PORT, ADC_TEMPERATURE2_PIN, Bit_RESET);
    GPIO_WriteBit(ADC_PORT, ADC_PWR_FWD_PIN,      Bit_RESET);
    GPIO_WriteBit(ADC_PORT, ADC_PWR_REV_PIN,      Bit_RESET);

    GPIO_InitTypeDef  gpio = {
        .GPIO_Pin = ADC_VBAT_PIN | ADC_TEMPERATURE1_PIN | ADC_TEMPERATURE2_PIN | ADC_PWR_FWD_PIN | ADC_PWR_REV_PIN,
        .GPIO_Mode = GPIO_Mode_AN,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_Low_Speed
    };
    GPIO_Init(ADC_PORT, &gpio);

    ADC_CommonInitTypeDef adc_com;
    ADC_CommonStructInit(&adc_com);
    adc_com.ADC_Prescaler = ADC_Prescaler_Div8;
    ADC_CommonInit(&adc_com);

    ADC_InitTypeDef adc;
    ADC_StructInit(&adc);
    adc.ADC_ScanConvMode = ENABLE;
    adc.ADC_ContinuousConvMode = ENABLE;
    adc.ADC_NbrOfConversion = ADC_NUM_CH;
    ADC_Init(ADC1, &adc);

    ADC_RegularChannelConfig(ADC1, ADC_VBAT_CH,         ADC_VBAT_ID + 1,         ADC_SampleTime_480Cycles);
    ADC_RegularChannelConfig(ADC1, ADC_TEMPERATURE1_CH, ADC_TEMPERATURE1_ID + 1, ADC_SampleTime_480Cycles);
    ADC_RegularChannelConfig(ADC1, ADC_TEMPERATURE2_CH, ADC_TEMPERATURE2_ID + 1, ADC_SampleTime_480Cycles);
    ADC_RegularChannelConfig(ADC1, ADC_PWR_FWD_CH,      ADC_PWR_FWD_ID + 1,      ADC_SampleTime_480Cycles);
    ADC_RegularChannelConfig(ADC1, ADC_PWR_REV_CH,      ADC_PWR_REV_ID + 1,      ADC_SampleTime_480Cycles);

    ADC_Cmd(ADC1, ENABLE);
    ADC_DMACmd(ADC1, ENABLE);
    ADC_DMARequestAfterLastTransferCmd(ADC1, ENABLE);

    DMA_InitTypeDef dma;
    DMA_StructInit(&dma);
    dma.DMA_Channel = DMA_Channel_0;
    dma.DMA_Priority = ADC_DMA_PRIO;
    dma.DMA_DIR = DMA_DIR_PeripheralToMemory;
    dma.DMA_PeripheralBaseAddr = (uint32_t)&(ADC1->DR);
    dma.DMA_Memory0BaseAddr = (uint32_t)adc_data;
    dma.DMA_BufferSize = ADC_FILTER_ORDER * ADC_NUM_CH;
    dma.DMA_MemoryInc = DMA_MemoryInc_Enable;
    dma.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
    dma.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
    dma.DMA_Mode = DMA_Mode_Circular;
    DMA_Init(DMA2_Stream0, &dma);
    DMA_Cmd(DMA2_Stream0, ENABLE);

    ADC_SoftwareStartConv(ADC1);
}

void adc_stop(void) {

    DMA_Cmd(DMA2_Stream0, DISABLE);
    DMA_DeInit(DMA2_Stream0);

    ADC_DMARequestAfterLastTransferCmd(ADC1, DISABLE);
    ADC_DMACmd(ADC1, DISABLE);
    ADC_Cmd(ADC1, DISABLE);

    ADC_DeInit();

    ADC_CommonInitTypeDef adc_com;
    ADC_CommonStructInit(&adc_com);
    ADC_CommonInit(&adc_com);

    GPIO_InitTypeDef  gpio = {
        .GPIO_Pin = ADC_VBAT_PIN | ADC_TEMPERATURE1_PIN | ADC_TEMPERATURE2_PIN | ADC_PWR_FWD_PIN | ADC_PWR_REV_PIN,
        .GPIO_Mode = GPIO_Mode_IN,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_Low_Speed
    };
    GPIO_Init(ADC_PORT, &gpio);

    GPIO_WriteBit(ADC_PORT, ADC_VBAT_PIN,         Bit_RESET);
    GPIO_WriteBit(ADC_PORT, ADC_TEMPERATURE1_PIN, Bit_RESET);
    GPIO_WriteBit(ADC_PORT, ADC_TEMPERATURE2_PIN, Bit_RESET);
    GPIO_WriteBit(ADC_PORT, ADC_PWR_FWD_PIN,      Bit_RESET);
    GPIO_WriteBit(ADC_PORT, ADC_PWR_REV_PIN,      Bit_RESET);

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, DISABLE);
}

float adc_batt_voltage(void) {

    uint32_t acc = 0;
    for(uint8_t i = 0; i < ADC_FILTER_ORDER; i++) {
        acc += adc_data[i][ADC_VBAT_ID];
    }
    acc /= ADC_FILTER_ORDER;

    return ADC_VBAT_SCALING * acc;
}

float adc_temperature1(void) {

    uint32_t acc = 0;
    for(uint8_t i = 0; i < ADC_FILTER_ORDER; i++) {
        acc += adc_data[i][ADC_TEMPERATURE1_ID];
    }
    acc /= ADC_FILTER_ORDER;

    return adc_ntc_temperature((ADC_TEMPERATURE_R * acc) / (4095 - acc));
}

float adc_temperature2(void) {

    uint32_t acc = 0;
    for(uint8_t i = 0; i < ADC_FILTER_ORDER; i++) {
        acc += adc_data[i][ADC_TEMPERATURE2_ID];
    }
    acc /= ADC_FILTER_ORDER;

    return adc_ntc_temperature((ADC_TEMPERATURE_R * acc) / (4095 - acc));
}

swr_meter_t adc_swr(void) {

    uint32_t acc_f = 0, acc_r = 0;
    for(uint8_t i = 0; i < ADC_FILTER_ORDER; i++) {
        acc_f += adc_data[i][ADC_PWR_FWD_ID];
        acc_r += adc_data[i][ADC_PWR_REV_ID];
    }
    acc_f /= ADC_FILTER_ORDER;
    acc_r /= ADC_FILTER_ORDER;

    return adc_swr_meter(acc_f, acc_r);
}


/*******************************************************************************
 * See for details: https://en.wikipedia.org/wiki/Thermistor
 * NTC thermistors can also be characterized with the B (or β) parameter equation,
 * which is essentially the Steinhart–Hart equation
 ******************************************************************************/
static float adc_ntc_temperature(float r) {

    return (float)((ADC_TEMPERATURE_T0 + 273) * ADC_TEMPERATURE_B) / (logf(r / ADC_TEMPERATURE_R0) * (ADC_TEMPERATURE_T0 + 273) + ADC_TEMPERATURE_B) - 273;
}

/*******************************************************************************
 * See for details: calculations/swr-meter.ods
 * SWR description: https://en.wikipedia.org/wiki/Standing_wave_ratio
 ******************************************************************************/
static swr_meter_t adc_swr_meter(uint16_t adc_fwd, uint16_t adc_rev) {

    float p_fwd = ADC_SWR_METER_A2 * adc_fwd * adc_fwd + ADC_SWR_METER_A1 * adc_fwd + ADC_SWR_METER_A0;
    float p_rev = ADC_SWR_METER_A2 * adc_rev * adc_rev + ADC_SWR_METER_A1 * adc_rev + ADC_SWR_METER_A0;

    p_fwd = p_fwd < 0 ? 0 : p_fwd;
    p_rev = p_rev < 0 ? 0 : p_rev;

    float d = sqrtf(p_rev / p_fwd);

    swr_meter_t result = {
        .power = p_fwd,
        .swr   = (p_fwd < 0.2f) ? NAN : (1.0f + d) / (1.0f - d)
    };

    return result;
}
