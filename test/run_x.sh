#!/usr/bin/sh

#flux: -N1
#flux: -n1
#flux: -c8
#flux: -g1

# NOTE: you either need to run this from the top level directory of scabbard or with SCABBARD_PATH already defined
# NOTE: you must have hipcc on your path or have ROCM_PATH defined


echo -e "\n\n==== CHECKING the Enviroment Variables ====\n\n"

# get the rocm and hipcc version
HIP_EXE=${ROCM_PATH:-/opt/rocm}/bin/hipcc

echo "HIPCC: '$HIP_EXE'"


# if [[ -z "${ROCM_PATH}"]]; then
#     HIP_EXE="$(ROCM_PATH)/bin/hipcc"
# else
#   if [[ -n $ZSH_VERSION ]]; then
#     builtin whence -p "hipcc" &> /dev/null
#   else  # bash:
#     builtin type -P "hipcc" &> /dev/null
#   fi
#   [[ $? -eq 0 ]] && echo "ROCM_PATH was not defined and no hipcc found on path" && exit -1
#   HIP_EXE="hipcc"
# fi

if [[ -v "SCABBARD_PATH" ]]; then
  echo "" &> /dev/null # don't do anything, just continue
else
  echo -e "\n:ERROR: SCABBARD_PATH was not defined!\n"
  exit -1
fi


# remove file extension
FILE=$(realpath $1)
FILE_BASE=$(echo "$FILE" | awk 'match($0, /^(.+)\.cpp$/, arr) { print arr[1]}')

# determine if this should be compiled as a manual or instrumented test
if [[ $FILE_BASE == *".man" ]]; then # this is a manual file

  echo -e "\n\n==== BUILDING the MANUALLY instrumented executable ====\n\n"
  echo "$HIP_EXE -L$SCABBARD_PATH -ltrace -lpthread -I$(pwd)/lib/include -I$(pwd)/libtrace/include -I$(pwd)/libtrace -std=c++17 -x hip -g -O2 -o$FILE_BASE.out $1"
  $HIP_EXE -L$SCABBARD_PATH -ltrace -lpthread -I$(pwd)/lib/include -I$(pwd)/libtrace/include -I$(pwd)/libtrace -std=c++17 -x hip -g -O2 -o$FILE_BASE.out $1


else # this is a file that needs to be instrumented

  echo -e "\n\n==== INSTRUMENTING and BUILDING the executable ====\n\n"
  echo "$HIP_EXE -fpass-plugin=build/instr/libinstr.so -L$SCABBARD_PATH -ltrace -std=c++17 -x hip -g -O2 -o$FILE_BASE.out $1"
  $HIP_EXE -fpass-plugin=build/instr/libinstr.so -L$SCABBARD_PATH -ltrace -std=c++17 -x hip -g -O2 -o$FILE_BASE.out $1

fi

#compile the required enviroment variables
export SCABBARD_INSTRUMENTED_EXE_NAME="$FILE_BASE.out"
export SCABBARD_TRACE_FILE="$FILE_BASE.scabbard.trace"

# run the built executable
echo -e "\n\n==== RUNNING the executable ====\n\n$SCABBARD_INSTRUMENTED_EXE_NAME\n"
$SCABBARD_INSTRUMENTED_EXE_NAME


# run the verifier
echo -e "\n\n==== VERIFYING generated trace file ====\n\n./build/verif/verif $SCABBARD_TRACE_FILE\n"
./build/verif/verif $SCABBARD_TRACE_FILE


echo -e "\n\n==== END ====\n\n"
