
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx1030
; ModuleID = 'test/managed_clock_test.cpp'
source_filename = "test/managed_clock_test.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15tick_all_kernelPU7_AtomicmPmPli(ptr addrspace(1) nocapture %0, ptr addrspace(1) nocapture writeonly %1, ptr addrspace(1) nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !5, !noundef !6
  %6 = zext i32 %5 to i64
  %7 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr inbounds i16, ptr addrspace(4) %7, i64 6
  %10 = load i16, ptr addrspace(4) %9, align 4, !tbaa !7
  %11 = zext i16 %10 to i64
  %12 = zext i32 %8 to i64
  %13 = mul nuw nsw i64 %11, %12
  %14 = add nuw nsw i64 %13, %6
  %15 = shl i64 %14, 32
  %16 = ashr exact i64 %15, 32
  %17 = getelementptr inbounds i64, ptr addrspace(1) %2, i64 %16
  %18 = load i64, ptr addrspace(1) %17, align 8, !tbaa !11, !amdgpu.noclobber !6
  %19 = add nsw i64 %16, %18
  store i64 %19, ptr addrspace(1) %17, align 8, !tbaa !11
  %20 = atomicrmw add ptr addrspace(1) %0, i64 1 seq_cst, align 8
  %21 = add i64 %20, 1
  %22 = add i32 %5, %3
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i64, ptr addrspace(1) %1, i64 %23
  store i64 %21, ptr addrspace(1) %24, align 8, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = load i64, ptr addrspace(1) %17, align 8, !tbaa !11
  %26 = add nsw i64 %25, %16
  store i64 %26, ptr addrspace(1) %17, align 8, !tbaa !11
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z12dummy_kernelv() local_unnamed_addr #0 {
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define protected amdgpu_kernel void @_Z10dummy_initPl(ptr addrspace(1) nocapture writeonly %0) local_unnamed_addr #1 {
  %2 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !5, !noundef !6
  %3 = zext i32 %2 to i64
  %4 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = getelementptr inbounds i16, ptr addrspace(4) %4, i64 6
  %7 = load i16, ptr addrspace(4) %6, align 4, !tbaa !7
  %8 = zext i16 %7 to i64
  %9 = zext i32 %5 to i64
  %10 = mul nuw nsw i64 %8, %9
  %11 = add nuw nsw i64 %10, %3
  %12 = shl i64 %11, 32
  %13 = ashr exact i64 %12, 32
  %14 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %13
  store i64 0, ptr addrspace(1) %14, align 8, !tbaa !11
  ret void
}

; Function Attrs: convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1030" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx10-3-insts,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1030" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx10-3-insts,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!opencl.ocl.version = !{!3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"amdgpu_code_object_version", i32 500}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 1}
!3 = !{i32 2, i32 0}
!4 = !{!"AMD clang version 16.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.6.0 23243 be997b2f3651a41597d7a41441fff8ade4ac59ac)"}
!5 = !{i32 0, i32 1024}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}

; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa-gfx1030

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = 'test/managed_clock_test.cpp'
source_filename = "test/managed_clock_test.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }
%struct.dim3 = type { i32, i32, i32 }
%struct.timespec = type { i64, i64 }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], ptr, i8, [7 x i8], ptr, ptr, ptr, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ ptr, i32 }>
%struct.hipDeviceProp_t = type { [256 x i8], i64, i64, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, %struct.hipDeviceArch_t, i32, i32, i32, i32, i64, i32, i32, i32, [256 x i8], i32, i32, i32, i32, i32, [2 x i32], [3 x i32], ptr, ptr, i64, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.hipDeviceArch_t = type { i24 }

$__hip_gpubin_handle = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_Z15tick_all_kernelPU7_AtomicmPmPli = dso_local constant ptr @_Z30__device_stub__tick_all_kernelPU7_AtomicmPmPli, align 8
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [37 x i8] c"\0A==== STARTING TEST: tick all ====\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Using GPU with device ID: \00", align 1
@_Z10dummy_initPl = dso_local constant ptr @_Z25__device_stub__dummy_initPl, align 8
@.str.2 = private unnamed_addr constant [19 x i8] c"Dummy Data init: {\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"\0A    \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"...\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"\0A  }\0A\00", align 1
@.str.7 = private unnamed_addr constant [60 x i8] c"\0ASUCCESS managed mem registered change before call to sync!\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"\0AFinal ``Clock'' time: \00", align 1
@.str.9 = private unnamed_addr constant [36 x i8] c"\0AGPU Threads modified as follows: {\00", align 1
@.str.10 = private unnamed_addr constant [35 x i8] c"\0A==== ENDING TEST: tick all ====\0A\0A\00", align 1
@_Z12dummy_kernelv = dso_local constant ptr @_Z27__device_stub__dummy_kernelv, align 8
@.str.11 = private unnamed_addr constant [15 x i8] c" System minor \00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c" System major \00", align 1
@.str.13 = private unnamed_addr constant [18 x i8] c" agent prop name \00", align 1
@_ZSt4cerr = external dso_local global %"class.std::basic_ostream", align 8
@.str.14 = private unnamed_addr constant [13 x i8] c"\0AHIP ERROR: \00", align 1
@0 = private unnamed_addr constant [36 x i8] c"_Z15tick_all_kernelPU7_AtomicmPmPli\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"_Z12dummy_kernelv\00", align 1
@2 = private unnamed_addr constant [17 x i8] c"_Z10dummy_initPl\00", align 1
@__hip_fatbin = external constant i8, section ".hip_fatbin"
@__hip_fatbin_wrapper = internal constant { i32, i32, ptr, ptr } { i32 1212764230, i32 1, ptr @__hip_fatbin, ptr null }, section ".hipFatBinSegment", align 8
@__hip_gpubin_handle = linkonce hidden local_unnamed_addr global ptr null, comdat, align 8
@llvm.global_ctors = appending global [2 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_managed_clock_test.cpp, ptr null }, { i32, ptr, ptr } { i32 65535, ptr @__hip_module_ctor, ptr null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(ptr, ptr, ptr) local_unnamed_addr #2

; Function Attrs: norecurse uwtable
define dso_local void @_Z30__device_stub__tick_all_kernelPU7_AtomicmPmPli(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #3 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.dim3, align 8
  %10 = alloca %struct.dim3, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8, !tbaa !3
  store ptr %1, ptr %6, align 8, !tbaa !3
  store ptr %2, ptr %7, align 8, !tbaa !3
  store i32 %3, ptr %8, align 4, !tbaa !7
  %13 = alloca [4 x ptr], align 16
  store ptr %5, ptr %13, align 16
  %14 = getelementptr inbounds ptr, ptr %13, i64 1
  store ptr %6, ptr %14, align 8
  %15 = getelementptr inbounds ptr, ptr %13, i64 2
  store ptr %7, ptr %15, align 16
  %16 = getelementptr inbounds ptr, ptr %13, i64 3
  store ptr %8, ptr %16, align 8
  %17 = call i32 @__hipPopCallConfiguration(ptr nonnull %9, ptr nonnull %10, ptr nonnull %11, ptr nonnull %12)
  %18 = load i64, ptr %11, align 8
  %19 = load ptr, ptr %12, align 8
  %20 = load i64, ptr %9, align 8
  %21 = getelementptr inbounds i8, ptr %9, i64 8
  %22 = load i32, ptr %21, align 8
  %23 = load i64, ptr %10, align 8
  %24 = getelementptr inbounds i8, ptr %10, i64 8
  %25 = load i32, ptr %24, align 8
  %26 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z15tick_all_kernelPU7_AtomicmPmPli, i64 %20, i32 %22, i64 %23, i32 %25, ptr noundef nonnull %13, i64 noundef %18, ptr noundef %19)
  ret void
}

