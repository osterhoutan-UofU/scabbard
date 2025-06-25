  LLNL README for Scabbard
=============================

> **NOTE:** These instructions are for LLNL affiliates and may not apply to general users of Scabbard.
> For General Configuration and Usage info please see [`scabbard/README.md`](https://github.com/osterhoutan-UofU/scabbard). 

 LMod Configuration
-----------------------------

 1. Find the ROCm module compatible with both your project and Scabbard:
    ```sh
    module spider rocm
    ```
    Output should look somthing like this:
    ```
    ----------------------------------------------
      rocm:
    ----------------------------------------------
         Versions:
            rocm/5.6.0
            rocm/5.6.1
            rocm/5.7.0
            rocm/6.1.1
            rocm/6.1.2
    ```
    Scabbard is most tested with `rocm/6.1.2` and the pre-built version of Scabbard provided by [Ignacio Laguna](https://people.llnl.gov/lagunaperalt1)
    will require you to build your project with this version to be compatible with Scabbard.

    If you build Scabbard for yourself you can use a diffrent version of ROCm,
    but we do not support all versions of ROCm at this time and your results may vary.

    > **NOTE:** Scabbard is not compatible with any of LLNL's custom *"magic"* compilers,
    > So the LMod Modules that start with `rocmcc` or that have `magic` in their name will not work.
    >
    > You may need to switch to the equivilant `rocm/#.#.#` module, then reconfigure your project build,
    > build and test it without Scabbard to ensure your build works without the *"magic"* compiler, before moving on with Scabbard. 

 2. Load the approprate ROCm module:
    ```sh
    module load rocm/6.1.2
    ```

 3. Find the Python module compatible with both your project and Scabbard:
    ```sh
    module spider python
    ```
    Scabbard supports any python version `>=3.10` so pick whatever one suits your needs within those restraints.

 4. Load the appropriate Python module:
    ```sh
    module load python/3.10.8
    ```


 CMake Configuration
-----------------------------

> The following instructions are for your project not Scabbard.

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
_...TODO after ignacio lets me know where scabbard is insatlled at and how..._

