  Scabbard Tests
==================

In this directory are both tests for scabbard and files that contain data that was crucial for its development

There is a makefile in this directory it does nothing.

Run the `run_x.sh` script or if it exists the specific script for the test script located in its directory. 
> Both options must be run from the top level directory of scabbard 
>  (not this test directory or any of its subdirs).
> Both options require that scabbard be built but not installed in the build dir.
> Both options require that either `ROCM_PATH` be defined 
>  ***OR*** that the version of rocm used to compile scabbard is your default version pointed to by both 
>  the version of `hipcc` on visible in your path AND the `/opt/rocm` symlink. 