declare dso_local i32 @__hipPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare dso_local i32 @hipLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: noinline uwtable
define dso_local void @_Z13tick_all_testi(i32 noundef %0) local_unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %2 = alloca %struct.timespec, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca [4 x ptr], align 16
  %12 = alloca ptr, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 16
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %18) #16
  store i32 0, ptr %18, align 4, !tbaa !7
  %22 = call i32 @hipGetDevice(ptr noundef nonnull %18)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %28, label %24

24:                                               ; preds = %1
  %25 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %25, i32 noundef %22)
  %27 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %26)
  call void @exit(i32 noundef 1) #17
  unreachable

28:                                               ; preds = %1
  %29 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str, i64 noundef 36)
  %30 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout)
  %31 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.1, i64 noundef 26)
  %32 = load i32, ptr %18, align 4, !tbaa !7
  %33 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %32)
  %34 = load ptr, ptr %33, align 8, !tbaa !9
  %35 = getelementptr i8, ptr %34, i64 -24
  %36 = load i64, ptr %35, align 8
  %37 = getelementptr inbounds i8, ptr %33, i64 %36
  %38 = getelementptr inbounds %"class.std::basic_ios", ptr %37, i64 0, i32 5
  %39 = load ptr, ptr %38, align 8, !tbaa !11
  %40 = icmp eq ptr %39, null
  br i1 %40, label %41, label %42

41:                                               ; preds = %28
  call void @_ZSt16__throw_bad_castv() #18
  unreachable

42:                                               ; preds = %28
  %43 = getelementptr inbounds %"class.std::ctype", ptr %39, i64 0, i32 8
  %44 = load i8, ptr %43, align 8, !tbaa !20
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %49, label %46

46:                                               ; preds = %42
  %47 = getelementptr inbounds %"class.std::ctype", ptr %39, i64 0, i32 9, i64 10
  %48 = load i8, ptr %47, align 1, !tbaa !23
  br label %54

49:                                               ; preds = %42
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %39)
  %50 = load ptr, ptr %39, align 8, !tbaa !9
  %51 = getelementptr inbounds ptr, ptr %50, i64 6
  %52 = load ptr, ptr %51, align 8
  %53 = call noundef signext i8 %52(ptr noundef nonnull align 8 dereferenceable(570) %39, i8 noundef signext 10)
  br label %54

54:                                               ; preds = %46, %49
  %55 = phi i8 [ %48, %46 ], [ %53, %49 ]
  %56 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %33, i8 noundef signext %55)
  %57 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %56)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %19) #16
  %58 = call i32 @hipMallocManaged(ptr noundef nonnull %19, i64 noundef 1, i32 noundef 1)
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %64, label %60

60:                                               ; preds = %54
  %61 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %62 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %61, i32 noundef %58)
  %63 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %62)
  call void @exit(i32 noundef 1) #17
  unreachable

64:                                               ; preds = %54
  %65 = load ptr, ptr %19, align 8, !tbaa !3
  store atomic i64 0, ptr %65 seq_cst, align 8, !tbaa !23
  %66 = call noalias noundef nonnull dereferenceable(8192) ptr @_Znam(i64 noundef 8192) #19
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(8192) %66, i8 0, i64 8192, i1 false)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %20) #16
  %67 = call i32 @hipMalloc(ptr noundef nonnull %20, i64 noundef 8192)
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %73, label %69

69:                                               ; preds = %64
  %70 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %71 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %70, i32 noundef %67)
  %72 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %71)
  call void @exit(i32 noundef 1) #17
  unreachable

73:                                               ; preds = %64
  %74 = load ptr, ptr %20, align 8, !tbaa !3
  %75 = call i32 @hipMemcpy(ptr noundef %74, ptr noundef nonnull %66, i64 noundef 8192, i32 noundef 1)
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %81, label %77

77:                                               ; preds = %73
  %78 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %79 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %78, i32 noundef %75)
  %80 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %79)
  call void @exit(i32 noundef 1) #17
  unreachable

81:                                               ; preds = %73
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %21) #16
  %82 = call i32 @hipMalloc(ptr noundef nonnull %21, i64 noundef 8192)
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %88, label %84

84:                                               ; preds = %81
  %85 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %86 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %85, i32 noundef %82)
  %87 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %86)
  call void @exit(i32 noundef 1) #17
  unreachable

88:                                               ; preds = %81
  %89 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294968320, i32 1, i64 noundef 0, ptr noundef null)
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %91, label %103

91:                                               ; preds = %88
  %92 = load ptr, ptr %21, align 8, !tbaa !3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %12)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %13)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %14)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %15)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %16)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %17)
  store ptr %92, ptr %12, align 8, !tbaa !3
  store ptr %12, ptr %17, align 16
  %93 = call i32 @__hipPopCallConfiguration(ptr nonnull %13, ptr nonnull %14, ptr nonnull %15, ptr nonnull %16)
  %94 = load i64, ptr %15, align 8
  %95 = load ptr, ptr %16, align 8
  %96 = load i64, ptr %13, align 8
  %97 = getelementptr inbounds i8, ptr %13, i64 8
  %98 = load i32, ptr %97, align 8
  %99 = load i64, ptr %14, align 8
  %100 = getelementptr inbounds i8, ptr %14, i64 8
  %101 = load i32, ptr %100, align 8
  %102 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z10dummy_initPl, i64 %96, i32 %98, i64 %99, i32 %101, ptr noundef nonnull %17, i64 noundef %94, ptr noundef %95)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %12)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %13)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %14)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %15)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %16)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %17)
  br label %103

