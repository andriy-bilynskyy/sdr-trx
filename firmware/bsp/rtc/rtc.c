/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    RTC source file
*/


#include "rtc.h"
#include "stm32f4xx_conf.h"
#include "misc_hal.h"
#include "debug.h"


#define RTC_LSE_STARTUP_TIMEOUT_MS     10000


static const date_time_t rtc_default_time = {
    .hours = 0,
    .minutes = 0,
    .seconds = 0,
    .day = 1,
    .month = 1,
    .year = 2020
};

date_time_t dummy;

bool rtc_init(void) {

    bool inited = false;

    if((RCC->BDCR & RCC_BDCR_RTCEN) != RCC_BDCR_RTCEN) {
        DBG_OUT("RTC not initialized. initializing...");
        PWR_BackupAccessCmd(ENABLE);
        /* reset backup registers */
        RCC_BackupResetCmd(ENABLE);
        RCC_BackupResetCmd(DISABLE);
        /* LSE start */
        RCC_LSEModeConfig(RCC_LSE_HIGHDRIVE_MODE);
        RCC_LSEConfig(RCC_LSE_ON);
        volatile uint32_t startup_cnt = RTC_LSE_STARTUP_TIMEOUT_MS;
        FlagStatus lse_started;
        do {
            misc_hal_sleep_ms(1);
            lse_started = RCC_GetFlagStatus(RCC_FLAG_LSERDY);
            startup_cnt--;
        } while(lse_started == RESET && startup_cnt);
        if(lse_started == SET) {
            DBG_OUT("LSE ok");
            RCC_RTCCLKConfig(RCC_RTCCLKSource_LSE);
            RCC_RTCCLKCmd(ENABLE);

            RTC_InitTypeDef rtc;
            RTC_StructInit(&rtc);
            if(RTC_Init(&rtc) == SUCCESS) {
                if(RTC_WaitForSynchro() == SUCCESS) {
                    inited = true;
                    rtc_set_time(&rtc_default_time);
                    DBG_OUT("RTC ok");
                } else {
                    RCC_BackupResetCmd(ENABLE);
                    RCC_BackupResetCmd(DISABLE);
                    DBG_OUT("RTC not synchronized");
                }
            } else {
                RCC_BackupResetCmd(ENABLE);
                RCC_BackupResetCmd(DISABLE);
                DBG_OUT("RTC initializing failed");
            }
        } else {
            RCC_BackupResetCmd(ENABLE);
            RCC_BackupResetCmd(DISABLE);
            DBG_OUT("LSE failed");
        }
        PWR_BackupAccessCmd(DISABLE);
    } else {
        inited = true;
    }
    return inited;
}

void rtc_reset(void) {

    PWR_BackupAccessCmd(ENABLE);
    RCC_BackupResetCmd(ENABLE);
    RCC_BackupResetCmd(DISABLE);
    PWR_BackupAccessCmd(DISABLE);
}

date_time_t rtc_get_time(void) {

    RTC_TimeTypeDef rtc_time;
    RTC_DateTypeDef rtc_date;
    RTC_GetTime(RTC_Format_BIN, &rtc_time);
    RTC_GetDate(RTC_Format_BIN, &rtc_date);

    date_time_t time = {
        .hours = rtc_time.RTC_Hours,
        .minutes = rtc_time.RTC_Minutes,
        .seconds = rtc_time.RTC_Seconds,
        .day = rtc_date.RTC_Date,
        .month = rtc_date.RTC_Month,
        .year = (uint16_t)rtc_date.RTC_Year + RTC_YEAR_MIN
    };
    return time;
}

void rtc_set_time(const date_time_t * time) {

    RTC_TimeTypeDef rtc_time = {
        .RTC_Hours   = time->hours,
        .RTC_Minutes = time->minutes,
        .RTC_Seconds = time->seconds,
        .RTC_H12     = RTC_H12_AM
    };
    RTC_DateTypeDef rtc_date = {
        .RTC_WeekDay = rtc_get_weekday(time->year, time->month, time->day),
        .RTC_Month   = time->month,
        .RTC_Date    = time->day,
        .RTC_Year    = time->year - RTC_YEAR_MIN
    };
    if(!rtc_date.RTC_WeekDay) {
        rtc_date.RTC_WeekDay = 7;
    }

    PWR_BackupAccessCmd(ENABLE);
    RTC_SetTime(RTC_Format_BIN, &rtc_time);
    RTC_SetDate(RTC_Format_BIN, &rtc_date);
    PWR_BackupAccessCmd(DISABLE);
}

/* https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week. Sunday = 0*/
uint8_t rtc_get_weekday(uint16_t year, uint8_t month, uint8_t day) {
    year -= month < 3;
    return (year + year/4 - year/100 + year/400 + "\x00\x03\x02\x05\x00\x03\x05\x01\x04\x06\x02\x04"[month - 1] + day) % 7;
}

bool rtc_is_leap_year(uint16_t year) {

    return (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0));
}

uint8_t rtc_days_in_month(uint16_t year, uint8_t month) {

    return "\x1F\x1C\x1F\x1E\x1F\x1E\x1F\x1F\x1E\x1F\x1E\x1F"[month - 1] + (month == 2 && rtc_is_leap_year(year));
}
