
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
define protected amdgpu_kernel void @_Z29__unifmem_device_test__call__v() local_unnamed_addr #0 {
  %1 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_val__, align 8
  store i64 0, i64 addrspace(1)* %1, align 8, !tbaa !4
  store i64 0, i64 addrspace(1)* @__d_val__, align 8, !tbaa !4
  %2 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_atomic__, align 8
  %3 = load atomic i64, i64 addrspace(1)* %2 seq_cst, align 8, !tbaa !8
  %4 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_atomic__, align 8
  %5 = atomicrmw xor i64 addrspace(1)* %4, i64 %3 seq_cst, align 8
  %6 = load atomic i64, i64 addrspace(1)* @__d_atomic__ seq_cst, align 8, !tbaa !8
  %7 = atomicrmw xor i64 addrspace(1)* @__d_atomic__, i64 %6 seq_cst, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z23__unifmem_global_test__v() local_unnamed_addr #0 {
  %1 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_val__, align 8
  store i64 0, i64 addrspace(1)* %1, align 8, !tbaa !4
  store i64 0, i64 addrspace(1)* @__d_val__, align 8, !tbaa !4
  %2 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_atomic__, align 8
  %3 = load atomic i64, i64 addrspace(1)* %2 seq_cst, align 8, !tbaa !8
  %4 = load i64 addrspace(1)*, i64 addrspace(1)* addrspace(1)* @__m_atomic__, align 8
  %5 = atomicrmw xor i64 addrspace(1)* %4, i64 %3 seq_cst, align 8
  %6 = load atomic i64, i64 addrspace(1)* @__d_atomic__ seq_cst, align 8, !tbaa !8
  %7 = atomicrmw xor i64 addrspace(1)* @__d_atomic__, i64 %6 seq_cst, align 8
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
@_Z29__unifmem_device_test__call__v = dso_local constant void ()* @_Z44__device_stub____unifmem_device_test__call__v, align 8
@_Z23__unifmem_global_test__v = dso_local constant void ()* @_Z38__device_stub____unifmem_global_test__v, align 8
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [13 x i8] c"hello world \00", align 1
@0 = private unnamed_addr constant [35 x i8] c"_Z29__unifmem_device_test__call__v\00", align 1
@1 = private unnamed_addr constant [29 x i8] c"_Z23__unifmem_global_test__v\00", align 1
@2 = private unnamed_addr constant [10 x i8] c"__m_val__\00", align 1
@__m_val__ = internal externally_initialized global i64* null
@3 = private unnamed_addr constant [10 x i8] c"__d_val__\00", align 1
@4 = private unnamed_addr constant [13 x i8] c"__m_atomic__\00", align 1
@__m_atomic__ = internal externally_initialized global i64* null
@5 = private unnamed_addr constant [13 x i8] c"__d_atomic__\00", align 1
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
define dso_local void @_Z44__device_stub____unifmem_device_test__call__v() #3 {
  %1 = alloca %struct.dim3, align 8
  %2 = alloca %struct.dim3, align 8
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 16
  %6 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %1, %struct.dim3* nonnull %2, i64* nonnull %3, i8** nonnull %4)
  %7 = load i64, i64* %3, align 8
  %8 = bitcast i8** %4 to %struct.ihipStream_t**
  %9 = load %struct.ihipStream_t*, %struct.ihipStream_t** %8, align 8
  %10 = bitcast %struct.dim3* %1 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.dim3, %struct.dim3* %1, i64 0, i32 2
  %13 = load i32, i32* %12, align 8
  %14 = bitcast %struct.dim3* %2 to i64*
  %15 = load i64, i64* %14, align 8
  %16 = getelementptr inbounds %struct.dim3, %struct.dim3* %2, i64 0, i32 2
  %17 = load i32, i32* %16, align 8
  %18 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void ()** @_Z29__unifmem_device_test__call__v to i8*), i64 %11, i32 %13, i64 %15, i32 %17, i8** noundef nonnull %5, i64 noundef %7, %struct.ihipStream_t* noundef %9)
  ret void
}

declare dso_local i32 @__hipPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**) local_unnamed_addr

