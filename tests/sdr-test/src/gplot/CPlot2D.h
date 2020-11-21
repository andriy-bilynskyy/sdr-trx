/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#ifndef CPLOT2D_H_
#define CPLOT2D_H_

#include <stdint.h>
#include <vector>
#include <map>


class CPlot2D {
  public:

    CPlot2D() = default;
    void add_point(double x, double y, const char * series = "default");
    void set_color(uint32_t rrggbb, const char * series = "default");
    void set_title(const char * title);
    void set_xlable(const char * label);
    void set_ylable(const char * label);
    static bool check_gnuplot();
    void draw();

  private:

    typedef struct {
        double  x = 0;
        double  y = 0;
    } point_t;

    typedef struct {
        uint32_t                color = 0xFF0000;
        std::vector<point_t>    data;
    } series_t;

    std::map<const char *, series_t>    m_series;
    const char *                        m_title  = 0;
    const char *                        m_xlabel = 0;
    const char *                        m_ylabel = 0;
    constexpr static const char *       m_gnuplot_pipe = "gnuplot -persist";

    CPlot2D(const CPlot2D &) = delete;
    CPlot2D & operator=(const CPlot2D &) = delete;
};


typedef CPlot2D gnuplot2d_t;

#endif
