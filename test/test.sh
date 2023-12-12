#!/usr/bin/bash

#flux: -N1
#flux: -n1
#flux: -g1
#flux: -c8

source $HOME/.envzsh
cd $HOME/repos/scabbard

export SCABBARD_PATH="$(pwd)/build/libtrace"

$ROCM_PATH/bin/hipcc -fpass-plugin=build/instr/libinstr.so -Lbuild/libtrace -ltrace -pthread -x hip -std=c++17 -g -o test/test.instr.out test/test.cpp


export SCABBARD_INSTRUMENTED_EXE_NAME="$(pwd)/test/test.instr.out"
export SCABBARD_TRACE_FILE="$(pwd)/test/test.scabbard.trace"

./test/test.instr.out

