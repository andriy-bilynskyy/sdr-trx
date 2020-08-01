/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#ifndef WINDOW_HPF_H_
#define WINDOW_HPF_H_

#include "window_base.h"


class WindowHPF : public WindowBase {
  public:

    WindowHPF(double f_sample, double f_cut, double df_tran, bool is_order_pow2 = false, window_type_t win_type = BLACKMAN) {
        set_order(f_sample, df_tran, is_order_pow2);
        mk_lpf(0, f_sample, f_cut, win_type);
        inverse(0);
    }

  private:

    WindowHPF();
};

#endif