declare dso_local i32 @hipLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.ihipStream_t*) local_unnamed_addr

; Function Attrs: norecurse uwtable
define dso_local void @_Z38__device_stub____unifmem_global_test__v() #3 {
  %1 = alloca %struct.dim3, align 8
  %2 = alloca %struct.dim3, align 8
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 16
  %6 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %1, %struct.dim3* nonnull %2, i64* nonnull %3, i8** nonnull %4)
  %7 = load i64, i64* %3, align 8
  %8 = bitcast i8** %4 to %struct.ihipStream_t**
  %9 = load %struct.ihipStream_t*, %struct.ihipStream_t** %8, align 8
  %10 = bitcast %struct.dim3* %1 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.dim3, %struct.dim3* %1, i64 0, i32 2
  %13 = load i32, i32* %12, align 8
  %14 = bitcast %struct.dim3* %2 to i64*
  %15 = load i64, i64* %14, align 8
  %16 = getelementptr inbounds %struct.dim3, %struct.dim3* %2, i64 0, i32 2
  %17 = load i32, i32* %16, align 8
  %18 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void ()** @_Z23__unifmem_global_test__v to i8*), i64 %11, i32 %13, i64 %15, i32 %17, i8** noundef nonnull %5, i64 noundef %7, %struct.ihipStream_t* noundef %9)
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn uwtable
define dso_local void @_Z21__unifmem_host_test__v() local_unnamed_addr #4 {
  %1 = load i64*, i64** @__m_val__, align 8
  store i64 0, i64* %1, align 8, !tbaa !3
  store i64 0, i64* @__h_val__, align 8, !tbaa !3
  store i64 0, i64* @__d_val__, align 8, !tbaa !3
  store i64 0, i64* @__b_val__, align 8, !tbaa !3
  %2 = load i64*, i64** @__m_atomic__, align 8
  %3 = load atomic i64, i64* %2 seq_cst, align 8, !tbaa !7
  %4 = load i64*, i64** @__m_atomic__, align 8
  %5 = atomicrmw xor i64* %4, i64 %3 seq_cst, align 8
  %6 = load atomic i64, i64* @__h_atomic__ seq_cst, align 8, !tbaa !7
  %7 = atomicrmw xor i64* @__h_atomic__, i64 %6 seq_cst, align 8
  %8 = load atomic i64, i64* @__d_atomic__ seq_cst, align 8, !tbaa !7
  %9 = atomicrmw xor i64* @__d_atomic__, i64 %8 seq_cst, align 8
  %10 = load atomic i64, i64* @__b_atomic__ seq_cst, align 8, !tbaa !7
  %11 = atomicrmw xor i64* @__b_atomic__, i64 %10 seq_cst, align 8
  ret void
}

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #3 {
  %1 = alloca %struct.dim3, align 8
  %2 = alloca %struct.dim3, align 8
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 16
  %6 = alloca %struct.dim3, align 8
  %7 = alloca %struct.dim3, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 16
  %11 = load i64*, i64** @__m_val__, align 8
  store i64 0, i64* %11, align 8, !tbaa !3
  store i64 0, i64* @__h_val__, align 8, !tbaa !3
  store i64 0, i64* @__d_val__, align 8, !tbaa !3
  store i64 0, i64* @__b_val__, align 8, !tbaa !3
  %12 = load i64*, i64** @__m_atomic__, align 8
  %13 = load atomic i64, i64* %12 seq_cst, align 8, !tbaa !7
  %14 = load i64*, i64** @__m_atomic__, align 8
  %15 = atomicrmw xor i64* %14, i64 %13 seq_cst, align 8
  %16 = load atomic i64, i64* @__h_atomic__ seq_cst, align 8, !tbaa !7
  %17 = atomicrmw xor i64* @__h_atomic__, i64 %16 seq_cst, align 8
  %18 = load atomic i64, i64* @__d_atomic__ seq_cst, align 8, !tbaa !7
  %19 = atomicrmw xor i64* @__d_atomic__, i64 %18 seq_cst, align 8
  %20 = load atomic i64, i64* @__b_atomic__ seq_cst, align 8, !tbaa !7
  %21 = atomicrmw xor i64* @__b_atomic__, i64 %20 seq_cst, align 8
  %22 = tail call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294967312, i32 1, i64 noundef 0, %struct.ihipStream_t* noundef null)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %43