103:                                              ; preds = %91, %88
  %104 = call noalias noundef nonnull dereferenceable(8192) ptr @_Znam(i64 noundef 8192) #19
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(8192) %104, i8 0, i64 8192, i1 false)
  %105 = load ptr, ptr %21, align 8, !tbaa !3
  %106 = call i32 @hipMemcpy(ptr noundef nonnull %104, ptr noundef %105, i64 noundef 8192, i32 noundef 2)
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %112, label %108

108:                                              ; preds = %103
  %109 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %110 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %109, i32 noundef %106)
  %111 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %110)
  call void @exit(i32 noundef 1) #17
  unreachable

112:                                              ; preds = %103
  %113 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.2, i64 noundef 18)
  br label %152

114:                                              ; preds = %183
  %115 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5)
  %116 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  %117 = getelementptr i8, ptr %116, i64 -24
  %118 = load i64, ptr %117, align 8
  %119 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %118
  %120 = getelementptr inbounds %"class.std::basic_ios", ptr %119, i64 0, i32 3
  %121 = load i8, ptr %120, align 1, !tbaa !24, !range !25, !noundef !26
  %122 = icmp eq i8 %121, 0
  br i1 %122, label %123, label %140

123:                                              ; preds = %114
  %124 = getelementptr inbounds %"class.std::basic_ios", ptr %119, i64 0, i32 5
  %125 = load ptr, ptr %124, align 8, !tbaa !11
  %126 = icmp eq ptr %125, null
  br i1 %126, label %127, label %128

127:                                              ; preds = %123
  call void @_ZSt16__throw_bad_castv() #18
  unreachable

128:                                              ; preds = %123
  %129 = getelementptr inbounds %"class.std::ctype", ptr %125, i64 0, i32 8
  %130 = load i8, ptr %129, align 8, !tbaa !20
  %131 = icmp eq i8 %130, 0
  br i1 %131, label %132, label %138

132:                                              ; preds = %128
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %125)
  %133 = load ptr, ptr %125, align 8, !tbaa !9
  %134 = getelementptr inbounds ptr, ptr %133, i64 6
  %135 = load ptr, ptr %134, align 8
  %136 = call noundef signext i8 %135(ptr noundef nonnull align 8 dereferenceable(570) %125, i8 noundef signext 32)
  %137 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  br label %138

138:                                              ; preds = %132, %128
  %139 = phi ptr [ %137, %132 ], [ %116, %128 ]
  store i8 1, ptr %120, align 1, !tbaa !24
  br label %140

140:                                              ; preds = %114, %138
  %141 = phi ptr [ %116, %114 ], [ %139, %138 ]
  %142 = getelementptr inbounds %"class.std::basic_ios", ptr %119, i64 0, i32 2
  store i8 32, ptr %142, align 8, !tbaa !27
  %143 = getelementptr i8, ptr %141, i64 -24
  %144 = load i64, ptr %143, align 8
  %145 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %144
  %146 = getelementptr inbounds %"class.std::ios_base", ptr %145, i64 0, i32 2
  store i64 8, ptr %146, align 8, !tbaa !28
  %147 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.5, i64 noundef 3)
  %148 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.6, i64 noundef 5)
  %149 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout)
  %150 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294968320, i32 1, i64 noundef 0, ptr noundef null)
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %196, label %213

152:                                              ; preds = %112, %183
  %153 = phi i64 [ 0, %112 ], [ %194, %183 ]
  %154 = and i64 %153, 15
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %156, label %158

156:                                              ; preds = %152
  %157 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5)
  br label %158

158:                                              ; preds = %156, %152
  %159 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  %160 = getelementptr i8, ptr %159, i64 -24
  %161 = load i64, ptr %160, align 8
  %162 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %161
  %163 = getelementptr inbounds %"class.std::basic_ios", ptr %162, i64 0, i32 3
  %164 = load i8, ptr %163, align 1, !tbaa !24, !range !25, !noundef !26
  %165 = icmp eq i8 %164, 0
  br i1 %165, label %166, label %183

166:                                              ; preds = %158
  %167 = getelementptr inbounds %"class.std::basic_ios", ptr %162, i64 0, i32 5
  %168 = load ptr, ptr %167, align 8, !tbaa !11
  %169 = icmp eq ptr %168, null
  br i1 %169, label %170, label %171

170:                                              ; preds = %166
  call void @_ZSt16__throw_bad_castv() #18
  unreachable

171:                                              ; preds = %166
  %172 = getelementptr inbounds %"class.std::ctype", ptr %168, i64 0, i32 8
  %173 = load i8, ptr %172, align 8, !tbaa !20
  %174 = icmp eq i8 %173, 0
  br i1 %174, label %175, label %181

175:                                              ; preds = %171
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %168)
  %176 = load ptr, ptr %168, align 8, !tbaa !9
  %177 = getelementptr inbounds ptr, ptr %176, i64 6
  %178 = load ptr, ptr %177, align 8
  %179 = call noundef signext i8 %178(ptr noundef nonnull align 8 dereferenceable(570) %168, i8 noundef signext 32)
  %180 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  br label %181

181:                                              ; preds = %175, %171
  %182 = phi ptr [ %180, %175 ], [ %159, %171 ]
  store i8 1, ptr %163, align 1, !tbaa !24
  br label %183

183:                                              ; preds = %158, %181
  %184 = phi ptr [ %159, %158 ], [ %182, %181 ]
  %185 = getelementptr inbounds %"class.std::basic_ios", ptr %162, i64 0, i32 2
  store i8 32, ptr %185, align 8, !tbaa !27
  %186 = getelementptr i8, ptr %184, i64 -24
  %187 = load i64, ptr %186, align 8
  %188 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %187
  %189 = getelementptr inbounds %"class.std::ios_base", ptr %188, i64 0, i32 2
  store i64 8, ptr %189, align 8, !tbaa !28
  %190 = getelementptr inbounds i64, ptr %104, i64 %153
  %191 = load i64, ptr %190, align 8, !tbaa !29
  %192 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertIlEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %191)
  %193 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %192, ptr noundef nonnull @.str.4, i64 noundef 1)
  %194 = add nuw nsw i64 %153, 1
  %195 = icmp eq i64 %194, 128
  br i1 %195, label %114, label %152, !llvm.loop !30

