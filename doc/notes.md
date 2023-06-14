  Scabbard Dev Notes
====================================================================================================

 TODO:
----------------------------------------------------------------------------------------------------

-[ ] ...



 Design Decisions:
----------------------------------------------------------------------------------------------------





 Questions (& Answers)
----------------------------------------------------------------------------------------------------

### **Q1:** How does the IR denote host memory on the device? 
  (also when it does it do it if inconsistent)


#### **A:** It depends on what the classification of the memory is. 
  [_See unified memory attributes section below:_](#unified-memory-attributes)


  <br/><br/>
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



### **Q2:** How does the IR denote device memory on the host? 
  (also when it does it do it if inconsistent)


#### **A:** It depends on what the classification of the memory is. 
      [ _See unified memory attributes section below:_](#unified-memory-attributes)


  <br/><br/>
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



### **Q3:** How to identify where memory is stored for device function parameters?


#### **A:** two ways one runtime and one static 
   1. There exists a hip/cuda function called [`hipPointerGetAttributes()`](https://rocm-developer-tools.github.io/HIP/group__Memory.html#ga7c3e8663feebb7be9fd3a1e5139bcefc) that can retrieve a [`hipPointerAttribute_t`](https://rocm-developer-tools.github.io/HIP/structhipPointerAttribute__t.html) which contains the following information:
      ```cpp
        // summarized from hip_runtime_api.h 
        struct hipPointerAttribute {
          enum hipMemoryType {hipMemoryTypeHost,hipMemoryTypeDevice} memoryType; // enum for what pointer will be valid
          int device;           // id of the device
          void* devicePointer;  // pointer to mem location on device
          void* hostPointer;    // pointer to mem location on host
          int isManaged;        // if the mem is managed by linux's HMM system
          unsigned int allocationFlags;  // general allocation flags
        };
      ```
      This is runtime only, and costly in runtime to branch on this every time, but possibly even more costly in storage space for trace (and compression cycles) to output with every trace event to avoid branching.
      (also might not be callable from the GPU) <br/><br/>

   2. To figure out where memory probably is during compile-time (_aka_ during our instrumentation pass) except for some 
      - in host kernel you can identify global device & managed mem by looking in the `@__hip_module_ctor` function


  <br/><br/>
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



### **Q4:** How to instrument external modules and libs into an llvm IR module?


#### **A:** 
  Looked into how Address Sanitizer works and they utilizes the builtin llvm 
  [`compiler-rt`](https://github.com/llvm/llvm-project/tree/main/compiler-rt)
  which we can't do until we are ready and sure this tool is worth upstream-ing.

  The Breakdown of how `compiler-rt` supposedly works, 
  is that it is a single library that gets compiled down to all supported architectures
  (presumably as a static link library; _aka_ a library compiled to native code that is folded into 
  the executable at compile time and not linked to dynamically for runtime linking).
  Then during linking it is auto-magically included as a library to link to.

  I am unsure if manually telling the compiler to link to our library is exactly replicating this process.
  There are several reasons why:
  - it is hard to tell from their cmake file if the compile to a static library
  - when I compile our lib clang's C/C++ options mangle the names with the namespace 
    and rest of the function signature 
    (I have found a way to counter act this 
    \[[stack-overflow](https://stackoverflow.com/questions/524633/how-can-i-avoid-name-mangling)\])
  - 


  <br/><br/>
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



### **Q5:** How to deal with the use of external device side library calls?


#### **A:** ...


  <br/><br/>
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



### **Q6:** How to deal with runtime memory property accesses?
  (through use of [`hipHostMalloc()`](https://docs.amd.com/bundle/HIP_API_5/page/group___memory.html#gaad40bc7d97ccc799403ef5a9a8c246e1), [`hipHostRegister()`](https://docs.amd.com/bundle/HIP_API_5/page/group___memory.html#gab8258f051e1a1f7385f794a15300e674),  [`hipHostUnregister()`](https://docs.amd.com/bundle/HIP_API_5/page/group___memory.html#ga4c9e1810b9f5858d36c4d28c91c86924), _etc_)


#### **A:** ...


  <br/><br/>
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



### **Q7:** Will mem addresses be the same on host and the various devices?


#### **A:** Depends _(see conditions below)_ 
  - **Managed Mem:** yes (though the global will contain a pointer to the managed mem which will be the same on both host and devices, but that global's address will be different on host and devices)
  - **Registered Host Mem:** System dependent \[[doc](https://docs.amd.com/bundle/HIP_API_5/page/group___memory.html#gab8258f051e1a1f7385f794a15300e674)\]
  - **Device Mem:** Yes always
  - **Device Shared Mem:** Yes always


  <br/><br/>
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


### **Q8:** How to deal with async operations 
  (_aka_ [`hipMemcpyAsync()`](https://docs.amd.com/bundle/HIP_API_5/page/group___memory.html#d189e8922))


#### **A:** ...
  - NOTE: when called with blocking `hipLaunchKernel()` it does not call the device stub,
    however it will call the device stub if it is called from a work stream's queue.
    - This means I might be able to handle memory allocation and free-ing from
      instrumented predecessor and post-cessor functions on the host,
      and more importantly do it per kernel call.
    - This still requires getting wither the device id or stream id on the kernel to interface
      with heterogeneous memory 


  <br/><br/>
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



### **Q9:** How to deal with multiple concurrent streams to avoid data-races in trace buffers?
  There is no builtin way in hip (or cuda) to from the device at runtime get any notion of what stream,
  or other facility controls you, or even what device in a multi-device infrastructure you are running on.

#### **A:** several _**possible**_ options:
  NOTE: all options below have some design feature that prevents data-races from occurring, but they might have other slowdowns.

  WARNING: if you have concurrent streams that are running or using the same kernel code, there will be no way to differentiate which kernel launch they came from (so that is still a problem).

   1. \
      Setup a single global trace buffer in global memory, to some scale of .
      By making the next slot variable atomic we can prevent concurrent threads from getting the same offset when writing into the memory space.
        - PRO: easiest to implement
        - PRO: small (relatively) constant order of memory usage (probs $O(1)$)
        - PRO: Fixed sized buffer means it can be contiguous and therefore easy single copying to host reducing memory sync slowdowns.
        - CON: might cause **major** slowdowns in multiGPU environments
        - CON: during branch fragmentation, the excess memory slowdown and lane overlap will cause major slowdowns. (branch fragmentation is when a kernel branches to the degree where members of a warp are not adjacent threads anymore)
   2. \
      Same as option 1 but at kernel launch expand and contract the number of lanes in the device buffer,
      by a proportion of the active streams, say $warpSize\cdot(N_{streams}+1)$ buffer lanes, of constant size addressed by the modulo of the block and thread id's then let the thread/block id's offset everything.
      - PRO: small (relatively) order $O(n)$ memory usage (where $n$ is the number of instantiated streams)
      - PRO: easy to implement (compared to the others)
      - CON: being able to dynamically change the buffer means that it will need to be fragmented, slowing down and fragmenting copy operations and introducing complexity that could result in unknown behavior.
      - CON: if users aren't destroying unused streams memory could ballon, 
        copying the buffers could take up more time locking down memory,
        and 
   3. \
      Similar to options 1 & 2, 
      but expand and contract the device queues based upon kernel launches and the requisite sizes of the blocks and grids.
        - PRO: Possible to implement 
        - PRO: No need to encode thread or block id's
        - CON: more memory usage when doing larger launches
   4. _¿posible?_\
    Find a way to make all threads in a warp write to adjacent shared memory, then write the address of the shared memory to a common place.
      - CON: no way to identify an offset inside a warp, especially when branching gets messy
   5. \
    Instrument every function in every device module not marked `available_externally` to accept a new first argument, and make that argument be the address to launch specific device side implementation of the trace buffer.
   6. ...


  <br/><br/>
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



### **Q10:** how to deal with host/device clock mismatches?
I have to use the high resolution clock for both devices, but they don't technically have to give me
time in the same units let alone be synced at their resolution to any standard epoch.

#### **A:** ...



 Unified Memory Attributes
----------------------------------------------------------------------------------------------------

### Global Managed Memory
| Scope  | Attribute     | ¿Atomic? | Loc    | ¿Host? | ¿Device? |
|:------:|:-------------:|:--------:|:------:|:------:|:--------:|
| global | `__managed__` | X        | ¿both? | ✔      | ✔        |

#### C/C++/HIP:
```cpp
__managed__ std::size_t __m_val__ = 0xFACE;
```

#### LLVM IR: 
```llvm
;   amd-hsa/kernel/device IR module
; ===================================
@__m_val__.managed = protected addrspace(1) externally_initialized global i64 64206, align 8  ; <- HMM (managed) memory location
;         ^^^^^^^^   ^^^^^^^^^              ^^^^^^^^^^^^^^^^^^^^^^
@__m_val__ = protected addrspace(1) externally_initialized global i64 addrspace(1)* null      ; <- device side ptr to HMM memory 
;            ^^^^^^^^^              ^^^^^^^^^^^^^^^^^^^^^^            ^^^^^^^^^^^^
; ---- load operation in kernel function ----
  %1 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_val__, align 8  ; <- get location of managed memory
  %2 = load i64, i64* %1, align 8, !tbaa !3                                         ; <- get val from managed mem
; ---- store operation in kernel function ----
  store i64 %5, i64 addrspace(1)* %1, align 8, !tbaa !4                             ; <- store val in managed mem
; ---- atomic operation in kernel function ----
  %5 = atomicrmw xor i64 addrspace(1)* %4, i64 %3 seq_cst, align 8, !dbg !1703

;   x86_64/host IR module
; =========================
@__m_val__.managed = internal global i64 64206, align 8, !dbg !7  ; <- HMM (managed) memory location
;         ^^^^^^^^   ^^^^^^^^
@__m_val__ = internal externally_initialized global i64* null     ; <- host side pointer to HMM memory
;         ^? ^^^^^^^^ ^^^^^^^^^^^^^^^^^^^^^^
; ---- load operation in host function ----
  %1 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_val__, align 8  ; <- get location of managed memory
  %2 = load i64, i64 addrspace(1)* %1, align 8, !tbaa !4                            ; <- get val from managed mem
; ---- store operations in host function ----
  store i64 %5, i64* %1, align 8, !tbaa !3                                          ; <- store val in managed memory
```
As seen above managed memory when part of a global definition is marked with the `.managed` name attribute.

However, functions never directly read from this location, rather there exists another variable that
contains a pointer to wherever the managed memory location is at any given time.
Functions first load this memory to get an up to date pointer then perform operations from those mem
locations.

<br/><br/>



### Global Managed Atomic Memory
| Scope  | Attribute     | ¿Atomic? | Loc    | ¿Host? | ¿Device? |
|:------:|:-------------:|:--------:|:------:|:------:|:--------:|
| global | `__managed__` | ✔        | ¿both? | ✔      | ✔        |

#### C/C++/HIP:
```c
__managed__ _Atomic(size_t) __m_atomic__(0xDAB);
```

#### LLVM IR: 
```llvm
;   amd-hsa/kernel/device IR module
; ===================================
@__m_atomic__.managed = protected addrspace(1) externally_initialized global i64 3499, align 8  ; <- HMM (managed) memory location
;            ^^^^^^^^   ^^^^^^^^^
@__m_atomic__ = protected addrspace(1) externally_initialized global i64 addrspace(1)* null     ; <- device side ptr to HMM (managed) memory
;               ^^^^^^^^^
; ---- load operation in kernel function ----
  %10 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_atomic__, align 8  ; <- get memory location of managed memory
  %11 = load atomic i64, i64 addrspace(1)* %10 seq_cst, align 8, !tbaa !8               ; <- atomic read of managed memory location
  %14 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_atomic__, align 8  ; <- get managed memory loc, for atomic rw-op
; ---- atomic operation in kernel function ----
  %15 = atomicrmw xor i64 addrspace(1)* %14, i64 %13 seq_cst, align 8                   ; <- atomic rw-op on managed memory

;   x86_64/host IR module
; =========================
@__m_atomic__.managed = internal global i64 3499, align 8         ; <- HMM (managed) memory location
;            ^^^^^^^^   ^^^^^^^^
@__m_atomic__ = internal externally_initialized global i64* null  ; <- host side ptr to HMM (managed) memory
;               ^^^^^^^^
; ---- load operation in host function ----
  %18 = load i64*, i64** @__m_atomic__, align 8               ; <- get memory location of managed memory
  %19 = load atomic i64, i64* %18 seq_cst, align 8, !tbaa !7  ; <- atomic read of managed memory location
  %22 = load i64*, i64** @__m_atomic__, align 8               ; <- get managed memory loc, for atomic rw-op
; ---- atomic operation in host function ----
  %23 = atomicrmw xor i64* %22, i64 %21 seq_cst, align 8      ; <- atomic rw-op on managed memory
```
As seen above managed memory when part of a global definition is marked with the `.managed` name attribute.

However, functions never directly read from this location, rather there exists another variable that
contains a pointer to wherever the managed memory location is at any given time.
Functions first load this memory to get an up to date pointer then perform operations from those mem
locations.

<br/><br/>



### Global Device Memory
| Scope  | Attribute     | ¿Atomic? | Loc    | ¿Host? | ¿Device? |
|:------:|:-------------:|:--------:|:------:|:------:|:--------:|
| global | `__device__`  | X        | device | ✔      | ✔        |

#### C/C++/HIP:
```cpp
__device__ std::size_t __d_val__ = 0xBA5E;
```

#### LLVM IR: 
```llvm
;   amd-hsa/kernel/device IR module
; ===================================
@__d_val__ = protected addrspace(1) externally_initialized global i64 47710, align 8  ; <- device side storage location
; ---- load op in kernel function ----
  %1 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_val__, align 8
; ---- store op in kernel function ----
  store i64 %9, i64 addrspace(1)* @__d_val__, align 8, !tbaa !4


;   x86_64/host IR module
; =========================
@__d_val__ = internal global i64 undef, align 8 ; <- device memory global (no indicator that it is any different from host side globals)
; ---- load op in host function ----
  %1 = load i64*, i64** @__m_val__, align 8
; ---- store op in host function ----
  store i64 %13, i64* @__d_val__, align 8, !tbaa !3
```

This situation is straight forward, for both device and host.

This is interesting because there is absolutely no indicator that this is not a host side variable,
***implying that the memory address space is shared with AMD gpu's***

<br/><br/>



### Global Atomic Device Memory
| Scope  | Attribute     | ¿Atomic? | Loc    | ¿Host? | ¿Device? |
|:------:|:-------------:|:--------:|:------:|:------:|:--------:|
| global | `__device__`  | ✔        | device | ✔      | ✔        |

#### C/C++/HIP:
```cpp
__device__ _Atomic(size_t) __d_atomic__(0x5AD);
```

#### LLVM IR: 
```llvm
;   amd-hsa/kernel/device IR module
; ===================================
@__d_atomic__ = protected addrspace(1) externally_initialized global i64 1453, align 8  ; <- device side storage location
; ---- load op in kernel function ----
  %16 = load atomic i64, i64 addrspace(1)* @__d_atomic__ seq_cst, align 8, !tbaa !8
; ---- atomic rw-op in kernel function ----
  %19 = atomicrmw xor i64 addrspace(1)* @__d_atomic__, i64 %18 seq_cst, align 8


;   x86_64/host IR module
; =========================
@__d_atomic__ = internal global i64 undef, align 8 ; <- device memory global (no indicator that it is any different from host side globals)
; ---- load op in host function ----
  %28 = load atomic i64, i64* @__d_atomic__ seq_cst, align 8, !tbaa !7
; ---- atomic rw-op in host function ----
  %31 = atomicrmw xor i64* @__d_atomic__, i64 %30 seq_cst, align 8
```

This situation is straight forward, for both device and host.

This is interesting because there is absolutely no indicator that this is not a host side variable,
***implying that the memory address space is shared with AMD gpu's***
