/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#ifndef SAFEOUT_H_
#define SAFEOUT_H_

#include <map>
#include <pthread.h>
#include <sstream>


//#define DBG_LOG_MULTUPROCESS


#define __DBG_LOG_S_(x) #x
#define __DBG_LOG_S__(x) __DBG_LOG_S_(x)
#define __S__LINE__ __DBG_LOG_S__(__LINE__)


#define __DBG_LOCATION__  "{" + (std::string(__FUNCTION__) + " " + std::string(__FILE__)\
                           + ":L" + std::string(__S__LINE__)) + "}"


namespace dbg {

typedef enum {
    DBG_INFO,
    DBG_DEBUG,
    DBG_WARNING,
    DBG_ERROR,
    DBG_NOTSET
} dbg_level_t;


class safeout {
  public:
    safeout();
    ~safeout();
    void redirect(std::ostream &os);

    template<class T>
    friend safeout& operator <<(safeout& so, T t) {
        std::stringstream ss;
        ss << t;
        pthread_t thr = pthread_self();
        so.protector_lock();
        if (so.m_out_data.find(thr) == so.m_out_data.end()) {
            so.m_out_data[thr].out_str = "";
            so.m_out_data[thr].msg_level = so.m_def_msg_level;
            so.m_out_data[thr].dbg_level = DBG_DEBUG;
        }
        if(so.m_out_data[thr].msg_level >= so.m_out_data[thr].dbg_level) {
            if(so.m_out_data[thr].out_str == "" && ss.str() != "") {
                so.m_out_data[thr].out_str = safeout::time();
                switch(so.m_out_data[thr].msg_level) {
                case DBG_INFO:
                    so.m_out_data[thr].out_str += " [INFO_] [";
                    break;
                case DBG_DEBUG:
                    so.m_out_data[thr].out_str += " [DEBUG] [";
                    break;
                case DBG_WARNING:
                    so.m_out_data[thr].out_str += " [WARN_] [";
                    break;
                case DBG_ERROR:
                    so.m_out_data[thr].out_str += " [ERROR] [";
                    break;
                default:
                    so.m_out_data[thr].out_str += " [???__] [";
                    break;
                }
                char name[32] = {0};
                if(pthread_getname_np(thr, name, sizeof(name))) {
                    name[0] = '\0';
                }
                so.m_out_data[thr].out_str += std::string(name) + "] ";
            }
            so.m_out_data[thr].out_str += ss.str();
        }
        so.protector_unlock();
        return so;
    }
    static safeout& flush(safeout& so, dbg_level_t msg_level);
    safeout & operator<< (safeout & (*_f)(safeout &));
    void set_dbg_level(dbg_level_t level);
    void set_default_msg_level(dbg_level_t level);
    dbg_level_t get_default_msg_level();
    dbg_level_t get_current_msg_level();

  private:
    typedef struct outData {
        dbg_level_t  msg_level;
        dbg_level_t  dbg_level;
        std::string out_str;
    } out_data_t;
    std::ostream                   * m_pos;
    std::map<pthread_t, out_data_t>   m_out_data;
    dbg_level_t                      m_def_msg_level;
    pthread_mutex_t                  m_protector;

    static std::string time();
    void protectorInit();
    void protectorDestroy();
    void protector_lock();
    void protector_unlock();
    safeout & operator=(const safeout &);
    safeout(const safeout &);
};

extern safeout sout;

safeout& endl(safeout& so);
safeout& info(safeout& so);
safeout& dbg(safeout& so);
safeout& warn(safeout& so);
safeout& err(safeout& so);

}

#endif
