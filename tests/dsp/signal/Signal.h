/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#ifndef SIGNAL_H_
#define SIGNAL_H_

#include <stdint.h>


class Signal {
  public:

    Signal(double fSample, double tStart, double tEnd, double (* sigFunc) (double));
    ~Signal();
    uint32_t size() const {
        return m_size;
    }
    double time(uint32_t idx) const {
        return m_time[idx];
    }
    double magnitude(uint32_t idx) const {
        return m_magnitude[idx];
    }
    double * time() const {
        return m_time;
    }
    double * magnitude() const {
        return m_magnitude;
    }

    void filter(const double impulseResponse[], uint32_t order);

  private:

    uint32_t                       m_size;
    double                       * m_time;
    double                       * m_magnitude;

    Signal();
    Signal(const Signal &);
    Signal & operator=(const Signal &);
};

#endif
