#****************************************************************************
#*
#*  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
#*
#*  This code is licensed under the GPLv3.
#*
#****************************************************************************


CDIR = ${dir ${lastword ${MAKEFILE_LIST}}}

PROJECT_SRC += \
  ${CDIR}sw_version.c \

PROJECT_INC += \
  ${CDIR} \

PROJECT_STYLE += \
  ${CDIR}sw_version.h \


#****************************************************************************
#*  Unit specific section
#*  UNIT_XXX - variable name unique for each unit
#****************************************************************************

UNIT_SW_VERSION := ${dir ${lastword ${MAKEFILE_LIST}}}

PROJECT_UNIT_GEN += \
  ${UNIT_SW_VERSION}sw_version.c \

${CDIR}sw_version.c: force
	./${UNIT_SW_VERSION}mk_sw_version.sh $@
