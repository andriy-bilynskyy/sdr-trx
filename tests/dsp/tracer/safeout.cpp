/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#include "safeout.h"
#include <iostream>
#include <sys/time.h>
#include <iomanip>


namespace dbg {
safeout::safeout() : m_pos(&std::cout),
    m_out_data(),
    m_def_msg_level(DBG_DEBUG) {
    protectorInit();
}

safeout::~safeout() {
    protector_lock();
    for(std::map<pthread_t, out_data_t>::iterator it = m_out_data.begin(); it != m_out_data.end(); ++it) {
        if(it->second.out_str !=  "") {
            *m_pos << it->second.out_str << std::endl;
        }
    }
    protector_unlock();
    protectorDestroy();
}

void safeout::redirect(std::ostream &os) {
    protector_lock();
    m_pos = &os;
    protector_unlock();
}

safeout& safeout::flush(safeout& so, dbg_level_t msg_level) {
    pthread_t thr = pthread_self();
    so.protector_lock();
    if (so.m_out_data.find(thr) != so.m_out_data.end()) {
        if(so.m_out_data[thr].out_str != "") {
            *so.m_pos << so.m_out_data[thr].out_str << std::endl;
            so.m_out_data[thr].out_str = "";
        }
    } else {
        so.m_out_data[thr].out_str = "";
        so.m_out_data[thr].dbg_level = DBG_DEBUG;
    }
    so.m_out_data[thr].msg_level = msg_level;
    so.protector_unlock();
    return so;
}

// cppcheck-suppress constParameter
safeout & safeout::operator<< (safeout & (*_f)(safeout &)) {
    return _f(*this);
}

void safeout::set_dbg_level(dbg_level_t level) {
    pthread_t thr = pthread_self();
    protector_lock();
    if (m_out_data.find(thr) == m_out_data.end()) {
        m_out_data[thr].out_str = "";
        m_out_data[thr].msg_level = m_def_msg_level;
    }
    m_out_data[thr].dbg_level = level;
    protector_unlock();
}

void safeout::set_default_msg_level(dbg_level_t level) {
    if(level < DBG_NOTSET) {
        protector_lock();
        m_def_msg_level = level;
        for(std::map<pthread_t, out_data_t>::iterator it = m_out_data.begin(); it != m_out_data.end(); ++it) {
            if(it->second.msg_level != m_def_msg_level) {
                if(it->second.out_str != "") {
                    *m_pos << it->second.out_str << std::endl;
                    it->second.out_str = "";
                }
                it->second.msg_level = m_def_msg_level;
            }
        }
        protector_unlock();
    }
}

dbg_level_t safeout::get_default_msg_level() {
    dbg_level_t result = DBG_NOTSET;
    protector_lock();
    result = m_def_msg_level;
    protector_unlock();
    return result;
}

dbg_level_t safeout::get_current_msg_level() {
    dbg_level_t result = DBG_NOTSET;
    pthread_t thr = pthread_self();
    protector_lock();
    if (m_out_data.find(thr) != m_out_data.end()) {
        result = m_out_data[thr].msg_level;
    }
    protector_unlock();
    return result;
}

std::string safeout::time() {
    std::stringstream ss;
    struct timeval  tv;
    (void)gettimeofday(&tv, NULL);
    struct tm * ti;
    ti = localtime(&tv.tv_sec);
    ss << std::setfill('0');
    ss << std::setw(4) << ti->tm_year + 1900 << '/'
       << std::setw(2) << ti->tm_mon + 1 << '/'
       << std::setw(2) << ti->tm_mday << ' '
       << std::setw(2) << ti->tm_hour << ':'
       << std::setw(2) << ti->tm_min << ':'
       << std::setw(2) << ti->tm_sec << ':'
       << std::setw(3) << tv.tv_usec/1000;
    return ss.str();
}

void safeout::protectorInit() {
    pthread_mutexattr_t attr;
    (void)pthread_mutexattr_init(&attr);
    (void)pthread_mutexattr_setrobust(&attr, PTHREAD_MUTEX_ROBUST);
    (void)pthread_mutexattr_setprotocol(&attr, PTHREAD_PRIO_INHERIT);
#ifdef DBG_LOG_MULTUPROCESS
    (void)pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
#else
    (void)pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_PRIVATE);
#endif
    (void)pthread_mutex_init(&m_protector, &attr);
    (void)pthread_mutexattr_destroy(&attr);
}

void safeout::protectorDestroy() {
    (void)pthread_mutex_destroy(&m_protector);
}

void safeout::protector_lock() {
    if(pthread_mutex_lock(&m_protector) == EOWNERDEAD) {
        pthread_mutex_consistent(&m_protector);
    }
}

void safeout::protector_unlock() {
    (void)pthread_mutex_unlock(&m_protector);
}

safeout sout;

safeout& endl(safeout& so) {
    return so.flush(so, so.get_default_msg_level());
}

safeout& info(safeout& so) {
    if(so.get_current_msg_level() != DBG_INFO) {
        (void)so.flush(so, DBG_INFO);
    }
    return so;
}

safeout& dbg(safeout& so) {
    if(so.get_current_msg_level() != DBG_DEBUG) {
        (void)so.flush(so, DBG_DEBUG);
    }
    return so;
}

safeout& warn(safeout& so) {
    if(so.get_current_msg_level() != DBG_WARNING) {
        (void)so.flush(so, DBG_WARNING);
    }
    return so;
}

safeout& err(safeout& so) {
    if(so.get_current_msg_level() != DBG_ERROR) {
        (void)so.flush(so, DBG_ERROR);
    }
    return so;
}

}
