/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#ifndef WINDOW_BSF_H_
#define WINDOW_BSF_H_

#include "window_base.h"


class WindowBSF : public WindowBase {
  public:

    WindowBSF(double f_sample, double f_low, double f_high, double df_tran, bool is_order_pow2 = false, window_type_t win_type = BLACKMAN) {
        if(f_low < f_high) {
            set_order(f_sample, df_tran, is_order_pow2);
            mk_lpf(0, f_sample, f_low, win_type);
            mk_lpf(1, f_sample, f_high, win_type);
            inverse(1);
            summation_free();
        }
    }

  private:

    WindowBSF();
};

#endif
