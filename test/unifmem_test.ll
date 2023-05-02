
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx1030
; ModuleID = 'test/unifmem_test.cpp'
source_filename = "test/unifmem_test.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__m_val__.managed = protected addrspace(1) externally_initialized global i64 64206, align 8
@__d_val__ = protected addrspace(1) externally_initialized global i64 47710, align 8
@__m_atomic__.managed = protected addrspace(1) externally_initialized global i64 3499, align 8
@__d_atomic__ = protected addrspace(1) externally_initialized global i64 1453, align 8
@__m_val__ = protected addrspace(1) externally_initialized global i64 addrspace(1)* null
@__m_atomic__ = protected addrspace(1) externally_initialized global i64 addrspace(1)* null
@llvm.compiler.used = appending addrspace(1) global [6 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (i64 addrspace(1)* @__d_atomic__ to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i64 addrspace(1)* @__d_val__ to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i64 addrspace(1)* addrspace(1)* @__m_atomic__ to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i64 addrspace(1)* @__m_atomic__.managed to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i64 addrspace(1)* addrspace(1)* @__m_val__ to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i64 addrspace(1)* @__m_val__.managed to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z23__unifmem_global_test__PmPU7_AtomicmS_S1_RmRS0_(i64 addrspace(1)* nocapture %0, i64 addrspace(1)* nocapture %1, i64 addrspace(1)* nocapture %2, i64 addrspace(1)* nocapture %3, i64 addrspace(1)* nocapture nonnull align 8 dereferenceable(8) %4, i64 addrspace(1)* nocapture nonnull align 8 dereferenceable(8) %5) local_unnamed_addr #0 {
  %7 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_val__, align 8
  %8 = load i64, i64 addrspace(1)* %7, align 8, !tbaa !4
  %9 = icmp eq i64 %8, 0
  %10 = zext i1 %9 to i64
  %11 = xor i64 %8, %10
  store i64 %11, i64 addrspace(1)* %7, align 8, !tbaa !4
  %12 = load i64, i64 addrspace(1)* @__d_val__, align 8, !tbaa !4
  %13 = icmp eq i64 %12, 0
  %14 = zext i1 %13 to i64
  %15 = xor i64 %12, %14
  store i64 %15, i64 addrspace(1)* @__d_val__, align 8, !tbaa !4
  %16 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_atomic__, align 8
  %17 = load atomic i64, i64 addrspace(1)* %16 seq_cst, align 8, !tbaa !8
  %18 = icmp eq i64 %17, 0
  %19 = zext i1 %18 to i64
  %20 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_atomic__, align 8
  %21 = atomicrmw xor i64 addrspace(1)* %20, i64 %19 seq_cst, align 8
  %22 = load atomic i64, i64 addrspace(1)* @__d_atomic__ seq_cst, align 8, !tbaa !8
  %23 = icmp eq i64 %22, 0
  %24 = zext i1 %23 to i64
  %25 = atomicrmw xor i64 addrspace(1)* @__d_atomic__, i64 %24 seq_cst, align 8
  %26 = load i64, i64 addrspace(1)* %0, align 8, !tbaa !4
  %27 = icmp eq i64 %26, 0
  %28 = zext i1 %27 to i64
  %29 = xor i64 %26, %28
  store i64 %29, i64 addrspace(1)* %0, align 8, !tbaa !4
  %30 = load atomic i64, i64 addrspace(1)* %1 seq_cst, align 8, !tbaa !8
  %31 = icmp eq i64 %30, 0
  %32 = zext i1 %31 to i64
  %33 = atomicrmw xor i64 addrspace(1)* %1, i64 %32 seq_cst, align 8
  %34 = load i64, i64 addrspace(1)* %2, align 8, !tbaa !4
  %35 = icmp eq i64 %34, 0
  %36 = zext i1 %35 to i64
  %37 = xor i64 %34, %36
  store i64 %37, i64 addrspace(1)* %2, align 8, !tbaa !4
  %38 = load atomic i64, i64 addrspace(1)* %3 seq_cst, align 8, !tbaa !8
  %39 = icmp eq i64 %38, 0
  %40 = zext i1 %39 to i64
  %41 = atomicrmw xor i64 addrspace(1)* %3, i64 %40 seq_cst, align 8
  %42 = load i64, i64 addrspace(1)* %4, align 8, !tbaa !4
  %43 = icmp eq i64 %42, 0
  %44 = zext i1 %43 to i64
  %45 = xor i64 %42, %44
  store i64 %45, i64 addrspace(1)* %4, align 8, !tbaa !4
  %46 = load atomic i64, i64 addrspace(1)* %5 seq_cst, align 8, !tbaa !8
  %47 = icmp eq i64 %46, 0
  %48 = zext i1 %47 to i64
  %49 = atomicrmw xor i64 addrspace(1)* %5, i64 %48 seq_cst, align 8
  ret void
}

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1030" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx10-3-insts,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!6, !6, i64 0}

; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa-gfx1030

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = 'test/unifmem_test.cpp'
source_filename = "test/unifmem_test.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct.dim3 = type { i32, i32, i32 }
%struct.ihipStream_t = type opaque

$__hip_gpubin_handle = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@__m_val__.managed = internal global i64 64206, align 8
@__h_val__ = dso_local local_unnamed_addr global i64 6862, align 8
@__d_val__ = internal global i64 undef, align 8
@__b_val__ = dso_local local_unnamed_addr global i64 64222, align 8
@__m_atomic__.managed = internal global i64 3499, align 8
@__h_atomic__ = dso_local global i64 2989, align 8
@__d_atomic__ = internal global i64 undef, align 8
@__b_atomic__ = dso_local global i64 429, align 8
@_Z23__unifmem_global_test__PmPU7_AtomicmS_S1_RmRS0_ = dso_local constant void (i64*, i64*, i64*, i64*, i64*, i64*)* @_Z38__device_stub____unifmem_global_test__PmPU7_AtomicmS_S1_RmRS0_, align 8
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [13 x i8] c"hello world \00", align 1
@0 = private unnamed_addr constant [52 x i8] c"_Z23__unifmem_global_test__PmPU7_AtomicmS_S1_RmRS0_\00", align 1
@1 = private unnamed_addr constant [10 x i8] c"__m_val__\00", align 1
@__m_val__ = internal externally_initialized global i64* null
@2 = private unnamed_addr constant [10 x i8] c"__d_val__\00", align 1
@3 = private unnamed_addr constant [13 x i8] c"__m_atomic__\00", align 1
@__m_atomic__ = internal externally_initialized global i64* null
@4 = private unnamed_addr constant [13 x i8] c"__d_atomic__\00", align 1
@__hip_fatbin = external constant i8, section ".hip_fatbin"
@__hip_fatbin_wrapper = internal constant { i32, i32, i8*, i8* } { i32 1212764230, i32 1, i8* @__hip_fatbin, i8* null }, section ".hipFatBinSegment", align 8
@__hip_gpubin_handle = linkonce hidden local_unnamed_addr global i8** null, comdat, align 8
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_unifmem_test.cpp, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @__hip_module_ctor, i8* null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: norecurse uwtable
define dso_local void @_Z38__device_stub____unifmem_global_test__PmPU7_AtomicmS_S1_RmRS0_(i64* noundef %0, i64* noundef %1, i64* noundef %2, i64* noundef %3, i64* noundef nonnull align 8 dereferenceable(8) %4, i64* noundef nonnull align 8 dereferenceable(8) %5) #3 {
  %7 = alloca i64*, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i64*, align 8
  %10 = alloca i64*, align 8
  %11 = alloca i64*, align 8
  %12 = alloca i64*, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca i8*, align 8
  store i64* %0, i64** %7, align 8, !tbaa !3
  store i64* %1, i64** %8, align 8, !tbaa !3
  store i64* %2, i64** %9, align 8, !tbaa !3
  store i64* %3, i64** %10, align 8, !tbaa !3
  store i64* %4, i64** %11, align 8, !tbaa !3
  store i64* %5, i64** %12, align 8, !tbaa !3
  %17 = alloca [6 x i8*], align 16
  %18 = getelementptr inbounds [6 x i8*], [6 x i8*]* %17, i64 0, i64 0
  %19 = bitcast [6 x i8*]* %17 to i64***
  store i64** %7, i64*** %19, align 16
  %20 = getelementptr inbounds [6 x i8*], [6 x i8*]* %17, i64 0, i64 1
  %21 = bitcast i8** %20 to i64***
  store i64** %8, i64*** %21, align 8
  %22 = getelementptr inbounds [6 x i8*], [6 x i8*]* %17, i64 0, i64 2
  %23 = bitcast i8** %22 to i64***
  store i64** %9, i64*** %23, align 16
  %24 = getelementptr inbounds [6 x i8*], [6 x i8*]* %17, i64 0, i64 3
  %25 = bitcast i8** %24 to i64***
  store i64** %10, i64*** %25, align 8
  %26 = getelementptr inbounds [6 x i8*], [6 x i8*]* %17, i64 0, i64 4
  %27 = bitcast i8** %26 to i64***
  store i64** %11, i64*** %27, align 16
  %28 = getelementptr inbounds [6 x i8*], [6 x i8*]* %17, i64 0, i64 5
  %29 = bitcast i8** %28 to i64***
  store i64** %12, i64*** %29, align 8
  %30 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %13, %struct.dim3* nonnull %14, i64* nonnull %15, i8** nonnull %16)
  %31 = load i64, i64* %15, align 8
  %32 = bitcast i8** %16 to %struct.ihipStream_t**
  %33 = load %struct.ihipStream_t*, %struct.ihipStream_t** %32, align 8
  %34 = bitcast %struct.dim3* %13 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds %struct.dim3, %struct.dim3* %13, i64 0, i32 2
  %37 = load i32, i32* %36, align 8
  %38 = bitcast %struct.dim3* %14 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds %struct.dim3, %struct.dim3* %14, i64 0, i32 2
  %41 = load i32, i32* %40, align 8
  %42 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void (i64*, i64*, i64*, i64*, i64*, i64*)** @_Z23__unifmem_global_test__PmPU7_AtomicmS_S1_RmRS0_ to i8*), i64 %35, i32 %37, i64 %39, i32 %41, i8** noundef nonnull %18, i64 noundef %31, %struct.ihipStream_t* noundef %33)
  ret void
}

