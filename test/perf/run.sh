#!/usr/bin/zsh

#flux: -N1
#flux: -n1
#flux: -c16
#flux: -g1

# NOTE: you either need to run this from the top level directory of scabbard or with SCABBARD_PATH already defined
# NOTE: you must have hipcc on your path or have ROCM_PATH defined

# << =========================================================================================== >> 
# <<                       SCABBARD TIME & SPACE COMPLEXITY TEST SYNTHETIC                       >> 
# << =========================================================================================== >> 
# 
# This test will run some number of test files some number of times with different numbers of 
#   read and write points in the code.
# It will then produce a data table (& possibly a graph) comparing the effect each change has on the 
#   total runtime of the instrumented executable.
# Most of the actual test code is in python files, but to make automation with flux easier
#  this file launches the code.
#
# NOTE: you either need to run this from the top level directory of scabbard or with SCABBARD_PATH already defined
# NOTE: you must have hipcc on your path or have ROCM_PATH defined
#

./test/perf/test.py
