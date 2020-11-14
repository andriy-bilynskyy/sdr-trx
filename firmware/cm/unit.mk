#****************************************************************************
#*
#*  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
#*
#*  This code is licensed under the GPLv3.
#*
#****************************************************************************


CDIR = ${dir ${lastword ${MAKEFILE_LIST}}}

PROJECT_SRC += \
  ${CDIR}dsp/src/BasicMathFunctions/BasicMathFunctions.c \
  ${CDIR}dsp/src/BayesFunctions/BayesFunctions.c \
  ${CDIR}dsp/src/CommonTables/CommonTables.c \
  ${CDIR}dsp/src/ComplexMathFunctions/ComplexMathFunctions.c \
  ${CDIR}dsp/src/ControllerFunctions/ControllerFunctions.c \
  ${CDIR}dsp/src/DistanceFunctions/DistanceFunctions.c \
  ${CDIR}dsp/src/FastMathFunctions/FastMathFunctions.c \
  ${CDIR}dsp/src/FilteringFunctions/FilteringFunctions.c \
  ${CDIR}dsp/src/MatrixFunctions/MatrixFunctions.c \
  ${CDIR}dsp/src/StatisticsFunctions/StatisticsFunctions.c \
  ${CDIR}dsp/src/SupportFunctions/SupportFunctions.c \
  ${CDIR}dsp/src/SVMFunctions/SVMFunctions.c \
  ${CDIR}dsp/src/TransformFunctions/TransformFunctions.c \

PROJECT_INC += \
  ${CDIR}core \
  ${CDIR}dsp/inc \

PROJECT_LIB += \

PROJECT_STYLE += \