declare dso_local i32 @__hipPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**) local_unnamed_addr

declare dso_local i32 @hipLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.ihipStream_t*) local_unnamed_addr

; Function Attrs: mustprogress nofree norecurse nounwind willreturn uwtable
define dso_local void @_Z21__unifmem_host_test__PmPU7_AtomicmS_S1_RmRS0_(i64* nocapture noundef %0, i64* nocapture noundef %1, i64* nocapture noundef %2, i64* nocapture noundef %3, i64* nocapture noundef nonnull align 8 dereferenceable(8) %4, i64* nocapture noundef nonnull align 8 dereferenceable(8) %5) local_unnamed_addr #4 {
  %7 = load i64*, i64** @__m_val__, align 8
  %8 = load i64, i64* %7, align 8, !tbaa !7
  %9 = icmp eq i64 %8, 0
  %10 = zext i1 %9 to i64
  %11 = xor i64 %8, %10
  store i64 %11, i64* %7, align 8, !tbaa !7
  %12 = load i64, i64* @__h_val__, align 8, !tbaa !7
  %13 = icmp eq i64 %12, 0
  %14 = zext i1 %13 to i64
  %15 = xor i64 %12, %14
  store i64 %15, i64* @__h_val__, align 8, !tbaa !7
  %16 = load i64, i64* @__d_val__, align 8, !tbaa !7
  %17 = icmp eq i64 %16, 0
  %18 = zext i1 %17 to i64
  %19 = xor i64 %16, %18
  store i64 %19, i64* @__d_val__, align 8, !tbaa !7
  %20 = load i64, i64* @__b_val__, align 8, !tbaa !7
  %21 = icmp eq i64 %20, 0
  %22 = zext i1 %21 to i64
  %23 = xor i64 %20, %22
  store i64 %23, i64* @__b_val__, align 8, !tbaa !7
  %24 = load i64*, i64** @__m_atomic__, align 8
  %25 = load atomic i64, i64* %24 seq_cst, align 8, !tbaa !9
  %26 = icmp eq i64 %25, 0
  %27 = zext i1 %26 to i64
  %28 = load i64*, i64** @__m_atomic__, align 8
  %29 = atomicrmw xor i64* %28, i64 %27 seq_cst, align 8
  %30 = load atomic i64, i64* @__h_atomic__ seq_cst, align 8, !tbaa !9
  %31 = icmp eq i64 %30, 0
  %32 = zext i1 %31 to i64
  %33 = atomicrmw xor i64* @__h_atomic__, i64 %32 seq_cst, align 8
  %34 = load atomic i64, i64* @__d_atomic__ seq_cst, align 8, !tbaa !9
  %35 = icmp eq i64 %34, 0
  %36 = zext i1 %35 to i64
  %37 = atomicrmw xor i64* @__d_atomic__, i64 %36 seq_cst, align 8
  %38 = load atomic i64, i64* @__b_atomic__ seq_cst, align 8, !tbaa !9
  %39 = icmp eq i64 %38, 0
  %40 = zext i1 %39 to i64
  %41 = atomicrmw xor i64* @__b_atomic__, i64 %40 seq_cst, align 8
  %42 = load i64, i64* %0, align 8, !tbaa !7
  %43 = icmp eq i64 %42, 0
  %44 = zext i1 %43 to i64
  %45 = xor i64 %42, %44
  store i64 %45, i64* %0, align 8, !tbaa !7
  %46 = load atomic i64, i64* %1 seq_cst, align 8, !tbaa !9
  %47 = icmp eq i64 %46, 0
  %48 = zext i1 %47 to i64
  %49 = atomicrmw xor i64* %1, i64 %48 seq_cst, align 8
  %50 = load i64, i64* %2, align 8, !tbaa !7
  %51 = icmp eq i64 %50, 0
  %52 = zext i1 %51 to i64
  %53 = xor i64 %50, %52
  store i64 %53, i64* %2, align 8, !tbaa !7
  %54 = load atomic i64, i64* %3 seq_cst, align 8, !tbaa !9
  %55 = icmp eq i64 %54, 0
  %56 = zext i1 %55 to i64
  %57 = atomicrmw xor i64* %3, i64 %56 seq_cst, align 8
  %58 = load i64, i64* %4, align 8, !tbaa !7
  %59 = icmp eq i64 %58, 0
  %60 = zext i1 %59 to i64
  %61 = xor i64 %58, %60
  store i64 %61, i64* %4, align 8, !tbaa !7
  %62 = load atomic i64, i64* %5 seq_cst, align 8, !tbaa !9
  %63 = icmp eq i64 %62, 0
  %64 = zext i1 %63 to i64
  %65 = atomicrmw xor i64* %5, i64 %64 seq_cst, align 8
  ret void
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #3 {
  %1 = alloca i64*, align 8
  %2 = alloca i64*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca i8*, align 8
  %11 = alloca [6 x i8*], align 16
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64*, align 8
  %15 = alloca i64*, align 8
  %16 = bitcast i64* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %16) #9
  store i64 1453, i64* %12, align 8, !tbaa !7
  %17 = bitcast i64* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %17) #9
  store i64 1453, i64* %13, align 8, !tbaa !9
  %18 = tail call noalias dereferenceable_or_null(8) i8* @malloc(i64 noundef 8) #10
  %19 = bitcast i8* %18 to i64*
  store i64 1453, i64* %19, align 8, !tbaa !7
  %20 = tail call noalias dereferenceable_or_null(8) i8* @malloc(i64 noundef 8) #10
  %21 = bitcast i8* %20 to i64*
  store atomic i64 1453, i64* %21 seq_cst, align 8, !tbaa !9
  %22 = bitcast i64** %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %22) #9
  store i64* null, i64** %14, align 8, !tbaa !3
  %23 = bitcast i64** %14 to i8**
  %24 = call i32 @hipMalloc(i8** noundef nonnull %23, i64 noundef 8)
  %25 = load i64*, i64** %14, align 8, !tbaa !3
  store i64 1453, i64* %25, align 8, !tbaa !7
  %26 = bitcast i64** %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %26) #9
  store i64* null, i64** %15, align 8, !tbaa !3
  %27 = bitcast i64** %15 to i8**
  %28 = call i32 @hipMalloc(i8** noundef nonnull %27, i64 noundef 8)
  %29 = load i64*, i64** %15, align 8, !tbaa !3
  store atomic i64 1453, i64* %29 seq_cst, align 8, !tbaa !9
  %30 = load i64*, i64** %14, align 8, !tbaa !3
  %31 = load i64*, i64** %15, align 8, !tbaa !3
  %32 = load i64*, i64** @__m_val__, align 8
  %33 = load i64, i64* %32, align 8, !tbaa !7
  %34 = icmp eq i64 %33, 0
  %35 = zext i1 %34 to i64
  %36 = xor i64 %33, %35
  store i64 %36, i64* %32, align 8, !tbaa !7
  %37 = load i64, i64* @__h_val__, align 8, !tbaa !7
  %38 = icmp eq i64 %37, 0
  %39 = zext i1 %38 to i64
  %40 = xor i64 %37, %39
  store i64 %40, i64* @__h_val__, align 8, !tbaa !7
  %41 = load i64, i64* @__d_val__, align 8, !tbaa !7
  %42 = icmp eq i64 %41, 0
  %43 = zext i1 %42 to i64
  %44 = xor i64 %41, %43
  store i64 %44, i64* @__d_val__, align 8, !tbaa !7
  %45 = load i64, i64* @__b_val__, align 8, !tbaa !7
  %46 = icmp eq i64 %45, 0
  %47 = zext i1 %46 to i64
  %48 = xor i64 %45, %47
  store i64 %48, i64* @__b_val__, align 8, !tbaa !7
  %49 = load i64*, i64** @__m_atomic__, align 8
  %50 = load atomic i64, i64* %49 seq_cst, align 8, !tbaa !9
  %51 = icmp eq i64 %50, 0
  %52 = zext i1 %51 to i64
  %53 = load i64*, i64** @__m_atomic__, align 8
  %54 = atomicrmw xor i64* %53, i64 %52 seq_cst, align 8
  %55 = load atomic i64, i64* @__h_atomic__ seq_cst, align 8, !tbaa !9
  %56 = icmp eq i64 %55, 0
  %57 = zext i1 %56 to i64
  %58 = atomicrmw xor i64* @__h_atomic__, i64 %57 seq_cst, align 8
  %59 = load atomic i64, i64* @__d_atomic__ seq_cst, align 8, !tbaa !9
  %60 = icmp eq i64 %59, 0
  %61 = zext i1 %60 to i64
  %62 = atomicrmw xor i64* @__d_atomic__, i64 %61 seq_cst, align 8
  %63 = load atomic i64, i64* @__b_atomic__ seq_cst, align 8, !tbaa !9
  %64 = icmp eq i64 %63, 0
  %65 = zext i1 %64 to i64
  %66 = atomicrmw xor i64* @__b_atomic__, i64 %65 seq_cst, align 8
  %67 = load i64, i64* %30, align 8, !tbaa !7
  %68 = icmp eq i64 %67, 0
  %69 = zext i1 %68 to i64
  %70 = xor i64 %67, %69
  store i64 %70, i64* %30, align 8, !tbaa !7
  %71 = load atomic i64, i64* %31 seq_cst, align 8, !tbaa !9
  %72 = icmp eq i64 %71, 0
  %73 = zext i1 %72 to i64
  %74 = atomicrmw xor i64* %31, i64 %73 seq_cst, align 8
  %75 = load i64, i64* %19, align 8, !tbaa !7
  %76 = icmp eq i64 %75, 0
  %77 = zext i1 %76 to i64
  %78 = xor i64 %75, %77
  store i64 %78, i64* %19, align 8, !tbaa !7
  %79 = load atomic i64, i64* %21 seq_cst, align 8, !tbaa !9
  %80 = icmp eq i64 %79, 0
  %81 = zext i1 %80 to i64
  %82 = atomicrmw xor i64* %21, i64 %81 seq_cst, align 8
  %83 = load i64, i64* %12, align 8, !tbaa !7
  %84 = icmp eq i64 %83, 0
  %85 = zext i1 %84 to i64
  %86 = xor i64 %83, %85
  store i64 %86, i64* %12, align 8, !tbaa !7
  %87 = load atomic i64, i64* %13 seq_cst, align 8, !tbaa !9
  %88 = icmp eq i64 %87, 0
  %89 = zext i1 %88 to i64
  %90 = atomicrmw xor i64* %13, i64 %89 seq_cst, align 8
  %91 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294967312, i32 1, i64 noundef 0, %struct.ihipStream_t* noundef null)
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %93, label %134

