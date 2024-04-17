  Registered Host Memory Tests
================================

Hip allows you to mark sections of host memory accessible to the GPU using `hipHostRegister`.
  This memory is _(mostly)_ coherent.

These tests utilize host side memory registration to check that scabbard can detect data races 
  in memory allocated using this method.

The test scripts (`.sh`) are written specific for my environment on LLNL's Tioga compute cluster, 
  and will need to be modified to be used in other environments
Feel free to use them as guides on how to run and use scabbard in a more direct way.

Files that have a `.man` as part of their file are meant to be used without the instrumentation portion of scabbard.