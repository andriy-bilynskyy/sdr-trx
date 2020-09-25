/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    ADC driver configuration file
*/

#ifndef __ADC_CONF_H
#define __ADC_CONF_H


/* ADC GPIO Port */
#define ADC_PORT                GPIOA
/* Temperature channel 1 */
#define ADC_TEMPERATURE1_PIN    GPIO_Pin_0
#define ADC_TEMPERATURE1_CH     ADC_Channel_0
#define ADC_TEMPERATURE1_ID     1
/* Temperature channel 2 */
#define ADC_TEMPERATURE2_PIN    GPIO_Pin_1
#define ADC_TEMPERATURE2_CH     ADC_Channel_1
#define ADC_TEMPERATURE2_ID     2
/* SWR meter forward power */
#define ADC_PWR_FWD_PIN         GPIO_Pin_2
#define ADC_PWR_FWD_CH          ADC_Channel_2
#define ADC_PWR_FWD_ID          3
/* SWR meter reverse power */
#define ADC_PWR_REV_PIN         GPIO_Pin_3
#define ADC_PWR_REV_CH          ADC_Channel_3
#define ADC_PWR_REV_ID          4
/* Battery voltage channel */
#define ADC_VBAT_PIN            GPIO_Pin_4
#define ADC_VBAT_CH             ADC_Channel_4
#define ADC_VBAT_ID             0
/* Common ADC data */
#define ADC_NUM_CH              5
#define ADC_DMA_PRIO            DMA_Priority_Medium
#define ADC_FILTER_ORDER        8

/*******************************************************************************
 * Measurement circuit parameters
 ******************************************************************************/
/* Battery voltage scaling */
#define ADC_VBAT_SCALING        ((3.3f * (36 + 10)) / (4095 * 10))
/* Temperature channels data */
#define ADC_TEMPERATURE_R       10.0f
#define ADC_TEMPERATURE_R0      10.0f
#define ADC_TEMPERATURE_T0      25UL
#define ADC_TEMPERATURE_B       3435UL
/* SWR meter */
#define ADC_SWR_METER_A0        0.116213338078251f
#define ADC_SWR_METER_A1        -0.000984176503898f
#define ADC_SWR_METER_A2        1.77923489461134E-6f


#endif