93:                                               ; preds = %0
  %94 = load i64*, i64** %14, align 8, !tbaa !3
  %95 = load i64*, i64** %15, align 8, !tbaa !3
  %96 = bitcast i64** %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %96)
  %97 = bitcast i64** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %97)
  %98 = bitcast i64** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %98)
  %99 = bitcast i64** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %99)
  %100 = bitcast i64** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %100)
  %101 = bitcast i64** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %101)
  %102 = bitcast %struct.dim3* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %102)
  %103 = bitcast %struct.dim3* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %103)
  %104 = bitcast i64* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %104)
  %105 = bitcast i8** %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %105)
  %106 = bitcast [6 x i8*]* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %106)
  store i64* %94, i64** %1, align 8, !tbaa !3
  store i64* %95, i64** %2, align 8, !tbaa !3
  %107 = bitcast i64** %3 to i8**
  store i8* %18, i8** %107, align 8, !tbaa !3
  %108 = bitcast i64** %4 to i8**
  store i8* %20, i8** %108, align 8, !tbaa !3
  store i64* %12, i64** %5, align 8, !tbaa !3
  store i64* %13, i64** %6, align 8, !tbaa !3
  %109 = getelementptr inbounds [6 x i8*], [6 x i8*]* %11, i64 0, i64 0
  %110 = bitcast [6 x i8*]* %11 to i64***
  store i64** %1, i64*** %110, align 16
  %111 = getelementptr inbounds [6 x i8*], [6 x i8*]* %11, i64 0, i64 1
  %112 = bitcast i8** %111 to i64***
  store i64** %2, i64*** %112, align 8
  %113 = getelementptr inbounds [6 x i8*], [6 x i8*]* %11, i64 0, i64 2
  %114 = bitcast i8** %113 to i64***
  store i64** %3, i64*** %114, align 16
  %115 = getelementptr inbounds [6 x i8*], [6 x i8*]* %11, i64 0, i64 3
  %116 = bitcast i8** %115 to i64***
  store i64** %4, i64*** %116, align 8
  %117 = getelementptr inbounds [6 x i8*], [6 x i8*]* %11, i64 0, i64 4
  %118 = bitcast i8** %117 to i64***
  store i64** %5, i64*** %118, align 16
  %119 = getelementptr inbounds [6 x i8*], [6 x i8*]* %11, i64 0, i64 5
  %120 = bitcast i8** %119 to i64***
  store i64** %6, i64*** %120, align 8
  %121 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %7, %struct.dim3* nonnull %8, i64* nonnull %9, i8** nonnull %10)
  %122 = load i64, i64* %9, align 8
  %123 = bitcast i8** %10 to %struct.ihipStream_t**
  %124 = load %struct.ihipStream_t*, %struct.ihipStream_t** %123, align 8
  %125 = bitcast %struct.dim3* %7 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds %struct.dim3, %struct.dim3* %7, i64 0, i32 2
  %128 = load i32, i32* %127, align 8
  %129 = bitcast %struct.dim3* %8 to i64*
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds %struct.dim3, %struct.dim3* %8, i64 0, i32 2
  %132 = load i32, i32* %131, align 8
  %133 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void (i64*, i64*, i64*, i64*, i64*, i64*)** @_Z23__unifmem_global_test__PmPU7_AtomicmS_S1_RmRS0_ to i8*), i64 %126, i32 %128, i64 %130, i32 %132, i8** noundef nonnull %109, i64 noundef %122, %struct.ihipStream_t* noundef %124)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %96)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %97)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %98)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %99)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %100)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %101)
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %102)
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %103)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %104)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %105)
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %106)
  br label %134

