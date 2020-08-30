#****************************************************************************
#*
#*  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
#*
#*  This code is licensed under the GPLv3.
#*
#****************************************************************************


CDIR = ${dir ${lastword ${MAKEFILE_LIST}}}

PROJECT_SRC += \
  ${wildcard ${CDIR}Source/BasicMathFunctions/*.c} \
  ${wildcard ${CDIR}Source/CommonTables/*.c} \
  ${wildcard ${CDIR}Source/ComplexMathFunctions/*.c} \
  ${wildcard ${CDIR}Source/ControllerFunctions/*.c} \
  ${wildcard ${CDIR}Source/FastMathFunctions/*.c} \
  ${wildcard ${CDIR}Source/FilteringFunctions/*.c} \
  ${wildcard ${CDIR}Source/MatrixFunctions/*.c} \
  ${wildcard ${CDIR}Source/StatisticsFunctions/*.c} \
  ${wildcard ${CDIR}Source/SupportFunctions/*.c} \
  ${wildcard ${CDIR}Source/TransformFunctions/*.[c,S]} \

PROJECT_INC += \
  ${CDIR}Include \

PROJECT_LIB += \

PROJECT_STYLE += \
