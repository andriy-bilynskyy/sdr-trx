/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#include "window_base.h"
#include <stdio.h>
#include <math.h>


void WindowBase::print(size_t col, bool isDouble) {
    if(m_H[0]) {
        printf("H[%u] = {\n", (unsigned int)m_M);
        bool eol_printed = true;
        for(size_t i = 0; i < m_M; i++) {
            if(isDouble) {
                printf("\t%.14E", m_H[0][i]);
            } else {
                printf("\t%.6E", m_H[0][i]);
            }
            if(i != m_M - 1) {
                printf(",");
            }
            eol_printed = false;
            if(!((i + 1) % col)) {
                printf("\n");
                eol_printed = true;
            }
        }
        if(!eol_printed) {
            printf("\n");
        }
        printf("};\n");
    }
}

void WindowBase::set_order(double f_sample, double df_tran, bool is_order_pow2) {
    if(f_sample > 0 && df_tran > 0 && df_tran/f_sample < 0.5) {
        m_M = (size_t)(4. * f_sample/df_tran);
        if(is_order_pow2) {
            size_t tmp = 1;
            while(tmp <= m_M) {
                tmp <<= 1;
            }
            m_M = tmp;
        }
    }
}

void WindowBase::mk_lpf(size_t id, double f_sample, double f_cut, window_type_t win_type) {
    if(id < 2 && f_sample > 0 && f_cut > 0 && f_cut/f_sample < 0.5) {
        if(m_H[id]) {
            delete [] m_H[id];
        }
        m_H[id] = new double[m_M];

    }

    double f = f_cut / f_sample;
    ssize_t m = (ssize_t)m_M - 1;
    double sum = 0;
    for(ssize_t i = 0; i < (ssize_t)m_M; i++) {
        if(!(i - m/2)) {
            m_H[id][i] = 2.* M_PI * f;
        } else {
            m_H[id][i] = sin(2.* M_PI * f * (i - m/2)) / (i - m/2);
            switch(win_type) {
            case HAMMING:
                m_H[id][i] *= window_hamming(i);
                break;
            case BLACKMAN:
            default:
                m_H[id][i] *= window_blackman(i);
                break;
            }
        }
        sum += m_H[id][i];
    }
    for(size_t i = 0; i < m_M; i++) {
        m_H[id][i] /= sum;
    }
}

void WindowBase::inverse(size_t id) {
    if(m_H[id] && m_M) {
        for(size_t i = 0; i < m_M; i++) {
            m_H[id][i] = -m_H[id][i];
        }
        m_H[id][(m_M - 1) / 2] += 1;
    }
}

void WindowBase::summation_free() {
    if(m_H[0] && m_H[1]) {
        for(size_t i = 0; i < m_M; i++) {
            m_H[0][i] += m_H[1][i];
        }
        delete [] m_H[1];
        m_H[1] = NULL;
    }
}

double WindowBase::window_hamming(ssize_t i) {
    if(!m_M) {
        return 0.;
    }
    return 0.54 - 0.46*cos(2.*M_PI * i/m_M);
}

double WindowBase::window_blackman(ssize_t i) {
    if(!m_M) {
        return 0.;
    }
    return 0.42 - 0.5*cos(2.*M_PI * i/m_M) + 0.08*cos(4.*M_PI * i/m_M);
}