24:                                               ; preds = %0
  %25 = bitcast %struct.dim3* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %25)
  %26 = bitcast %struct.dim3* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %26)
  %27 = bitcast i64* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %27)
  %28 = bitcast i8** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %28)
  %29 = bitcast i8** %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %29)
  %30 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %6, %struct.dim3* nonnull %7, i64* nonnull %8, i8** nonnull %9)
  %31 = load i64, i64* %8, align 8
  %32 = bitcast i8** %9 to %struct.ihipStream_t**
  %33 = load %struct.ihipStream_t*, %struct.ihipStream_t** %32, align 8
  %34 = bitcast %struct.dim3* %6 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds %struct.dim3, %struct.dim3* %6, i64 0, i32 2
  %37 = load i32, i32* %36, align 8
  %38 = bitcast %struct.dim3* %7 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds %struct.dim3, %struct.dim3* %7, i64 0, i32 2
  %41 = load i32, i32* %40, align 8
  %42 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void ()** @_Z23__unifmem_global_test__v to i8*), i64 %35, i32 %37, i64 %39, i32 %41, i8** noundef nonnull %10, i64 noundef %31, %struct.ihipStream_t* noundef %33)
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %25)
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %26)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %27)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %28)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %29)
  br label %43

43:                                               ; preds = %24, %0
  %44 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294967312, i32 1, i64 noundef 0, %struct.ihipStream_t* noundef null)
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %65

46:                                               ; preds = %43
  %47 = bitcast %struct.dim3* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %47)
  %48 = bitcast %struct.dim3* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %48)
  %49 = bitcast i64* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %49)
  %50 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %50)
  %51 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %51)
  %52 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %1, %struct.dim3* nonnull %2, i64* nonnull %3, i8** nonnull %4)
  %53 = load i64, i64* %3, align 8
  %54 = bitcast i8** %4 to %struct.ihipStream_t**
  %55 = load %struct.ihipStream_t*, %struct.ihipStream_t** %54, align 8
  %56 = bitcast %struct.dim3* %1 to i64*
  %57 = load i64, i64* %56, align 8
  %58 = getelementptr inbounds %struct.dim3, %struct.dim3* %1, i64 0, i32 2
  %59 = load i32, i32* %58, align 8
  %60 = bitcast %struct.dim3* %2 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds %struct.dim3, %struct.dim3* %2, i64 0, i32 2
  %63 = load i32, i32* %62, align 8
  %64 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void ()** @_Z29__unifmem_device_test__call__v to i8*), i64 %57, i32 %59, i64 %61, i32 %63, i8** noundef nonnull %5, i64 noundef %53, %struct.ihipStream_t* noundef %55)
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %47)
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %48)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %49)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %50)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %51)
  br label %65

65:                                               ; preds = %43, %46
  %66 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef 12)
  %67 = load i64*, i64** @__m_val__, align 8
  %68 = load i64, i64* %67, align 8, !tbaa !3
  %69 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %68)
  %70 = bitcast %"class.std::basic_ostream"* %69 to i8**
  %71 = load i8*, i8** %70, align 8, !tbaa !8
  %72 = getelementptr i8, i8* %71, i64 -24
  %73 = bitcast i8* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = bitcast %"class.std::basic_ostream"* %69 to i8*
  %76 = getelementptr inbounds i8, i8* %75, i64 %74
  %77 = getelementptr inbounds i8, i8* %76, i64 240
  %78 = bitcast i8* %77 to %"class.std::ctype"**
  %79 = load %"class.std::ctype"*, %"class.std::ctype"** %78, align 8, !tbaa !10
  %80 = icmp eq %"class.std::ctype"* %79, null
  br i1 %80, label %81, label %82

81:                                               ; preds = %65
  call void @_ZSt16__throw_bad_castv() #8
  unreachable