196:                                              ; preds = %140
  %197 = load ptr, ptr %19, align 8, !tbaa !3
  %198 = load ptr, ptr %20, align 8, !tbaa !3
  %199 = load ptr, ptr %21, align 8, !tbaa !3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %7)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %8)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %9)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %10)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %11)
  store ptr %197, ptr %3, align 8, !tbaa !3
  store ptr %198, ptr %4, align 8, !tbaa !3
  store ptr %199, ptr %5, align 8, !tbaa !3
  store i32 %0, ptr %6, align 4, !tbaa !7
  store ptr %3, ptr %11, align 16
  %200 = getelementptr inbounds ptr, ptr %11, i64 1
  store ptr %4, ptr %200, align 8
  %201 = getelementptr inbounds ptr, ptr %11, i64 2
  store ptr %5, ptr %201, align 16
  %202 = getelementptr inbounds ptr, ptr %11, i64 3
  store ptr %6, ptr %202, align 8
  %203 = call i32 @__hipPopCallConfiguration(ptr nonnull %7, ptr nonnull %8, ptr nonnull %9, ptr nonnull %10)
  %204 = load i64, ptr %9, align 8
  %205 = load ptr, ptr %10, align 8
  %206 = load i64, ptr %7, align 8
  %207 = getelementptr inbounds i8, ptr %7, i64 8
  %208 = load i32, ptr %207, align 8
  %209 = load i64, ptr %8, align 8
  %210 = getelementptr inbounds i8, ptr %8, i64 8
  %211 = load i32, ptr %210, align 8
  %212 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z15tick_all_kernelPU7_AtomicmPmPli, i64 %206, i32 %208, i64 %209, i32 %211, ptr noundef nonnull %11, i64 noundef %204, ptr noundef %205)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %8)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %10)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %11)
  br label %213

213:                                              ; preds = %196, %140
  %214 = getelementptr inbounds %struct.timespec, ptr %2, i64 0, i32 1
  br label %215

215:                                              ; preds = %229, %213
  %216 = phi i64 [ %230, %229 ], [ 64, %213 ]
  br label %217

217:                                              ; preds = %215, %225
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #16
  store i64 0, ptr %2, align 8, !tbaa !32
  store i64 1000000, ptr %214, align 8, !tbaa !34
  br label %218

218:                                              ; preds = %221, %217
  %219 = call i32 @nanosleep(ptr noundef nonnull %2, ptr noundef nonnull %2)
  %220 = icmp eq i32 %219, -1
  br i1 %220, label %221, label %225

221:                                              ; preds = %218
  %222 = tail call ptr @__errno_location() #20
  %223 = load i32, ptr %222, align 4, !tbaa !7
  %224 = icmp eq i32 %223, 4
  br i1 %224, label %218, label %225, !llvm.loop !35

225:                                              ; preds = %218, %221
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #16
  %226 = load ptr, ptr %19, align 8, !tbaa !3
  %227 = load atomic i64, ptr %226 seq_cst, align 8, !tbaa !23
  %228 = icmp eq i64 %227, 0
  br i1 %228, label %217, label %229

229:                                              ; preds = %225
  %230 = add nsw i64 %216, -1
  %231 = icmp ugt i64 %216, 1
  br i1 %231, label %215, label %232, !llvm.loop !36

232:                                              ; preds = %229
  %233 = load ptr, ptr %19, align 8, !tbaa !3
  %234 = load atomic i64, ptr %233 seq_cst, align 8, !tbaa !23
  %235 = icmp eq i64 %234, 0
  br i1 %235, label %262, label %236

236:                                              ; preds = %232
  %237 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.7, i64 noundef 59)
  %238 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  %239 = getelementptr i8, ptr %238, i64 -24
  %240 = load i64, ptr %239, align 8
  %241 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %240
  %242 = getelementptr inbounds %"class.std::basic_ios", ptr %241, i64 0, i32 5
  %243 = load ptr, ptr %242, align 8, !tbaa !11
  %244 = icmp eq ptr %243, null
  br i1 %244, label %245, label %246

245:                                              ; preds = %236
  call void @_ZSt16__throw_bad_castv() #18
  unreachable

246:                                              ; preds = %236
  %247 = getelementptr inbounds %"class.std::ctype", ptr %243, i64 0, i32 8
  %248 = load i8, ptr %247, align 8, !tbaa !20
  %249 = icmp eq i8 %248, 0
  br i1 %249, label %253, label %250

250:                                              ; preds = %246
  %251 = getelementptr inbounds %"class.std::ctype", ptr %243, i64 0, i32 9, i64 10
  %252 = load i8, ptr %251, align 1, !tbaa !23
  br label %258

253:                                              ; preds = %246
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %243)
  %254 = load ptr, ptr %243, align 8, !tbaa !9
  %255 = getelementptr inbounds ptr, ptr %254, i64 6
  %256 = load ptr, ptr %255, align 8
  %257 = call noundef signext i8 %256(ptr noundef nonnull align 8 dereferenceable(570) %243, i8 noundef signext 10)
  br label %258

258:                                              ; preds = %250, %253
  %259 = phi i8 [ %252, %250 ], [ %257, %253 ]
  %260 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %259)
  %261 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %260)
  br label %262

262:                                              ; preds = %258, %232
  %263 = load ptr, ptr %20, align 8, !tbaa !3
  %264 = call i32 @hipMemcpy(ptr noundef nonnull %66, ptr noundef %263, i64 noundef 8192, i32 noundef 2)
  %265 = icmp eq i32 %264, 0
  br i1 %265, label %270, label %266

266:                                              ; preds = %262
  %267 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %268 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %267, i32 noundef %264)
  %269 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %268)
  call void @exit(i32 noundef 1) #17
  unreachable

270:                                              ; preds = %262
  %271 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.8, i64 noundef 23)
  %272 = load ptr, ptr %19, align 8, !tbaa !3
  %273 = load atomic i64, ptr %272 seq_cst, align 8, !tbaa !23
  %274 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %273)
  %275 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %274, ptr noundef nonnull @.str.9, i64 noundef 35)
  br label %361

