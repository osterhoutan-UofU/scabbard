  Device Memory Tests
=======================

These are tests that teh hip code is structures so that all memory is allocated on the device using standard
  `hipMalloc` practices
  (_aka_ they are not managed memory and should be allocated souly on the default GPU Device).
Thanks to hip's heterogenous memory model this does not restrict reads and writes on the CPU side to `hipMemcpy`
  calls and other built-ins, as heterogeneous memory allows the CPU to read and write from GPU memory just like 
  any other place in allocated memory 
  (note this does not work in the opposite direction with host memory for the GPU, without registering host memory with `hipHostRegister` first).
With the memory is coherent, but not treated as volatile so bad copy times are still an issue unless 
  all data is treated as atomic.

The test scripts (`.sh`) are written specific for my environment on LLNL's Tioga compute cluster, 
  and will need to be modified to be used in other environments
Feel free to use them as guides on how to run and use scabbard in a more direct way.

Files that have a `.man` as part of their file are meant to be used without the instrumentation portion of scabbard.
