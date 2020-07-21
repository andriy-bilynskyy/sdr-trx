#****************************************************************************
#*
#*  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
#*
#*  This code is licensed under the MIT.
#*
#****************************************************************************


CC     := gcc
CXX    := g++
GDB    := gdb


PROJECT ?= circ_buffer

PROJECT_SRC := \
  ${wildcard ./*.c} \
  ${wildcard ./*.cpp} \

INCLUDE_PATH := \
  ./ \

LDLIBS := \
  stdc++ \


OBJECTS   := ${addsuffix .o, ${PROJECT_SRC}}

CFLAGS    := -Wall -std=c99 -fdata-sections -ffunction-sections
CXXFLAGS  := -Wall -fno-exceptions -fdata-sections -ffunction-sections
LDFLAGS   := -Wl,--gc-sections
LDFLAGS   += ${addprefix -l, ${LDLIBS}}

ifndef BUILD
  BUILD := DEBUG
endif

ifeq (${BUILD},DEBUG)
  CFLAGS  += -g3 -O1 -DDEBUG
  CXXFLAGS += -g3 -O1 -DDEBUG
else ifeq (${BUILD},RELEASE)
  CFLAGS  += -g0 -O3
  CXXFLAGS += -g0 -O3
else
  ${error Wrong BUILD '${BUILD}'! Should be: DEBUG or RELEASE}
endif

CFLAGS  += ${addprefix -I, ${INCLUDE_PATH}}
CXXFLAGS  += ${addprefix -I, ${INCLUDE_PATH}}


.DEFAULT_GOAL := all
.PHONY: all build clean run debug astyle help

all: ${PROJECT}

build: ${PROJECT}

${PROJECT}: ${OBJECTS}
	${info ${BUILD} BUILD}
	${CC} $^ -o $@ ${LDFLAGS}

clean:
	rm -f ${OBJECTS} ${OBJECTS:.o=.d} ${PROJECT}

run:
	@if [ -f "${PROJECT}" ] ;                                                   \
  then                                                                          \
    ./${PROJECT} ;                                                              \
  else                                                                          \
    echo "Output executable file doesn't exist. Run 'make all' before!";        \
  fi

debug:
	@if [ -f "${PROJECT}" ] ;                                                   \
  then                                                                          \
    ddd "${PROJECT}" --debugger "${GDB} -ex 'break main'                		\
                                        -ex 'run' " ;                           \
  else                                                                          \
    echo "Output executable file doesn't exist. Run 'make all' before!";        \
  fi

astyle:
	astyle --style=google --suffix=none ${PROJECT_SRC}                          \
	       ${wildcard ${addsuffix *.h, ${INCLUDE_PATH}}                         \
	                  ${addsuffix *.hpp, ${INCLUDE_PATH}}}

cppcheck:
	cppcheck -q --enable=all --inconclusive --suppress=missingIncludeSystem ./

help:
	@:
	${info Help}
	${info ---------------------------------------------------------------------}
	${info make help                     - this help text}
	${info make BUILD=<build_type> build - create executable file}
	${info make BUILD=<build_type> all   - create executable file, same as build}
	${info make clean                    - remove generated files}
	${info make run                      - run executable file}
	${info make debug                    - start debugging session DDD (gdb)}
	${info make astyle                   - format source files}
	${info make cppcheck                 - perform static analysis}
	${info ---------------------------------------------------------------------}
	${info Available build_type [DEBUG RELEASE], eg: make BUILD=RELEASE ...}
	${info Default build_type DEBUG}

%.c.o: %.c
	${CC} ${CFLAGS} -MD -c $< -o $@

%.cpp.o: %.cpp
	${CXX} ${CXXFLAGS} -MD -c $< -o $@

-include ${OBJECTS:.o=.d}