134:                                              ; preds = %93, %0
  %135 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef 12)
  %136 = load i64*, i64** @__m_val__, align 8
  %137 = load i64, i64* %136, align 8, !tbaa !7
  %138 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %137)
  %139 = bitcast %"class.std::basic_ostream"* %138 to i8**
  %140 = load i8*, i8** %139, align 8, !tbaa !10
  %141 = getelementptr i8, i8* %140, i64 -24
  %142 = bitcast i8* %141 to i64*
  %143 = load i64, i64* %142, align 8
  %144 = bitcast %"class.std::basic_ostream"* %138 to i8*
  %145 = getelementptr inbounds i8, i8* %144, i64 %143
  %146 = getelementptr inbounds i8, i8* %145, i64 240
  %147 = bitcast i8* %146 to %"class.std::ctype"**
  %148 = load %"class.std::ctype"*, %"class.std::ctype"** %147, align 8, !tbaa !12
  %149 = icmp eq %"class.std::ctype"* %148, null
  br i1 %149, label %150, label %151

150:                                              ; preds = %134
  call void @_ZSt16__throw_bad_castv() #11
  unreachable

151:                                              ; preds = %134
  %152 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %148, i64 0, i32 8
  %153 = load i8, i8* %152, align 8, !tbaa !21
  %154 = icmp eq i8 %153, 0
  br i1 %154, label %158, label %155

