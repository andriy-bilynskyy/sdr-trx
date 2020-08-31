/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    key driver header file
*/

#ifndef __KEY_H
#define __KEY_H


typedef enum {
    KEY_RELEASED = 0,
    KEY_PRESSED,
    KEY_HOLD,
    KEY_ACTIVATED
} key_state_t;


void key_start(void);
void key_stop(void);
key_state_t key_pwr(void);
key_state_t key_ptt(void);



#endif
