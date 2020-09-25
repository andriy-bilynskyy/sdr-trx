#****************************************************************************
#*
#*  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
#*
#*  This code is licensed under the GPLv3.
#*
#****************************************************************************


CDIR = ${dir ${lastword ${MAKEFILE_LIST}}}

PROJECT_SRC += \
  ${wildcard ${CDIR}*.c} \

PROJECT_INC += \
  ${CDIR} \

PROJECT_LIB += \
  m \

PROJECT_STYLE += \
  ${wildcard ${CDIR}*.c} \
  ${wildcard ${CDIR}*.h} \
