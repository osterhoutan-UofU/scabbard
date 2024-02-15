#!/usr/bin/bash

#flux: -N1
#flux: -n1
#flux: -g1
#flux: -c8

source $HOME/.zshenv
cd $HOME/repos/scabbard

export SCABBARD_PATH="$(pwd)/build/libtrace"

echo -e "\n\n==== BUILDING instrumented executable ====\n\n"

$ROCM_PATH/bin/hipcc -Lbuild/libtrace -ltrace -pthread -Ilib/include -Ilibtrace/include -Ilibtrace/src -x hip -std=c++17 -g -o test/maybe-race-test.man.out test/maybe-race-test.man.cpp


echo -e "\n\n==== RUNNING instrumented executable ====\n\n"

export SCABBARD_INSTRUMENTED_EXE_NAME="$(pwd)/test/maybe-race-test.man.out"
export SCABBARD_TRACE_FILE="$(pwd)/test/maybe-race-test.man.scabbard.trace"

ml rocm/6.0.0
/opt/rocm-6.0.0/bin/rocgdb ./test/maybe-race-test.man.out
# ./test/maybe-race-test.instr.out

echo -e "\n\n==== VERIFYING generated trace file ====\n\n"

./build/verif/verif $SCABBARD_TRACE_FILE


echo -e "\n\n==== END ====\n\n"