155:                                              ; preds = %151
  %156 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %148, i64 0, i32 9, i64 10
  %157 = load i8, i8* %156, align 1, !tbaa !9
  br label %164

158:                                              ; preds = %151
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %148)
  %159 = bitcast %"class.std::ctype"* %148 to i8 (%"class.std::ctype"*, i8)***
  %160 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %159, align 8, !tbaa !10
  %161 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %160, i64 6
  %162 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %161, align 8
  %163 = call noundef signext i8 %162(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %148, i8 noundef signext 10)
  br label %164

164:                                              ; preds = %155, %158
  %165 = phi i8 [ %157, %155 ], [ %163, %158 ]
  %166 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %138, i8 noundef signext %165)
  %167 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %166)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %26) #9
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #9
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %17) #9
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %16) #9
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0)
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #6

declare dso_local i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, %struct.ihipStream_t* noundef) local_unnamed_addr #0

declare dso_local i32 @hipMalloc(i8** noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #7

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_unifmem_test.cpp() #8 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #9
  ret void
}

declare dso_local i32 @__hipRegisterFunction(i8**, i8*, i8*, i8*, i32, i8*, i8*, i8*, i8*, i32*) local_unnamed_addr

declare dso_local void @__hipRegisterVar(i8**, i8*, i8*, i8*, i32, i64, i32, i32) local_unnamed_addr

