/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#include "CPlot2D.h"
#include <stdio.h>


void CPlot2D::add_point(double x, double y, const char * series) {
    point_t p = {x, y};
    m_series[series].data.push_back(p);
}

void CPlot2D::set_color(uint32_t rrggbb, const char * series) {
    m_series[series].color = rrggbb;
}

void CPlot2D::set_title(const char * title) {
    m_title = title;
}

void CPlot2D::set_xlable(const char * label) {
    m_xlabel = label;
}

void CPlot2D::set_ylable(const char * label) {
    m_ylabel = label;
}

bool CPlot2D::check_gnuplot() {
    bool result = false;
    FILE *gp = popen(m_gnuplot_pipe, "w");
    if(gp) {
        (void)pclose(gp);
        result = true;
    }
    return result;
}

void CPlot2D::draw() {
    size_t points = 0;
    for(std::map<const char *, series_t>::iterator mi = m_series.begin(); mi != m_series.end(); ++mi) {
        points += mi->second.data.size();
    }
    if(points) {
        FILE *gp = popen(m_gnuplot_pipe, "w");
        if(gp) {
            fprintf(gp, "set term wxt");
            if(m_title) {
                fprintf(gp, " title '%s'", m_title);
            }
            fprintf(gp, "\n");
            if(m_xlabel) {
                fprintf(gp, "set xlabel '%s'\n", m_xlabel);
            }
            if(m_ylabel) {
                fprintf(gp, "set ylabel '%s'\n", m_ylabel);
            }
            fprintf(gp, "set grid xtics\nset grid ytics\n");
            fprintf(gp, "plot");
            for(std::map<const char *, series_t>::iterator mi = m_series.begin(); mi != m_series.end(); ++mi) {
                if(mi->second.data.size()) {
                    fprintf(gp, " '-' lc rgb '#%06X' with lines title '%s',", mi->second.color & 0xFFFFFF, mi->first);
                }
            }
            fprintf(gp, "\n");
            for(std::map<const char *, series_t>::iterator mi = m_series.begin(); mi != m_series.end(); ++mi) {
                if(mi->second.data.size()) {
                    for(std::vector<point_t>::iterator vi = mi->second.data.begin(); vi != mi->second.data.end(); ++vi) {
                        fprintf(gp, "%.14E %.14E\n", (double)(vi->x), (double)(vi->y));
                    }
                    fprintf(gp, "e\n");
                }
            }
            fflush(gp);
            (void)pclose(gp);
        }
    }
}
