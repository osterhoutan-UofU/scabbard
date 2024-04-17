  Managed Memory Tests
========================

Hip/ROCm provides an interface for using the HMS feature of the linux kernel to maintain fast but mostly coherent memory 
  between the CPU and the GPU's (so long as they are on the same NUMA node).
This method attempts to create memory that is equally fast to access from both host and device, 
  and is manged by the host OS's kernel with some input from the device drivers.
This memory's primary location (host/device) is not known to the user, unless directly specified to be on the device.

These tests utilize the managed memory interface to check that scabbard can detect data races in memory
  allocated using this method.

The test scripts (`.sh`) are written specific for my environment on LLNL's Tioga compute cluster, 
  and will need to be modified to be used in other environments
Feel free to use them as guides on how to run and use scabbard in a more direct way.

Files that have a `.man` as part of their file are meant to be used without the instrumentation portion of scabbard.