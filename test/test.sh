#!/usr/bin/bash

cd $HOME/repos/scabbard

export SCABBARD_INSTRUMENTED_EXE_NAME="$(pwd)/test/test.instr.out"
export SCABBARD_TRACE_FILE="$(pwd)/test/test.scabbard.trace"

./test/test.instr.out

