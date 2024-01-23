  scabbard
============

A GPU data race detector based upon the methods used in SWORD for AMD HIP (aka a HIP mounted sheath for a SWORD)

Scabbard is designed to detect races in the heterogenous memory system the exists between a AMD gpu and your CPU in projects utilising ROCm's hip technology.
(OpenCL, scycl, and CUDA are not supported env when running on AMD GPUs).

Scabbard cannot tell you if a data race occurred inside your GPU code, only if the CPU read from the GPU before the
GPU finished it's work.


## Build:
First set your `ROCM_PATH` environment variable to point to your desired install of ROCm.
If you only have one installed version or the `/opt/rocm` link exists you might be able to skip this step. 
```
mkdir build && cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -S../ -B./ -G "Unix Makefiles"
make trace trace-device scabbard verif instr
```

## Run:

### Instrument source during build
For now you will have to manually build include the instrumenter in your build script 
(only hipcc and clang are currently supported), 
as well as define a few environment variables.

|  Env Variable:  | Description:                                             | Example:          |
|:---------------:|:---------------------------------------------------------|:------------------|
| `SCABBARD_PATH` | path to the libtrace install directory                   | `build/libtrace`  |
|   `ROCM_PATH`   | path to desired version of ROCm installed on your system | `/opt/rocm-5.4.3` |

To do this use the `-fpass-plugin` flag, and the `-L` & `-l` flags as follows 
(the `-g` flag is required if you want file and line number on where races occur at):
```
$ROCM_PATH/bin/hipcc -fpass-plugin=<plugin-dynlib-path> -L<path-to-libtrace-dir> -ltrace -g ...
```
If you're doing this from the top level of the scabbard project directory with it built into the build dir the command will look something like this:
```
# EXAMPLE:
$ROCM_PATH/bin/hipcc -fpass-plugin=build/instr/libinstr.so -Lbuild/libtrace -ltrace -g -std=c++17 -o test/test.instr.out test/test.cpp
```

You can also look at [`test/test.sh`](./test/test.sh) for an example that is NOT system or shell agnostic.


### Run instrumented executable
To run an instrumented executable you will want to define a few environment variables to ensure that the
instrumented code has some context.
It is technically optional but highly encouraged to provide define these Env Vars
|          Env Variable:           | Description:                                                                                                                                                                                                                                                                                                                                   | Example:                   |
|:--------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------|
| `SCABBARD_INSTRUMENTED_EXE_NAME` | path to the instrumented executable you are about to run (used to give context to outputted trace file)                                                                                                                                                                                                                                        | `test/test.instr.out`      |
|      `SCABBARD_TRACE_FILE`       | the location the outputted trace file will be written to (if `SCABBARD_INSTRUMENTED_EXE_NAME` is already defined and `SCABBARD_TRACE_FILE` is NOT defined it will output in your **current** directory with a name derived from the base name of your executable, and if neither are defined it will output to `./unknown-exe.scabbard.trace`) | `test/test.scabbard.trace` |

After defining these variables using the `export` directive in your shell or however you decide to do it, execute your instrumeted executable as normal, and the trace file should generate.


### Analyze and Verify the trace file
Use scabbards `verif` tool on your trace file to perform a data race analysis on it.

The `verif` tool only takes one parameter and that is the path to a trace file.
```
build/verif/verif <path-to-trace-file>
```

It will analyse the trace file and inform you of any data races that occurred AND any places where you have not put in place the proper syncs/guards regardless of if an actual data race occurred.  