declare dso_local void @__hipRegisterManagedVar(i8**, i8*, i8*, i8*, i64, i32) local_unnamed_addr

declare dso_local i8** @__hipRegisterFatBinary(i8*) local_unnamed_addr

define internal void @__hip_module_ctor() {
  %1 = load i8**, i8*** @__hip_gpubin_handle, align 8
  %2 = icmp eq i8** %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = tail call i8** @__hipRegisterFatBinary(i8* bitcast ({ i32, i32, i8*, i8* }* @__hip_fatbin_wrapper to i8*))
  store i8** %4, i8*** @__hip_gpubin_handle, align 8
  br label %5

5:                                                ; preds = %3, %0
  %6 = phi i8** [ %4, %3 ], [ %1, %0 ]
  %7 = tail call i32 @__hipRegisterFunction(i8** %6, i8* bitcast (void (i64*, i64*, i64*, i64*, i64*, i64*)** @_Z23__unifmem_global_test__PmPU7_AtomicmS_S1_RmRS0_ to i8*), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @0, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @0, i64 0, i64 0), i32 -1, i8* null, i8* null, i8* null, i8* null, i32* null)
  tail call void @__hipRegisterManagedVar(i8** %6, i8* bitcast (i64** @__m_val__ to i8*), i8* bitcast (i64* @__m_val__.managed to i8*), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @1, i64 0, i64 0), i64 8, i32 8)
  tail call void @__hipRegisterVar(i8** %6, i8* bitcast (i64* @__d_val__ to i8*), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @2, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @2, i64 0, i64 0), i32 0, i64 8, i32 0, i32 0)
  tail call void @__hipRegisterManagedVar(i8** %6, i8* bitcast (i64** @__m_atomic__ to i8*), i8* bitcast (i64* @__m_atomic__.managed to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @3, i64 0, i64 0), i64 8, i32 8)
  tail call void @__hipRegisterVar(i8** %6, i8* bitcast (i64* @__d_atomic__ to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @4, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @4, i64 0, i64 0), i32 0, i64 8, i32 0, i32 0)
  %8 = tail call i32 @atexit(void ()* nonnull @__hip_module_dtor)
  ret void
}

