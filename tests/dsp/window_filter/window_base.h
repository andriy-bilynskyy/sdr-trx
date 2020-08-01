/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#ifndef WINDOW_BASE_H_
#define WINDOW_BASE_H_

#include <stddef.h>
#include <sys/types.h>


class WindowBase {
  public:

    typedef enum window_type {
        HAMMING,
        BLACKMAN
    } window_type_t;

    WindowBase() : m_M(0), m_H{NULL, NULL} {
    }

    ~WindowBase() {
        if(m_H[0]) {
            delete [] m_H[0];
        }
        if(m_H[1]) {
            delete [] m_H[1];
        }
    }

    size_t order() const {
        return m_M;
    }

    const double * impulse_response() const {
        return m_H[0];
    }

    void print(size_t col, bool isDouble = false);

  protected:

    void set_order(double f_sample, double df_tran, bool is_order_pow2 = false);
    void mk_lpf(size_t id, double f_sample, double f_cut, window_type_t win_type = BLACKMAN);
    void inverse(size_t id);
    void summation_free();

  private:

    size_t                       m_M;
    double                     * m_H[2];

    WindowBase(const WindowBase &);
    WindowBase & operator=(const WindowBase &);

    double window_hamming(ssize_t i);
    double window_blackman(ssize_t i);
};

#endif