82:                                               ; preds = %65
  %83 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %79, i64 0, i32 8
  %84 = load i8, i8* %83, align 8, !tbaa !20
  %85 = icmp eq i8 %84, 0
  br i1 %85, label %89, label %86

86:                                               ; preds = %82
  %87 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %79, i64 0, i32 9, i64 10
  %88 = load i8, i8* %87, align 1, !tbaa !7
  br label %95

89:                                               ; preds = %82
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %79)
  %90 = bitcast %"class.std::ctype"* %79 to i8 (%"class.std::ctype"*, i8)***
  %91 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %90, align 8, !tbaa !8
  %92 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %91, i64 6
  %93 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %92, align 8
  %94 = call noundef signext i8 %93(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %79, i8 noundef signext 10)
  br label %95

95:                                               ; preds = %86, %89
  %96 = phi i8 [ %88, %86 ], [ %94, %89 ]
  %97 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %69, i8 noundef signext %96)
  %98 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %97)
  ret i32 0
}

declare dso_local i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, %struct.ihipStream_t* noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #5

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_unifmem_test.cpp() #6 section ".text.startup" {
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
  %7 = tail call i32 @__hipRegisterFunction(i8** %6, i8* bitcast (void ()** @_Z29__unifmem_device_test__call__v to i8*), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @0, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @0, i64 0, i64 0), i32 -1, i8* null, i8* null, i8* null, i8* null, i32* null)
  %8 = tail call i32 @__hipRegisterFunction(i8** %6, i8* bitcast (void ()** @_Z23__unifmem_global_test__v to i8*), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @1, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @1, i64 0, i64 0), i32 -1, i8* null, i8* null, i8* null, i8* null, i32* null)
  tail call void @__hipRegisterManagedVar(i8** %6, i8* bitcast (i64** @__m_val__ to i8*), i8* bitcast (i64* @__m_val__.managed to i8*), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @2, i64 0, i64 0), i64 8, i32 8)
  tail call void @__hipRegisterVar(i8** %6, i8* bitcast (i64* @__d_val__ to i8*), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @3, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @3, i64 0, i64 0), i32 0, i64 8, i32 0, i32 0)
  tail call void @__hipRegisterManagedVar(i8** %6, i8* bitcast (i64** @__m_atomic__ to i8*), i8* bitcast (i64* @__m_atomic__.managed to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @4, i64 0, i64 0), i64 8, i32 8)
  tail call void @__hipRegisterVar(i8** %6, i8* bitcast (i64* @__d_atomic__ to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @5, i64 0, i64 0), i32 0, i64 8, i32 0, i32 0)
  %9 = tail call i32 @atexit(void ()* nonnull @__hip_module_dtor)
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

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #7

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #7

attributes #0 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nounwind willreturn uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"vtable pointer", !6, i64 0}
!10 = !{!11, !15, i64 240}
!11 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !12, i64 0, !15, i64 216, !5, i64 224, !19, i64 225, !15, i64 232, !15, i64 240, !15, i64 248, !15, i64 256}
!12 = !{!"_ZTSSt8ios_base", !4, i64 8, !4, i64 16, !13, i64 24, !14, i64 28, !14, i64 32, !15, i64 40, !16, i64 48, !5, i64 64, !17, i64 192, !15, i64 200, !18, i64 208}
!13 = !{!"_ZTSSt13_Ios_Fmtflags", !5, i64 0}
!14 = !{!"_ZTSSt12_Ios_Iostate", !5, i64 0}
!15 = !{!"any pointer", !5, i64 0}
!16 = !{!"_ZTSNSt8ios_base6_WordsE", !15, i64 0, !4, i64 8}
!17 = !{!"int", !5, i64 0}
!18 = !{!"_ZTSSt6locale", !15, i64 0}
!19 = !{!"bool", !5, i64 0}
!20 = !{!21, !5, i64 56}
!21 = !{!"_ZTSSt5ctypeIcE", !22, i64 0, !15, i64 16, !19, i64 24, !15, i64 32, !15, i64 40, !15, i64 48, !5, i64 56, !5, i64 57, !5, i64 313, !5, i64 569}
!22 = !{!"_ZTSNSt6locale5facetE", !17, i64 8}

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