declare dso_local void @__hipUnregisterFatBinary(i8**) local_unnamed_addr

define internal void @__hip_module_dtor() {
  %1 = load i8**, i8*** @__hip_gpubin_handle, align 8
  %2 = icmp eq i8** %1, null
  br i1 %2, label %4, label %3

3:                                                ; preds = %0
  tail call void @__hipUnregisterFatBinary(i8** nonnull %1)
  store i8** null, i8*** @__hip_gpubin_handle, align 8
  br label %4

4:                                                ; preds = %3, %0
  ret void
}

declare dso_local i32 @atexit(void ()*) local_unnamed_addr

attributes #0 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nounwind willreturn uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #6 = { inaccessiblememonly mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) "alloc-family"="malloc" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }
attributes #10 = { nounwind allocsize(0) }
attributes #11 = { noreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !5, i64 0}
!9 = !{!5, !5, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"vtable pointer", !6, i64 0}
!12 = !{!13, !4, i64 240}
!13 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !14, i64 0, !4, i64 216, !5, i64 224, !20, i64 225, !4, i64 232, !4, i64 240, !4, i64 248, !4, i64 256}
!14 = !{!"_ZTSSt8ios_base", !8, i64 8, !8, i64 16, !15, i64 24, !16, i64 28, !16, i64 32, !4, i64 40, !17, i64 48, !5, i64 64, !18, i64 192, !4, i64 200, !19, i64 208}
!15 = !{!"_ZTSSt13_Ios_Fmtflags", !5, i64 0}
!16 = !{!"_ZTSSt12_Ios_Iostate", !5, i64 0}
!17 = !{!"_ZTSNSt8ios_base6_WordsE", !4, i64 0, !8, i64 8}
!18 = !{!"int", !5, i64 0}
!19 = !{!"_ZTSSt6locale", !4, i64 0}
!20 = !{!"bool", !5, i64 0}
!21 = !{!22, !5, i64 56}
!22 = !{!"_ZTSSt5ctypeIcE", !23, i64 0, !4, i64 16, !20, i64 24, !4, i64 32, !4, i64 40, !4, i64 48, !5, i64 56, !5, i64 57, !5, i64 313, !5, i64 569}
!23 = !{!"_ZTSNSt6locale5facetE", !18, i64 8}

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