276:                                              ; preds = %392
  %277 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5)
  %278 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  %279 = getelementptr i8, ptr %278, i64 -24
  %280 = load i64, ptr %279, align 8
  %281 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %280
  %282 = getelementptr inbounds %"class.std::basic_ios", ptr %281, i64 0, i32 3
  %283 = load i8, ptr %282, align 1, !tbaa !24, !range !25, !noundef !26
  %284 = icmp eq i8 %283, 0
  br i1 %284, label %285, label %302

285:                                              ; preds = %276
  %286 = getelementptr inbounds %"class.std::basic_ios", ptr %281, i64 0, i32 5
  %287 = load ptr, ptr %286, align 8, !tbaa !11
  %288 = icmp eq ptr %287, null
  br i1 %288, label %289, label %290

289:                                              ; preds = %285
  call void @_ZSt16__throw_bad_castv() #18
  unreachable

290:                                              ; preds = %285
  %291 = getelementptr inbounds %"class.std::ctype", ptr %287, i64 0, i32 8
  %292 = load i8, ptr %291, align 8, !tbaa !20
  %293 = icmp eq i8 %292, 0
  br i1 %293, label %294, label %300

294:                                              ; preds = %290
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %287)
  %295 = load ptr, ptr %287, align 8, !tbaa !9
  %296 = getelementptr inbounds ptr, ptr %295, i64 6
  %297 = load ptr, ptr %296, align 8
  %298 = call noundef signext i8 %297(ptr noundef nonnull align 8 dereferenceable(570) %287, i8 noundef signext 32)
  %299 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  br label %300

300:                                              ; preds = %294, %290
  %301 = phi ptr [ %299, %294 ], [ %278, %290 ]
  store i8 1, ptr %282, align 1, !tbaa !24
  br label %302

302:                                              ; preds = %276, %300
  %303 = phi ptr [ %278, %276 ], [ %301, %300 ]
  %304 = getelementptr inbounds %"class.std::basic_ios", ptr %281, i64 0, i32 2
  store i8 32, ptr %304, align 8, !tbaa !27
  %305 = getelementptr i8, ptr %303, i64 -24
  %306 = load i64, ptr %305, align 8
  %307 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %306
  %308 = getelementptr inbounds %"class.std::ios_base", ptr %307, i64 0, i32 2
  store i64 8, ptr %308, align 8, !tbaa !28
  %309 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.5, i64 noundef 3)
  %310 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.6, i64 noundef 5)
  %311 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  %312 = getelementptr i8, ptr %311, i64 -24
  %313 = load i64, ptr %312, align 8
  %314 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %313
  %315 = getelementptr inbounds %"class.std::basic_ios", ptr %314, i64 0, i32 5
  %316 = load ptr, ptr %315, align 8, !tbaa !11
  %317 = icmp eq ptr %316, null
  br i1 %317, label %318, label %319

318:                                              ; preds = %302
  call void @_ZSt16__throw_bad_castv() #18
  unreachable

319:                                              ; preds = %302
  %320 = getelementptr inbounds %"class.std::ctype", ptr %316, i64 0, i32 8
  %321 = load i8, ptr %320, align 8, !tbaa !20
  %322 = icmp eq i8 %321, 0
  br i1 %322, label %326, label %323

323:                                              ; preds = %319
  %324 = getelementptr inbounds %"class.std::ctype", ptr %316, i64 0, i32 9, i64 10
  %325 = load i8, ptr %324, align 1, !tbaa !23
  br label %331

326:                                              ; preds = %319
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %316)
  %327 = load ptr, ptr %316, align 8, !tbaa !9
  %328 = getelementptr inbounds ptr, ptr %327, i64 6
  %329 = load ptr, ptr %328, align 8
  %330 = call noundef signext i8 %329(ptr noundef nonnull align 8 dereferenceable(570) %316, i8 noundef signext 10)
  br label %331

331:                                              ; preds = %323, %326
  %332 = phi i8 [ %325, %323 ], [ %330, %326 ]
  %333 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %332)
  %334 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %333)
  %335 = load ptr, ptr %20, align 8, !tbaa !3
  %336 = call i32 @hipFree(ptr noundef %335)
  %337 = icmp eq i32 %336, 0
  br i1 %337, label %342, label %338

338:                                              ; preds = %331
  %339 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %340 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %339, i32 noundef %336)
  %341 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %340)
  call void @exit(i32 noundef 1) #17
  unreachable

342:                                              ; preds = %331
  %343 = load ptr, ptr %19, align 8, !tbaa !3
  %344 = call i32 @hipFree(ptr noundef %343)
  %345 = icmp eq i32 %344, 0
  br i1 %345, label %350, label %346

346:                                              ; preds = %342
  %347 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %348 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %347, i32 noundef %344)
  %349 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %348)
  call void @exit(i32 noundef 1) #17
  unreachable

350:                                              ; preds = %342
  %351 = load ptr, ptr %21, align 8, !tbaa !3
  %352 = call i32 @hipFree(ptr noundef %351)
  %353 = icmp eq i32 %352, 0
  br i1 %353, label %358, label %354

354:                                              ; preds = %350
  %355 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %356 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %355, i32 noundef %352)
  %357 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %356)
  call void @exit(i32 noundef 1) #17
  unreachable

358:                                              ; preds = %350
  call void @_ZdaPv(ptr noundef nonnull %66) #21
  call void @_ZdaPv(ptr noundef nonnull %104) #21
  %359 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.10, i64 noundef 34)
  %360 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %21) #16
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %20) #16
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %19) #16
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %18) #16
  ret void

361:                                              ; preds = %270, %392
  %362 = phi i64 [ 0, %270 ], [ %403, %392 ]
  %363 = and i64 %362, 15
  %364 = icmp eq i64 %363, 0
  br i1 %364, label %365, label %367

365:                                              ; preds = %361
  %366 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5)
  br label %367

367:                                              ; preds = %365, %361
  %368 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  %369 = getelementptr i8, ptr %368, i64 -24
  %370 = load i64, ptr %369, align 8
  %371 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %370
  %372 = getelementptr inbounds %"class.std::basic_ios", ptr %371, i64 0, i32 3
  %373 = load i8, ptr %372, align 1, !tbaa !24, !range !25, !noundef !26
  %374 = icmp eq i8 %373, 0
  br i1 %374, label %375, label %392

375:                                              ; preds = %367
  %376 = getelementptr inbounds %"class.std::basic_ios", ptr %371, i64 0, i32 5
  %377 = load ptr, ptr %376, align 8, !tbaa !11
  %378 = icmp eq ptr %377, null
  br i1 %378, label %379, label %380

