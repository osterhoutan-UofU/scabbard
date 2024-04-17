#!/usr/bin/bash

#flux: -N1
#flux: -n1
#flux: -g1
#flux: -c8

source $HOME/.zshenv
cd $HOME/repos/scabbard

export SCABBARD_PATH="$(pwd)/build/libtrace"

echo -e "\n\n==== BUILDING instrumented executable ====\n\n"

$ROCM_PATH/bin/hipcc -fpass-plugin=build/instr/libinstr.so -Lbuild/libtrace -ltrace -pthread -x hip -std=c++17 -g -o test/basic/maybe-race.instr.out test/basic/maybe-race.cpp


echo -e "\n\n==== RUNNING instrumented executable ====\n\n"

export SCABBARD_INSTRUMENTED_EXE_NAME="$(pwd)/test/basic/maybe-race.instr.out"
export SCABBARD_TRACE_FILE="$(pwd)/test/basic/maybe-race.scabbard.trace"

ml rocm/6.0.0
/opt/rocm-6.0.0/bin/rocgdb ./test/basic/maybe-race.instr.out
# ./test/basic/maybe-race.instr.out

echo -e "\n\n==== VERIFYING generated trace file ====\n\n"

./build/verif/verif $SCABBARD_TRACE_FILE


echo -e "\n\n==== END ====\n\n"
