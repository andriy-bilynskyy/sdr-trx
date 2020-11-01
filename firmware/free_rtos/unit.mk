#****************************************************************************
#*
#*  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
#*
#*  This code is licensed under the GPLv3.
#*
#****************************************************************************


CDIR = ${dir ${lastword ${MAKEFILE_LIST}}}

PROJECT_SRC += \
  ${wildcard ${CDIR}src/*.c} \

PROJECT_INC += \
  ${CDIR}inc/ \

PROJECT_LIB += \

PROJECT_STYLE += \
