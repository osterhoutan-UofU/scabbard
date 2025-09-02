  LLNL README for Scabbard
=============================

> **NOTE:** These instructions are for LLNL affiliates, to be used on Tioga,
> and may not apply to general users of Scabbard.
> For General Configuration and Usage info please see [`scabbard/README.md`](https://github.com/osterhoutan-UofU/scabbard).

There are two ways to use Scabbard. 
1. [Load and use the prebuilt version](#use-prebuilt-scabbard) _(only for ROCm 6.1.2)_
2. [Build and use your own copy](#build-your-own-scabbard)

 Use Prebuilt Scabbard
-----------------------------
> _**NOTE:** the Scabbard provided in Tioga's LMod is only compatible with ROCm 6.1.2_

 1. Load Scabbard from LMod:
    ```sh
    module load scabbard/0.1
    ```
 2. Check to see that Scabbard is loaded by running the following commands:
    - Check that `$SCABBARD_PATH` environment variable is defined:
      ```sh
      echo $SCABBARD_PATH
      ```
      So long as this command returns a path you should be good to go.
    - Check that ROCm 6.1.2 is the only ROCm loaded (and that the magic ROCm compiler `rocmcc` modules are not loaded):
      ```sh
      if module is-loaded rocm/6.1.2 && ! module is loaded rocmcc; then echo "Correct ROCm config"; else echo "WARN: bad ROCm config (only supports rocm/6.1.2)"; fi
      ```
      This should return:
      ```
      Correct ROCm config
      ```
 3. Follow the instructions in the _[CMake Configuration](#cmake-configuration)_ section to instrument and run your instrumetned code.

 Build Your Own Scabbard
-----------------------------
If you need to use anothter version of ROCm outside of 6.1.2, you will need to follow the instructions in the [`README.md`](../README.md) to build a version of Scabbard for that version of ROCm.

However, in the LLNL systems there are several kinds of ROCm modules and only one is compatible with Scabbard,
and that is the unaltered versions.

To test to see if the ROCm version you have is compatible please run the following command:
```sh
if module is-loaded rocm && ! module is-loaded rocmcc ; then echo "ROCm config is compatible with Scabbard" ; else echo "WARN: ROCm config is NOT compatible with" ; fi
```
The output should look like the following if your LMod configuration of ROCm is correct:
```
ROCm config is compatible with Scabbard
```
If it does not look like the above you will need to correct your LMod config and try rebuilding your project without Scabbard once your LMod configuration of ROCm passed the test.
The attempt to build without Scabbard after making such changes is important as CMake and ROCm are sensitive to environmant and version changes.

Following this check follow the instructions in the [`README.md`](../README.md)


 CMake Configuration
-----------------------------

> The following instructions are for your project not Scabbard.

### Load the Scabbard CMake Module
Add the following code to the top of your Primary `CMakeLists.txt` File:
```cmake
list(APPEND CMAKE_MODULE_PATH "$ENV{SCABBARD_PATH}")
include(scabbard)
```
Then add the following to the end of the same file:
```cmake
scabbard_instrument_all()
```

### Set C++ and HIP Compilers
Due to issues with file suffix ambiguities both the C++ compiler and HIP compiler in your CMake config should be set 
to the same ROCm compiler.
You can do this however you see fit but we recomend just adding the following line to your top level `CMakeLists.txt` file
someplace after the ROCm/HIP package import/find line in said top level `CMakeLists.txt` file:
```cmake
set(CMAKE_CXX_COMPILER "${ROCM_DIR}/bin/hipcc")
```


 Usage Instructions
------------------------------

### Scabbard Install Location
> {Ignatio please fill out this info}

### Instrumenting your code with Scabbard
- For CMake projects follow the instructions given in the [Load the Scabbard CMake Module](#load-the-scabbard-cmake-module) section.
- For other build systems please follow the relivant instructions in the main [`README.md`](../README.md)

### Running your instrumented code
Scabbard uses the contents of the `$SCABBARD_TRACE_FILE` environment variable to know where to save the trace file to.
So all you need to do is set that variable in one of the following ways--where `<launch-cmd>` is whatever command you would use to luanch and run your code, and `<trace-file>` is the filepath of where you want to save the trace file:
- Use the Scabbard command line utility:
  ```sh
  scabbard trace --trace-file=<trace-file> <launch-cmd>
  ```
  This command line utility just sets the environment variable for you before running the command given in `<lanch-cmd>`.
- Export the environment variable:
  ```sh
  export SCABBARD_TRACE_FILE=<trace-file>
  <launch-cmd>
  ```
  This will set the environment variable for the length of the session, so all subsequent runs of the `<launch-cmd>` will **overwrite** the same trace file.

- Temporarily set the environment variable:
  ```sh
  SCABBARD_TRACE_FILE=<trace-file> <launch-cmd>
  ```
  This will set the environment variable just for this specific launch.
> _**NOTE:** if you do not set `SCABBARD_TRACE_FILE` it will use the name of the executable with a `.scabbard.trace` suffex._


### Verifing the Trace File
After generating the trace file run the Scabbard verify tool.

To do this you will need to find the metadata file generated durring instrumentation.
> _If you used CMake to build your project the metadata file should be in the top level of the build directory, with a `.scabbard.meta` file extension._

Then just run the verify tool and read the output:
```sh
scabbard verif <metadata-file> <trace-file>
```


 Code Example:
--------------------------------
...AO TODO...

