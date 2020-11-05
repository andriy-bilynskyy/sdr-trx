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
#include <string.h>


#define RTC_LSE_STARTUP_TIMEOUT_SEC    15
#define RTC_SRAM_SIZE                  (20 * 4)


static const date_time_t rtc_default_time = {
    .hours      = 0,
    .minutes    = 0,
    .seconds    = 0,
    .day        = 1,
    .month      = 1,
    .year       = 2020
};


bool rtc_init(void) {

    bool inited = false;

    if(!rtc_is_inited()) {
        DBG_OUT("RTC not initialized. initializing...");
        PWR_BackupAccessCmd(ENABLE);
        /* reset backup registers */
        RCC_BackupResetCmd(ENABLE);
        RCC_BackupResetCmd(DISABLE);
        /* LSE start */
        RCC_LSEConfig(RCC_LSE_ON);
        volatile uint32_t startup_cnt = RTC_LSE_STARTUP_TIMEOUT_SEC;
        FlagStatus lse_started;
        do {
            misc_hal_sleep_ms(1000);
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

bool rtc_is_inited(void) {
    return ((RCC->BDCR & RCC_BDCR_RTCEN) == RCC_BDCR_RTCEN && (RCC->BDCR & RCC_BDCR_LSERDY) == RCC_BDCR_LSERDY);
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

bool rtc_set_time(const date_time_t * time) {

    bool result = false;
    if(rtc_is_inited()) {
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
        result = true;
    }
    return result;
}

uint8_t rtc_sram_write(uint8_t offset, const void * data, uint8_t size) {

    uint32_t wr_byres = size < RTC_SRAM_SIZE - offset ? size : RTC_SRAM_SIZE - offset;
    if(wr_byres) {
        uint8_t s32 = offset >> 2;
        uint8_t s8  = offset & 3;
        uint8_t e32 = (offset + wr_byres) >> 2;
        uint8_t e8  = (offset + wr_byres) & 3;

        if(s32 == e32) {
            uint32_t ds = ((uint32_t *)(RTC_BASE + 0x50))[s32];
            for(uint8_t i = s8; i < e8; i++) {
                *(((uint8_t *)&ds) + i) = ((uint8_t *)data)[i - s8];
            }
            PWR_BackupAccessCmd(ENABLE);
            ((uint32_t *)(RTC_BASE + 0x50))[s32] = ds;
            PWR_BackupAccessCmd(DISABLE);
        } else {
            uint32_t ds = ((uint32_t *)(RTC_BASE + 0x50))[s32];
            for(uint8_t i = s8; i < 4; i++) {
                *(((uint8_t *)&ds) + i) = ((uint8_t *)data)[i - s8];
            }
            uint32_t de = ((uint32_t *)(RTC_BASE + 0x50))[e32];
            for(uint8_t i = 0; i < e8; i++) {
                *(((uint8_t *)&de) + i) = ((uint8_t *)data + wr_byres - e8)[i];
            }
            PWR_BackupAccessCmd(ENABLE);
            ((uint32_t *)(RTC_BASE + 0x50))[s32] = ds;
            ((uint32_t *)(RTC_BASE + 0x50))[e32] = de;
            for(uint8_t i = s32 + 1; i < e32; i++) {
                ((uint32_t *)(RTC_BASE + 0x50))[i] = ((uint32_t *)((uint8_t *)data - s8))[i - s32];
            }
            PWR_BackupAccessCmd(DISABLE);
        }
    }
    return wr_byres;
}

uint8_t rtc_sram_read(uint8_t offset, void * data, uint8_t size) {

    uint32_t rd_byres = size < RTC_SRAM_SIZE - offset ? size : RTC_SRAM_SIZE - offset;
    if(rd_byres) {
        uint8_t s32 = offset >> 2;
        uint8_t s8  = offset & 3;
        uint8_t e32 = (offset + rd_byres) >> 2;
        uint8_t e8  = (offset + rd_byres) & 3;

        if(s32 == e32) {
            uint32_t ds = ((uint32_t *)(RTC_BASE + 0x50))[s32];
            for(uint8_t i = s8; i < e8; i++) {
                ((uint8_t *)data)[i - s8] = *(((uint8_t *)&ds) + i);
            }
        } else {
            uint32_t ds = ((uint32_t *)(RTC_BASE + 0x50))[s32];
            for(uint8_t i = s8; i < 4; i++) {
                ((uint8_t *)data)[i - s8] = *(((uint8_t *)&ds) + i);
            }
            uint32_t de = ((uint32_t *)(RTC_BASE + 0x50))[e32];
            for(uint8_t i = 0; i < e8; i++) {
                ((uint8_t *)data + rd_byres - e8)[i] = *(((uint8_t *)&de) + i);
            }
            for(uint8_t i = s32 + 1; i < e32; i++) {
                ((uint32_t *)((uint8_t *)data - s8))[i - s32] = ((uint32_t *)(RTC_BASE + 0x50))[i];
            }
        }
    }
    return rd_byres;
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