379:                                              ; preds = %375
  call void @_ZSt16__throw_bad_castv() #18
  unreachable

380:                                              ; preds = %375
  %381 = getelementptr inbounds %"class.std::ctype", ptr %377, i64 0, i32 8
  %382 = load i8, ptr %381, align 8, !tbaa !20
  %383 = icmp eq i8 %382, 0
  br i1 %383, label %384, label %390

384:                                              ; preds = %380
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %377)
  %385 = load ptr, ptr %377, align 8, !tbaa !9
  %386 = getelementptr inbounds ptr, ptr %385, i64 6
  %387 = load ptr, ptr %386, align 8
  %388 = call noundef signext i8 %387(ptr noundef nonnull align 8 dereferenceable(570) %377, i8 noundef signext 32)
  %389 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  br label %390

390:                                              ; preds = %384, %380
  %391 = phi ptr [ %389, %384 ], [ %368, %380 ]
  store i8 1, ptr %372, align 1, !tbaa !24
  br label %392

392:                                              ; preds = %367, %390
  %393 = phi ptr [ %368, %367 ], [ %391, %390 ]
  %394 = getelementptr inbounds %"class.std::basic_ios", ptr %371, i64 0, i32 2
  store i8 32, ptr %394, align 8, !tbaa !27
  %395 = getelementptr i8, ptr %393, i64 -24
  %396 = load i64, ptr %395, align 8
  %397 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %396
  %398 = getelementptr inbounds %"class.std::ios_base", ptr %397, i64 0, i32 2
  store i64 8, ptr %398, align 8, !tbaa !28
  %399 = getelementptr inbounds i64, ptr %66, i64 %362
  %400 = load i64, ptr %399, align 8, !tbaa !29
  %401 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %400)
  %402 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %401, ptr noundef nonnull @.str.4, i64 noundef 1)
  %403 = add nuw nsw i64 %362, 1
  %404 = icmp eq i64 %403, 128
  br i1 %404, label %276, label %361, !llvm.loop !37
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13__HIP_CHECK__10hipError_t(i32 noundef %0) local_unnamed_addr #6 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %7, label %3

3:                                                ; preds = %1
  %4 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %5 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %4, i32 noundef %0)
  %6 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %5)
  tail call void @exit(i32 noundef 1) #17
  unreachable

7:                                                ; preds = %1
  ret void
}

declare dso_local i32 @hipGetDevice(ptr noundef) local_unnamed_addr #0

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) local_unnamed_addr #7

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #0

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #7

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull ptr @_Znam(i64 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #9

declare dso_local i32 @hipMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare dso_local i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #0

; Function Attrs: norecurse uwtable
define dso_local void @_Z25__device_stub__dummy_initPl(ptr noundef %0) #3 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.dim3, align 8
  %4 = alloca %struct.dim3, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !3
  %7 = alloca ptr, align 16
  store ptr %2, ptr %7, align 16
  %8 = call i32 @__hipPopCallConfiguration(ptr nonnull %3, ptr nonnull %4, ptr nonnull %5, ptr nonnull %6)
  %9 = load i64, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load i64, ptr %3, align 8
  %12 = getelementptr inbounds i8, ptr %3, i64 8
  %13 = load i32, ptr %12, align 8
  %14 = load i64, ptr %4, align 8
  %15 = getelementptr inbounds i8, ptr %4, i64 8
  %16 = load i32, ptr %15, align 8
  %17 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z10dummy_initPl, i64 %11, i32 %13, i64 %14, i32 %16, ptr noundef nonnull %7, i64 noundef %9, ptr noundef %10)
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #5

declare dso_local i32 @hipFree(ptr noundef) local_unnamed_addr #0

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdaPv(ptr noundef) local_unnamed_addr #10

; Function Attrs: norecurse uwtable
define dso_local void @_Z27__device_stub__dummy_kernelv() #3 {
  %1 = alloca %struct.dim3, align 8
  %2 = alloca %struct.dim3, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 16
  %6 = call i32 @__hipPopCallConfiguration(ptr nonnull %1, ptr nonnull %2, ptr nonnull %3, ptr nonnull %4)
  %7 = load i64, ptr %3, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %1, align 8
  %10 = getelementptr inbounds i8, ptr %1, i64 8
  %11 = load i32, ptr %10, align 8
  %12 = load i64, ptr %2, align 8
  %13 = getelementptr inbounds i8, ptr %2, i64 8
  %14 = load i32, ptr %13, align 8
  %15 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z12dummy_kernelv, i64 %9, i32 %11, i64 %12, i32 %14, ptr noundef nonnull %5, i64 noundef %7, ptr noundef %8)
  ret void
}

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #3 {
  %3 = alloca %struct.dim3, align 8
  %4 = alloca %struct.dim3, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 16
  %8 = alloca %struct.hipDeviceProp_t, align 8
  call void @llvm.lifetime.start.p0(i64 792, ptr nonnull %8) #16
  %9 = call i32 @hipGetDeviceProperties(ptr noundef nonnull %8, i32 noundef 0)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %15, label %11

11:                                               ; preds = %2
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14)
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %12, i32 noundef %9)
  %14 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %13)
  call void @exit(i32 noundef 1) #17
  unreachable

15:                                               ; preds = %2
  %16 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.11, i64 noundef 14)
  %17 = getelementptr inbounds %struct.hipDeviceProp_t, ptr %8, i64 0, i32 13
  %18 = load i32, ptr %17, align 4, !tbaa !38
  %19 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %18)
  %20 = load ptr, ptr %19, align 8, !tbaa !9
  %21 = getelementptr i8, ptr %20, i64 -24
  %22 = load i64, ptr %21, align 8
  %23 = getelementptr inbounds i8, ptr %19, i64 %22
  %24 = getelementptr inbounds %"class.std::basic_ios", ptr %23, i64 0, i32 5
  %25 = load ptr, ptr %24, align 8, !tbaa !11
  %26 = icmp eq ptr %25, null
  br i1 %26, label %27, label %28

27:                                               ; preds = %15
  call void @_ZSt16__throw_bad_castv() #18
  unreachable

28:                                               ; preds = %15
  %29 = getelementptr inbounds %"class.std::ctype", ptr %25, i64 0, i32 8
  %30 = load i8, ptr %29, align 8, !tbaa !20
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %35, label %32

