  Scabbard Dev Notes
====================================================================================================

 TODO:
----------------------------------------------------------------------------------------------------

-[ ] ...



 Design Decisions:
----------------------------------------------------------------------------------------------------





 Questions (& Answers)
----------------------------------------------------------------------------------------------------

 1. **Q:** How does the IR denote host memory on the device? (also when it does it do it if inconsistent)
    - **A:** It depends on what the classification of the memory is. 
      [ _See unified memory attributes section below:_](#unified-memory-attributes)

    <br/><br/>


 2. **Q:** How does the IR denote device memory on the host? (also when it does it do it if inconsistent)
    - **A:** It depends on what the classification of the memory is. 
      [ _See unified memory attributes section below:_](#unified-memory-attributes)

    <br/><br/>


 3. **Q:** How to identify where memory is stored for device function parameters?
    - **A:** two ways one runtime and one static 
       1. There exists a hip/cuda function called [`hipPointerAttributes()`](https://rocm-developer-tools.github.io/HIP/group__Memory.html#ga7c3e8663feebb7be9fd3a1e5139bcefc) that can retrieve a [`hipPointerAttribute_t`](https://rocm-developer-tools.github.io/HIP/structhipPointerAttribute__t.html) which contains the following information:
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

    <br/><br/>


 4. **Q:** How to instrument external modules and libs into an llvm IR module?
    - **A:** ... 




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
