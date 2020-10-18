/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    WM8731 definitions header file
    https://statics.cirrus.com/pubs/proDatasheet/WM8731_v4.9.pdf
*/

#ifndef __WM8731_DEF_H
#define __WM8731_DEF_H


/* I2C address */
#define WM8731_I2C_ADDR                         0x1A

/*******************************************************************************
 * WM8731 registers
 ******************************************************************************/

#define WM8731_LEFT_LINEIN                      (0<<1)
#define WM8731_RIGHT_LINEIN                     (1<<1)
#define WM8731_LINEIN_INBOTH                    (1<<0)
#define WM8731_LINEIN_INMUTE                    (1<<(7+8))
#define WM8731_LINEIN_INVOL                     (0x1F<<8)
#define WM8731_LINEIN_VOLUME(x)                 (((x)<<8)&WM8731_LINEIN_INVOL)

#define WM8731_LEFT_HPOUT                       (2<<1)
#define WM8731_RIGHT_HPOUT                      (3<<1)
#define WM8731_HPOUT_HPBOTH                     (1<<0)
#define WM8731_HPOUT_ZCEN                       (1<<(7+8))
#define WM8731_HPOUT_HPVOL                      (0x7F<<8)
#define WM8731_HPOUT_VOLUME_MIN                 0x30
#define WM8731_HPOUT_VOLUME(x)                  ((((x)+WM8731_HPOUT_VOLUME_MIN)<<8)&WM8731_HPOUT_HPVOL)

#define WM8731_ANALOG_AUDIO_PATH                (4<<1)
#define WM8731_ANALOG_AUDIO_PATH_SIDEATT        (3<<(6+8))
#define WM8731_ANALOG_AUDIO_PATH_SIDEATT_6DB    (0<<(6+8))
#define WM8731_ANALOG_AUDIO_PATH_SIDEATT_9DB    (1<<(6+8))
#define WM8731_ANALOG_AUDIO_PATH_SIDEATT_12DB   (2<<(6+8))
#define WM8731_ANALOG_AUDIO_PATH_SIDEATT_15DB   (3<<(6+8))
#define WM8731_ANALOG_AUDIO_PATH_SIDETONE       (1<<(5+8))
#define WM8731_ANALOG_AUDIO_PATH_DACSEL         (1<<(4+8))
#define WM8731_ANALOG_AUDIO_PATH_BYPASS         (1<<(3+8))
#define WM8731_ANALOG_AUDIO_PATH_INSEL          (1<<(2+8))
#define WM8731_ANALOG_AUDIO_PATH_INSEL_MIC      (1<<(2+8))
#define WM8731_ANALOG_AUDIO_PATH_INSEL_LINE     (0<<(2+8))
#define WM8731_ANALOG_AUDIO_PATH_MUTEMIC        (1<<(1+8))
#define WM8731_ANALOG_AUDIO_PATH_MICBOOST       (1<<(0+8))


#define WM8731_DIGITAL_AUDIO_PATH               (5<<1)
#define WM8731_DIGITAL_AUDIO_PATH_HPOR          (1<<(4+8))
#define WM8731_DIGITAL_AUDIO_PATH_DACMU         (1<<(3+8))
#define WM8731_DIGITAL_AUDIO_PATH_DEEMP         (3<<(1+8))
#define WM8731_DIGITAL_AUDIO_PATH_DEEMP_DIS     (0<<(1+8))
#define WM8731_DIGITAL_AUDIO_PATH_DEEMP_32      (1<<(1+8))
#define WM8731_DIGITAL_AUDIO_PATH_DEEMP_44      (2<<(1+8))
#define WM8731_DIGITAL_AUDIO_PATH_DEEMP_48      (3<<(1+8))
#define WM8731_DIGITAL_AUDIO_PATH_ADCHPD        (1<<(0+8))

#define WM8731_PD_CTL                           (6<<1)
#define WM8731_PD_CTL_POWEROFF                  (1<<(7+8))
#define WM8731_PD_CTL_CLKOUTPD                  (1<<(6+8))
#define WM8731_PD_CTL_OSCPD                     (1<<(5+8))
#define WM8731_PD_CTL_OUTPD                     (1<<(4+8))
#define WM8731_PD_CTL_DACPD                     (1<<(3+8))
#define WM8731_PD_CTL_ADCPD                     (1<<(2+8))
#define WM8731_PD_CTL_MICPD                     (1<<(1+8))
#define WM8731_PD_CTL_LINEINPD                  (1<<(0+8))

#define WM8731_DIGITAL_AUDIO_FMT                (7<<1)
#define WM8731_DIGITAL_AUDIO_FMTBCLKINV         (1<<(7+8))
#define WM8731_DIGITAL_AUDIO_FMT_MS             (1<<(6+8))
#define WM8731_DIGITAL_AUDIO_FMT_LRSWAP         (1<<(5+8))
#define WM8731_DIGITAL_AUDIO_FMT_LRP            (1<<(4+8))
#define WM8731_DIGITAL_AUDIO_FMT_IWL            (3<<(2+8))
#define WM8731_DIGITAL_AUDIO_FMT_IWL_16B        (0<<(2+8))
#define WM8731_DIGITAL_AUDIO_FMT_IWL_20B        (1<<(2+8))
#define WM8731_DIGITAL_AUDIO_FMT_IWL_24B        (2<<(2+8))
#define WM8731_DIGITAL_AUDIO_FMT_IWL_32B        (3<<(2+8))
#define WM8731_DIGITAL_AUDIO_FMT_FORMAT         (3<<(0+8))
#define WM8731_DIGITAL_AUDIO_FMT_FORMAT_0       (0<<(0+8))
#define WM8731_DIGITAL_AUDIO_FMT_FORMAT_1       (1<<(0+8))
#define WM8731_DIGITAL_AUDIO_FMT_FORMAT_2       (2<<(0+8))
#define WM8731_DIGITAL_AUDIO_FMT_FORMAT_3       (3<<(0+8))

#define WM8731_SAMPLING_CTL                     (8<<1)
#define WM8731_SAMPLING_CTL_CLKODIV2            (1<<(7+8))
#define WM8731_SAMPLING_CTL_CLKIDIV2            (1<<(6+8))
#define WM8731_SAMPLING_CTL_SR                  (15<<(2+8))
#define WM8731_SAMPLING_CTL_BOSR                (1<<(1+8))
#define WM8731_SAMPLING_CTL_MODE                (1<<(0+8))

#define WM8731_ACTIVE_CTL                       (9<<1)
#define WM8731_ACTIVE_CTL_ACTIVE                (1<<(0+8))

#define WM8731_RESET                            (15<<1)

#endif
