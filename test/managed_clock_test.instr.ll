
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx90a
; ModuleID = 'test/managed_clock_test.cpp'
source_filename = "test/managed_clock_test.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%"struct.scabbard::trace::DeviceAsyncQueue" = type { [64 x %"struct.scabbard::trace::DeviceAsyncQueue::Lane"] }
%"struct.scabbard::trace::DeviceAsyncQueue::Lane" = type { i64, [64 x %"struct.scabbard::TraceData"] }
%"struct.scabbard::TraceData" = type { i64, i16, %"union.scabbard::ThreadId", i8*, %"struct.scabbard::LocationMetadata", i64 }
%"union.scabbard::ThreadId" = type { %"class.std::thread::id", [8 x i8] }
%"class.std::thread::id" = type { i64 }
%"struct.scabbard::LocationMetadata" = type { i64, i32, i32 }

$scabbard.trace.device.dummyFunc = comdat any

@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%"struct.scabbard::trace::DeviceAsyncQueue"* addrspace(1)* @_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE to i8 addrspace(1)*) to i8*)], section "llvm.metadata"
@_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE = protected addrspace(1) externally_initialized global %"struct.scabbard::trace::DeviceAsyncQueue"* null, align 8
@_ZN8scabbard5trace12_GLOBAL__N_114src_id_reg_tmpE = internal addrspace(1) global i64 84, align 8
@_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp2E = internal addrspace(1) global i64 84, align 8
@_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp3E = internal addrspace(1) global i64 84, align 8

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15tick_all_kernelPU7_AtomicmPmPl(i64 addrspace(1)* nocapture %0, i64 addrspace(1)* nocapture writeonly %1, i64 addrspace(1)* nocapture %2) local_unnamed_addr #0 !dbg !1764 {
  unreachable
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z10dummy_initPl(i64 addrspace(1)* nocapture writeonly %0) local_unnamed_addr #1 !dbg !1775 {
  unreachable
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define amdgpu_kernel void @scabbard.trace.device.dummyFunc(i16 %0, i8 addrspace(1)* %1, i8 addrspace(1)* nocapture readnone %2, i64 addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 comdat {
  %5 = addrspacecast i8 addrspace(1)* %1 to i8*
  %6 = addrspacecast i64 addrspace(1)* %3 to i64*
  tail call fastcc void @"scabbard.trace.device.trace_append$mem"(i16 zeroext %0, i8* %5, i64* addrspacecast (i64 addrspace(1)* @_ZN8scabbard5trace12_GLOBAL__N_114src_id_reg_tmpE to i64*), i32 19, i32 9) #7
  tail call fastcc void @"scabbard.trace.device.trace_append$mem"(i16 zeroext %0, i8* %5, i64* addrspacecast (i64 addrspace(1)* @_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp2E to i64*), i32 1024, i32 4) #7
  tail call fastcc void @"scabbard.trace.device.trace_append$mem"(i16 zeroext %0, i8* %5, i64* %6, i32 10240, i32 40) #7
  tail call fastcc void @"scabbard.trace.device.trace_append$alloc"(i16 zeroext %0, i8* %5, i64* addrspacecast (i64 addrspace(1)* @_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp2E to i64*), i32 88, i32 256, i64 7) #7
  tail call fastcc void @"scabbard.trace.device.trace_append$alloc"(i16 zeroext %0, i8* %5, i64* addrspacecast (i64 addrspace(1)* @_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp3E to i64*), i32 98, i32 6, i64 23) #7
  tail call fastcc void @"scabbard.trace.device.trace_append$alloc"(i16 zeroext %0, i8* %5, i64* %6, i32 980, i32 60, i64 230) #7
  ret void
}

; Function Attrs: mustprogress noinline norecurse nounwind willreturn
define internal fastcc void @"scabbard.trace.device.trace_append$mem"(i16 zeroext %0, i8* %1, i64* nocapture readonly %2, i32 %3, i32 %4) unnamed_addr #3 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !1781, !invariant.load !1782
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !1783
  %15 = mul i32 %7, %11
  %16 = sub i32 %14, %15
  %17 = tail call i32 @llvm.umin.i32(i32 %16, i32 %11)
  %18 = mul i32 %17, %7
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !1781, !invariant.load !1782
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 16
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 8, !tbaa !1792
  %27 = mul i32 %19, %23
  %28 = sub i32 %26, %27
  %29 = tail call i32 @llvm.umin.i32(i32 %28, i32 %23)
  %30 = mul i32 %29, %19
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %32 = getelementptr i8, i8 addrspace(4)* %6, i64 8
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 4, !range !1781, !invariant.load !1782
  %35 = zext i16 %34 to i32
  %36 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 20
  %37 = bitcast i8 addrspace(4)* %36 to i32 addrspace(4)*
  %38 = load i32, i32 addrspace(4)* %37, align 4, !tbaa !1793
  %39 = mul i32 %31, %35
  %40 = sub i32 %38, %39
  %41 = tail call i32 @llvm.umin.i32(i32 %40, i32 %35)
  %42 = mul i32 %41, %31
  %43 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !1794
  %44 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !1794
  %45 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !1794
  %46 = add nuw nsw i32 %44, %43
  %47 = add nuw nsw i32 %46, %45
  %48 = add i32 %47, %18
  %49 = add i32 %48, %30
  %50 = add i32 %49, %42
  %51 = and i32 %50, 63
  %52 = zext i32 %51 to i64
  %53 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %54 = load i64, i64* %2, align 8, !tbaa !1795
  %55 = trunc i32 %45 to i8
  %56 = load %"struct.scabbard::trace::DeviceAsyncQueue"*, %"struct.scabbard::trace::DeviceAsyncQueue"* addrspace(1)* @_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE, align 8, !tbaa !1799
  %57 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %56, i64 0, i32 0, i64 %52, i32 0
  %58 = atomicrmw add i64* %57, i64 1 seq_cst, align 8
  %59 = add i64 %58, 1
  %60 = and i64 %59, 63
  %61 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %56, i64 0, i32 0, i64 %52, i32 1, i64 %60
  %62 = bitcast %"struct.scabbard::TraceData"* %61 to i8*
  %63 = lshr i64 %53, 8
  %64 = lshr i64 %53, 16
  %65 = lshr i64 %53, 24
  %66 = lshr i64 %53, 32
  %67 = lshr i64 %53, 40
  %68 = lshr i64 %53, 48
  %69 = lshr i64 %53, 56
  %70 = insertelement <8 x i64> poison, i64 %53, i64 0
  %71 = insertelement <8 x i64> %70, i64 %63, i64 1
  %72 = insertelement <8 x i64> %71, i64 %64, i64 2
  %73 = insertelement <8 x i64> %72, i64 %65, i64 3
  %74 = insertelement <8 x i64> %73, i64 %66, i64 4
  %75 = insertelement <8 x i64> %74, i64 %67, i64 5
  %76 = insertelement <8 x i64> %75, i64 %68, i64 6
  %77 = insertelement <8 x i64> %76, i64 %69, i64 7
  %78 = trunc <8 x i64> %77 to <8 x i8>
  %79 = bitcast %"struct.scabbard::TraceData"* %61 to <8 x i8>*
  store <8 x i8> %78, <8 x i8>* %79, align 8, !tbaa !1801
  %80 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %56, i64 0, i32 0, i64 %52, i32 1, i64 %60, i32 1
  %81 = bitcast i16* %80 to i8*
  %82 = trunc i16 %0 to i8
  store i8 %82, i8* %81, align 8, !tbaa !1801
  %83 = lshr i16 %0, 8
  %84 = trunc i16 %83 to i8
  %85 = getelementptr inbounds i8, i8* %62, i64 9
  store i8 %84, i8* %85, align 1, !tbaa !1801
  %86 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %56, i64 0, i32 0, i64 %52, i32 1, i64 %60, i32 2
  %87 = lshr i32 %7, 8
  %88 = lshr i32 %7, 16
  %89 = lshr i32 %7, 24
  %90 = lshr i32 %19, 8
  %91 = lshr i32 %31, 8
  %92 = insertelement <8 x i32> poison, i32 %7, i64 0
  %93 = insertelement <8 x i32> %92, i32 %87, i64 1
  %94 = insertelement <8 x i32> %93, i32 %88, i64 2
  %95 = insertelement <8 x i32> %94, i32 %89, i64 3
  %96 = insertelement <8 x i32> %95, i32 %19, i64 4
  %97 = insertelement <8 x i32> %96, i32 %90, i64 5
  %98 = insertelement <8 x i32> %97, i32 %31, i64 6
  %99 = insertelement <8 x i32> %98, i32 %91, i64 7
  %100 = trunc <8 x i32> %99 to <8 x i8>
  %101 = bitcast %"union.scabbard::ThreadId"* %86 to <8 x i8>*
  store <8 x i8> %100, <8 x i8>* %101, align 8, !tbaa !1801
  %102 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %56, i64 0, i32 0, i64 %52, i32 1, i64 %60, i32 2, i32 1, i64 0
  %103 = lshr i32 %43, 8
  %104 = lshr i32 %44, 8
  %105 = insertelement <4 x i32> poison, i32 %43, i64 0
  %106 = insertelement <4 x i32> %105, i32 %103, i64 1
  %107 = insertelement <4 x i32> %106, i32 %44, i64 2
  %108 = insertelement <4 x i32> %107, i32 %104, i64 3
  %109 = trunc <4 x i32> %108 to <4 x i8>
  %110 = bitcast i8* %102 to <4 x i8>*
  store <4 x i8> %109, <4 x i8>* %110, align 8, !tbaa !1801
  %111 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %56, i64 0, i32 0, i64 %52, i32 1, i64 %60, i32 2, i32 1, i64 4
  store i8 %55, i8* %111, align 4, !tbaa !1801
  %112 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %56, i64 0, i32 0, i64 %52, i32 1, i64 %60, i32 3
  %113 = ptrtoint i8* %1 to i64
  %114 = lshr i64 %113, 8
  %115 = lshr i64 %113, 16
  %116 = lshr i64 %113, 24
  %117 = lshr i64 %113, 32
  %118 = lshr i64 %113, 40
  %119 = lshr i64 %113, 48
  %120 = lshr i64 %113, 56
  %121 = insertelement <8 x i64> poison, i64 %113, i64 0
  %122 = insertelement <8 x i64> %121, i64 %114, i64 1
  %123 = insertelement <8 x i64> %122, i64 %115, i64 2
  %124 = insertelement <8 x i64> %123, i64 %116, i64 3
  %125 = insertelement <8 x i64> %124, i64 %117, i64 4
  %126 = insertelement <8 x i64> %125, i64 %118, i64 5
  %127 = insertelement <8 x i64> %126, i64 %119, i64 6
  %128 = insertelement <8 x i64> %127, i64 %120, i64 7
  %129 = trunc <8 x i64> %128 to <8 x i8>
  %130 = bitcast i8** %112 to <8 x i8>*
  store <8 x i8> %129, <8 x i8>* %130, align 8, !tbaa !1801
  %131 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %56, i64 0, i32 0, i64 %52, i32 1, i64 %60, i32 4
  %132 = lshr i64 %54, 8
  %133 = lshr i64 %54, 16
  %134 = lshr i64 %54, 24
  %135 = lshr i64 %54, 32
  %136 = lshr i64 %54, 40
  %137 = lshr i64 %54, 48
  %138 = lshr i64 %54, 56
  %139 = insertelement <8 x i64> poison, i64 %54, i64 0
  %140 = insertelement <8 x i64> %139, i64 %132, i64 1
  %141 = insertelement <8 x i64> %140, i64 %133, i64 2
  %142 = insertelement <8 x i64> %141, i64 %134, i64 3
  %143 = insertelement <8 x i64> %142, i64 %135, i64 4
  %144 = insertelement <8 x i64> %143, i64 %136, i64 5
  %145 = insertelement <8 x i64> %144, i64 %137, i64 6
  %146 = insertelement <8 x i64> %145, i64 %138, i64 7
  %147 = trunc <8 x i64> %146 to <8 x i8>
  %148 = bitcast %"struct.scabbard::LocationMetadata"* %131 to <8 x i8>*
  store <8 x i8> %147, <8 x i8>* %148, align 8, !tbaa !1801
  %149 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %56, i64 0, i32 0, i64 %52, i32 1, i64 %60, i32 4, i32 1
  %150 = lshr i32 %3, 8
  %151 = lshr i32 %3, 16
  %152 = lshr i32 %3, 24
  %153 = lshr i32 %4, 8
  %154 = lshr i32 %4, 16
  %155 = lshr i32 %4, 24
  %156 = insertelement <8 x i32> poison, i32 %3, i64 0
  %157 = insertelement <8 x i32> %156, i32 %4, i64 4
  %158 = insertelement <8 x i32> %157, i32 %150, i64 1
  %159 = insertelement <8 x i32> %158, i32 %151, i64 2
  %160 = insertelement <8 x i32> %159, i32 %152, i64 3
  %161 = insertelement <8 x i32> %160, i32 %153, i64 5
  %162 = insertelement <8 x i32> %161, i32 %154, i64 6
  %163 = insertelement <8 x i32> %162, i32 %155, i64 7
  %164 = trunc <8 x i32> %163 to <8 x i8>
  %165 = bitcast i32* %149 to <8 x i8>*
  store <8 x i8> %164, <8 x i8>* %165, align 8, !tbaa !1801
  %166 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %56, i64 0, i32 0, i64 %52, i32 1, i64 %60, i32 5
  %167 = bitcast i64* %166 to i8*
  store i8 0, i8* %167, align 8, !tbaa !1801
  %168 = getelementptr inbounds i8, i8* %62, i64 57
  store i8 0, i8* %168, align 1, !tbaa !1801
  %169 = getelementptr inbounds i8, i8* %62, i64 58
  store i8 0, i8* %169, align 2, !tbaa !1801
  %170 = getelementptr inbounds i8, i8* %62, i64 59
  store i8 0, i8* %170, align 1, !tbaa !1801
  %171 = getelementptr inbounds i8, i8* %62, i64 60
  store i8 0, i8* %171, align 4, !tbaa !1801
  %172 = getelementptr inbounds i8, i8* %62, i64 61
  store i8 0, i8* %172, align 1, !tbaa !1801
  %173 = getelementptr inbounds i8, i8* %62, i64 62
  store i8 0, i8* %173, align 2, !tbaa !1801
  %174 = getelementptr inbounds i8, i8* %62, i64 63
  store i8 0, i8* %174, align 1, !tbaa !1801
  ret void
}

; Function Attrs: mustprogress noinline norecurse nounwind willreturn
define internal fastcc void @"scabbard.trace.device.trace_append$alloc"(i16 zeroext %0, i8* %1, i64* nocapture readonly %2, i32 %3, i32 %4, i64 %5) unnamed_addr #3 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !1781, !invariant.load !1782
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !1783
  %16 = mul i32 %8, %12
  %17 = sub i32 %15, %16
  %18 = tail call i32 @llvm.umin.i32(i32 %17, i32 %12)
  %19 = mul i32 %18, %8
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !1781, !invariant.load !1782
  %24 = zext i16 %23 to i32
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 8, !tbaa !1792
  %28 = mul i32 %20, %24
  %29 = sub i32 %27, %28
  %30 = tail call i32 @llvm.umin.i32(i32 %29, i32 %24)
  %31 = mul i32 %30, %20
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %33 = getelementptr i8, i8 addrspace(4)* %7, i64 8
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 4, !range !1781, !invariant.load !1782
  %36 = zext i16 %35 to i32
  %37 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 20
  %38 = bitcast i8 addrspace(4)* %37 to i32 addrspace(4)*
  %39 = load i32, i32 addrspace(4)* %38, align 4, !tbaa !1793
  %40 = mul i32 %32, %36
  %41 = sub i32 %39, %40
  %42 = tail call i32 @llvm.umin.i32(i32 %41, i32 %36)
  %43 = mul i32 %42, %32
  %44 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !1794
  %45 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !1794
  %46 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !1794
  %47 = add nuw nsw i32 %45, %44
  %48 = add nuw nsw i32 %47, %46
  %49 = add i32 %48, %19
  %50 = add i32 %49, %31
  %51 = add i32 %50, %43
  %52 = and i32 %51, 63
  %53 = zext i32 %52 to i64
  %54 = tail call i64 @llvm.amdgcn.s.memtime()
  %55 = load i64, i64* %2, align 8, !tbaa !1795
  %56 = trunc i32 %46 to i8
  %57 = load %"struct.scabbard::trace::DeviceAsyncQueue"*, %"struct.scabbard::trace::DeviceAsyncQueue"* addrspace(1)* @_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE, align 8, !tbaa !1799
  %58 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %57, i64 0, i32 0, i64 %53, i32 0
  %59 = atomicrmw add i64* %58, i64 1 seq_cst, align 8
  %60 = add i64 %59, 1
  %61 = and i64 %60, 63
  %62 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %57, i64 0, i32 0, i64 %53, i32 1, i64 %61
  %63 = bitcast %"struct.scabbard::TraceData"* %62 to i8*
  %64 = lshr i64 %54, 8
  %65 = lshr i64 %54, 16
  %66 = lshr i64 %54, 24
  %67 = lshr i64 %54, 32
  %68 = lshr i64 %54, 40
  %69 = lshr i64 %54, 48
  %70 = lshr i64 %54, 56
  %71 = insertelement <8 x i64> poison, i64 %54, i64 0
  %72 = insertelement <8 x i64> %71, i64 %64, i64 1
  %73 = insertelement <8 x i64> %72, i64 %65, i64 2
  %74 = insertelement <8 x i64> %73, i64 %66, i64 3
  %75 = insertelement <8 x i64> %74, i64 %67, i64 4
  %76 = insertelement <8 x i64> %75, i64 %68, i64 5
  %77 = insertelement <8 x i64> %76, i64 %69, i64 6
  %78 = insertelement <8 x i64> %77, i64 %70, i64 7
  %79 = trunc <8 x i64> %78 to <8 x i8>
  %80 = bitcast %"struct.scabbard::TraceData"* %62 to <8 x i8>*
  store <8 x i8> %79, <8 x i8>* %80, align 8, !tbaa !1801
  %81 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %57, i64 0, i32 0, i64 %53, i32 1, i64 %61, i32 1
  %82 = bitcast i16* %81 to i8*
  %83 = trunc i16 %0 to i8
  store i8 %83, i8* %82, align 8, !tbaa !1801
  %84 = lshr i16 %0, 8
  %85 = trunc i16 %84 to i8
  %86 = getelementptr inbounds i8, i8* %63, i64 9
  store i8 %85, i8* %86, align 1, !tbaa !1801
  %87 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %57, i64 0, i32 0, i64 %53, i32 1, i64 %61, i32 2
  %88 = lshr i32 %8, 8
  %89 = lshr i32 %8, 16
  %90 = lshr i32 %8, 24
  %91 = lshr i32 %20, 8
  %92 = lshr i32 %32, 8
  %93 = insertelement <8 x i32> poison, i32 %8, i64 0
  %94 = insertelement <8 x i32> %93, i32 %88, i64 1
  %95 = insertelement <8 x i32> %94, i32 %89, i64 2
  %96 = insertelement <8 x i32> %95, i32 %90, i64 3
  %97 = insertelement <8 x i32> %96, i32 %20, i64 4
  %98 = insertelement <8 x i32> %97, i32 %91, i64 5
  %99 = insertelement <8 x i32> %98, i32 %32, i64 6
  %100 = insertelement <8 x i32> %99, i32 %92, i64 7
  %101 = trunc <8 x i32> %100 to <8 x i8>
  %102 = bitcast %"union.scabbard::ThreadId"* %87 to <8 x i8>*
  store <8 x i8> %101, <8 x i8>* %102, align 8, !tbaa !1801
  %103 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %57, i64 0, i32 0, i64 %53, i32 1, i64 %61, i32 2, i32 1, i64 0
  %104 = lshr i32 %44, 8
  %105 = lshr i32 %45, 8
  %106 = insertelement <4 x i32> poison, i32 %44, i64 0
  %107 = insertelement <4 x i32> %106, i32 %104, i64 1
  %108 = insertelement <4 x i32> %107, i32 %45, i64 2
  %109 = insertelement <4 x i32> %108, i32 %105, i64 3
  %110 = trunc <4 x i32> %109 to <4 x i8>
  %111 = bitcast i8* %103 to <4 x i8>*
  store <4 x i8> %110, <4 x i8>* %111, align 8, !tbaa !1801
  %112 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %57, i64 0, i32 0, i64 %53, i32 1, i64 %61, i32 2, i32 1, i64 4
  store i8 %56, i8* %112, align 4, !tbaa !1801
  %113 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %57, i64 0, i32 0, i64 %53, i32 1, i64 %61, i32 3
  %114 = ptrtoint i8* %1 to i64
  %115 = lshr i64 %114, 8
  %116 = lshr i64 %114, 16
  %117 = lshr i64 %114, 24
  %118 = lshr i64 %114, 32
  %119 = lshr i64 %114, 40
  %120 = lshr i64 %114, 48
  %121 = lshr i64 %114, 56
  %122 = insertelement <8 x i64> poison, i64 %114, i64 0
  %123 = insertelement <8 x i64> %122, i64 %115, i64 1
  %124 = insertelement <8 x i64> %123, i64 %116, i64 2
  %125 = insertelement <8 x i64> %124, i64 %117, i64 3
  %126 = insertelement <8 x i64> %125, i64 %118, i64 4
  %127 = insertelement <8 x i64> %126, i64 %119, i64 5
  %128 = insertelement <8 x i64> %127, i64 %120, i64 6
  %129 = insertelement <8 x i64> %128, i64 %121, i64 7
  %130 = trunc <8 x i64> %129 to <8 x i8>
  %131 = bitcast i8** %113 to <8 x i8>*
  store <8 x i8> %130, <8 x i8>* %131, align 8, !tbaa !1801
  %132 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %57, i64 0, i32 0, i64 %53, i32 1, i64 %61, i32 4
  %133 = lshr i64 %55, 8
  %134 = lshr i64 %55, 16
  %135 = lshr i64 %55, 24
  %136 = lshr i64 %55, 32
  %137 = lshr i64 %55, 40
  %138 = lshr i64 %55, 48
  %139 = lshr i64 %55, 56
  %140 = insertelement <8 x i64> poison, i64 %55, i64 0
  %141 = insertelement <8 x i64> %140, i64 %133, i64 1
  %142 = insertelement <8 x i64> %141, i64 %134, i64 2
  %143 = insertelement <8 x i64> %142, i64 %135, i64 3
  %144 = insertelement <8 x i64> %143, i64 %136, i64 4
  %145 = insertelement <8 x i64> %144, i64 %137, i64 5
  %146 = insertelement <8 x i64> %145, i64 %138, i64 6
  %147 = insertelement <8 x i64> %146, i64 %139, i64 7
  %148 = trunc <8 x i64> %147 to <8 x i8>
  %149 = bitcast %"struct.scabbard::LocationMetadata"* %132 to <8 x i8>*
  store <8 x i8> %148, <8 x i8>* %149, align 8, !tbaa !1801
  %150 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %57, i64 0, i32 0, i64 %53, i32 1, i64 %61, i32 4, i32 1
  %151 = lshr i32 %3, 8
  %152 = lshr i32 %3, 16
  %153 = lshr i32 %3, 24
  %154 = lshr i32 %4, 8
  %155 = lshr i32 %4, 16
  %156 = lshr i32 %4, 24
  %157 = insertelement <8 x i32> poison, i32 %3, i64 0
  %158 = insertelement <8 x i32> %157, i32 %4, i64 4
  %159 = insertelement <8 x i32> %158, i32 %151, i64 1
  %160 = insertelement <8 x i32> %159, i32 %152, i64 2
  %161 = insertelement <8 x i32> %160, i32 %153, i64 3
  %162 = insertelement <8 x i32> %161, i32 %154, i64 5
  %163 = insertelement <8 x i32> %162, i32 %155, i64 6
  %164 = insertelement <8 x i32> %163, i32 %156, i64 7
  %165 = trunc <8 x i32> %164 to <8 x i8>
  %166 = bitcast i32* %150 to <8 x i8>*
  store <8 x i8> %165, <8 x i8>* %166, align 8, !tbaa !1801
  %167 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %57, i64 0, i32 0, i64 %53, i32 1, i64 %61, i32 5
  %168 = lshr i64 %5, 8
  %169 = lshr i64 %5, 16
  %170 = lshr i64 %5, 24
  %171 = lshr i64 %5, 32
  %172 = lshr i64 %5, 40
  %173 = lshr i64 %5, 48
  %174 = lshr i64 %5, 56
  %175 = insertelement <8 x i64> poison, i64 %5, i64 0
  %176 = insertelement <8 x i64> %175, i64 %168, i64 1
  %177 = insertelement <8 x i64> %176, i64 %169, i64 2
  %178 = insertelement <8 x i64> %177, i64 %170, i64 3
  %179 = insertelement <8 x i64> %178, i64 %171, i64 4
  %180 = insertelement <8 x i64> %179, i64 %172, i64 5
  %181 = insertelement <8 x i64> %180, i64 %173, i64 6
  %182 = insertelement <8 x i64> %181, i64 %174, i64 7
  %183 = trunc <8 x i64> %182 to <8 x i8>
  %184 = bitcast i64* %167 to <8 x i8>*
  store <8 x i8> %183, <8 x i8>* %184, align 8, !tbaa !1801
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #5

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #5

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #5

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #5

; Function Attrs: nounwind willreturn
declare i64 @llvm.amdgcn.s.memtime() #6

; Function Attrs: nounwind willreturn
declare i64 @llvm.amdgcn.s.memrealtime() #6

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress noinline norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+atomic-fadd-no-rtn-insts,+atomic-fadd-rtn-insts,+atomic-pk-fadd-no-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+dpp-64bit,+enable-ds128,+enable-prt-strict-null,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+full-rate-64-ops,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+gfx90a-insts,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+mai-insts,+negative-scratch-offset-bug,+packed-fp32-ops,+packed-tid,+pk-fmac-f16-inst,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { nounwind willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.dbg.retainedNodes = !{!1712, !1754}
!llvm.module.flags = !{!1757, !1758, !1759, !1760}
!opencl.ocl.version = !{!1761, !1761}
!llvm.ident = !{!1762, !1763}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !26, imports: !42, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard", checksumkind: CSK_MD5, checksum: "3cdb439f8feef572cb544d3e9cde4206")
!2 = !{!3, !11, !19}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Lock_policy", scope: !5, file: !4, line: 49, baseType: !6, size: 32, elements: !7, identifier: "_ZTSN9__gnu_cxx12_Lock_policyE")
!4 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ext/concurrence.h", directory: "")
!5 = !DINamespace(name: "__gnu_cxx", scope: null)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10}
!8 = !DIEnumerator(name: "_S_single", value: 0, isUnsigned: true)
!9 = !DIEnumerator(name: "_S_mutex", value: 1, isUnsigned: true)
!10 = !DIEnumerator(name: "_S_atomic", value: 2, isUnsigned: true)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__memory_scope", file: !12, line: 131, baseType: !6, size: 32, elements: !13, identifier: "_ZTS14__memory_scope")
!12 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/device_library_decls.h", directory: "", checksumkind: CSK_MD5, checksum: "8b6f554c5ff3913526d501b4647e437e")
!13 = !{!14, !15, !16, !17, !18}
!14 = !DIEnumerator(name: "__memory_scope_work_item", value: 0, isUnsigned: true)
!15 = !DIEnumerator(name: "__memory_scope_work_group", value: 1, isUnsigned: true)
!16 = !DIEnumerator(name: "__memory_scope_device", value: 2, isUnsigned: true)
!17 = !DIEnumerator(name: "__memory_scope_all_svm_devices", value: 3, isUnsigned: true)
!18 = !DIEnumerator(name: "__memory_scope_sub_group", value: 4, isUnsigned: true)
!19 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__memory_order", file: !12, line: 140, baseType: !6, size: 32, elements: !20, identifier: "_ZTS14__memory_order")
!20 = !{!21, !22, !23, !24, !25}
!21 = !DIEnumerator(name: "__memory_order_relaxed", value: 0, isUnsigned: true)
!22 = !DIEnumerator(name: "__memory_order_acquire", value: 2, isUnsigned: true)
!23 = !DIEnumerator(name: "__memory_order_release", value: 3, isUnsigned: true)
!24 = !DIEnumerator(name: "__memory_order_acq_rel", value: 4, isUnsigned: true)
!25 = !DIEnumerator(name: "__memory_order_seq_cst", value: 5, isUnsigned: true)
!26 = !{!27, !28}
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cl_mem_fence_flags", file: !12, line: 129, baseType: !6)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !29, line: 934, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !30, identifier: "_ZTS4dim3")
!29 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "7560f6d8bd7c5ac736ef5dfcbc59d092")
!30 = !{!31, !36, !37, !38}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !28, file: !29, line: 935, baseType: !32, size: 32)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !33, line: 26, baseType: !34)
!33 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "9754ebe022edbe8d7928fa709e442f0d")
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !35, line: 41, baseType: !6)
!35 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "eac2c46b20ddc2be81186b6ffebfd845")
!36 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !28, file: !29, line: 936, baseType: !32, size: 32, offset: 32)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !28, file: !29, line: 937, baseType: !32, size: 32, offset: 64)
!38 = !DISubprogram(name: "dim3", scope: !28, file: !29, line: 939, type: !39, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !41, !32, !32, !32}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!42 = !{!43, !51, !58, !60, !62, !66, !68, !70, !72, !74, !76, !78, !80, !85, !89, !91, !93, !98, !100, !102, !104, !106, !108, !110, !113, !116, !118, !122, !127, !129, !131, !133, !135, !137, !139, !141, !143, !145, !147, !151, !155, !157, !159, !161, !163, !165, !167, !169, !171, !173, !175, !177, !179, !181, !183, !185, !189, !193, !197, !199, !201, !203, !205, !207, !209, !211, !213, !215, !219, !223, !227, !229, !231, !233, !238, !242, !246, !248, !250, !252, !254, !256, !258, !260, !262, !264, !266, !268, !270, !275, !279, !283, !285, !287, !289, !296, !300, !304, !306, !308, !310, !312, !314, !316, !320, !324, !326, !328, !330, !332, !336, !340, !344, !346, !348, !350, !352, !354, !356, !360, !364, !368, !370, !374, !378, !380, !382, !384, !386, !388, !390, !394, !398, !404, !408, !416, !421, !423, !426, !430, !434, !445, !447, !451, !455, !459, !464, !468, !472, !476, !480, !488, !492, !496, !498, !502, !506, !510, !516, !520, !524, !526, !534, !538, !544, !546, !550, !554, !558, !562, !567, !571, !575, !576, !577, !578, !580, !581, !582, !583, !584, !585, !586, !588, !589, !590, !591, !592, !593, !594, !596, !597, !598, !599, !600, !601, !602, !603, !604, !605, !606, !607, !608, !609, !610, !611, !612, !613, !614, !615, !616, !617, !618, !619, !620, !624, !628, !631, !633, !635, !637, !639, !641, !643, !645, !647, !649, !651, !653, !655, !657, !659, !661, !663, !665, !667, !669, !671, !673, !675, !677, !679, !681, !685, !687, !689, !694, !698, !700, !702, !704, !706, !708, !710, !712, !714, !716, !718, !720, !722, !724, !726, !728, !730, !732, !734, !736, !738, !740, !745, !747, !749, !751, !753, !755, !757, !759, !761, !763, !765, !767, !769, !771, !773, !775, !777, !779, !781, !783, !787, !789, !791, !793, !795, !797, !799, !801, !803, !805, !807, !809, !811, !813, !815, !817, !819, !821, !823, !825, !827, !829, !831, !833, !835, !837, !839, !841, !843, !845, !847, !849, !851, !853, !855, !857, !859, !861, !863, !865, !867, !869, !871, !873, !875, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !912, !915, !920, !978, !983, !987, !991, !995, !999, !1001, !1003, !1007, !1013, !1017, !1023, !1029, !1031, !1035, !1039, !1043, !1047, !1055, !1057, !1061, !1065, !1069, !1071, !1075, !1079, !1083, !1085, !1087, !1091, !1112, !1116, !1120, !1124, !1126, !1132, !1134, !1140, !1144, !1148, !1152, !1156, !1160, !1164, !1166, !1168, !1172, !1176, !1180, !1182, !1186, !1190, !1192, !1194, !1198, !1202, !1206, !1210, !1211, !1212, !1213, !1214, !1215, !1216, !1217, !1218, !1219, !1220, !1225, !1229, !1232, !1235, !1238, !1240, !1242, !1244, !1247, !1250, !1253, !1256, !1259, !1261, !1265, !1268, !1269, !1272, !1274, !1276, !1278, !1280, !1283, !1286, !1289, !1292, !1295, !1297, !1301, !1305, !1310, !1314, !1316, !1318, !1320, !1322, !1324, !1326, !1328, !1330, !1332, !1334, !1336, !1338, !1340, !1344, !1350, !1355, !1359, !1361, !1363, !1365, !1367, !1374, !1378, !1382, !1386, !1390, !1394, !1399, !1403, !1405, !1409, !1415, !1419, !1424, !1426, !1429, !1433, !1437, !1439, !1441, !1443, !1445, !1449, !1451, !1453, !1457, !1461, !1465, !1469, !1473, !1477, !1479, !1483, !1487, !1491, !1495, !1497, !1499, !1503, !1507, !1508, !1509, !1510, !1511, !1512, !1518, !1521, !1522, !1524, !1526, !1528, !1530, !1534, !1536, !1538, !1540, !1542, !1544, !1546, !1548, !1550, !1554, !1558, !1560, !1564, !1568, !1573, !1577, !1578, !1583, !1587, !1592, !1597, !1601, !1607, !1611, !1613, !1617, !1624, !1629, !1634, !1636, !1639, !1645, !1649, !1654, !1656, !1660, !1664, !1666, !1668, !1670, !1674, !1678, !1682, !1686, !1690, !1692, !1694, !1696, !1700, !1704, !1708, !1710}
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !45, file: !50, line: 52)
!44 = !DINamespace(name: "std", scope: null)
!45 = !DISubprogram(name: "abs", scope: !46, file: !46, line: 837, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!46 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "d0b67d4c866748c04ac2b355c26c1c70")
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/std_abs.h", directory: "")
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !52, file: !57, line: 83)
!52 = !DISubprogram(name: "acos", scope: !53, file: !53, line: 53, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!53 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "d6f9ed6e7af49b30a088f9f753a7a51b")
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56}
!56 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!57 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cmath", directory: "")
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !59, file: !57, line: 102)
!59 = !DISubprogram(name: "asin", scope: !53, file: !53, line: 55, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !61, file: !57, line: 121)
!61 = !DISubprogram(name: "atan", scope: !53, file: !53, line: 57, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !63, file: !57, line: 140)
!63 = !DISubprogram(name: "atan2", scope: !53, file: !53, line: 59, type: !64, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!64 = !DISubroutineType(types: !65)
!65 = !{!56, !56, !56}
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !67, file: !57, line: 161)
!67 = !DISubprogram(name: "ceil", scope: !53, file: !53, line: 159, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !69, file: !57, line: 180)
!69 = !DISubprogram(name: "cos", scope: !53, file: !53, line: 62, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !71, file: !57, line: 199)
!71 = !DISubprogram(name: "cosh", scope: !53, file: !53, line: 71, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !73, file: !57, line: 218)
!73 = !DISubprogram(name: "exp", scope: !53, file: !53, line: 95, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !75, file: !57, line: 237)
!75 = !DISubprogram(name: "fabs", scope: !53, file: !53, line: 162, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !77, file: !57, line: 256)
!77 = !DISubprogram(name: "floor", scope: !53, file: !53, line: 165, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !79, file: !57, line: 275)
!79 = !DISubprogram(name: "fmod", scope: !53, file: !53, line: 168, type: !64, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !81, file: !57, line: 296)
!81 = !DISubprogram(name: "frexp", scope: !53, file: !53, line: 98, type: !82, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!82 = !DISubroutineType(types: !83)
!83 = !{!56, !56, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !86, file: !57, line: 315)
!86 = !DISubprogram(name: "ldexp", scope: !53, file: !53, line: 101, type: !87, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!87 = !DISubroutineType(types: !88)
!88 = !{!56, !56, !49}
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !90, file: !57, line: 334)
!90 = !DISubprogram(name: "log", scope: !53, file: !53, line: 104, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !92, file: !57, line: 353)
!92 = !DISubprogram(name: "log10", scope: !53, file: !53, line: 107, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !94, file: !57, line: 372)
!94 = !DISubprogram(name: "modf", scope: !53, file: !53, line: 110, type: !95, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!95 = !DISubroutineType(types: !96)
!96 = !{!56, !56, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !99, file: !57, line: 384)
!99 = !DISubprogram(name: "pow", scope: !53, file: !53, line: 140, type: !64, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !101, file: !57, line: 421)
!101 = !DISubprogram(name: "sin", scope: !53, file: !53, line: 64, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !103, file: !57, line: 440)
!103 = !DISubprogram(name: "sinh", scope: !53, file: !53, line: 73, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !105, file: !57, line: 459)
!105 = !DISubprogram(name: "sqrt", scope: !53, file: !53, line: 143, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !107, file: !57, line: 478)
!107 = !DISubprogram(name: "tan", scope: !53, file: !53, line: 66, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !109, file: !57, line: 497)
!109 = !DISubprogram(name: "tanh", scope: !53, file: !53, line: 75, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !111, file: !57, line: 1065)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !112, line: 150, baseType: !56)
!112 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "c5a5a367b9358fd8d34408e944614c4d")
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !114, file: !57, line: 1066)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !112, line: 149, baseType: !115)
!115 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !117, file: !57, line: 1069)
!117 = !DISubprogram(name: "acosh", scope: !53, file: !53, line: 85, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !119, file: !57, line: 1070)
!119 = !DISubprogram(name: "acoshf", scope: !53, file: !53, line: 85, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!120 = !DISubroutineType(types: !121)
!121 = !{!115, !115}
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !123, file: !57, line: 1071)
!123 = !DISubprogram(name: "acoshl", scope: !53, file: !53, line: 85, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!124 = !DISubroutineType(types: !125)
!125 = !{!126, !126}
!126 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !128, file: !57, line: 1073)
!128 = !DISubprogram(name: "asinh", scope: !53, file: !53, line: 87, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !130, file: !57, line: 1074)
!130 = !DISubprogram(name: "asinhf", scope: !53, file: !53, line: 87, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !132, file: !57, line: 1075)
!132 = !DISubprogram(name: "asinhl", scope: !53, file: !53, line: 87, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !134, file: !57, line: 1077)
!134 = !DISubprogram(name: "atanh", scope: !53, file: !53, line: 89, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !136, file: !57, line: 1078)
!136 = !DISubprogram(name: "atanhf", scope: !53, file: !53, line: 89, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !138, file: !57, line: 1079)
!138 = !DISubprogram(name: "atanhl", scope: !53, file: !53, line: 89, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !140, file: !57, line: 1081)
!140 = !DISubprogram(name: "cbrt", scope: !53, file: !53, line: 152, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !142, file: !57, line: 1082)
!142 = !DISubprogram(name: "cbrtf", scope: !53, file: !53, line: 152, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !144, file: !57, line: 1083)
!144 = !DISubprogram(name: "cbrtl", scope: !53, file: !53, line: 152, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !146, file: !57, line: 1085)
!146 = !DISubprogram(name: "copysign", scope: !53, file: !53, line: 196, type: !64, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !148, file: !57, line: 1086)
!148 = !DISubprogram(name: "copysignf", scope: !53, file: !53, line: 196, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!149 = !DISubroutineType(types: !150)
!150 = !{!115, !115, !115}
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !152, file: !57, line: 1087)
!152 = !DISubprogram(name: "copysignl", scope: !53, file: !53, line: 196, type: !153, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!153 = !DISubroutineType(types: !154)
!154 = !{!126, !126, !126}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !156, file: !57, line: 1089)
!156 = !DISubprogram(name: "erf", scope: !53, file: !53, line: 228, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !158, file: !57, line: 1090)
!158 = !DISubprogram(name: "erff", scope: !53, file: !53, line: 228, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !160, file: !57, line: 1091)
!160 = !DISubprogram(name: "erfl", scope: !53, file: !53, line: 228, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !162, file: !57, line: 1093)
!162 = !DISubprogram(name: "erfc", scope: !53, file: !53, line: 229, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !164, file: !57, line: 1094)
!164 = !DISubprogram(name: "erfcf", scope: !53, file: !53, line: 229, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !166, file: !57, line: 1095)
!166 = !DISubprogram(name: "erfcl", scope: !53, file: !53, line: 229, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !168, file: !57, line: 1097)
!168 = !DISubprogram(name: "exp2", scope: !53, file: !53, line: 130, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !170, file: !57, line: 1098)
!170 = !DISubprogram(name: "exp2f", scope: !53, file: !53, line: 130, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !172, file: !57, line: 1099)
!172 = !DISubprogram(name: "exp2l", scope: !53, file: !53, line: 130, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !174, file: !57, line: 1101)
!174 = !DISubprogram(name: "expm1", scope: !53, file: !53, line: 119, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !176, file: !57, line: 1102)
!176 = !DISubprogram(name: "expm1f", scope: !53, file: !53, line: 119, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !178, file: !57, line: 1103)
!178 = !DISubprogram(name: "expm1l", scope: !53, file: !53, line: 119, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !180, file: !57, line: 1105)
!180 = !DISubprogram(name: "fdim", scope: !53, file: !53, line: 326, type: !64, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !182, file: !57, line: 1106)
!182 = !DISubprogram(name: "fdimf", scope: !53, file: !53, line: 326, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !184, file: !57, line: 1107)
!184 = !DISubprogram(name: "fdiml", scope: !53, file: !53, line: 326, type: !153, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !186, file: !57, line: 1109)
!186 = !DISubprogram(name: "fma", scope: !53, file: !53, line: 335, type: !187, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!187 = !DISubroutineType(types: !188)
!188 = !{!56, !56, !56, !56}
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !190, file: !57, line: 1110)
!190 = !DISubprogram(name: "fmaf", scope: !53, file: !53, line: 335, type: !191, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!191 = !DISubroutineType(types: !192)
!192 = !{!115, !115, !115, !115}
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !194, file: !57, line: 1111)
!194 = !DISubprogram(name: "fmal", scope: !53, file: !53, line: 335, type: !195, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!195 = !DISubroutineType(types: !196)
!196 = !{!126, !126, !126, !126}
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !198, file: !57, line: 1113)
!198 = !DISubprogram(name: "fmax", scope: !53, file: !53, line: 329, type: !64, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !200, file: !57, line: 1114)
!200 = !DISubprogram(name: "fmaxf", scope: !53, file: !53, line: 329, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !202, file: !57, line: 1115)
!202 = !DISubprogram(name: "fmaxl", scope: !53, file: !53, line: 329, type: !153, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !204, file: !57, line: 1117)
!204 = !DISubprogram(name: "fmin", scope: !53, file: !53, line: 332, type: !64, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !206, file: !57, line: 1118)
!206 = !DISubprogram(name: "fminf", scope: !53, file: !53, line: 332, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !208, file: !57, line: 1119)
!208 = !DISubprogram(name: "fminl", scope: !53, file: !53, line: 332, type: !153, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !210, file: !57, line: 1121)
!210 = !DISubprogram(name: "hypot", scope: !53, file: !53, line: 147, type: !64, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !212, file: !57, line: 1122)
!212 = !DISubprogram(name: "hypotf", scope: !53, file: !53, line: 147, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !214, file: !57, line: 1123)
!214 = !DISubprogram(name: "hypotl", scope: !53, file: !53, line: 147, type: !153, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !216, file: !57, line: 1125)
!216 = !DISubprogram(name: "ilogb", scope: !53, file: !53, line: 280, type: !217, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!217 = !DISubroutineType(types: !218)
!218 = !{!49, !56}
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !220, file: !57, line: 1126)
!220 = !DISubprogram(name: "ilogbf", scope: !53, file: !53, line: 280, type: !221, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!221 = !DISubroutineType(types: !222)
!222 = !{!49, !115}
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !224, file: !57, line: 1127)
!224 = !DISubprogram(name: "ilogbl", scope: !53, file: !53, line: 280, type: !225, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!225 = !DISubroutineType(types: !226)
!226 = !{!49, !126}
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !228, file: !57, line: 1129)
!228 = !DISubprogram(name: "lgamma", scope: !53, file: !53, line: 230, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !230, file: !57, line: 1130)
!230 = !DISubprogram(name: "lgammaf", scope: !53, file: !53, line: 230, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !232, file: !57, line: 1131)
!232 = !DISubprogram(name: "lgammal", scope: !53, file: !53, line: 230, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !234, file: !57, line: 1134)
!234 = !DISubprogram(name: "llrint", scope: !53, file: !53, line: 316, type: !235, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!235 = !DISubroutineType(types: !236)
!236 = !{!237, !56}
!237 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !239, file: !57, line: 1135)
!239 = !DISubprogram(name: "llrintf", scope: !53, file: !53, line: 316, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!240 = !DISubroutineType(types: !241)
!241 = !{!237, !115}
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !243, file: !57, line: 1136)
!243 = !DISubprogram(name: "llrintl", scope: !53, file: !53, line: 316, type: !244, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!244 = !DISubroutineType(types: !245)
!245 = !{!237, !126}
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !247, file: !57, line: 1138)
!247 = !DISubprogram(name: "llround", scope: !53, file: !53, line: 322, type: !235, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !249, file: !57, line: 1139)
!249 = !DISubprogram(name: "llroundf", scope: !53, file: !53, line: 322, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !251, file: !57, line: 1140)
!251 = !DISubprogram(name: "llroundl", scope: !53, file: !53, line: 322, type: !244, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !253, file: !57, line: 1143)
!253 = !DISubprogram(name: "log1p", scope: !53, file: !53, line: 122, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !255, file: !57, line: 1144)
!255 = !DISubprogram(name: "log1pf", scope: !53, file: !53, line: 122, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !257, file: !57, line: 1145)
!257 = !DISubprogram(name: "log1pl", scope: !53, file: !53, line: 122, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !259, file: !57, line: 1147)
!259 = !DISubprogram(name: "log2", scope: !53, file: !53, line: 133, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !261, file: !57, line: 1148)
!261 = !DISubprogram(name: "log2f", scope: !53, file: !53, line: 133, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !263, file: !57, line: 1149)
!263 = !DISubprogram(name: "log2l", scope: !53, file: !53, line: 133, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !265, file: !57, line: 1151)
!265 = !DISubprogram(name: "logb", scope: !53, file: !53, line: 125, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !267, file: !57, line: 1152)
!267 = !DISubprogram(name: "logbf", scope: !53, file: !53, line: 125, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !269, file: !57, line: 1153)
!269 = !DISubprogram(name: "logbl", scope: !53, file: !53, line: 125, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !271, file: !57, line: 1155)
!271 = !DISubprogram(name: "lrint", scope: !53, file: !53, line: 314, type: !272, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!272 = !DISubroutineType(types: !273)
!273 = !{!274, !56}
!274 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !276, file: !57, line: 1156)
!276 = !DISubprogram(name: "lrintf", scope: !53, file: !53, line: 314, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!277 = !DISubroutineType(types: !278)
!278 = !{!274, !115}
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !280, file: !57, line: 1157)
!280 = !DISubprogram(name: "lrintl", scope: !53, file: !53, line: 314, type: !281, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!281 = !DISubroutineType(types: !282)
!282 = !{!274, !126}
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !284, file: !57, line: 1159)
!284 = !DISubprogram(name: "lround", scope: !53, file: !53, line: 320, type: !272, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !286, file: !57, line: 1160)
!286 = !DISubprogram(name: "lroundf", scope: !53, file: !53, line: 320, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !288, file: !57, line: 1161)
!288 = !DISubprogram(name: "lroundl", scope: !53, file: !53, line: 320, type: !281, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !290, file: !57, line: 1163)
!290 = !DISubprogram(name: "nan", scope: !53, file: !53, line: 201, type: !291, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!291 = !DISubroutineType(types: !292)
!292 = !{!56, !293}
!293 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !294, size: 64)
!294 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !295)
!295 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !297, file: !57, line: 1164)
!297 = !DISubprogram(name: "nanf", scope: !53, file: !53, line: 201, type: !298, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!298 = !DISubroutineType(types: !299)
!299 = !{!115, !293}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !301, file: !57, line: 1165)
!301 = !DISubprogram(name: "nanl", scope: !53, file: !53, line: 201, type: !302, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!302 = !DISubroutineType(types: !303)
!303 = !{!126, !293}
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !305, file: !57, line: 1167)
!305 = !DISubprogram(name: "nearbyint", scope: !53, file: !53, line: 294, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !307, file: !57, line: 1168)
!307 = !DISubprogram(name: "nearbyintf", scope: !53, file: !53, line: 294, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !309, file: !57, line: 1169)
!309 = !DISubprogram(name: "nearbyintl", scope: !53, file: !53, line: 294, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !311, file: !57, line: 1171)
!311 = !DISubprogram(name: "nextafter", scope: !53, file: !53, line: 259, type: !64, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !313, file: !57, line: 1172)
!313 = !DISubprogram(name: "nextafterf", scope: !53, file: !53, line: 259, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !315, file: !57, line: 1173)
!315 = !DISubprogram(name: "nextafterl", scope: !53, file: !53, line: 259, type: !153, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !317, file: !57, line: 1175)
!317 = !DISubprogram(name: "nexttoward", scope: !53, file: !53, line: 261, type: !318, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!318 = !DISubroutineType(types: !319)
!319 = !{!56, !56, !126}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !321, file: !57, line: 1176)
!321 = !DISubprogram(name: "nexttowardf", scope: !53, file: !53, line: 261, type: !322, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!322 = !DISubroutineType(types: !323)
!323 = !{!115, !115, !126}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !325, file: !57, line: 1177)
!325 = !DISubprogram(name: "nexttowardl", scope: !53, file: !53, line: 261, type: !153, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !327, file: !57, line: 1179)
!327 = !DISubprogram(name: "remainder", scope: !53, file: !53, line: 272, type: !64, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !329, file: !57, line: 1180)
!329 = !DISubprogram(name: "remainderf", scope: !53, file: !53, line: 272, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !331, file: !57, line: 1181)
!331 = !DISubprogram(name: "remainderl", scope: !53, file: !53, line: 272, type: !153, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !333, file: !57, line: 1183)
!333 = !DISubprogram(name: "remquo", scope: !53, file: !53, line: 307, type: !334, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!334 = !DISubroutineType(types: !335)
!335 = !{!56, !56, !56, !84}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !337, file: !57, line: 1184)
!337 = !DISubprogram(name: "remquof", scope: !53, file: !53, line: 307, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!338 = !DISubroutineType(types: !339)
!339 = !{!115, !115, !115, !84}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !341, file: !57, line: 1185)
!341 = !DISubprogram(name: "remquol", scope: !53, file: !53, line: 307, type: !342, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!342 = !DISubroutineType(types: !343)
!343 = !{!126, !126, !126, !84}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !345, file: !57, line: 1187)
!345 = !DISubprogram(name: "rint", scope: !53, file: !53, line: 256, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !347, file: !57, line: 1188)
!347 = !DISubprogram(name: "rintf", scope: !53, file: !53, line: 256, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !349, file: !57, line: 1189)
!349 = !DISubprogram(name: "rintl", scope: !53, file: !53, line: 256, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !351, file: !57, line: 1191)
!351 = !DISubprogram(name: "round", scope: !53, file: !53, line: 298, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !353, file: !57, line: 1192)
!353 = !DISubprogram(name: "roundf", scope: !53, file: !53, line: 298, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !355, file: !57, line: 1193)
!355 = !DISubprogram(name: "roundl", scope: !53, file: !53, line: 298, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !357, file: !57, line: 1195)
!357 = !DISubprogram(name: "scalbln", scope: !53, file: !53, line: 290, type: !358, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!358 = !DISubroutineType(types: !359)
!359 = !{!56, !56, !274}
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !361, file: !57, line: 1196)
!361 = !DISubprogram(name: "scalblnf", scope: !53, file: !53, line: 290, type: !362, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!362 = !DISubroutineType(types: !363)
!363 = !{!115, !115, !274}
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !365, file: !57, line: 1197)
!365 = !DISubprogram(name: "scalblnl", scope: !53, file: !53, line: 290, type: !366, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!366 = !DISubroutineType(types: !367)
!367 = !{!126, !126, !274}
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !369, file: !57, line: 1199)
!369 = !DISubprogram(name: "scalbn", scope: !53, file: !53, line: 276, type: !87, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !371, file: !57, line: 1200)
!371 = !DISubprogram(name: "scalbnf", scope: !53, file: !53, line: 276, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!372 = !DISubroutineType(types: !373)
!373 = !{!115, !115, !49}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !375, file: !57, line: 1201)
!375 = !DISubprogram(name: "scalbnl", scope: !53, file: !53, line: 276, type: !376, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!376 = !DISubroutineType(types: !377)
!377 = !{!126, !126, !49}
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !379, file: !57, line: 1203)
!379 = !DISubprogram(name: "tgamma", scope: !53, file: !53, line: 235, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !381, file: !57, line: 1204)
!381 = !DISubprogram(name: "tgammaf", scope: !53, file: !53, line: 235, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !383, file: !57, line: 1205)
!383 = !DISubprogram(name: "tgammal", scope: !53, file: !53, line: 235, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !385, file: !57, line: 1207)
!385 = !DISubprogram(name: "trunc", scope: !53, file: !53, line: 302, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !387, file: !57, line: 1208)
!387 = !DISubprogram(name: "truncf", scope: !53, file: !53, line: 302, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !389, file: !57, line: 1209)
!389 = !DISubprogram(name: "truncl", scope: !53, file: !53, line: 302, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!390 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !391, entity: !392, file: !393, line: 58)
!391 = !DINamespace(name: "__gnu_debug", scope: null)
!392 = !DINamespace(name: "__debug", scope: !44)
!393 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "c69f68f2d2cbac034a41bb7ce5c36465")
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !395, file: !397, line: 127)
!395 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !46, line: 62, baseType: !396)
!396 = !DICompositeType(tag: DW_TAG_structure_type, file: !46, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!397 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdlib", directory: "")
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !399, file: !397, line: 128)
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !46, line: 70, baseType: !400)
!400 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !46, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !401, identifier: "_ZTS6ldiv_t")
!401 = !{!402, !403}
!402 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !400, file: !46, line: 68, baseType: !274, size: 64)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !400, file: !46, line: 69, baseType: !274, size: 64, offset: 64)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !405, file: !397, line: 130)
!405 = !DISubprogram(name: "abort", scope: !46, file: !46, line: 588, type: !406, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!406 = !DISubroutineType(types: !407)
!407 = !{null}
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !409, file: !397, line: 132)
!409 = !DISubprogram(name: "aligned_alloc", scope: !46, file: !46, line: 583, type: !410, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!410 = !DISubroutineType(types: !411)
!411 = !{!412, !413, !413}
!412 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!413 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !414, line: 46, baseType: !415)
!414 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!415 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !417, file: !397, line: 134)
!417 = !DISubprogram(name: "atexit", scope: !46, file: !46, line: 592, type: !418, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!418 = !DISubroutineType(types: !419)
!419 = !{!49, !420}
!420 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !406, size: 64)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !422, file: !397, line: 137)
!422 = !DISubprogram(name: "at_quick_exit", scope: !46, file: !46, line: 597, type: !418, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !424, file: !397, line: 140)
!424 = !DISubprogram(name: "atof", scope: !425, file: !425, line: 25, type: !291, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!425 = !DIFile(filename: "/usr/include/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "ce60958b260b171e83db3307f1d644f0")
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !427, file: !397, line: 141)
!427 = !DISubprogram(name: "atoi", scope: !46, file: !46, line: 361, type: !428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!428 = !DISubroutineType(types: !429)
!429 = !{!49, !293}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !431, file: !397, line: 142)
!431 = !DISubprogram(name: "atol", scope: !46, file: !46, line: 366, type: !432, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!432 = !DISubroutineType(types: !433)
!433 = !{!274, !293}
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !435, file: !397, line: 143)
!435 = !DISubprogram(name: "bsearch", scope: !436, file: !436, line: 20, type: !437, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!436 = !DIFile(filename: "/usr/include/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "1a798a38b25adee7bb680abce9ef568a")
!437 = !DISubroutineType(types: !438)
!438 = !{!412, !439, !439, !413, !413, !441}
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !440, size: 64)
!440 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!441 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !46, line: 805, baseType: !442)
!442 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !443, size: 64)
!443 = !DISubroutineType(types: !444)
!444 = !{!49, !439, !439}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !446, file: !397, line: 144)
!446 = !DISubprogram(name: "calloc", scope: !46, file: !46, line: 541, type: !410, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !448, file: !397, line: 145)
!448 = !DISubprogram(name: "div", scope: !46, file: !46, line: 849, type: !449, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!449 = !DISubroutineType(types: !450)
!450 = !{!395, !49, !49}
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !452, file: !397, line: 146)
!452 = !DISubprogram(name: "exit", scope: !46, file: !46, line: 614, type: !453, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!453 = !DISubroutineType(types: !454)
!454 = !{null, !49}
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !456, file: !397, line: 147)
!456 = !DISubprogram(name: "free", scope: !46, file: !46, line: 563, type: !457, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!457 = !DISubroutineType(types: !458)
!458 = !{null, !412}
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !460, file: !397, line: 148)
!460 = !DISubprogram(name: "getenv", scope: !46, file: !46, line: 631, type: !461, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!461 = !DISubroutineType(types: !462)
!462 = !{!463, !293}
!463 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !295, size: 64)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !465, file: !397, line: 149)
!465 = !DISubprogram(name: "labs", scope: !46, file: !46, line: 838, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!466 = !DISubroutineType(types: !467)
!467 = !{!274, !274}
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !469, file: !397, line: 150)
!469 = !DISubprogram(name: "ldiv", scope: !46, file: !46, line: 851, type: !470, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!470 = !DISubroutineType(types: !471)
!471 = !{!399, !274, !274}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !473, file: !397, line: 151)
!473 = !DISubprogram(name: "malloc", scope: !46, file: !46, line: 539, type: !474, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!474 = !DISubroutineType(types: !475)
!475 = !{!412, !413}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !477, file: !397, line: 153)
!477 = !DISubprogram(name: "mblen", scope: !46, file: !46, line: 919, type: !478, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!478 = !DISubroutineType(types: !479)
!479 = !{!49, !293, !413}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !481, file: !397, line: 154)
!481 = !DISubprogram(name: "mbstowcs", scope: !46, file: !46, line: 930, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!482 = !DISubroutineType(types: !483)
!483 = !{!413, !484, !487, !413}
!484 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !485)
!485 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !486, size: 64)
!486 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!487 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !293)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !489, file: !397, line: 155)
!489 = !DISubprogram(name: "mbtowc", scope: !46, file: !46, line: 922, type: !490, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!490 = !DISubroutineType(types: !491)
!491 = !{!49, !484, !487, !413}
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !493, file: !397, line: 157)
!493 = !DISubprogram(name: "qsort", scope: !46, file: !46, line: 827, type: !494, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!494 = !DISubroutineType(types: !495)
!495 = !{null, !412, !413, !413, !441}
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !497, file: !397, line: 160)
!497 = !DISubprogram(name: "quick_exit", scope: !46, file: !46, line: 620, type: !453, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !499, file: !397, line: 163)
!499 = !DISubprogram(name: "rand", scope: !46, file: !46, line: 453, type: !500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!500 = !DISubroutineType(types: !501)
!501 = !{!49}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !503, file: !397, line: 164)
!503 = !DISubprogram(name: "realloc", scope: !46, file: !46, line: 549, type: !504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!504 = !DISubroutineType(types: !505)
!505 = !{!412, !412, !413}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !507, file: !397, line: 165)
!507 = !DISubprogram(name: "srand", scope: !46, file: !46, line: 455, type: !508, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!508 = !DISubroutineType(types: !509)
!509 = !{null, !6}
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !511, file: !397, line: 166)
!511 = !DISubprogram(name: "strtod", scope: !46, file: !46, line: 117, type: !512, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!512 = !DISubroutineType(types: !513)
!513 = !{!56, !487, !514}
!514 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !515)
!515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !463, size: 64)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !517, file: !397, line: 167)
!517 = !DISubprogram(name: "strtol", scope: !46, file: !46, line: 176, type: !518, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!518 = !DISubroutineType(types: !519)
!519 = !{!274, !487, !514, !49}
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !521, file: !397, line: 168)
!521 = !DISubprogram(name: "strtoul", scope: !46, file: !46, line: 180, type: !522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!522 = !DISubroutineType(types: !523)
!523 = !{!415, !487, !514, !49}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !525, file: !397, line: 169)
!525 = !DISubprogram(name: "system", scope: !46, file: !46, line: 781, type: !428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !527, file: !397, line: 171)
!527 = !DISubprogram(name: "wcstombs", scope: !46, file: !46, line: 933, type: !528, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!528 = !DISubroutineType(types: !529)
!529 = !{!413, !530, !531, !413}
!530 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !463)
!531 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !532)
!532 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !533, size: 64)
!533 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !486)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !535, file: !397, line: 172)
!535 = !DISubprogram(name: "wctomb", scope: !46, file: !46, line: 926, type: !536, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!536 = !DISubroutineType(types: !537)
!537 = !{!49, !463, !486}
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !539, file: !397, line: 200)
!539 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !46, line: 80, baseType: !540)
!540 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !46, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !541, identifier: "_ZTS7lldiv_t")
!541 = !{!542, !543}
!542 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !540, file: !46, line: 78, baseType: !237, size: 64)
!543 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !540, file: !46, line: 79, baseType: !237, size: 64, offset: 64)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !545, file: !397, line: 206)
!545 = !DISubprogram(name: "_Exit", scope: !46, file: !46, line: 626, type: !453, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !547, file: !397, line: 210)
!547 = !DISubprogram(name: "llabs", scope: !46, file: !46, line: 841, type: !548, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!548 = !DISubroutineType(types: !549)
!549 = !{!237, !237}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !551, file: !397, line: 216)
!551 = !DISubprogram(name: "lldiv", scope: !46, file: !46, line: 855, type: !552, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!552 = !DISubroutineType(types: !553)
!553 = !{!539, !237, !237}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !555, file: !397, line: 227)
!555 = !DISubprogram(name: "atoll", scope: !46, file: !46, line: 373, type: !556, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!556 = !DISubroutineType(types: !557)
!557 = !{!237, !293}
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !559, file: !397, line: 228)
!559 = !DISubprogram(name: "strtoll", scope: !46, file: !46, line: 200, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!560 = !DISubroutineType(types: !561)
!561 = !{!237, !487, !514, !49}
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !563, file: !397, line: 229)
!563 = !DISubprogram(name: "strtoull", scope: !46, file: !46, line: 205, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!564 = !DISubroutineType(types: !565)
!565 = !{!566, !487, !514, !49}
!566 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !568, file: !397, line: 231)
!568 = !DISubprogram(name: "strtof", scope: !46, file: !46, line: 123, type: !569, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!569 = !DISubroutineType(types: !570)
!570 = !{!115, !487, !514}
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !572, file: !397, line: 232)
!572 = !DISubprogram(name: "strtold", scope: !46, file: !46, line: 126, type: !573, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!573 = !DISubroutineType(types: !574)
!574 = !{!126, !487, !514}
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !539, file: !397, line: 240)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !545, file: !397, line: 242)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !547, file: !397, line: 244)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !579, file: !397, line: 245)
!579 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !5, file: !397, line: 213, type: !552, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !551, file: !397, line: 246)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !555, file: !397, line: 248)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !568, file: !397, line: 249)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !559, file: !397, line: 250)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !563, file: !397, line: 251)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !572, file: !397, line: 252)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !405, file: !587, line: 38)
!587 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "74812296ae1ebf65f0c19983efc04bc1")
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !417, file: !587, line: 39)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !452, file: !587, line: 40)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !422, file: !587, line: 43)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !497, file: !587, line: 46)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !395, file: !587, line: 51)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !399, file: !587, line: 52)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !595, file: !587, line: 54)
!595 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !44, file: !50, line: 79, type: !124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !424, file: !587, line: 55)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !427, file: !587, line: 56)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !431, file: !587, line: 57)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !435, file: !587, line: 58)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !446, file: !587, line: 59)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !579, file: !587, line: 60)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !456, file: !587, line: 61)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !460, file: !587, line: 62)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !465, file: !587, line: 63)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !469, file: !587, line: 64)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !473, file: !587, line: 65)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !477, file: !587, line: 67)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !481, file: !587, line: 68)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !489, file: !587, line: 69)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !493, file: !587, line: 71)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !499, file: !587, line: 72)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !503, file: !587, line: 73)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !507, file: !587, line: 74)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !511, file: !587, line: 75)
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !517, file: !587, line: 76)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !521, file: !587, line: 77)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !525, file: !587, line: 78)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !527, file: !587, line: 80)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !535, file: !587, line: 81)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !621, file: !622, line: 58)
!621 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !623, file: !622, line: 80, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!622 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "9bda7d21a11cfdb902745e8f6fa7810a")
!623 = !DINamespace(name: "__exception_ptr", scope: !44)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !623, entity: !625, file: !622, line: 74)
!625 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !44, file: !622, line: 70, type: !626, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!626 = !DISubroutineType(types: !627)
!627 = !{null, !621}
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !629, file: !630, line: 200)
!629 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !630, file: !630, line: 28, type: !54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!630 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !632, file: !630, line: 201)
!632 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !630, file: !630, line: 32, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !634, file: !630, line: 202)
!634 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !630, file: !630, line: 34, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !636, file: !630, line: 203)
!636 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !630, file: !630, line: 36, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !638, file: !630, line: 204)
!638 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !630, file: !630, line: 38, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !640, file: !630, line: 205)
!640 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !630, file: !630, line: 42, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !642, file: !630, line: 206)
!642 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !630, file: !630, line: 40, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !644, file: !630, line: 207)
!644 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !630, file: !630, line: 44, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !646, file: !630, line: 208)
!646 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !630, file: !630, line: 46, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !648, file: !630, line: 209)
!648 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !630, file: !630, line: 48, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !650, file: !630, line: 210)
!650 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !630, file: !630, line: 50, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !652, file: !630, line: 211)
!652 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !630, file: !630, line: 52, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !654, file: !630, line: 212)
!654 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !630, file: !630, line: 54, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !656, file: !630, line: 213)
!656 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !630, file: !630, line: 58, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !658, file: !630, line: 214)
!658 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !630, file: !630, line: 56, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !660, file: !630, line: 215)
!660 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !630, file: !630, line: 62, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !662, file: !630, line: 216)
!662 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !630, file: !630, line: 60, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !664, file: !630, line: 217)
!664 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !630, file: !630, line: 64, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !666, file: !630, line: 218)
!666 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !630, file: !630, line: 66, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !668, file: !630, line: 219)
!668 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !630, file: !630, line: 68, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !670, file: !630, line: 220)
!670 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !630, file: !630, line: 70, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !672, file: !630, line: 221)
!672 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !630, file: !630, line: 72, type: !191, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !674, file: !630, line: 222)
!674 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !630, file: !630, line: 74, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !676, file: !630, line: 223)
!676 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !630, file: !630, line: 76, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !678, file: !630, line: 224)
!678 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !630, file: !630, line: 78, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !680, file: !630, line: 225)
!680 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !630, file: !630, line: 80, type: !221, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !682, file: !630, line: 226)
!682 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !630, file: !630, line: 82, type: !683, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!683 = !DISubroutineType(types: !684)
!684 = !{!115, !115, !84}
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !686, file: !630, line: 227)
!686 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !630, file: !630, line: 84, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !688, file: !630, line: 228)
!688 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !630, file: !630, line: 86, type: !221, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !690, file: !630, line: 229)
!690 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !630, file: !630, line: 91, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!691 = !DISubroutineType(types: !692)
!692 = !{!693, !115}
!693 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !695, file: !630, line: 230)
!695 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !630, file: !630, line: 95, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!696 = !DISubroutineType(types: !697)
!697 = !{!693, !115, !115}
!698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !699, file: !630, line: 231)
!699 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !630, file: !630, line: 94, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !701, file: !630, line: 232)
!701 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !630, file: !630, line: 100, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !703, file: !630, line: 233)
!703 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !630, file: !630, line: 104, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !705, file: !630, line: 234)
!705 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !630, file: !630, line: 103, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !707, file: !630, line: 235)
!707 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !630, file: !630, line: 106, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !709, file: !630, line: 236)
!709 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !630, file: !630, line: 111, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !711, file: !630, line: 237)
!711 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !630, file: !630, line: 113, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !713, file: !630, line: 238)
!713 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !630, file: !630, line: 115, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !715, file: !630, line: 239)
!715 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !630, file: !630, line: 116, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !717, file: !630, line: 240)
!717 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !630, file: !630, line: 118, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !719, file: !630, line: 241)
!719 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !630, file: !630, line: 120, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !721, file: !630, line: 242)
!721 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !630, file: !630, line: 121, type: !548, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !723, file: !630, line: 243)
!723 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !630, file: !630, line: 123, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !725, file: !630, line: 244)
!725 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !630, file: !630, line: 133, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !727, file: !630, line: 245)
!727 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !630, file: !630, line: 125, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !729, file: !630, line: 246)
!729 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !630, file: !630, line: 127, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !731, file: !630, line: 247)
!731 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !630, file: !630, line: 129, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !733, file: !630, line: 248)
!733 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !630, file: !630, line: 131, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !735, file: !630, line: 249)
!735 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !630, file: !630, line: 135, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !737, file: !630, line: 250)
!737 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !630, file: !630, line: 137, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !739, file: !630, line: 251)
!739 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !630, file: !630, line: 138, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !741, file: !630, line: 252)
!741 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !630, file: !630, line: 140, type: !742, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!742 = !DISubroutineType(types: !743)
!743 = !{!115, !115, !744}
!744 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !746, file: !630, line: 253)
!746 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !630, file: !630, line: 141, type: !291, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !748, file: !630, line: 254)
!748 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !630, file: !630, line: 142, type: !298, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !750, file: !630, line: 255)
!750 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !630, file: !630, line: 144, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !752, file: !630, line: 256)
!752 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !630, file: !630, line: 146, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !754, file: !630, line: 257)
!754 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !630, file: !630, line: 150, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !756, file: !630, line: 258)
!756 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !630, file: !630, line: 152, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !758, file: !630, line: 259)
!758 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !630, file: !630, line: 154, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !760, file: !630, line: 260)
!760 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !630, file: !630, line: 156, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !762, file: !630, line: 261)
!762 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !630, file: !630, line: 158, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !764, file: !630, line: 262)
!764 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !630, file: !630, line: 160, type: !362, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !766, file: !630, line: 263)
!766 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !630, file: !630, line: 162, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !768, file: !630, line: 264)
!768 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !630, file: !630, line: 167, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !770, file: !630, line: 265)
!770 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !630, file: !630, line: 169, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !772, file: !630, line: 266)
!772 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !630, file: !630, line: 171, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !774, file: !630, line: 267)
!774 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !630, file: !630, line: 173, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !776, file: !630, line: 268)
!776 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !630, file: !630, line: 175, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !778, file: !630, line: 269)
!778 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !630, file: !630, line: 177, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !780, file: !630, line: 270)
!780 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !630, file: !630, line: 179, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !782, file: !630, line: 271)
!782 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !630, file: !630, line: 181, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !784, file: !786, line: 729)
!784 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !785, file: !785, line: 188, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!785 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "77b108a711ff1d970d6aaeeab7921660")
!786 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "0af09435178b3f6de185f06c3a9cbb63")
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !788, file: !786, line: 730)
!788 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !785, file: !785, line: 191, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !790, file: !786, line: 731)
!790 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !785, file: !785, line: 194, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !792, file: !786, line: 732)
!792 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !785, file: !785, line: 197, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !794, file: !786, line: 733)
!794 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !785, file: !785, line: 200, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !796, file: !786, line: 734)
!796 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !785, file: !785, line: 203, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !798, file: !786, line: 735)
!798 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !785, file: !785, line: 206, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !800, file: !786, line: 736)
!800 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !785, file: !785, line: 209, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !802, file: !786, line: 737)
!802 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !785, file: !785, line: 212, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !804, file: !786, line: 738)
!804 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !785, file: !785, line: 215, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !806, file: !786, line: 739)
!806 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !785, file: !785, line: 218, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !808, file: !786, line: 740)
!808 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !785, file: !785, line: 221, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !810, file: !786, line: 741)
!810 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !785, file: !785, line: 233, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !812, file: !786, line: 742)
!812 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !785, file: !785, line: 242, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !814, file: !786, line: 743)
!814 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !785, file: !785, line: 251, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !816, file: !786, line: 744)
!816 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !785, file: !785, line: 254, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !818, file: !786, line: 745)
!818 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !785, file: !785, line: 257, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !820, file: !786, line: 746)
!820 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !785, file: !785, line: 260, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !822, file: !786, line: 747)
!822 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !785, file: !785, line: 263, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !824, file: !786, line: 748)
!824 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !785, file: !785, line: 269, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !826, file: !786, line: 749)
!826 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !785, file: !785, line: 272, type: !191, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !828, file: !786, line: 750)
!828 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !785, file: !785, line: 277, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !830, file: !786, line: 751)
!830 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !785, file: !785, line: 280, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !832, file: !786, line: 752)
!832 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !785, file: !785, line: 283, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !834, file: !786, line: 753)
!834 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !785, file: !785, line: 286, type: !683, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !836, file: !786, line: 754)
!836 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !785, file: !785, line: 299, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !838, file: !786, line: 755)
!838 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !785, file: !785, line: 302, type: !221, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !840, file: !786, line: 756)
!840 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !785, file: !785, line: 341, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !842, file: !786, line: 757)
!842 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !785, file: !785, line: 344, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !844, file: !786, line: 758)
!844 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !785, file: !785, line: 347, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !846, file: !786, line: 759)
!846 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !785, file: !785, line: 350, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !848, file: !786, line: 760)
!848 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !785, file: !785, line: 353, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !850, file: !786, line: 761)
!850 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !785, file: !785, line: 356, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !852, file: !786, line: 762)
!852 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !785, file: !785, line: 359, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !854, file: !786, line: 763)
!854 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !785, file: !785, line: 365, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !856, file: !786, line: 764)
!856 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !785, file: !785, line: 368, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !858, file: !786, line: 765)
!858 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !785, file: !785, line: 371, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !860, file: !786, line: 766)
!860 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !785, file: !785, line: 374, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !862, file: !786, line: 767)
!862 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !785, file: !785, line: 377, type: !742, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !864, file: !786, line: 768)
!864 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !785, file: !785, line: 413, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !866, file: !786, line: 769)
!866 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !785, file: !785, line: 416, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !868, file: !786, line: 771)
!868 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !785, file: !785, line: 449, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !870, file: !786, line: 772)
!870 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !785, file: !785, line: 474, type: !149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !872, file: !786, line: 773)
!872 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !785, file: !785, line: 479, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !874, file: !786, line: 774)
!874 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !785, file: !785, line: 495, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !876, file: !786, line: 775)
!876 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !785, file: !785, line: 520, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !878, file: !786, line: 776)
!878 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !785, file: !785, line: 526, type: !362, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !880, file: !786, line: 777)
!880 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !785, file: !785, line: 532, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !882, file: !786, line: 778)
!882 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !785, file: !785, line: 560, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !884, file: !786, line: 779)
!884 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !785, file: !785, line: 563, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !886, file: !786, line: 780)
!886 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !785, file: !785, line: 569, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !888, file: !786, line: 781)
!888 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !785, file: !785, line: 572, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !890, file: !786, line: 782)
!890 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !785, file: !785, line: 575, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !892, file: !786, line: 783)
!892 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !785, file: !785, line: 578, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !894, file: !786, line: 784)
!894 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !785, file: !785, line: 581, type: !120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !896, file: !911, line: 64)
!896 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !897, line: 6, baseType: !898)
!897 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!898 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !899, line: 21, baseType: !900)
!899 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!900 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !899, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !901, identifier: "_ZTS11__mbstate_t")
!901 = !{!902, !903}
!902 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !900, file: !899, line: 15, baseType: !49, size: 32)
!903 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !900, file: !899, line: 20, baseType: !904, size: 32, offset: 32)
!904 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !900, file: !899, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !905, identifier: "_ZTSN11__mbstate_tUt_E")
!905 = !{!906, !907}
!906 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !904, file: !899, line: 18, baseType: !6, size: 32)
!907 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !904, file: !899, line: 19, baseType: !908, size: 32)
!908 = !DICompositeType(tag: DW_TAG_array_type, baseType: !295, size: 32, elements: !909)
!909 = !{!910}
!910 = !DISubrange(count: 4)
!911 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cwchar", directory: "")
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !913, file: !911, line: 141)
!913 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !914, line: 20, baseType: !6)
!914 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !916, file: !911, line: 143)
!916 = !DISubprogram(name: "btowc", scope: !917, file: !917, line: 318, type: !918, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!917 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "5c0512b032e303d7adfb2a47454ecb1c")
!918 = !DISubroutineType(types: !919)
!919 = !{!913, !49}
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !921, file: !911, line: 144)
!921 = !DISubprogram(name: "fgetwc", scope: !917, file: !917, line: 727, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!922 = !DISubroutineType(types: !923)
!923 = !{!913, !924}
!924 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !925, size: 64)
!925 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !926, line: 5, baseType: !927)
!926 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!927 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !928, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !929, identifier: "_ZTS8_IO_FILE")
!928 = !DIFile(filename: "/usr/include/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "58de959587374b9ee900baa441e1355b")
!929 = !{!930, !931, !932, !933, !934, !935, !936, !937, !938, !939, !940, !941, !942, !945, !947, !948, !949, !951, !953, !955, !959, !962, !964, !967, !970, !971, !972, !973, !974}
!930 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !927, file: !928, line: 51, baseType: !49, size: 32)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !927, file: !928, line: 54, baseType: !463, size: 64, offset: 64)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !927, file: !928, line: 55, baseType: !463, size: 64, offset: 128)
!933 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !927, file: !928, line: 56, baseType: !463, size: 64, offset: 192)
!934 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !927, file: !928, line: 57, baseType: !463, size: 64, offset: 256)
!935 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !927, file: !928, line: 58, baseType: !463, size: 64, offset: 320)
!936 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !927, file: !928, line: 59, baseType: !463, size: 64, offset: 384)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !927, file: !928, line: 60, baseType: !463, size: 64, offset: 448)
!938 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !927, file: !928, line: 61, baseType: !463, size: 64, offset: 512)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !927, file: !928, line: 64, baseType: !463, size: 64, offset: 576)
!940 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !927, file: !928, line: 65, baseType: !463, size: 64, offset: 640)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !927, file: !928, line: 66, baseType: !463, size: 64, offset: 704)
!942 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !927, file: !928, line: 68, baseType: !943, size: 64, offset: 768)
!943 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !944, size: 64)
!944 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !928, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!945 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !927, file: !928, line: 70, baseType: !946, size: 64, offset: 832)
!946 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !927, size: 64)
!947 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !927, file: !928, line: 72, baseType: !49, size: 32, offset: 896)
!948 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !927, file: !928, line: 73, baseType: !49, size: 32, offset: 928)
!949 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !927, file: !928, line: 74, baseType: !950, size: 64, offset: 960)
!950 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !35, line: 150, baseType: !274)
!951 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !927, file: !928, line: 77, baseType: !952, size: 16, offset: 1024)
!952 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!953 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !927, file: !928, line: 78, baseType: !954, size: 8, offset: 1040)
!954 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!955 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !927, file: !928, line: 79, baseType: !956, size: 8, offset: 1048)
!956 = !DICompositeType(tag: DW_TAG_array_type, baseType: !295, size: 8, elements: !957)
!957 = !{!958}
!958 = !DISubrange(count: 1)
!959 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !927, file: !928, line: 81, baseType: !960, size: 64, offset: 1088)
!960 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !961, size: 64)
!961 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !928, line: 43, baseType: null)
!962 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !927, file: !928, line: 89, baseType: !963, size: 64, offset: 1152)
!963 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !35, line: 151, baseType: !274)
!964 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !927, file: !928, line: 91, baseType: !965, size: 64, offset: 1216)
!965 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !966, size: 64)
!966 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !928, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!967 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !927, file: !928, line: 92, baseType: !968, size: 64, offset: 1280)
!968 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !969, size: 64)
!969 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !928, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!970 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !927, file: !928, line: 93, baseType: !946, size: 64, offset: 1344)
!971 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !927, file: !928, line: 94, baseType: !412, size: 64, offset: 1408)
!972 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !927, file: !928, line: 95, baseType: !413, size: 64, offset: 1472)
!973 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !927, file: !928, line: 96, baseType: !49, size: 32, offset: 1536)
!974 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !927, file: !928, line: 98, baseType: !975, size: 160, offset: 1568)
!975 = !DICompositeType(tag: DW_TAG_array_type, baseType: !295, size: 160, elements: !976)
!976 = !{!977}
!977 = !DISubrange(count: 20)
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !979, file: !911, line: 145)
!979 = !DISubprogram(name: "fgetws", scope: !917, file: !917, line: 756, type: !980, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!980 = !DISubroutineType(types: !981)
!981 = !{!485, !484, !49, !982}
!982 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !924)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !984, file: !911, line: 146)
!984 = !DISubprogram(name: "fputwc", scope: !917, file: !917, line: 741, type: !985, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!985 = !DISubroutineType(types: !986)
!986 = !{!913, !486, !924}
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !988, file: !911, line: 147)
!988 = !DISubprogram(name: "fputws", scope: !917, file: !917, line: 763, type: !989, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!989 = !DISubroutineType(types: !990)
!990 = !{!49, !531, !982}
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !992, file: !911, line: 148)
!992 = !DISubprogram(name: "fwide", scope: !917, file: !917, line: 573, type: !993, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!993 = !DISubroutineType(types: !994)
!994 = !{!49, !924, !49}
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !996, file: !911, line: 149)
!996 = !DISubprogram(name: "fwprintf", scope: !917, file: !917, line: 580, type: !997, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!997 = !DISubroutineType(types: !998)
!998 = !{!49, !982, !531, null}
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1000, file: !911, line: 150)
!1000 = !DISubprogram(name: "fwscanf", scope: !917, file: !917, line: 621, type: !997, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1002, file: !911, line: 151)
!1002 = !DISubprogram(name: "getwc", scope: !917, file: !917, line: 728, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1004, file: !911, line: 152)
!1004 = !DISubprogram(name: "getwchar", scope: !917, file: !917, line: 734, type: !1005, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1005 = !DISubroutineType(types: !1006)
!1006 = !{!913}
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1008, file: !911, line: 153)
!1008 = !DISubprogram(name: "mbrlen", scope: !917, file: !917, line: 329, type: !1009, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1009 = !DISubroutineType(types: !1010)
!1010 = !{!413, !487, !413, !1011}
!1011 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1012)
!1012 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !896, size: 64)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1014, file: !911, line: 154)
!1014 = !DISubprogram(name: "mbrtowc", scope: !917, file: !917, line: 296, type: !1015, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!413, !484, !487, !413, !1011}
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1018, file: !911, line: 155)
!1018 = !DISubprogram(name: "mbsinit", scope: !917, file: !917, line: 292, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!49, !1021}
!1021 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1022, size: 64)
!1022 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !896)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1024, file: !911, line: 156)
!1024 = !DISubprogram(name: "mbsrtowcs", scope: !917, file: !917, line: 337, type: !1025, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{!413, !484, !1027, !413, !1011}
!1027 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1028)
!1028 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !293, size: 64)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1030, file: !911, line: 157)
!1030 = !DISubprogram(name: "putwc", scope: !917, file: !917, line: 742, type: !985, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1032, file: !911, line: 158)
!1032 = !DISubprogram(name: "putwchar", scope: !917, file: !917, line: 748, type: !1033, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{!913, !486}
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1036, file: !911, line: 160)
!1036 = !DISubprogram(name: "swprintf", scope: !917, file: !917, line: 590, type: !1037, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1037 = !DISubroutineType(types: !1038)
!1038 = !{!49, !484, !413, !531, null}
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1040, file: !911, line: 162)
!1040 = !DISubprogram(name: "swscanf", scope: !917, file: !917, line: 631, type: !1041, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{!49, !531, !531, null}
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1044, file: !911, line: 163)
!1044 = !DISubprogram(name: "ungetwc", scope: !917, file: !917, line: 771, type: !1045, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!913, !913, !924}
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1048, file: !911, line: 164)
!1048 = !DISubprogram(name: "vfwprintf", scope: !917, file: !917, line: 598, type: !1049, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!49, !982, !531, !1051}
!1051 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1052, line: 32, baseType: !1053)
!1052 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stdarg.h", directory: "", checksumkind: CSK_MD5, checksum: "4de3cbd931b589d291e5c39387aecf82")
!1053 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1054, baseType: !463)
!1054 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard")
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1056, file: !911, line: 166)
!1056 = !DISubprogram(name: "vfwscanf", scope: !917, file: !917, line: 673, type: !1049, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1058, file: !911, line: 169)
!1058 = !DISubprogram(name: "vswprintf", scope: !917, file: !917, line: 611, type: !1059, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1059 = !DISubroutineType(types: !1060)
!1060 = !{!49, !484, !413, !531, !1051}
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1062, file: !911, line: 172)
!1062 = !DISubprogram(name: "vswscanf", scope: !917, file: !917, line: 685, type: !1063, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1063 = !DISubroutineType(types: !1064)
!1064 = !{!49, !531, !531, !1051}
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1066, file: !911, line: 174)
!1066 = !DISubprogram(name: "vwprintf", scope: !917, file: !917, line: 606, type: !1067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!49, !531, !1051}
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1070, file: !911, line: 176)
!1070 = !DISubprogram(name: "vwscanf", scope: !917, file: !917, line: 681, type: !1067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1072, file: !911, line: 178)
!1072 = !DISubprogram(name: "wcrtomb", scope: !917, file: !917, line: 301, type: !1073, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1073 = !DISubroutineType(types: !1074)
!1074 = !{!413, !530, !486, !1011}
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1076, file: !911, line: 179)
!1076 = !DISubprogram(name: "wcscat", scope: !917, file: !917, line: 97, type: !1077, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1077 = !DISubroutineType(types: !1078)
!1078 = !{!485, !484, !531}
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1080, file: !911, line: 180)
!1080 = !DISubprogram(name: "wcscmp", scope: !917, file: !917, line: 106, type: !1081, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1081 = !DISubroutineType(types: !1082)
!1082 = !{!49, !532, !532}
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1084, file: !911, line: 181)
!1084 = !DISubprogram(name: "wcscoll", scope: !917, file: !917, line: 131, type: !1081, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1086, file: !911, line: 182)
!1086 = !DISubprogram(name: "wcscpy", scope: !917, file: !917, line: 87, type: !1077, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1088, file: !911, line: 183)
!1088 = !DISubprogram(name: "wcscspn", scope: !917, file: !917, line: 187, type: !1089, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1089 = !DISubroutineType(types: !1090)
!1090 = !{!413, !532, !532}
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1092, file: !911, line: 184)
!1092 = !DISubprogram(name: "wcsftime", scope: !917, file: !917, line: 835, type: !1093, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1093 = !DISubroutineType(types: !1094)
!1094 = !{!413, !484, !413, !531, !1095}
!1095 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1096)
!1096 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1097, size: 64)
!1097 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1098)
!1098 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1099, line: 7, size: 448, flags: DIFlagTypePassByValue, elements: !1100, identifier: "_ZTS2tm")
!1099 = !DIFile(filename: "/usr/include/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!1100 = !{!1101, !1102, !1103, !1104, !1105, !1106, !1107, !1108, !1109, !1110, !1111}
!1101 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !1098, file: !1099, line: 9, baseType: !49, size: 32)
!1102 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !1098, file: !1099, line: 10, baseType: !49, size: 32, offset: 32)
!1103 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !1098, file: !1099, line: 11, baseType: !49, size: 32, offset: 64)
!1104 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !1098, file: !1099, line: 12, baseType: !49, size: 32, offset: 96)
!1105 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !1098, file: !1099, line: 13, baseType: !49, size: 32, offset: 128)
!1106 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !1098, file: !1099, line: 14, baseType: !49, size: 32, offset: 160)
!1107 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !1098, file: !1099, line: 15, baseType: !49, size: 32, offset: 192)
!1108 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !1098, file: !1099, line: 16, baseType: !49, size: 32, offset: 224)
!1109 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !1098, file: !1099, line: 17, baseType: !49, size: 32, offset: 256)
!1110 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !1098, file: !1099, line: 20, baseType: !274, size: 64, offset: 320)
!1111 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !1098, file: !1099, line: 21, baseType: !293, size: 64, offset: 384)
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1113, file: !911, line: 185)
!1113 = !DISubprogram(name: "wcslen", scope: !917, file: !917, line: 222, type: !1114, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1114 = !DISubroutineType(types: !1115)
!1115 = !{!413, !532}
!1116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1117, file: !911, line: 186)
!1117 = !DISubprogram(name: "wcsncat", scope: !917, file: !917, line: 101, type: !1118, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1118 = !DISubroutineType(types: !1119)
!1119 = !{!485, !484, !531, !413}
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1121, file: !911, line: 187)
!1121 = !DISubprogram(name: "wcsncmp", scope: !917, file: !917, line: 109, type: !1122, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1122 = !DISubroutineType(types: !1123)
!1123 = !{!49, !532, !532, !413}
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1125, file: !911, line: 188)
!1125 = !DISubprogram(name: "wcsncpy", scope: !917, file: !917, line: 92, type: !1118, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1127, file: !911, line: 189)
!1127 = !DISubprogram(name: "wcsrtombs", scope: !917, file: !917, line: 343, type: !1128, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1128 = !DISubroutineType(types: !1129)
!1129 = !{!413, !530, !1130, !413, !1011}
!1130 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1131)
!1131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !532, size: 64)
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1133, file: !911, line: 190)
!1133 = !DISubprogram(name: "wcsspn", scope: !917, file: !917, line: 191, type: !1089, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1135, file: !911, line: 191)
!1135 = !DISubprogram(name: "wcstod", scope: !917, file: !917, line: 377, type: !1136, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!56, !531, !1138}
!1138 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1139)
!1139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !485, size: 64)
!1140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1141, file: !911, line: 193)
!1141 = !DISubprogram(name: "wcstof", scope: !917, file: !917, line: 382, type: !1142, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1142 = !DISubroutineType(types: !1143)
!1143 = !{!115, !531, !1138}
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1145, file: !911, line: 195)
!1145 = !DISubprogram(name: "wcstok", scope: !917, file: !917, line: 217, type: !1146, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1146 = !DISubroutineType(types: !1147)
!1147 = !{!485, !484, !531, !1138}
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1149, file: !911, line: 196)
!1149 = !DISubprogram(name: "wcstol", scope: !917, file: !917, line: 428, type: !1150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1150 = !DISubroutineType(types: !1151)
!1151 = !{!274, !531, !1138, !49}
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1153, file: !911, line: 197)
!1153 = !DISubprogram(name: "wcstoul", scope: !917, file: !917, line: 433, type: !1154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1154 = !DISubroutineType(types: !1155)
!1155 = !{!415, !531, !1138, !49}
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1157, file: !911, line: 198)
!1157 = !DISubprogram(name: "wcsxfrm", scope: !917, file: !917, line: 135, type: !1158, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1158 = !DISubroutineType(types: !1159)
!1159 = !{!413, !484, !531, !413}
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1161, file: !911, line: 199)
!1161 = !DISubprogram(name: "wctob", scope: !917, file: !917, line: 324, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{!49, !913}
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1165, file: !911, line: 200)
!1165 = !DISubprogram(name: "wmemcmp", scope: !917, file: !917, line: 258, type: !1122, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1167, file: !911, line: 201)
!1167 = !DISubprogram(name: "wmemcpy", scope: !917, file: !917, line: 262, type: !1118, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1169, file: !911, line: 202)
!1169 = !DISubprogram(name: "wmemmove", scope: !917, file: !917, line: 267, type: !1170, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1170 = !DISubroutineType(types: !1171)
!1171 = !{!485, !485, !532, !413}
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1173, file: !911, line: 203)
!1173 = !DISubprogram(name: "wmemset", scope: !917, file: !917, line: 271, type: !1174, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1174 = !DISubroutineType(types: !1175)
!1175 = !{!485, !485, !486, !413}
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1177, file: !911, line: 204)
!1177 = !DISubprogram(name: "wprintf", scope: !917, file: !917, line: 587, type: !1178, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1178 = !DISubroutineType(types: !1179)
!1179 = !{!49, !531, null}
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1181, file: !911, line: 205)
!1181 = !DISubprogram(name: "wscanf", scope: !917, file: !917, line: 628, type: !1178, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1183, file: !911, line: 206)
!1183 = !DISubprogram(name: "wcschr", scope: !917, file: !917, line: 164, type: !1184, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1184 = !DISubroutineType(types: !1185)
!1185 = !{!485, !532, !486}
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1187, file: !911, line: 207)
!1187 = !DISubprogram(name: "wcspbrk", scope: !917, file: !917, line: 201, type: !1188, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1188 = !DISubroutineType(types: !1189)
!1189 = !{!485, !532, !532}
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1191, file: !911, line: 208)
!1191 = !DISubprogram(name: "wcsrchr", scope: !917, file: !917, line: 174, type: !1184, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1193, file: !911, line: 209)
!1193 = !DISubprogram(name: "wcsstr", scope: !917, file: !917, line: 212, type: !1188, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1195, file: !911, line: 210)
!1195 = !DISubprogram(name: "wmemchr", scope: !917, file: !917, line: 253, type: !1196, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1196 = !DISubroutineType(types: !1197)
!1197 = !{!485, !532, !486, !413}
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1199, file: !911, line: 251)
!1199 = !DISubprogram(name: "wcstold", scope: !917, file: !917, line: 384, type: !1200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1200 = !DISubroutineType(types: !1201)
!1201 = !{!126, !531, !1138}
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1203, file: !911, line: 260)
!1203 = !DISubprogram(name: "wcstoll", scope: !917, file: !917, line: 441, type: !1204, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1204 = !DISubroutineType(types: !1205)
!1205 = !{!237, !531, !1138, !49}
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1207, file: !911, line: 261)
!1207 = !DISubprogram(name: "wcstoull", scope: !917, file: !917, line: 448, type: !1208, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1208 = !DISubroutineType(types: !1209)
!1209 = !{!566, !531, !1138, !49}
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1199, file: !911, line: 267)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1203, file: !911, line: 268)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1207, file: !911, line: 269)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1141, file: !911, line: 283)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1056, file: !911, line: 286)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1062, file: !911, line: 289)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1070, file: !911, line: 292)
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1199, file: !911, line: 296)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1203, file: !911, line: 297)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1207, file: !911, line: 298)
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1221, file: !1224, line: 47)
!1221 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1222, line: 24, baseType: !1223)
!1222 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "457547631e07cd24d9a14c8410e28e57")
!1223 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !35, line: 36, baseType: !954)
!1224 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdint", directory: "")
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1226, file: !1224, line: 48)
!1226 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1222, line: 25, baseType: !1227)
!1227 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !35, line: 38, baseType: !1228)
!1228 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1230, file: !1224, line: 49)
!1230 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1222, line: 26, baseType: !1231)
!1231 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !35, line: 40, baseType: !49)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1233, file: !1224, line: 50)
!1233 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1222, line: 27, baseType: !1234)
!1234 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !35, line: 43, baseType: !274)
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1236, file: !1224, line: 52)
!1236 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1237, line: 58, baseType: !954)
!1237 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "5faa52c8a2d48b1d936594c77c73ce42")
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1239, file: !1224, line: 53)
!1239 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1237, line: 60, baseType: !274)
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1241, file: !1224, line: 54)
!1241 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1237, line: 61, baseType: !274)
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1243, file: !1224, line: 55)
!1243 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1237, line: 62, baseType: !274)
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1245, file: !1224, line: 57)
!1245 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1237, line: 43, baseType: !1246)
!1246 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !35, line: 51, baseType: !1223)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1248, file: !1224, line: 58)
!1248 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1237, line: 44, baseType: !1249)
!1249 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !35, line: 53, baseType: !1227)
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1251, file: !1224, line: 59)
!1251 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1237, line: 45, baseType: !1252)
!1252 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !35, line: 55, baseType: !1231)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1254, file: !1224, line: 60)
!1254 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1237, line: 46, baseType: !1255)
!1255 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !35, line: 57, baseType: !1234)
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1257, file: !1224, line: 62)
!1257 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1237, line: 101, baseType: !1258)
!1258 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !35, line: 71, baseType: !274)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1260, file: !1224, line: 63)
!1260 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1237, line: 87, baseType: !274)
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1262, file: !1224, line: 65)
!1262 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !33, line: 24, baseType: !1263)
!1263 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !35, line: 37, baseType: !1264)
!1264 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1266, file: !1224, line: 66)
!1266 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !33, line: 25, baseType: !1267)
!1267 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !35, line: 39, baseType: !952)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !32, file: !1224, line: 67)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1270, file: !1224, line: 68)
!1270 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !33, line: 27, baseType: !1271)
!1271 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !35, line: 44, baseType: !415)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1273, file: !1224, line: 70)
!1273 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1237, line: 71, baseType: !1264)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1275, file: !1224, line: 71)
!1275 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1237, line: 73, baseType: !415)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1277, file: !1224, line: 72)
!1277 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1237, line: 74, baseType: !415)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1279, file: !1224, line: 73)
!1279 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1237, line: 75, baseType: !415)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1281, file: !1224, line: 75)
!1281 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1237, line: 49, baseType: !1282)
!1282 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !35, line: 52, baseType: !1263)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1284, file: !1224, line: 76)
!1284 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1237, line: 50, baseType: !1285)
!1285 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !35, line: 54, baseType: !1267)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1287, file: !1224, line: 77)
!1287 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1237, line: 51, baseType: !1288)
!1288 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !35, line: 56, baseType: !34)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1290, file: !1224, line: 78)
!1290 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1237, line: 52, baseType: !1291)
!1291 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !35, line: 58, baseType: !1271)
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1293, file: !1224, line: 80)
!1293 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1237, line: 102, baseType: !1294)
!1294 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !35, line: 72, baseType: !415)
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1296, file: !1224, line: 81)
!1296 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1237, line: 90, baseType: !415)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1298, file: !1300, line: 53)
!1298 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1299, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1299 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "0595275e3f5b502d28f7cd61a0dff888")
!1300 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/clocale", directory: "")
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1302, file: !1300, line: 54)
!1302 = !DISubprogram(name: "setlocale", scope: !1299, file: !1299, line: 122, type: !1303, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!463, !49, !293}
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1306, file: !1300, line: 55)
!1306 = !DISubprogram(name: "localeconv", scope: !1299, file: !1299, line: 125, type: !1307, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1307 = !DISubroutineType(types: !1308)
!1308 = !{!1309}
!1309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1298, size: 64)
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1311, file: !1313, line: 64)
!1311 = !DISubprogram(name: "isalnum", scope: !1312, file: !1312, line: 108, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1312 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "c67c809b09ef8ea9c273687bc20a7fd3")
!1313 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cctype", directory: "")
!1314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1315, file: !1313, line: 65)
!1315 = !DISubprogram(name: "isalpha", scope: !1312, file: !1312, line: 109, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1317, file: !1313, line: 66)
!1317 = !DISubprogram(name: "iscntrl", scope: !1312, file: !1312, line: 110, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1319, file: !1313, line: 67)
!1319 = !DISubprogram(name: "isdigit", scope: !1312, file: !1312, line: 111, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1321, file: !1313, line: 68)
!1321 = !DISubprogram(name: "isgraph", scope: !1312, file: !1312, line: 113, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1323, file: !1313, line: 69)
!1323 = !DISubprogram(name: "islower", scope: !1312, file: !1312, line: 112, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1325, file: !1313, line: 70)
!1325 = !DISubprogram(name: "isprint", scope: !1312, file: !1312, line: 114, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1327, file: !1313, line: 71)
!1327 = !DISubprogram(name: "ispunct", scope: !1312, file: !1312, line: 115, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1329, file: !1313, line: 72)
!1329 = !DISubprogram(name: "isspace", scope: !1312, file: !1312, line: 116, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1331, file: !1313, line: 73)
!1331 = !DISubprogram(name: "isupper", scope: !1312, file: !1312, line: 117, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1333, file: !1313, line: 74)
!1333 = !DISubprogram(name: "isxdigit", scope: !1312, file: !1312, line: 118, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1335, file: !1313, line: 75)
!1335 = !DISubprogram(name: "tolower", scope: !1312, file: !1312, line: 122, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1337, file: !1313, line: 76)
!1337 = !DISubprogram(name: "toupper", scope: !1312, file: !1312, line: 125, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1339, file: !1313, line: 87)
!1339 = !DISubprogram(name: "isblank", scope: !1312, file: !1312, line: 130, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1341, file: !1343, line: 98)
!1341 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1342, line: 7, baseType: !927)
!1342 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1343 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdio", directory: "")
!1344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1345, file: !1343, line: 99)
!1345 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1346, line: 84, baseType: !1347)
!1346 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "75d393d9743f4e6c39653f794c599a10")
!1347 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1348, line: 14, baseType: !1349)
!1348 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1349 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1348, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1351, file: !1343, line: 101)
!1351 = !DISubprogram(name: "clearerr", scope: !1346, file: !1346, line: 763, type: !1352, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1352 = !DISubroutineType(types: !1353)
!1353 = !{null, !1354}
!1354 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1341, size: 64)
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1356, file: !1343, line: 102)
!1356 = !DISubprogram(name: "fclose", scope: !1346, file: !1346, line: 213, type: !1357, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1357 = !DISubroutineType(types: !1358)
!1358 = !{!49, !1354}
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1360, file: !1343, line: 103)
!1360 = !DISubprogram(name: "feof", scope: !1346, file: !1346, line: 765, type: !1357, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1362, file: !1343, line: 104)
!1362 = !DISubprogram(name: "ferror", scope: !1346, file: !1346, line: 767, type: !1357, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1364, file: !1343, line: 105)
!1364 = !DISubprogram(name: "fflush", scope: !1346, file: !1346, line: 218, type: !1357, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1366, file: !1343, line: 106)
!1366 = !DISubprogram(name: "fgetc", scope: !1346, file: !1346, line: 491, type: !1357, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1368, file: !1343, line: 107)
!1368 = !DISubprogram(name: "fgetpos", scope: !1346, file: !1346, line: 737, type: !1369, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1369 = !DISubroutineType(types: !1370)
!1370 = !{!49, !1371, !1372}
!1371 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1354)
!1372 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1373)
!1373 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1345, size: 64)
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1375, file: !1343, line: 108)
!1375 = !DISubprogram(name: "fgets", scope: !1346, file: !1346, line: 570, type: !1376, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1376 = !DISubroutineType(types: !1377)
!1377 = !{!463, !530, !49, !1371}
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1379, file: !1343, line: 109)
!1379 = !DISubprogram(name: "fopen", scope: !1346, file: !1346, line: 246, type: !1380, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1380 = !DISubroutineType(types: !1381)
!1381 = !{!1354, !487, !487}
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1383, file: !1343, line: 110)
!1383 = !DISubprogram(name: "fprintf", scope: !1346, file: !1346, line: 326, type: !1384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{!49, !1371, !487, null}
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1387, file: !1343, line: 111)
!1387 = !DISubprogram(name: "fputc", scope: !1346, file: !1346, line: 527, type: !1388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1388 = !DISubroutineType(types: !1389)
!1389 = !{!49, !49, !1354}
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1391, file: !1343, line: 112)
!1391 = !DISubprogram(name: "fputs", scope: !1346, file: !1346, line: 632, type: !1392, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1392 = !DISubroutineType(types: !1393)
!1393 = !{!49, !487, !1371}
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1395, file: !1343, line: 113)
!1395 = !DISubprogram(name: "fread", scope: !1346, file: !1346, line: 652, type: !1396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1396 = !DISubroutineType(types: !1397)
!1397 = !{!413, !1398, !413, !413, !1371}
!1398 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !412)
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1400, file: !1343, line: 114)
!1400 = !DISubprogram(name: "freopen", scope: !1346, file: !1346, line: 252, type: !1401, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1401 = !DISubroutineType(types: !1402)
!1402 = !{!1354, !487, !487, !1371}
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1404, file: !1343, line: 115)
!1404 = !DISubprogram(name: "fscanf", scope: !1346, file: !1346, line: 391, type: !1384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1406, file: !1343, line: 116)
!1406 = !DISubprogram(name: "fseek", scope: !1346, file: !1346, line: 690, type: !1407, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1407 = !DISubroutineType(types: !1408)
!1408 = !{!49, !1354, !274, !49}
!1409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1410, file: !1343, line: 117)
!1410 = !DISubprogram(name: "fsetpos", scope: !1346, file: !1346, line: 742, type: !1411, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1411 = !DISubroutineType(types: !1412)
!1412 = !{!49, !1354, !1413}
!1413 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1414, size: 64)
!1414 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1345)
!1415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1416, file: !1343, line: 118)
!1416 = !DISubprogram(name: "ftell", scope: !1346, file: !1346, line: 695, type: !1417, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1417 = !DISubroutineType(types: !1418)
!1418 = !{!274, !1354}
!1419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1420, file: !1343, line: 119)
!1420 = !DISubprogram(name: "fwrite", scope: !1346, file: !1346, line: 658, type: !1421, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1421 = !DISubroutineType(types: !1422)
!1422 = !{!413, !1423, !413, !413, !1371}
!1423 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !439)
!1424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1425, file: !1343, line: 120)
!1425 = !DISubprogram(name: "getc", scope: !1346, file: !1346, line: 492, type: !1357, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1427, file: !1343, line: 121)
!1427 = !DISubprogram(name: "getchar", scope: !1428, file: !1428, line: 47, type: !500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1428 = !DIFile(filename: "/usr/include/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "81194b3c12a36527b791b06f928a2e25")
!1429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1430, file: !1343, line: 126)
!1430 = !DISubprogram(name: "perror", scope: !1346, file: !1346, line: 781, type: !1431, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1431 = !DISubroutineType(types: !1432)
!1432 = !{null, !293}
!1433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1434, file: !1343, line: 127)
!1434 = !DISubprogram(name: "printf", scope: !1346, file: !1346, line: 332, type: !1435, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1435 = !DISubroutineType(types: !1436)
!1436 = !{!49, !487, null}
!1437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1438, file: !1343, line: 128)
!1438 = !DISubprogram(name: "putc", scope: !1346, file: !1346, line: 528, type: !1388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1440, file: !1343, line: 129)
!1440 = !DISubprogram(name: "putchar", scope: !1428, file: !1428, line: 82, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1442, file: !1343, line: 130)
!1442 = !DISubprogram(name: "puts", scope: !1346, file: !1346, line: 638, type: !428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1444, file: !1343, line: 131)
!1444 = !DISubprogram(name: "remove", scope: !1346, file: !1346, line: 146, type: !428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1446, file: !1343, line: 132)
!1446 = !DISubprogram(name: "rename", scope: !1346, file: !1346, line: 148, type: !1447, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{!49, !293, !293}
!1449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1450, file: !1343, line: 133)
!1450 = !DISubprogram(name: "rewind", scope: !1346, file: !1346, line: 700, type: !1352, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1452, file: !1343, line: 134)
!1452 = !DISubprogram(name: "scanf", scope: !1346, file: !1346, line: 397, type: !1435, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1454, file: !1343, line: 135)
!1454 = !DISubprogram(name: "setbuf", scope: !1346, file: !1346, line: 304, type: !1455, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1455 = !DISubroutineType(types: !1456)
!1456 = !{null, !1371, !530}
!1457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1458, file: !1343, line: 136)
!1458 = !DISubprogram(name: "setvbuf", scope: !1346, file: !1346, line: 308, type: !1459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1459 = !DISubroutineType(types: !1460)
!1460 = !{!49, !1371, !530, !49, !413}
!1461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1462, file: !1343, line: 137)
!1462 = !DISubprogram(name: "sprintf", scope: !1346, file: !1346, line: 334, type: !1463, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1463 = !DISubroutineType(types: !1464)
!1464 = !{!49, !530, !487, null}
!1465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1466, file: !1343, line: 138)
!1466 = !DISubprogram(name: "sscanf", scope: !1346, file: !1346, line: 399, type: !1467, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1467 = !DISubroutineType(types: !1468)
!1468 = !{!49, !487, !487, null}
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1470, file: !1343, line: 139)
!1470 = !DISubprogram(name: "tmpfile", scope: !1346, file: !1346, line: 173, type: !1471, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1471 = !DISubroutineType(types: !1472)
!1472 = !{!1354}
!1473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1474, file: !1343, line: 141)
!1474 = !DISubprogram(name: "tmpnam", scope: !1346, file: !1346, line: 187, type: !1475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1475 = !DISubroutineType(types: !1476)
!1476 = !{!463, !463}
!1477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1478, file: !1343, line: 143)
!1478 = !DISubprogram(name: "ungetc", scope: !1346, file: !1346, line: 645, type: !1388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1480, file: !1343, line: 144)
!1480 = !DISubprogram(name: "vfprintf", scope: !1346, file: !1346, line: 341, type: !1481, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1481 = !DISubroutineType(types: !1482)
!1482 = !{!49, !1371, !487, !1051}
!1483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1484, file: !1343, line: 145)
!1484 = !DISubprogram(name: "vprintf", scope: !1428, file: !1428, line: 39, type: !1485, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1485 = !DISubroutineType(types: !1486)
!1486 = !{!49, !487, !1051}
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1488, file: !1343, line: 146)
!1488 = !DISubprogram(name: "vsprintf", scope: !1346, file: !1346, line: 349, type: !1489, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1489 = !DISubroutineType(types: !1490)
!1490 = !{!49, !530, !487, !1051}
!1491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1492, file: !1343, line: 175)
!1492 = !DISubprogram(name: "snprintf", scope: !1346, file: !1346, line: 354, type: !1493, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1493 = !DISubroutineType(types: !1494)
!1494 = !{!49, !530, !413, !487, null}
!1495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1496, file: !1343, line: 176)
!1496 = !DISubprogram(name: "vfscanf", scope: !1346, file: !1346, line: 434, type: !1481, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1498, file: !1343, line: 177)
!1498 = !DISubprogram(name: "vscanf", scope: !1346, file: !1346, line: 442, type: !1485, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1500, file: !1343, line: 178)
!1500 = !DISubprogram(name: "vsnprintf", scope: !1346, file: !1346, line: 358, type: !1501, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1501 = !DISubroutineType(types: !1502)
!1502 = !{!49, !530, !413, !487, !1051}
!1503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1504, file: !1343, line: 179)
!1504 = !DISubprogram(name: "vsscanf", scope: !1346, file: !1346, line: 446, type: !1505, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1505 = !DISubroutineType(types: !1506)
!1506 = !{!49, !487, !487, !1051}
!1507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1492, file: !1343, line: 185)
!1508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1496, file: !1343, line: 186)
!1509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1498, file: !1343, line: 187)
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1500, file: !1343, line: 188)
!1511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1504, file: !1343, line: 189)
!1512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1513, file: !1517, line: 82)
!1513 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1514, line: 48, baseType: !1515)
!1514 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "760693b7fbeea3d686e1f29058fc2257")
!1515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1516, size: 64)
!1516 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1231)
!1517 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cwctype", directory: "")
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1519, file: !1517, line: 83)
!1519 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1520, line: 38, baseType: !415)
!1520 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "45eef9c3aa1d99faffa3945ed9be039a")
!1521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !913, file: !1517, line: 84)
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1523, file: !1517, line: 86)
!1523 = !DISubprogram(name: "iswalnum", scope: !1520, file: !1520, line: 95, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1525, file: !1517, line: 87)
!1525 = !DISubprogram(name: "iswalpha", scope: !1520, file: !1520, line: 101, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1527, file: !1517, line: 89)
!1527 = !DISubprogram(name: "iswblank", scope: !1520, file: !1520, line: 146, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1529, file: !1517, line: 91)
!1529 = !DISubprogram(name: "iswcntrl", scope: !1520, file: !1520, line: 104, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1531, file: !1517, line: 92)
!1531 = !DISubprogram(name: "iswctype", scope: !1520, file: !1520, line: 159, type: !1532, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1532 = !DISubroutineType(types: !1533)
!1533 = !{!49, !913, !1519}
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1535, file: !1517, line: 93)
!1535 = !DISubprogram(name: "iswdigit", scope: !1520, file: !1520, line: 108, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1537, file: !1517, line: 94)
!1537 = !DISubprogram(name: "iswgraph", scope: !1520, file: !1520, line: 112, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1539, file: !1517, line: 95)
!1539 = !DISubprogram(name: "iswlower", scope: !1520, file: !1520, line: 117, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1541, file: !1517, line: 96)
!1541 = !DISubprogram(name: "iswprint", scope: !1520, file: !1520, line: 120, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1543, file: !1517, line: 97)
!1543 = !DISubprogram(name: "iswpunct", scope: !1520, file: !1520, line: 125, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1545, file: !1517, line: 98)
!1545 = !DISubprogram(name: "iswspace", scope: !1520, file: !1520, line: 130, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1547, file: !1517, line: 99)
!1547 = !DISubprogram(name: "iswupper", scope: !1520, file: !1520, line: 135, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1549, file: !1517, line: 100)
!1549 = !DISubprogram(name: "iswxdigit", scope: !1520, file: !1520, line: 140, type: !1162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1551, file: !1517, line: 101)
!1551 = !DISubprogram(name: "towctrans", scope: !1514, file: !1514, line: 55, type: !1552, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1552 = !DISubroutineType(types: !1553)
!1553 = !{!913, !913, !1513}
!1554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1555, file: !1517, line: 102)
!1555 = !DISubprogram(name: "towlower", scope: !1520, file: !1520, line: 166, type: !1556, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1556 = !DISubroutineType(types: !1557)
!1557 = !{!913, !913}
!1558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1559, file: !1517, line: 103)
!1559 = !DISubprogram(name: "towupper", scope: !1520, file: !1520, line: 169, type: !1556, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1561, file: !1517, line: 104)
!1561 = !DISubprogram(name: "wctrans", scope: !1514, file: !1514, line: 52, type: !1562, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1562 = !DISubroutineType(types: !1563)
!1563 = !{!1513, !293}
!1564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1565, file: !1517, line: 105)
!1565 = !DISubprogram(name: "wctype", scope: !1520, file: !1520, line: 155, type: !1566, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1566 = !DISubroutineType(types: !1567)
!1567 = !{!1519, !293}
!1568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1569, file: !1572, line: 60)
!1569 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1570, line: 7, baseType: !1571)
!1570 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1571 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !35, line: 154, baseType: !274)
!1572 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ctime", directory: "")
!1573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1574, file: !1572, line: 61)
!1574 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1575, line: 7, baseType: !1576)
!1575 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "49b4e16ef1215de5afdbb283400ab90c")
!1576 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !35, line: 158, baseType: !274)
!1577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1098, file: !1572, line: 62)
!1578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1579, file: !1572, line: 64)
!1579 = !DISubprogram(name: "clock", scope: !1580, file: !1580, line: 72, type: !1581, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1580 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b21b4c7d8bf3fafdb33a1c7ed8e024a")
!1581 = !DISubroutineType(types: !1582)
!1582 = !{!1569}
!1583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1584, file: !1572, line: 65)
!1584 = !DISubprogram(name: "difftime", scope: !1580, file: !1580, line: 78, type: !1585, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1585 = !DISubroutineType(types: !1586)
!1586 = !{!56, !1574, !1574}
!1587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1588, file: !1572, line: 66)
!1588 = !DISubprogram(name: "mktime", scope: !1580, file: !1580, line: 82, type: !1589, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1589 = !DISubroutineType(types: !1590)
!1590 = !{!1574, !1591}
!1591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1098, size: 64)
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1593, file: !1572, line: 67)
!1593 = !DISubprogram(name: "time", scope: !1580, file: !1580, line: 75, type: !1594, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1594 = !DISubroutineType(types: !1595)
!1595 = !{!1574, !1596}
!1596 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1574, size: 64)
!1597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1598, file: !1572, line: 68)
!1598 = !DISubprogram(name: "asctime", scope: !1580, file: !1580, line: 139, type: !1599, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1599 = !DISubroutineType(types: !1600)
!1600 = !{!463, !1096}
!1601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1602, file: !1572, line: 69)
!1602 = !DISubprogram(name: "ctime", scope: !1580, file: !1580, line: 142, type: !1603, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1603 = !DISubroutineType(types: !1604)
!1604 = !{!463, !1605}
!1605 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1606, size: 64)
!1606 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1574)
!1607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1608, file: !1572, line: 70)
!1608 = !DISubprogram(name: "gmtime", scope: !1580, file: !1580, line: 119, type: !1609, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1609 = !DISubroutineType(types: !1610)
!1610 = !{!1591, !1605}
!1611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1612, file: !1572, line: 71)
!1612 = !DISubprogram(name: "localtime", scope: !1580, file: !1580, line: 123, type: !1609, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1614, file: !1572, line: 72)
!1614 = !DISubprogram(name: "strftime", scope: !1580, file: !1580, line: 88, type: !1615, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1615 = !DISubroutineType(types: !1616)
!1616 = !{!413, !530, !413, !487, !1095}
!1617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1618, file: !1572, line: 79)
!1618 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1619, line: 9, size: 128, flags: DIFlagTypePassByValue, elements: !1620, identifier: "_ZTS8timespec")
!1619 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "7074babe5447b53c4390dc147eee8679")
!1620 = !{!1621, !1622}
!1621 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1618, file: !1619, line: 11, baseType: !1576, size: 64)
!1622 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1618, file: !1619, line: 12, baseType: !1623, size: 64, offset: 64)
!1623 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !35, line: 194, baseType: !274)
!1624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1625, file: !1572, line: 80)
!1625 = !DISubprogram(name: "timespec_get", scope: !1580, file: !1580, line: 263, type: !1626, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1626 = !DISubroutineType(types: !1627)
!1627 = !{!49, !1628, !49}
!1628 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1618, size: 64)
!1629 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1630, entity: !1631, file: !1633, line: 1250)
!1630 = !DINamespace(name: "chrono", scope: !44)
!1631 = !DINamespace(name: "chrono_literals", scope: !1632, exportSymbols: true)
!1632 = !DINamespace(name: "literals", scope: !44, exportSymbols: true)
!1633 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/chrono", directory: "")
!1634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !3, file: !1635, line: 89)
!1635 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/shared_ptr_base.h", directory: "", checksumkind: CSK_MD5, checksum: "a9031cc66fad8948937b85efd4835986")
!1636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1637, file: !1635, line: 90)
!1637 = !DIGlobalVariable(name: "__default_lock_policy", linkageName: "_ZN9__gnu_cxxL21__default_lock_policyE", scope: !5, file: !4, line: 53, type: !1638, isLocal: true, isDefinition: false)
!1638 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3)
!1639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1640, file: !1644, line: 77)
!1640 = !DISubprogram(name: "memchr", scope: !1641, file: !1641, line: 84, type: !1642, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1641 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "cc7eed1dc136352012a229a96542ae3d")
!1642 = !DISubroutineType(types: !1643)
!1643 = !{!439, !439, !49, !413}
!1644 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstring", directory: "")
!1645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1646, file: !1644, line: 78)
!1646 = !DISubprogram(name: "memcmp", scope: !1641, file: !1641, line: 64, type: !1647, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1647 = !DISubroutineType(types: !1648)
!1648 = !{!49, !439, !439, !413}
!1649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1650, file: !1644, line: 79)
!1650 = !DISubprogram(name: "memcpy", linkageName: "_ZL6memcpyPvPKvm", scope: !1651, file: !1651, line: 1084, type: !1652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1651 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "59790372eacbad80338513022c6135db")
!1652 = !DISubroutineType(types: !1653)
!1653 = !{!412, !412, !439, !413}
!1654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1655, file: !1644, line: 80)
!1655 = !DISubprogram(name: "memmove", scope: !1641, file: !1641, line: 47, type: !1652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1657, file: !1644, line: 81)
!1657 = !DISubprogram(name: "memset", linkageName: "_ZL6memsetPvim", scope: !1651, file: !1651, line: 1088, type: !1658, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1658 = !DISubroutineType(types: !1659)
!1659 = !{!412, !412, !49, !413}
!1660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1661, file: !1644, line: 82)
!1661 = !DISubprogram(name: "strcat", scope: !1641, file: !1641, line: 130, type: !1662, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1662 = !DISubroutineType(types: !1663)
!1663 = !{!463, !530, !487}
!1664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1665, file: !1644, line: 83)
!1665 = !DISubprogram(name: "strcmp", scope: !1641, file: !1641, line: 137, type: !1447, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1667, file: !1644, line: 84)
!1667 = !DISubprogram(name: "strcoll", scope: !1641, file: !1641, line: 144, type: !1447, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1669, file: !1644, line: 85)
!1669 = !DISubprogram(name: "strcpy", scope: !1641, file: !1641, line: 122, type: !1662, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1671, file: !1644, line: 86)
!1671 = !DISubprogram(name: "strcspn", scope: !1641, file: !1641, line: 273, type: !1672, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1672 = !DISubroutineType(types: !1673)
!1673 = !{!413, !293, !293}
!1674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1675, file: !1644, line: 87)
!1675 = !DISubprogram(name: "strerror", scope: !1641, file: !1641, line: 397, type: !1676, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1676 = !DISubroutineType(types: !1677)
!1677 = !{!463, !49}
!1678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1679, file: !1644, line: 88)
!1679 = !DISubprogram(name: "strlen", scope: !1641, file: !1641, line: 385, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1680 = !DISubroutineType(types: !1681)
!1681 = !{!413, !293}
!1682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1683, file: !1644, line: 89)
!1683 = !DISubprogram(name: "strncat", scope: !1641, file: !1641, line: 133, type: !1684, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1684 = !DISubroutineType(types: !1685)
!1685 = !{!463, !530, !487, !413}
!1686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1687, file: !1644, line: 90)
!1687 = !DISubprogram(name: "strncmp", scope: !1641, file: !1641, line: 140, type: !1688, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1688 = !DISubroutineType(types: !1689)
!1689 = !{!49, !293, !293, !413}
!1690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1691, file: !1644, line: 91)
!1691 = !DISubprogram(name: "strncpy", scope: !1641, file: !1641, line: 125, type: !1684, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1693, file: !1644, line: 92)
!1693 = !DISubprogram(name: "strspn", scope: !1641, file: !1641, line: 277, type: !1672, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1695, file: !1644, line: 93)
!1695 = !DISubprogram(name: "strtok", scope: !1641, file: !1641, line: 336, type: !1662, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1697, file: !1644, line: 94)
!1697 = !DISubprogram(name: "strxfrm", scope: !1641, file: !1641, line: 147, type: !1698, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1698 = !DISubroutineType(types: !1699)
!1699 = !{!413, !530, !487, !413}
!1700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1701, file: !1644, line: 95)
!1701 = !DISubprogram(name: "strchr", scope: !1641, file: !1641, line: 219, type: !1702, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1702 = !DISubroutineType(types: !1703)
!1703 = !{!293, !293, !49}
!1704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1705, file: !1644, line: 96)
!1705 = !DISubprogram(name: "strpbrk", scope: !1641, file: !1641, line: 296, type: !1706, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1706 = !DISubroutineType(types: !1707)
!1707 = !{!293, !293, !293}
!1708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1709, file: !1644, line: 97)
!1709 = !DISubprogram(name: "strrchr", scope: !1641, file: !1641, line: 246, type: !1702, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !44, entity: !1711, file: !1644, line: 98)
!1711 = !DISubprogram(name: "strstr", scope: !1641, file: !1641, line: 323, type: !1706, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1712 = distinct !DILifetime(object: !1713, location: !DIExpr(DIOpArg(0, %struct.__HIP_Coordinates addrspace(4)*), DIOpDeref(%struct.__HIP_Coordinates)), argObjects: {!1753})
!1713 = distinct !DIGlobalVariable(name: "threadIdx", linkageName: "_ZL9threadIdx", scope: !0, file: !1714, line: 377, type: !1715, isLocal: true, isDefinition: true)
!1714 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "0ac9823654812ba0fd0f0538bfae47a7")
!1715 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1716)
!1716 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_Coordinates<__HIP_ThreadIdx>", file: !1714, line: 296, size: 8, flags: DIFlagTypePassByValue, elements: !1717, templateParams: !1744, identifier: "_ZTS17__HIP_CoordinatesI15__HIP_ThreadIdxE")
!1717 = !{!1718, !1733, !1736, !1739}
!1718 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1716, file: !1714, line: 312, baseType: !1719, flags: DIFlagStaticMember)
!1719 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1720)
!1720 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__X", scope: !1716, file: !1714, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !1721, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XE")
!1721 = !{!1722, !1727}
!1722 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !1720, file: !1714, line: 300, type: !1723, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1723 = !DISubroutineType(types: !1724)
!1724 = !{!1725, !1726}
!1725 = !DIDerivedType(tag: DW_TAG_typedef, name: "R", scope: !1716, file: !1714, line: 297, baseType: !32)
!1726 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1719, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1727 = !DISubprogram(name: "operator+=", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XpLERKj", scope: !1720, file: !1714, line: 301, type: !1728, scopeLine: 301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1728 = !DISubroutineType(types: !1729)
!1729 = !{!1725, !1730, !1731}
!1730 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1720, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1731 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1732, size: 64)
!1732 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1725)
!1733 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1716, file: !1714, line: 313, baseType: !1734, flags: DIFlagStaticMember)
!1734 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1735)
!1735 = !DICompositeType(tag: DW_TAG_structure_type, name: "__Y", scope: !1716, file: !1714, line: 303, size: 8, flags: DIFlagFwdDecl, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YE")
!1736 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1716, file: !1714, line: 314, baseType: !1737, flags: DIFlagStaticMember)
!1737 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1738)
!1738 = !DICompositeType(tag: DW_TAG_structure_type, name: "__Z", scope: !1716, file: !1714, line: 307, size: 8, flags: DIFlagFwdDecl, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZE")
!1739 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxEcv4dim3Ev", scope: !1716, file: !1714, line: 316, type: !1740, scopeLine: 316, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1740 = !DISubroutineType(types: !1741)
!1741 = !{!1742, !1743}
!1742 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !29, line: 941, baseType: !28)
!1743 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1715, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1744 = !{!1745}
!1745 = !DITemplateTypeParameter(name: "F", type: !1746)
!1746 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_ThreadIdx", file: !1714, line: 277, size: 8, flags: DIFlagTypePassByValue, elements: !1747, identifier: "_ZTS15__HIP_ThreadIdx")
!1747 = !{!1748}
!1748 = !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !1746, file: !1714, line: 279, type: !1749, scopeLine: 279, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1749 = !DISubroutineType(types: !1750)
!1750 = !{!32, !1751, !32}
!1751 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1752, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1752 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1746)
!1753 = distinct !DIFragment()
!1754 = distinct !DILifetime(object: !1755, location: !DIExpr(DIOpArg(0, %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" addrspace(4)*), DIOpDeref(%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X")), argObjects: {!1756})
!1755 = distinct !DIGlobalVariable(name: "x", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE", scope: !0, file: !1714, line: 312, type: !1719, isLocal: false, isDefinition: true, declaration: !1718)
!1756 = distinct !DIFragment()
!1757 = !{i32 7, !"Dwarf Version", i32 5}
!1758 = !{i32 2, !"Debug Info Version", i32 4}
!1759 = !{i32 1, !"wchar_size", i32 4}
!1760 = !{i32 7, !"PIC Level", i32 1}
!1761 = !{i32 2, i32 0}
!1762 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}
!1763 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.1 22465 d6f0fe8b22e3d8ce0f2cbd657ea14b16043018a5)"}
!1764 = distinct !DISubprogram(name: "tick_all_kernel", linkageName: "_Z15tick_all_kernelPU7_AtomicmPmPl", scope: !1, file: !1, line: 57, type: !1765, scopeLine: 58, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1771)
!1765 = !DISubroutineType(types: !1766)
!1766 = !{null, !1767, !1769, !1770}
!1767 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1768, size: 64)
!1768 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !1270)
!1769 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1270, size: 64)
!1770 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1233, size: 64)
!1771 = !{!1772, !1773, !1774}
!1772 = !DILocalVariable(name: "clk", arg: 1, scope: !1764, file: !1, line: 57, type: !1767)
!1773 = !DILocalVariable(name: "vals", arg: 2, scope: !1764, file: !1, line: 57, type: !1769)
!1774 = !DILocalVariable(name: "dummy_data", arg: 3, scope: !1764, file: !1, line: 57, type: !1770)
!1775 = distinct !DISubprogram(name: "dummy_init", linkageName: "_Z10dummy_initPl", scope: !1, file: !1, line: 182, type: !1776, scopeLine: 183, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1778)
!1776 = !DISubroutineType(types: !1777)
!1777 = !{null, !1770}
!1778 = !{!1779, !1780}
!1779 = !DILocalVariable(name: "dummy_data", arg: 1, scope: !1775, file: !1, line: 182, type: !1770)
!1780 = !DILocalVariable(name: "i", scope: !1775, file: !1, line: 184, type: !49)
!1781 = !{i16 1, i16 1025}
!1782 = !{}
!1783 = !{!1784, !1788, i64 12}
!1784 = !{!"hsa_kernel_dispatch_packet_s", !1785, i64 0, !1785, i64 2, !1785, i64 4, !1785, i64 6, !1785, i64 8, !1785, i64 10, !1788, i64 12, !1788, i64 16, !1788, i64 20, !1788, i64 24, !1788, i64 28, !1789, i64 32, !1790, i64 40, !1789, i64 48, !1791, i64 56}
!1785 = !{!"short", !1786, i64 0}
!1786 = !{!"omnipotent char", !1787, i64 0}
!1787 = !{!"Simple C/C++ TBAA"}
!1788 = !{!"int", !1786, i64 0}
!1789 = !{!"long", !1786, i64 0}
!1790 = !{!"any pointer", !1786, i64 0}
!1791 = !{!"hsa_signal_s", !1789, i64 0}
!1792 = !{!1784, !1788, i64 16}
!1793 = !{!1784, !1788, i64 20}
!1794 = !{i32 0, i32 1024}
!1795 = !{!1796, !1796, i64 0}
!1796 = !{!"long", !1797, i64 0}
!1797 = !{!"omnipotent char", !1798, i64 0}
!1798 = !{!"Simple C++ TBAA"}
!1799 = !{!1800, !1800, i64 0}
!1800 = !{!"any pointer", !1797, i64 0}
!1801 = !{!1797, !1797, i64 0}

; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa-gfx90a

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = 'test/managed_clock_test.cpp'
source_filename = "test/managed_clock_test.cpp"
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
%struct.timespec = type { i64, i64 }
%"struct.std::chrono::duration" = type { i64 }
%struct.hipDeviceProp_t = type { [256 x i8], i64, i64, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, %struct.hipDeviceArch_t, i32, i32, i32, i32, i64, i32, i32, i32, [256 x i8], i32, i32, i32, i32, i32, [2 x i32], [3 x i32], i32*, i32*, i64, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.hipDeviceArch_t = type { i24 }

$__hip_gpubin_handle = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@_Z15tick_all_kernelPU7_AtomicmPmPl = dso_local constant void (i64*, i64*, i64*)* @_Z30__device_stub__tick_all_kernelPU7_AtomicmPmPl, align 8
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [37 x i8] c"\0A==== STARTING TEST: tick all ====\0A\0A\00", align 1, !dbg !7
@.str.1 = private unnamed_addr constant [27 x i8] c"Using GPU with device ID: \00", align 1, !dbg !15
@_Z10dummy_initPl = dso_local constant void (i64*)* @_Z25__device_stub__dummy_initPl, align 8
@.str.2 = private unnamed_addr constant [19 x i8] c"Dummy Data init: {\00", align 1, !dbg !20
@.str.3 = private unnamed_addr constant [6 x i8] c"\0A    \00", align 1, !dbg !25
@.str.4 = private unnamed_addr constant [2 x i8] c" \00", align 1, !dbg !30
@.str.5 = private unnamed_addr constant [4 x i8] c"...\00", align 1, !dbg !35
@.str.6 = private unnamed_addr constant [6 x i8] c"\0A  }\0A\00", align 1, !dbg !40
@.str.7 = private unnamed_addr constant [60 x i8] c"\0ASUCCESS managed mem registered change before call to sync!\00", align 1, !dbg !42
@.str.8 = private unnamed_addr constant [24 x i8] c"\0AFinal ``Clock'' time: \00", align 1, !dbg !47
@.str.9 = private unnamed_addr constant [36 x i8] c"\0AGPU Threads modified as follows: {\00", align 1, !dbg !52
@.str.10 = private unnamed_addr constant [35 x i8] c"\0A==== ENDING TEST: tick all ====\0A\0A\00", align 1, !dbg !57
@.str.11 = private unnamed_addr constant [15 x i8] c" System minor \00", align 1, !dbg !62
@.str.12 = private unnamed_addr constant [15 x i8] c" System major \00", align 1, !dbg !67
@.str.13 = private unnamed_addr constant [18 x i8] c" agent prop name \00", align 1, !dbg !69
@_ZSt4cerr = external dso_local global %"class.std::basic_ostream", align 8
@.str.14 = private unnamed_addr constant [13 x i8] c"\0AHIP ERROR: \00", align 1, !dbg !74
@0 = private unnamed_addr constant [35 x i8] c"_Z15tick_all_kernelPU7_AtomicmPmPl\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"_Z10dummy_initPl\00", align 1
@__hip_fatbin = external constant i8, section ".hip_fatbin"
@__hip_fatbin_wrapper = internal constant { i32, i32, i8*, i8* } { i32 1212764230, i32 1, i8* @__hip_fatbin, i8* null }, section ".hipFatBinSegment", align 8
@__hip_gpubin_handle = linkonce hidden local_unnamed_addr global i8** null, comdat, align 8
@"scabbard.metadata.host.srcId$0x0000" = private global i64 0
@"scabbard.metadata.host.srcId$0x0001" = private global i64 0
@"scabbard.metadata.srcData$0x0001" = private unnamed_addr constant [59 x i8] c"/g/g11/osterhou/repos/scabbard/test/managed_clock_test.cpp\00", align 1
@"scabbard.metadata.srcData$0x0000" = private unnamed_addr constant [47 x i8] c"//opt/rocm-5.4.3/include/hip/hip_runtime_api.h\00", align 1
@llvm.global_ctors = appending global [3 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_managed_clock_test.cpp, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @__hip_module_ctor, i8* null }, { i32, void ()*, i8* } { i32 -1, void ()* @scabbard.trace.module_ctor, i8* null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: norecurse uwtable
define dso_local void @_Z30__device_stub__tick_all_kernelPU7_AtomicmPmPl(i64* noundef %0, i64* noundef %1, i64* noundef %2) #3 {
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca i8*, align 8
  store i64* %0, i64** %4, align 8, !tbaa !2213
  store i64* %1, i64** %5, align 8, !tbaa !2213
  store i64* %2, i64** %6, align 8, !tbaa !2213
  %11 = alloca [3 x i8*], align 16
  %12 = getelementptr inbounds [3 x i8*], [3 x i8*]* %11, i64 0, i64 0
  %13 = bitcast [3 x i8*]* %11 to i64***
  store i64** %4, i64*** %13, align 16
  %14 = getelementptr inbounds [3 x i8*], [3 x i8*]* %11, i64 0, i64 1
  %15 = bitcast i8** %14 to i64***
  store i64** %5, i64*** %15, align 8
  %16 = getelementptr inbounds [3 x i8*], [3 x i8*]* %11, i64 0, i64 2
  %17 = bitcast i8** %16 to i64***
  store i64** %6, i64*** %17, align 16
  %18 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %7, %struct.dim3* nonnull %8, i64* nonnull %9, i8** nonnull %10)
  %19 = load i64, i64* %9, align 8
  %20 = bitcast i8** %10 to %struct.ihipStream_t**
  %21 = load %struct.ihipStream_t*, %struct.ihipStream_t** %20, align 8
  %22 = bitcast %struct.dim3* %7 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds %struct.dim3, %struct.dim3* %7, i64 0, i32 2
  %25 = load i32, i32* %24, align 8
  %26 = bitcast %struct.dim3* %8 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %struct.dim3, %struct.dim3* %8, i64 0, i32 2
  %29 = load i32, i32* %28, align 8
  %30 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void (i64*, i64*, i64*)** @_Z15tick_all_kernelPU7_AtomicmPmPl to i8*), i64 %23, i32 %25, i64 %27, i32 %29, i8** noundef nonnull %12, i64 noundef %19, %struct.ihipStream_t* noundef %21)
  ret void
}

declare dso_local i32 @__hipPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**) local_unnamed_addr

declare dso_local i32 @hipLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.ihipStream_t*) local_unnamed_addr

; Function Attrs: uwtable
define dso_local void @_Z13tick_all_testv() local_unnamed_addr #4 personality i32 (...)* @__gxx_personality_v0 !dbg !2217 {
  %1 = alloca <2 x i64>, align 16
  %2 = bitcast <2 x i64>* %1 to %struct.timespec*
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca %struct.dim3, align 8
  %7 = alloca %struct.dim3, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca [3 x i8*], align 16
  %11 = alloca i64*, align 8
  %12 = alloca %struct.dim3, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca i64, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i8*, align 16
  %17 = alloca i32, align 4
  %18 = alloca i64*, align 8
  %19 = alloca i64*, align 8
  %20 = alloca i64*, align 8
  %21 = bitcast i32* %17 to i8*, !dbg !2239
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %21) #18, !dbg !2239
  call void @llvm.dbg.value(metadata i32 0, metadata !2219, metadata !DIExpression()), !dbg !2240
  store i32 0, i32* %17, align 4, !dbg !2241, !tbaa !2242
  call void @llvm.dbg.value(metadata i32* %17, metadata !2219, metadata !DIExpression(DW_OP_deref)), !dbg !2240
  %22 = call i32 @hipGetDevice(i32* noundef nonnull %17), !dbg !2244
  call void @llvm.dbg.value(metadata i32 %22, metadata !2245, metadata !DIExpression()), !dbg !2251
  %23 = icmp eq i32 %22, 0, !dbg !2253
  br i1 %23, label %28, label %24, !dbg !2255

24:                                               ; preds = %0
  %25 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !2256
  %26 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %25, i32 noundef %22), !dbg !2258
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %26, metadata !2259, metadata !DIExpression()), !dbg !2276
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2276
  %27 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %26), !dbg !2278
  call void @exit(i32 noundef 1) #19, !dbg !2279
  unreachable, !dbg !2279

28:                                               ; preds = %0
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2342
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2342
  %29 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i64 0, i64 0), i64 noundef 36), !dbg !2344
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2259, metadata !DIExpression()), !dbg !2346
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2348, metadata !DIExpression()), !dbg !2354
  %30 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout), !dbg !2356
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2357
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2357
  %31 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), i64 noundef 26), !dbg !2359
  %32 = load i32, i32* %17, align 4, !dbg !2360, !tbaa !2242
  call void @llvm.dbg.value(metadata i32 %32, metadata !2219, metadata !DIExpression()), !dbg !2240
  %33 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %32), !dbg !2361
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %33, metadata !2259, metadata !DIExpression()), !dbg !2362
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2362
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %33, metadata !2364, metadata !DIExpression()), !dbg !2367
  %34 = bitcast %"class.std::basic_ostream"* %33 to i8**, !dbg !2369
  %35 = load i8*, i8** %34, align 8, !dbg !2369, !tbaa !2370
  %36 = getelementptr i8, i8* %35, i64 -24, !dbg !2369
  %37 = bitcast i8* %36 to i64*, !dbg !2369
  %38 = load i64, i64* %37, align 8, !dbg !2369
  %39 = bitcast %"class.std::basic_ostream"* %33 to i8*, !dbg !2369
  %40 = getelementptr inbounds i8, i8* %39, i64 %38, !dbg !2369
  call void @llvm.dbg.value(metadata i8* %40, metadata !2372, metadata !DIExpression()), !dbg !2386
  call void @llvm.dbg.value(metadata i8 10, metadata !2384, metadata !DIExpression()), !dbg !2386
  %41 = getelementptr inbounds i8, i8* %40, i64 240, !dbg !2388
  %42 = bitcast i8* %41 to %"class.std::ctype"**, !dbg !2388
  %43 = load %"class.std::ctype"*, %"class.std::ctype"** %42, align 8, !dbg !2388, !tbaa !2389
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %43, metadata !2398, metadata !DIExpression()), !dbg !2410
  %44 = icmp eq %"class.std::ctype"* %43, null, !dbg !2412
  br i1 %44, label %45, label %46, !dbg !2414

45:                                               ; preds = %28
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2415
  unreachable, !dbg !2415

46:                                               ; preds = %28
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %43, metadata !2416, metadata !DIExpression()), !dbg !2425
  call void @llvm.dbg.value(metadata i8 10, metadata !2424, metadata !DIExpression()), !dbg !2425
  %47 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %43, i64 0, i32 8, !dbg !2427
  %48 = load i8, i8* %47, align 8, !dbg !2427, !tbaa !2429
  %49 = icmp eq i8 %48, 0, !dbg !2427
  br i1 %49, label %53, label %50, !dbg !2432

50:                                               ; preds = %46
  %51 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %43, i64 0, i32 9, i64 10, !dbg !2433
  %52 = load i8, i8* %51, align 1, !dbg !2433, !tbaa !2434
  br label %59, !dbg !2435

53:                                               ; preds = %46
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %43), !dbg !2436
  %54 = bitcast %"class.std::ctype"* %43 to i8 (%"class.std::ctype"*, i8)***, !dbg !2437
  %55 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %54, align 8, !dbg !2437, !tbaa !2370
  %56 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %55, i64 6, !dbg !2437
  %57 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %56, align 8, !dbg !2437
  %58 = call noundef signext i8 %57(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %43, i8 noundef signext 10), !dbg !2437
  br label %59, !dbg !2438

59:                                               ; preds = %50, %53
  %60 = phi i8 [ %52, %50 ], [ %58, %53 ], !dbg !2425
  %61 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %33, i8 noundef signext %60), !dbg !2439
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %61, metadata !2348, metadata !DIExpression()), !dbg !2440
  %62 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %61), !dbg !2442
  call void @llvm.dbg.value(metadata i32 1024, metadata !2220, metadata !DIExpression()), !dbg !2240
  call void @llvm.dbg.value(metadata i64 64, metadata !2222, metadata !DIExpression()), !dbg !2240
  call void @llvm.dbg.value(metadata i64 128, metadata !2223, metadata !DIExpression()), !dbg !2240
  call void @llvm.dbg.value(metadata i64 16, metadata !2225, metadata !DIExpression()), !dbg !2240
  %63 = bitcast i64** %18 to i8*, !dbg !2443
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %63) #18, !dbg !2443
  call void @llvm.dbg.value(metadata i64** %18, metadata !2226, metadata !DIExpression(DW_OP_deref)), !dbg !2240
  call void @llvm.dbg.value(metadata i64** %18, metadata !2444, metadata !DIExpression()), !dbg !2456
  call void @llvm.dbg.value(metadata i64 1, metadata !2452, metadata !DIExpression()), !dbg !2456
  call void @llvm.dbg.value(metadata i32 1, metadata !2453, metadata !DIExpression()), !dbg !2456
  %64 = bitcast i64** %18 to i8**, !dbg !2458
  %65 = call i32 @hipMallocManaged(i8** noundef nonnull %64, i64 noundef 1, i32 noundef 1), !dbg !2459
  call void @llvm.dbg.value(metadata i32 %65, metadata !2245, metadata !DIExpression()), !dbg !2460
  %66 = icmp eq i32 %65, 0, !dbg !2462
  br i1 %66, label %71, label %67, !dbg !2463

67:                                               ; preds = %59
  %68 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !2464
  %69 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %68, i32 noundef %65), !dbg !2465
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %69, metadata !2259, metadata !DIExpression()), !dbg !2466
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2466
  %70 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %69), !dbg !2468
  call void @exit(i32 noundef 1) #19, !dbg !2469
  unreachable, !dbg !2469

71:                                               ; preds = %59
  %72 = load i64*, i64** %18, align 8, !dbg !2470, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* %72, metadata !2226, metadata !DIExpression()), !dbg !2240
  store atomic i64 0, i64* %72 seq_cst, align 8, !dbg !2471, !tbaa !2434
  %73 = call noalias noundef nonnull dereferenceable(8192) i8* @_Znam(i64 noundef 8192) #21, !dbg !2472, !heapallocsite !1681
  %74 = bitcast i8* %73 to i64*, !dbg !2472
  call void @llvm.dbg.value(metadata i64* %74, metadata !2229, metadata !DIExpression()), !dbg !2240
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(8192) %73, i8 0, i64 8192, i1 false), !dbg !2473
  %75 = bitcast i64** %19 to i8*, !dbg !2474
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %75) #18, !dbg !2474
  call void @llvm.dbg.value(metadata i64** %19, metadata !2231, metadata !DIExpression(DW_OP_deref)), !dbg !2240
  call void @llvm.dbg.value(metadata i64** %19, metadata !2475, metadata !DIExpression()), !dbg !2485
  call void @llvm.dbg.value(metadata i64 8192, metadata !2482, metadata !DIExpression()), !dbg !2485
  %76 = bitcast i64** %19 to i8**, !dbg !2487
  %77 = call i32 @hipMalloc(i8** noundef nonnull %76, i64 noundef 8192), !dbg !2488
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4112, i8** nonnull %76, i64* nonnull @"scabbard.metadata.host.srcId$0x0000", i32 6945, i32 12, i64 8192)
  call void @llvm.dbg.value(metadata i32 %77, metadata !2245, metadata !DIExpression()), !dbg !2489
  %78 = icmp eq i32 %77, 0, !dbg !2491
  br i1 %78, label %83, label %79, !dbg !2492

79:                                               ; preds = %71
  %80 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !2493
  %81 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %80, i32 noundef %77), !dbg !2494
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %81, metadata !2259, metadata !DIExpression()), !dbg !2495
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2495
  %82 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %81), !dbg !2497
  call void @exit(i32 noundef 1) #19, !dbg !2498
  unreachable, !dbg !2498

83:                                               ; preds = %71
  %84 = load i8*, i8** %76, align 8, !dbg !2499, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* undef, metadata !2231, metadata !DIExpression()), !dbg !2240
  call void @"scabbard.trace.host.trace_append$mem"(i16 -32768, ptr null, i64* nonnull @"scabbard.metadata.host.srcId$0x0001", i32 89, i32 17)
  %85 = call i32 @hipMemcpy(i8* noundef %84, i8* noundef nonnull %73, i64 noundef 8192, i32 noundef 1), !dbg !2500
  call void @llvm.dbg.value(metadata i32 %85, metadata !2245, metadata !DIExpression()), !dbg !2501
  %86 = icmp eq i32 %85, 0, !dbg !2503
  br i1 %86, label %91, label %87, !dbg !2504

87:                                               ; preds = %83
  %88 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !2505
  %89 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %88, i32 noundef %85), !dbg !2506
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %89, metadata !2259, metadata !DIExpression()), !dbg !2507
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2507
  %90 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %89), !dbg !2509
  call void @exit(i32 noundef 1) #19, !dbg !2510
  unreachable, !dbg !2510

91:                                               ; preds = %83
  %92 = bitcast i64** %20 to i8*, !dbg !2511
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %92) #18, !dbg !2511
  call void @llvm.dbg.value(metadata i64** %20, metadata !2232, metadata !DIExpression(DW_OP_deref)), !dbg !2240
  call void @llvm.dbg.value(metadata i64** %20, metadata !2512, metadata !DIExpression()), !dbg !2522
  call void @llvm.dbg.value(metadata i64 8192, metadata !2519, metadata !DIExpression()), !dbg !2522
  %93 = bitcast i64** %20 to i8**, !dbg !2524
  %94 = call i32 @hipMalloc(i8** noundef nonnull %93, i64 noundef 8192), !dbg !2525
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4112, i8** nonnull %93, i64* nonnull @"scabbard.metadata.host.srcId$0x0000", i32 6945, i32 12, i64 8192)
  call void @llvm.dbg.value(metadata i32 %94, metadata !2245, metadata !DIExpression()), !dbg !2526
  %95 = icmp eq i32 %94, 0, !dbg !2528
  br i1 %95, label %100, label %96, !dbg !2529

96:                                               ; preds = %91
  %97 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !2530
  %98 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %97, i32 noundef %94), !dbg !2531
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %98, metadata !2259, metadata !DIExpression()), !dbg !2532
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2532
  %99 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %98), !dbg !2534
  call void @exit(i32 noundef 1) #19, !dbg !2535
  unreachable, !dbg !2535

100:                                              ; preds = %91
  %101 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294968320, i32 1, i64 noundef 0, %struct.ihipStream_t* noundef null), !dbg !2536
  %102 = icmp eq i32 %101, 0, !dbg !2536
  br i1 %102, label %103, label %125, !dbg !2536

103:                                              ; preds = %100
  %104 = load i64*, i64** %20, align 8, !dbg !2536, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* %104, metadata !2232, metadata !DIExpression()), !dbg !2240
  %105 = bitcast i64** %11 to i8*, !dbg !2536
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %105), !dbg !2536
  %106 = bitcast %struct.dim3* %12 to i8*, !dbg !2536
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %106), !dbg !2536
  %107 = bitcast %struct.dim3* %13 to i8*, !dbg !2536
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %107), !dbg !2536
  %108 = bitcast i64* %14 to i8*, !dbg !2536
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %108), !dbg !2536
  %109 = bitcast i8** %15 to i8*, !dbg !2536
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %109), !dbg !2536
  %110 = bitcast i8** %16 to i8*, !dbg !2536
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %110), !dbg !2536
  store i64* %104, i64** %11, align 8, !dbg !2536, !tbaa !2213
  %111 = bitcast i8** %16 to i64***, !dbg !2536
  store i64** %11, i64*** %111, align 16, !dbg !2536
  %112 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %12, %struct.dim3* nonnull %13, i64* nonnull %14, i8** nonnull %15), !dbg !2536
  %113 = load i64, i64* %14, align 8, !dbg !2536
  %114 = bitcast i8** %15 to %struct.ihipStream_t**, !dbg !2536
  %115 = load %struct.ihipStream_t*, %struct.ihipStream_t** %114, align 8, !dbg !2536
  %116 = bitcast %struct.dim3* %12 to i64*, !dbg !2536
  %117 = load i64, i64* %116, align 8, !dbg !2536
  %118 = getelementptr inbounds %struct.dim3, %struct.dim3* %12, i64 0, i32 2, !dbg !2536
  %119 = load i32, i32* %118, align 8, !dbg !2536
  %120 = bitcast %struct.dim3* %13 to i64*, !dbg !2536
  %121 = load i64, i64* %120, align 8, !dbg !2536
  %122 = getelementptr inbounds %struct.dim3, %struct.dim3* %13, i64 0, i32 2, !dbg !2536
  %123 = load i32, i32* %122, align 8, !dbg !2536
  %124 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void (i64*)** @_Z10dummy_initPl to i8*), i64 %117, i32 %119, i64 %121, i32 %123, i8** noundef nonnull %16, i64 noundef %113, %struct.ihipStream_t* noundef %115), !dbg !2536
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %105), !dbg !2536
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %106), !dbg !2536
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %107), !dbg !2536
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %108), !dbg !2536
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %109), !dbg !2536
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %110), !dbg !2536
  br label %125, !dbg !2536

125:                                              ; preds = %103, %100
  %126 = call noalias noundef nonnull dereferenceable(8192) i8* @_Znam(i64 noundef 8192) #21, !dbg !2538, !heapallocsite !1648
  %127 = bitcast i8* %126 to i64*, !dbg !2538
  call void @llvm.dbg.value(metadata i64* %127, metadata !2234, metadata !DIExpression()), !dbg !2240
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(8192) %126, i8 0, i64 8192, i1 false), !dbg !2539
  %128 = load i8*, i8** %93, align 8, !dbg !2540, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* undef, metadata !2232, metadata !DIExpression()), !dbg !2240
  call void @"scabbard.trace.host.trace_append$mem"(i16 -32768, ptr null, i64* nonnull @"scabbard.metadata.host.srcId$0x0001", i32 100, i32 17)
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4138, i8* nonnull %126, i64* nonnull @"scabbard.metadata.host.srcId$0x0001", i32 100, i32 17, i64 8192)
  %129 = call i32 @hipMemcpy(i8* noundef nonnull %126, i8* noundef %128, i64 noundef 8192, i32 noundef 2), !dbg !2541
  call void @llvm.dbg.value(metadata i32 %129, metadata !2245, metadata !DIExpression()), !dbg !2542
  %130 = icmp eq i32 %129, 0, !dbg !2544
  br i1 %130, label %135, label %131, !dbg !2545

131:                                              ; preds = %125
  %132 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !2546
  %133 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %132, i32 noundef %129), !dbg !2547
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %133, metadata !2259, metadata !DIExpression()), !dbg !2548
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2548
  %134 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %133), !dbg !2550
  call void @exit(i32 noundef 1) #19, !dbg !2551
  unreachable, !dbg !2551

135:                                              ; preds = %125
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2552
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2552
  %136 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0), i64 noundef 18), !dbg !2554
  call void @llvm.dbg.value(metadata i64 0, metadata !2235, metadata !DIExpression()), !dbg !2555
  br label %180, !dbg !2556

137:                                              ; preds = %214
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2557
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2557
  %138 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 noundef 5), !dbg !2560
  call void @llvm.dbg.value(metadata i8 32, metadata !2561, metadata !DIExpression()), !dbg !2571
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2570, metadata !DIExpression()), !dbg !2571
  %139 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !2573, !tbaa !2370
  %140 = getelementptr i8, i8* %139, i64 -24, !dbg !2573
  %141 = bitcast i8* %140 to i64*, !dbg !2573
  %142 = load i64, i64* %141, align 8, !dbg !2573
  %143 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %142, !dbg !2573
  call void @llvm.dbg.value(metadata i8* %143, metadata !2574, metadata !DIExpression()), !dbg !2584
  call void @llvm.dbg.value(metadata i8 32, metadata !2581, metadata !DIExpression()), !dbg !2584
  call void @llvm.dbg.value(metadata i8* %143, metadata !2586, metadata !DIExpression()), !dbg !2592
  %144 = getelementptr inbounds i8, i8* %143, i64 225, !dbg !2594
  %145 = load i8, i8* %144, align 1, !dbg !2594, !tbaa !2596, !range !2597
  %146 = icmp eq i8 %145, 0, !dbg !2594
  br i1 %146, label %147, label %166, !dbg !2598

147:                                              ; preds = %137
  call void @llvm.dbg.value(metadata i8* %143, metadata !2574, metadata !DIExpression()), !dbg !2584
  call void @llvm.dbg.value(metadata i8* %143, metadata !2586, metadata !DIExpression()), !dbg !2592
  call void @llvm.dbg.value(metadata i8* %143, metadata !2372, metadata !DIExpression()), !dbg !2599
  call void @llvm.dbg.value(metadata i8 32, metadata !2384, metadata !DIExpression()), !dbg !2599
  %148 = getelementptr inbounds i8, i8* %143, i64 240, !dbg !2602
  %149 = bitcast i8* %148 to %"class.std::ctype"**, !dbg !2602
  %150 = load %"class.std::ctype"*, %"class.std::ctype"** %149, align 8, !dbg !2602, !tbaa !2389
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %150, metadata !2398, metadata !DIExpression()), !dbg !2603
  %151 = icmp eq %"class.std::ctype"* %150, null, !dbg !2605
  br i1 %151, label %152, label %153, !dbg !2606

152:                                              ; preds = %147
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2607
  unreachable, !dbg !2607

153:                                              ; preds = %147
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %150, metadata !2416, metadata !DIExpression()), !dbg !2608
  call void @llvm.dbg.value(metadata i8 32, metadata !2424, metadata !DIExpression()), !dbg !2608
  %154 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %150, i64 0, i32 8, !dbg !2610
  %155 = load i8, i8* %154, align 8, !dbg !2610, !tbaa !2429
  %156 = icmp eq i8 %155, 0, !dbg !2610
  br i1 %156, label %157, label %164, !dbg !2611

157:                                              ; preds = %153
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %150), !dbg !2612
  %158 = bitcast %"class.std::ctype"* %150 to i8 (%"class.std::ctype"*, i8)***, !dbg !2613
  %159 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %158, align 8, !dbg !2613, !tbaa !2370
  %160 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %159, i64 6, !dbg !2613
  %161 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %160, align 8, !dbg !2613
  %162 = call noundef signext i8 %161(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %150, i8 noundef signext 32), !dbg !2613
  %163 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !2614, !tbaa !2370
  br label %164, !dbg !2625

164:                                              ; preds = %157, %153
  %165 = phi i8* [ %163, %157 ], [ %139, %153 ], !dbg !2614
  store i8 1, i8* %144, align 1, !dbg !2626, !tbaa !2596
  br label %166, !dbg !2627

166:                                              ; preds = %137, %164
  %167 = phi i8* [ %139, %137 ], [ %165, %164 ], !dbg !2614
  call void @llvm.dbg.value(metadata i8 undef, metadata !2582, metadata !DIExpression()), !dbg !2584
  %168 = getelementptr inbounds i8, i8* %143, i64 224, !dbg !2628
  store i8 32, i8* %168, align 8, !dbg !2629, !tbaa !2630
  call void @llvm.dbg.value(metadata i32 8, metadata !2623, metadata !DIExpression()), !dbg !2631
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2622, metadata !DIExpression()), !dbg !2631
  %169 = getelementptr i8, i8* %167, i64 -24, !dbg !2614
  %170 = bitcast i8* %169 to i64*, !dbg !2614
  %171 = load i64, i64* %170, align 8, !dbg !2614
  %172 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %171, !dbg !2614
  call void @llvm.dbg.value(metadata i8* %172, metadata !2632, metadata !DIExpression()), !dbg !2642
  call void @llvm.dbg.value(metadata i64 8, metadata !2639, metadata !DIExpression()), !dbg !2642
  %173 = getelementptr inbounds i8, i8* %172, i64 16, !dbg !2644
  %174 = bitcast i8* %173 to i64*, !dbg !2644
  call void @llvm.dbg.value(metadata i64 undef, metadata !2640, metadata !DIExpression()), !dbg !2642
  store i64 8, i64* %174, align 8, !dbg !2645, !tbaa !2646
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2647
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2647
  %175 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i64 noundef 3), !dbg !2649
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2650
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2650
  %176 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 noundef 5), !dbg !2652
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2259, metadata !DIExpression()), !dbg !2653
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2348, metadata !DIExpression()), !dbg !2655
  %177 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout), !dbg !2657
  %178 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294968320, i32 1, i64 noundef 0, %struct.ihipStream_t* noundef null), !dbg !2658
  %179 = icmp eq i32 %178, 0, !dbg !2658
  br i1 %179, label %228, label %259, !dbg !2659

180:                                              ; preds = %135, %214
  %181 = phi i64 [ 0, %135 ], [ %226, %214 ]
  call void @llvm.dbg.value(metadata i64 %181, metadata !2235, metadata !DIExpression()), !dbg !2555
  %182 = and i64 %181, 15, !dbg !2660
  %183 = icmp eq i64 %182, 0, !dbg !2664
  br i1 %183, label %184, label %186, !dbg !2665

184:                                              ; preds = %180
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2666
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2666
  %185 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 noundef 5), !dbg !2668
  br label %186, !dbg !2669

186:                                              ; preds = %184, %180
  call void @llvm.dbg.value(metadata i8 32, metadata !2561, metadata !DIExpression()), !dbg !2670
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2570, metadata !DIExpression()), !dbg !2670
  %187 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !2672, !tbaa !2370
  %188 = getelementptr i8, i8* %187, i64 -24, !dbg !2672
  %189 = bitcast i8* %188 to i64*, !dbg !2672
  %190 = load i64, i64* %189, align 8, !dbg !2672
  %191 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %190, !dbg !2672
  call void @llvm.dbg.value(metadata i8* %191, metadata !2574, metadata !DIExpression()), !dbg !2673
  call void @llvm.dbg.value(metadata i8 32, metadata !2581, metadata !DIExpression()), !dbg !2673
  call void @llvm.dbg.value(metadata i8* %191, metadata !2586, metadata !DIExpression()), !dbg !2675
  %192 = getelementptr inbounds i8, i8* %191, i64 225, !dbg !2677
  %193 = load i8, i8* %192, align 1, !dbg !2677, !tbaa !2596, !range !2597
  %194 = icmp eq i8 %193, 0, !dbg !2677
  br i1 %194, label %195, label %214, !dbg !2678

195:                                              ; preds = %186
  call void @llvm.dbg.value(metadata i8* %191, metadata !2574, metadata !DIExpression()), !dbg !2673
  call void @llvm.dbg.value(metadata i8* %191, metadata !2586, metadata !DIExpression()), !dbg !2675
  call void @llvm.dbg.value(metadata i8* %191, metadata !2372, metadata !DIExpression()), !dbg !2679
  call void @llvm.dbg.value(metadata i8 32, metadata !2384, metadata !DIExpression()), !dbg !2679
  %196 = getelementptr inbounds i8, i8* %191, i64 240, !dbg !2681
  %197 = bitcast i8* %196 to %"class.std::ctype"**, !dbg !2681
  %198 = load %"class.std::ctype"*, %"class.std::ctype"** %197, align 8, !dbg !2681, !tbaa !2389
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %198, metadata !2398, metadata !DIExpression()), !dbg !2682
  %199 = icmp eq %"class.std::ctype"* %198, null, !dbg !2684
  br i1 %199, label %200, label %201, !dbg !2685

200:                                              ; preds = %195
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2686
  unreachable, !dbg !2686

201:                                              ; preds = %195
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %198, metadata !2416, metadata !DIExpression()), !dbg !2687
  call void @llvm.dbg.value(metadata i8 32, metadata !2424, metadata !DIExpression()), !dbg !2687
  %202 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %198, i64 0, i32 8, !dbg !2689
  %203 = load i8, i8* %202, align 8, !dbg !2689, !tbaa !2429
  %204 = icmp eq i8 %203, 0, !dbg !2689
  br i1 %204, label %205, label %212, !dbg !2690

205:                                              ; preds = %201
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %198), !dbg !2691
  %206 = bitcast %"class.std::ctype"* %198 to i8 (%"class.std::ctype"*, i8)***, !dbg !2692
  %207 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %206, align 8, !dbg !2692, !tbaa !2370
  %208 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %207, i64 6, !dbg !2692
  %209 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %208, align 8, !dbg !2692
  %210 = call noundef signext i8 %209(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %198, i8 noundef signext 32), !dbg !2692
  %211 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !2693, !tbaa !2370
  br label %212, !dbg !2695

212:                                              ; preds = %205, %201
  %213 = phi i8* [ %211, %205 ], [ %187, %201 ], !dbg !2693
  store i8 1, i8* %192, align 1, !dbg !2696, !tbaa !2596
  br label %214, !dbg !2697

214:                                              ; preds = %186, %212
  %215 = phi i8* [ %187, %186 ], [ %213, %212 ], !dbg !2693
  call void @llvm.dbg.value(metadata i8 undef, metadata !2582, metadata !DIExpression()), !dbg !2673
  %216 = getelementptr inbounds i8, i8* %191, i64 224, !dbg !2698
  store i8 32, i8* %216, align 8, !dbg !2699, !tbaa !2630
  call void @llvm.dbg.value(metadata i32 8, metadata !2623, metadata !DIExpression()), !dbg !2700
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2622, metadata !DIExpression()), !dbg !2700
  %217 = getelementptr i8, i8* %215, i64 -24, !dbg !2693
  %218 = bitcast i8* %217 to i64*, !dbg !2693
  %219 = load i64, i64* %218, align 8, !dbg !2693
  call void @llvm.dbg.value(metadata !DIArgList(i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %219), metadata !2632, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !2701
  call void @llvm.dbg.value(metadata i64 8, metadata !2639, metadata !DIExpression()), !dbg !2701
  %220 = getelementptr i8, i8* bitcast (i64* getelementptr inbounds (%"class.std::basic_ostream", %"class.std::basic_ostream"* @_ZSt4cout, i64 0, i32 1, i32 0, i32 1) to i8*), i64 %219, !dbg !2703
  %221 = bitcast i8* %220 to i64*, !dbg !2703
  call void @llvm.dbg.value(metadata i64 undef, metadata !2640, metadata !DIExpression()), !dbg !2701
  store i64 8, i64* %221, align 8, !dbg !2704, !tbaa !2646
  %222 = getelementptr inbounds i64, i64* %127, i64 %181, !dbg !2705
  %223 = load i64, i64* %222, align 8, !dbg !2705, !tbaa !2706
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2707, metadata !DIExpression()), !dbg !2714
  call void @llvm.dbg.value(metadata i64 %223, metadata !2713, metadata !DIExpression()), !dbg !2714
  %224 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %223), !dbg !2716
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %224, metadata !2280, metadata !DIExpression()), !dbg !2717
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2717
  %225 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %224, i8* noundef nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), i64 noundef 1), !dbg !2719
  %226 = add nuw nsw i64 %181, 1, !dbg !2720
  call void @llvm.dbg.value(metadata i64 %226, metadata !2235, metadata !DIExpression()), !dbg !2555
  %227 = icmp eq i64 %226, 128, !dbg !2721
  br i1 %227, label %137, label %180, !dbg !2556, !llvm.loop !2722

228:                                              ; preds = %166
  %229 = load i64*, i64** %18, align 8, !dbg !2725, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* %229, metadata !2226, metadata !DIExpression()), !dbg !2240
  %230 = load i64*, i64** %19, align 8, !dbg !2726, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* %230, metadata !2231, metadata !DIExpression()), !dbg !2240
  %231 = load i64*, i64** %20, align 8, !dbg !2727, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* %231, metadata !2232, metadata !DIExpression()), !dbg !2240
  %232 = bitcast i64** %3 to i8*, !dbg !2659
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %232), !dbg !2659
  %233 = bitcast i64** %4 to i8*, !dbg !2659
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %233), !dbg !2659
  %234 = bitcast i64** %5 to i8*, !dbg !2659
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %234), !dbg !2659
  %235 = bitcast %struct.dim3* %6 to i8*, !dbg !2659
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %235), !dbg !2659
  %236 = bitcast %struct.dim3* %7 to i8*, !dbg !2659
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %236), !dbg !2659
  %237 = bitcast i64* %8 to i8*, !dbg !2659
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %237), !dbg !2659
  %238 = bitcast i8** %9 to i8*, !dbg !2659
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %238), !dbg !2659
  %239 = bitcast [3 x i8*]* %10 to i8*, !dbg !2659
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %239), !dbg !2659
  store i64* %229, i64** %3, align 8, !dbg !2659, !tbaa !2213
  store i64* %230, i64** %4, align 8, !dbg !2659, !tbaa !2213
  store i64* %231, i64** %5, align 8, !dbg !2659, !tbaa !2213
  %240 = getelementptr inbounds [3 x i8*], [3 x i8*]* %10, i64 0, i64 0, !dbg !2659
  %241 = bitcast [3 x i8*]* %10 to i64***, !dbg !2659
  store i64** %3, i64*** %241, align 16, !dbg !2659
  %242 = getelementptr inbounds [3 x i8*], [3 x i8*]* %10, i64 0, i64 1, !dbg !2659
  %243 = bitcast i8** %242 to i64***, !dbg !2659
  store i64** %4, i64*** %243, align 8, !dbg !2659
  %244 = getelementptr inbounds [3 x i8*], [3 x i8*]* %10, i64 0, i64 2, !dbg !2659
  %245 = bitcast i8** %244 to i64***, !dbg !2659
  store i64** %5, i64*** %245, align 16, !dbg !2659
  %246 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %6, %struct.dim3* nonnull %7, i64* nonnull %8, i8** nonnull %9), !dbg !2659
  %247 = load i64, i64* %8, align 8, !dbg !2659
  %248 = bitcast i8** %9 to %struct.ihipStream_t**, !dbg !2659
  %249 = load %struct.ihipStream_t*, %struct.ihipStream_t** %248, align 8, !dbg !2659
  %250 = bitcast %struct.dim3* %6 to i64*, !dbg !2659
  %251 = load i64, i64* %250, align 8, !dbg !2659
  %252 = getelementptr inbounds %struct.dim3, %struct.dim3* %6, i64 0, i32 2, !dbg !2659
  %253 = load i32, i32* %252, align 8, !dbg !2659
  %254 = bitcast %struct.dim3* %7 to i64*, !dbg !2659
  %255 = load i64, i64* %254, align 8, !dbg !2659
  %256 = getelementptr inbounds %struct.dim3, %struct.dim3* %7, i64 0, i32 2, !dbg !2659
  %257 = load i32, i32* %256, align 8, !dbg !2659
  %258 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void (i64*, i64*, i64*)** @_Z15tick_all_kernelPU7_AtomicmPmPl to i8*), i64 %251, i32 %253, i64 %255, i32 %257, i8** noundef nonnull %240, i64 noundef %247, %struct.ihipStream_t* noundef %249), !dbg !2659
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %232), !dbg !2659
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %233), !dbg !2659
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %234), !dbg !2659
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %235), !dbg !2659
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %236), !dbg !2659
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %237), !dbg !2659
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %238), !dbg !2659
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %239), !dbg !2659
  br label %259, !dbg !2659

259:                                              ; preds = %228, %166
  %260 = bitcast <2 x i64>* %1 to i8*
  br label %261, !dbg !2728

261:                                              ; preds = %275, %259
  %262 = phi i64 [ %276, %275 ], [ 64, %259 ]
  br label %263, !dbg !2729

263:                                              ; preds = %261, %271
  call void @llvm.dbg.value(metadata i64 %262, metadata !2222, metadata !DIExpression()), !dbg !2240
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !2736, metadata !DIExpression()), !dbg !2755
  call void @llvm.dbg.value(metadata i64 0, metadata !2737, metadata !DIExpression()), !dbg !2755
  call void @llvm.dbg.value(metadata i64 1000000, metadata !2744, metadata !DIExpression()), !dbg !2755
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %260) #18, !dbg !2756
  call void @llvm.dbg.declare(metadata %struct.timespec* %2, metadata !2750, metadata !DIExpression()), !dbg !2757
  store <2 x i64> <i64 0, i64 1000000>, <2 x i64>* %1, align 16, !dbg !2758, !tbaa !2706
  br label %264, !dbg !2729

264:                                              ; preds = %267, %263
  %265 = call i32 @nanosleep(%struct.timespec* noundef nonnull %2, %struct.timespec* noundef nonnull %2), !dbg !2759
  %266 = icmp eq i32 %265, -1, !dbg !2760
  br i1 %266, label %267, label %271, !dbg !2761

267:                                              ; preds = %264
  %268 = tail call i32* @__errno_location() #22, !dbg !2762
  %269 = load i32, i32* %268, align 4, !dbg !2762, !tbaa !2242
  %270 = icmp eq i32 %269, 4, !dbg !2763
  br i1 %270, label %264, label %271, !dbg !2729, !llvm.loop !2764

271:                                              ; preds = %264, %267
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %260) #18, !dbg !2766
  %272 = load i64*, i64** %18, align 8, !dbg !2767, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* %272, metadata !2226, metadata !DIExpression()), !dbg !2240
  %273 = load atomic i64, i64* %272 seq_cst, align 8, !dbg !2768, !tbaa !2434
  %274 = icmp eq i64 %273, 0, !dbg !2769
  br i1 %274, label %263, label %275, !dbg !2770

275:                                              ; preds = %271
  %276 = add nsw i64 %262, -1, !dbg !2771
  call void @llvm.dbg.value(metadata i64 %276, metadata !2222, metadata !DIExpression()), !dbg !2240
  %277 = icmp ugt i64 %262, 1, !dbg !2772
  br i1 %277, label %261, label %278, !dbg !2773, !llvm.loop !2774

278:                                              ; preds = %275
  %279 = load i64*, i64** %18, align 8, !dbg !2776, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* %279, metadata !2226, metadata !DIExpression()), !dbg !2240
  %280 = load atomic i64, i64* %279 seq_cst, align 8, !dbg !2778, !tbaa !2434
  %281 = icmp eq i64 %280, 0, !dbg !2779
  br i1 %281, label %311, label %282, !dbg !2780

282:                                              ; preds = %278
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2781
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.7, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2781
  %283 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([60 x i8], [60 x i8]* @.str.7, i64 0, i64 0), i64 noundef 59), !dbg !2783
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2259, metadata !DIExpression()), !dbg !2784
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2784
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2364, metadata !DIExpression()), !dbg !2786
  %284 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !2788, !tbaa !2370
  %285 = getelementptr i8, i8* %284, i64 -24, !dbg !2788
  %286 = bitcast i8* %285 to i64*, !dbg !2788
  %287 = load i64, i64* %286, align 8, !dbg !2788
  %288 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %287, !dbg !2788
  call void @llvm.dbg.value(metadata i8* %288, metadata !2372, metadata !DIExpression()), !dbg !2789
  call void @llvm.dbg.value(metadata i8 10, metadata !2384, metadata !DIExpression()), !dbg !2789
  %289 = getelementptr inbounds i8, i8* %288, i64 240, !dbg !2791
  %290 = bitcast i8* %289 to %"class.std::ctype"**, !dbg !2791
  %291 = load %"class.std::ctype"*, %"class.std::ctype"** %290, align 8, !dbg !2791, !tbaa !2389
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %291, metadata !2398, metadata !DIExpression()), !dbg !2792
  %292 = icmp eq %"class.std::ctype"* %291, null, !dbg !2794
  br i1 %292, label %293, label %294, !dbg !2795

293:                                              ; preds = %282
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2796
  unreachable, !dbg !2796

294:                                              ; preds = %282
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %291, metadata !2416, metadata !DIExpression()), !dbg !2797
  call void @llvm.dbg.value(metadata i8 10, metadata !2424, metadata !DIExpression()), !dbg !2797
  %295 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %291, i64 0, i32 8, !dbg !2799
  %296 = load i8, i8* %295, align 8, !dbg !2799, !tbaa !2429
  %297 = icmp eq i8 %296, 0, !dbg !2799
  br i1 %297, label %301, label %298, !dbg !2800

298:                                              ; preds = %294
  %299 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %291, i64 0, i32 9, i64 10, !dbg !2801
  %300 = load i8, i8* %299, align 1, !dbg !2801, !tbaa !2434
  br label %307, !dbg !2802

301:                                              ; preds = %294
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %291), !dbg !2803
  %302 = bitcast %"class.std::ctype"* %291 to i8 (%"class.std::ctype"*, i8)***, !dbg !2804
  %303 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %302, align 8, !dbg !2804, !tbaa !2370
  %304 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %303, i64 6, !dbg !2804
  %305 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %304, align 8, !dbg !2804
  %306 = call noundef signext i8 %305(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %291, i8 noundef signext 10), !dbg !2804
  br label %307, !dbg !2805

307:                                              ; preds = %298, %301
  %308 = phi i8 [ %300, %298 ], [ %306, %301 ], !dbg !2797
  %309 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %308), !dbg !2806
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %309, metadata !2348, metadata !DIExpression()), !dbg !2807
  %310 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %309), !dbg !2809
  br label %311, !dbg !2810

311:                                              ; preds = %307, %278
  %312 = load i8*, i8** %76, align 8, !dbg !2811, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* undef, metadata !2231, metadata !DIExpression()), !dbg !2240
  call void @"scabbard.trace.host.trace_append$mem"(i16 -32768, ptr null, i64* nonnull @"scabbard.metadata.host.srcId$0x0001", i32 130, i32 17)
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4138, i8* nonnull %73, i64* nonnull @"scabbard.metadata.host.srcId$0x0001", i32 130, i32 17, i64 8192)
  %313 = call i32 @hipMemcpy(i8* noundef nonnull %73, i8* noundef %312, i64 noundef 8192, i32 noundef 2), !dbg !2812
  call void @llvm.dbg.value(metadata i32 %313, metadata !2245, metadata !DIExpression()), !dbg !2813
  %314 = icmp eq i32 %313, 0, !dbg !2815
  br i1 %314, label %319, label %315, !dbg !2816

315:                                              ; preds = %311
  %316 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !2817
  %317 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %316, i32 noundef %313), !dbg !2818
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %317, metadata !2259, metadata !DIExpression()), !dbg !2819
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2819
  %318 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %317), !dbg !2821
  call void @exit(i32 noundef 1) #19, !dbg !2822
  unreachable, !dbg !2822

319:                                              ; preds = %311
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2823
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2823
  %320 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i64 0, i64 0), i64 noundef 23), !dbg !2825
  %321 = load i64*, i64** %18, align 8, !dbg !2826, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* %321, metadata !2226, metadata !DIExpression()), !dbg !2240
  %322 = load atomic i64, i64* %321 seq_cst, align 8, !dbg !2827, !tbaa !2434
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2828, metadata !DIExpression()), !dbg !2835
  call void @llvm.dbg.value(metadata i64 %322, metadata !2834, metadata !DIExpression()), !dbg !2835
  %323 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %322), !dbg !2837
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %323, metadata !2280, metadata !DIExpression()), !dbg !2838
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2838
  %324 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %323, i8* noundef nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i64 0, i64 0), i64 noundef 35), !dbg !2840
  call void @llvm.dbg.value(metadata i64 0, metadata !2237, metadata !DIExpression()), !dbg !2841
  br label %418, !dbg !2842

325:                                              ; preds = %452
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2843
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2843
  %326 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 noundef 5), !dbg !2846
  call void @llvm.dbg.value(metadata i8 32, metadata !2561, metadata !DIExpression()), !dbg !2847
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2570, metadata !DIExpression()), !dbg !2847
  %327 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !2849, !tbaa !2370
  %328 = getelementptr i8, i8* %327, i64 -24, !dbg !2849
  %329 = bitcast i8* %328 to i64*, !dbg !2849
  %330 = load i64, i64* %329, align 8, !dbg !2849
  %331 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %330, !dbg !2849
  call void @llvm.dbg.value(metadata i8* %331, metadata !2574, metadata !DIExpression()), !dbg !2850
  call void @llvm.dbg.value(metadata i8 32, metadata !2581, metadata !DIExpression()), !dbg !2850
  call void @llvm.dbg.value(metadata i8* %331, metadata !2586, metadata !DIExpression()), !dbg !2852
  %332 = getelementptr inbounds i8, i8* %331, i64 225, !dbg !2854
  %333 = load i8, i8* %332, align 1, !dbg !2854, !tbaa !2596, !range !2597
  %334 = icmp eq i8 %333, 0, !dbg !2854
  br i1 %334, label %335, label %354, !dbg !2855

335:                                              ; preds = %325
  call void @llvm.dbg.value(metadata i8* %331, metadata !2574, metadata !DIExpression()), !dbg !2850
  call void @llvm.dbg.value(metadata i8* %331, metadata !2586, metadata !DIExpression()), !dbg !2852
  call void @llvm.dbg.value(metadata i8* %331, metadata !2372, metadata !DIExpression()), !dbg !2856
  call void @llvm.dbg.value(metadata i8 32, metadata !2384, metadata !DIExpression()), !dbg !2856
  %336 = getelementptr inbounds i8, i8* %331, i64 240, !dbg !2858
  %337 = bitcast i8* %336 to %"class.std::ctype"**, !dbg !2858
  %338 = load %"class.std::ctype"*, %"class.std::ctype"** %337, align 8, !dbg !2858, !tbaa !2389
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %338, metadata !2398, metadata !DIExpression()), !dbg !2859
  %339 = icmp eq %"class.std::ctype"* %338, null, !dbg !2861
  br i1 %339, label %340, label %341, !dbg !2862

340:                                              ; preds = %335
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2863
  unreachable, !dbg !2863

341:                                              ; preds = %335
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %338, metadata !2416, metadata !DIExpression()), !dbg !2864
  call void @llvm.dbg.value(metadata i8 32, metadata !2424, metadata !DIExpression()), !dbg !2864
  %342 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %338, i64 0, i32 8, !dbg !2866
  %343 = load i8, i8* %342, align 8, !dbg !2866, !tbaa !2429
  %344 = icmp eq i8 %343, 0, !dbg !2866
  br i1 %344, label %345, label %352, !dbg !2867

345:                                              ; preds = %341
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %338), !dbg !2868
  %346 = bitcast %"class.std::ctype"* %338 to i8 (%"class.std::ctype"*, i8)***, !dbg !2869
  %347 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %346, align 8, !dbg !2869, !tbaa !2370
  %348 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %347, i64 6, !dbg !2869
  %349 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %348, align 8, !dbg !2869
  %350 = call noundef signext i8 %349(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %338, i8 noundef signext 32), !dbg !2869
  %351 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !2870, !tbaa !2370
  br label %352, !dbg !2872

352:                                              ; preds = %345, %341
  %353 = phi i8* [ %351, %345 ], [ %327, %341 ], !dbg !2870
  store i8 1, i8* %332, align 1, !dbg !2873, !tbaa !2596
  br label %354, !dbg !2874

354:                                              ; preds = %325, %352
  %355 = phi i8* [ %327, %325 ], [ %353, %352 ], !dbg !2870
  call void @llvm.dbg.value(metadata i8 undef, metadata !2582, metadata !DIExpression()), !dbg !2850
  %356 = getelementptr inbounds i8, i8* %331, i64 224, !dbg !2875
  store i8 32, i8* %356, align 8, !dbg !2876, !tbaa !2630
  call void @llvm.dbg.value(metadata i32 8, metadata !2623, metadata !DIExpression()), !dbg !2877
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2622, metadata !DIExpression()), !dbg !2877
  %357 = getelementptr i8, i8* %355, i64 -24, !dbg !2870
  %358 = bitcast i8* %357 to i64*, !dbg !2870
  %359 = load i64, i64* %358, align 8, !dbg !2870
  %360 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %359, !dbg !2870
  call void @llvm.dbg.value(metadata i8* %360, metadata !2632, metadata !DIExpression()), !dbg !2878
  call void @llvm.dbg.value(metadata i64 8, metadata !2639, metadata !DIExpression()), !dbg !2878
  %361 = getelementptr inbounds i8, i8* %360, i64 16, !dbg !2880
  %362 = bitcast i8* %361 to i64*, !dbg !2880
  call void @llvm.dbg.value(metadata i64 undef, metadata !2640, metadata !DIExpression()), !dbg !2878
  store i64 8, i64* %362, align 8, !dbg !2881, !tbaa !2646
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2882
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2882
  %363 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i64 noundef 3), !dbg !2884
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2885
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2885
  %364 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 noundef 5), !dbg !2887
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2259, metadata !DIExpression()), !dbg !2888
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2888
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2364, metadata !DIExpression()), !dbg !2890
  %365 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !2892, !tbaa !2370
  %366 = getelementptr i8, i8* %365, i64 -24, !dbg !2892
  %367 = bitcast i8* %366 to i64*, !dbg !2892
  %368 = load i64, i64* %367, align 8, !dbg !2892
  %369 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %368, !dbg !2892
  call void @llvm.dbg.value(metadata i8* %369, metadata !2372, metadata !DIExpression()), !dbg !2893
  call void @llvm.dbg.value(metadata i8 10, metadata !2384, metadata !DIExpression()), !dbg !2893
  %370 = getelementptr inbounds i8, i8* %369, i64 240, !dbg !2895
  %371 = bitcast i8* %370 to %"class.std::ctype"**, !dbg !2895
  %372 = load %"class.std::ctype"*, %"class.std::ctype"** %371, align 8, !dbg !2895, !tbaa !2389
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %372, metadata !2398, metadata !DIExpression()), !dbg !2896
  %373 = icmp eq %"class.std::ctype"* %372, null, !dbg !2898
  br i1 %373, label %374, label %375, !dbg !2899

374:                                              ; preds = %354
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2900
  unreachable, !dbg !2900

375:                                              ; preds = %354
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %372, metadata !2416, metadata !DIExpression()), !dbg !2901
  call void @llvm.dbg.value(metadata i8 10, metadata !2424, metadata !DIExpression()), !dbg !2901
  %376 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %372, i64 0, i32 8, !dbg !2903
  %377 = load i8, i8* %376, align 8, !dbg !2903, !tbaa !2429
  %378 = icmp eq i8 %377, 0, !dbg !2903
  br i1 %378, label %382, label %379, !dbg !2904

379:                                              ; preds = %375
  %380 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %372, i64 0, i32 9, i64 10, !dbg !2905
  %381 = load i8, i8* %380, align 1, !dbg !2905, !tbaa !2434
  br label %388, !dbg !2906

382:                                              ; preds = %375
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %372), !dbg !2907
  %383 = bitcast %"class.std::ctype"* %372 to i8 (%"class.std::ctype"*, i8)***, !dbg !2908
  %384 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %383, align 8, !dbg !2908, !tbaa !2370
  %385 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %384, i64 6, !dbg !2908
  %386 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %385, align 8, !dbg !2908
  %387 = call noundef signext i8 %386(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %372, i8 noundef signext 10), !dbg !2908
  br label %388, !dbg !2909

388:                                              ; preds = %379, %382
  %389 = phi i8 [ %381, %379 ], [ %387, %382 ], !dbg !2901
  %390 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %389), !dbg !2910
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %390, metadata !2348, metadata !DIExpression()), !dbg !2911
  %391 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %390), !dbg !2913
  %392 = load i8*, i8** %76, align 8, !dbg !2914, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* undef, metadata !2231, metadata !DIExpression()), !dbg !2240
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4160, ptr null, i64* nonnull @"scabbard.metadata.host.srcId$0x0001", i32 148, i32 17, i64 0)
  %393 = call i32 @hipFree(i8* noundef %392), !dbg !2915
  call void @llvm.dbg.value(metadata i32 %393, metadata !2245, metadata !DIExpression()), !dbg !2916
  %394 = icmp eq i32 %393, 0, !dbg !2918
  br i1 %394, label %399, label %395, !dbg !2919

395:                                              ; preds = %388
  %396 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !2920
  %397 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %396, i32 noundef %393), !dbg !2921
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %397, metadata !2259, metadata !DIExpression()), !dbg !2922
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2922
  %398 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %397), !dbg !2924
  call void @exit(i32 noundef 1) #19, !dbg !2925
  unreachable, !dbg !2925

399:                                              ; preds = %388
  %400 = load i8*, i8** %64, align 8, !dbg !2926, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* undef, metadata !2226, metadata !DIExpression()), !dbg !2240
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4160, ptr null, i64* nonnull @"scabbard.metadata.host.srcId$0x0001", i32 149, i32 17, i64 0)
  %401 = call i32 @hipFree(i8* noundef %400), !dbg !2927
  call void @llvm.dbg.value(metadata i32 %401, metadata !2245, metadata !DIExpression()), !dbg !2928
  %402 = icmp eq i32 %401, 0, !dbg !2930
  br i1 %402, label %407, label %403, !dbg !2931

403:                                              ; preds = %399
  %404 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !2932
  %405 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %404, i32 noundef %401), !dbg !2933
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %405, metadata !2259, metadata !DIExpression()), !dbg !2934
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2934
  %406 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %405), !dbg !2936
  call void @exit(i32 noundef 1) #19, !dbg !2937
  unreachable, !dbg !2937

407:                                              ; preds = %399
  %408 = load i8*, i8** %93, align 8, !dbg !2938, !tbaa !2213
  call void @llvm.dbg.value(metadata i64* undef, metadata !2232, metadata !DIExpression()), !dbg !2240
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4160, ptr null, i64* nonnull @"scabbard.metadata.host.srcId$0x0001", i32 150, i32 17, i64 0)
  %409 = call i32 @hipFree(i8* noundef %408), !dbg !2939
  call void @llvm.dbg.value(metadata i32 %409, metadata !2245, metadata !DIExpression()), !dbg !2940
  %410 = icmp eq i32 %409, 0, !dbg !2942
  br i1 %410, label %415, label %411, !dbg !2943

411:                                              ; preds = %407
  %412 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !2944
  %413 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %412, i32 noundef %409), !dbg !2945
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %413, metadata !2259, metadata !DIExpression()), !dbg !2946
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !2946
  %414 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %413), !dbg !2948
  call void @exit(i32 noundef 1) #19, !dbg !2949
  unreachable, !dbg !2949

415:                                              ; preds = %407
  call void @_ZdaPv(i8* noundef nonnull %73) #23, !dbg !2950
  call void @_ZdaPv(i8* noundef nonnull %126) #23, !dbg !2951
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2952
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.10, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2952
  %416 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @.str.10, i64 0, i64 0), i64 noundef 34), !dbg !2954
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2259, metadata !DIExpression()), !dbg !2955
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2348, metadata !DIExpression()), !dbg !2957
  %417 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout), !dbg !2959
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %92) #18, !dbg !2960
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %75) #18, !dbg !2960
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %63) #18, !dbg !2960
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %21) #18, !dbg !2960
  ret void, !dbg !2960

418:                                              ; preds = %319, %452
  %419 = phi i64 [ 0, %319 ], [ %464, %452 ]
  call void @llvm.dbg.value(metadata i64 %419, metadata !2237, metadata !DIExpression()), !dbg !2841
  %420 = and i64 %419, 15, !dbg !2961
  %421 = icmp eq i64 %420, 0, !dbg !2965
  br i1 %421, label %422, label %424, !dbg !2966

422:                                              ; preds = %418
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !2967
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !2967
  %423 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 noundef 5), !dbg !2969
  br label %424, !dbg !2970

424:                                              ; preds = %422, %418
  call void @llvm.dbg.value(metadata i8 32, metadata !2561, metadata !DIExpression()), !dbg !2971
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2570, metadata !DIExpression()), !dbg !2971
  %425 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !2973, !tbaa !2370
  %426 = getelementptr i8, i8* %425, i64 -24, !dbg !2973
  %427 = bitcast i8* %426 to i64*, !dbg !2973
  %428 = load i64, i64* %427, align 8, !dbg !2973
  %429 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %428, !dbg !2973
  call void @llvm.dbg.value(metadata i8* %429, metadata !2574, metadata !DIExpression()), !dbg !2974
  call void @llvm.dbg.value(metadata i8 32, metadata !2581, metadata !DIExpression()), !dbg !2974
  call void @llvm.dbg.value(metadata i8* %429, metadata !2586, metadata !DIExpression()), !dbg !2976
  %430 = getelementptr inbounds i8, i8* %429, i64 225, !dbg !2978
  %431 = load i8, i8* %430, align 1, !dbg !2978, !tbaa !2596, !range !2597
  %432 = icmp eq i8 %431, 0, !dbg !2978
  br i1 %432, label %433, label %452, !dbg !2979

433:                                              ; preds = %424
  call void @llvm.dbg.value(metadata i8* %429, metadata !2574, metadata !DIExpression()), !dbg !2974
  call void @llvm.dbg.value(metadata i8* %429, metadata !2586, metadata !DIExpression()), !dbg !2976
  call void @llvm.dbg.value(metadata i8* %429, metadata !2372, metadata !DIExpression()), !dbg !2980
  call void @llvm.dbg.value(metadata i8 32, metadata !2384, metadata !DIExpression()), !dbg !2980
  %434 = getelementptr inbounds i8, i8* %429, i64 240, !dbg !2982
  %435 = bitcast i8* %434 to %"class.std::ctype"**, !dbg !2982
  %436 = load %"class.std::ctype"*, %"class.std::ctype"** %435, align 8, !dbg !2982, !tbaa !2389
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %436, metadata !2398, metadata !DIExpression()), !dbg !2983
  %437 = icmp eq %"class.std::ctype"* %436, null, !dbg !2985
  br i1 %437, label %438, label %439, !dbg !2986

438:                                              ; preds = %433
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2987
  unreachable, !dbg !2987

439:                                              ; preds = %433
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %436, metadata !2416, metadata !DIExpression()), !dbg !2988
  call void @llvm.dbg.value(metadata i8 32, metadata !2424, metadata !DIExpression()), !dbg !2988
  %440 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %436, i64 0, i32 8, !dbg !2990
  %441 = load i8, i8* %440, align 8, !dbg !2990, !tbaa !2429
  %442 = icmp eq i8 %441, 0, !dbg !2990
  br i1 %442, label %443, label %450, !dbg !2991

443:                                              ; preds = %439
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %436), !dbg !2992
  %444 = bitcast %"class.std::ctype"* %436 to i8 (%"class.std::ctype"*, i8)***, !dbg !2993
  %445 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %444, align 8, !dbg !2993, !tbaa !2370
  %446 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %445, i64 6, !dbg !2993
  %447 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %446, align 8, !dbg !2993
  %448 = call noundef signext i8 %447(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %436, i8 noundef signext 32), !dbg !2993
  %449 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !2994, !tbaa !2370
  br label %450, !dbg !2996

450:                                              ; preds = %443, %439
  %451 = phi i8* [ %449, %443 ], [ %425, %439 ], !dbg !2994
  store i8 1, i8* %430, align 1, !dbg !2997, !tbaa !2596
  br label %452, !dbg !2998

452:                                              ; preds = %424, %450
  %453 = phi i8* [ %425, %424 ], [ %451, %450 ], !dbg !2994
  call void @llvm.dbg.value(metadata i8 undef, metadata !2582, metadata !DIExpression()), !dbg !2974
  %454 = getelementptr inbounds i8, i8* %429, i64 224, !dbg !2999
  store i8 32, i8* %454, align 8, !dbg !3000, !tbaa !2630
  call void @llvm.dbg.value(metadata i32 8, metadata !2623, metadata !DIExpression()), !dbg !3001
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2622, metadata !DIExpression()), !dbg !3001
  %455 = getelementptr i8, i8* %453, i64 -24, !dbg !2994
  %456 = bitcast i8* %455 to i64*, !dbg !2994
  %457 = load i64, i64* %456, align 8, !dbg !2994
  call void @llvm.dbg.value(metadata !DIArgList(i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %457), metadata !2632, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !3002
  call void @llvm.dbg.value(metadata i64 8, metadata !2639, metadata !DIExpression()), !dbg !3002
  %458 = getelementptr i8, i8* bitcast (i64* getelementptr inbounds (%"class.std::basic_ostream", %"class.std::basic_ostream"* @_ZSt4cout, i64 0, i32 1, i32 0, i32 1) to i8*), i64 %457, !dbg !3004
  %459 = bitcast i8* %458 to i64*, !dbg !3004
  call void @llvm.dbg.value(metadata i64 undef, metadata !2640, metadata !DIExpression()), !dbg !3002
  store i64 8, i64* %459, align 8, !dbg !3005, !tbaa !2646
  %460 = getelementptr inbounds i64, i64* %74, i64 %419, !dbg !3006
  %461 = load i64, i64* %460, align 8, !dbg !3006, !tbaa !2706
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2828, metadata !DIExpression()), !dbg !3007
  call void @llvm.dbg.value(metadata i64 %461, metadata !2834, metadata !DIExpression()), !dbg !3007
  %462 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %461), !dbg !3009
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %462, metadata !2280, metadata !DIExpression()), !dbg !3010
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !3010
  %463 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %462, i8* noundef nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), i64 noundef 1), !dbg !3012
  %464 = add nuw nsw i64 %419, 1, !dbg !3013
  call void @llvm.dbg.value(metadata i64 %464, metadata !2237, metadata !DIExpression()), !dbg !2841
  %465 = icmp eq i64 %464, 128, !dbg !3014
  br i1 %465, label %325, label %418, !dbg !2842, !llvm.loop !3015
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #6

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13__HIP_CHECK__10hipError_t(i32 noundef %0) local_unnamed_addr #7 !dbg !2246 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !2245, metadata !DIExpression()), !dbg !3017
  %2 = icmp eq i32 %0, 0, !dbg !3018
  br i1 %2, label %7, label %3, !dbg !3019

3:                                                ; preds = %1
  %4 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !3020
  %5 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %4, i32 noundef %0), !dbg !3021
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %5, metadata !2259, metadata !DIExpression()), !dbg !3022
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !3022
  %6 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %5), !dbg !3024
  tail call void @exit(i32 noundef 1) #19, !dbg !3025
  unreachable, !dbg !3025

7:                                                ; preds = %1
  ret void, !dbg !3026
}

declare !dbg !3027 dso_local i32 @hipGetDevice(i32* noundef) local_unnamed_addr #0

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef) local_unnamed_addr #8

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #0

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #8

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull i8* @_Znam(i64 noundef) local_unnamed_addr #9

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #10

declare !dbg !3030 dso_local i32 @hipMemcpy(i8* noundef, i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare dso_local i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, %struct.ihipStream_t* noundef) local_unnamed_addr #0

; Function Attrs: norecurse uwtable
define dso_local void @_Z25__device_stub__dummy_initPl(i64* noundef %0) #3 {
  %2 = alloca i64*, align 8
  %3 = alloca %struct.dim3, align 8
  %4 = alloca %struct.dim3, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  store i64* %0, i64** %2, align 8, !tbaa !2213
  %7 = alloca i8*, align 16
  %8 = bitcast i8** %7 to i64***
  store i64** %2, i64*** %8, align 16
  %9 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %3, %struct.dim3* nonnull %4, i64* nonnull %5, i8** nonnull %6)
  %10 = load i64, i64* %5, align 8
  %11 = bitcast i8** %6 to %struct.ihipStream_t**
  %12 = load %struct.ihipStream_t*, %struct.ihipStream_t** %11, align 8
  %13 = bitcast %struct.dim3* %3 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds %struct.dim3, %struct.dim3* %3, i64 0, i32 2
  %16 = load i32, i32* %15, align 8
  %17 = bitcast %struct.dim3* %4 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = getelementptr inbounds %struct.dim3, %struct.dim3* %4, i64 0, i32 2
  %20 = load i32, i32* %19, align 8
  %21 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void (i64*)** @_Z10dummy_initPl to i8*), i64 %14, i32 %16, i64 %18, i32 %20, i8** noundef nonnull %7, i64 noundef %10, %struct.ihipStream_t* noundef %12)
  ret void
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

declare !dbg !3034 dso_local i32 @hipFree(i8* noundef) local_unnamed_addr #0

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdaPv(i8* noundef) local_unnamed_addr #11

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #12 !dbg !2119 {
  tail call void @scabbard.trace.scabbard_init()
  %1 = alloca %struct.hipDeviceProp_t, align 8
  %2 = getelementptr inbounds %struct.hipDeviceProp_t, %struct.hipDeviceProp_t* %1, i64 0, i32 0, i64 0, !dbg !3037
  call void @llvm.lifetime.start.p0i8(i64 792, i8* nonnull %2) #18, !dbg !3037
  call void @llvm.dbg.declare(metadata %struct.hipDeviceProp_t* %1, metadata !2121, metadata !DIExpression()), !dbg !3038
  %3 = call i32 @hipGetDeviceProperties(%struct.hipDeviceProp_t* noundef nonnull %1, i32 noundef 0), !dbg !3039
  call void @llvm.dbg.value(metadata i32 %3, metadata !2245, metadata !DIExpression()), !dbg !3040
  %4 = icmp eq i32 %3, 0, !dbg !3042
  br i1 %4, label %9, label %5, !dbg !3043

5:                                                ; preds = %0
  %6 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0)), !dbg !3044
  %7 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %6, i32 noundef %3), !dbg !3045
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %7, metadata !2259, metadata !DIExpression()), !dbg !3046
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !3046
  %8 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %7), !dbg !3048
  call void @exit(i32 noundef 1) #19, !dbg !3049
  unreachable, !dbg !3049

9:                                                ; preds = %0
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !3050
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !3050
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i64 0, i64 0), metadata !3052, metadata !DIExpression()), !dbg !3055
  %10 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i64 0, i64 0), i64 noundef 14), !dbg !3057
  %11 = getelementptr inbounds %struct.hipDeviceProp_t, %struct.hipDeviceProp_t* %1, i64 0, i32 13, !dbg !3058
  %12 = load i32, i32* %11, align 4, !dbg !3058, !tbaa !3059
  %13 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %12), !dbg !3062
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %13, metadata !2259, metadata !DIExpression()), !dbg !3063
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !3063
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %13, metadata !2364, metadata !DIExpression()), !dbg !3065
  %14 = bitcast %"class.std::basic_ostream"* %13 to i8**, !dbg !3067
  %15 = load i8*, i8** %14, align 8, !dbg !3067, !tbaa !2370
  %16 = getelementptr i8, i8* %15, i64 -24, !dbg !3067
  %17 = bitcast i8* %16 to i64*, !dbg !3067
  %18 = load i64, i64* %17, align 8, !dbg !3067
  %19 = bitcast %"class.std::basic_ostream"* %13 to i8*, !dbg !3067
  %20 = getelementptr inbounds i8, i8* %19, i64 %18, !dbg !3067
  call void @llvm.dbg.value(metadata i8* %20, metadata !2372, metadata !DIExpression()), !dbg !3068
  call void @llvm.dbg.value(metadata i8 10, metadata !2384, metadata !DIExpression()), !dbg !3068
  %21 = getelementptr inbounds i8, i8* %20, i64 240, !dbg !3070
  %22 = bitcast i8* %21 to %"class.std::ctype"**, !dbg !3070
  %23 = load %"class.std::ctype"*, %"class.std::ctype"** %22, align 8, !dbg !3070, !tbaa !2389
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %23, metadata !2398, metadata !DIExpression()), !dbg !3071
  %24 = icmp eq %"class.std::ctype"* %23, null, !dbg !3073
  br i1 %24, label %25, label %26, !dbg !3074

25:                                               ; preds = %9
  call void @_ZSt16__throw_bad_castv() #20, !dbg !3075
  unreachable, !dbg !3075

26:                                               ; preds = %9
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %23, metadata !2416, metadata !DIExpression()), !dbg !3076
  call void @llvm.dbg.value(metadata i8 10, metadata !2424, metadata !DIExpression()), !dbg !3076
  %27 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %23, i64 0, i32 8, !dbg !3078
  %28 = load i8, i8* %27, align 8, !dbg !3078, !tbaa !2429
  %29 = icmp eq i8 %28, 0, !dbg !3078
  br i1 %29, label %33, label %30, !dbg !3079

30:                                               ; preds = %26
  %31 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %23, i64 0, i32 9, i64 10, !dbg !3080
  %32 = load i8, i8* %31, align 1, !dbg !3080, !tbaa !2434
  br label %39, !dbg !3081

33:                                               ; preds = %26
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %23), !dbg !3082
  %34 = bitcast %"class.std::ctype"* %23 to i8 (%"class.std::ctype"*, i8)***, !dbg !3083
  %35 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %34, align 8, !dbg !3083, !tbaa !2370
  %36 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %35, i64 6, !dbg !3083
  %37 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %36, align 8, !dbg !3083
  %38 = call noundef signext i8 %37(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %23, i8 noundef signext 10), !dbg !3083
  br label %39, !dbg !3084

39:                                               ; preds = %30, %33
  %40 = phi i8 [ %32, %30 ], [ %38, %33 ], !dbg !3076
  %41 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %13, i8 noundef signext %40), !dbg !3085
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %41, metadata !2348, metadata !DIExpression()), !dbg !3086
  %42 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %41), !dbg !3088
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !3089
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !3089
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i64 0, i64 0), metadata !3052, metadata !DIExpression()), !dbg !3091
  %43 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i64 0, i64 0), i64 noundef 14), !dbg !3093
  %44 = getelementptr inbounds %struct.hipDeviceProp_t, %struct.hipDeviceProp_t* %1, i64 0, i32 12, !dbg !3094
  %45 = load i32, i32* %44, align 8, !dbg !3094, !tbaa !3095
  %46 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %45), !dbg !3096
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %46, metadata !2259, metadata !DIExpression()), !dbg !3097
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !3097
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %46, metadata !2364, metadata !DIExpression()), !dbg !3099
  %47 = bitcast %"class.std::basic_ostream"* %46 to i8**, !dbg !3101
  %48 = load i8*, i8** %47, align 8, !dbg !3101, !tbaa !2370
  %49 = getelementptr i8, i8* %48, i64 -24, !dbg !3101
  %50 = bitcast i8* %49 to i64*, !dbg !3101
  %51 = load i64, i64* %50, align 8, !dbg !3101
  %52 = bitcast %"class.std::basic_ostream"* %46 to i8*, !dbg !3101
  %53 = getelementptr inbounds i8, i8* %52, i64 %51, !dbg !3101
  call void @llvm.dbg.value(metadata i8* %53, metadata !2372, metadata !DIExpression()), !dbg !3102
  call void @llvm.dbg.value(metadata i8 10, metadata !2384, metadata !DIExpression()), !dbg !3102
  %54 = getelementptr inbounds i8, i8* %53, i64 240, !dbg !3104
  %55 = bitcast i8* %54 to %"class.std::ctype"**, !dbg !3104
  %56 = load %"class.std::ctype"*, %"class.std::ctype"** %55, align 8, !dbg !3104, !tbaa !2389
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %56, metadata !2398, metadata !DIExpression()), !dbg !3105
  %57 = icmp eq %"class.std::ctype"* %56, null, !dbg !3107
  br i1 %57, label %58, label %59, !dbg !3108

58:                                               ; preds = %39
  call void @_ZSt16__throw_bad_castv() #20, !dbg !3109
  unreachable, !dbg !3109

59:                                               ; preds = %39
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %56, metadata !2416, metadata !DIExpression()), !dbg !3110
  call void @llvm.dbg.value(metadata i8 10, metadata !2424, metadata !DIExpression()), !dbg !3110
  %60 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %56, i64 0, i32 8, !dbg !3112
  %61 = load i8, i8* %60, align 8, !dbg !3112, !tbaa !2429
  %62 = icmp eq i8 %61, 0, !dbg !3112
  br i1 %62, label %66, label %63, !dbg !3113

63:                                               ; preds = %59
  %64 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %56, i64 0, i32 9, i64 10, !dbg !3114
  %65 = load i8, i8* %64, align 1, !dbg !3114, !tbaa !2434
  br label %72, !dbg !3115

66:                                               ; preds = %59
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %56), !dbg !3116
  %67 = bitcast %"class.std::ctype"* %56 to i8 (%"class.std::ctype"*, i8)***, !dbg !3117
  %68 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %67, align 8, !dbg !3117, !tbaa !2370
  %69 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %68, i64 6, !dbg !3117
  %70 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %69, align 8, !dbg !3117
  %71 = call noundef signext i8 %70(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %56, i8 noundef signext 10), !dbg !3117
  br label %72, !dbg !3118

72:                                               ; preds = %63, %66
  %73 = phi i8 [ %65, %63 ], [ %71, %66 ], !dbg !3110
  %74 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %46, i8 noundef signext %73), !dbg !3119
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %74, metadata !2348, metadata !DIExpression()), !dbg !3120
  %75 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %74), !dbg !3122
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !3123
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.13, i64 0, i64 0), metadata !2286, metadata !DIExpression()), !dbg !3123
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.13, i64 0, i64 0), metadata !3052, metadata !DIExpression()), !dbg !3125
  %76 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.13, i64 0, i64 0), i64 noundef 17), !dbg !3127
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2280, metadata !DIExpression()), !dbg !3128
  call void @llvm.dbg.value(metadata i8* %2, metadata !2286, metadata !DIExpression()), !dbg !3128
  call void @llvm.dbg.value(metadata i8* %2, metadata !3052, metadata !DIExpression()), !dbg !3130
  %77 = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %2) #18, !dbg !3132
  %78 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull %2, i64 noundef %77), !dbg !3133
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2259, metadata !DIExpression()), !dbg !3134
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2274, metadata !DIExpression()), !dbg !3134
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2364, metadata !DIExpression()), !dbg !3136
  %79 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !dbg !3138, !tbaa !2370
  %80 = getelementptr i8, i8* %79, i64 -24, !dbg !3138
  %81 = bitcast i8* %80 to i64*, !dbg !3138
  %82 = load i64, i64* %81, align 8, !dbg !3138
  %83 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %82, !dbg !3138
  call void @llvm.dbg.value(metadata i8* %83, metadata !2372, metadata !DIExpression()), !dbg !3139
  call void @llvm.dbg.value(metadata i8 10, metadata !2384, metadata !DIExpression()), !dbg !3139
  %84 = getelementptr inbounds i8, i8* %83, i64 240, !dbg !3141
  %85 = bitcast i8* %84 to %"class.std::ctype"**, !dbg !3141
  %86 = load %"class.std::ctype"*, %"class.std::ctype"** %85, align 8, !dbg !3141, !tbaa !2389
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %86, metadata !2398, metadata !DIExpression()), !dbg !3142
  %87 = icmp eq %"class.std::ctype"* %86, null, !dbg !3144
  br i1 %87, label %88, label %89, !dbg !3145

88:                                               ; preds = %72
  call void @_ZSt16__throw_bad_castv() #20, !dbg !3146
  unreachable, !dbg !3146

89:                                               ; preds = %72
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %86, metadata !2416, metadata !DIExpression()), !dbg !3147
  call void @llvm.dbg.value(metadata i8 10, metadata !2424, metadata !DIExpression()), !dbg !3147
  %90 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %86, i64 0, i32 8, !dbg !3149
  %91 = load i8, i8* %90, align 8, !dbg !3149, !tbaa !2429
  %92 = icmp eq i8 %91, 0, !dbg !3149
  br i1 %92, label %96, label %93, !dbg !3150

93:                                               ; preds = %89
  %94 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %86, i64 0, i32 9, i64 10, !dbg !3151
  %95 = load i8, i8* %94, align 1, !dbg !3151, !tbaa !2434
  br label %102, !dbg !3152

96:                                               ; preds = %89
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %86), !dbg !3153
  %97 = bitcast %"class.std::ctype"* %86 to i8 (%"class.std::ctype"*, i8)***, !dbg !3154
  %98 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %97, align 8, !dbg !3154, !tbaa !2370
  %99 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %98, i64 6, !dbg !3154
  %100 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %99, align 8, !dbg !3154
  %101 = call noundef signext i8 %100(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %86, i8 noundef signext 10), !dbg !3154
  br label %102, !dbg !3155

102:                                              ; preds = %93, %96
  %103 = phi i8 [ %95, %93 ], [ %101, %96 ], !dbg !3147
  %104 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %103), !dbg !3156
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %104, metadata !2348, metadata !DIExpression()), !dbg !3157
  %105 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %104), !dbg !3159
  call void @_Z13tick_all_testv(), !dbg !3160
  call void @llvm.lifetime.end.p0i8(i64 792, i8* nonnull %2) #18, !dbg !3161
  ret i32 0, !dbg !3162
}

declare !dbg !3163 dso_local i32 @hipGetDeviceProperties(%struct.hipDeviceProp_t* noundef, i32 noundef) local_unnamed_addr #0

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #13

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef, i64 noundef) local_unnamed_addr #0

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strlen(i8* nocapture noundef) local_unnamed_addr #14

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #15

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

declare !dbg !3167 dso_local i32 @hipMallocManaged(i8** noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare !dbg !3170 dso_local i32 @hipMalloc(i8** noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

declare !dbg !3173 dso_local i32 @nanosleep(%struct.timespec* noundef, %struct.timespec* noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare dso_local i32* @__errno_location() local_unnamed_addr #16

declare dso_local i32 @__gxx_personality_v0(...)

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_managed_clock_test.cpp() #4 section ".text.startup" !dbg !3178 {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit), !dbg !3180
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #18, !dbg !3184
  ret void
}

declare dso_local i32 @__hipRegisterFunction(i8**, i8*, i8*, i8*, i32, i8*, i8*, i8*, i8*, i32*) local_unnamed_addr

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
  %7 = tail call i32 @__hipRegisterFunction(i8** %6, i8* bitcast (void (i64*, i64*, i64*)** @_Z15tick_all_kernelPU7_AtomicmPmPl to i8*), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @0, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @0, i64 0, i64 0), i32 -1, i8* null, i8* null, i8* null, i8* null, i32* null)
  %8 = tail call i32 @__hipRegisterFunction(i8** %6, i8* bitcast (void (i64*)** @_Z10dummy_initPl to i8*), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i64 0, i64 0), i32 -1, i8* null, i8* null, i8* null, i8* null, i32* null)
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #17

declare void @scabbard.trace.scabbard_init(void)

declare void @"scabbard.trace.host.trace_append$mem"(i16, ptr, ptr, i32, i32)

declare void @"scabbard.trace.host.trace_append$alloc"(i16, ptr, ptr, i32, i32, i64)

declare i64 @"scabbard.trace.metadata_register$src"(i8*)

define void @scabbard.trace.module_ctor() {
  %1 = load i8***, i8*** @__hip_gpubin_handle, align 8
  %2 = call i64 @"scabbard.trace.metadata_register$src"(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @"scabbard.metadata.srcData$0x0001", i32 0, i32 0))
  store i64 %2, i64* @"scabbard.metadata.host.srcId$0x0001", align 8
  %3 = call i64 @"scabbard.trace.metadata_register$src"(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @"scabbard.metadata.srcData$0x0000", i32 0, i32 0))
  store i64 %3, i64* @"scabbard.metadata.host.srcId$0x0000", align 8
  ret void
}

attributes #0 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #6 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { mustprogress uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { inlinehint mustprogress uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nobuiltin allocsize(0) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { argmemonly mustprogress nocallback nofree nounwind willreturn writeonly }
attributes #11 = { nobuiltin nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { noreturn nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { argmemonly mustprogress nofree nounwind readonly willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { noreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { mustprogress nofree nosync nounwind readnone willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #18 = { nounwind }
attributes #19 = { noreturn nounwind }
attributes #20 = { noreturn }
attributes #21 = { builtin allocsize(0) }
attributes #22 = { nounwind readnone willreturn }
attributes #23 = { builtin nounwind }

!llvm.dbg.cu = !{!79}
!llvm.module.flags = !{!2208, !2209, !2210, !2211}
!llvm.ident = !{!2212}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/iostream", directory: "")
!4 = !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 626, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/ios_base.h", directory: "")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt8ios_base")
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !9, line: 70, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard", checksumkind: CSK_MD5, checksum: "3cdb439f8feef572cb544d3e9cde4206")
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 296, elements: !13)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{!14}
!14 = !DISubrange(count: 37)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(scope: null, file: !9, line: 71, type: !17, isLocal: true, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 216, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 27)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(scope: null, file: !9, line: 101, type: !22, isLocal: true, isDefinition: true)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 152, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 19)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(scope: null, file: !9, line: 104, type: !27, isLocal: true, isDefinition: true)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 48, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 6)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(scope: null, file: !9, line: 105, type: !32, isLocal: true, isDefinition: true)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 16, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 2)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(scope: null, file: !9, line: 108, type: !37, isLocal: true, isDefinition: true)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 32, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 4)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(scope: null, file: !9, line: 109, type: !27, isLocal: true, isDefinition: true)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(scope: null, file: !9, line: 122, type: !44, isLocal: true, isDefinition: true)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 480, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 60)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(scope: null, file: !9, line: 134, type: !49, isLocal: true, isDefinition: true)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 192, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 24)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(scope: null, file: !9, line: 135, type: !54, isLocal: true, isDefinition: true)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 288, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 36)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(scope: null, file: !9, line: 152, type: !59, isLocal: true, isDefinition: true)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 280, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 35)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(scope: null, file: !9, line: 165, type: !64, isLocal: true, isDefinition: true)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 120, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 15)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(scope: null, file: !9, line: 166, type: !64, isLocal: true, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(scope: null, file: !9, line: 167, type: !71, isLocal: true, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 144, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 18)
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(scope: null, file: !9, line: 176, type: !76, isLocal: true, isDefinition: true)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 104, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 13)
!79 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !9, producer: "AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !80, retainedTypes: !188, globals: !461, imports: !462, splitDebugInlining: false, nameTableKind: None)
!80 = !{!81, !89, !170, !178}
!81 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Lock_policy", scope: !83, file: !82, line: 49, baseType: !84, size: 32, elements: !85, identifier: "_ZTSN9__gnu_cxx12_Lock_policyE")
!82 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ext/concurrence.h", directory: "")
!83 = !DINamespace(name: "__gnu_cxx", scope: null)
!84 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!85 = !{!86, !87, !88}
!86 = !DIEnumerator(name: "_S_single", value: 0, isUnsigned: true)
!87 = !DIEnumerator(name: "_S_mutex", value: 1, isUnsigned: true)
!88 = !DIEnumerator(name: "_S_atomic", value: 2, isUnsigned: true)
!89 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipError_t", file: !90, line: 206, baseType: !84, size: 32, elements: !91, identifier: "_ZTS10hipError_t")
!90 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "7560f6d8bd7c5ac736ef5dfcbc59d092")
!91 = !{!92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169}
!92 = !DIEnumerator(name: "hipSuccess", value: 0, isUnsigned: true)
!93 = !DIEnumerator(name: "hipErrorInvalidValue", value: 1, isUnsigned: true)
!94 = !DIEnumerator(name: "hipErrorOutOfMemory", value: 2, isUnsigned: true)
!95 = !DIEnumerator(name: "hipErrorMemoryAllocation", value: 2, isUnsigned: true)
!96 = !DIEnumerator(name: "hipErrorNotInitialized", value: 3, isUnsigned: true)
!97 = !DIEnumerator(name: "hipErrorInitializationError", value: 3, isUnsigned: true)
!98 = !DIEnumerator(name: "hipErrorDeinitialized", value: 4, isUnsigned: true)
!99 = !DIEnumerator(name: "hipErrorProfilerDisabled", value: 5, isUnsigned: true)
!100 = !DIEnumerator(name: "hipErrorProfilerNotInitialized", value: 6, isUnsigned: true)
!101 = !DIEnumerator(name: "hipErrorProfilerAlreadyStarted", value: 7, isUnsigned: true)
!102 = !DIEnumerator(name: "hipErrorProfilerAlreadyStopped", value: 8, isUnsigned: true)
!103 = !DIEnumerator(name: "hipErrorInvalidConfiguration", value: 9, isUnsigned: true)
!104 = !DIEnumerator(name: "hipErrorInvalidPitchValue", value: 12, isUnsigned: true)
!105 = !DIEnumerator(name: "hipErrorInvalidSymbol", value: 13, isUnsigned: true)
!106 = !DIEnumerator(name: "hipErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!107 = !DIEnumerator(name: "hipErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!108 = !DIEnumerator(name: "hipErrorInsufficientDriver", value: 35, isUnsigned: true)
!109 = !DIEnumerator(name: "hipErrorMissingConfiguration", value: 52, isUnsigned: true)
!110 = !DIEnumerator(name: "hipErrorPriorLaunchFailure", value: 53, isUnsigned: true)
!111 = !DIEnumerator(name: "hipErrorInvalidDeviceFunction", value: 98, isUnsigned: true)
!112 = !DIEnumerator(name: "hipErrorNoDevice", value: 100, isUnsigned: true)
!113 = !DIEnumerator(name: "hipErrorInvalidDevice", value: 101, isUnsigned: true)
!114 = !DIEnumerator(name: "hipErrorInvalidImage", value: 200, isUnsigned: true)
!115 = !DIEnumerator(name: "hipErrorInvalidContext", value: 201, isUnsigned: true)
!116 = !DIEnumerator(name: "hipErrorContextAlreadyCurrent", value: 202, isUnsigned: true)
!117 = !DIEnumerator(name: "hipErrorMapFailed", value: 205, isUnsigned: true)
!118 = !DIEnumerator(name: "hipErrorMapBufferObjectFailed", value: 205, isUnsigned: true)
!119 = !DIEnumerator(name: "hipErrorUnmapFailed", value: 206, isUnsigned: true)
!120 = !DIEnumerator(name: "hipErrorArrayIsMapped", value: 207, isUnsigned: true)
!121 = !DIEnumerator(name: "hipErrorAlreadyMapped", value: 208, isUnsigned: true)
!122 = !DIEnumerator(name: "hipErrorNoBinaryForGpu", value: 209, isUnsigned: true)
!123 = !DIEnumerator(name: "hipErrorAlreadyAcquired", value: 210, isUnsigned: true)
!124 = !DIEnumerator(name: "hipErrorNotMapped", value: 211, isUnsigned: true)
!125 = !DIEnumerator(name: "hipErrorNotMappedAsArray", value: 212, isUnsigned: true)
!126 = !DIEnumerator(name: "hipErrorNotMappedAsPointer", value: 213, isUnsigned: true)
!127 = !DIEnumerator(name: "hipErrorECCNotCorrectable", value: 214, isUnsigned: true)
!128 = !DIEnumerator(name: "hipErrorUnsupportedLimit", value: 215, isUnsigned: true)
!129 = !DIEnumerator(name: "hipErrorContextAlreadyInUse", value: 216, isUnsigned: true)
!130 = !DIEnumerator(name: "hipErrorPeerAccessUnsupported", value: 217, isUnsigned: true)
!131 = !DIEnumerator(name: "hipErrorInvalidKernelFile", value: 218, isUnsigned: true)
!132 = !DIEnumerator(name: "hipErrorInvalidGraphicsContext", value: 219, isUnsigned: true)
!133 = !DIEnumerator(name: "hipErrorInvalidSource", value: 300, isUnsigned: true)
!134 = !DIEnumerator(name: "hipErrorFileNotFound", value: 301, isUnsigned: true)
!135 = !DIEnumerator(name: "hipErrorSharedObjectSymbolNotFound", value: 302, isUnsigned: true)
!136 = !DIEnumerator(name: "hipErrorSharedObjectInitFailed", value: 303, isUnsigned: true)
!137 = !DIEnumerator(name: "hipErrorOperatingSystem", value: 304, isUnsigned: true)
!138 = !DIEnumerator(name: "hipErrorInvalidHandle", value: 400, isUnsigned: true)
!139 = !DIEnumerator(name: "hipErrorInvalidResourceHandle", value: 400, isUnsigned: true)
!140 = !DIEnumerator(name: "hipErrorIllegalState", value: 401, isUnsigned: true)
!141 = !DIEnumerator(name: "hipErrorNotFound", value: 500, isUnsigned: true)
!142 = !DIEnumerator(name: "hipErrorNotReady", value: 600, isUnsigned: true)
!143 = !DIEnumerator(name: "hipErrorIllegalAddress", value: 700, isUnsigned: true)
!144 = !DIEnumerator(name: "hipErrorLaunchOutOfResources", value: 701, isUnsigned: true)
!145 = !DIEnumerator(name: "hipErrorLaunchTimeOut", value: 702, isUnsigned: true)
!146 = !DIEnumerator(name: "hipErrorPeerAccessAlreadyEnabled", value: 704, isUnsigned: true)
!147 = !DIEnumerator(name: "hipErrorPeerAccessNotEnabled", value: 705, isUnsigned: true)
!148 = !DIEnumerator(name: "hipErrorSetOnActiveProcess", value: 708, isUnsigned: true)
!149 = !DIEnumerator(name: "hipErrorContextIsDestroyed", value: 709, isUnsigned: true)
!150 = !DIEnumerator(name: "hipErrorAssert", value: 710, isUnsigned: true)
!151 = !DIEnumerator(name: "hipErrorHostMemoryAlreadyRegistered", value: 712, isUnsigned: true)
!152 = !DIEnumerator(name: "hipErrorHostMemoryNotRegistered", value: 713, isUnsigned: true)
!153 = !DIEnumerator(name: "hipErrorLaunchFailure", value: 719, isUnsigned: true)
!154 = !DIEnumerator(name: "hipErrorCooperativeLaunchTooLarge", value: 720, isUnsigned: true)
!155 = !DIEnumerator(name: "hipErrorNotSupported", value: 801, isUnsigned: true)
!156 = !DIEnumerator(name: "hipErrorStreamCaptureUnsupported", value: 900, isUnsigned: true)
!157 = !DIEnumerator(name: "hipErrorStreamCaptureInvalidated", value: 901, isUnsigned: true)
!158 = !DIEnumerator(name: "hipErrorStreamCaptureMerge", value: 902, isUnsigned: true)
!159 = !DIEnumerator(name: "hipErrorStreamCaptureUnmatched", value: 903, isUnsigned: true)
!160 = !DIEnumerator(name: "hipErrorStreamCaptureUnjoined", value: 904, isUnsigned: true)
!161 = !DIEnumerator(name: "hipErrorStreamCaptureIsolation", value: 905, isUnsigned: true)
!162 = !DIEnumerator(name: "hipErrorStreamCaptureImplicit", value: 906, isUnsigned: true)
!163 = !DIEnumerator(name: "hipErrorCapturedEvent", value: 907, isUnsigned: true)
!164 = !DIEnumerator(name: "hipErrorStreamCaptureWrongThread", value: 908, isUnsigned: true)
!165 = !DIEnumerator(name: "hipErrorGraphExecUpdateFailure", value: 910, isUnsigned: true)
!166 = !DIEnumerator(name: "hipErrorUnknown", value: 999, isUnsigned: true)
!167 = !DIEnumerator(name: "hipErrorRuntimeMemory", value: 1052, isUnsigned: true)
!168 = !DIEnumerator(name: "hipErrorRuntimeOther", value: 1053, isUnsigned: true)
!169 = !DIEnumerator(name: "hipErrorTbd", value: 1054, isUnsigned: true)
!170 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipMemcpyKind", file: !171, line: 344, baseType: !84, size: 32, elements: !172, identifier: "_ZTS13hipMemcpyKind")
!171 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/driver_types.h", directory: "", checksumkind: CSK_MD5, checksum: "ac8c80c0e1fdd9c44dee17b35e5c6ced")
!172 = !{!173, !174, !175, !176, !177}
!173 = !DIEnumerator(name: "hipMemcpyHostToHost", value: 0, isUnsigned: true)
!174 = !DIEnumerator(name: "hipMemcpyHostToDevice", value: 1, isUnsigned: true)
!175 = !DIEnumerator(name: "hipMemcpyDeviceToHost", value: 2, isUnsigned: true)
!176 = !DIEnumerator(name: "hipMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!177 = !DIEnumerator(name: "hipMemcpyDefault", value: 4, isUnsigned: true)
!178 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Ios_Iostate", scope: !2, file: !5, line: 153, baseType: !179, size: 32, elements: !180, identifier: "_ZTSSt12_Ios_Iostate")
!179 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!180 = !{!181, !182, !183, !184, !185, !186, !187}
!181 = !DIEnumerator(name: "_S_goodbit", value: 0)
!182 = !DIEnumerator(name: "_S_badbit", value: 1)
!183 = !DIEnumerator(name: "_S_eofbit", value: 2)
!184 = !DIEnumerator(name: "_S_failbit", value: 4)
!185 = !DIEnumerator(name: "_S_ios_iostate_end", value: 65536)
!186 = !DIEnumerator(name: "_S_ios_iostate_max", value: 2147483647)
!187 = !DIEnumerator(name: "_S_ios_iostate_min", value: -2147483648)
!188 = !{!189, !203, !209, !272, !178, !179, !276, !277, !279, !210, !282, !206, !302, !305, !358, !361, !414, !190, !6, !263, !449, !455}
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !90, line: 941, baseType: !190)
!190 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !90, line: 934, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !191, identifier: "_ZTS4dim3")
!191 = !{!192, !197, !198, !199}
!192 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !190, file: !90, line: 935, baseType: !193, size: 32)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !194, line: 26, baseType: !195)
!194 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "9754ebe022edbe8d7928fa709e442f0d")
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !196, line: 41, baseType: !84)
!196 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "eac2c46b20ddc2be81186b6ffebfd845")
!197 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !190, file: !90, line: 936, baseType: !193, size: 32, offset: 32)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !190, file: !90, line: 937, baseType: !193, size: 32, offset: 64)
!199 = !DISubprogram(name: "dim3", scope: !190, file: !90, line: 939, type: !200, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!200 = !DISubroutineType(types: !201)
!201 = !{null, !202, !193, !193, !193}
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !190, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!203 = !DIDerivedType(tag: DW_TAG_typedef, name: "milliseconds", scope: !205, file: !204, line: 783, baseType: !206)
!204 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/chrono", directory: "")
!205 = !DINamespace(name: "chrono", scope: !2)
!206 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1000L> >", scope: !205, file: !204, line: 421, size: 64, flags: DIFlagTypePassByValue, elements: !207, templateParams: !260, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000EEEE")
!207 = !{!208, !211, !217, !221, !226, !227, !231, !235, !238, !239, !242, !245, !246, !247, !248, !249, !254, !255, !258, !259}
!208 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !206, file: !204, line: 584, baseType: !209, size: 64, flags: DIFlagPrivate)
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !206, file: !204, line: 452, baseType: !210)
!210 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!211 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEE6_S_gcdEll", scope: !206, file: !204, line: 428, type: !212, scopeLine: 428, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!212 = !DISubroutineType(types: !213)
!213 = !{!214, !214, !214}
!214 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !215, line: 101, baseType: !216)
!215 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "5faa52c8a2d48b1d936594c77c73ce42")
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !196, line: 71, baseType: !210)
!217 = !DISubprogram(name: "duration", scope: !206, file: !204, line: 461, type: !218, scopeLine: 461, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!218 = !DISubroutineType(types: !219)
!219 = !{null, !220}
!220 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!221 = !DISubprogram(name: "duration", scope: !206, file: !204, line: 463, type: !222, scopeLine: 463, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!222 = !DISubroutineType(types: !223)
!223 = !{null, !220, !224}
!224 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !225, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !206)
!226 = !DISubprogram(name: "~duration", scope: !206, file: !204, line: 481, type: !218, scopeLine: 481, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!227 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEaSERKS3_", scope: !206, file: !204, line: 482, type: !228, scopeLine: 482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!228 = !DISubroutineType(types: !229)
!229 = !{!230, !220, !224}
!230 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !206, size: 64)
!231 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000EEE5countEv", scope: !206, file: !204, line: 486, type: !232, scopeLine: 486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!232 = !DISubroutineType(types: !233)
!233 = !{!209, !234}
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!235 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000EEEpsEv", scope: !206, file: !204, line: 492, type: !236, scopeLine: 492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!236 = !DISubroutineType(types: !237)
!237 = !{!206, !234}
!238 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000EEEngEv", scope: !206, file: !204, line: 496, type: !236, scopeLine: 496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!239 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEppEv", scope: !206, file: !204, line: 500, type: !240, scopeLine: 500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!240 = !DISubroutineType(types: !241)
!241 = !{!230, !220}
!242 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEppEi", scope: !206, file: !204, line: 507, type: !243, scopeLine: 507, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!243 = !DISubroutineType(types: !244)
!244 = !{!206, !220, !179}
!245 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEmmEv", scope: !206, file: !204, line: 511, type: !240, scopeLine: 511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!246 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEmmEi", scope: !206, file: !204, line: 518, type: !243, scopeLine: 518, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!247 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEpLERKS3_", scope: !206, file: !204, line: 522, type: !228, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEmIERKS3_", scope: !206, file: !204, line: 529, type: !228, scopeLine: 529, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!249 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEmLERKl", scope: !206, file: !204, line: 536, type: !250, scopeLine: 536, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!250 = !DISubroutineType(types: !251)
!251 = !{!230, !220, !252}
!252 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !253, size: 64)
!253 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !209)
!254 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEdVERKl", scope: !206, file: !204, line: 543, type: !250, scopeLine: 543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!255 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEE4zeroEv", scope: !206, file: !204, line: 572, type: !256, scopeLine: 572, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!256 = !DISubroutineType(types: !257)
!257 = !{!206}
!258 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEE3minEv", scope: !206, file: !204, line: 576, type: !256, scopeLine: 576, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!259 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEE3maxEv", scope: !206, file: !204, line: 580, type: !256, scopeLine: 580, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!260 = !{!261, !262}
!261 = !DITemplateTypeParameter(name: "_Rep", type: !210)
!262 = !DITemplateTypeParameter(name: "_Period", type: !263)
!263 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000L>", scope: !2, file: !264, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !265, templateParams: !269, identifier: "_ZTSSt5ratioILl1ELl1000EE")
!264 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ratio", directory: "")
!265 = !{!266, !268}
!266 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !263, file: !264, line: 273, baseType: !267, flags: DIFlagStaticMember, extraData: i64 1)
!267 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !214)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !263, file: !264, line: 276, baseType: !267, flags: DIFlagStaticMember, extraData: i64 1000)
!269 = !{!270, !271}
!270 = !DITemplateValueParameter(name: "_Num", type: !210, value: i64 1)
!271 = !DITemplateValueParameter(name: "_Den", type: !210, value: i64 1000)
!272 = !DIDerivedType(tag: DW_TAG_typedef, name: "streamsize", scope: !2, file: !273, line: 98, baseType: !274)
!273 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/postypes.h", directory: "")
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !2, file: !275, line: 2307, baseType: !210)
!275 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/x86_64-redhat-linux/bits/c++config.h", directory: "", checksumkind: CSK_MD5, checksum: "44fa36db46df6a33f85b9dfb5466d720")
!276 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !278, size: 64)
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!279 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !280, line: 7, baseType: !281)
!280 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "49b4e16ef1215de5afdbb283400ab90c")
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !196, line: 158, baseType: !210)
!282 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ct", scope: !283, file: !204, line: 718, baseType: !295)
!283 = distinct !DISubprogram(name: "operator<<long, std::ratio<1L, 1000L>, long, std::ratio<1L, 1000L> >", linkageName: "_ZNSt6chronoltIlSt5ratioILl1ELl1000EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE", scope: !205, file: !204, line: 713, type: !284, scopeLine: 715, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !290, retainedNodes: !287)
!284 = !DISubroutineType(types: !285)
!285 = !{!286, !224, !224}
!286 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!287 = !{!288, !289}
!288 = !DILocalVariable(name: "__lhs", arg: 1, scope: !283, file: !204, line: 713, type: !224)
!289 = !DILocalVariable(name: "__rhs", arg: 2, scope: !283, file: !204, line: 714, type: !224)
!290 = !{!291, !292, !293, !294}
!291 = !DITemplateTypeParameter(name: "_Rep1", type: !210)
!292 = !DITemplateTypeParameter(name: "_Period1", type: !263)
!293 = !DITemplateTypeParameter(name: "_Rep2", type: !210)
!294 = !DITemplateTypeParameter(name: "_Period2", type: !263)
!295 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !296, file: !204, line: 118, baseType: !206)
!296 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "common_type<std::chrono::duration<long, std::ratio<1L, 1000L> >, std::chrono::duration<long, std::ratio<1L, 1000L> > >", scope: !2, file: !204, line: 115, size: 8, flags: DIFlagTypePassByValue, elements: !297, templateParams: !298, identifier: "_ZTSSt11common_typeIJNSt6chrono8durationIlSt5ratioILl1ELl1000EEEES4_EE")
!297 = !{}
!298 = !{!299}
!299 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tp", value: !300)
!300 = !{!301, !301}
!301 = !DITemplateTypeParameter(type: !206)
!302 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1L> >", scope: !205, file: !204, line: 421, size: 64, flags: DIFlagTypePassByValue, elements: !303, templateParams: !350, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1EEEE")
!303 = !{!304, !306, !307, !311, !316, !317, !321, !325, !328, !329, !332, !335, !336, !337, !338, !339, !344, !345, !348, !349}
!304 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !302, file: !204, line: 584, baseType: !305, size: 64, flags: DIFlagPrivate)
!305 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !302, file: !204, line: 452, baseType: !210)
!306 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE6_S_gcdEll", scope: !302, file: !204, line: 428, type: !212, scopeLine: 428, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!307 = !DISubprogram(name: "duration", scope: !302, file: !204, line: 461, type: !308, scopeLine: 461, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!308 = !DISubroutineType(types: !309)
!309 = !{null, !310}
!310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !302, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!311 = !DISubprogram(name: "duration", scope: !302, file: !204, line: 463, type: !312, scopeLine: 463, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!312 = !DISubroutineType(types: !313)
!313 = !{null, !310, !314}
!314 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !315, size: 64)
!315 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !302)
!316 = !DISubprogram(name: "~duration", scope: !302, file: !204, line: 481, type: !308, scopeLine: 481, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!317 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEaSERKS3_", scope: !302, file: !204, line: 482, type: !318, scopeLine: 482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!318 = !DISubroutineType(types: !319)
!319 = !{!320, !310, !314}
!320 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !302, size: 64)
!321 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv", scope: !302, file: !204, line: 486, type: !322, scopeLine: 486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!322 = !DISubroutineType(types: !323)
!323 = !{!305, !324}
!324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!325 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEEpsEv", scope: !302, file: !204, line: 492, type: !326, scopeLine: 492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!326 = !DISubroutineType(types: !327)
!327 = !{!302, !324}
!328 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEEngEv", scope: !302, file: !204, line: 496, type: !326, scopeLine: 496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!329 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEppEv", scope: !302, file: !204, line: 500, type: !330, scopeLine: 500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!330 = !DISubroutineType(types: !331)
!331 = !{!320, !310}
!332 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEppEi", scope: !302, file: !204, line: 507, type: !333, scopeLine: 507, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!333 = !DISubroutineType(types: !334)
!334 = !{!302, !310, !179}
!335 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmmEv", scope: !302, file: !204, line: 511, type: !330, scopeLine: 511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!336 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmmEi", scope: !302, file: !204, line: 518, type: !333, scopeLine: 518, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!337 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEpLERKS3_", scope: !302, file: !204, line: 522, type: !318, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!338 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmIERKS3_", scope: !302, file: !204, line: 529, type: !318, scopeLine: 529, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!339 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmLERKl", scope: !302, file: !204, line: 536, type: !340, scopeLine: 536, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!340 = !DISubroutineType(types: !341)
!341 = !{!320, !310, !342}
!342 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !343, size: 64)
!343 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !305)
!344 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEdVERKl", scope: !302, file: !204, line: 543, type: !340, scopeLine: 543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!345 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE4zeroEv", scope: !302, file: !204, line: 572, type: !346, scopeLine: 572, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!346 = !DISubroutineType(types: !347)
!347 = !{!302}
!348 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE3minEv", scope: !302, file: !204, line: 576, type: !346, scopeLine: 576, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!349 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE3maxEv", scope: !302, file: !204, line: 580, type: !346, scopeLine: 580, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!350 = !{!261, !351}
!351 = !DITemplateTypeParameter(name: "_Period", type: !352)
!352 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1L>", scope: !2, file: !264, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !353, templateParams: !356, identifier: "_ZTSSt5ratioILl1ELl1EE")
!353 = !{!354, !355}
!354 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !352, file: !264, line: 273, baseType: !267, flags: DIFlagStaticMember, extraData: i64 1)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !352, file: !264, line: 276, baseType: !267, flags: DIFlagStaticMember, extraData: i64 1)
!356 = !{!270, !357}
!357 = !DITemplateValueParameter(name: "_Den", type: !210, defaulted: true, value: i64 1)
!358 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1000000000L> >", scope: !205, file: !204, line: 421, size: 64, flags: DIFlagTypePassByValue, elements: !359, templateParams: !406, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEE")
!359 = !{!360, !362, !363, !367, !372, !373, !377, !381, !384, !385, !388, !391, !392, !393, !394, !395, !400, !401, !404, !405}
!360 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !358, file: !204, line: 584, baseType: !361, size: 64, flags: DIFlagPrivate)
!361 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !358, file: !204, line: 452, baseType: !210)
!362 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE6_S_gcdEll", scope: !358, file: !204, line: 428, type: !212, scopeLine: 428, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!363 = !DISubprogram(name: "duration", scope: !358, file: !204, line: 461, type: !364, scopeLine: 461, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!364 = !DISubroutineType(types: !365)
!365 = !{null, !366}
!366 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !358, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!367 = !DISubprogram(name: "duration", scope: !358, file: !204, line: 463, type: !368, scopeLine: 463, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!368 = !DISubroutineType(types: !369)
!369 = !{null, !366, !370}
!370 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !371, size: 64)
!371 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !358)
!372 = !DISubprogram(name: "~duration", scope: !358, file: !204, line: 481, type: !364, scopeLine: 481, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!373 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEaSERKS3_", scope: !358, file: !204, line: 482, type: !374, scopeLine: 482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!374 = !DISubroutineType(types: !375)
!375 = !{!376, !366, !370}
!376 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !358, size: 64)
!377 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv", scope: !358, file: !204, line: 486, type: !378, scopeLine: 486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!378 = !DISubroutineType(types: !379)
!379 = !{!361, !380}
!380 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !371, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!381 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpsEv", scope: !358, file: !204, line: 492, type: !382, scopeLine: 492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!382 = !DISubroutineType(types: !383)
!383 = !{!358, !380}
!384 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEngEv", scope: !358, file: !204, line: 496, type: !382, scopeLine: 496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!385 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEv", scope: !358, file: !204, line: 500, type: !386, scopeLine: 500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!386 = !DISubroutineType(types: !387)
!387 = !{!376, !366}
!388 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEi", scope: !358, file: !204, line: 507, type: !389, scopeLine: 507, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!389 = !DISubroutineType(types: !390)
!390 = !{!358, !366, !179}
!391 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEv", scope: !358, file: !204, line: 511, type: !386, scopeLine: 511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!392 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEi", scope: !358, file: !204, line: 518, type: !389, scopeLine: 518, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!393 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpLERKS3_", scope: !358, file: !204, line: 522, type: !374, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!394 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmIERKS3_", scope: !358, file: !204, line: 529, type: !374, scopeLine: 529, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!395 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmLERKl", scope: !358, file: !204, line: 536, type: !396, scopeLine: 536, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!396 = !DISubroutineType(types: !397)
!397 = !{!376, !366, !398}
!398 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !399, size: 64)
!399 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !361)
!400 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEdVERKl", scope: !358, file: !204, line: 543, type: !396, scopeLine: 543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!401 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE4zeroEv", scope: !358, file: !204, line: 572, type: !402, scopeLine: 572, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!402 = !DISubroutineType(types: !403)
!403 = !{!358}
!404 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3minEv", scope: !358, file: !204, line: 576, type: !402, scopeLine: 576, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!405 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3maxEv", scope: !358, file: !204, line: 580, type: !402, scopeLine: 580, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!406 = !{!261, !407}
!407 = !DITemplateTypeParameter(name: "_Period", type: !408)
!408 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000000000L>", scope: !2, file: !264, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !409, templateParams: !412, identifier: "_ZTSSt5ratioILl1ELl1000000000EE")
!409 = !{!410, !411}
!410 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !408, file: !264, line: 273, baseType: !267, flags: DIFlagStaticMember, extraData: i64 1)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !408, file: !264, line: 276, baseType: !267, flags: DIFlagStaticMember, extraData: i64 1000000000)
!412 = !{!270, !413}
!413 = !DITemplateValueParameter(name: "_Den", type: !210, value: i64 1000000000)
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cd", scope: !415, file: !204, line: 613, baseType: !418)
!415 = distinct !DISubprogram(name: "operator-<long, std::ratio<1L, 1000L>, long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chronomiIlSt5ratioILl1ELl1000EElS1_ILl1ELl1EEEENSt11common_typeIJNS_8durationIT_T0_EENS5_IT1_T2_EEEE4typeERKS8_RKSB_", scope: !205, file: !204, line: 608, type: !416, scopeLine: 610, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !448, retainedNodes: !445)
!416 = !DISubroutineType(types: !417)
!417 = !{!418, !224, !314}
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !419, file: !204, line: 97, baseType: !206)
!419 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__duration_common_type<std::common_type<long, long>, std::ratio<1L, 1000L>, std::ratio<1L, 1L>, void>", scope: !2, file: !204, line: 86, size: 8, flags: DIFlagTypePassByValue, elements: !297, templateParams: !420, identifier: "_ZTSSt22__duration_common_typeISt11common_typeIJllEESt5ratioILl1ELl1000EES2_ILl1ELl1EEvE")
!420 = !{!421, !292, !443, !444}
!421 = !DITemplateTypeParameter(name: "_CT", type: !422)
!422 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "common_type<long, long>", scope: !2, file: !423, line: 2280, size: 8, flags: DIFlagTypePassByValue, elements: !424, templateParams: !439, identifier: "_ZTSSt11common_typeIJllEE")
!423 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/type_traits", directory: "")
!424 = !{!425}
!425 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !422, baseType: !426, extraData: i32 0)
!426 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !427, file: !423, line: 2275, baseType: !436)
!427 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__common_type_impl<long, long, long, long>", scope: !2, file: !423, line: 2270, size: 8, flags: DIFlagTypePassByValue, elements: !428, templateParams: !431, identifier: "_ZTSSt18__common_type_implIllllE")
!428 = !{!429}
!429 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !427, baseType: !430, flags: DIFlagPrivate, extraData: i32 0)
!430 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__do_common_type_impl", scope: !2, file: !423, line: 2219, size: 8, flags: DIFlagTypePassByValue, elements: !297, identifier: "_ZTSSt21__do_common_type_impl")
!431 = !{!432, !433, !434, !435}
!432 = !DITemplateTypeParameter(name: "_Tp1", type: !210)
!433 = !DITemplateTypeParameter(name: "_Tp2", type: !210)
!434 = !DITemplateTypeParameter(name: "_Dp1", type: !210)
!435 = !DITemplateTypeParameter(name: "_Dp2", type: !210)
!436 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__success_type<long>", scope: !2, file: !423, line: 220, size: 8, flags: DIFlagTypePassByValue, elements: !297, templateParams: !437, identifier: "_ZTSSt14__success_typeIlE")
!437 = !{!438}
!438 = !DITemplateTypeParameter(name: "_Tp", type: !210)
!439 = !{!440}
!440 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tp", value: !441)
!441 = !{!442, !442}
!442 = !DITemplateTypeParameter(type: !210)
!443 = !DITemplateTypeParameter(name: "_Period2", type: !352)
!444 = !DITemplateTypeParameter(type: null, defaulted: true)
!445 = !{!446, !447}
!446 = !DILocalVariable(name: "__lhs", arg: 1, scope: !415, file: !204, line: 608, type: !224)
!447 = !DILocalVariable(name: "__rhs", arg: 2, scope: !415, file: !204, line: 609, type: !314)
!448 = !{!291, !292, !293, !443}
!449 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1000000L, 1L>", scope: !2, file: !264, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !450, templateParams: !453, identifier: "_ZTSSt5ratioILl1000000ELl1EE")
!450 = !{!451, !452}
!451 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !449, file: !264, line: 273, baseType: !267, flags: DIFlagStaticMember, extraData: i64 1000000)
!452 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !449, file: !264, line: 276, baseType: !267, flags: DIFlagStaticMember, extraData: i64 1)
!453 = !{!454, !357}
!454 = !DITemplateValueParameter(name: "_Num", type: !210, value: i64 1000000)
!455 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1000L, 1L>", scope: !2, file: !264, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !456, templateParams: !459, identifier: "_ZTSSt5ratioILl1000ELl1EE")
!456 = !{!457, !458}
!457 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !455, file: !264, line: 273, baseType: !267, flags: DIFlagStaticMember, extraData: i64 1000)
!458 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !455, file: !264, line: 276, baseType: !267, flags: DIFlagStaticMember, extraData: i64 1)
!459 = !{!460, !357}
!460 = !DITemplateValueParameter(name: "_Num", type: !210, value: i64 1000)
!461 = !{!0, !7, !15, !20, !25, !30, !35, !40, !42, !47, !52, !57, !62, !67, !69, !74}
!462 = !{!463, !469, !476, !478, !480, !484, !486, !488, !490, !492, !494, !496, !498, !503, !507, !509, !511, !516, !518, !520, !522, !524, !526, !528, !531, !534, !536, !540, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !569, !573, !575, !577, !579, !581, !583, !585, !587, !589, !591, !593, !595, !597, !599, !601, !603, !607, !611, !615, !617, !619, !621, !623, !625, !627, !629, !631, !633, !637, !641, !645, !647, !649, !651, !656, !660, !664, !666, !668, !670, !672, !674, !676, !678, !680, !682, !684, !686, !688, !692, !696, !700, !702, !704, !706, !711, !715, !719, !721, !723, !725, !727, !729, !731, !735, !739, !741, !743, !745, !747, !751, !755, !759, !761, !763, !765, !767, !769, !771, !775, !779, !783, !785, !789, !793, !795, !797, !799, !801, !803, !805, !809, !813, !819, !823, !830, !835, !837, !840, !844, !848, !859, !861, !865, !869, !873, !878, !882, !886, !890, !894, !902, !906, !910, !912, !916, !920, !924, !930, !934, !938, !940, !948, !952, !958, !960, !964, !968, !972, !976, !981, !985, !989, !990, !991, !992, !994, !995, !996, !997, !998, !999, !1000, !1002, !1003, !1004, !1005, !1006, !1007, !1008, !1010, !1011, !1012, !1013, !1014, !1015, !1016, !1017, !1018, !1019, !1020, !1021, !1022, !1023, !1024, !1025, !1026, !1027, !1028, !1029, !1030, !1031, !1032, !1033, !1034, !1038, !1042, !1045, !1047, !1049, !1051, !1053, !1055, !1057, !1059, !1061, !1063, !1065, !1067, !1069, !1071, !1073, !1075, !1077, !1079, !1081, !1083, !1085, !1087, !1089, !1091, !1093, !1095, !1099, !1101, !1103, !1107, !1111, !1113, !1115, !1117, !1119, !1121, !1123, !1125, !1127, !1129, !1131, !1133, !1135, !1137, !1139, !1141, !1143, !1145, !1147, !1149, !1151, !1153, !1158, !1160, !1162, !1164, !1166, !1168, !1170, !1172, !1174, !1176, !1178, !1180, !1182, !1184, !1186, !1188, !1190, !1192, !1194, !1196, !1200, !1202, !1204, !1206, !1208, !1210, !1212, !1214, !1216, !1218, !1220, !1222, !1224, !1226, !1228, !1230, !1232, !1234, !1236, !1238, !1240, !1242, !1244, !1246, !1248, !1250, !1252, !1254, !1256, !1258, !1260, !1262, !1264, !1266, !1268, !1270, !1272, !1274, !1276, !1278, !1280, !1282, !1284, !1286, !1288, !1290, !1292, !1294, !1296, !1298, !1300, !1302, !1304, !1306, !1308, !1323, !1326, !1331, !1389, !1394, !1398, !1402, !1406, !1410, !1412, !1414, !1418, !1424, !1428, !1434, !1440, !1442, !1446, !1450, !1454, !1458, !1470, !1472, !1476, !1480, !1484, !1486, !1490, !1494, !1498, !1500, !1502, !1506, !1527, !1531, !1535, !1539, !1541, !1547, !1549, !1555, !1559, !1563, !1567, !1571, !1575, !1579, !1581, !1583, !1587, !1591, !1595, !1597, !1601, !1605, !1607, !1609, !1613, !1617, !1621, !1625, !1626, !1627, !1628, !1629, !1630, !1631, !1632, !1633, !1634, !1635, !1640, !1644, !1647, !1650, !1652, !1654, !1656, !1658, !1661, !1664, !1667, !1670, !1671, !1673, !1676, !1679, !1680, !1683, !1685, !1687, !1689, !1691, !1694, !1697, !1700, !1703, !1706, !1708, !1712, !1716, !1721, !1725, !1727, !1729, !1731, !1733, !1735, !1737, !1739, !1741, !1743, !1745, !1747, !1749, !1751, !1755, !1761, !1766, !1770, !1772, !1774, !1776, !1778, !1785, !1789, !1793, !1797, !1801, !1805, !1810, !1814, !1816, !1820, !1826, !1830, !1835, !1837, !1840, !1844, !1848, !1850, !1852, !1854, !1856, !1860, !1862, !1864, !1868, !1872, !1876, !1880, !1884, !1888, !1890, !1894, !1898, !1902, !1906, !1908, !1910, !1914, !1918, !1919, !1920, !1921, !1922, !1923, !1929, !1932, !1933, !1935, !1937, !1939, !1941, !1945, !1947, !1949, !1951, !1953, !1955, !1957, !1959, !1961, !1965, !1969, !1971, !1975, !1979, !1984, !1985, !1986, !1991, !1995, !2000, !2005, !2009, !2015, !2019, !2021, !2025, !2032, !2037, !2040, !2042, !2045, !2051, !2055, !2060, !2062, !2066, !2070, !2072, !2074, !2076, !2080, !2084, !2088, !2092, !2096, !2098, !2100, !2102, !2106, !2110, !2114, !2116, !2118}
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !464, file: !468, line: 52)
!464 = !DISubprogram(name: "abs", scope: !465, file: !465, line: 837, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!465 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "d0b67d4c866748c04ac2b355c26c1c70")
!466 = !DISubroutineType(types: !467)
!467 = !{!179, !179}
!468 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/std_abs.h", directory: "")
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !470, file: !475, line: 83)
!470 = !DISubprogram(name: "acos", scope: !471, file: !471, line: 53, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!471 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "d6f9ed6e7af49b30a088f9f753a7a51b")
!472 = !DISubroutineType(types: !473)
!473 = !{!474, !474}
!474 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!475 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cmath", directory: "")
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !477, file: !475, line: 102)
!477 = !DISubprogram(name: "asin", scope: !471, file: !471, line: 55, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !479, file: !475, line: 121)
!479 = !DISubprogram(name: "atan", scope: !471, file: !471, line: 57, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !481, file: !475, line: 140)
!481 = !DISubprogram(name: "atan2", scope: !471, file: !471, line: 59, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!482 = !DISubroutineType(types: !483)
!483 = !{!474, !474, !474}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !485, file: !475, line: 161)
!485 = !DISubprogram(name: "ceil", scope: !471, file: !471, line: 159, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !487, file: !475, line: 180)
!487 = !DISubprogram(name: "cos", scope: !471, file: !471, line: 62, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !489, file: !475, line: 199)
!489 = !DISubprogram(name: "cosh", scope: !471, file: !471, line: 71, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !491, file: !475, line: 218)
!491 = !DISubprogram(name: "exp", scope: !471, file: !471, line: 95, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !493, file: !475, line: 237)
!493 = !DISubprogram(name: "fabs", scope: !471, file: !471, line: 162, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !495, file: !475, line: 256)
!495 = !DISubprogram(name: "floor", scope: !471, file: !471, line: 165, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !497, file: !475, line: 275)
!497 = !DISubprogram(name: "fmod", scope: !471, file: !471, line: 168, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !499, file: !475, line: 296)
!499 = !DISubprogram(name: "frexp", scope: !471, file: !471, line: 98, type: !500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!500 = !DISubroutineType(types: !501)
!501 = !{!474, !474, !502}
!502 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !504, file: !475, line: 315)
!504 = !DISubprogram(name: "ldexp", scope: !471, file: !471, line: 101, type: !505, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!505 = !DISubroutineType(types: !506)
!506 = !{!474, !474, !179}
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !508, file: !475, line: 334)
!508 = !DISubprogram(name: "log", scope: !471, file: !471, line: 104, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !510, file: !475, line: 353)
!510 = !DISubprogram(name: "log10", scope: !471, file: !471, line: 107, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !512, file: !475, line: 372)
!512 = !DISubprogram(name: "modf", scope: !471, file: !471, line: 110, type: !513, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!513 = !DISubroutineType(types: !514)
!514 = !{!474, !474, !515}
!515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !474, size: 64)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !517, file: !475, line: 384)
!517 = !DISubprogram(name: "pow", scope: !471, file: !471, line: 140, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !519, file: !475, line: 421)
!519 = !DISubprogram(name: "sin", scope: !471, file: !471, line: 64, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !521, file: !475, line: 440)
!521 = !DISubprogram(name: "sinh", scope: !471, file: !471, line: 73, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !523, file: !475, line: 459)
!523 = !DISubprogram(name: "sqrt", scope: !471, file: !471, line: 143, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !525, file: !475, line: 478)
!525 = !DISubprogram(name: "tan", scope: !471, file: !471, line: 66, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !527, file: !475, line: 497)
!527 = !DISubprogram(name: "tanh", scope: !471, file: !471, line: 75, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !529, file: !475, line: 1065)
!529 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !530, line: 150, baseType: !474)
!530 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "c5a5a367b9358fd8d34408e944614c4d")
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !532, file: !475, line: 1066)
!532 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !530, line: 149, baseType: !533)
!533 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !535, file: !475, line: 1069)
!535 = !DISubprogram(name: "acosh", scope: !471, file: !471, line: 85, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !537, file: !475, line: 1070)
!537 = !DISubprogram(name: "acoshf", scope: !471, file: !471, line: 85, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!538 = !DISubroutineType(types: !539)
!539 = !{!533, !533}
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !541, file: !475, line: 1071)
!541 = !DISubprogram(name: "acoshl", scope: !471, file: !471, line: 85, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!542 = !DISubroutineType(types: !543)
!543 = !{!544, !544}
!544 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !546, file: !475, line: 1073)
!546 = !DISubprogram(name: "asinh", scope: !471, file: !471, line: 87, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !548, file: !475, line: 1074)
!548 = !DISubprogram(name: "asinhf", scope: !471, file: !471, line: 87, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !550, file: !475, line: 1075)
!550 = !DISubprogram(name: "asinhl", scope: !471, file: !471, line: 87, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !552, file: !475, line: 1077)
!552 = !DISubprogram(name: "atanh", scope: !471, file: !471, line: 89, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !554, file: !475, line: 1078)
!554 = !DISubprogram(name: "atanhf", scope: !471, file: !471, line: 89, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !556, file: !475, line: 1079)
!556 = !DISubprogram(name: "atanhl", scope: !471, file: !471, line: 89, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !558, file: !475, line: 1081)
!558 = !DISubprogram(name: "cbrt", scope: !471, file: !471, line: 152, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !560, file: !475, line: 1082)
!560 = !DISubprogram(name: "cbrtf", scope: !471, file: !471, line: 152, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !562, file: !475, line: 1083)
!562 = !DISubprogram(name: "cbrtl", scope: !471, file: !471, line: 152, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !564, file: !475, line: 1085)
!564 = !DISubprogram(name: "copysign", scope: !471, file: !471, line: 196, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !566, file: !475, line: 1086)
!566 = !DISubprogram(name: "copysignf", scope: !471, file: !471, line: 196, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!567 = !DISubroutineType(types: !568)
!568 = !{!533, !533, !533}
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !570, file: !475, line: 1087)
!570 = !DISubprogram(name: "copysignl", scope: !471, file: !471, line: 196, type: !571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!571 = !DISubroutineType(types: !572)
!572 = !{!544, !544, !544}
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !574, file: !475, line: 1089)
!574 = !DISubprogram(name: "erf", scope: !471, file: !471, line: 228, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !576, file: !475, line: 1090)
!576 = !DISubprogram(name: "erff", scope: !471, file: !471, line: 228, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !578, file: !475, line: 1091)
!578 = !DISubprogram(name: "erfl", scope: !471, file: !471, line: 228, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !580, file: !475, line: 1093)
!580 = !DISubprogram(name: "erfc", scope: !471, file: !471, line: 229, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !582, file: !475, line: 1094)
!582 = !DISubprogram(name: "erfcf", scope: !471, file: !471, line: 229, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !584, file: !475, line: 1095)
!584 = !DISubprogram(name: "erfcl", scope: !471, file: !471, line: 229, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !586, file: !475, line: 1097)
!586 = !DISubprogram(name: "exp2", scope: !471, file: !471, line: 130, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !588, file: !475, line: 1098)
!588 = !DISubprogram(name: "exp2f", scope: !471, file: !471, line: 130, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !590, file: !475, line: 1099)
!590 = !DISubprogram(name: "exp2l", scope: !471, file: !471, line: 130, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !592, file: !475, line: 1101)
!592 = !DISubprogram(name: "expm1", scope: !471, file: !471, line: 119, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !594, file: !475, line: 1102)
!594 = !DISubprogram(name: "expm1f", scope: !471, file: !471, line: 119, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !596, file: !475, line: 1103)
!596 = !DISubprogram(name: "expm1l", scope: !471, file: !471, line: 119, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !598, file: !475, line: 1105)
!598 = !DISubprogram(name: "fdim", scope: !471, file: !471, line: 326, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !600, file: !475, line: 1106)
!600 = !DISubprogram(name: "fdimf", scope: !471, file: !471, line: 326, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !602, file: !475, line: 1107)
!602 = !DISubprogram(name: "fdiml", scope: !471, file: !471, line: 326, type: !571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !604, file: !475, line: 1109)
!604 = !DISubprogram(name: "fma", scope: !471, file: !471, line: 335, type: !605, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!605 = !DISubroutineType(types: !606)
!606 = !{!474, !474, !474, !474}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !608, file: !475, line: 1110)
!608 = !DISubprogram(name: "fmaf", scope: !471, file: !471, line: 335, type: !609, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!609 = !DISubroutineType(types: !610)
!610 = !{!533, !533, !533, !533}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !612, file: !475, line: 1111)
!612 = !DISubprogram(name: "fmal", scope: !471, file: !471, line: 335, type: !613, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!613 = !DISubroutineType(types: !614)
!614 = !{!544, !544, !544, !544}
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !616, file: !475, line: 1113)
!616 = !DISubprogram(name: "fmax", scope: !471, file: !471, line: 329, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !618, file: !475, line: 1114)
!618 = !DISubprogram(name: "fmaxf", scope: !471, file: !471, line: 329, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !620, file: !475, line: 1115)
!620 = !DISubprogram(name: "fmaxl", scope: !471, file: !471, line: 329, type: !571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !622, file: !475, line: 1117)
!622 = !DISubprogram(name: "fmin", scope: !471, file: !471, line: 332, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !624, file: !475, line: 1118)
!624 = !DISubprogram(name: "fminf", scope: !471, file: !471, line: 332, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !626, file: !475, line: 1119)
!626 = !DISubprogram(name: "fminl", scope: !471, file: !471, line: 332, type: !571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !628, file: !475, line: 1121)
!628 = !DISubprogram(name: "hypot", scope: !471, file: !471, line: 147, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !630, file: !475, line: 1122)
!630 = !DISubprogram(name: "hypotf", scope: !471, file: !471, line: 147, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !632, file: !475, line: 1123)
!632 = !DISubprogram(name: "hypotl", scope: !471, file: !471, line: 147, type: !571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !634, file: !475, line: 1125)
!634 = !DISubprogram(name: "ilogb", scope: !471, file: !471, line: 280, type: !635, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!635 = !DISubroutineType(types: !636)
!636 = !{!179, !474}
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !638, file: !475, line: 1126)
!638 = !DISubprogram(name: "ilogbf", scope: !471, file: !471, line: 280, type: !639, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!639 = !DISubroutineType(types: !640)
!640 = !{!179, !533}
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !642, file: !475, line: 1127)
!642 = !DISubprogram(name: "ilogbl", scope: !471, file: !471, line: 280, type: !643, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!643 = !DISubroutineType(types: !644)
!644 = !{!179, !544}
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !646, file: !475, line: 1129)
!646 = !DISubprogram(name: "lgamma", scope: !471, file: !471, line: 230, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !648, file: !475, line: 1130)
!648 = !DISubprogram(name: "lgammaf", scope: !471, file: !471, line: 230, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !650, file: !475, line: 1131)
!650 = !DISubprogram(name: "lgammal", scope: !471, file: !471, line: 230, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !652, file: !475, line: 1134)
!652 = !DISubprogram(name: "llrint", scope: !471, file: !471, line: 316, type: !653, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!653 = !DISubroutineType(types: !654)
!654 = !{!655, !474}
!655 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !657, file: !475, line: 1135)
!657 = !DISubprogram(name: "llrintf", scope: !471, file: !471, line: 316, type: !658, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!658 = !DISubroutineType(types: !659)
!659 = !{!655, !533}
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !661, file: !475, line: 1136)
!661 = !DISubprogram(name: "llrintl", scope: !471, file: !471, line: 316, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!662 = !DISubroutineType(types: !663)
!663 = !{!655, !544}
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !665, file: !475, line: 1138)
!665 = !DISubprogram(name: "llround", scope: !471, file: !471, line: 322, type: !653, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !667, file: !475, line: 1139)
!667 = !DISubprogram(name: "llroundf", scope: !471, file: !471, line: 322, type: !658, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !669, file: !475, line: 1140)
!669 = !DISubprogram(name: "llroundl", scope: !471, file: !471, line: 322, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !671, file: !475, line: 1143)
!671 = !DISubprogram(name: "log1p", scope: !471, file: !471, line: 122, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !673, file: !475, line: 1144)
!673 = !DISubprogram(name: "log1pf", scope: !471, file: !471, line: 122, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !675, file: !475, line: 1145)
!675 = !DISubprogram(name: "log1pl", scope: !471, file: !471, line: 122, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !677, file: !475, line: 1147)
!677 = !DISubprogram(name: "log2", scope: !471, file: !471, line: 133, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !679, file: !475, line: 1148)
!679 = !DISubprogram(name: "log2f", scope: !471, file: !471, line: 133, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !681, file: !475, line: 1149)
!681 = !DISubprogram(name: "log2l", scope: !471, file: !471, line: 133, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !683, file: !475, line: 1151)
!683 = !DISubprogram(name: "logb", scope: !471, file: !471, line: 125, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !685, file: !475, line: 1152)
!685 = !DISubprogram(name: "logbf", scope: !471, file: !471, line: 125, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !687, file: !475, line: 1153)
!687 = !DISubprogram(name: "logbl", scope: !471, file: !471, line: 125, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !689, file: !475, line: 1155)
!689 = !DISubprogram(name: "lrint", scope: !471, file: !471, line: 314, type: !690, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!690 = !DISubroutineType(types: !691)
!691 = !{!210, !474}
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !693, file: !475, line: 1156)
!693 = !DISubprogram(name: "lrintf", scope: !471, file: !471, line: 314, type: !694, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!694 = !DISubroutineType(types: !695)
!695 = !{!210, !533}
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !697, file: !475, line: 1157)
!697 = !DISubprogram(name: "lrintl", scope: !471, file: !471, line: 314, type: !698, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!698 = !DISubroutineType(types: !699)
!699 = !{!210, !544}
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !701, file: !475, line: 1159)
!701 = !DISubprogram(name: "lround", scope: !471, file: !471, line: 320, type: !690, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !703, file: !475, line: 1160)
!703 = !DISubprogram(name: "lroundf", scope: !471, file: !471, line: 320, type: !694, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !705, file: !475, line: 1161)
!705 = !DISubprogram(name: "lroundl", scope: !471, file: !471, line: 320, type: !698, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !707, file: !475, line: 1163)
!707 = !DISubprogram(name: "nan", scope: !471, file: !471, line: 201, type: !708, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!708 = !DISubroutineType(types: !709)
!709 = !{!474, !710}
!710 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !712, file: !475, line: 1164)
!712 = !DISubprogram(name: "nanf", scope: !471, file: !471, line: 201, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!713 = !DISubroutineType(types: !714)
!714 = !{!533, !710}
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !716, file: !475, line: 1165)
!716 = !DISubprogram(name: "nanl", scope: !471, file: !471, line: 201, type: !717, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!717 = !DISubroutineType(types: !718)
!718 = !{!544, !710}
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !720, file: !475, line: 1167)
!720 = !DISubprogram(name: "nearbyint", scope: !471, file: !471, line: 294, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !722, file: !475, line: 1168)
!722 = !DISubprogram(name: "nearbyintf", scope: !471, file: !471, line: 294, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !724, file: !475, line: 1169)
!724 = !DISubprogram(name: "nearbyintl", scope: !471, file: !471, line: 294, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !726, file: !475, line: 1171)
!726 = !DISubprogram(name: "nextafter", scope: !471, file: !471, line: 259, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !728, file: !475, line: 1172)
!728 = !DISubprogram(name: "nextafterf", scope: !471, file: !471, line: 259, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !730, file: !475, line: 1173)
!730 = !DISubprogram(name: "nextafterl", scope: !471, file: !471, line: 259, type: !571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !732, file: !475, line: 1175)
!732 = !DISubprogram(name: "nexttoward", scope: !471, file: !471, line: 261, type: !733, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!733 = !DISubroutineType(types: !734)
!734 = !{!474, !474, !544}
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !736, file: !475, line: 1176)
!736 = !DISubprogram(name: "nexttowardf", scope: !471, file: !471, line: 261, type: !737, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!737 = !DISubroutineType(types: !738)
!738 = !{!533, !533, !544}
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !740, file: !475, line: 1177)
!740 = !DISubprogram(name: "nexttowardl", scope: !471, file: !471, line: 261, type: !571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !742, file: !475, line: 1179)
!742 = !DISubprogram(name: "remainder", scope: !471, file: !471, line: 272, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !744, file: !475, line: 1180)
!744 = !DISubprogram(name: "remainderf", scope: !471, file: !471, line: 272, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !746, file: !475, line: 1181)
!746 = !DISubprogram(name: "remainderl", scope: !471, file: !471, line: 272, type: !571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !748, file: !475, line: 1183)
!748 = !DISubprogram(name: "remquo", scope: !471, file: !471, line: 307, type: !749, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!749 = !DISubroutineType(types: !750)
!750 = !{!474, !474, !474, !502}
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !752, file: !475, line: 1184)
!752 = !DISubprogram(name: "remquof", scope: !471, file: !471, line: 307, type: !753, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!753 = !DISubroutineType(types: !754)
!754 = !{!533, !533, !533, !502}
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !756, file: !475, line: 1185)
!756 = !DISubprogram(name: "remquol", scope: !471, file: !471, line: 307, type: !757, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!757 = !DISubroutineType(types: !758)
!758 = !{!544, !544, !544, !502}
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !760, file: !475, line: 1187)
!760 = !DISubprogram(name: "rint", scope: !471, file: !471, line: 256, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !762, file: !475, line: 1188)
!762 = !DISubprogram(name: "rintf", scope: !471, file: !471, line: 256, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !764, file: !475, line: 1189)
!764 = !DISubprogram(name: "rintl", scope: !471, file: !471, line: 256, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !766, file: !475, line: 1191)
!766 = !DISubprogram(name: "round", scope: !471, file: !471, line: 298, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !768, file: !475, line: 1192)
!768 = !DISubprogram(name: "roundf", scope: !471, file: !471, line: 298, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !770, file: !475, line: 1193)
!770 = !DISubprogram(name: "roundl", scope: !471, file: !471, line: 298, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !772, file: !475, line: 1195)
!772 = !DISubprogram(name: "scalbln", scope: !471, file: !471, line: 290, type: !773, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!773 = !DISubroutineType(types: !774)
!774 = !{!474, !474, !210}
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !776, file: !475, line: 1196)
!776 = !DISubprogram(name: "scalblnf", scope: !471, file: !471, line: 290, type: !777, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!777 = !DISubroutineType(types: !778)
!778 = !{!533, !533, !210}
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !780, file: !475, line: 1197)
!780 = !DISubprogram(name: "scalblnl", scope: !471, file: !471, line: 290, type: !781, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!781 = !DISubroutineType(types: !782)
!782 = !{!544, !544, !210}
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !784, file: !475, line: 1199)
!784 = !DISubprogram(name: "scalbn", scope: !471, file: !471, line: 276, type: !505, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !786, file: !475, line: 1200)
!786 = !DISubprogram(name: "scalbnf", scope: !471, file: !471, line: 276, type: !787, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!787 = !DISubroutineType(types: !788)
!788 = !{!533, !533, !179}
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !790, file: !475, line: 1201)
!790 = !DISubprogram(name: "scalbnl", scope: !471, file: !471, line: 276, type: !791, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!791 = !DISubroutineType(types: !792)
!792 = !{!544, !544, !179}
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !794, file: !475, line: 1203)
!794 = !DISubprogram(name: "tgamma", scope: !471, file: !471, line: 235, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !796, file: !475, line: 1204)
!796 = !DISubprogram(name: "tgammaf", scope: !471, file: !471, line: 235, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !798, file: !475, line: 1205)
!798 = !DISubprogram(name: "tgammal", scope: !471, file: !471, line: 235, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !800, file: !475, line: 1207)
!800 = !DISubprogram(name: "trunc", scope: !471, file: !471, line: 302, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !802, file: !475, line: 1208)
!802 = !DISubprogram(name: "truncf", scope: !471, file: !471, line: 302, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !804, file: !475, line: 1209)
!804 = !DISubprogram(name: "truncl", scope: !471, file: !471, line: 302, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!805 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !806, entity: !807, file: !808, line: 58)
!806 = !DINamespace(name: "__gnu_debug", scope: null)
!807 = !DINamespace(name: "__debug", scope: !2)
!808 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "c69f68f2d2cbac034a41bb7ce5c36465")
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !810, file: !812, line: 127)
!810 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !465, line: 62, baseType: !811)
!811 = !DICompositeType(tag: DW_TAG_structure_type, file: !465, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!812 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdlib", directory: "")
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !814, file: !812, line: 128)
!814 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !465, line: 70, baseType: !815)
!815 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !465, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !816, identifier: "_ZTS6ldiv_t")
!816 = !{!817, !818}
!817 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !815, file: !465, line: 68, baseType: !210, size: 64)
!818 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !815, file: !465, line: 69, baseType: !210, size: 64, offset: 64)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !820, file: !812, line: 130)
!820 = !DISubprogram(name: "abort", scope: !465, file: !465, line: 588, type: !821, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!821 = !DISubroutineType(types: !822)
!822 = !{null}
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !824, file: !812, line: 132)
!824 = !DISubprogram(name: "aligned_alloc", scope: !465, file: !465, line: 583, type: !825, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!825 = !DISubroutineType(types: !826)
!826 = !{!278, !827, !827}
!827 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !828, line: 46, baseType: !829)
!828 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!829 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !831, file: !812, line: 134)
!831 = !DISubprogram(name: "atexit", scope: !465, file: !465, line: 592, type: !832, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!832 = !DISubroutineType(types: !833)
!833 = !{!179, !834}
!834 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !821, size: 64)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !836, file: !812, line: 137)
!836 = !DISubprogram(name: "at_quick_exit", scope: !465, file: !465, line: 597, type: !832, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !838, file: !812, line: 140)
!838 = !DISubprogram(name: "atof", scope: !839, file: !839, line: 25, type: !708, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!839 = !DIFile(filename: "/usr/include/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "ce60958b260b171e83db3307f1d644f0")
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !841, file: !812, line: 141)
!841 = !DISubprogram(name: "atoi", scope: !465, file: !465, line: 361, type: !842, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!842 = !DISubroutineType(types: !843)
!843 = !{!179, !710}
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !845, file: !812, line: 142)
!845 = !DISubprogram(name: "atol", scope: !465, file: !465, line: 366, type: !846, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!846 = !DISubroutineType(types: !847)
!847 = !{!210, !710}
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !849, file: !812, line: 143)
!849 = !DISubprogram(name: "bsearch", scope: !850, file: !850, line: 20, type: !851, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!850 = !DIFile(filename: "/usr/include/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "1a798a38b25adee7bb680abce9ef568a")
!851 = !DISubroutineType(types: !852)
!852 = !{!278, !853, !853, !827, !827, !855}
!853 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !854, size: 64)
!854 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!855 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !465, line: 805, baseType: !856)
!856 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !857, size: 64)
!857 = !DISubroutineType(types: !858)
!858 = !{!179, !853, !853}
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !860, file: !812, line: 144)
!860 = !DISubprogram(name: "calloc", scope: !465, file: !465, line: 541, type: !825, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !862, file: !812, line: 145)
!862 = !DISubprogram(name: "div", scope: !465, file: !465, line: 849, type: !863, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!863 = !DISubroutineType(types: !864)
!864 = !{!810, !179, !179}
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !866, file: !812, line: 146)
!866 = !DISubprogram(name: "exit", scope: !465, file: !465, line: 614, type: !867, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!867 = !DISubroutineType(types: !868)
!868 = !{null, !179}
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !870, file: !812, line: 147)
!870 = !DISubprogram(name: "free", scope: !465, file: !465, line: 563, type: !871, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!871 = !DISubroutineType(types: !872)
!872 = !{null, !278}
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !874, file: !812, line: 148)
!874 = !DISubprogram(name: "getenv", scope: !465, file: !465, line: 631, type: !875, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!875 = !DISubroutineType(types: !876)
!876 = !{!877, !710}
!877 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !879, file: !812, line: 149)
!879 = !DISubprogram(name: "labs", scope: !465, file: !465, line: 838, type: !880, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!880 = !DISubroutineType(types: !881)
!881 = !{!210, !210}
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !883, file: !812, line: 150)
!883 = !DISubprogram(name: "ldiv", scope: !465, file: !465, line: 851, type: !884, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!884 = !DISubroutineType(types: !885)
!885 = !{!814, !210, !210}
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !887, file: !812, line: 151)
!887 = !DISubprogram(name: "malloc", scope: !465, file: !465, line: 539, type: !888, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!888 = !DISubroutineType(types: !889)
!889 = !{!278, !827}
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !891, file: !812, line: 153)
!891 = !DISubprogram(name: "mblen", scope: !465, file: !465, line: 919, type: !892, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!892 = !DISubroutineType(types: !893)
!893 = !{!179, !710, !827}
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !895, file: !812, line: 154)
!895 = !DISubprogram(name: "mbstowcs", scope: !465, file: !465, line: 930, type: !896, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!896 = !DISubroutineType(types: !897)
!897 = !{!827, !898, !901, !827}
!898 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !899)
!899 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !900, size: 64)
!900 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!901 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !710)
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !903, file: !812, line: 155)
!903 = !DISubprogram(name: "mbtowc", scope: !465, file: !465, line: 922, type: !904, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!904 = !DISubroutineType(types: !905)
!905 = !{!179, !898, !901, !827}
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !907, file: !812, line: 157)
!907 = !DISubprogram(name: "qsort", scope: !465, file: !465, line: 827, type: !908, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!908 = !DISubroutineType(types: !909)
!909 = !{null, !278, !827, !827, !855}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !911, file: !812, line: 160)
!911 = !DISubprogram(name: "quick_exit", scope: !465, file: !465, line: 620, type: !867, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !913, file: !812, line: 163)
!913 = !DISubprogram(name: "rand", scope: !465, file: !465, line: 453, type: !914, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!914 = !DISubroutineType(types: !915)
!915 = !{!179}
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !917, file: !812, line: 164)
!917 = !DISubprogram(name: "realloc", scope: !465, file: !465, line: 549, type: !918, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!918 = !DISubroutineType(types: !919)
!919 = !{!278, !278, !827}
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !921, file: !812, line: 165)
!921 = !DISubprogram(name: "srand", scope: !465, file: !465, line: 455, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!922 = !DISubroutineType(types: !923)
!923 = !{null, !84}
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !925, file: !812, line: 166)
!925 = !DISubprogram(name: "strtod", scope: !465, file: !465, line: 117, type: !926, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!926 = !DISubroutineType(types: !927)
!927 = !{!474, !901, !928}
!928 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !929)
!929 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !877, size: 64)
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !931, file: !812, line: 167)
!931 = !DISubprogram(name: "strtol", scope: !465, file: !465, line: 176, type: !932, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!932 = !DISubroutineType(types: !933)
!933 = !{!210, !901, !928, !179}
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !935, file: !812, line: 168)
!935 = !DISubprogram(name: "strtoul", scope: !465, file: !465, line: 180, type: !936, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!936 = !DISubroutineType(types: !937)
!937 = !{!829, !901, !928, !179}
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !939, file: !812, line: 169)
!939 = !DISubprogram(name: "system", scope: !465, file: !465, line: 781, type: !842, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !941, file: !812, line: 171)
!941 = !DISubprogram(name: "wcstombs", scope: !465, file: !465, line: 933, type: !942, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!942 = !DISubroutineType(types: !943)
!943 = !{!827, !944, !945, !827}
!944 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !877)
!945 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !946)
!946 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !947, size: 64)
!947 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !900)
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !949, file: !812, line: 172)
!949 = !DISubprogram(name: "wctomb", scope: !465, file: !465, line: 926, type: !950, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!950 = !DISubroutineType(types: !951)
!951 = !{!179, !877, !900}
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !953, file: !812, line: 200)
!953 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !465, line: 80, baseType: !954)
!954 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !465, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !955, identifier: "_ZTS7lldiv_t")
!955 = !{!956, !957}
!956 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !954, file: !465, line: 78, baseType: !655, size: 64)
!957 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !954, file: !465, line: 79, baseType: !655, size: 64, offset: 64)
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !959, file: !812, line: 206)
!959 = !DISubprogram(name: "_Exit", scope: !465, file: !465, line: 626, type: !867, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !961, file: !812, line: 210)
!961 = !DISubprogram(name: "llabs", scope: !465, file: !465, line: 841, type: !962, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!962 = !DISubroutineType(types: !963)
!963 = !{!655, !655}
!964 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !965, file: !812, line: 216)
!965 = !DISubprogram(name: "lldiv", scope: !465, file: !465, line: 855, type: !966, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!966 = !DISubroutineType(types: !967)
!967 = !{!953, !655, !655}
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !969, file: !812, line: 227)
!969 = !DISubprogram(name: "atoll", scope: !465, file: !465, line: 373, type: !970, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!970 = !DISubroutineType(types: !971)
!971 = !{!655, !710}
!972 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !973, file: !812, line: 228)
!973 = !DISubprogram(name: "strtoll", scope: !465, file: !465, line: 200, type: !974, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!974 = !DISubroutineType(types: !975)
!975 = !{!655, !901, !928, !179}
!976 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !977, file: !812, line: 229)
!977 = !DISubprogram(name: "strtoull", scope: !465, file: !465, line: 205, type: !978, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!978 = !DISubroutineType(types: !979)
!979 = !{!980, !901, !928, !179}
!980 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !982, file: !812, line: 231)
!982 = !DISubprogram(name: "strtof", scope: !465, file: !465, line: 123, type: !983, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!983 = !DISubroutineType(types: !984)
!984 = !{!533, !901, !928}
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !986, file: !812, line: 232)
!986 = !DISubprogram(name: "strtold", scope: !465, file: !465, line: 126, type: !987, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!987 = !DISubroutineType(types: !988)
!988 = !{!544, !901, !928}
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !953, file: !812, line: 240)
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !959, file: !812, line: 242)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !961, file: !812, line: 244)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !993, file: !812, line: 245)
!993 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !83, file: !812, line: 213, type: !966, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !965, file: !812, line: 246)
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !969, file: !812, line: 248)
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !982, file: !812, line: 249)
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !973, file: !812, line: 250)
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !977, file: !812, line: 251)
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !986, file: !812, line: 252)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !820, file: !1001, line: 38)
!1001 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "74812296ae1ebf65f0c19983efc04bc1")
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !831, file: !1001, line: 39)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !866, file: !1001, line: 40)
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !836, file: !1001, line: 43)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !911, file: !1001, line: 46)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !810, file: !1001, line: 51)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !814, file: !1001, line: 52)
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !1009, file: !1001, line: 54)
!1009 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !2, file: !468, line: 79, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !838, file: !1001, line: 55)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !841, file: !1001, line: 56)
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !845, file: !1001, line: 57)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !849, file: !1001, line: 58)
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !860, file: !1001, line: 59)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !993, file: !1001, line: 60)
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !870, file: !1001, line: 61)
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !874, file: !1001, line: 62)
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !879, file: !1001, line: 63)
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !883, file: !1001, line: 64)
!1020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !887, file: !1001, line: 65)
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !891, file: !1001, line: 67)
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !895, file: !1001, line: 68)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !903, file: !1001, line: 69)
!1024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !907, file: !1001, line: 71)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !913, file: !1001, line: 72)
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !917, file: !1001, line: 73)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !921, file: !1001, line: 74)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !925, file: !1001, line: 75)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !931, file: !1001, line: 76)
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !935, file: !1001, line: 77)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !939, file: !1001, line: 78)
!1032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !941, file: !1001, line: 80)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !949, file: !1001, line: 81)
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1035, file: !1036, line: 58)
!1035 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !1037, file: !1036, line: 80, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!1036 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "9bda7d21a11cfdb902745e8f6fa7810a")
!1037 = !DINamespace(name: "__exception_ptr", scope: !2)
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1037, entity: !1039, file: !1036, line: 74)
!1039 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !1036, line: 70, type: !1040, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{null, !1035}
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1043, file: !1044, line: 200)
!1043 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !1044, file: !1044, line: 28, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1044 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1046, file: !1044, line: 201)
!1046 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !1044, file: !1044, line: 32, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1048, file: !1044, line: 202)
!1048 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !1044, file: !1044, line: 34, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1050, file: !1044, line: 203)
!1050 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !1044, file: !1044, line: 36, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1052, file: !1044, line: 204)
!1052 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !1044, file: !1044, line: 38, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1054, file: !1044, line: 205)
!1054 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !1044, file: !1044, line: 42, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1056, file: !1044, line: 206)
!1056 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !1044, file: !1044, line: 40, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1058, file: !1044, line: 207)
!1058 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !1044, file: !1044, line: 44, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1060, file: !1044, line: 208)
!1060 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !1044, file: !1044, line: 46, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1062, file: !1044, line: 209)
!1062 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !1044, file: !1044, line: 48, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1064, file: !1044, line: 210)
!1064 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !1044, file: !1044, line: 50, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1066, file: !1044, line: 211)
!1066 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !1044, file: !1044, line: 52, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1068, file: !1044, line: 212)
!1068 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !1044, file: !1044, line: 54, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1070, file: !1044, line: 213)
!1070 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !1044, file: !1044, line: 58, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1072, file: !1044, line: 214)
!1072 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !1044, file: !1044, line: 56, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1074, file: !1044, line: 215)
!1074 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !1044, file: !1044, line: 62, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1076, file: !1044, line: 216)
!1076 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !1044, file: !1044, line: 60, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1078, file: !1044, line: 217)
!1078 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !1044, file: !1044, line: 64, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1080, file: !1044, line: 218)
!1080 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !1044, file: !1044, line: 66, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1082, file: !1044, line: 219)
!1082 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !1044, file: !1044, line: 68, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1084, file: !1044, line: 220)
!1084 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !1044, file: !1044, line: 70, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1086, file: !1044, line: 221)
!1086 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !1044, file: !1044, line: 72, type: !609, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1088, file: !1044, line: 222)
!1088 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !1044, file: !1044, line: 74, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1090, file: !1044, line: 223)
!1090 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !1044, file: !1044, line: 76, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1092, file: !1044, line: 224)
!1092 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !1044, file: !1044, line: 78, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1094, file: !1044, line: 225)
!1094 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !1044, file: !1044, line: 80, type: !639, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1096, file: !1044, line: 226)
!1096 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !1044, file: !1044, line: 82, type: !1097, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1097 = !DISubroutineType(types: !1098)
!1098 = !{!533, !533, !502}
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1100, file: !1044, line: 227)
!1100 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !1044, file: !1044, line: 84, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1102, file: !1044, line: 228)
!1102 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !1044, file: !1044, line: 86, type: !639, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1104, file: !1044, line: 229)
!1104 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !1044, file: !1044, line: 91, type: !1105, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1105 = !DISubroutineType(types: !1106)
!1106 = !{!286, !533}
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1108, file: !1044, line: 230)
!1108 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !1044, file: !1044, line: 95, type: !1109, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1109 = !DISubroutineType(types: !1110)
!1110 = !{!286, !533, !533}
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1112, file: !1044, line: 231)
!1112 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !1044, file: !1044, line: 94, type: !1109, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1114, file: !1044, line: 232)
!1114 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !1044, file: !1044, line: 100, type: !1105, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1116, file: !1044, line: 233)
!1116 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !1044, file: !1044, line: 104, type: !1109, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1118, file: !1044, line: 234)
!1118 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !1044, file: !1044, line: 103, type: !1109, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1120, file: !1044, line: 235)
!1120 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !1044, file: !1044, line: 106, type: !1109, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1122, file: !1044, line: 236)
!1122 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !1044, file: !1044, line: 111, type: !1105, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1124, file: !1044, line: 237)
!1124 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !1044, file: !1044, line: 113, type: !1105, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1126, file: !1044, line: 238)
!1126 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !1044, file: !1044, line: 115, type: !1109, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1128, file: !1044, line: 239)
!1128 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !1044, file: !1044, line: 116, type: !880, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1130, file: !1044, line: 240)
!1130 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !1044, file: !1044, line: 118, type: !787, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1132, file: !1044, line: 241)
!1132 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !1044, file: !1044, line: 120, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1134, file: !1044, line: 242)
!1134 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !1044, file: !1044, line: 121, type: !962, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1136, file: !1044, line: 243)
!1136 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !1044, file: !1044, line: 123, type: !658, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1138, file: !1044, line: 244)
!1138 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !1044, file: !1044, line: 133, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1140, file: !1044, line: 245)
!1140 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !1044, file: !1044, line: 125, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1142, file: !1044, line: 246)
!1142 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !1044, file: !1044, line: 127, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1144, file: !1044, line: 247)
!1144 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !1044, file: !1044, line: 129, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1146, file: !1044, line: 248)
!1146 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !1044, file: !1044, line: 131, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1148, file: !1044, line: 249)
!1148 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !1044, file: !1044, line: 135, type: !694, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1150, file: !1044, line: 250)
!1150 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !1044, file: !1044, line: 137, type: !694, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1152, file: !1044, line: 251)
!1152 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !1044, file: !1044, line: 138, type: !658, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1154, file: !1044, line: 252)
!1154 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !1044, file: !1044, line: 140, type: !1155, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!533, !533, !1157}
!1157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !533, size: 64)
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1159, file: !1044, line: 253)
!1159 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !1044, file: !1044, line: 141, type: !708, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1161, file: !1044, line: 254)
!1161 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !1044, file: !1044, line: 142, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1163, file: !1044, line: 255)
!1163 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !1044, file: !1044, line: 144, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1165, file: !1044, line: 256)
!1165 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !1044, file: !1044, line: 146, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1167, file: !1044, line: 257)
!1167 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !1044, file: !1044, line: 150, type: !787, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1169, file: !1044, line: 258)
!1169 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !1044, file: !1044, line: 152, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1171, file: !1044, line: 259)
!1171 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !1044, file: !1044, line: 154, type: !753, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1173, file: !1044, line: 260)
!1173 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !1044, file: !1044, line: 156, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1175, file: !1044, line: 261)
!1175 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !1044, file: !1044, line: 158, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1177, file: !1044, line: 262)
!1177 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !1044, file: !1044, line: 160, type: !777, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1179, file: !1044, line: 263)
!1179 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !1044, file: !1044, line: 162, type: !787, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1181, file: !1044, line: 264)
!1181 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !1044, file: !1044, line: 167, type: !1105, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1183, file: !1044, line: 265)
!1183 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !1044, file: !1044, line: 169, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1185, file: !1044, line: 266)
!1185 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !1044, file: !1044, line: 171, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1187, file: !1044, line: 267)
!1187 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !1044, file: !1044, line: 173, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1189, file: !1044, line: 268)
!1189 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !1044, file: !1044, line: 175, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1191, file: !1044, line: 269)
!1191 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !1044, file: !1044, line: 177, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1193, file: !1044, line: 270)
!1193 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !1044, file: !1044, line: 179, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1195, file: !1044, line: 271)
!1195 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !1044, file: !1044, line: 181, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1197, file: !1199, line: 729)
!1197 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !1198, file: !1198, line: 188, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1198 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "77b108a711ff1d970d6aaeeab7921660")
!1199 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "0af09435178b3f6de185f06c3a9cbb63")
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1201, file: !1199, line: 730)
!1201 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !1198, file: !1198, line: 191, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1203, file: !1199, line: 731)
!1203 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !1198, file: !1198, line: 194, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1205, file: !1199, line: 732)
!1205 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !1198, file: !1198, line: 197, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1207, file: !1199, line: 733)
!1207 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !1198, file: !1198, line: 200, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1209, file: !1199, line: 734)
!1209 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !1198, file: !1198, line: 203, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1211, file: !1199, line: 735)
!1211 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !1198, file: !1198, line: 206, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1213, file: !1199, line: 736)
!1213 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !1198, file: !1198, line: 209, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1215, file: !1199, line: 737)
!1215 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !1198, file: !1198, line: 212, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1217, file: !1199, line: 738)
!1217 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !1198, file: !1198, line: 215, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1219, file: !1199, line: 739)
!1219 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !1198, file: !1198, line: 218, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1221, file: !1199, line: 740)
!1221 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !1198, file: !1198, line: 221, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1223, file: !1199, line: 741)
!1223 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !1198, file: !1198, line: 233, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1225, file: !1199, line: 742)
!1225 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !1198, file: !1198, line: 242, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1227, file: !1199, line: 743)
!1227 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !1198, file: !1198, line: 251, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1229, file: !1199, line: 744)
!1229 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !1198, file: !1198, line: 254, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1231, file: !1199, line: 745)
!1231 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !1198, file: !1198, line: 257, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1233, file: !1199, line: 746)
!1233 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !1198, file: !1198, line: 260, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1235, file: !1199, line: 747)
!1235 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !1198, file: !1198, line: 263, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1237, file: !1199, line: 748)
!1237 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !1198, file: !1198, line: 269, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1239, file: !1199, line: 749)
!1239 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !1198, file: !1198, line: 272, type: !609, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1241, file: !1199, line: 750)
!1241 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !1198, file: !1198, line: 277, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1243, file: !1199, line: 751)
!1243 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !1198, file: !1198, line: 280, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1245, file: !1199, line: 752)
!1245 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !1198, file: !1198, line: 283, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1247, file: !1199, line: 753)
!1247 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !1198, file: !1198, line: 286, type: !1097, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1249, file: !1199, line: 754)
!1249 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !1198, file: !1198, line: 299, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1251, file: !1199, line: 755)
!1251 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !1198, file: !1198, line: 302, type: !639, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1253, file: !1199, line: 756)
!1253 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !1198, file: !1198, line: 341, type: !787, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1255, file: !1199, line: 757)
!1255 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !1198, file: !1198, line: 344, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1257, file: !1199, line: 758)
!1257 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !1198, file: !1198, line: 347, type: !658, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1259, file: !1199, line: 759)
!1259 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !1198, file: !1198, line: 350, type: !658, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1261, file: !1199, line: 760)
!1261 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !1198, file: !1198, line: 353, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1263, file: !1199, line: 761)
!1263 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !1198, file: !1198, line: 356, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1265, file: !1199, line: 762)
!1265 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !1198, file: !1198, line: 359, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1267, file: !1199, line: 763)
!1267 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !1198, file: !1198, line: 365, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1269, file: !1199, line: 764)
!1269 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !1198, file: !1198, line: 368, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1271, file: !1199, line: 765)
!1271 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !1198, file: !1198, line: 371, type: !694, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1273, file: !1199, line: 766)
!1273 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !1198, file: !1198, line: 374, type: !694, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1275, file: !1199, line: 767)
!1275 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !1198, file: !1198, line: 377, type: !1155, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1277, file: !1199, line: 768)
!1277 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !1198, file: !1198, line: 413, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1279, file: !1199, line: 769)
!1279 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !1198, file: !1198, line: 416, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1281, file: !1199, line: 771)
!1281 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !1198, file: !1198, line: 449, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1283, file: !1199, line: 772)
!1283 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !1198, file: !1198, line: 474, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1285, file: !1199, line: 773)
!1285 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !1198, file: !1198, line: 479, type: !753, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1287, file: !1199, line: 774)
!1287 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !1198, file: !1198, line: 495, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1289, file: !1199, line: 775)
!1289 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !1198, file: !1198, line: 520, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1291, file: !1199, line: 776)
!1291 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !1198, file: !1198, line: 526, type: !777, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1293, file: !1199, line: 777)
!1293 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !1198, file: !1198, line: 532, type: !787, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1295, file: !1199, line: 778)
!1295 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !1198, file: !1198, line: 560, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1297, file: !1199, line: 779)
!1297 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !1198, file: !1198, line: 563, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1299, file: !1199, line: 780)
!1299 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !1198, file: !1198, line: 569, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1301, file: !1199, line: 781)
!1301 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !1198, file: !1198, line: 572, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1303, file: !1199, line: 782)
!1303 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !1198, file: !1198, line: 575, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1305, file: !1199, line: 783)
!1305 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !1198, file: !1198, line: 578, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1307, file: !1199, line: 784)
!1307 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !1198, file: !1198, line: 581, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1309, file: !1322, line: 64)
!1309 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !1310, line: 6, baseType: !1311)
!1310 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!1311 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !1312, line: 21, baseType: !1313)
!1312 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!1313 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1312, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !1314, identifier: "_ZTS11__mbstate_t")
!1314 = !{!1315, !1316}
!1315 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !1313, file: !1312, line: 15, baseType: !179, size: 32)
!1316 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !1313, file: !1312, line: 20, baseType: !1317, size: 32, offset: 32)
!1317 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1313, file: !1312, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !1318, identifier: "_ZTSN11__mbstate_tUt_E")
!1318 = !{!1319, !1320}
!1319 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !1317, file: !1312, line: 18, baseType: !84, size: 32)
!1320 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !1317, file: !1312, line: 19, baseType: !1321, size: 32)
!1321 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 32, elements: !38)
!1322 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cwchar", directory: "")
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1324, file: !1322, line: 141)
!1324 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !1325, line: 20, baseType: !84)
!1325 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1327, file: !1322, line: 143)
!1327 = !DISubprogram(name: "btowc", scope: !1328, file: !1328, line: 318, type: !1329, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1328 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "5c0512b032e303d7adfb2a47454ecb1c")
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!1324, !179}
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1332, file: !1322, line: 144)
!1332 = !DISubprogram(name: "fgetwc", scope: !1328, file: !1328, line: 727, type: !1333, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1333 = !DISubroutineType(types: !1334)
!1334 = !{!1324, !1335}
!1335 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1336, size: 64)
!1336 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !1337, line: 5, baseType: !1338)
!1337 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!1338 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !1339, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !1340, identifier: "_ZTS8_IO_FILE")
!1339 = !DIFile(filename: "/usr/include/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "58de959587374b9ee900baa441e1355b")
!1340 = !{!1341, !1342, !1343, !1344, !1345, !1346, !1347, !1348, !1349, !1350, !1351, !1352, !1353, !1356, !1358, !1359, !1360, !1362, !1364, !1366, !1370, !1373, !1375, !1378, !1381, !1382, !1383, !1384, !1385}
!1341 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !1338, file: !1339, line: 51, baseType: !179, size: 32)
!1342 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !1338, file: !1339, line: 54, baseType: !877, size: 64, offset: 64)
!1343 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !1338, file: !1339, line: 55, baseType: !877, size: 64, offset: 128)
!1344 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !1338, file: !1339, line: 56, baseType: !877, size: 64, offset: 192)
!1345 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !1338, file: !1339, line: 57, baseType: !877, size: 64, offset: 256)
!1346 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !1338, file: !1339, line: 58, baseType: !877, size: 64, offset: 320)
!1347 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !1338, file: !1339, line: 59, baseType: !877, size: 64, offset: 384)
!1348 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !1338, file: !1339, line: 60, baseType: !877, size: 64, offset: 448)
!1349 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !1338, file: !1339, line: 61, baseType: !877, size: 64, offset: 512)
!1350 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !1338, file: !1339, line: 64, baseType: !877, size: 64, offset: 576)
!1351 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !1338, file: !1339, line: 65, baseType: !877, size: 64, offset: 640)
!1352 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !1338, file: !1339, line: 66, baseType: !877, size: 64, offset: 704)
!1353 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !1338, file: !1339, line: 68, baseType: !1354, size: 64, offset: 768)
!1354 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1355, size: 64)
!1355 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !1339, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!1356 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !1338, file: !1339, line: 70, baseType: !1357, size: 64, offset: 832)
!1357 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1338, size: 64)
!1358 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !1338, file: !1339, line: 72, baseType: !179, size: 32, offset: 896)
!1359 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !1338, file: !1339, line: 73, baseType: !179, size: 32, offset: 928)
!1360 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !1338, file: !1339, line: 74, baseType: !1361, size: 64, offset: 960)
!1361 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !196, line: 150, baseType: !210)
!1362 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !1338, file: !1339, line: 77, baseType: !1363, size: 16, offset: 1024)
!1363 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1364 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !1338, file: !1339, line: 78, baseType: !1365, size: 8, offset: 1040)
!1365 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1366 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !1338, file: !1339, line: 79, baseType: !1367, size: 8, offset: 1048)
!1367 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 8, elements: !1368)
!1368 = !{!1369}
!1369 = !DISubrange(count: 1)
!1370 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !1338, file: !1339, line: 81, baseType: !1371, size: 64, offset: 1088)
!1371 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1372, size: 64)
!1372 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !1339, line: 43, baseType: null)
!1373 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !1338, file: !1339, line: 89, baseType: !1374, size: 64, offset: 1152)
!1374 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !196, line: 151, baseType: !210)
!1375 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !1338, file: !1339, line: 91, baseType: !1376, size: 64, offset: 1216)
!1376 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1377, size: 64)
!1377 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !1339, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!1378 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !1338, file: !1339, line: 92, baseType: !1379, size: 64, offset: 1280)
!1379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1380, size: 64)
!1380 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !1339, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!1381 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !1338, file: !1339, line: 93, baseType: !1357, size: 64, offset: 1344)
!1382 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !1338, file: !1339, line: 94, baseType: !278, size: 64, offset: 1408)
!1383 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !1338, file: !1339, line: 95, baseType: !827, size: 64, offset: 1472)
!1384 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !1338, file: !1339, line: 96, baseType: !179, size: 32, offset: 1536)
!1385 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !1338, file: !1339, line: 98, baseType: !1386, size: 160, offset: 1568)
!1386 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, elements: !1387)
!1387 = !{!1388}
!1388 = !DISubrange(count: 20)
!1389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1390, file: !1322, line: 145)
!1390 = !DISubprogram(name: "fgetws", scope: !1328, file: !1328, line: 756, type: !1391, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1391 = !DISubroutineType(types: !1392)
!1392 = !{!899, !898, !179, !1393}
!1393 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1335)
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1395, file: !1322, line: 146)
!1395 = !DISubprogram(name: "fputwc", scope: !1328, file: !1328, line: 741, type: !1396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1396 = !DISubroutineType(types: !1397)
!1397 = !{!1324, !900, !1335}
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1399, file: !1322, line: 147)
!1399 = !DISubprogram(name: "fputws", scope: !1328, file: !1328, line: 763, type: !1400, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1400 = !DISubroutineType(types: !1401)
!1401 = !{!179, !945, !1393}
!1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1403, file: !1322, line: 148)
!1403 = !DISubprogram(name: "fwide", scope: !1328, file: !1328, line: 573, type: !1404, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1404 = !DISubroutineType(types: !1405)
!1405 = !{!179, !1335, !179}
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1407, file: !1322, line: 149)
!1407 = !DISubprogram(name: "fwprintf", scope: !1328, file: !1328, line: 580, type: !1408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1408 = !DISubroutineType(types: !1409)
!1409 = !{!179, !1393, !945, null}
!1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1411, file: !1322, line: 150)
!1411 = !DISubprogram(name: "fwscanf", scope: !1328, file: !1328, line: 621, type: !1408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1413, file: !1322, line: 151)
!1413 = !DISubprogram(name: "getwc", scope: !1328, file: !1328, line: 728, type: !1333, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1415, file: !1322, line: 152)
!1415 = !DISubprogram(name: "getwchar", scope: !1328, file: !1328, line: 734, type: !1416, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1416 = !DISubroutineType(types: !1417)
!1417 = !{!1324}
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1419, file: !1322, line: 153)
!1419 = !DISubprogram(name: "mbrlen", scope: !1328, file: !1328, line: 329, type: !1420, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1420 = !DISubroutineType(types: !1421)
!1421 = !{!827, !901, !827, !1422}
!1422 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1423)
!1423 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1309, size: 64)
!1424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1425, file: !1322, line: 154)
!1425 = !DISubprogram(name: "mbrtowc", scope: !1328, file: !1328, line: 296, type: !1426, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1426 = !DISubroutineType(types: !1427)
!1427 = !{!827, !898, !901, !827, !1422}
!1428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1429, file: !1322, line: 155)
!1429 = !DISubprogram(name: "mbsinit", scope: !1328, file: !1328, line: 292, type: !1430, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1430 = !DISubroutineType(types: !1431)
!1431 = !{!179, !1432}
!1432 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1433, size: 64)
!1433 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1309)
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1435, file: !1322, line: 156)
!1435 = !DISubprogram(name: "mbsrtowcs", scope: !1328, file: !1328, line: 337, type: !1436, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1436 = !DISubroutineType(types: !1437)
!1437 = !{!827, !898, !1438, !827, !1422}
!1438 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1439)
!1439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !710, size: 64)
!1440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1441, file: !1322, line: 157)
!1441 = !DISubprogram(name: "putwc", scope: !1328, file: !1328, line: 742, type: !1396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1443, file: !1322, line: 158)
!1443 = !DISubprogram(name: "putwchar", scope: !1328, file: !1328, line: 748, type: !1444, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1444 = !DISubroutineType(types: !1445)
!1445 = !{!1324, !900}
!1446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1447, file: !1322, line: 160)
!1447 = !DISubprogram(name: "swprintf", scope: !1328, file: !1328, line: 590, type: !1448, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1448 = !DISubroutineType(types: !1449)
!1449 = !{!179, !898, !827, !945, null}
!1450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1451, file: !1322, line: 162)
!1451 = !DISubprogram(name: "swscanf", scope: !1328, file: !1328, line: 631, type: !1452, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1452 = !DISubroutineType(types: !1453)
!1453 = !{!179, !945, !945, null}
!1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1455, file: !1322, line: 163)
!1455 = !DISubprogram(name: "ungetwc", scope: !1328, file: !1328, line: 771, type: !1456, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1456 = !DISubroutineType(types: !1457)
!1457 = !{!1324, !1324, !1335}
!1458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1459, file: !1322, line: 164)
!1459 = !DISubprogram(name: "vfwprintf", scope: !1328, file: !1328, line: 598, type: !1460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1460 = !DISubroutineType(types: !1461)
!1461 = !{!179, !1393, !945, !1462}
!1462 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1463, size: 64)
!1463 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !1464, size: 192, flags: DIFlagTypePassByValue, elements: !1465, identifier: "_ZTS13__va_list_tag")
!1464 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard")
!1465 = !{!1466, !1467, !1468, !1469}
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !1463, file: !1464, baseType: !84, size: 32)
!1467 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !1463, file: !1464, baseType: !84, size: 32, offset: 32)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !1463, file: !1464, baseType: !278, size: 64, offset: 64)
!1469 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !1463, file: !1464, baseType: !278, size: 64, offset: 128)
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1471, file: !1322, line: 166)
!1471 = !DISubprogram(name: "vfwscanf", scope: !1328, file: !1328, line: 673, type: !1460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1473, file: !1322, line: 169)
!1473 = !DISubprogram(name: "vswprintf", scope: !1328, file: !1328, line: 611, type: !1474, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1474 = !DISubroutineType(types: !1475)
!1475 = !{!179, !898, !827, !945, !1462}
!1476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1477, file: !1322, line: 172)
!1477 = !DISubprogram(name: "vswscanf", scope: !1328, file: !1328, line: 685, type: !1478, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1478 = !DISubroutineType(types: !1479)
!1479 = !{!179, !945, !945, !1462}
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1481, file: !1322, line: 174)
!1481 = !DISubprogram(name: "vwprintf", scope: !1328, file: !1328, line: 606, type: !1482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1482 = !DISubroutineType(types: !1483)
!1483 = !{!179, !945, !1462}
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1485, file: !1322, line: 176)
!1485 = !DISubprogram(name: "vwscanf", scope: !1328, file: !1328, line: 681, type: !1482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1487, file: !1322, line: 178)
!1487 = !DISubprogram(name: "wcrtomb", scope: !1328, file: !1328, line: 301, type: !1488, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{!827, !944, !900, !1422}
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1491, file: !1322, line: 179)
!1491 = !DISubprogram(name: "wcscat", scope: !1328, file: !1328, line: 97, type: !1492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1492 = !DISubroutineType(types: !1493)
!1493 = !{!899, !898, !945}
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1495, file: !1322, line: 180)
!1495 = !DISubprogram(name: "wcscmp", scope: !1328, file: !1328, line: 106, type: !1496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1496 = !DISubroutineType(types: !1497)
!1497 = !{!179, !946, !946}
!1498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1499, file: !1322, line: 181)
!1499 = !DISubprogram(name: "wcscoll", scope: !1328, file: !1328, line: 131, type: !1496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1501, file: !1322, line: 182)
!1501 = !DISubprogram(name: "wcscpy", scope: !1328, file: !1328, line: 87, type: !1492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1503, file: !1322, line: 183)
!1503 = !DISubprogram(name: "wcscspn", scope: !1328, file: !1328, line: 187, type: !1504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1504 = !DISubroutineType(types: !1505)
!1505 = !{!827, !946, !946}
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1507, file: !1322, line: 184)
!1507 = !DISubprogram(name: "wcsftime", scope: !1328, file: !1328, line: 835, type: !1508, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1508 = !DISubroutineType(types: !1509)
!1509 = !{!827, !898, !827, !945, !1510}
!1510 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1511)
!1511 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1512, size: 64)
!1512 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1513)
!1513 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1514, line: 7, size: 448, flags: DIFlagTypePassByValue, elements: !1515, identifier: "_ZTS2tm")
!1514 = !DIFile(filename: "/usr/include/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!1515 = !{!1516, !1517, !1518, !1519, !1520, !1521, !1522, !1523, !1524, !1525, !1526}
!1516 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !1513, file: !1514, line: 9, baseType: !179, size: 32)
!1517 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !1513, file: !1514, line: 10, baseType: !179, size: 32, offset: 32)
!1518 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !1513, file: !1514, line: 11, baseType: !179, size: 32, offset: 64)
!1519 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !1513, file: !1514, line: 12, baseType: !179, size: 32, offset: 96)
!1520 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !1513, file: !1514, line: 13, baseType: !179, size: 32, offset: 128)
!1521 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !1513, file: !1514, line: 14, baseType: !179, size: 32, offset: 160)
!1522 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !1513, file: !1514, line: 15, baseType: !179, size: 32, offset: 192)
!1523 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !1513, file: !1514, line: 16, baseType: !179, size: 32, offset: 224)
!1524 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !1513, file: !1514, line: 17, baseType: !179, size: 32, offset: 256)
!1525 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !1513, file: !1514, line: 20, baseType: !210, size: 64, offset: 320)
!1526 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !1513, file: !1514, line: 21, baseType: !710, size: 64, offset: 384)
!1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1528, file: !1322, line: 185)
!1528 = !DISubprogram(name: "wcslen", scope: !1328, file: !1328, line: 222, type: !1529, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1529 = !DISubroutineType(types: !1530)
!1530 = !{!827, !946}
!1531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1532, file: !1322, line: 186)
!1532 = !DISubprogram(name: "wcsncat", scope: !1328, file: !1328, line: 101, type: !1533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1533 = !DISubroutineType(types: !1534)
!1534 = !{!899, !898, !945, !827}
!1535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1536, file: !1322, line: 187)
!1536 = !DISubprogram(name: "wcsncmp", scope: !1328, file: !1328, line: 109, type: !1537, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1537 = !DISubroutineType(types: !1538)
!1538 = !{!179, !946, !946, !827}
!1539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1540, file: !1322, line: 188)
!1540 = !DISubprogram(name: "wcsncpy", scope: !1328, file: !1328, line: 92, type: !1533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1542, file: !1322, line: 189)
!1542 = !DISubprogram(name: "wcsrtombs", scope: !1328, file: !1328, line: 343, type: !1543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1543 = !DISubroutineType(types: !1544)
!1544 = !{!827, !944, !1545, !827, !1422}
!1545 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1546)
!1546 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !946, size: 64)
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1548, file: !1322, line: 190)
!1548 = !DISubprogram(name: "wcsspn", scope: !1328, file: !1328, line: 191, type: !1504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1550, file: !1322, line: 191)
!1550 = !DISubprogram(name: "wcstod", scope: !1328, file: !1328, line: 377, type: !1551, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1551 = !DISubroutineType(types: !1552)
!1552 = !{!474, !945, !1553}
!1553 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1554)
!1554 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !899, size: 64)
!1555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1556, file: !1322, line: 193)
!1556 = !DISubprogram(name: "wcstof", scope: !1328, file: !1328, line: 382, type: !1557, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1557 = !DISubroutineType(types: !1558)
!1558 = !{!533, !945, !1553}
!1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1560, file: !1322, line: 195)
!1560 = !DISubprogram(name: "wcstok", scope: !1328, file: !1328, line: 217, type: !1561, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1561 = !DISubroutineType(types: !1562)
!1562 = !{!899, !898, !945, !1553}
!1563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1564, file: !1322, line: 196)
!1564 = !DISubprogram(name: "wcstol", scope: !1328, file: !1328, line: 428, type: !1565, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1565 = !DISubroutineType(types: !1566)
!1566 = !{!210, !945, !1553, !179}
!1567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1568, file: !1322, line: 197)
!1568 = !DISubprogram(name: "wcstoul", scope: !1328, file: !1328, line: 433, type: !1569, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1569 = !DISubroutineType(types: !1570)
!1570 = !{!829, !945, !1553, !179}
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1572, file: !1322, line: 198)
!1572 = !DISubprogram(name: "wcsxfrm", scope: !1328, file: !1328, line: 135, type: !1573, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1573 = !DISubroutineType(types: !1574)
!1574 = !{!827, !898, !945, !827}
!1575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1576, file: !1322, line: 199)
!1576 = !DISubprogram(name: "wctob", scope: !1328, file: !1328, line: 324, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1577 = !DISubroutineType(types: !1578)
!1578 = !{!179, !1324}
!1579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1580, file: !1322, line: 200)
!1580 = !DISubprogram(name: "wmemcmp", scope: !1328, file: !1328, line: 258, type: !1537, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1582, file: !1322, line: 201)
!1582 = !DISubprogram(name: "wmemcpy", scope: !1328, file: !1328, line: 262, type: !1533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1584, file: !1322, line: 202)
!1584 = !DISubprogram(name: "wmemmove", scope: !1328, file: !1328, line: 267, type: !1585, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1585 = !DISubroutineType(types: !1586)
!1586 = !{!899, !899, !946, !827}
!1587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1588, file: !1322, line: 203)
!1588 = !DISubprogram(name: "wmemset", scope: !1328, file: !1328, line: 271, type: !1589, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1589 = !DISubroutineType(types: !1590)
!1590 = !{!899, !899, !900, !827}
!1591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1592, file: !1322, line: 204)
!1592 = !DISubprogram(name: "wprintf", scope: !1328, file: !1328, line: 587, type: !1593, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1593 = !DISubroutineType(types: !1594)
!1594 = !{!179, !945, null}
!1595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1596, file: !1322, line: 205)
!1596 = !DISubprogram(name: "wscanf", scope: !1328, file: !1328, line: 628, type: !1593, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1598, file: !1322, line: 206)
!1598 = !DISubprogram(name: "wcschr", scope: !1328, file: !1328, line: 164, type: !1599, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1599 = !DISubroutineType(types: !1600)
!1600 = !{!899, !946, !900}
!1601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1602, file: !1322, line: 207)
!1602 = !DISubprogram(name: "wcspbrk", scope: !1328, file: !1328, line: 201, type: !1603, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1603 = !DISubroutineType(types: !1604)
!1604 = !{!899, !946, !946}
!1605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1606, file: !1322, line: 208)
!1606 = !DISubprogram(name: "wcsrchr", scope: !1328, file: !1328, line: 174, type: !1599, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1608, file: !1322, line: 209)
!1608 = !DISubprogram(name: "wcsstr", scope: !1328, file: !1328, line: 212, type: !1603, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1610, file: !1322, line: 210)
!1610 = !DISubprogram(name: "wmemchr", scope: !1328, file: !1328, line: 253, type: !1611, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1611 = !DISubroutineType(types: !1612)
!1612 = !{!899, !946, !900, !827}
!1613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !1614, file: !1322, line: 251)
!1614 = !DISubprogram(name: "wcstold", scope: !1328, file: !1328, line: 384, type: !1615, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1615 = !DISubroutineType(types: !1616)
!1616 = !{!544, !945, !1553}
!1617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !1618, file: !1322, line: 260)
!1618 = !DISubprogram(name: "wcstoll", scope: !1328, file: !1328, line: 441, type: !1619, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1619 = !DISubroutineType(types: !1620)
!1620 = !{!655, !945, !1553, !179}
!1621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !1622, file: !1322, line: 261)
!1622 = !DISubprogram(name: "wcstoull", scope: !1328, file: !1328, line: 448, type: !1623, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1623 = !DISubroutineType(types: !1624)
!1624 = !{!980, !945, !1553, !179}
!1625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1614, file: !1322, line: 267)
!1626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1618, file: !1322, line: 268)
!1627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1622, file: !1322, line: 269)
!1628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1556, file: !1322, line: 283)
!1629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1471, file: !1322, line: 286)
!1630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1477, file: !1322, line: 289)
!1631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1485, file: !1322, line: 292)
!1632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1614, file: !1322, line: 296)
!1633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1618, file: !1322, line: 297)
!1634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1622, file: !1322, line: 298)
!1635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1636, file: !1639, line: 47)
!1636 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1637, line: 24, baseType: !1638)
!1637 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "457547631e07cd24d9a14c8410e28e57")
!1638 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !196, line: 36, baseType: !1365)
!1639 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdint", directory: "")
!1640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1641, file: !1639, line: 48)
!1641 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1637, line: 25, baseType: !1642)
!1642 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !196, line: 38, baseType: !1643)
!1643 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1645, file: !1639, line: 49)
!1645 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1637, line: 26, baseType: !1646)
!1646 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !196, line: 40, baseType: !179)
!1647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1648, file: !1639, line: 50)
!1648 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1637, line: 27, baseType: !1649)
!1649 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !196, line: 43, baseType: !210)
!1650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1651, file: !1639, line: 52)
!1651 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !215, line: 58, baseType: !1365)
!1652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1653, file: !1639, line: 53)
!1653 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !215, line: 60, baseType: !210)
!1654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1655, file: !1639, line: 54)
!1655 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !215, line: 61, baseType: !210)
!1656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1657, file: !1639, line: 55)
!1657 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !215, line: 62, baseType: !210)
!1658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1659, file: !1639, line: 57)
!1659 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !215, line: 43, baseType: !1660)
!1660 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !196, line: 51, baseType: !1638)
!1661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1662, file: !1639, line: 58)
!1662 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !215, line: 44, baseType: !1663)
!1663 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !196, line: 53, baseType: !1642)
!1664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1665, file: !1639, line: 59)
!1665 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !215, line: 45, baseType: !1666)
!1666 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !196, line: 55, baseType: !1646)
!1667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1668, file: !1639, line: 60)
!1668 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !215, line: 46, baseType: !1669)
!1669 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !196, line: 57, baseType: !1649)
!1670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !214, file: !1639, line: 62)
!1671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1672, file: !1639, line: 63)
!1672 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !215, line: 87, baseType: !210)
!1673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1674, file: !1639, line: 65)
!1674 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !194, line: 24, baseType: !1675)
!1675 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !196, line: 37, baseType: !276)
!1676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1677, file: !1639, line: 66)
!1677 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !194, line: 25, baseType: !1678)
!1678 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !196, line: 39, baseType: !1363)
!1679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !193, file: !1639, line: 67)
!1680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1681, file: !1639, line: 68)
!1681 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !194, line: 27, baseType: !1682)
!1682 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !196, line: 44, baseType: !829)
!1683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1684, file: !1639, line: 70)
!1684 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !215, line: 71, baseType: !276)
!1685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1686, file: !1639, line: 71)
!1686 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !215, line: 73, baseType: !829)
!1687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1688, file: !1639, line: 72)
!1688 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !215, line: 74, baseType: !829)
!1689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1690, file: !1639, line: 73)
!1690 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !215, line: 75, baseType: !829)
!1691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1692, file: !1639, line: 75)
!1692 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !215, line: 49, baseType: !1693)
!1693 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !196, line: 52, baseType: !1675)
!1694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1695, file: !1639, line: 76)
!1695 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !215, line: 50, baseType: !1696)
!1696 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !196, line: 54, baseType: !1678)
!1697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1698, file: !1639, line: 77)
!1698 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !215, line: 51, baseType: !1699)
!1699 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !196, line: 56, baseType: !195)
!1700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1701, file: !1639, line: 78)
!1701 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !215, line: 52, baseType: !1702)
!1702 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !196, line: 58, baseType: !1682)
!1703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1704, file: !1639, line: 80)
!1704 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !215, line: 102, baseType: !1705)
!1705 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !196, line: 72, baseType: !829)
!1706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1707, file: !1639, line: 81)
!1707 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !215, line: 90, baseType: !829)
!1708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1709, file: !1711, line: 53)
!1709 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1710, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1710 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "0595275e3f5b502d28f7cd61a0dff888")
!1711 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/clocale", directory: "")
!1712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1713, file: !1711, line: 54)
!1713 = !DISubprogram(name: "setlocale", scope: !1710, file: !1710, line: 122, type: !1714, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1714 = !DISubroutineType(types: !1715)
!1715 = !{!877, !179, !710}
!1716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1717, file: !1711, line: 55)
!1717 = !DISubprogram(name: "localeconv", scope: !1710, file: !1710, line: 125, type: !1718, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1718 = !DISubroutineType(types: !1719)
!1719 = !{!1720}
!1720 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1709, size: 64)
!1721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1722, file: !1724, line: 64)
!1722 = !DISubprogram(name: "isalnum", scope: !1723, file: !1723, line: 108, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1723 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "c67c809b09ef8ea9c273687bc20a7fd3")
!1724 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cctype", directory: "")
!1725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1726, file: !1724, line: 65)
!1726 = !DISubprogram(name: "isalpha", scope: !1723, file: !1723, line: 109, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1728, file: !1724, line: 66)
!1728 = !DISubprogram(name: "iscntrl", scope: !1723, file: !1723, line: 110, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1730, file: !1724, line: 67)
!1730 = !DISubprogram(name: "isdigit", scope: !1723, file: !1723, line: 111, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1732, file: !1724, line: 68)
!1732 = !DISubprogram(name: "isgraph", scope: !1723, file: !1723, line: 113, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1734, file: !1724, line: 69)
!1734 = !DISubprogram(name: "islower", scope: !1723, file: !1723, line: 112, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1736, file: !1724, line: 70)
!1736 = !DISubprogram(name: "isprint", scope: !1723, file: !1723, line: 114, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1738, file: !1724, line: 71)
!1738 = !DISubprogram(name: "ispunct", scope: !1723, file: !1723, line: 115, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1740, file: !1724, line: 72)
!1740 = !DISubprogram(name: "isspace", scope: !1723, file: !1723, line: 116, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1742, file: !1724, line: 73)
!1742 = !DISubprogram(name: "isupper", scope: !1723, file: !1723, line: 117, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1744, file: !1724, line: 74)
!1744 = !DISubprogram(name: "isxdigit", scope: !1723, file: !1723, line: 118, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1746, file: !1724, line: 75)
!1746 = !DISubprogram(name: "tolower", scope: !1723, file: !1723, line: 122, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1748, file: !1724, line: 76)
!1748 = !DISubprogram(name: "toupper", scope: !1723, file: !1723, line: 125, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1750, file: !1724, line: 87)
!1750 = !DISubprogram(name: "isblank", scope: !1723, file: !1723, line: 130, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1752, file: !1754, line: 98)
!1752 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1753, line: 7, baseType: !1338)
!1753 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1754 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdio", directory: "")
!1755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1756, file: !1754, line: 99)
!1756 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1757, line: 84, baseType: !1758)
!1757 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "75d393d9743f4e6c39653f794c599a10")
!1758 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1759, line: 14, baseType: !1760)
!1759 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1760 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1759, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1762, file: !1754, line: 101)
!1762 = !DISubprogram(name: "clearerr", scope: !1757, file: !1757, line: 763, type: !1763, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1763 = !DISubroutineType(types: !1764)
!1764 = !{null, !1765}
!1765 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1752, size: 64)
!1766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1767, file: !1754, line: 102)
!1767 = !DISubprogram(name: "fclose", scope: !1757, file: !1757, line: 213, type: !1768, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1768 = !DISubroutineType(types: !1769)
!1769 = !{!179, !1765}
!1770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1771, file: !1754, line: 103)
!1771 = !DISubprogram(name: "feof", scope: !1757, file: !1757, line: 765, type: !1768, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1773, file: !1754, line: 104)
!1773 = !DISubprogram(name: "ferror", scope: !1757, file: !1757, line: 767, type: !1768, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1775, file: !1754, line: 105)
!1775 = !DISubprogram(name: "fflush", scope: !1757, file: !1757, line: 218, type: !1768, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1777, file: !1754, line: 106)
!1777 = !DISubprogram(name: "fgetc", scope: !1757, file: !1757, line: 491, type: !1768, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1779, file: !1754, line: 107)
!1779 = !DISubprogram(name: "fgetpos", scope: !1757, file: !1757, line: 737, type: !1780, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1780 = !DISubroutineType(types: !1781)
!1781 = !{!179, !1782, !1783}
!1782 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1765)
!1783 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1784)
!1784 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1756, size: 64)
!1785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1786, file: !1754, line: 108)
!1786 = !DISubprogram(name: "fgets", scope: !1757, file: !1757, line: 570, type: !1787, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1787 = !DISubroutineType(types: !1788)
!1788 = !{!877, !944, !179, !1782}
!1789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1790, file: !1754, line: 109)
!1790 = !DISubprogram(name: "fopen", scope: !1757, file: !1757, line: 246, type: !1791, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1791 = !DISubroutineType(types: !1792)
!1792 = !{!1765, !901, !901}
!1793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1794, file: !1754, line: 110)
!1794 = !DISubprogram(name: "fprintf", scope: !1757, file: !1757, line: 326, type: !1795, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1795 = !DISubroutineType(types: !1796)
!1796 = !{!179, !1782, !901, null}
!1797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1798, file: !1754, line: 111)
!1798 = !DISubprogram(name: "fputc", scope: !1757, file: !1757, line: 527, type: !1799, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1799 = !DISubroutineType(types: !1800)
!1800 = !{!179, !179, !1765}
!1801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1802, file: !1754, line: 112)
!1802 = !DISubprogram(name: "fputs", scope: !1757, file: !1757, line: 632, type: !1803, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1803 = !DISubroutineType(types: !1804)
!1804 = !{!179, !901, !1782}
!1805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1806, file: !1754, line: 113)
!1806 = !DISubprogram(name: "fread", scope: !1757, file: !1757, line: 652, type: !1807, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1807 = !DISubroutineType(types: !1808)
!1808 = !{!827, !1809, !827, !827, !1782}
!1809 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !278)
!1810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1811, file: !1754, line: 114)
!1811 = !DISubprogram(name: "freopen", scope: !1757, file: !1757, line: 252, type: !1812, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1812 = !DISubroutineType(types: !1813)
!1813 = !{!1765, !901, !901, !1782}
!1814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1815, file: !1754, line: 115)
!1815 = !DISubprogram(name: "fscanf", scope: !1757, file: !1757, line: 391, type: !1795, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1817, file: !1754, line: 116)
!1817 = !DISubprogram(name: "fseek", scope: !1757, file: !1757, line: 690, type: !1818, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1818 = !DISubroutineType(types: !1819)
!1819 = !{!179, !1765, !210, !179}
!1820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1821, file: !1754, line: 117)
!1821 = !DISubprogram(name: "fsetpos", scope: !1757, file: !1757, line: 742, type: !1822, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1822 = !DISubroutineType(types: !1823)
!1823 = !{!179, !1765, !1824}
!1824 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1825, size: 64)
!1825 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1756)
!1826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1827, file: !1754, line: 118)
!1827 = !DISubprogram(name: "ftell", scope: !1757, file: !1757, line: 695, type: !1828, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1828 = !DISubroutineType(types: !1829)
!1829 = !{!210, !1765}
!1830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1831, file: !1754, line: 119)
!1831 = !DISubprogram(name: "fwrite", scope: !1757, file: !1757, line: 658, type: !1832, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1832 = !DISubroutineType(types: !1833)
!1833 = !{!827, !1834, !827, !827, !1782}
!1834 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !853)
!1835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1836, file: !1754, line: 120)
!1836 = !DISubprogram(name: "getc", scope: !1757, file: !1757, line: 492, type: !1768, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1838, file: !1754, line: 121)
!1838 = !DISubprogram(name: "getchar", scope: !1839, file: !1839, line: 47, type: !914, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1839 = !DIFile(filename: "/usr/include/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "81194b3c12a36527b791b06f928a2e25")
!1840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1841, file: !1754, line: 126)
!1841 = !DISubprogram(name: "perror", scope: !1757, file: !1757, line: 781, type: !1842, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1842 = !DISubroutineType(types: !1843)
!1843 = !{null, !710}
!1844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1845, file: !1754, line: 127)
!1845 = !DISubprogram(name: "printf", scope: !1757, file: !1757, line: 332, type: !1846, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1846 = !DISubroutineType(types: !1847)
!1847 = !{!179, !901, null}
!1848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1849, file: !1754, line: 128)
!1849 = !DISubprogram(name: "putc", scope: !1757, file: !1757, line: 528, type: !1799, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1851, file: !1754, line: 129)
!1851 = !DISubprogram(name: "putchar", scope: !1839, file: !1839, line: 82, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1853, file: !1754, line: 130)
!1853 = !DISubprogram(name: "puts", scope: !1757, file: !1757, line: 638, type: !842, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1855, file: !1754, line: 131)
!1855 = !DISubprogram(name: "remove", scope: !1757, file: !1757, line: 146, type: !842, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1857, file: !1754, line: 132)
!1857 = !DISubprogram(name: "rename", scope: !1757, file: !1757, line: 148, type: !1858, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1858 = !DISubroutineType(types: !1859)
!1859 = !{!179, !710, !710}
!1860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1861, file: !1754, line: 133)
!1861 = !DISubprogram(name: "rewind", scope: !1757, file: !1757, line: 700, type: !1763, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1863, file: !1754, line: 134)
!1863 = !DISubprogram(name: "scanf", scope: !1757, file: !1757, line: 397, type: !1846, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1865, file: !1754, line: 135)
!1865 = !DISubprogram(name: "setbuf", scope: !1757, file: !1757, line: 304, type: !1866, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1866 = !DISubroutineType(types: !1867)
!1867 = !{null, !1782, !944}
!1868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1869, file: !1754, line: 136)
!1869 = !DISubprogram(name: "setvbuf", scope: !1757, file: !1757, line: 308, type: !1870, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1870 = !DISubroutineType(types: !1871)
!1871 = !{!179, !1782, !944, !179, !827}
!1872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1873, file: !1754, line: 137)
!1873 = !DISubprogram(name: "sprintf", scope: !1757, file: !1757, line: 334, type: !1874, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1874 = !DISubroutineType(types: !1875)
!1875 = !{!179, !944, !901, null}
!1876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1877, file: !1754, line: 138)
!1877 = !DISubprogram(name: "sscanf", scope: !1757, file: !1757, line: 399, type: !1878, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1878 = !DISubroutineType(types: !1879)
!1879 = !{!179, !901, !901, null}
!1880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1881, file: !1754, line: 139)
!1881 = !DISubprogram(name: "tmpfile", scope: !1757, file: !1757, line: 173, type: !1882, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1882 = !DISubroutineType(types: !1883)
!1883 = !{!1765}
!1884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1885, file: !1754, line: 141)
!1885 = !DISubprogram(name: "tmpnam", scope: !1757, file: !1757, line: 187, type: !1886, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1886 = !DISubroutineType(types: !1887)
!1887 = !{!877, !877}
!1888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1889, file: !1754, line: 143)
!1889 = !DISubprogram(name: "ungetc", scope: !1757, file: !1757, line: 645, type: !1799, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1891, file: !1754, line: 144)
!1891 = !DISubprogram(name: "vfprintf", scope: !1757, file: !1757, line: 341, type: !1892, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1892 = !DISubroutineType(types: !1893)
!1893 = !{!179, !1782, !901, !1462}
!1894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1895, file: !1754, line: 145)
!1895 = !DISubprogram(name: "vprintf", scope: !1839, file: !1839, line: 39, type: !1896, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1896 = !DISubroutineType(types: !1897)
!1897 = !{!179, !901, !1462}
!1898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1899, file: !1754, line: 146)
!1899 = !DISubprogram(name: "vsprintf", scope: !1757, file: !1757, line: 349, type: !1900, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1900 = !DISubroutineType(types: !1901)
!1901 = !{!179, !944, !901, !1462}
!1902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !1903, file: !1754, line: 175)
!1903 = !DISubprogram(name: "snprintf", scope: !1757, file: !1757, line: 354, type: !1904, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1904 = !DISubroutineType(types: !1905)
!1905 = !{!179, !944, !827, !901, null}
!1906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !1907, file: !1754, line: 176)
!1907 = !DISubprogram(name: "vfscanf", scope: !1757, file: !1757, line: 434, type: !1892, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !1909, file: !1754, line: 177)
!1909 = !DISubprogram(name: "vscanf", scope: !1757, file: !1757, line: 442, type: !1896, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !1911, file: !1754, line: 178)
!1911 = !DISubprogram(name: "vsnprintf", scope: !1757, file: !1757, line: 358, type: !1912, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1912 = !DISubroutineType(types: !1913)
!1913 = !{!179, !944, !827, !901, !1462}
!1914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !83, entity: !1915, file: !1754, line: 179)
!1915 = !DISubprogram(name: "vsscanf", scope: !1757, file: !1757, line: 446, type: !1916, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1916 = !DISubroutineType(types: !1917)
!1917 = !{!179, !901, !901, !1462}
!1918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1903, file: !1754, line: 185)
!1919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1907, file: !1754, line: 186)
!1920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1909, file: !1754, line: 187)
!1921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1911, file: !1754, line: 188)
!1922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1915, file: !1754, line: 189)
!1923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1924, file: !1928, line: 82)
!1924 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1925, line: 48, baseType: !1926)
!1925 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "760693b7fbeea3d686e1f29058fc2257")
!1926 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1927, size: 64)
!1927 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1646)
!1928 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cwctype", directory: "")
!1929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1930, file: !1928, line: 83)
!1930 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1931, line: 38, baseType: !829)
!1931 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "45eef9c3aa1d99faffa3945ed9be039a")
!1932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1324, file: !1928, line: 84)
!1933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1934, file: !1928, line: 86)
!1934 = !DISubprogram(name: "iswalnum", scope: !1931, file: !1931, line: 95, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1936, file: !1928, line: 87)
!1936 = !DISubprogram(name: "iswalpha", scope: !1931, file: !1931, line: 101, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1938, file: !1928, line: 89)
!1938 = !DISubprogram(name: "iswblank", scope: !1931, file: !1931, line: 146, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1940, file: !1928, line: 91)
!1940 = !DISubprogram(name: "iswcntrl", scope: !1931, file: !1931, line: 104, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1942, file: !1928, line: 92)
!1942 = !DISubprogram(name: "iswctype", scope: !1931, file: !1931, line: 159, type: !1943, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1943 = !DISubroutineType(types: !1944)
!1944 = !{!179, !1324, !1930}
!1945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1946, file: !1928, line: 93)
!1946 = !DISubprogram(name: "iswdigit", scope: !1931, file: !1931, line: 108, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1948, file: !1928, line: 94)
!1948 = !DISubprogram(name: "iswgraph", scope: !1931, file: !1931, line: 112, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1950, file: !1928, line: 95)
!1950 = !DISubprogram(name: "iswlower", scope: !1931, file: !1931, line: 117, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1952, file: !1928, line: 96)
!1952 = !DISubprogram(name: "iswprint", scope: !1931, file: !1931, line: 120, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1954, file: !1928, line: 97)
!1954 = !DISubprogram(name: "iswpunct", scope: !1931, file: !1931, line: 125, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1956, file: !1928, line: 98)
!1956 = !DISubprogram(name: "iswspace", scope: !1931, file: !1931, line: 130, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1958, file: !1928, line: 99)
!1958 = !DISubprogram(name: "iswupper", scope: !1931, file: !1931, line: 135, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1960, file: !1928, line: 100)
!1960 = !DISubprogram(name: "iswxdigit", scope: !1931, file: !1931, line: 140, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1962, file: !1928, line: 101)
!1962 = !DISubprogram(name: "towctrans", scope: !1925, file: !1925, line: 55, type: !1963, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1963 = !DISubroutineType(types: !1964)
!1964 = !{!1324, !1324, !1924}
!1965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1966, file: !1928, line: 102)
!1966 = !DISubprogram(name: "towlower", scope: !1931, file: !1931, line: 166, type: !1967, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1967 = !DISubroutineType(types: !1968)
!1968 = !{!1324, !1324}
!1969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1970, file: !1928, line: 103)
!1970 = !DISubprogram(name: "towupper", scope: !1931, file: !1931, line: 169, type: !1967, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1972, file: !1928, line: 104)
!1972 = !DISubprogram(name: "wctrans", scope: !1925, file: !1925, line: 52, type: !1973, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1973 = !DISubroutineType(types: !1974)
!1974 = !{!1924, !710}
!1975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1976, file: !1928, line: 105)
!1976 = !DISubprogram(name: "wctype", scope: !1931, file: !1931, line: 155, type: !1977, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1977 = !DISubroutineType(types: !1978)
!1978 = !{!1930, !710}
!1979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1980, file: !1983, line: 60)
!1980 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1981, line: 7, baseType: !1982)
!1981 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1982 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !196, line: 154, baseType: !210)
!1983 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ctime", directory: "")
!1984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !279, file: !1983, line: 61)
!1985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1513, file: !1983, line: 62)
!1986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1987, file: !1983, line: 64)
!1987 = !DISubprogram(name: "clock", scope: !1988, file: !1988, line: 72, type: !1989, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1988 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b21b4c7d8bf3fafdb33a1c7ed8e024a")
!1989 = !DISubroutineType(types: !1990)
!1990 = !{!1980}
!1991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1992, file: !1983, line: 65)
!1992 = !DISubprogram(name: "difftime", scope: !1988, file: !1988, line: 78, type: !1993, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1993 = !DISubroutineType(types: !1994)
!1994 = !{!474, !279, !279}
!1995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1996, file: !1983, line: 66)
!1996 = !DISubprogram(name: "mktime", scope: !1988, file: !1988, line: 82, type: !1997, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1997 = !DISubroutineType(types: !1998)
!1998 = !{!279, !1999}
!1999 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1513, size: 64)
!2000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2001, file: !1983, line: 67)
!2001 = !DISubprogram(name: "time", scope: !1988, file: !1988, line: 75, type: !2002, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2002 = !DISubroutineType(types: !2003)
!2003 = !{!279, !2004}
!2004 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64)
!2005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2006, file: !1983, line: 68)
!2006 = !DISubprogram(name: "asctime", scope: !1988, file: !1988, line: 139, type: !2007, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2007 = !DISubroutineType(types: !2008)
!2008 = !{!877, !1511}
!2009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2010, file: !1983, line: 69)
!2010 = !DISubprogram(name: "ctime", scope: !1988, file: !1988, line: 142, type: !2011, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2011 = !DISubroutineType(types: !2012)
!2012 = !{!877, !2013}
!2013 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2014, size: 64)
!2014 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !279)
!2015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2016, file: !1983, line: 70)
!2016 = !DISubprogram(name: "gmtime", scope: !1988, file: !1988, line: 119, type: !2017, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2017 = !DISubroutineType(types: !2018)
!2018 = !{!1999, !2013}
!2019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2020, file: !1983, line: 71)
!2020 = !DISubprogram(name: "localtime", scope: !1988, file: !1988, line: 123, type: !2017, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2022, file: !1983, line: 72)
!2022 = !DISubprogram(name: "strftime", scope: !1988, file: !1988, line: 88, type: !2023, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2023 = !DISubroutineType(types: !2024)
!2024 = !{!827, !944, !827, !901, !1510}
!2025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2026, file: !1983, line: 79)
!2026 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !2027, line: 9, size: 128, flags: DIFlagTypePassByValue, elements: !2028, identifier: "_ZTS8timespec")
!2027 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "7074babe5447b53c4390dc147eee8679")
!2028 = !{!2029, !2030}
!2029 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !2026, file: !2027, line: 11, baseType: !281, size: 64)
!2030 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !2026, file: !2027, line: 12, baseType: !2031, size: 64, offset: 64)
!2031 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !196, line: 194, baseType: !210)
!2032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2033, file: !1983, line: 80)
!2033 = !DISubprogram(name: "timespec_get", scope: !1988, file: !1988, line: 263, type: !2034, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2034 = !DISubroutineType(types: !2035)
!2035 = !{!179, !2036, !179}
!2036 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2026, size: 64)
!2037 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !205, entity: !2038, file: !204, line: 1250)
!2038 = !DINamespace(name: "chrono_literals", scope: !2039, exportSymbols: true)
!2039 = !DINamespace(name: "literals", scope: !2, exportSymbols: true)
!2040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !81, file: !2041, line: 89)
!2041 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/shared_ptr_base.h", directory: "", checksumkind: CSK_MD5, checksum: "a9031cc66fad8948937b85efd4835986")
!2042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2043, file: !2041, line: 90)
!2043 = !DIGlobalVariable(name: "__default_lock_policy", linkageName: "_ZN9__gnu_cxxL21__default_lock_policyE", scope: !83, file: !82, line: 53, type: !2044, isLocal: true, isDefinition: false)
!2044 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !81)
!2045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2046, file: !2050, line: 77)
!2046 = !DISubprogram(name: "memchr", scope: !2047, file: !2047, line: 84, type: !2048, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2047 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "cc7eed1dc136352012a229a96542ae3d")
!2048 = !DISubroutineType(types: !2049)
!2049 = !{!853, !853, !179, !827}
!2050 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstring", directory: "")
!2051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2052, file: !2050, line: 78)
!2052 = !DISubprogram(name: "memcmp", scope: !2047, file: !2047, line: 64, type: !2053, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2053 = !DISubroutineType(types: !2054)
!2054 = !{!179, !853, !853, !827}
!2055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2056, file: !2050, line: 79)
!2056 = !DISubprogram(name: "memcpy", linkageName: "_ZL6memcpyPvPKvm", scope: !2057, file: !2057, line: 1084, type: !2058, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2057 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "59790372eacbad80338513022c6135db")
!2058 = !DISubroutineType(types: !2059)
!2059 = !{!278, !278, !853, !827}
!2060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2061, file: !2050, line: 80)
!2061 = !DISubprogram(name: "memmove", scope: !2047, file: !2047, line: 47, type: !2058, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2063, file: !2050, line: 81)
!2063 = !DISubprogram(name: "memset", linkageName: "_ZL6memsetPvim", scope: !2057, file: !2057, line: 1088, type: !2064, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2064 = !DISubroutineType(types: !2065)
!2065 = !{!278, !278, !179, !827}
!2066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2067, file: !2050, line: 82)
!2067 = !DISubprogram(name: "strcat", scope: !2047, file: !2047, line: 130, type: !2068, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2068 = !DISubroutineType(types: !2069)
!2069 = !{!877, !944, !901}
!2070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2071, file: !2050, line: 83)
!2071 = !DISubprogram(name: "strcmp", scope: !2047, file: !2047, line: 137, type: !1858, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2073, file: !2050, line: 84)
!2073 = !DISubprogram(name: "strcoll", scope: !2047, file: !2047, line: 144, type: !1858, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2075, file: !2050, line: 85)
!2075 = !DISubprogram(name: "strcpy", scope: !2047, file: !2047, line: 122, type: !2068, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2077, file: !2050, line: 86)
!2077 = !DISubprogram(name: "strcspn", scope: !2047, file: !2047, line: 273, type: !2078, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2078 = !DISubroutineType(types: !2079)
!2079 = !{!827, !710, !710}
!2080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2081, file: !2050, line: 87)
!2081 = !DISubprogram(name: "strerror", scope: !2047, file: !2047, line: 397, type: !2082, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2082 = !DISubroutineType(types: !2083)
!2083 = !{!877, !179}
!2084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2085, file: !2050, line: 88)
!2085 = !DISubprogram(name: "strlen", scope: !2047, file: !2047, line: 385, type: !2086, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2086 = !DISubroutineType(types: !2087)
!2087 = !{!827, !710}
!2088 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2089, file: !2050, line: 89)
!2089 = !DISubprogram(name: "strncat", scope: !2047, file: !2047, line: 133, type: !2090, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2090 = !DISubroutineType(types: !2091)
!2091 = !{!877, !944, !901, !827}
!2092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2093, file: !2050, line: 90)
!2093 = !DISubprogram(name: "strncmp", scope: !2047, file: !2047, line: 140, type: !2094, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2094 = !DISubroutineType(types: !2095)
!2095 = !{!179, !710, !710, !827}
!2096 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2097, file: !2050, line: 91)
!2097 = !DISubprogram(name: "strncpy", scope: !2047, file: !2047, line: 125, type: !2090, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2099, file: !2050, line: 92)
!2099 = !DISubprogram(name: "strspn", scope: !2047, file: !2047, line: 277, type: !2078, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2101, file: !2050, line: 93)
!2101 = !DISubprogram(name: "strtok", scope: !2047, file: !2047, line: 336, type: !2068, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2103, file: !2050, line: 94)
!2103 = !DISubprogram(name: "strxfrm", scope: !2047, file: !2047, line: 147, type: !2104, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2104 = !DISubroutineType(types: !2105)
!2105 = !{!827, !944, !901, !827}
!2106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2107, file: !2050, line: 95)
!2107 = !DISubprogram(name: "strchr", scope: !2047, file: !2047, line: 219, type: !2108, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2108 = !DISubroutineType(types: !2109)
!2109 = !{!710, !710, !179}
!2110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2111, file: !2050, line: 96)
!2111 = !DISubprogram(name: "strpbrk", scope: !2047, file: !2047, line: 296, type: !2112, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2112 = !DISubroutineType(types: !2113)
!2113 = !{!710, !710, !710}
!2114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2115, file: !2050, line: 97)
!2115 = !DISubprogram(name: "strrchr", scope: !2047, file: !2047, line: 246, type: !2108, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2117, file: !2050, line: 98)
!2117 = !DISubprogram(name: "strstr", scope: !2047, file: !2047, line: 323, type: !2112, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2118 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2119, entity: !2, file: !9, line: 162)
!2119 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 160, type: !914, scopeLine: 161, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !2120)
!2120 = !{!2121}
!2121 = !DILocalVariable(name: "devProp", scope: !2119, file: !9, line: 163, type: !2122)
!2122 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipDeviceProp_t", file: !90, line: 153, baseType: !2123)
!2123 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hipDeviceProp_t", file: !90, line: 87, size: 6336, flags: DIFlagTypePassByValue, elements: !2124, identifier: "_ZTS15hipDeviceProp_t")
!2124 = !{!2125, !2129, !2130, !2131, !2132, !2133, !2134, !2138, !2139, !2140, !2141, !2142, !2143, !2144, !2145, !2146, !2147, !2148, !2149, !2150, !2171, !2172, !2173, !2174, !2175, !2176, !2177, !2178, !2179, !2180, !2181, !2182, !2183, !2184, !2185, !2187, !2188, !2190, !2191, !2192, !2193, !2194, !2195, !2196, !2197, !2198, !2199, !2200, !2201, !2202, !2203, !2204, !2205, !2206, !2207}
!2125 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !2123, file: !90, line: 88, baseType: !2126, size: 2048)
!2126 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 2048, elements: !2127)
!2127 = !{!2128}
!2128 = !DISubrange(count: 256)
!2129 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !2123, file: !90, line: 89, baseType: !827, size: 64, offset: 2048)
!2130 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !2123, file: !90, line: 90, baseType: !827, size: 64, offset: 2112)
!2131 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !2123, file: !90, line: 91, baseType: !179, size: 32, offset: 2176)
!2132 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !2123, file: !90, line: 92, baseType: !179, size: 32, offset: 2208)
!2133 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !2123, file: !90, line: 93, baseType: !179, size: 32, offset: 2240)
!2134 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !2123, file: !90, line: 94, baseType: !2135, size: 96, offset: 2272)
!2135 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 96, elements: !2136)
!2136 = !{!2137}
!2137 = !DISubrange(count: 3)
!2138 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !2123, file: !90, line: 95, baseType: !2135, size: 96, offset: 2368)
!2139 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !2123, file: !90, line: 96, baseType: !179, size: 32, offset: 2464)
!2140 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !2123, file: !90, line: 97, baseType: !179, size: 32, offset: 2496)
!2141 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !2123, file: !90, line: 98, baseType: !179, size: 32, offset: 2528)
!2142 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !2123, file: !90, line: 99, baseType: !827, size: 64, offset: 2560)
!2143 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !2123, file: !90, line: 100, baseType: !179, size: 32, offset: 2624)
!2144 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !2123, file: !90, line: 103, baseType: !179, size: 32, offset: 2656)
!2145 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !2123, file: !90, line: 106, baseType: !179, size: 32, offset: 2688)
!2146 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !2123, file: !90, line: 107, baseType: !179, size: 32, offset: 2720)
!2147 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !2123, file: !90, line: 108, baseType: !179, size: 32, offset: 2752)
!2148 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !2123, file: !90, line: 109, baseType: !179, size: 32, offset: 2784)
!2149 = !DIDerivedType(tag: DW_TAG_member, name: "clockInstructionRate", scope: !2123, file: !90, line: 110, baseType: !179, size: 32, offset: 2816)
!2150 = !DIDerivedType(tag: DW_TAG_member, name: "arch", scope: !2123, file: !90, line: 112, baseType: !2151, size: 32, offset: 2848)
!2151 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipDeviceArch_t", file: !90, line: 74, baseType: !2152)
!2152 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !90, line: 45, size: 32, flags: DIFlagTypePassByValue, elements: !2153, identifier: "_ZTS15hipDeviceArch_t")
!2153 = !{!2154, !2155, !2156, !2157, !2158, !2159, !2160, !2161, !2162, !2163, !2164, !2165, !2166, !2167, !2168, !2169, !2170}
!2154 = !DIDerivedType(tag: DW_TAG_member, name: "hasGlobalInt32Atomics", scope: !2152, file: !90, line: 47, baseType: !84, size: 1, flags: DIFlagBitField, extraData: i64 0)
!2155 = !DIDerivedType(tag: DW_TAG_member, name: "hasGlobalFloatAtomicExch", scope: !2152, file: !90, line: 48, baseType: !84, size: 1, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!2156 = !DIDerivedType(tag: DW_TAG_member, name: "hasSharedInt32Atomics", scope: !2152, file: !90, line: 49, baseType: !84, size: 1, offset: 2, flags: DIFlagBitField, extraData: i64 0)
!2157 = !DIDerivedType(tag: DW_TAG_member, name: "hasSharedFloatAtomicExch", scope: !2152, file: !90, line: 50, baseType: !84, size: 1, offset: 3, flags: DIFlagBitField, extraData: i64 0)
!2158 = !DIDerivedType(tag: DW_TAG_member, name: "hasFloatAtomicAdd", scope: !2152, file: !90, line: 51, baseType: !84, size: 1, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!2159 = !DIDerivedType(tag: DW_TAG_member, name: "hasGlobalInt64Atomics", scope: !2152, file: !90, line: 54, baseType: !84, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!2160 = !DIDerivedType(tag: DW_TAG_member, name: "hasSharedInt64Atomics", scope: !2152, file: !90, line: 55, baseType: !84, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!2161 = !DIDerivedType(tag: DW_TAG_member, name: "hasDoubles", scope: !2152, file: !90, line: 58, baseType: !84, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!2162 = !DIDerivedType(tag: DW_TAG_member, name: "hasWarpVote", scope: !2152, file: !90, line: 61, baseType: !84, size: 1, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!2163 = !DIDerivedType(tag: DW_TAG_member, name: "hasWarpBallot", scope: !2152, file: !90, line: 62, baseType: !84, size: 1, offset: 9, flags: DIFlagBitField, extraData: i64 0)
!2164 = !DIDerivedType(tag: DW_TAG_member, name: "hasWarpShuffle", scope: !2152, file: !90, line: 63, baseType: !84, size: 1, offset: 10, flags: DIFlagBitField, extraData: i64 0)
!2165 = !DIDerivedType(tag: DW_TAG_member, name: "hasFunnelShift", scope: !2152, file: !90, line: 64, baseType: !84, size: 1, offset: 11, flags: DIFlagBitField, extraData: i64 0)
!2166 = !DIDerivedType(tag: DW_TAG_member, name: "hasThreadFenceSystem", scope: !2152, file: !90, line: 67, baseType: !84, size: 1, offset: 12, flags: DIFlagBitField, extraData: i64 0)
!2167 = !DIDerivedType(tag: DW_TAG_member, name: "hasSyncThreadsExt", scope: !2152, file: !90, line: 68, baseType: !84, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 0)
!2168 = !DIDerivedType(tag: DW_TAG_member, name: "hasSurfaceFuncs", scope: !2152, file: !90, line: 71, baseType: !84, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 0)
!2169 = !DIDerivedType(tag: DW_TAG_member, name: "has3dGrid", scope: !2152, file: !90, line: 72, baseType: !84, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 0)
!2170 = !DIDerivedType(tag: DW_TAG_member, name: "hasDynamicParallelism", scope: !2152, file: !90, line: 73, baseType: !84, size: 1, offset: 16, flags: DIFlagBitField, extraData: i64 0)
!2171 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !2123, file: !90, line: 113, baseType: !179, size: 32, offset: 2880)
!2172 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !2123, file: !90, line: 114, baseType: !179, size: 32, offset: 2912)
!2173 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !2123, file: !90, line: 115, baseType: !179, size: 32, offset: 2944)
!2174 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !2123, file: !90, line: 116, baseType: !179, size: 32, offset: 2976)
!2175 = !DIDerivedType(tag: DW_TAG_member, name: "maxSharedMemoryPerMultiProcessor", scope: !2123, file: !90, line: 117, baseType: !827, size: 64, offset: 3008)
!2176 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !2123, file: !90, line: 118, baseType: !179, size: 32, offset: 3072)
!2177 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !2123, file: !90, line: 119, baseType: !179, size: 32, offset: 3104)
!2178 = !DIDerivedType(tag: DW_TAG_member, name: "gcnArch", scope: !2123, file: !90, line: 120, baseType: !179, size: 32, offset: 3136)
!2179 = !DIDerivedType(tag: DW_TAG_member, name: "gcnArchName", scope: !2123, file: !90, line: 121, baseType: !2126, size: 2048, offset: 3168)
!2180 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !2123, file: !90, line: 122, baseType: !179, size: 32, offset: 5216)
!2181 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeLaunch", scope: !2123, file: !90, line: 123, baseType: !179, size: 32, offset: 5248)
!2182 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceLaunch", scope: !2123, file: !90, line: 124, baseType: !179, size: 32, offset: 5280)
!2183 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !2123, file: !90, line: 125, baseType: !179, size: 32, offset: 5312)
!2184 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !2123, file: !90, line: 126, baseType: !179, size: 32, offset: 5344)
!2185 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !2123, file: !90, line: 127, baseType: !2186, size: 64, offset: 5376)
!2186 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 64, elements: !33)
!2187 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !2123, file: !90, line: 128, baseType: !2135, size: 96, offset: 5440)
!2188 = !DIDerivedType(tag: DW_TAG_member, name: "hdpMemFlushCntl", scope: !2123, file: !90, line: 129, baseType: !2189, size: 64, offset: 5568)
!2189 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!2190 = !DIDerivedType(tag: DW_TAG_member, name: "hdpRegFlushCntl", scope: !2123, file: !90, line: 130, baseType: !2189, size: 64, offset: 5632)
!2191 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !2123, file: !90, line: 131, baseType: !827, size: 64, offset: 5696)
!2192 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !2123, file: !90, line: 132, baseType: !827, size: 64, offset: 5760)
!2193 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !2123, file: !90, line: 133, baseType: !827, size: 64, offset: 5824)
!2194 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !2123, file: !90, line: 134, baseType: !179, size: 32, offset: 5888)
!2195 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !2123, file: !90, line: 135, baseType: !179, size: 32, offset: 5920)
!2196 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !2123, file: !90, line: 136, baseType: !179, size: 32, offset: 5952)
!2197 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedFunc", scope: !2123, file: !90, line: 137, baseType: !179, size: 32, offset: 5984)
!2198 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedGridDim", scope: !2123, file: !90, line: 139, baseType: !179, size: 32, offset: 6016)
!2199 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedBlockDim", scope: !2123, file: !90, line: 141, baseType: !179, size: 32, offset: 6048)
!2200 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedSharedMem", scope: !2123, file: !90, line: 143, baseType: !179, size: 32, offset: 6080)
!2201 = !DIDerivedType(tag: DW_TAG_member, name: "isLargeBar", scope: !2123, file: !90, line: 145, baseType: !179, size: 32, offset: 6112)
!2202 = !DIDerivedType(tag: DW_TAG_member, name: "asicRevision", scope: !2123, file: !90, line: 146, baseType: !179, size: 32, offset: 6144)
!2203 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !2123, file: !90, line: 147, baseType: !179, size: 32, offset: 6176)
!2204 = !DIDerivedType(tag: DW_TAG_member, name: "directManagedMemAccessFromHost", scope: !2123, file: !90, line: 148, baseType: !179, size: 32, offset: 6208)
!2205 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentManagedAccess", scope: !2123, file: !90, line: 149, baseType: !179, size: 32, offset: 6240)
!2206 = !DIDerivedType(tag: DW_TAG_member, name: "pageableMemoryAccess", scope: !2123, file: !90, line: 150, baseType: !179, size: 32, offset: 6272)
!2207 = !DIDerivedType(tag: DW_TAG_member, name: "pageableMemoryAccessUsesHostPageTables", scope: !2123, file: !90, line: 152, baseType: !179, size: 32, offset: 6304)
!2208 = !{i32 7, !"Dwarf Version", i32 5}
!2209 = !{i32 2, !"Debug Info Version", i32 3}
!2210 = !{i32 1, !"wchar_size", i32 4}
!2211 = !{i32 7, !"uwtable", i32 2}
!2212 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}
!2213 = !{!2214, !2214, i64 0}
!2214 = !{!"any pointer", !2215, i64 0}
!2215 = !{!"omnipotent char", !2216, i64 0}
!2216 = !{!"Simple C++ TBAA"}
!2217 = distinct !DISubprogram(name: "tick_all_test", linkageName: "_Z13tick_all_testv", scope: !9, file: !9, line: 66, type: !821, scopeLine: 67, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !2218)
!2218 = !{!2219, !2220, !2222, !2223, !2225, !2226, !2229, !2231, !2232, !2234, !2235, !2237}
!2219 = !DILocalVariable(name: "device", scope: !2217, file: !9, line: 68, type: !179)
!2220 = !DILocalVariable(name: "SIZE", scope: !2217, file: !9, line: 72, type: !2221)
!2221 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !193)
!2222 = !DILocalVariable(name: "spin_limit", scope: !2217, file: !9, line: 73, type: !1648)
!2223 = !DILocalVariable(name: "DISPLAY_LIMIT", scope: !2217, file: !9, line: 74, type: !2224)
!2224 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !827)
!2225 = !DILocalVariable(name: "DISPLAY_LINE_LIMIT", scope: !2217, file: !9, line: 75, type: !2224)
!2226 = !DILocalVariable(name: "clk", scope: !2217, file: !9, line: 79, type: !2227)
!2227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2228, size: 64)
!2228 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !1681)
!2229 = !DILocalVariable(name: "h_vals", scope: !2217, file: !9, line: 85, type: !2230)
!2230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1681, size: 64)
!2231 = !DILocalVariable(name: "d_vals", scope: !2217, file: !9, line: 87, type: !2230)
!2232 = !DILocalVariable(name: "dummy_data", scope: !2217, file: !9, line: 92, type: !2233)
!2233 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1648, size: 64)
!2234 = !DILocalVariable(name: "h_dummy_data", scope: !2217, file: !9, line: 98, type: !2233)
!2235 = !DILocalVariable(name: "i", scope: !2236, file: !9, line: 102, type: !827)
!2236 = distinct !DILexicalBlock(scope: !2217, file: !9, line: 102, column: 3)
!2237 = !DILocalVariable(name: "i", scope: !2238, file: !9, line: 137, type: !827)
!2238 = distinct !DILexicalBlock(scope: !2217, file: !9, line: 137, column: 3)
!2239 = !DILocation(line: 68, column: 3, scope: !2217)
!2240 = !DILocation(line: 0, scope: !2217)
!2241 = !DILocation(line: 68, column: 7, scope: !2217)
!2242 = !{!2243, !2243, i64 0}
!2243 = !{!"int", !2215, i64 0}
!2244 = !DILocation(line: 69, column: 17, scope: !2217)
!2245 = !DILocalVariable(name: "resCode", arg: 1, scope: !2246, file: !9, line: 174, type: !2249)
!2246 = distinct !DISubprogram(name: "__HIP_CHECK__", linkageName: "_Z13__HIP_CHECK__10hipError_t", scope: !9, file: !9, line: 174, type: !2247, scopeLine: 174, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !2250)
!2247 = !DISubroutineType(types: !2248)
!2248 = !{null, !2249}
!2249 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipError_t", file: !90, line: 320, baseType: !89)
!2250 = !{!2245}
!2251 = !DILocation(line: 0, scope: !2246, inlinedAt: !2252)
!2252 = distinct !DILocation(line: 69, column: 3, scope: !2217)
!2253 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !2252)
!2254 = distinct !DILexicalBlock(scope: !2246, file: !9, line: 175, column: 7)
!2255 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !2252)
!2256 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !2252)
!2257 = distinct !DILexicalBlock(scope: !2254, file: !9, line: 175, column: 30)
!2258 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !2252)
!2259 = !DILocalVariable(name: "this", arg: 1, scope: !2260, type: !2275, flags: DIFlagArtificial | DIFlagObjectPointer)
!2260 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !2262, file: !2261, line: 108, type: !2264, scopeLine: 109, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2272, retainedNodes: !2273)
!2261 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ostream", directory: "")
!2262 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ostream<char, std::char_traits<char> >", scope: !2, file: !2263, line: 359, size: 2176, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!2263 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/ostream.tcc", directory: "")
!2264 = !DISubroutineType(types: !2265)
!2265 = !{!2266, !2268, !2269}
!2266 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2267, size: 64)
!2267 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ostream_type", scope: !2262, file: !2261, line: 71, baseType: !2262)
!2268 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2262, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2270, size: 64)
!2270 = !DISubroutineType(types: !2271)
!2271 = !{!2266, !2266}
!2272 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !2262, file: !2261, line: 108, type: !2264, scopeLine: 108, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2273 = !{!2259, !2274}
!2274 = !DILocalVariable(name: "__pf", arg: 2, scope: !2260, file: !2261, line: 108, type: !2269)
!2275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2262, size: 64)
!2276 = !DILocation(line: 0, scope: !2260, inlinedAt: !2277)
!2277 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !2252)
!2278 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2277)
!2279 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !2252)
!2280 = !DILocalVariable(name: "__out", arg: 1, scope: !2281, file: !2261, line: 606, type: !2284)
!2281 = distinct !DISubprogram(name: "operator<<<std::char_traits<char> >", linkageName: "_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc", scope: !2, file: !2261, line: 606, type: !2282, scopeLine: 607, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2287, retainedNodes: !2285)
!2282 = !DISubroutineType(types: !2283)
!2283 = !{!2284, !2284, !710}
!2284 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2262, size: 64)
!2285 = !{!2280, !2286}
!2286 = !DILocalVariable(name: "__s", arg: 2, scope: !2281, file: !2261, line: 606, type: !710)
!2287 = !{!2288}
!2288 = !DITemplateTypeParameter(name: "_Traits", type: !2289)
!2289 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !2, file: !2290, line: 316, size: 8, flags: DIFlagTypePassByValue, elements: !2291, templateParams: !2340, identifier: "_ZTSSt11char_traitsIcE")
!2290 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/char_traits.h", directory: "")
!2291 = !{!2292, !2299, !2302, !2303, !2308, !2311, !2314, !2318, !2319, !2322, !2328, !2331, !2334, !2337}
!2292 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignERcRKc", scope: !2289, file: !2290, line: 328, type: !2293, scopeLine: 328, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2293 = !DISubroutineType(types: !2294)
!2294 = !{null, !2295, !2297}
!2295 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2296, size: 64)
!2296 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2289, file: !2290, line: 318, baseType: !12)
!2297 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2298, size: 64)
!2298 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2296)
!2299 = !DISubprogram(name: "eq", linkageName: "_ZNSt11char_traitsIcE2eqERKcS2_", scope: !2289, file: !2290, line: 332, type: !2300, scopeLine: 332, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2300 = !DISubroutineType(types: !2301)
!2301 = !{!286, !2297, !2297}
!2302 = !DISubprogram(name: "lt", linkageName: "_ZNSt11char_traitsIcE2ltERKcS2_", scope: !2289, file: !2290, line: 336, type: !2300, scopeLine: 336, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2303 = !DISubprogram(name: "compare", linkageName: "_ZNSt11char_traitsIcE7compareEPKcS2_m", scope: !2289, file: !2290, line: 344, type: !2304, scopeLine: 344, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2304 = !DISubroutineType(types: !2305)
!2305 = !{!179, !2306, !2306, !2307}
!2306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2298, size: 64)
!2307 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !2, file: !275, line: 2306, baseType: !829)
!2308 = !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !2289, file: !2290, line: 365, type: !2309, scopeLine: 365, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2309 = !DISubroutineType(types: !2310)
!2310 = !{!2307, !2306}
!2311 = !DISubprogram(name: "find", linkageName: "_ZNSt11char_traitsIcE4findEPKcmRS1_", scope: !2289, file: !2290, line: 375, type: !2312, scopeLine: 375, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2312 = !DISubroutineType(types: !2313)
!2313 = !{!2306, !2306, !2307, !2297}
!2314 = !DISubprogram(name: "move", linkageName: "_ZNSt11char_traitsIcE4moveEPcPKcm", scope: !2289, file: !2290, line: 389, type: !2315, scopeLine: 389, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2315 = !DISubroutineType(types: !2316)
!2316 = !{!2317, !2317, !2306, !2307}
!2317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2296, size: 64)
!2318 = !DISubprogram(name: "copy", linkageName: "_ZNSt11char_traitsIcE4copyEPcPKcm", scope: !2289, file: !2290, line: 401, type: !2315, scopeLine: 401, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2319 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignEPcmc", scope: !2289, file: !2290, line: 413, type: !2320, scopeLine: 413, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2320 = !DISubroutineType(types: !2321)
!2321 = !{!2317, !2317, !2307, !2296}
!2322 = !DISubprogram(name: "to_char_type", linkageName: "_ZNSt11char_traitsIcE12to_char_typeERKi", scope: !2289, file: !2290, line: 425, type: !2323, scopeLine: 425, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2323 = !DISubroutineType(types: !2324)
!2324 = !{!2296, !2325}
!2325 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2326, size: 64)
!2326 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2327)
!2327 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !2289, file: !2290, line: 319, baseType: !179)
!2328 = !DISubprogram(name: "to_int_type", linkageName: "_ZNSt11char_traitsIcE11to_int_typeERKc", scope: !2289, file: !2290, line: 431, type: !2329, scopeLine: 431, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2329 = !DISubroutineType(types: !2330)
!2330 = !{!2327, !2297}
!2331 = !DISubprogram(name: "eq_int_type", linkageName: "_ZNSt11char_traitsIcE11eq_int_typeERKiS2_", scope: !2289, file: !2290, line: 435, type: !2332, scopeLine: 435, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2332 = !DISubroutineType(types: !2333)
!2333 = !{!286, !2325, !2325}
!2334 = !DISubprogram(name: "eof", linkageName: "_ZNSt11char_traitsIcE3eofEv", scope: !2289, file: !2290, line: 439, type: !2335, scopeLine: 439, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2335 = !DISubroutineType(types: !2336)
!2336 = !{!2327}
!2337 = !DISubprogram(name: "not_eof", linkageName: "_ZNSt11char_traitsIcE7not_eofERKi", scope: !2289, file: !2290, line: 443, type: !2338, scopeLine: 443, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2338 = !DISubroutineType(types: !2339)
!2339 = !{!2327, !2325}
!2340 = !{!2341}
!2341 = !DITemplateTypeParameter(name: "_CharT", type: !12)
!2342 = !DILocation(line: 0, scope: !2281, inlinedAt: !2343)
!2343 = distinct !DILocation(line: 70, column: 13, scope: !2217)
!2344 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2343)
!2345 = distinct !DILexicalBlock(scope: !2281, file: !2261, line: 608, column: 11)
!2346 = !DILocation(line: 0, scope: !2260, inlinedAt: !2347)
!2347 = distinct !DILocation(line: 70, column: 58, scope: !2217)
!2348 = !DILocalVariable(name: "__os", arg: 1, scope: !2349, file: !2261, line: 703, type: !2284)
!2349 = distinct !DISubprogram(name: "flush<char, std::char_traits<char> >", linkageName: "_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !2, file: !2261, line: 703, type: !2350, scopeLine: 704, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2353, retainedNodes: !2352)
!2350 = !DISubroutineType(types: !2351)
!2351 = !{!2284, !2284}
!2352 = !{!2348}
!2353 = !{!2341, !2288}
!2354 = !DILocation(line: 0, scope: !2349, inlinedAt: !2355)
!2355 = distinct !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2347)
!2356 = !DILocation(line: 704, column: 19, scope: !2349, inlinedAt: !2355)
!2357 = !DILocation(line: 0, scope: !2281, inlinedAt: !2358)
!2358 = distinct !DILocation(line: 71, column: 13, scope: !2217)
!2359 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2358)
!2360 = !DILocation(line: 71, column: 48, scope: !2217)
!2361 = !DILocation(line: 71, column: 45, scope: !2217)
!2362 = !DILocation(line: 0, scope: !2260, inlinedAt: !2363)
!2363 = distinct !DILocation(line: 71, column: 55, scope: !2217)
!2364 = !DILocalVariable(name: "__os", arg: 1, scope: !2365, file: !2261, line: 681, type: !2284)
!2365 = distinct !DISubprogram(name: "endl<char, std::char_traits<char> >", linkageName: "_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !2, file: !2261, line: 681, type: !2350, scopeLine: 682, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2353, retainedNodes: !2366)
!2366 = !{!2364}
!2367 = !DILocation(line: 0, scope: !2365, inlinedAt: !2368)
!2368 = distinct !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2363)
!2369 = !DILocation(line: 682, column: 29, scope: !2365, inlinedAt: !2368)
!2370 = !{!2371, !2371, i64 0}
!2371 = !{!"vtable pointer", !2216, i64 0}
!2372 = !DILocalVariable(name: "this", arg: 1, scope: !2373, type: !2385, flags: DIFlagArtificial | DIFlagObjectPointer)
!2373 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !2375, file: !2374, line: 449, type: !2377, scopeLine: 450, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2382, retainedNodes: !2383)
!2374 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/basic_ios.h", directory: "")
!2375 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ios<char, std::char_traits<char> >", scope: !2, file: !2376, line: 178, size: 2112, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!2376 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/basic_ios.tcc", directory: "")
!2377 = !DISubroutineType(types: !2378)
!2378 = !{!2379, !2380, !12}
!2379 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2375, file: !2374, line: 76, baseType: !12)
!2380 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2381, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2381 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2375)
!2382 = !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !2375, file: !2374, line: 449, type: !2377, scopeLine: 449, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2383 = !{!2372, !2384}
!2384 = !DILocalVariable(name: "__c", arg: 2, scope: !2373, file: !2374, line: 449, type: !12)
!2385 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2381, size: 64)
!2386 = !DILocation(line: 0, scope: !2373, inlinedAt: !2387)
!2387 = distinct !DILocation(line: 682, column: 34, scope: !2365, inlinedAt: !2368)
!2388 = !DILocation(line: 450, column: 30, scope: !2373, inlinedAt: !2387)
!2389 = !{!2390, !2214, i64 240}
!2390 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !2391, i64 0, !2214, i64 216, !2215, i64 224, !2397, i64 225, !2214, i64 232, !2214, i64 240, !2214, i64 248, !2214, i64 256}
!2391 = !{!"_ZTSSt8ios_base", !2392, i64 8, !2392, i64 16, !2393, i64 24, !2394, i64 28, !2394, i64 32, !2214, i64 40, !2395, i64 48, !2215, i64 64, !2243, i64 192, !2214, i64 200, !2396, i64 208}
!2392 = !{!"long", !2215, i64 0}
!2393 = !{!"_ZTSSt13_Ios_Fmtflags", !2215, i64 0}
!2394 = !{!"_ZTSSt12_Ios_Iostate", !2215, i64 0}
!2395 = !{!"_ZTSNSt8ios_base6_WordsE", !2214, i64 0, !2392, i64 8}
!2396 = !{!"_ZTSSt6locale", !2214, i64 0}
!2397 = !{!"bool", !2215, i64 0}
!2398 = !DILocalVariable(name: "__f", arg: 1, scope: !2399, file: !2374, line: 47, type: !2406)
!2399 = distinct !DISubprogram(name: "__check_facet<std::ctype<char> >", linkageName: "_ZSt13__check_facetISt5ctypeIcEERKT_PS3_", scope: !2, file: !2374, line: 47, type: !2400, scopeLine: 48, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2408, retainedNodes: !2407)
!2400 = !DISubroutineType(types: !2401)
!2401 = !{!2402, !2406}
!2402 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2403, size: 64)
!2403 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2404)
!2404 = !DICompositeType(tag: DW_TAG_class_type, name: "ctype<char>", scope: !2, file: !2405, line: 681, size: 4608, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt5ctypeIcE")
!2405 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/locale_facets.h", directory: "")
!2406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2403, size: 64)
!2407 = !{!2398}
!2408 = !{!2409}
!2409 = !DITemplateTypeParameter(name: "_Facet", type: !2404)
!2410 = !DILocation(line: 0, scope: !2399, inlinedAt: !2411)
!2411 = distinct !DILocation(line: 450, column: 16, scope: !2373, inlinedAt: !2387)
!2412 = !DILocation(line: 49, column: 12, scope: !2413, inlinedAt: !2411)
!2413 = distinct !DILexicalBlock(scope: !2399, file: !2374, line: 49, column: 11)
!2414 = !DILocation(line: 49, column: 11, scope: !2399, inlinedAt: !2411)
!2415 = !DILocation(line: 50, column: 2, scope: !2413, inlinedAt: !2411)
!2416 = !DILocalVariable(name: "this", arg: 1, scope: !2417, type: !2406, flags: DIFlagArtificial | DIFlagObjectPointer)
!2417 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !2404, file: !2405, line: 872, type: !2418, scopeLine: 873, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2422, retainedNodes: !2423)
!2418 = !DISubroutineType(types: !2419)
!2419 = !{!2420, !2421, !12}
!2420 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2404, file: !2405, line: 686, baseType: !12)
!2421 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2403, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2422 = !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !2404, file: !2405, line: 872, type: !2418, scopeLine: 872, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2423 = !{!2416, !2424}
!2424 = !DILocalVariable(name: "__c", arg: 2, scope: !2417, file: !2405, line: 872, type: !12)
!2425 = !DILocation(line: 0, scope: !2417, inlinedAt: !2426)
!2426 = distinct !DILocation(line: 450, column: 40, scope: !2373, inlinedAt: !2387)
!2427 = !DILocation(line: 874, column: 6, scope: !2428, inlinedAt: !2426)
!2428 = distinct !DILexicalBlock(scope: !2417, file: !2405, line: 874, column: 6)
!2429 = !{!2430, !2215, i64 56}
!2430 = !{!"_ZTSSt5ctypeIcE", !2431, i64 0, !2214, i64 16, !2397, i64 24, !2214, i64 32, !2214, i64 40, !2214, i64 48, !2215, i64 56, !2215, i64 57, !2215, i64 313, !2215, i64 569}
!2431 = !{!"_ZTSNSt6locale5facetE", !2243, i64 8}
!2432 = !DILocation(line: 874, column: 6, scope: !2417, inlinedAt: !2426)
!2433 = !DILocation(line: 875, column: 11, scope: !2428, inlinedAt: !2426)
!2434 = !{!2215, !2215, i64 0}
!2435 = !DILocation(line: 875, column: 4, scope: !2428, inlinedAt: !2426)
!2436 = !DILocation(line: 876, column: 8, scope: !2417, inlinedAt: !2426)
!2437 = !DILocation(line: 877, column: 15, scope: !2417, inlinedAt: !2426)
!2438 = !DILocation(line: 877, column: 2, scope: !2417, inlinedAt: !2426)
!2439 = !DILocation(line: 682, column: 25, scope: !2365, inlinedAt: !2368)
!2440 = !DILocation(line: 0, scope: !2349, inlinedAt: !2441)
!2441 = distinct !DILocation(line: 682, column: 14, scope: !2365, inlinedAt: !2368)
!2442 = !DILocation(line: 704, column: 19, scope: !2349, inlinedAt: !2441)
!2443 = !DILocation(line: 79, column: 3, scope: !2217)
!2444 = !DILocalVariable(name: "devPtr", arg: 1, scope: !2445, file: !90, line: 6957, type: !2448)
!2445 = distinct !DISubprogram(name: "hipMallocManaged<_Atomic(unsigned long)>", linkageName: "_ZL16hipMallocManagedIU7_AtomicmE10hipError_tPPT_mj", scope: !90, file: !90, line: 6957, type: !2446, scopeLine: 6958, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2454, retainedNodes: !2451)
!2446 = !DISubroutineType(cc: DW_CC_nocall, types: !2447)
!2447 = !{!2249, !2448, !827, !84}
!2448 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2449, size: 64)
!2449 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2450, size: 64)
!2450 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !829)
!2451 = !{!2444, !2452, !2453}
!2452 = !DILocalVariable(name: "size", arg: 2, scope: !2445, file: !90, line: 6957, type: !827)
!2453 = !DILocalVariable(name: "flags", arg: 3, scope: !2445, file: !90, line: 6958, type: !84)
!2454 = !{!2455}
!2455 = !DITemplateTypeParameter(name: "T", type: !2450)
!2456 = !DILocation(line: 0, scope: !2445, inlinedAt: !2457)
!2457 = distinct !DILocation(line: 80, column: 17, scope: !2217)
!2458 = !DILocation(line: 6959, column: 29, scope: !2445, inlinedAt: !2457)
!2459 = !DILocation(line: 6959, column: 12, scope: !2445, inlinedAt: !2457)
!2460 = !DILocation(line: 0, scope: !2246, inlinedAt: !2461)
!2461 = distinct !DILocation(line: 80, column: 3, scope: !2217)
!2462 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !2461)
!2463 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !2461)
!2464 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !2461)
!2465 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !2461)
!2466 = !DILocation(line: 0, scope: !2260, inlinedAt: !2467)
!2467 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !2461)
!2468 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2467)
!2469 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !2461)
!2470 = !DILocation(line: 82, column: 4, scope: !2217)
!2471 = !DILocation(line: 82, column: 8, scope: !2217)
!2472 = !DILocation(line: 85, column: 22, scope: !2217)
!2473 = !DILocation(line: 86, column: 3, scope: !2217)
!2474 = !DILocation(line: 87, column: 3, scope: !2217)
!2475 = !DILocalVariable(name: "devPtr", arg: 1, scope: !2476, file: !90, line: 6944, type: !2479)
!2476 = distinct !DISubprogram(name: "hipMalloc<unsigned long>", linkageName: "_ZL9hipMallocImE10hipError_tPPT_m", scope: !90, file: !90, line: 6944, type: !2477, scopeLine: 6944, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2483, retainedNodes: !2481)
!2477 = !DISubroutineType(cc: DW_CC_nocall, types: !2478)
!2478 = !{!2249, !2479, !827}
!2479 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2480, size: 64)
!2480 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !829, size: 64)
!2481 = !{!2475, !2482}
!2482 = !DILocalVariable(name: "size", arg: 2, scope: !2476, file: !90, line: 6944, type: !827)
!2483 = !{!2484}
!2484 = !DITemplateTypeParameter(name: "T", type: !829)
!2485 = !DILocation(line: 0, scope: !2476, inlinedAt: !2486)
!2486 = distinct !DILocation(line: 88, column: 17, scope: !2217)
!2487 = !DILocation(line: 6945, column: 22, scope: !2476, inlinedAt: !2486)
!2488 = !DILocation(line: 6945, column: 12, scope: !2476, inlinedAt: !2486)
!2489 = !DILocation(line: 0, scope: !2246, inlinedAt: !2490)
!2490 = distinct !DILocation(line: 88, column: 3, scope: !2217)
!2491 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !2490)
!2492 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !2490)
!2493 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !2490)
!2494 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !2490)
!2495 = !DILocation(line: 0, scope: !2260, inlinedAt: !2496)
!2496 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !2490)
!2497 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2496)
!2498 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !2490)
!2499 = !DILocation(line: 89, column: 27, scope: !2217)
!2500 = !DILocation(line: 89, column: 17, scope: !2217)
!2501 = !DILocation(line: 0, scope: !2246, inlinedAt: !2502)
!2502 = distinct !DILocation(line: 89, column: 3, scope: !2217)
!2503 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !2502)
!2504 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !2502)
!2505 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !2502)
!2506 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !2502)
!2507 = !DILocation(line: 0, scope: !2260, inlinedAt: !2508)
!2508 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !2502)
!2509 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2508)
!2510 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !2502)
!2511 = !DILocation(line: 92, column: 3, scope: !2217)
!2512 = !DILocalVariable(name: "devPtr", arg: 1, scope: !2513, file: !90, line: 6944, type: !2516)
!2513 = distinct !DISubprogram(name: "hipMalloc<long>", linkageName: "_ZL9hipMallocIlE10hipError_tPPT_m", scope: !90, file: !90, line: 6944, type: !2514, scopeLine: 6944, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2520, retainedNodes: !2518)
!2514 = !DISubroutineType(cc: DW_CC_nocall, types: !2515)
!2515 = !{!2249, !2516, !827}
!2516 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2517, size: 64)
!2517 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !210, size: 64)
!2518 = !{!2512, !2519}
!2519 = !DILocalVariable(name: "size", arg: 2, scope: !2513, file: !90, line: 6944, type: !827)
!2520 = !{!2521}
!2521 = !DITemplateTypeParameter(name: "T", type: !210)
!2522 = !DILocation(line: 0, scope: !2513, inlinedAt: !2523)
!2523 = distinct !DILocation(line: 93, column: 17, scope: !2217)
!2524 = !DILocation(line: 6945, column: 22, scope: !2513, inlinedAt: !2523)
!2525 = !DILocation(line: 6945, column: 12, scope: !2513, inlinedAt: !2523)
!2526 = !DILocation(line: 0, scope: !2246, inlinedAt: !2527)
!2527 = distinct !DILocation(line: 93, column: 3, scope: !2217)
!2528 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !2527)
!2529 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !2527)
!2530 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !2527)
!2531 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !2527)
!2532 = !DILocation(line: 0, scope: !2260, inlinedAt: !2533)
!2533 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !2527)
!2534 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2533)
!2535 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !2527)
!2536 = !DILocation(line: 95, column: 2, scope: !2537)
!2537 = distinct !DILexicalBlock(scope: !2217, file: !9, line: 95, column: 2)
!2538 = !DILocation(line: 98, column: 27, scope: !2217)
!2539 = !DILocation(line: 99, column: 3, scope: !2217)
!2540 = !DILocation(line: 100, column: 41, scope: !2217)
!2541 = !DILocation(line: 100, column: 17, scope: !2217)
!2542 = !DILocation(line: 0, scope: !2246, inlinedAt: !2543)
!2543 = distinct !DILocation(line: 100, column: 3, scope: !2217)
!2544 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !2543)
!2545 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !2543)
!2546 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !2543)
!2547 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !2543)
!2548 = !DILocation(line: 0, scope: !2260, inlinedAt: !2549)
!2549 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !2543)
!2550 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2549)
!2551 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !2543)
!2552 = !DILocation(line: 0, scope: !2281, inlinedAt: !2553)
!2553 = distinct !DILocation(line: 101, column: 13, scope: !2217)
!2554 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2553)
!2555 = !DILocation(line: 0, scope: !2236)
!2556 = !DILocation(line: 102, column: 3, scope: !2236)
!2557 = !DILocation(line: 0, scope: !2281, inlinedAt: !2558)
!2558 = distinct !DILocation(line: 108, column: 15, scope: !2559)
!2559 = distinct !DILexicalBlock(scope: !2217, file: !9, line: 107, column: 7)
!2560 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2558)
!2561 = !DILocalVariable(name: "__f", arg: 2, scope: !2562, file: !2563, line: 178, type: !2566)
!2562 = distinct !DISubprogram(name: "operator<<<char, std::char_traits<char> >", linkageName: "_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E", scope: !2, file: !2563, line: 178, type: !2564, scopeLine: 179, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2353, retainedNodes: !2569)
!2563 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/iomanip", directory: "")
!2564 = !DISubroutineType(types: !2565)
!2565 = !{!2284, !2284, !2566}
!2566 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Setfill<char>", scope: !2, file: !2563, line: 154, size: 8, flags: DIFlagTypePassByValue, elements: !2567, templateParams: !2340, identifier: "_ZTSSt8_SetfillIcE")
!2567 = !{!2568}
!2568 = !DIDerivedType(tag: DW_TAG_member, name: "_M_c", scope: !2566, file: !2563, line: 154, baseType: !12, size: 8)
!2569 = !{!2570, !2561}
!2570 = !DILocalVariable(name: "__os", arg: 1, scope: !2562, file: !2563, line: 178, type: !2284)
!2571 = !DILocation(line: 0, scope: !2562, inlinedAt: !2572)
!2572 = distinct !DILocation(line: 108, column: 27, scope: !2559)
!2573 = !DILocation(line: 180, column: 7, scope: !2562, inlinedAt: !2572)
!2574 = !DILocalVariable(name: "this", arg: 1, scope: !2575, type: !2583, flags: DIFlagArtificial | DIFlagObjectPointer)
!2575 = distinct !DISubprogram(name: "fill", linkageName: "_ZNSt9basic_iosIcSt11char_traitsIcEE4fillEc", scope: !2375, file: !2374, line: 390, type: !2576, scopeLine: 391, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2579, retainedNodes: !2580)
!2576 = !DISubroutineType(types: !2577)
!2577 = !{!2379, !2578, !2379}
!2578 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2375, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2579 = !DISubprogram(name: "fill", linkageName: "_ZNSt9basic_iosIcSt11char_traitsIcEE4fillEc", scope: !2375, file: !2374, line: 390, type: !2576, scopeLine: 390, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2580 = !{!2574, !2581, !2582}
!2581 = !DILocalVariable(name: "__ch", arg: 2, scope: !2575, file: !2374, line: 390, type: !2379)
!2582 = !DILocalVariable(name: "__old", scope: !2575, file: !2374, line: 392, type: !2379)
!2583 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2375, size: 64)
!2584 = !DILocation(line: 0, scope: !2575, inlinedAt: !2585)
!2585 = distinct !DILocation(line: 180, column: 12, scope: !2562, inlinedAt: !2572)
!2586 = !DILocalVariable(name: "this", arg: 1, scope: !2587, type: !2385, flags: DIFlagArtificial | DIFlagObjectPointer)
!2587 = distinct !DISubprogram(name: "fill", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv", scope: !2375, file: !2374, line: 370, type: !2588, scopeLine: 371, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2590, retainedNodes: !2591)
!2588 = !DISubroutineType(types: !2589)
!2589 = !{!2379, !2380}
!2590 = !DISubprogram(name: "fill", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv", scope: !2375, file: !2374, line: 370, type: !2588, scopeLine: 370, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2591 = !{!2586}
!2592 = !DILocation(line: 0, scope: !2587, inlinedAt: !2593)
!2593 = distinct !DILocation(line: 392, column: 26, scope: !2575, inlinedAt: !2585)
!2594 = !DILocation(line: 372, column: 7, scope: !2595, inlinedAt: !2593)
!2595 = distinct !DILexicalBlock(scope: !2587, file: !2374, line: 372, column: 6)
!2596 = !{!2390, !2397, i64 225}
!2597 = !{i8 0, i8 2}
!2598 = !DILocation(line: 372, column: 6, scope: !2587, inlinedAt: !2593)
!2599 = !DILocation(line: 0, scope: !2373, inlinedAt: !2600)
!2600 = distinct !DILocation(line: 374, column: 22, scope: !2601, inlinedAt: !2593)
!2601 = distinct !DILexicalBlock(scope: !2595, file: !2374, line: 373, column: 4)
!2602 = !DILocation(line: 450, column: 30, scope: !2373, inlinedAt: !2600)
!2603 = !DILocation(line: 0, scope: !2399, inlinedAt: !2604)
!2604 = distinct !DILocation(line: 450, column: 16, scope: !2373, inlinedAt: !2600)
!2605 = !DILocation(line: 49, column: 12, scope: !2413, inlinedAt: !2604)
!2606 = !DILocation(line: 49, column: 11, scope: !2399, inlinedAt: !2604)
!2607 = !DILocation(line: 50, column: 2, scope: !2413, inlinedAt: !2604)
!2608 = !DILocation(line: 0, scope: !2417, inlinedAt: !2609)
!2609 = distinct !DILocation(line: 450, column: 40, scope: !2373, inlinedAt: !2600)
!2610 = !DILocation(line: 874, column: 6, scope: !2428, inlinedAt: !2609)
!2611 = !DILocation(line: 874, column: 6, scope: !2417, inlinedAt: !2609)
!2612 = !DILocation(line: 876, column: 8, scope: !2417, inlinedAt: !2609)
!2613 = !DILocation(line: 877, column: 15, scope: !2417, inlinedAt: !2609)
!2614 = !DILocation(line: 240, column: 7, scope: !2615, inlinedAt: !2624)
!2615 = distinct !DISubprogram(name: "operator<<<char, std::char_traits<char> >", linkageName: "_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw", scope: !2, file: !2563, line: 238, type: !2616, scopeLine: 239, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2353, retainedNodes: !2621)
!2616 = !DISubroutineType(types: !2617)
!2617 = !{!2284, !2284, !2618}
!2618 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Setw", scope: !2, file: !2563, line: 215, size: 32, flags: DIFlagTypePassByValue, elements: !2619, identifier: "_ZTSSt5_Setw")
!2619 = !{!2620}
!2620 = !DIDerivedType(tag: DW_TAG_member, name: "_M_n", scope: !2618, file: !2563, line: 215, baseType: !179, size: 32)
!2621 = !{!2622, !2623}
!2622 = !DILocalVariable(name: "__os", arg: 1, scope: !2615, file: !2563, line: 238, type: !2284)
!2623 = !DILocalVariable(name: "__f", arg: 2, scope: !2615, file: !2563, line: 238, type: !2618)
!2624 = distinct !DILocation(line: 108, column: 48, scope: !2559)
!2625 = !DILocation(line: 877, column: 2, scope: !2417, inlinedAt: !2609)
!2626 = !DILocation(line: 375, column: 19, scope: !2601, inlinedAt: !2593)
!2627 = !DILocation(line: 376, column: 4, scope: !2601, inlinedAt: !2593)
!2628 = !DILocation(line: 393, column: 2, scope: !2575, inlinedAt: !2585)
!2629 = !DILocation(line: 393, column: 10, scope: !2575, inlinedAt: !2585)
!2630 = !{!2390, !2215, i64 224}
!2631 = !DILocation(line: 0, scope: !2615, inlinedAt: !2624)
!2632 = !DILocalVariable(name: "this", arg: 1, scope: !2633, type: !2641, flags: DIFlagArtificial | DIFlagObjectPointer)
!2633 = distinct !DISubprogram(name: "width", linkageName: "_ZNSt8ios_base5widthEl", scope: !6, file: !5, line: 751, type: !2634, scopeLine: 752, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2637, retainedNodes: !2638)
!2634 = !DISubroutineType(types: !2635)
!2635 = !{!272, !2636, !272}
!2636 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2637 = !DISubprogram(name: "width", linkageName: "_ZNSt8ios_base5widthEl", scope: !6, file: !5, line: 751, type: !2634, scopeLine: 751, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2638 = !{!2632, !2639, !2640}
!2639 = !DILocalVariable(name: "__wide", arg: 2, scope: !2633, file: !5, line: 751, type: !272)
!2640 = !DILocalVariable(name: "__old", scope: !2633, file: !5, line: 753, type: !272)
!2641 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!2642 = !DILocation(line: 0, scope: !2633, inlinedAt: !2643)
!2643 = distinct !DILocation(line: 240, column: 12, scope: !2615, inlinedAt: !2624)
!2644 = !DILocation(line: 753, column: 26, scope: !2633, inlinedAt: !2643)
!2645 = !DILocation(line: 754, column: 16, scope: !2633, inlinedAt: !2643)
!2646 = !{!2391, !2392, i64 16}
!2647 = !DILocation(line: 0, scope: !2281, inlinedAt: !2648)
!2648 = distinct !DILocation(line: 108, column: 64, scope: !2559)
!2649 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2648)
!2650 = !DILocation(line: 0, scope: !2281, inlinedAt: !2651)
!2651 = distinct !DILocation(line: 109, column: 13, scope: !2217)
!2652 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2651)
!2653 = !DILocation(line: 0, scope: !2260, inlinedAt: !2654)
!2654 = distinct !DILocation(line: 109, column: 26, scope: !2217)
!2655 = !DILocation(line: 0, scope: !2349, inlinedAt: !2656)
!2656 = distinct !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2654)
!2657 = !DILocation(line: 704, column: 19, scope: !2349, inlinedAt: !2656)
!2658 = !DILocation(line: 113, column: 18, scope: !2217)
!2659 = !DILocation(line: 113, column: 3, scope: !2217)
!2660 = !DILocation(line: 103, column: 11, scope: !2661)
!2661 = distinct !DILexicalBlock(scope: !2662, file: !9, line: 103, column: 9)
!2662 = distinct !DILexicalBlock(scope: !2663, file: !9, line: 102, column: 42)
!2663 = distinct !DILexicalBlock(scope: !2236, file: !9, line: 102, column: 3)
!2664 = !DILocation(line: 103, column: 32, scope: !2661)
!2665 = !DILocation(line: 103, column: 9, scope: !2662)
!2666 = !DILocation(line: 0, scope: !2281, inlinedAt: !2667)
!2667 = distinct !DILocation(line: 104, column: 17, scope: !2661)
!2668 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2667)
!2669 = !DILocation(line: 104, column: 7, scope: !2661)
!2670 = !DILocation(line: 0, scope: !2562, inlinedAt: !2671)
!2671 = distinct !DILocation(line: 105, column: 15, scope: !2662)
!2672 = !DILocation(line: 180, column: 7, scope: !2562, inlinedAt: !2671)
!2673 = !DILocation(line: 0, scope: !2575, inlinedAt: !2674)
!2674 = distinct !DILocation(line: 180, column: 12, scope: !2562, inlinedAt: !2671)
!2675 = !DILocation(line: 0, scope: !2587, inlinedAt: !2676)
!2676 = distinct !DILocation(line: 392, column: 26, scope: !2575, inlinedAt: !2674)
!2677 = !DILocation(line: 372, column: 7, scope: !2595, inlinedAt: !2676)
!2678 = !DILocation(line: 372, column: 6, scope: !2587, inlinedAt: !2676)
!2679 = !DILocation(line: 0, scope: !2373, inlinedAt: !2680)
!2680 = distinct !DILocation(line: 374, column: 22, scope: !2601, inlinedAt: !2676)
!2681 = !DILocation(line: 450, column: 30, scope: !2373, inlinedAt: !2680)
!2682 = !DILocation(line: 0, scope: !2399, inlinedAt: !2683)
!2683 = distinct !DILocation(line: 450, column: 16, scope: !2373, inlinedAt: !2680)
!2684 = !DILocation(line: 49, column: 12, scope: !2413, inlinedAt: !2683)
!2685 = !DILocation(line: 49, column: 11, scope: !2399, inlinedAt: !2683)
!2686 = !DILocation(line: 50, column: 2, scope: !2413, inlinedAt: !2683)
!2687 = !DILocation(line: 0, scope: !2417, inlinedAt: !2688)
!2688 = distinct !DILocation(line: 450, column: 40, scope: !2373, inlinedAt: !2680)
!2689 = !DILocation(line: 874, column: 6, scope: !2428, inlinedAt: !2688)
!2690 = !DILocation(line: 874, column: 6, scope: !2417, inlinedAt: !2688)
!2691 = !DILocation(line: 876, column: 8, scope: !2417, inlinedAt: !2688)
!2692 = !DILocation(line: 877, column: 15, scope: !2417, inlinedAt: !2688)
!2693 = !DILocation(line: 240, column: 7, scope: !2615, inlinedAt: !2694)
!2694 = distinct !DILocation(line: 105, column: 36, scope: !2662)
!2695 = !DILocation(line: 877, column: 2, scope: !2417, inlinedAt: !2688)
!2696 = !DILocation(line: 375, column: 19, scope: !2601, inlinedAt: !2676)
!2697 = !DILocation(line: 376, column: 4, scope: !2601, inlinedAt: !2676)
!2698 = !DILocation(line: 393, column: 2, scope: !2575, inlinedAt: !2674)
!2699 = !DILocation(line: 393, column: 10, scope: !2575, inlinedAt: !2674)
!2700 = !DILocation(line: 0, scope: !2615, inlinedAt: !2694)
!2701 = !DILocation(line: 0, scope: !2633, inlinedAt: !2702)
!2702 = distinct !DILocation(line: 240, column: 12, scope: !2615, inlinedAt: !2694)
!2703 = !DILocation(line: 753, column: 26, scope: !2633, inlinedAt: !2702)
!2704 = !DILocation(line: 754, column: 16, scope: !2633, inlinedAt: !2702)
!2705 = !DILocation(line: 105, column: 55, scope: !2662)
!2706 = !{!2392, !2392, i64 0}
!2707 = !DILocalVariable(name: "this", arg: 1, scope: !2708, type: !2275, flags: DIFlagArtificial | DIFlagObjectPointer)
!2708 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEl", scope: !2262, file: !2261, line: 166, type: !2709, scopeLine: 167, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2711, retainedNodes: !2712)
!2709 = !DISubroutineType(types: !2710)
!2710 = !{!2266, !2268, !210}
!2711 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEl", scope: !2262, file: !2261, line: 166, type: !2709, scopeLine: 166, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2712 = !{!2707, !2713}
!2713 = !DILocalVariable(name: "__n", arg: 2, scope: !2708, file: !2261, line: 166, type: !210)
!2714 = !DILocation(line: 0, scope: !2708, inlinedAt: !2715)
!2715 = distinct !DILocation(line: 105, column: 52, scope: !2662)
!2716 = !DILocation(line: 167, column: 16, scope: !2708, inlinedAt: !2715)
!2717 = !DILocation(line: 0, scope: !2281, inlinedAt: !2718)
!2718 = distinct !DILocation(line: 105, column: 71, scope: !2662)
!2719 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2718)
!2720 = !DILocation(line: 102, column: 37, scope: !2663)
!2721 = !DILocation(line: 102, column: 21, scope: !2663)
!2722 = distinct !{!2722, !2556, !2723, !2724}
!2723 = !DILocation(line: 106, column: 3, scope: !2236)
!2724 = !{!"llvm.loop.mustprogress"}
!2725 = !DILocation(line: 113, column: 49, scope: !2217)
!2726 = !DILocation(line: 113, column: 54, scope: !2217)
!2727 = !DILocation(line: 113, column: 62, scope: !2217)
!2728 = !DILocation(line: 117, column: 3, scope: !2217)
!2729 = !DILocation(line: 401, column: 2, scope: !2730, inlinedAt: !2753)
!2730 = distinct !DISubprogram(name: "sleep_for<long, std::ratio<1L, 1000L> >", linkageName: "_ZNSt11this_thread9sleep_forIlSt5ratioILl1ELl1000EEEEvRKNSt6chrono8durationIT_T0_EE", scope: !2732, file: !2731, line: 389, type: !2733, scopeLine: 390, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !260, retainedNodes: !2735)
!2731 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/thread", directory: "")
!2732 = !DINamespace(name: "this_thread", scope: !2)
!2733 = !DISubroutineType(types: !2734)
!2734 = !{null, !224}
!2735 = !{!2736, !2737, !2744, !2750}
!2736 = !DILocalVariable(name: "__rtime", arg: 1, scope: !2730, file: !2731, line: 389, type: !224)
!2737 = !DILocalVariable(name: "__s", scope: !2730, file: !2731, line: 393, type: !2738)
!2738 = !DIDerivedType(tag: DW_TAG_typedef, name: "__enable_if_is_duration<std::chrono::duration<long, std::ratio<1L, 1L> > >", scope: !205, file: !204, line: 242, baseType: !2739)
!2739 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2740, file: !423, line: 2188, baseType: !302)
!2740 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, std::chrono::duration<long, std::ratio<1L, 1L> > >", scope: !2, file: !423, line: 2187, size: 8, flags: DIFlagTypePassByValue, elements: !297, templateParams: !2741, identifier: "_ZTSSt9enable_ifILb1ENSt6chrono8durationIlSt5ratioILl1ELl1EEEEE")
!2741 = !{!2742, !2743}
!2742 = !DITemplateValueParameter(type: !286, value: i1 true)
!2743 = !DITemplateTypeParameter(name: "_Tp", type: !302)
!2744 = !DILocalVariable(name: "__ns", scope: !2730, file: !2731, line: 394, type: !2745)
!2745 = !DIDerivedType(tag: DW_TAG_typedef, name: "__enable_if_is_duration<std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !205, file: !204, line: 242, baseType: !2746)
!2746 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2747, file: !423, line: 2188, baseType: !358)
!2747 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !2, file: !423, line: 2187, size: 8, flags: DIFlagTypePassByValue, elements: !297, templateParams: !2748, identifier: "_ZTSSt9enable_ifILb1ENSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEEE")
!2748 = !{!2742, !2749}
!2749 = !DITemplateTypeParameter(name: "_Tp", type: !358)
!2750 = !DILocalVariable(name: "__ts", scope: !2730, file: !2731, line: 396, type: !2751)
!2751 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gthread_time_t", file: !2752, line: 53, baseType: !2026)
!2752 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/x86_64-redhat-linux/bits/gthr-default.h", directory: "", checksumkind: CSK_MD5, checksum: "67de20ea417b349191308ef2cace4b80")
!2753 = distinct !DILocation(line: 118, column: 5, scope: !2754)
!2754 = distinct !DILexicalBlock(scope: !2217, file: !9, line: 117, column: 6)
!2755 = !DILocation(line: 0, scope: !2730, inlinedAt: !2753)
!2756 = !DILocation(line: 396, column: 2, scope: !2730, inlinedAt: !2753)
!2757 = !DILocation(line: 396, column: 19, scope: !2730, inlinedAt: !2753)
!2758 = !DILocation(line: 397, column: 4, scope: !2730, inlinedAt: !2753)
!2759 = !DILocation(line: 401, column: 9, scope: !2730, inlinedAt: !2753)
!2760 = !DILocation(line: 401, column: 35, scope: !2730, inlinedAt: !2753)
!2761 = !DILocation(line: 401, column: 41, scope: !2730, inlinedAt: !2753)
!2762 = !DILocation(line: 401, column: 44, scope: !2730, inlinedAt: !2753)
!2763 = !DILocation(line: 401, column: 50, scope: !2730, inlinedAt: !2753)
!2764 = distinct !{!2764, !2729, !2765, !2724}
!2765 = !DILocation(line: 402, column: 6, scope: !2730, inlinedAt: !2753)
!2766 = !DILocation(line: 406, column: 7, scope: !2730, inlinedAt: !2753)
!2767 = !DILocation(line: 119, column: 13, scope: !2217)
!2768 = !DILocation(line: 119, column: 12, scope: !2217)
!2769 = !DILocation(line: 119, column: 17, scope: !2217)
!2770 = !DILocation(line: 119, column: 22, scope: !2217)
!2771 = !DILocation(line: 119, column: 26, scope: !2217)
!2772 = !DILocation(line: 119, column: 39, scope: !2217)
!2773 = !DILocation(line: 119, column: 3, scope: !2754)
!2774 = distinct !{!2774, !2728, !2775, !2724}
!2775 = !DILocation(line: 119, column: 43, scope: !2217)
!2776 = !DILocation(line: 121, column: 8, scope: !2777)
!2777 = distinct !DILexicalBlock(scope: !2217, file: !9, line: 121, column: 7)
!2778 = !DILocation(line: 121, column: 7, scope: !2777)
!2779 = !DILocation(line: 121, column: 12, scope: !2777)
!2780 = !DILocation(line: 121, column: 7, scope: !2217)
!2781 = !DILocation(line: 0, scope: !2281, inlinedAt: !2782)
!2782 = distinct !DILocation(line: 122, column: 15, scope: !2777)
!2783 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2782)
!2784 = !DILocation(line: 0, scope: !2260, inlinedAt: !2785)
!2785 = distinct !DILocation(line: 122, column: 81, scope: !2777)
!2786 = !DILocation(line: 0, scope: !2365, inlinedAt: !2787)
!2787 = distinct !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2785)
!2788 = !DILocation(line: 682, column: 29, scope: !2365, inlinedAt: !2787)
!2789 = !DILocation(line: 0, scope: !2373, inlinedAt: !2790)
!2790 = distinct !DILocation(line: 682, column: 34, scope: !2365, inlinedAt: !2787)
!2791 = !DILocation(line: 450, column: 30, scope: !2373, inlinedAt: !2790)
!2792 = !DILocation(line: 0, scope: !2399, inlinedAt: !2793)
!2793 = distinct !DILocation(line: 450, column: 16, scope: !2373, inlinedAt: !2790)
!2794 = !DILocation(line: 49, column: 12, scope: !2413, inlinedAt: !2793)
!2795 = !DILocation(line: 49, column: 11, scope: !2399, inlinedAt: !2793)
!2796 = !DILocation(line: 50, column: 2, scope: !2413, inlinedAt: !2793)
!2797 = !DILocation(line: 0, scope: !2417, inlinedAt: !2798)
!2798 = distinct !DILocation(line: 450, column: 40, scope: !2373, inlinedAt: !2790)
!2799 = !DILocation(line: 874, column: 6, scope: !2428, inlinedAt: !2798)
!2800 = !DILocation(line: 874, column: 6, scope: !2417, inlinedAt: !2798)
!2801 = !DILocation(line: 875, column: 11, scope: !2428, inlinedAt: !2798)
!2802 = !DILocation(line: 875, column: 4, scope: !2428, inlinedAt: !2798)
!2803 = !DILocation(line: 876, column: 8, scope: !2417, inlinedAt: !2798)
!2804 = !DILocation(line: 877, column: 15, scope: !2417, inlinedAt: !2798)
!2805 = !DILocation(line: 877, column: 2, scope: !2417, inlinedAt: !2798)
!2806 = !DILocation(line: 682, column: 25, scope: !2365, inlinedAt: !2787)
!2807 = !DILocation(line: 0, scope: !2349, inlinedAt: !2808)
!2808 = distinct !DILocation(line: 682, column: 14, scope: !2365, inlinedAt: !2787)
!2809 = !DILocation(line: 704, column: 19, scope: !2349, inlinedAt: !2808)
!2810 = !DILocation(line: 122, column: 5, scope: !2777)
!2811 = !DILocation(line: 130, column: 35, scope: !2217)
!2812 = !DILocation(line: 130, column: 17, scope: !2217)
!2813 = !DILocation(line: 0, scope: !2246, inlinedAt: !2814)
!2814 = distinct !DILocation(line: 130, column: 3, scope: !2217)
!2815 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !2814)
!2816 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !2814)
!2817 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !2814)
!2818 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !2814)
!2819 = !DILocation(line: 0, scope: !2260, inlinedAt: !2820)
!2820 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !2814)
!2821 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2820)
!2822 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !2814)
!2823 = !DILocation(line: 0, scope: !2281, inlinedAt: !2824)
!2824 = distinct !DILocation(line: 134, column: 13, scope: !2217)
!2825 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2824)
!2826 = !DILocation(line: 134, column: 47, scope: !2217)
!2827 = !DILocation(line: 134, column: 46, scope: !2217)
!2828 = !DILocalVariable(name: "this", arg: 1, scope: !2829, type: !2275, flags: DIFlagArtificial | DIFlagObjectPointer)
!2829 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !2262, file: !2261, line: 170, type: !2830, scopeLine: 171, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2832, retainedNodes: !2833)
!2830 = !DISubroutineType(types: !2831)
!2831 = !{!2266, !2268, !829}
!2832 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !2262, file: !2261, line: 170, type: !2830, scopeLine: 170, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2833 = !{!2828, !2834}
!2834 = !DILocalVariable(name: "__n", arg: 2, scope: !2829, file: !2261, line: 170, type: !829)
!2835 = !DILocation(line: 0, scope: !2829, inlinedAt: !2836)
!2836 = distinct !DILocation(line: 134, column: 43, scope: !2217)
!2837 = !DILocation(line: 171, column: 16, scope: !2829, inlinedAt: !2836)
!2838 = !DILocation(line: 0, scope: !2281, inlinedAt: !2839)
!2839 = distinct !DILocation(line: 135, column: 13, scope: !2217)
!2840 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2839)
!2841 = !DILocation(line: 0, scope: !2238)
!2842 = !DILocation(line: 137, column: 3, scope: !2238)
!2843 = !DILocation(line: 0, scope: !2281, inlinedAt: !2844)
!2844 = distinct !DILocation(line: 143, column: 15, scope: !2845)
!2845 = distinct !DILexicalBlock(scope: !2217, file: !9, line: 142, column: 7)
!2846 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2844)
!2847 = !DILocation(line: 0, scope: !2562, inlinedAt: !2848)
!2848 = distinct !DILocation(line: 143, column: 27, scope: !2845)
!2849 = !DILocation(line: 180, column: 7, scope: !2562, inlinedAt: !2848)
!2850 = !DILocation(line: 0, scope: !2575, inlinedAt: !2851)
!2851 = distinct !DILocation(line: 180, column: 12, scope: !2562, inlinedAt: !2848)
!2852 = !DILocation(line: 0, scope: !2587, inlinedAt: !2853)
!2853 = distinct !DILocation(line: 392, column: 26, scope: !2575, inlinedAt: !2851)
!2854 = !DILocation(line: 372, column: 7, scope: !2595, inlinedAt: !2853)
!2855 = !DILocation(line: 372, column: 6, scope: !2587, inlinedAt: !2853)
!2856 = !DILocation(line: 0, scope: !2373, inlinedAt: !2857)
!2857 = distinct !DILocation(line: 374, column: 22, scope: !2601, inlinedAt: !2853)
!2858 = !DILocation(line: 450, column: 30, scope: !2373, inlinedAt: !2857)
!2859 = !DILocation(line: 0, scope: !2399, inlinedAt: !2860)
!2860 = distinct !DILocation(line: 450, column: 16, scope: !2373, inlinedAt: !2857)
!2861 = !DILocation(line: 49, column: 12, scope: !2413, inlinedAt: !2860)
!2862 = !DILocation(line: 49, column: 11, scope: !2399, inlinedAt: !2860)
!2863 = !DILocation(line: 50, column: 2, scope: !2413, inlinedAt: !2860)
!2864 = !DILocation(line: 0, scope: !2417, inlinedAt: !2865)
!2865 = distinct !DILocation(line: 450, column: 40, scope: !2373, inlinedAt: !2857)
!2866 = !DILocation(line: 874, column: 6, scope: !2428, inlinedAt: !2865)
!2867 = !DILocation(line: 874, column: 6, scope: !2417, inlinedAt: !2865)
!2868 = !DILocation(line: 876, column: 8, scope: !2417, inlinedAt: !2865)
!2869 = !DILocation(line: 877, column: 15, scope: !2417, inlinedAt: !2865)
!2870 = !DILocation(line: 240, column: 7, scope: !2615, inlinedAt: !2871)
!2871 = distinct !DILocation(line: 143, column: 48, scope: !2845)
!2872 = !DILocation(line: 877, column: 2, scope: !2417, inlinedAt: !2865)
!2873 = !DILocation(line: 375, column: 19, scope: !2601, inlinedAt: !2853)
!2874 = !DILocation(line: 376, column: 4, scope: !2601, inlinedAt: !2853)
!2875 = !DILocation(line: 393, column: 2, scope: !2575, inlinedAt: !2851)
!2876 = !DILocation(line: 393, column: 10, scope: !2575, inlinedAt: !2851)
!2877 = !DILocation(line: 0, scope: !2615, inlinedAt: !2871)
!2878 = !DILocation(line: 0, scope: !2633, inlinedAt: !2879)
!2879 = distinct !DILocation(line: 240, column: 12, scope: !2615, inlinedAt: !2871)
!2880 = !DILocation(line: 753, column: 26, scope: !2633, inlinedAt: !2879)
!2881 = !DILocation(line: 754, column: 16, scope: !2633, inlinedAt: !2879)
!2882 = !DILocation(line: 0, scope: !2281, inlinedAt: !2883)
!2883 = distinct !DILocation(line: 143, column: 64, scope: !2845)
!2884 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2883)
!2885 = !DILocation(line: 0, scope: !2281, inlinedAt: !2886)
!2886 = distinct !DILocation(line: 144, column: 13, scope: !2217)
!2887 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2886)
!2888 = !DILocation(line: 0, scope: !2260, inlinedAt: !2889)
!2889 = distinct !DILocation(line: 144, column: 26, scope: !2217)
!2890 = !DILocation(line: 0, scope: !2365, inlinedAt: !2891)
!2891 = distinct !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2889)
!2892 = !DILocation(line: 682, column: 29, scope: !2365, inlinedAt: !2891)
!2893 = !DILocation(line: 0, scope: !2373, inlinedAt: !2894)
!2894 = distinct !DILocation(line: 682, column: 34, scope: !2365, inlinedAt: !2891)
!2895 = !DILocation(line: 450, column: 30, scope: !2373, inlinedAt: !2894)
!2896 = !DILocation(line: 0, scope: !2399, inlinedAt: !2897)
!2897 = distinct !DILocation(line: 450, column: 16, scope: !2373, inlinedAt: !2894)
!2898 = !DILocation(line: 49, column: 12, scope: !2413, inlinedAt: !2897)
!2899 = !DILocation(line: 49, column: 11, scope: !2399, inlinedAt: !2897)
!2900 = !DILocation(line: 50, column: 2, scope: !2413, inlinedAt: !2897)
!2901 = !DILocation(line: 0, scope: !2417, inlinedAt: !2902)
!2902 = distinct !DILocation(line: 450, column: 40, scope: !2373, inlinedAt: !2894)
!2903 = !DILocation(line: 874, column: 6, scope: !2428, inlinedAt: !2902)
!2904 = !DILocation(line: 874, column: 6, scope: !2417, inlinedAt: !2902)
!2905 = !DILocation(line: 875, column: 11, scope: !2428, inlinedAt: !2902)
!2906 = !DILocation(line: 875, column: 4, scope: !2428, inlinedAt: !2902)
!2907 = !DILocation(line: 876, column: 8, scope: !2417, inlinedAt: !2902)
!2908 = !DILocation(line: 877, column: 15, scope: !2417, inlinedAt: !2902)
!2909 = !DILocation(line: 877, column: 2, scope: !2417, inlinedAt: !2902)
!2910 = !DILocation(line: 682, column: 25, scope: !2365, inlinedAt: !2891)
!2911 = !DILocation(line: 0, scope: !2349, inlinedAt: !2912)
!2912 = distinct !DILocation(line: 682, column: 14, scope: !2365, inlinedAt: !2891)
!2913 = !DILocation(line: 704, column: 19, scope: !2349, inlinedAt: !2912)
!2914 = !DILocation(line: 148, column: 25, scope: !2217)
!2915 = !DILocation(line: 148, column: 17, scope: !2217)
!2916 = !DILocation(line: 0, scope: !2246, inlinedAt: !2917)
!2917 = distinct !DILocation(line: 148, column: 3, scope: !2217)
!2918 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !2917)
!2919 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !2917)
!2920 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !2917)
!2921 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !2917)
!2922 = !DILocation(line: 0, scope: !2260, inlinedAt: !2923)
!2923 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !2917)
!2924 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2923)
!2925 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !2917)
!2926 = !DILocation(line: 149, column: 25, scope: !2217)
!2927 = !DILocation(line: 149, column: 17, scope: !2217)
!2928 = !DILocation(line: 0, scope: !2246, inlinedAt: !2929)
!2929 = distinct !DILocation(line: 149, column: 3, scope: !2217)
!2930 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !2929)
!2931 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !2929)
!2932 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !2929)
!2933 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !2929)
!2934 = !DILocation(line: 0, scope: !2260, inlinedAt: !2935)
!2935 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !2929)
!2936 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2935)
!2937 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !2929)
!2938 = !DILocation(line: 150, column: 25, scope: !2217)
!2939 = !DILocation(line: 150, column: 17, scope: !2217)
!2940 = !DILocation(line: 0, scope: !2246, inlinedAt: !2941)
!2941 = distinct !DILocation(line: 150, column: 3, scope: !2217)
!2942 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !2941)
!2943 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !2941)
!2944 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !2941)
!2945 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !2941)
!2946 = !DILocation(line: 0, scope: !2260, inlinedAt: !2947)
!2947 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !2941)
!2948 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2947)
!2949 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !2941)
!2950 = !DILocation(line: 151, column: 3, scope: !2217)
!2951 = !DILocation(line: 151, column: 20, scope: !2217)
!2952 = !DILocation(line: 0, scope: !2281, inlinedAt: !2953)
!2953 = distinct !DILocation(line: 152, column: 13, scope: !2217)
!2954 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2953)
!2955 = !DILocation(line: 0, scope: !2260, inlinedAt: !2956)
!2956 = distinct !DILocation(line: 152, column: 56, scope: !2217)
!2957 = !DILocation(line: 0, scope: !2349, inlinedAt: !2958)
!2958 = distinct !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !2956)
!2959 = !DILocation(line: 704, column: 19, scope: !2349, inlinedAt: !2958)
!2960 = !DILocation(line: 153, column: 1, scope: !2217)
!2961 = !DILocation(line: 138, column: 11, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2963, file: !9, line: 138, column: 9)
!2963 = distinct !DILexicalBlock(scope: !2964, file: !9, line: 137, column: 42)
!2964 = distinct !DILexicalBlock(scope: !2238, file: !9, line: 137, column: 3)
!2965 = !DILocation(line: 138, column: 32, scope: !2962)
!2966 = !DILocation(line: 138, column: 9, scope: !2963)
!2967 = !DILocation(line: 0, scope: !2281, inlinedAt: !2968)
!2968 = distinct !DILocation(line: 139, column: 17, scope: !2962)
!2969 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !2968)
!2970 = !DILocation(line: 139, column: 7, scope: !2962)
!2971 = !DILocation(line: 0, scope: !2562, inlinedAt: !2972)
!2972 = distinct !DILocation(line: 140, column: 15, scope: !2963)
!2973 = !DILocation(line: 180, column: 7, scope: !2562, inlinedAt: !2972)
!2974 = !DILocation(line: 0, scope: !2575, inlinedAt: !2975)
!2975 = distinct !DILocation(line: 180, column: 12, scope: !2562, inlinedAt: !2972)
!2976 = !DILocation(line: 0, scope: !2587, inlinedAt: !2977)
!2977 = distinct !DILocation(line: 392, column: 26, scope: !2575, inlinedAt: !2975)
!2978 = !DILocation(line: 372, column: 7, scope: !2595, inlinedAt: !2977)
!2979 = !DILocation(line: 372, column: 6, scope: !2587, inlinedAt: !2977)
!2980 = !DILocation(line: 0, scope: !2373, inlinedAt: !2981)
!2981 = distinct !DILocation(line: 374, column: 22, scope: !2601, inlinedAt: !2977)
!2982 = !DILocation(line: 450, column: 30, scope: !2373, inlinedAt: !2981)
!2983 = !DILocation(line: 0, scope: !2399, inlinedAt: !2984)
!2984 = distinct !DILocation(line: 450, column: 16, scope: !2373, inlinedAt: !2981)
!2985 = !DILocation(line: 49, column: 12, scope: !2413, inlinedAt: !2984)
!2986 = !DILocation(line: 49, column: 11, scope: !2399, inlinedAt: !2984)
!2987 = !DILocation(line: 50, column: 2, scope: !2413, inlinedAt: !2984)
!2988 = !DILocation(line: 0, scope: !2417, inlinedAt: !2989)
!2989 = distinct !DILocation(line: 450, column: 40, scope: !2373, inlinedAt: !2981)
!2990 = !DILocation(line: 874, column: 6, scope: !2428, inlinedAt: !2989)
!2991 = !DILocation(line: 874, column: 6, scope: !2417, inlinedAt: !2989)
!2992 = !DILocation(line: 876, column: 8, scope: !2417, inlinedAt: !2989)
!2993 = !DILocation(line: 877, column: 15, scope: !2417, inlinedAt: !2989)
!2994 = !DILocation(line: 240, column: 7, scope: !2615, inlinedAt: !2995)
!2995 = distinct !DILocation(line: 140, column: 36, scope: !2963)
!2996 = !DILocation(line: 877, column: 2, scope: !2417, inlinedAt: !2989)
!2997 = !DILocation(line: 375, column: 19, scope: !2601, inlinedAt: !2977)
!2998 = !DILocation(line: 376, column: 4, scope: !2601, inlinedAt: !2977)
!2999 = !DILocation(line: 393, column: 2, scope: !2575, inlinedAt: !2975)
!3000 = !DILocation(line: 393, column: 10, scope: !2575, inlinedAt: !2975)
!3001 = !DILocation(line: 0, scope: !2615, inlinedAt: !2995)
!3002 = !DILocation(line: 0, scope: !2633, inlinedAt: !3003)
!3003 = distinct !DILocation(line: 240, column: 12, scope: !2615, inlinedAt: !2995)
!3004 = !DILocation(line: 753, column: 26, scope: !2633, inlinedAt: !3003)
!3005 = !DILocation(line: 754, column: 16, scope: !2633, inlinedAt: !3003)
!3006 = !DILocation(line: 140, column: 55, scope: !2963)
!3007 = !DILocation(line: 0, scope: !2829, inlinedAt: !3008)
!3008 = distinct !DILocation(line: 140, column: 52, scope: !2963)
!3009 = !DILocation(line: 171, column: 16, scope: !2829, inlinedAt: !3008)
!3010 = !DILocation(line: 0, scope: !2281, inlinedAt: !3011)
!3011 = distinct !DILocation(line: 140, column: 65, scope: !2963)
!3012 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !3011)
!3013 = !DILocation(line: 137, column: 37, scope: !2964)
!3014 = !DILocation(line: 137, column: 21, scope: !2964)
!3015 = distinct !{!3015, !2842, !3016, !2724}
!3016 = !DILocation(line: 141, column: 3, scope: !2238)
!3017 = !DILocation(line: 0, scope: !2246)
!3018 = !DILocation(line: 175, column: 15, scope: !2254)
!3019 = !DILocation(line: 175, column: 7, scope: !2246)
!3020 = !DILocation(line: 176, column: 15, scope: !2257)
!3021 = !DILocation(line: 176, column: 34, scope: !2257)
!3022 = !DILocation(line: 0, scope: !2260, inlinedAt: !3023)
!3023 = distinct !DILocation(line: 176, column: 45, scope: !2257)
!3024 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !3023)
!3025 = !DILocation(line: 177, column: 5, scope: !2257)
!3026 = !DILocation(line: 179, column: 1, scope: !2246)
!3027 = !DISubprogram(name: "hipGetDevice", scope: !90, file: !90, line: 1523, type: !3028, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3028 = !DISubroutineType(types: !3029)
!3029 = !{!2249, !502}
!3030 = !DISubprogram(name: "hipMemcpy", scope: !90, file: !90, line: 3408, type: !3031, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3031 = !DISubroutineType(types: !3032)
!3032 = !{!2249, !278, !853, !827, !3033}
!3033 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipMemcpyKind", file: !171, line: 351, baseType: !170)
!3034 = !DISubprogram(name: "hipFree", scope: !90, file: !90, line: 3353, type: !3035, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3035 = !DISubroutineType(types: !3036)
!3036 = !{!2249, !278}
!3037 = !DILocation(line: 163, column: 3, scope: !2119)
!3038 = !DILocation(line: 163, column: 19, scope: !2119)
!3039 = !DILocation(line: 164, column: 17, scope: !2119)
!3040 = !DILocation(line: 0, scope: !2246, inlinedAt: !3041)
!3041 = distinct !DILocation(line: 164, column: 3, scope: !2119)
!3042 = !DILocation(line: 175, column: 15, scope: !2254, inlinedAt: !3041)
!3043 = !DILocation(line: 175, column: 7, scope: !2246, inlinedAt: !3041)
!3044 = !DILocation(line: 176, column: 15, scope: !2257, inlinedAt: !3041)
!3045 = !DILocation(line: 176, column: 34, scope: !2257, inlinedAt: !3041)
!3046 = !DILocation(line: 0, scope: !2260, inlinedAt: !3047)
!3047 = distinct !DILocation(line: 176, column: 45, scope: !2257, inlinedAt: !3041)
!3048 = !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !3047)
!3049 = !DILocation(line: 177, column: 5, scope: !2257, inlinedAt: !3041)
!3050 = !DILocation(line: 0, scope: !2281, inlinedAt: !3051)
!3051 = distinct !DILocation(line: 165, column: 8, scope: !2119)
!3052 = !DILocalVariable(name: "__s", arg: 1, scope: !3053, file: !2290, line: 365, type: !2306)
!3053 = distinct !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !2289, file: !2290, line: 365, type: !2309, scopeLine: 366, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2308, retainedNodes: !3054)
!3054 = !{!3052}
!3055 = !DILocation(line: 0, scope: !3053, inlinedAt: !3056)
!3056 = distinct !DILocation(line: 612, column: 29, scope: !2345, inlinedAt: !3051)
!3057 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !3051)
!3058 = !DILocation(line: 165, column: 39, scope: !2119)
!3059 = !{!3060, !2243, i64 332}
!3060 = !{!"_ZTS15hipDeviceProp_t", !2215, i64 0, !2392, i64 256, !2392, i64 264, !2243, i64 272, !2243, i64 276, !2243, i64 280, !2215, i64 284, !2215, i64 296, !2243, i64 308, !2243, i64 312, !2243, i64 316, !2392, i64 320, !2243, i64 328, !2243, i64 332, !2243, i64 336, !2243, i64 340, !2243, i64 344, !2243, i64 348, !2243, i64 352, !3061, i64 356, !2243, i64 360, !2243, i64 364, !2243, i64 368, !2243, i64 372, !2392, i64 376, !2243, i64 384, !2243, i64 388, !2243, i64 392, !2215, i64 396, !2243, i64 652, !2243, i64 656, !2243, i64 660, !2243, i64 664, !2243, i64 668, !2215, i64 672, !2215, i64 680, !2214, i64 696, !2214, i64 704, !2392, i64 712, !2392, i64 720, !2392, i64 728, !2243, i64 736, !2243, i64 740, !2243, i64 744, !2243, i64 748, !2243, i64 752, !2243, i64 756, !2243, i64 760, !2243, i64 764, !2243, i64 768, !2243, i64 772, !2243, i64 776, !2243, i64 780, !2243, i64 784, !2243, i64 788}
!3061 = !{!"_ZTS15hipDeviceArch_t", !2243, i64 0, !2243, i64 0, !2243, i64 0, !2243, i64 0, !2243, i64 0, !2243, i64 0, !2243, i64 0, !2243, i64 0, !2243, i64 1, !2243, i64 1, !2243, i64 1, !2243, i64 1, !2243, i64 1, !2243, i64 1, !2243, i64 1, !2243, i64 1, !2243, i64 2}
!3062 = !DILocation(line: 165, column: 28, scope: !2119)
!3063 = !DILocation(line: 0, scope: !2260, inlinedAt: !3064)
!3064 = distinct !DILocation(line: 165, column: 45, scope: !2119)
!3065 = !DILocation(line: 0, scope: !2365, inlinedAt: !3066)
!3066 = distinct !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !3064)
!3067 = !DILocation(line: 682, column: 29, scope: !2365, inlinedAt: !3066)
!3068 = !DILocation(line: 0, scope: !2373, inlinedAt: !3069)
!3069 = distinct !DILocation(line: 682, column: 34, scope: !2365, inlinedAt: !3066)
!3070 = !DILocation(line: 450, column: 30, scope: !2373, inlinedAt: !3069)
!3071 = !DILocation(line: 0, scope: !2399, inlinedAt: !3072)
!3072 = distinct !DILocation(line: 450, column: 16, scope: !2373, inlinedAt: !3069)
!3073 = !DILocation(line: 49, column: 12, scope: !2413, inlinedAt: !3072)
!3074 = !DILocation(line: 49, column: 11, scope: !2399, inlinedAt: !3072)
!3075 = !DILocation(line: 50, column: 2, scope: !2413, inlinedAt: !3072)
!3076 = !DILocation(line: 0, scope: !2417, inlinedAt: !3077)
!3077 = distinct !DILocation(line: 450, column: 40, scope: !2373, inlinedAt: !3069)
!3078 = !DILocation(line: 874, column: 6, scope: !2428, inlinedAt: !3077)
!3079 = !DILocation(line: 874, column: 6, scope: !2417, inlinedAt: !3077)
!3080 = !DILocation(line: 875, column: 11, scope: !2428, inlinedAt: !3077)
!3081 = !DILocation(line: 875, column: 4, scope: !2428, inlinedAt: !3077)
!3082 = !DILocation(line: 876, column: 8, scope: !2417, inlinedAt: !3077)
!3083 = !DILocation(line: 877, column: 15, scope: !2417, inlinedAt: !3077)
!3084 = !DILocation(line: 877, column: 2, scope: !2417, inlinedAt: !3077)
!3085 = !DILocation(line: 682, column: 25, scope: !2365, inlinedAt: !3066)
!3086 = !DILocation(line: 0, scope: !2349, inlinedAt: !3087)
!3087 = distinct !DILocation(line: 682, column: 14, scope: !2365, inlinedAt: !3066)
!3088 = !DILocation(line: 704, column: 19, scope: !2349, inlinedAt: !3087)
!3089 = !DILocation(line: 0, scope: !2281, inlinedAt: !3090)
!3090 = distinct !DILocation(line: 166, column: 8, scope: !2119)
!3091 = !DILocation(line: 0, scope: !3053, inlinedAt: !3092)
!3092 = distinct !DILocation(line: 612, column: 29, scope: !2345, inlinedAt: !3090)
!3093 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !3090)
!3094 = !DILocation(line: 166, column: 39, scope: !2119)
!3095 = !{!3060, !2243, i64 328}
!3096 = !DILocation(line: 166, column: 28, scope: !2119)
!3097 = !DILocation(line: 0, scope: !2260, inlinedAt: !3098)
!3098 = distinct !DILocation(line: 166, column: 45, scope: !2119)
!3099 = !DILocation(line: 0, scope: !2365, inlinedAt: !3100)
!3100 = distinct !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !3098)
!3101 = !DILocation(line: 682, column: 29, scope: !2365, inlinedAt: !3100)
!3102 = !DILocation(line: 0, scope: !2373, inlinedAt: !3103)
!3103 = distinct !DILocation(line: 682, column: 34, scope: !2365, inlinedAt: !3100)
!3104 = !DILocation(line: 450, column: 30, scope: !2373, inlinedAt: !3103)
!3105 = !DILocation(line: 0, scope: !2399, inlinedAt: !3106)
!3106 = distinct !DILocation(line: 450, column: 16, scope: !2373, inlinedAt: !3103)
!3107 = !DILocation(line: 49, column: 12, scope: !2413, inlinedAt: !3106)
!3108 = !DILocation(line: 49, column: 11, scope: !2399, inlinedAt: !3106)
!3109 = !DILocation(line: 50, column: 2, scope: !2413, inlinedAt: !3106)
!3110 = !DILocation(line: 0, scope: !2417, inlinedAt: !3111)
!3111 = distinct !DILocation(line: 450, column: 40, scope: !2373, inlinedAt: !3103)
!3112 = !DILocation(line: 874, column: 6, scope: !2428, inlinedAt: !3111)
!3113 = !DILocation(line: 874, column: 6, scope: !2417, inlinedAt: !3111)
!3114 = !DILocation(line: 875, column: 11, scope: !2428, inlinedAt: !3111)
!3115 = !DILocation(line: 875, column: 4, scope: !2428, inlinedAt: !3111)
!3116 = !DILocation(line: 876, column: 8, scope: !2417, inlinedAt: !3111)
!3117 = !DILocation(line: 877, column: 15, scope: !2417, inlinedAt: !3111)
!3118 = !DILocation(line: 877, column: 2, scope: !2417, inlinedAt: !3111)
!3119 = !DILocation(line: 682, column: 25, scope: !2365, inlinedAt: !3100)
!3120 = !DILocation(line: 0, scope: !2349, inlinedAt: !3121)
!3121 = distinct !DILocation(line: 682, column: 14, scope: !2365, inlinedAt: !3100)
!3122 = !DILocation(line: 704, column: 19, scope: !2349, inlinedAt: !3121)
!3123 = !DILocation(line: 0, scope: !2281, inlinedAt: !3124)
!3124 = distinct !DILocation(line: 167, column: 8, scope: !2119)
!3125 = !DILocation(line: 0, scope: !3053, inlinedAt: !3126)
!3126 = distinct !DILocation(line: 612, column: 29, scope: !2345, inlinedAt: !3124)
!3127 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !3124)
!3128 = !DILocation(line: 0, scope: !2281, inlinedAt: !3129)
!3129 = distinct !DILocation(line: 167, column: 31, scope: !2119)
!3130 = !DILocation(line: 0, scope: !3053, inlinedAt: !3131)
!3131 = distinct !DILocation(line: 612, column: 29, scope: !2345, inlinedAt: !3129)
!3132 = !DILocation(line: 371, column: 9, scope: !3053, inlinedAt: !3131)
!3133 = !DILocation(line: 611, column: 2, scope: !2345, inlinedAt: !3129)
!3134 = !DILocation(line: 0, scope: !2260, inlinedAt: !3135)
!3135 = distinct !DILocation(line: 167, column: 47, scope: !2119)
!3136 = !DILocation(line: 0, scope: !2365, inlinedAt: !3137)
!3137 = distinct !DILocation(line: 113, column: 9, scope: !2260, inlinedAt: !3135)
!3138 = !DILocation(line: 682, column: 29, scope: !2365, inlinedAt: !3137)
!3139 = !DILocation(line: 0, scope: !2373, inlinedAt: !3140)
!3140 = distinct !DILocation(line: 682, column: 34, scope: !2365, inlinedAt: !3137)
!3141 = !DILocation(line: 450, column: 30, scope: !2373, inlinedAt: !3140)
!3142 = !DILocation(line: 0, scope: !2399, inlinedAt: !3143)
!3143 = distinct !DILocation(line: 450, column: 16, scope: !2373, inlinedAt: !3140)
!3144 = !DILocation(line: 49, column: 12, scope: !2413, inlinedAt: !3143)
!3145 = !DILocation(line: 49, column: 11, scope: !2399, inlinedAt: !3143)
!3146 = !DILocation(line: 50, column: 2, scope: !2413, inlinedAt: !3143)
!3147 = !DILocation(line: 0, scope: !2417, inlinedAt: !3148)
!3148 = distinct !DILocation(line: 450, column: 40, scope: !2373, inlinedAt: !3140)
!3149 = !DILocation(line: 874, column: 6, scope: !2428, inlinedAt: !3148)
!3150 = !DILocation(line: 874, column: 6, scope: !2417, inlinedAt: !3148)
!3151 = !DILocation(line: 875, column: 11, scope: !2428, inlinedAt: !3148)
!3152 = !DILocation(line: 875, column: 4, scope: !2428, inlinedAt: !3148)
!3153 = !DILocation(line: 876, column: 8, scope: !2417, inlinedAt: !3148)
!3154 = !DILocation(line: 877, column: 15, scope: !2417, inlinedAt: !3148)
!3155 = !DILocation(line: 877, column: 2, scope: !2417, inlinedAt: !3148)
!3156 = !DILocation(line: 682, column: 25, scope: !2365, inlinedAt: !3137)
!3157 = !DILocation(line: 0, scope: !2349, inlinedAt: !3158)
!3158 = distinct !DILocation(line: 682, column: 14, scope: !2365, inlinedAt: !3137)
!3159 = !DILocation(line: 704, column: 19, scope: !2349, inlinedAt: !3158)
!3160 = !DILocation(line: 169, column: 3, scope: !2119)
!3161 = !DILocation(line: 171, column: 1, scope: !2119)
!3162 = !DILocation(line: 170, column: 3, scope: !2119)
!3163 = !DISubprogram(name: "hipGetDeviceProperties", scope: !90, file: !90, line: 1617, type: !3164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3164 = !DISubroutineType(types: !3165)
!3165 = !{!2249, !3166, !179}
!3166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2122, size: 64)
!3167 = !DISubprogram(name: "hipMallocManaged", scope: !90, file: !90, line: 2731, type: !3168, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3168 = !DISubroutineType(types: !3169)
!3169 = !{!2249, !277, !827, !84}
!3170 = !DISubprogram(name: "hipMalloc", scope: !90, file: !90, line: 2654, type: !3171, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3171 = !DISubroutineType(types: !3172)
!3172 = !{!2249, !277, !827}
!3173 = !DISubprogram(name: "nanosleep", scope: !1988, file: !1988, line: 211, type: !3174, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3174 = !DISubroutineType(types: !3175)
!3175 = !{!179, !3176, !2036}
!3176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3177, size: 64)
!3177 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2026)
!3178 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_managed_clock_test.cpp", scope: !1464, file: !1464, type: !3179, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !297)
!3179 = !DISubroutineType(types: !297)
!3180 = !DILocation(line: 74, column: 25, scope: !3181, inlinedAt: !3183)
!3181 = !DILexicalBlockFile(scope: !3182, file: !3, discriminator: 0)
!3182 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1464, file: !1464, type: !821, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !297)
!3183 = distinct !DILocation(line: 0, scope: !3178)
!3184 = !DILocation(line: 0, scope: !3182, inlinedAt: !3183)

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