32:                                               ; preds = %28
  %33 = getelementptr inbounds %"class.std::ctype", ptr %25, i64 0, i32 9, i64 10
  %34 = load i8, ptr %33, align 1, !tbaa !23
  br label %40

35:                                               ; preds = %28
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %25)
  %36 = load ptr, ptr %25, align 8, !tbaa !9
  %37 = getelementptr inbounds ptr, ptr %36, i64 6
  %38 = load ptr, ptr %37, align 8
  %39 = call noundef signext i8 %38(ptr noundef nonnull align 8 dereferenceable(570) %25, i8 noundef signext 10)
  br label %40

40:                                               ; preds = %32, %35
  %41 = phi i8 [ %34, %32 ], [ %39, %35 ]
  %42 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %19, i8 noundef signext %41)
  %43 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %42)
  %44 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.12, i64 noundef 14)
  %45 = getelementptr inbounds %struct.hipDeviceProp_t, ptr %8, i64 0, i32 12
  %46 = load i32, ptr %45, align 8, !tbaa !41
  %47 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %46)
  %48 = load ptr, ptr %47, align 8, !tbaa !9
  %49 = getelementptr i8, ptr %48, i64 -24
  %50 = load i64, ptr %49, align 8
  %51 = getelementptr inbounds i8, ptr %47, i64 %50
  %52 = getelementptr inbounds %"class.std::basic_ios", ptr %51, i64 0, i32 5
  %53 = load ptr, ptr %52, align 8, !tbaa !11
  %54 = icmp eq ptr %53, null
  br i1 %54, label %55, label %56

55:                                               ; preds = %40
  call void @_ZSt16__throw_bad_castv() #18
  unreachable

56:                                               ; preds = %40
  %57 = getelementptr inbounds %"class.std::ctype", ptr %53, i64 0, i32 8
  %58 = load i8, ptr %57, align 8, !tbaa !20
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %63, label %60

60:                                               ; preds = %56
  %61 = getelementptr inbounds %"class.std::ctype", ptr %53, i64 0, i32 9, i64 10
  %62 = load i8, ptr %61, align 1, !tbaa !23
  br label %68

63:                                               ; preds = %56
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %53)
  %64 = load ptr, ptr %53, align 8, !tbaa !9
  %65 = getelementptr inbounds ptr, ptr %64, i64 6
  %66 = load ptr, ptr %65, align 8
  %67 = call noundef signext i8 %66(ptr noundef nonnull align 8 dereferenceable(570) %53, i8 noundef signext 10)
  br label %68

68:                                               ; preds = %60, %63
  %69 = phi i8 [ %62, %60 ], [ %67, %63 ]
  %70 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %47, i8 noundef signext %69)
  %71 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %70)
  %72 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.13, i64 noundef 17)
  %73 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %8) #16
  %74 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull %8, i64 noundef %73)
  %75 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !9
  %76 = getelementptr i8, ptr %75, i64 -24
  %77 = load i64, ptr %76, align 8
  %78 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %77
  %79 = getelementptr inbounds %"class.std::basic_ios", ptr %78, i64 0, i32 5
  %80 = load ptr, ptr %79, align 8, !tbaa !11
  %81 = icmp eq ptr %80, null
  br i1 %81, label %82, label %83

82:                                               ; preds = %68
  call void @_ZSt16__throw_bad_castv() #18
  unreachable

83:                                               ; preds = %68
  %84 = getelementptr inbounds %"class.std::ctype", ptr %80, i64 0, i32 8
  %85 = load i8, ptr %84, align 8, !tbaa !20
  %86 = icmp eq i8 %85, 0
  br i1 %86, label %90, label %87

87:                                               ; preds = %83
  %88 = getelementptr inbounds %"class.std::ctype", ptr %80, i64 0, i32 9, i64 10
  %89 = load i8, ptr %88, align 1, !tbaa !23
  br label %95

90:                                               ; preds = %83
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %80)
  %91 = load ptr, ptr %80, align 8, !tbaa !9
  %92 = getelementptr inbounds ptr, ptr %91, i64 6
  %93 = load ptr, ptr %92, align 8
  %94 = call noundef signext i8 %93(ptr noundef nonnull align 8 dereferenceable(570) %80, i8 noundef signext 10)
  br label %95

95:                                               ; preds = %87, %90
  %96 = phi i8 [ %89, %87 ], [ %94, %90 ]
  %97 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %96)
  %98 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %97)
  call void @_Z13tick_all_testi(i32 noundef %0)
  %99 = call i32 @__hipPushCallConfiguration(i64 4294968320, i32 1, i64 4294968320, i32 1, i64 noundef 0, ptr noundef null)
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %112

101:                                              ; preds = %95
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %3)
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7)
  %102 = call i32 @__hipPopCallConfiguration(ptr nonnull %3, ptr nonnull %4, ptr nonnull %5, ptr nonnull %6)
  %103 = load i64, ptr %5, align 8
  %104 = load ptr, ptr %6, align 8
  %105 = load i64, ptr %3, align 8
  %106 = getelementptr inbounds i8, ptr %3, i64 8
  %107 = load i32, ptr %106, align 8
  %108 = load i64, ptr %4, align 8
  %109 = getelementptr inbounds i8, ptr %4, i64 8
  %110 = load i32, ptr %109, align 8
  %111 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z12dummy_kernelv, i64 %105, i32 %107, i64 %108, i32 %110, ptr noundef nonnull %7, i64 noundef %103, ptr noundef %104)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %3)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %4)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7)
  br label %112

112:                                              ; preds = %101, %95
  call void @llvm.lifetime.end.p0(i64 792, ptr nonnull %8) #16
  ret i32 0
}

declare dso_local i32 @hipGetDeviceProperties(ptr noundef, i32 noundef) local_unnamed_addr #0

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #11

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef, i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare dso_local i64 @strlen(ptr nocapture noundef) local_unnamed_addr #12

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #13

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

