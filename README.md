  scabbard
============

A GPU data race detector based upon the methods used in SWORD for AMD HIP (aka a HIP mounted sheath for a SWORD)

Scabbard is designed to detect races in the heterogenous memory system the exists between a AMD gpu and your CPU in projects utilising ROCm's hip technology.
(OpenCL, scycl, and CUDA are not supported env when running on AMD GPUs).

Scabbard cannot tell you if a data race occurred inside your GPU code, only if the CPU read from the GPU before the
GPU finished it's work.


## Build:

### Dependencies
- ROCm >= v5.4.3
- python >= 3.10
- cmake >= 3.20

First set your `ROCM_PATH` environment variable to point to your desired install of ROCm.
If you only have one installed version or the `/opt/rocm` sym-link exists you might be able to skip this step. 
```sh
mkdir build && cd build
cmake ../
make scabbard trace trace-device verif instr intercept
```

## Using scabbard:

> #### For Best results
>  1. Define the `SCABBARD_PATH` environment variable for your situation
>     | situation:          | `SCABBARD_PATH` value:                   |
>     |:-------------------:|:----------------------------------------:|
>     | local build only    | `<path-to-scabbard-repo>/build/scabbard` |
>     | installed _(alpha)_ | `$ROCM_PATH/scababrd`                    |
>  2. Add an alias for the scabbard interface. _i.e._
>     ```sh
>     alias scabbard=$SCABBARD_PATH/scabbard
>     ```

<br/>

> **NOTE:**
> using `scabbard -h` will provide basic instructions on how to use the scabbard interface

### 1. Instrument source during build

Use the scabbard tool to build your project.
To do this just use the `scabbard instr` tool to launch whatever your build system is.
```sh
scabbard instr --meta-file=../\<proj-name\>.scabbard.meta \<your-build command here\>
```

It is recommended to provide a `--meta-file` to scabbard so that you know where scababrd ends up 
generating teh metadata file that the verify step will use to inform you where in your source code
the data races are linked to.
If you don't provide this it will create a file called `anon.scabbard.meta` in your current working directory instead. 

#### For cmake:
Use scabbard to launch the build not the configuration process.
(_i.e._ use scabbard on your `make`, `ninja`, `MSBuild` command not the cmake configuration step )
```sh
mkdir build ; cd build
cmake ../ # and whatever else you need to configure your project
# here is where it is different
scabbard instr --meta-file=../\<proj-name\>.scabbard.meta make all
```


### 2. Run instrumented executable and generate a trace file

Use `scabbard trace` to configure the launch environment and produce a trace file to analyze in the next step.
 
```sh
scabbard trace --trace-file=\<proj-name\>.scabbard.trace \<instrumented-exe\> \<whatever-args-your-exe-needs\>
```

It is recommended to provide a `--trace-file` so you know where the trace file will be generated at.
If you don't it will default to `\<instrumented-exe\>.scabbard.trace` wherever that is on your machine.



### 3. Analyze and Verify the trace file

Now to get a list of data races and places in your code where data races didn't occur (this time) 
but could occur.
You must run the `scabbard verif` tool on the trace file generated in step 2.
The tool using the metadata file produced in step 1 will tell you where in your source code
the data race occurred.

```sh
scabbard verif \<meta-file\> \<trace-file\>
```

