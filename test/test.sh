#!/usr/bin/bash

#flux: -N1
#flux: -n1
#flux: -g1
#flux: -c8

source $HOME/.zshenv
cd $HOME/repos/scabbard

export SCABBARD_PATH="$(pwd)/build/libtrace"

echo -e "\n\n==== BUILDING instrumented executable ====\n\n"

$ROCM_PATH/bin/hipcc -fpass-plugin=build/instr/libinstr.so -Lbuild/libtrace -ltrace -pthread -x hip -std=c++17 -g -o test/test.instr.out test/test.cpp


echo -e "\n\n==== RUNNING instrumented executable ====\n\n"

export SCABBARD_INSTRUMENTED_EXE_NAME="$(pwd)/test/test.instr.out"
export SCABBARD_TRACE_FILE="$(pwd)/test/test.scabbard.trace"

./test/test.instr.out

echo -e "\n\n==== VERIFYING generated trace file ====\n\n"

./build/verif/verif $SCABBARD_TRACE_FILE


echo -e "\n\n==== END ====\n\n"
