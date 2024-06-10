#!/usr/bin/zsh

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

if [[ -v SCABBARD_PATH ]]; then
  echo "" &> /dev/null # don't do anything, just continue
else
  echo -e "\n:ERROR: SCABBARD_PATH was not defined!\n  \$SCABBARD_PATH: \`$SCABBARD_PATH\`\n"
  exit -1
fi
alias scabbard="$SCABBARD_PATH/scabbard"

# remove file extension
FILE=$(realpath $1)
FILE_BASE=$(echo "$FILE" | awk 'match($0, /^(.+)\.cpp$/, arr) { print arr[1]}')

export SCABBARD_METADATA_FILE="$FILE_BASE.scabbard.meta"
rm $SCABBARD_METADATA_FILE 1> /dev/null 2> /dev/null
rm ./anon.scababrd.meta 1> /dev/null 2> /dev/null
rm ./anon.scababrd.meta.lock 1> /dev/null 2> /dev/null

# determine if this should be compiled as a manual or instrumented test
if [[ $FILE_BASE == *".man" ]]; then # this is a manual file

  echo -e "\n\n==== BUILDING the MANUALLY instrumented executable ====\n\n"
  
  # make sure they provide a metadata file for manually instrumented files
  test -f $SCABBARD_METADATA_FILE || \ 
    { printf "\n\e[31m[run_x.sh] ERROR: mannually instrumented files are no longer supported without accompaning metadata files\e[0m\n    \e[31m\xE2\x86\xB3\e[0m Please Create and poulate $SCABBARD_METADATA_FILE to use this util\n"; exit -1; }
  
  echo "$HIP_EXE -L$SCABBARD_PATH -ltrace -lpthread -I$(pwd)/lib/include -I$(pwd)/libtrace/include -I$(pwd)/libtrace -std=c++17 -x hip -g -O2 -o$FILE_BASE.instr.out $FILE"
  $HIP_EXE -L$SCABBARD_PATH -ltrace -lpthread -I$(pwd)/lib/include -I$(pwd)/libtrace/include -I$(pwd)/libtrace -std=c++17 -x hip -g -O2 -o$FILE_BASE.instr.out $FILE || \
    { printf "\n\e[31m[run_x.sh] ERROR: durring build of manually instrumented file\e[0m\n"; exit -1; }


else # this is a file that needs to be instrumented

  echo -e "\n\n==== INSTRUMENTING and BUILDING the executable ====\n\n"

  # echo "$HIP_EXE -fpass-plugin=$SCABBARD_PATH/libinstr.so -L$SCABBARD_PATH -ltrace -lpthread -std=c++17 -x hip -g -O2 -o$FILE_BASE.instr.out $FILE"
  # $HIP_EXE -fpass-plugin=$SCABBARD_PATH/libinstr.so -L$SCABBARD_PATH -ltrace -lpthread -std=c++17 -x hip -g -O2 -o$FILE_BASE.instr.out $FILE || \
  #   { printf "\n\e[31m[run_x.sh] ERROR: durring instrumented build\e[0m\n"; rm $SCABBARD_METADATA_FILE.lock 1> /dev/null 2> /dev/null; exit -1; }

  echo "scabbard instr --meta-file=$SCABBARD_METADATA_FILE $HIP_EXE -std=c++17 -x hip -g -O2 -o$FILE_BASE.instr.out $FILE"
  scabbard instr --meta-file=$SCABBARD_METADATA_FILE $HIP_EXE -std=c++17 -x hip -g -O2 -o$FILE_BASE.instr.out $FILE || \
    { printf "\n\e[31m[run_x.sh] ERROR: durring instrumented build\e[0m\n"; rm $SCABBARD_METADATA_FILE.lock 1> /dev/null 2> /dev/null; exit -1; }

  # remove lock file regardless of the outcome
  rm $SCABBARD_METADATA_FILE.lock 1> /dev/null 2> /dev/null
  # make sure that a metadata file exists after instrumentation
  test -f $SCABBARD_METADATA_FILE || 
    { printf "\n\e[31m[run_x.sh] ERROR: metadata file \"$SCABBARD_METADATA_FILE\" was not created durring the instrumentation/build process\e[0m\n"; exit -1; }

fi


#compile the required enviroment variables
export SCABBARD_INSTRUMENTED_EXE_NAME="$FILE_BASE.instr.out"
export SCABBARD_TRACE_FILE="$FILE_BASE.scabbard.trace"

# run the built executable
echo -e "\n\n==== RUNNING the executable ====\n\nthe executable: $SCABBARD_INSTRUMENTED_EXE_NAME\n"
echo "scabbard trace --trace-file=$SCABBARD_TRACE_FILE $SCABBARD_INSTRUMENTED_EXE_NAME"
scabbard trace --trace-file=$SCABBARD_TRACE_FILE $SCABBARD_INSTRUMENTED_EXE_NAME || \
  { printf "\n\e[31m[run_x.sh] ERROR: durring trace\e[0m\n"; exit -1; }

# $ROCM_PATH/bin/rocgdb $SCABBARD_INSTRUMENTED_EXE_NAME

# make sure that a trace file exists after instrumentation
test -e $SCABBARD_TRACE_FILE || \ 
  { printf "\n\e[31m[run_x.sh] ERROR: the trace file \"$SCABBARD_TRACE_FILE\" was not created durring the trace/running step\e[0m\n"; exit -1; }


# run the verifier
echo -e "\n\n==== VERIFYING generated trace file ====\n\n"
echo "scabbard verif $SCABBARD_METADATA_FILE $SCABBARD_TRACE_FILE"
scabbard verif $SCABBARD_METADATA_FILE $SCABBARD_TRACE_FILE || \
  { printf "\n\e[31m[run_x.sh] ERROR: durring verify\e[0m\n"; exit -1; }


echo -e "\n\n==== END ====\n\n"
