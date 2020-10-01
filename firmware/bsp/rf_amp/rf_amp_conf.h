/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    RF amplifier driver configuration file
    Controlling LDMOS bias voltage using AD5243 digital potentiometer
    https://www.analog.com/media/en/technical-documentation/data-sheets/AD5243_5248.pdf
*/

#ifndef __RF_AMP_CONF_H
#define __RF_AMP_CONF_H


/* AD5243 minimum voltage */
#define RF_AMP_MINV     3.2f
/* AD5243 maximum voltage */
#define RF_AMP_MAXV     3.8f


#endif
