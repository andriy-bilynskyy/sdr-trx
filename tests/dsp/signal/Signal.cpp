/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#include "Signal.h"
#include <algorithm>


Signal::Signal(double fSample, double tStart, double tEnd, double (* sigFunc) (double)) {
    m_size = fSample > 0 && tEnd > tStart ? (uint32_t)((tEnd - tStart) * fSample + 1) : 0;
    m_time = new double[m_size];
    m_magnitude = new double[m_size];
    double tStep = 1 / fSample;
    for(uint32_t i = 0; i < m_size; i++) {
        m_time[i] = tStep * i;
        m_magnitude[i] = sigFunc(m_time[i]);
    }
}

Signal::~Signal() {
    delete [] m_time;
    delete [] m_magnitude;
}

void Signal::filter(const double impulseResponse[], uint32_t order) {
    double * tmp = new double[m_size];
    for(uint32_t j = 0; j < m_size; j++) {
        tmp[j] = 0;
        if(j >= order) {
            for(uint32_t i = 0; i < order; i++) {
                tmp[j] += m_magnitude[j - i] * impulseResponse[i];
            }
        }
    }
    std::copy(&tmp[0], &tmp[m_size], &m_magnitude[0]);
    delete [] tmp;
}