declare dso_local i32 @hipMallocManaged(ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare dso_local i32 @hipMalloc(ptr noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertIlEERSoT_(ptr noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

declare dso_local i32 @nanosleep(ptr noundef, ptr noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare dso_local ptr @__errno_location() local_unnamed_addr #14

declare dso_local i32 @__gxx_personality_v0(...)

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_managed_clock_test.cpp() #15 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(ptr nonnull @_ZNSt8ios_base4InitD1Ev, ptr nonnull @_ZStL8__ioinit, ptr nonnull @__dso_handle) #16
  ret void
}

declare dso_local i32 @__hipRegisterFunction(ptr, ptr, ptr, ptr, i32, ptr, ptr, ptr, ptr, ptr) local_unnamed_addr

declare dso_local ptr @__hipRegisterFatBinary(ptr) local_unnamed_addr

define internal void @__hip_module_ctor() {
  %1 = load ptr, ptr @__hip_gpubin_handle, align 8
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = tail call ptr @__hipRegisterFatBinary(ptr nonnull @__hip_fatbin_wrapper)
  store ptr %4, ptr @__hip_gpubin_handle, align 8
  br label %5

5:                                                ; preds = %3, %0
  %6 = phi ptr [ %4, %3 ], [ %1, %0 ]
  %7 = tail call i32 @__hipRegisterFunction(ptr %6, ptr nonnull @_Z15tick_all_kernelPU7_AtomicmPmPli, ptr nonnull @0, ptr nonnull @0, i32 -1, ptr null, ptr null, ptr null, ptr null, ptr null)
  %8 = tail call i32 @__hipRegisterFunction(ptr %6, ptr nonnull @_Z12dummy_kernelv, ptr nonnull @1, ptr nonnull @1, i32 -1, ptr null, ptr null, ptr null, ptr null, ptr null)
  %9 = tail call i32 @__hipRegisterFunction(ptr %6, ptr nonnull @_Z10dummy_initPl, ptr nonnull @2, ptr nonnull @2, i32 -1, ptr null, ptr null, ptr null, ptr null, ptr null)
  %10 = tail call i32 @atexit(ptr nonnull @__hip_module_dtor)
  ret void
}

declare dso_local void @__hipUnregisterFatBinary(ptr) local_unnamed_addr

define internal void @__hip_module_dtor() {
  %1 = load ptr, ptr @__hip_gpubin_handle, align 8
  %2 = icmp eq ptr %1, null
  br i1 %2, label %4, label %3

3:                                                ; preds = %0
  tail call void @__hipUnregisterFatBinary(ptr nonnull %1)
  store ptr null, ptr @__hip_gpubin_handle, align 8
  br label %4

4:                                                ; preds = %3, %0
  ret void
}

declare dso_local i32 @atexit(ptr) local_unnamed_addr

attributes #0 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { inlinehint mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nobuiltin allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #10 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { mustprogress nofree nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { nounwind }
attributes #17 = { noreturn nounwind }
attributes #18 = { noreturn }
attributes #19 = { builtin allocsize(0) }
attributes #20 = { nounwind willreturn memory(none) }
attributes #21 = { builtin nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"AMD clang version 16.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.6.0 23243 be997b2f3651a41597d7a41441fff8ade4ac59ac)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"vtable pointer", !6, i64 0}
!11 = !{!12, !4, i64 240}
!12 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !13, i64 0, !4, i64 216, !5, i64 224, !19, i64 225, !4, i64 232, !4, i64 240, !4, i64 248, !4, i64 256}
!13 = !{!"_ZTSSt8ios_base", !14, i64 8, !14, i64 16, !15, i64 24, !16, i64 28, !16, i64 32, !4, i64 40, !17, i64 48, !5, i64 64, !8, i64 192, !4, i64 200, !18, i64 208}
!14 = !{!"long", !5, i64 0}
!15 = !{!"_ZTSSt13_Ios_Fmtflags", !5, i64 0}
!16 = !{!"_ZTSSt12_Ios_Iostate", !5, i64 0}
!17 = !{!"_ZTSNSt8ios_base6_WordsE", !4, i64 0, !14, i64 8}
!18 = !{!"_ZTSSt6locale", !4, i64 0}
!19 = !{!"bool", !5, i64 0}
!20 = !{!21, !5, i64 56}
!21 = !{!"_ZTSSt5ctypeIcE", !22, i64 0, !4, i64 16, !19, i64 24, !4, i64 32, !4, i64 40, !4, i64 48, !5, i64 56, !5, i64 57, !5, i64 313, !5, i64 569}
!22 = !{!"_ZTSNSt6locale5facetE", !8, i64 8}
!23 = !{!5, !5, i64 0}
!24 = !{!12, !19, i64 225}
!25 = !{i8 0, i8 2}
!26 = !{}
!27 = !{!12, !5, i64 224}
!28 = !{!13, !14, i64 16}
!29 = !{!14, !14, i64 0}
!30 = distinct !{!30, !31}
!31 = !{!"llvm.loop.mustprogress"}
!32 = !{!33, !14, i64 0}
!33 = !{!"_ZTS8timespec", !14, i64 0, !14, i64 8}
!34 = !{!33, !14, i64 8}
!35 = distinct !{!35, !31}
!36 = distinct !{!36, !31}
!37 = distinct !{!37, !31}
!38 = !{!39, !8, i64 332}
!39 = !{!"_ZTS15hipDeviceProp_t", !5, i64 0, !14, i64 256, !14, i64 264, !8, i64 272, !8, i64 276, !8, i64 280, !5, i64 284, !5, i64 296, !8, i64 308, !8, i64 312, !8, i64 316, !14, i64 320, !8, i64 328, !8, i64 332, !8, i64 336, !8, i64 340, !8, i64 344, !8, i64 348, !8, i64 352, !40, i64 356, !8, i64 360, !8, i64 364, !8, i64 368, !8, i64 372, !14, i64 376, !8, i64 384, !8, i64 388, !8, i64 392, !5, i64 396, !8, i64 652, !8, i64 656, !8, i64 660, !8, i64 664, !8, i64 668, !5, i64 672, !5, i64 680, !4, i64 696, !4, i64 704, !14, i64 712, !14, i64 720, !14, i64 728, !8, i64 736, !8, i64 740, !8, i64 744, !8, i64 748, !8, i64 752, !8, i64 756, !8, i64 760, !8, i64 764, !8, i64 768, !8, i64 772, !8, i64 776, !8, i64 780, !8, i64 784, !8, i64 788}
!40 = !{!"_ZTS15hipDeviceArch_t", !8, i64 0, !8, i64 0, !8, i64 0, !8, i64 0, !8, i64 0, !8, i64 0, !8, i64 0, !8, i64 0, !8, i64 1, !8, i64 1, !8, i64 1, !8, i64 1, !8, i64 1, !8, i64 1, !8, i64 1, !8, i64 1, !8, i64 2}
!41 = !{!39, !8, i64 328}

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
