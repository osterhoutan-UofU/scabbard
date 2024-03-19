
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa--gfx90a
; ModuleID = 'test/managed_clock_test.cpp'
source_filename = "test/managed_clock_test.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }
%"struct.scabbard::trace::device::DeviceTracker" = type { %"struct.scabbard::jobId_t", i64, i64, i64, i8, [128 x %"struct.scabbard::TraceData"] }
%"struct.scabbard::jobId_t" = type { i16, i16 }
%"struct.scabbard::TraceData" = type { i64, i16, [6 x i8], %"union.scabbard::ThreadId", ptr, %"struct.scabbard::LocationMetadata", i64 }
%"union.scabbard::ThreadId" = type <{ %"class.std::thread::id", [16 x i8] }>
%"class.std::thread::id" = type { i64 }
%"struct.scabbard::LocationMetadata" = type { i64, i32, i32 }

$scabbard.trace.device.dummyFunc = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE = comdat any

$_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1zE = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1yE = comdat any

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1zE = comdat any

@_ZN8scabbard5trace12_GLOBAL__N_114src_id_reg_tmpE = internal addrspace(1) global i64 84, align 8
@_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp2E = internal addrspace(1) global i64 84, align 8
@_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp3E = internal addrspace(1) global i64 84, align 8
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1xE = weak protected local_unnamed_addr addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1yE = weak protected local_unnamed_addr addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI14__HIP_BlockIdxE1zE = weak protected local_unnamed_addr addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = weak protected local_unnamed_addr addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1yE = weak protected local_unnamed_addr addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1zE = weak protected local_unnamed_addr addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15tick_all_kernelPU7_AtomicmPmPli__old__scabbard_instr_replaced__old__(ptr addrspace(1) nocapture %0, ptr addrspace(1) nocapture writeonly %1, ptr addrspace(1) nocapture %2, i32 %3) local_unnamed_addr #0 !dbg !1756 {
  %5 = addrspacecast ptr addrspace(1) %2 to ptr
  tail call fastcc void @_Z10dummy_workPl__old__scabbard_instr_replaced__old__(ptr %5) #10, !dbg !1768
  %6 = atomicrmw add ptr addrspace(1) %0, i64 1 seq_cst, align 8, !dbg !1769
  %7 = add i64 %6, 1, !dbg !1769
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !dbg !1770, !range !1782, !noundef !1783
  %9 = add i32 %8, %3, !dbg !1784
  %10 = zext i32 %9 to i64, !dbg !1785
  %11 = getelementptr inbounds i64, ptr addrspace(1) %1, i64 %10, !dbg !1785
  store i64 %7, ptr addrspace(1) %11, align 8, !dbg !1786, !tbaa !1787
  fence syncscope("workgroup") release, !dbg !1791
  tail call void @llvm.amdgcn.s.barrier(), !dbg !1806
  fence syncscope("workgroup") acquire, !dbg !1807
  tail call fastcc void @_Z10dummy_workPl__old__scabbard_instr_replaced__old__(ptr %5) #10, !dbg !1808
  ret void, !dbg !1809
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define internal fastcc void @_Z10dummy_workPl__old__scabbard_instr_replaced__old__(ptr nocapture %0) unnamed_addr #1 !dbg !1810 {
  %2 = tail call i32 @llvm.amdgcn.workitem.id.x(), !dbg !1816, !range !1782, !noundef !1783
  %3 = zext i32 %2 to i64, !dbg !1816
  %4 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr(), !dbg !1817
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x(), !dbg !1817
  %6 = load i32, ptr addrspace(4) %4, align 4, !dbg !1817, !tbaa !1818
  %7 = icmp ult i32 %5, %6, !dbg !1817
  %8 = select i1 %7, i64 6, i64 9, !dbg !1817
  %9 = getelementptr inbounds i16, ptr addrspace(4) %4, i64 %8, !dbg !1817
  %10 = load i16, ptr addrspace(4) %9, align 2, !dbg !1817, !tbaa !1822
  %11 = zext i16 %10 to i64, !dbg !1817
  %12 = zext i32 %5 to i64, !dbg !1824
  %13 = mul nuw nsw i64 %11, %12, !dbg !1825
  %14 = add nuw nsw i64 %13, %3, !dbg !1826
  %15 = shl i64 %14, 32, !dbg !1827
  %16 = ashr exact i64 %15, 32, !dbg !1827
  %17 = getelementptr inbounds i64, ptr %0, i64 %16, !dbg !1828
  %18 = load i64, ptr %17, align 8, !dbg !1829, !tbaa !1787
  %19 = add nsw i64 %16, %18, !dbg !1829
  store i64 %19, ptr %17, align 8, !dbg !1829, !tbaa !1787
  ret void, !dbg !1830
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z12dummy_kernelv__old__scabbard_instr_replaced__old__() local_unnamed_addr #0 !dbg !1831 {
  fence syncscope("workgroup") release, !dbg !1832
  tail call void @llvm.amdgcn.s.barrier(), !dbg !1836
  fence syncscope("workgroup") acquire, !dbg !1837
  ret void, !dbg !1838
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define protected amdgpu_kernel void @_Z10dummy_initPl__old__scabbard_instr_replaced__old__(ptr addrspace(1) nocapture writeonly %0) local_unnamed_addr #2 !dbg !1839 {
  %2 = tail call i32 @llvm.amdgcn.workitem.id.x(), !dbg !1843, !range !1782, !noundef !1783
  %3 = zext i32 %2 to i64, !dbg !1843
  %4 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr(), !dbg !1844
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x(), !dbg !1844
  %6 = getelementptr inbounds i16, ptr addrspace(4) %4, i64 6, !dbg !1844
  %7 = load i16, ptr addrspace(4) %6, align 4, !dbg !1844, !tbaa !1822
  %8 = zext i16 %7 to i64, !dbg !1844
  %9 = zext i32 %5 to i64, !dbg !1845
  %10 = mul nuw nsw i64 %8, %9, !dbg !1846
  %11 = add nuw nsw i64 %10, %3, !dbg !1847
  %12 = shl i64 %11, 32, !dbg !1848
  %13 = ashr exact i64 %12, 32, !dbg !1848
  %14 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %13, !dbg !1848
  store i64 0, ptr addrspace(1) %14, align 8, !dbg !1849, !tbaa !1787
  ret void, !dbg !1850
}

; Function Attrs: convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workitem.id.x() #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workgroup.id.x() #4

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none)
define amdgpu_kernel void @scabbard.trace.device.dummyFunc(ptr addrspace(1) nocapture %0, i32 %1, float %2, i16 %3, ptr addrspace(1) %4, ptr addrspace(1) nocapture readnone %5, ptr addrspace(1) nocapture readonly %6) local_unnamed_addr #5 comdat {
  %8 = addrspacecast ptr addrspace(1) %0 to ptr
  %9 = addrspacecast ptr addrspace(1) %4 to ptr
  %10 = addrspacecast ptr addrspace(1) %6 to ptr
  %11 = sitofp i32 %1 to float
  %12 = fmul contract float %11, %2
  store float %12, ptr addrspace(1) %0, align 4, !tbaa !1851
  tail call fastcc void @"scabbard.trace.device.trace_append$mem"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr addrspacecast (ptr addrspace(1) @_ZN8scabbard5trace12_GLOBAL__N_114src_id_reg_tmpE to ptr), i32 19, i32 9) #10
  tail call fastcc void @"scabbard.trace.device.trace_append$mem"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr addrspacecast (ptr addrspace(1) @_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp2E to ptr), i32 1024, i32 4) #10
  tail call fastcc void @"scabbard.trace.device.trace_append$mem"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr %10, i32 10240, i32 40) #10
  tail call fastcc void @"scabbard.trace.device.trace_append$alloc"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr addrspacecast (ptr addrspace(1) @_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp2E to ptr), i32 88, i32 256, i64 7) #10
  tail call fastcc void @"scabbard.trace.device.trace_append$alloc"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr addrspacecast (ptr addrspace(1) @_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp3E to ptr), i32 98, i32 6, i64 23) #10
  tail call fastcc void @"scabbard.trace.device.trace_append$alloc"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr %10, i32 980, i32 60, i64 230) #10
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nounwind willreturn memory(argmem: readwrite)
define internal fastcc void @"scabbard.trace.device.trace_append$mem"(ptr nocapture %0, i16 zeroext %1, ptr %2, ptr nocapture readonly %3, i32 %4, i32 %5) unnamed_addr #6 {
  %7 = alloca [6 x i8], align 2, addrspace(5)
  %8 = alloca [7 x i8], align 1, addrspace(5)
  call void @llvm.lifetime.start.p5(i64 6, ptr addrspace(5) %7)
  call void @llvm.lifetime.start.p5(i64 7, ptr addrspace(5) %8)
  %9 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 1
  %10 = atomicrmw add ptr %9, i64 1 seq_cst, align 8
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !1782, !noundef !1783
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !1782, !noundef !1783
  %16 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !1782, !noundef !1783
  %17 = load i64, ptr %3, align 8, !tbaa !1787
  %18 = load i32, ptr %0, align 1
  %19 = trunc i32 %16 to i8
  %20 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 2
  %21 = atomicrmw add ptr %20, i64 1 seq_cst, align 8
  %22 = and i64 %21, 127
  %23 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 5, i64 %22
  store i64 %10, ptr %23, align 8, !tbaa.struct !1853
  %24 = getelementptr inbounds i8, ptr %23, i64 8
  store i16 %1, ptr %24, align 8, !tbaa.struct !1863
  %25 = getelementptr inbounds i8, ptr %23, i64 10
  call void @llvm.memcpy.p0.p5.i64(ptr noundef nonnull align 2 dereferenceable(6) %25, ptr addrspace(5) noundef align 2 dereferenceable(6) %7, i64 6, i1 false), !tbaa.struct !1864
  %26 = getelementptr inbounds i8, ptr %23, i64 16
  store i32 %18, ptr %26, align 8, !tbaa.struct !1865
  %27 = getelementptr inbounds i8, ptr %23, i64 20
  store i32 %11, ptr %27, align 4, !tbaa.struct !1866
  %28 = getelementptr inbounds i8, ptr %23, i64 24
  %29 = insertelement <4 x i32> poison, i32 %12, i64 0
  %30 = insertelement <4 x i32> %29, i32 %13, i64 1
  %31 = insertelement <4 x i32> %30, i32 %14, i64 2
  %32 = insertelement <4 x i32> %31, i32 %15, i64 3
  %33 = trunc <4 x i32> %32 to <4 x i16>
  store <4 x i16> %33, ptr %28, align 8
  %34 = getelementptr inbounds i8, ptr %23, i64 32
  store i8 %19, ptr %34, align 8, !tbaa.struct !1867
  %35 = getelementptr inbounds i8, ptr %23, i64 33
  call void @llvm.memcpy.p0.p5.i64(ptr noundef nonnull align 1 dereferenceable(7) %35, ptr addrspace(5) noundef align 1 dereferenceable(7) %8, i64 7, i1 false), !tbaa.struct !1868
  %36 = getelementptr inbounds i8, ptr %23, i64 40
  store ptr %2, ptr %36, align 8, !tbaa.struct !1869
  %37 = getelementptr inbounds i8, ptr %23, i64 48
  store i64 %17, ptr %37, align 8, !tbaa.struct !1870
  %38 = getelementptr inbounds i8, ptr %23, i64 56
  store i32 %4, ptr %38, align 8, !tbaa.struct !1871
  %39 = getelementptr inbounds i8, ptr %23, i64 60
  store i32 %5, ptr %39, align 4, !tbaa.struct !1872
  %40 = getelementptr inbounds i8, ptr %23, i64 64
  store i64 0, ptr %40, align 8, !tbaa.struct !1873
  call void @llvm.lifetime.end.p5(i64 6, ptr addrspace(5) %7)
  call void @llvm.lifetime.end.p5(i64 7, ptr addrspace(5) %8)
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nounwind willreturn memory(argmem: readwrite)
define internal fastcc void @"scabbard.trace.device.trace_append$alloc"(ptr nocapture %0, i16 zeroext %1, ptr %2, ptr nocapture readonly %3, i32 %4, i32 %5, i64 %6) unnamed_addr #6 {
  %8 = alloca [6 x i8], align 2, addrspace(5)
  %9 = alloca [7 x i8], align 1, addrspace(5)
  call void @llvm.lifetime.start.p5(i64 6, ptr addrspace(5) %8)
  call void @llvm.lifetime.start.p5(i64 7, ptr addrspace(5) %9)
  %10 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 1
  %11 = atomicrmw add ptr %10, i64 1 seq_cst, align 8
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !1782, !noundef !1783
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !1782, !noundef !1783
  %17 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !1782, !noundef !1783
  %18 = load i64, ptr %3, align 8, !tbaa !1787
  %19 = load i32, ptr %0, align 1
  %20 = trunc i32 %17 to i8
  %21 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 2
  %22 = atomicrmw add ptr %21, i64 1 seq_cst, align 8
  %23 = and i64 %22, 127
  %24 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 5, i64 %23
  store i64 %11, ptr %24, align 8, !tbaa.struct !1853
  %25 = getelementptr inbounds i8, ptr %24, i64 8
  store i16 %1, ptr %25, align 8, !tbaa.struct !1863
  %26 = getelementptr inbounds i8, ptr %24, i64 10
  call void @llvm.memcpy.p0.p5.i64(ptr noundef nonnull align 2 dereferenceable(6) %26, ptr addrspace(5) noundef align 2 dereferenceable(6) %8, i64 6, i1 false), !tbaa.struct !1864
  %27 = getelementptr inbounds i8, ptr %24, i64 16
  store i32 %19, ptr %27, align 8, !tbaa.struct !1865
  %28 = getelementptr inbounds i8, ptr %24, i64 20
  store i32 %12, ptr %28, align 4, !tbaa.struct !1866
  %29 = getelementptr inbounds i8, ptr %24, i64 24
  %30 = insertelement <4 x i32> poison, i32 %13, i64 0
  %31 = insertelement <4 x i32> %30, i32 %14, i64 1
  %32 = insertelement <4 x i32> %31, i32 %15, i64 2
  %33 = insertelement <4 x i32> %32, i32 %16, i64 3
  %34 = trunc <4 x i32> %33 to <4 x i16>
  store <4 x i16> %34, ptr %29, align 8
  %35 = getelementptr inbounds i8, ptr %24, i64 32
  store i8 %20, ptr %35, align 8, !tbaa.struct !1867
  %36 = getelementptr inbounds i8, ptr %24, i64 33
  call void @llvm.memcpy.p0.p5.i64(ptr noundef nonnull align 1 dereferenceable(7) %36, ptr addrspace(5) noundef align 1 dereferenceable(7) %9, i64 7, i1 false), !tbaa.struct !1868
  %37 = getelementptr inbounds i8, ptr %24, i64 40
  store ptr %2, ptr %37, align 8, !tbaa.struct !1869
  %38 = getelementptr inbounds i8, ptr %24, i64 48
  store i64 %18, ptr %38, align 8, !tbaa.struct !1870
  %39 = getelementptr inbounds i8, ptr %24, i64 56
  store i32 %4, ptr %39, align 8, !tbaa.struct !1871
  %40 = getelementptr inbounds i8, ptr %24, i64 60
  store i32 %5, ptr %40, align 4, !tbaa.struct !1872
  %41 = getelementptr inbounds i8, ptr %24, i64 64
  store i64 %6, ptr %41, align 8, !tbaa.struct !1873
  call void @llvm.lifetime.end.p5(i64 6, ptr addrspace(5) %8)
  call void @llvm.lifetime.end.p5(i64 7, ptr addrspace(5) %9)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workgroup.id.y() #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workgroup.id.z() #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workitem.id.y() #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workitem.id.z() #8

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p5.i64(ptr noalias nocapture writeonly, ptr addrspace(5) noalias nocapture readonly, i64, i1 immarg) #9

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p5(i64 immarg, ptr addrspace(5) nocapture) #7

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15tick_all_kernelPU7_AtomicmPmPli(ptr addrspace(1) nocapture %0, ptr addrspace(1) nocapture writeonly %1, ptr addrspace(1) nocapture %2, i32 %3, ptr %4) local_unnamed_addr #0 !dbg !1874 {
  unreachable
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local fastcc void @_Z10dummy_workPl(ptr nocapture %0, ptr %1) unnamed_addr #1 !dbg !1880 {
  unreachable
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z12dummy_kernelv(ptr %0) local_unnamed_addr #0 !dbg !1884 {
  fence syncscope("workgroup") release, !dbg !1885
  tail call void @llvm.amdgcn.s.barrier(), !dbg !1889
  fence syncscope("workgroup") acquire, !dbg !1890
  ret void, !dbg !1891
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define protected amdgpu_kernel void @_Z10dummy_initPl(ptr addrspace(1) nocapture writeonly %0, ptr %1) local_unnamed_addr #2 !dbg !1892 {
  unreachable
}

attributes #0 = { convergent mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #3 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #4 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none) "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #6 = { mustprogress nofree noinline norecurse nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #7 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!1747, !1748, !1749, !1750, !1751, !1752, !1753}
!opencl.ocl.version = !{!1754, !1754}
!llvm.ident = !{!1755, !1755}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "AMD clang version 17.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-6.0.0 23483 7208e8d15fbf218deb74483ea8c549c67ca4985e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !11, globals: !28, imports: !72, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard", checksumkind: CSK_MD5, checksum: "84927e4bf98b7e7efaf685dc29fe5570")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Lock_policy", scope: !5, file: !4, line: 49, baseType: !6, size: 32, elements: !7, identifier: "_ZTSN9__gnu_cxx12_Lock_policyE")
!4 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ext/concurrence.h", directory: "")
!5 = !DINamespace(name: "__gnu_cxx", scope: null)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10}
!8 = !DIEnumerator(name: "_S_single", value: 0, isUnsigned: true)
!9 = !DIEnumerator(name: "_S_mutex", value: 1, isUnsigned: true)
!10 = !DIEnumerator(name: "_S_atomic", value: 2, isUnsigned: true)
!11 = !{!12, !14}
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cl_mem_fence_flags", file: !13, line: 131, baseType: !6)
!13 = !DIFile(filename: "/opt/rocm-6.0.0/include/hip/amd_detail/device_library_decls.h", directory: "", checksumkind: CSK_MD5, checksum: "61416ae22a8962f94d70fdb29c9fe093")
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !15, line: 1027, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !16, identifier: "_ZTS4dim3")
!15 = !DIFile(filename: "/opt/rocm-6.0.0/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "6aa15d18d5522d6c94f4e18d95fe9007")
!16 = !{!17, !22, !23, !24}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !14, file: !15, line: 1028, baseType: !18, size: 32)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !20)
!19 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "9754ebe022edbe8d7928fa709e442f0d")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !21, line: 41, baseType: !6)
!21 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "eac2c46b20ddc2be81186b6ffebfd845")
!22 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !14, file: !15, line: 1029, baseType: !18, size: 32, offset: 32)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !14, file: !15, line: 1030, baseType: !18, size: 32, offset: 64)
!24 = !DISubprogram(name: "dim3", scope: !14, file: !15, line: 1032, type: !25, scopeLine: 1032, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !27, !18, !18, !18}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!28 = !{!29, !70}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "threadIdx", linkageName: "_ZL9threadIdx", scope: !0, file: !31, line: 370, type: !32, isLocal: true, isDefinition: true, memorySpace: DW_MSPACE_LLVM_constant)
!31 = !DIFile(filename: "/opt/rocm-6.0.0/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "580a9b6c7669e1ffd454a2cee3ad6160")
!32 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_Coordinates<__HIP_ThreadIdx>", file: !31, line: 291, size: 8, flags: DIFlagTypePassByValue, elements: !34, templateParams: !61, identifier: "_ZTS17__HIP_CoordinatesI15__HIP_ThreadIdxE")
!34 = !{!35, !50, !53, !56}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !33, file: !31, line: 310, baseType: !36, flags: DIFlagStaticMember)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !37)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__X", scope: !33, file: !31, line: 294, size: 8, flags: DIFlagTypePassByValue, elements: !38, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XE")
!38 = !{!39, !44}
!39 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !37, file: !31, line: 295, type: !40, scopeLine: 295, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !43}
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "R", scope: !33, file: !31, line: 292, baseType: !18)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!44 = !DISubprogram(name: "operator+=", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XpLERKj", scope: !37, file: !31, line: 296, type: !45, scopeLine: 296, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!45 = !DISubroutineType(types: !46)
!46 = !{!42, !47, !48}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!48 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !33, file: !31, line: 314, baseType: !51, flags: DIFlagStaticMember)
!51 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !52)
!52 = !DICompositeType(tag: DW_TAG_structure_type, name: "__Y", scope: !33, file: !31, line: 298, size: 8, flags: DIFlagFwdDecl, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YE")
!53 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !33, file: !31, line: 318, baseType: !54, flags: DIFlagStaticMember)
!54 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !55)
!55 = !DICompositeType(tag: DW_TAG_structure_type, name: "__Z", scope: !33, file: !31, line: 302, size: 8, flags: DIFlagFwdDecl, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZE")
!56 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxEcv4dim3Ev", scope: !33, file: !31, line: 320, type: !57, scopeLine: 320, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !60}
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !15, line: 1034, baseType: !14)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!61 = !{!62}
!62 = !DITemplateTypeParameter(name: "F", type: !63)
!63 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_ThreadIdx", file: !31, line: 270, size: 8, flags: DIFlagTypePassByValue, elements: !64, identifier: "_ZTS15__HIP_ThreadIdx")
!64 = !{!65}
!65 = !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !63, file: !31, line: 272, type: !66, scopeLine: 272, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!66 = !DISubroutineType(types: !67)
!67 = !{!18, !68, !18}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !63)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "x", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE", scope: !0, file: !31, line: 310, type: !36, isLocal: false, isDefinition: true, declaration: !35, memorySpace: DW_MSPACE_LLVM_constant)
!72 = !{!73, !81, !88, !90, !92, !96, !98, !100, !102, !104, !106, !108, !110, !115, !119, !121, !123, !128, !130, !132, !134, !136, !138, !140, !143, !146, !148, !152, !157, !159, !161, !163, !165, !167, !169, !171, !173, !175, !177, !181, !185, !187, !189, !191, !193, !195, !197, !199, !201, !203, !205, !207, !209, !211, !213, !215, !219, !223, !227, !229, !231, !233, !235, !237, !239, !241, !243, !245, !249, !253, !257, !259, !261, !263, !268, !272, !276, !278, !280, !282, !284, !286, !288, !290, !292, !294, !296, !298, !300, !305, !309, !313, !315, !317, !319, !326, !330, !334, !336, !338, !340, !342, !344, !346, !350, !354, !356, !358, !360, !362, !366, !370, !374, !376, !378, !380, !382, !384, !386, !390, !394, !398, !400, !404, !408, !410, !412, !414, !416, !418, !420, !424, !428, !434, !438, !446, !451, !453, !456, !460, !464, !475, !477, !481, !485, !489, !494, !498, !502, !506, !510, !518, !522, !526, !528, !532, !536, !540, !546, !550, !554, !556, !564, !568, !574, !576, !580, !584, !588, !592, !597, !601, !605, !606, !607, !608, !610, !611, !612, !613, !614, !615, !616, !618, !619, !620, !621, !622, !623, !624, !626, !627, !628, !629, !630, !631, !632, !633, !634, !635, !636, !637, !638, !639, !640, !641, !642, !643, !644, !645, !646, !647, !648, !649, !650, !654, !658, !661, !663, !665, !667, !669, !671, !673, !675, !677, !679, !681, !683, !685, !687, !689, !691, !693, !695, !697, !699, !701, !703, !705, !707, !709, !711, !715, !717, !719, !724, !728, !730, !732, !734, !736, !738, !740, !742, !744, !746, !748, !750, !752, !754, !756, !758, !760, !762, !764, !766, !768, !770, !775, !777, !779, !781, !783, !785, !787, !789, !791, !793, !795, !797, !799, !801, !803, !805, !807, !809, !811, !813, !817, !819, !821, !823, !825, !827, !829, !831, !833, !835, !837, !839, !841, !843, !845, !847, !849, !851, !853, !855, !857, !859, !861, !863, !865, !867, !869, !871, !873, !875, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !897, !899, !901, !903, !905, !907, !909, !911, !913, !915, !917, !919, !921, !923, !925, !942, !945, !950, !1008, !1013, !1017, !1021, !1025, !1029, !1031, !1033, !1037, !1043, !1047, !1053, !1059, !1061, !1065, !1069, !1073, !1077, !1085, !1087, !1091, !1095, !1099, !1101, !1105, !1109, !1113, !1115, !1117, !1121, !1142, !1146, !1150, !1154, !1156, !1162, !1164, !1170, !1174, !1178, !1182, !1186, !1190, !1194, !1196, !1198, !1202, !1206, !1210, !1212, !1216, !1220, !1222, !1224, !1228, !1232, !1236, !1240, !1241, !1242, !1243, !1244, !1245, !1246, !1247, !1248, !1249, !1250, !1255, !1259, !1262, !1265, !1268, !1270, !1272, !1274, !1277, !1280, !1283, !1286, !1289, !1291, !1295, !1298, !1299, !1302, !1304, !1306, !1308, !1310, !1313, !1316, !1319, !1322, !1325, !1327, !1331, !1335, !1340, !1344, !1346, !1348, !1350, !1352, !1354, !1356, !1358, !1360, !1362, !1364, !1366, !1368, !1370, !1374, !1380, !1385, !1389, !1391, !1393, !1395, !1397, !1404, !1408, !1412, !1416, !1420, !1424, !1429, !1433, !1435, !1439, !1445, !1449, !1454, !1456, !1459, !1463, !1467, !1469, !1471, !1473, !1475, !1479, !1481, !1483, !1487, !1491, !1495, !1499, !1503, !1507, !1509, !1513, !1517, !1521, !1525, !1527, !1529, !1533, !1537, !1538, !1539, !1540, !1541, !1542, !1548, !1551, !1552, !1554, !1556, !1558, !1560, !1564, !1566, !1568, !1570, !1572, !1574, !1576, !1578, !1580, !1584, !1588, !1590, !1594, !1598, !1603, !1607, !1608, !1613, !1617, !1622, !1627, !1631, !1637, !1641, !1643, !1647, !1654, !1659, !1664, !1666, !1669, !1674, !1680, !1684, !1689, !1691, !1695, !1699, !1701, !1703, !1705, !1709, !1713, !1717, !1721, !1725, !1727, !1729, !1731, !1735, !1739, !1743, !1745}
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !75, file: !80, line: 52)
!74 = !DINamespace(name: "std", scope: null)
!75 = !DISubprogram(name: "abs", scope: !76, file: !76, line: 837, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!76 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "d0b67d4c866748c04ac2b355c26c1c70")
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/std_abs.h", directory: "")
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !82, file: !87, line: 83)
!82 = !DISubprogram(name: "acos", scope: !83, file: !83, line: 53, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!83 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "d6f9ed6e7af49b30a088f9f753a7a51b")
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86}
!86 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!87 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cmath", directory: "")
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !89, file: !87, line: 102)
!89 = !DISubprogram(name: "asin", scope: !83, file: !83, line: 55, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !91, file: !87, line: 121)
!91 = !DISubprogram(name: "atan", scope: !83, file: !83, line: 57, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !93, file: !87, line: 140)
!93 = !DISubprogram(name: "atan2", scope: !83, file: !83, line: 59, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!94 = !DISubroutineType(types: !95)
!95 = !{!86, !86, !86}
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !97, file: !87, line: 161)
!97 = !DISubprogram(name: "ceil", scope: !83, file: !83, line: 159, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !99, file: !87, line: 180)
!99 = !DISubprogram(name: "cos", scope: !83, file: !83, line: 62, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !101, file: !87, line: 199)
!101 = !DISubprogram(name: "cosh", scope: !83, file: !83, line: 71, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !103, file: !87, line: 218)
!103 = !DISubprogram(name: "exp", scope: !83, file: !83, line: 95, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !105, file: !87, line: 237)
!105 = !DISubprogram(name: "fabs", scope: !83, file: !83, line: 162, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !107, file: !87, line: 256)
!107 = !DISubprogram(name: "floor", scope: !83, file: !83, line: 165, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !109, file: !87, line: 275)
!109 = !DISubprogram(name: "fmod", scope: !83, file: !83, line: 168, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !111, file: !87, line: 296)
!111 = !DISubprogram(name: "frexp", scope: !83, file: !83, line: 98, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!112 = !DISubroutineType(types: !113)
!113 = !{!86, !86, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !116, file: !87, line: 315)
!116 = !DISubprogram(name: "ldexp", scope: !83, file: !83, line: 101, type: !117, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!117 = !DISubroutineType(types: !118)
!118 = !{!86, !86, !79}
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !120, file: !87, line: 334)
!120 = !DISubprogram(name: "log", scope: !83, file: !83, line: 104, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !122, file: !87, line: 353)
!122 = !DISubprogram(name: "log10", scope: !83, file: !83, line: 107, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !124, file: !87, line: 372)
!124 = !DISubprogram(name: "modf", scope: !83, file: !83, line: 110, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!125 = !DISubroutineType(types: !126)
!126 = !{!86, !86, !127}
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !129, file: !87, line: 384)
!129 = !DISubprogram(name: "pow", scope: !83, file: !83, line: 140, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !131, file: !87, line: 421)
!131 = !DISubprogram(name: "sin", scope: !83, file: !83, line: 64, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !133, file: !87, line: 440)
!133 = !DISubprogram(name: "sinh", scope: !83, file: !83, line: 73, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !135, file: !87, line: 459)
!135 = !DISubprogram(name: "sqrt", scope: !83, file: !83, line: 143, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !137, file: !87, line: 478)
!137 = !DISubprogram(name: "tan", scope: !83, file: !83, line: 66, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !139, file: !87, line: 497)
!139 = !DISubprogram(name: "tanh", scope: !83, file: !83, line: 75, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !141, file: !87, line: 1065)
!141 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !142, line: 150, baseType: !86)
!142 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "c5a5a367b9358fd8d34408e944614c4d")
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !144, file: !87, line: 1066)
!144 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !142, line: 149, baseType: !145)
!145 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !147, file: !87, line: 1069)
!147 = !DISubprogram(name: "acosh", scope: !83, file: !83, line: 85, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !149, file: !87, line: 1070)
!149 = !DISubprogram(name: "acoshf", scope: !83, file: !83, line: 85, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!150 = !DISubroutineType(types: !151)
!151 = !{!145, !145}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !153, file: !87, line: 1071)
!153 = !DISubprogram(name: "acoshl", scope: !83, file: !83, line: 85, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!154 = !DISubroutineType(types: !155)
!155 = !{!156, !156}
!156 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !158, file: !87, line: 1073)
!158 = !DISubprogram(name: "asinh", scope: !83, file: !83, line: 87, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !160, file: !87, line: 1074)
!160 = !DISubprogram(name: "asinhf", scope: !83, file: !83, line: 87, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !162, file: !87, line: 1075)
!162 = !DISubprogram(name: "asinhl", scope: !83, file: !83, line: 87, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !164, file: !87, line: 1077)
!164 = !DISubprogram(name: "atanh", scope: !83, file: !83, line: 89, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !166, file: !87, line: 1078)
!166 = !DISubprogram(name: "atanhf", scope: !83, file: !83, line: 89, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !168, file: !87, line: 1079)
!168 = !DISubprogram(name: "atanhl", scope: !83, file: !83, line: 89, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !170, file: !87, line: 1081)
!170 = !DISubprogram(name: "cbrt", scope: !83, file: !83, line: 152, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !172, file: !87, line: 1082)
!172 = !DISubprogram(name: "cbrtf", scope: !83, file: !83, line: 152, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !174, file: !87, line: 1083)
!174 = !DISubprogram(name: "cbrtl", scope: !83, file: !83, line: 152, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !176, file: !87, line: 1085)
!176 = !DISubprogram(name: "copysign", scope: !83, file: !83, line: 196, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !178, file: !87, line: 1086)
!178 = !DISubprogram(name: "copysignf", scope: !83, file: !83, line: 196, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!179 = !DISubroutineType(types: !180)
!180 = !{!145, !145, !145}
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !182, file: !87, line: 1087)
!182 = !DISubprogram(name: "copysignl", scope: !83, file: !83, line: 196, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!183 = !DISubroutineType(types: !184)
!184 = !{!156, !156, !156}
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !186, file: !87, line: 1089)
!186 = !DISubprogram(name: "erf", scope: !83, file: !83, line: 228, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !188, file: !87, line: 1090)
!188 = !DISubprogram(name: "erff", scope: !83, file: !83, line: 228, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !190, file: !87, line: 1091)
!190 = !DISubprogram(name: "erfl", scope: !83, file: !83, line: 228, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !192, file: !87, line: 1093)
!192 = !DISubprogram(name: "erfc", scope: !83, file: !83, line: 229, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !194, file: !87, line: 1094)
!194 = !DISubprogram(name: "erfcf", scope: !83, file: !83, line: 229, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !196, file: !87, line: 1095)
!196 = !DISubprogram(name: "erfcl", scope: !83, file: !83, line: 229, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !198, file: !87, line: 1097)
!198 = !DISubprogram(name: "exp2", scope: !83, file: !83, line: 130, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !200, file: !87, line: 1098)
!200 = !DISubprogram(name: "exp2f", scope: !83, file: !83, line: 130, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !202, file: !87, line: 1099)
!202 = !DISubprogram(name: "exp2l", scope: !83, file: !83, line: 130, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !204, file: !87, line: 1101)
!204 = !DISubprogram(name: "expm1", scope: !83, file: !83, line: 119, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !206, file: !87, line: 1102)
!206 = !DISubprogram(name: "expm1f", scope: !83, file: !83, line: 119, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !208, file: !87, line: 1103)
!208 = !DISubprogram(name: "expm1l", scope: !83, file: !83, line: 119, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !210, file: !87, line: 1105)
!210 = !DISubprogram(name: "fdim", scope: !83, file: !83, line: 326, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !212, file: !87, line: 1106)
!212 = !DISubprogram(name: "fdimf", scope: !83, file: !83, line: 326, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !214, file: !87, line: 1107)
!214 = !DISubprogram(name: "fdiml", scope: !83, file: !83, line: 326, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !216, file: !87, line: 1109)
!216 = !DISubprogram(name: "fma", scope: !83, file: !83, line: 335, type: !217, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!217 = !DISubroutineType(types: !218)
!218 = !{!86, !86, !86, !86}
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !220, file: !87, line: 1110)
!220 = !DISubprogram(name: "fmaf", scope: !83, file: !83, line: 335, type: !221, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!221 = !DISubroutineType(types: !222)
!222 = !{!145, !145, !145, !145}
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !224, file: !87, line: 1111)
!224 = !DISubprogram(name: "fmal", scope: !83, file: !83, line: 335, type: !225, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!225 = !DISubroutineType(types: !226)
!226 = !{!156, !156, !156, !156}
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !228, file: !87, line: 1113)
!228 = !DISubprogram(name: "fmax", scope: !83, file: !83, line: 329, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !230, file: !87, line: 1114)
!230 = !DISubprogram(name: "fmaxf", scope: !83, file: !83, line: 329, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !232, file: !87, line: 1115)
!232 = !DISubprogram(name: "fmaxl", scope: !83, file: !83, line: 329, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !234, file: !87, line: 1117)
!234 = !DISubprogram(name: "fmin", scope: !83, file: !83, line: 332, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !236, file: !87, line: 1118)
!236 = !DISubprogram(name: "fminf", scope: !83, file: !83, line: 332, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !238, file: !87, line: 1119)
!238 = !DISubprogram(name: "fminl", scope: !83, file: !83, line: 332, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !240, file: !87, line: 1121)
!240 = !DISubprogram(name: "hypot", scope: !83, file: !83, line: 147, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !242, file: !87, line: 1122)
!242 = !DISubprogram(name: "hypotf", scope: !83, file: !83, line: 147, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !244, file: !87, line: 1123)
!244 = !DISubprogram(name: "hypotl", scope: !83, file: !83, line: 147, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !246, file: !87, line: 1125)
!246 = !DISubprogram(name: "ilogb", scope: !83, file: !83, line: 280, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!247 = !DISubroutineType(types: !248)
!248 = !{!79, !86}
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !250, file: !87, line: 1126)
!250 = !DISubprogram(name: "ilogbf", scope: !83, file: !83, line: 280, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!251 = !DISubroutineType(types: !252)
!252 = !{!79, !145}
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !254, file: !87, line: 1127)
!254 = !DISubprogram(name: "ilogbl", scope: !83, file: !83, line: 280, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!255 = !DISubroutineType(types: !256)
!256 = !{!79, !156}
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !258, file: !87, line: 1129)
!258 = !DISubprogram(name: "lgamma", scope: !83, file: !83, line: 230, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !260, file: !87, line: 1130)
!260 = !DISubprogram(name: "lgammaf", scope: !83, file: !83, line: 230, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !262, file: !87, line: 1131)
!262 = !DISubprogram(name: "lgammal", scope: !83, file: !83, line: 230, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !264, file: !87, line: 1134)
!264 = !DISubprogram(name: "llrint", scope: !83, file: !83, line: 316, type: !265, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!265 = !DISubroutineType(types: !266)
!266 = !{!267, !86}
!267 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !269, file: !87, line: 1135)
!269 = !DISubprogram(name: "llrintf", scope: !83, file: !83, line: 316, type: !270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!270 = !DISubroutineType(types: !271)
!271 = !{!267, !145}
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !273, file: !87, line: 1136)
!273 = !DISubprogram(name: "llrintl", scope: !83, file: !83, line: 316, type: !274, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!274 = !DISubroutineType(types: !275)
!275 = !{!267, !156}
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !277, file: !87, line: 1138)
!277 = !DISubprogram(name: "llround", scope: !83, file: !83, line: 322, type: !265, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !279, file: !87, line: 1139)
!279 = !DISubprogram(name: "llroundf", scope: !83, file: !83, line: 322, type: !270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !281, file: !87, line: 1140)
!281 = !DISubprogram(name: "llroundl", scope: !83, file: !83, line: 322, type: !274, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !283, file: !87, line: 1143)
!283 = !DISubprogram(name: "log1p", scope: !83, file: !83, line: 122, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !285, file: !87, line: 1144)
!285 = !DISubprogram(name: "log1pf", scope: !83, file: !83, line: 122, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !287, file: !87, line: 1145)
!287 = !DISubprogram(name: "log1pl", scope: !83, file: !83, line: 122, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !289, file: !87, line: 1147)
!289 = !DISubprogram(name: "log2", scope: !83, file: !83, line: 133, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !291, file: !87, line: 1148)
!291 = !DISubprogram(name: "log2f", scope: !83, file: !83, line: 133, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !293, file: !87, line: 1149)
!293 = !DISubprogram(name: "log2l", scope: !83, file: !83, line: 133, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !295, file: !87, line: 1151)
!295 = !DISubprogram(name: "logb", scope: !83, file: !83, line: 125, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !297, file: !87, line: 1152)
!297 = !DISubprogram(name: "logbf", scope: !83, file: !83, line: 125, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !299, file: !87, line: 1153)
!299 = !DISubprogram(name: "logbl", scope: !83, file: !83, line: 125, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !301, file: !87, line: 1155)
!301 = !DISubprogram(name: "lrint", scope: !83, file: !83, line: 314, type: !302, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!302 = !DISubroutineType(types: !303)
!303 = !{!304, !86}
!304 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !306, file: !87, line: 1156)
!306 = !DISubprogram(name: "lrintf", scope: !83, file: !83, line: 314, type: !307, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!307 = !DISubroutineType(types: !308)
!308 = !{!304, !145}
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !310, file: !87, line: 1157)
!310 = !DISubprogram(name: "lrintl", scope: !83, file: !83, line: 314, type: !311, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!311 = !DISubroutineType(types: !312)
!312 = !{!304, !156}
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !314, file: !87, line: 1159)
!314 = !DISubprogram(name: "lround", scope: !83, file: !83, line: 320, type: !302, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !316, file: !87, line: 1160)
!316 = !DISubprogram(name: "lroundf", scope: !83, file: !83, line: 320, type: !307, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !318, file: !87, line: 1161)
!318 = !DISubprogram(name: "lroundl", scope: !83, file: !83, line: 320, type: !311, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !320, file: !87, line: 1163)
!320 = !DISubprogram(name: "nan", scope: !83, file: !83, line: 201, type: !321, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!321 = !DISubroutineType(types: !322)
!322 = !{!86, !323}
!323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !324, size: 64)
!324 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !325)
!325 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !327, file: !87, line: 1164)
!327 = !DISubprogram(name: "nanf", scope: !83, file: !83, line: 201, type: !328, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!328 = !DISubroutineType(types: !329)
!329 = !{!145, !323}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !331, file: !87, line: 1165)
!331 = !DISubprogram(name: "nanl", scope: !83, file: !83, line: 201, type: !332, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!332 = !DISubroutineType(types: !333)
!333 = !{!156, !323}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !335, file: !87, line: 1167)
!335 = !DISubprogram(name: "nearbyint", scope: !83, file: !83, line: 294, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !337, file: !87, line: 1168)
!337 = !DISubprogram(name: "nearbyintf", scope: !83, file: !83, line: 294, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !339, file: !87, line: 1169)
!339 = !DISubprogram(name: "nearbyintl", scope: !83, file: !83, line: 294, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !341, file: !87, line: 1171)
!341 = !DISubprogram(name: "nextafter", scope: !83, file: !83, line: 259, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !343, file: !87, line: 1172)
!343 = !DISubprogram(name: "nextafterf", scope: !83, file: !83, line: 259, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !345, file: !87, line: 1173)
!345 = !DISubprogram(name: "nextafterl", scope: !83, file: !83, line: 259, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !347, file: !87, line: 1175)
!347 = !DISubprogram(name: "nexttoward", scope: !83, file: !83, line: 261, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!348 = !DISubroutineType(types: !349)
!349 = !{!86, !86, !156}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !351, file: !87, line: 1176)
!351 = !DISubprogram(name: "nexttowardf", scope: !83, file: !83, line: 261, type: !352, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!352 = !DISubroutineType(types: !353)
!353 = !{!145, !145, !156}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !355, file: !87, line: 1177)
!355 = !DISubprogram(name: "nexttowardl", scope: !83, file: !83, line: 261, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !357, file: !87, line: 1179)
!357 = !DISubprogram(name: "remainder", scope: !83, file: !83, line: 272, type: !94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !359, file: !87, line: 1180)
!359 = !DISubprogram(name: "remainderf", scope: !83, file: !83, line: 272, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !361, file: !87, line: 1181)
!361 = !DISubprogram(name: "remainderl", scope: !83, file: !83, line: 272, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !363, file: !87, line: 1183)
!363 = !DISubprogram(name: "remquo", scope: !83, file: !83, line: 307, type: !364, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!364 = !DISubroutineType(types: !365)
!365 = !{!86, !86, !86, !114}
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !367, file: !87, line: 1184)
!367 = !DISubprogram(name: "remquof", scope: !83, file: !83, line: 307, type: !368, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!368 = !DISubroutineType(types: !369)
!369 = !{!145, !145, !145, !114}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !371, file: !87, line: 1185)
!371 = !DISubprogram(name: "remquol", scope: !83, file: !83, line: 307, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!372 = !DISubroutineType(types: !373)
!373 = !{!156, !156, !156, !114}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !375, file: !87, line: 1187)
!375 = !DISubprogram(name: "rint", scope: !83, file: !83, line: 256, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !377, file: !87, line: 1188)
!377 = !DISubprogram(name: "rintf", scope: !83, file: !83, line: 256, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !379, file: !87, line: 1189)
!379 = !DISubprogram(name: "rintl", scope: !83, file: !83, line: 256, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !381, file: !87, line: 1191)
!381 = !DISubprogram(name: "round", scope: !83, file: !83, line: 298, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !383, file: !87, line: 1192)
!383 = !DISubprogram(name: "roundf", scope: !83, file: !83, line: 298, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !385, file: !87, line: 1193)
!385 = !DISubprogram(name: "roundl", scope: !83, file: !83, line: 298, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !387, file: !87, line: 1195)
!387 = !DISubprogram(name: "scalbln", scope: !83, file: !83, line: 290, type: !388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!388 = !DISubroutineType(types: !389)
!389 = !{!86, !86, !304}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !391, file: !87, line: 1196)
!391 = !DISubprogram(name: "scalblnf", scope: !83, file: !83, line: 290, type: !392, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!392 = !DISubroutineType(types: !393)
!393 = !{!145, !145, !304}
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !395, file: !87, line: 1197)
!395 = !DISubprogram(name: "scalblnl", scope: !83, file: !83, line: 290, type: !396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!396 = !DISubroutineType(types: !397)
!397 = !{!156, !156, !304}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !399, file: !87, line: 1199)
!399 = !DISubprogram(name: "scalbn", scope: !83, file: !83, line: 276, type: !117, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !401, file: !87, line: 1200)
!401 = !DISubprogram(name: "scalbnf", scope: !83, file: !83, line: 276, type: !402, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!402 = !DISubroutineType(types: !403)
!403 = !{!145, !145, !79}
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !405, file: !87, line: 1201)
!405 = !DISubprogram(name: "scalbnl", scope: !83, file: !83, line: 276, type: !406, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!406 = !DISubroutineType(types: !407)
!407 = !{!156, !156, !79}
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !409, file: !87, line: 1203)
!409 = !DISubprogram(name: "tgamma", scope: !83, file: !83, line: 235, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !411, file: !87, line: 1204)
!411 = !DISubprogram(name: "tgammaf", scope: !83, file: !83, line: 235, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !413, file: !87, line: 1205)
!413 = !DISubprogram(name: "tgammal", scope: !83, file: !83, line: 235, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !415, file: !87, line: 1207)
!415 = !DISubprogram(name: "trunc", scope: !83, file: !83, line: 302, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !417, file: !87, line: 1208)
!417 = !DISubprogram(name: "truncf", scope: !83, file: !83, line: 302, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !419, file: !87, line: 1209)
!419 = !DISubprogram(name: "truncl", scope: !83, file: !83, line: 302, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!420 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !421, entity: !422, file: !423, line: 58)
!421 = !DINamespace(name: "__gnu_debug", scope: null)
!422 = !DINamespace(name: "__debug", scope: !74)
!423 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "c69f68f2d2cbac034a41bb7ce5c36465")
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !425, file: !427, line: 127)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !76, line: 62, baseType: !426)
!426 = !DICompositeType(tag: DW_TAG_structure_type, file: !76, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!427 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdlib", directory: "")
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !429, file: !427, line: 128)
!429 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !76, line: 70, baseType: !430)
!430 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !76, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !431, identifier: "_ZTS6ldiv_t")
!431 = !{!432, !433}
!432 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !430, file: !76, line: 68, baseType: !304, size: 64)
!433 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !430, file: !76, line: 69, baseType: !304, size: 64, offset: 64)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !435, file: !427, line: 130)
!435 = !DISubprogram(name: "abort", scope: !76, file: !76, line: 588, type: !436, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!436 = !DISubroutineType(types: !437)
!437 = !{null}
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !439, file: !427, line: 132)
!439 = !DISubprogram(name: "aligned_alloc", scope: !76, file: !76, line: 583, type: !440, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!440 = !DISubroutineType(types: !441)
!441 = !{!442, !443, !443}
!442 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!443 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !444, line: 46, baseType: !445)
!444 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "d1776268f398bd1ca997c840ad581432")
!445 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !447, file: !427, line: 134)
!447 = !DISubprogram(name: "atexit", scope: !76, file: !76, line: 592, type: !448, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!448 = !DISubroutineType(types: !449)
!449 = !{!79, !450}
!450 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !436, size: 64)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !452, file: !427, line: 137)
!452 = !DISubprogram(name: "at_quick_exit", scope: !76, file: !76, line: 597, type: !448, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !454, file: !427, line: 140)
!454 = !DISubprogram(name: "atof", scope: !455, file: !455, line: 25, type: !321, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!455 = !DIFile(filename: "/usr/include/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "ce60958b260b171e83db3307f1d644f0")
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !457, file: !427, line: 141)
!457 = !DISubprogram(name: "atoi", scope: !76, file: !76, line: 361, type: !458, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!458 = !DISubroutineType(types: !459)
!459 = !{!79, !323}
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !461, file: !427, line: 142)
!461 = !DISubprogram(name: "atol", scope: !76, file: !76, line: 366, type: !462, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!462 = !DISubroutineType(types: !463)
!463 = !{!304, !323}
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !465, file: !427, line: 143)
!465 = !DISubprogram(name: "bsearch", scope: !466, file: !466, line: 20, type: !467, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!466 = !DIFile(filename: "/usr/include/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "1a798a38b25adee7bb680abce9ef568a")
!467 = !DISubroutineType(types: !468)
!468 = !{!442, !469, !469, !443, !443, !471}
!469 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !470, size: 64)
!470 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!471 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !76, line: 805, baseType: !472)
!472 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !473, size: 64)
!473 = !DISubroutineType(types: !474)
!474 = !{!79, !469, !469}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !476, file: !427, line: 144)
!476 = !DISubprogram(name: "calloc", scope: !76, file: !76, line: 541, type: !440, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !478, file: !427, line: 145)
!478 = !DISubprogram(name: "div", scope: !76, file: !76, line: 849, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!479 = !DISubroutineType(types: !480)
!480 = !{!425, !79, !79}
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !482, file: !427, line: 146)
!482 = !DISubprogram(name: "exit", scope: !76, file: !76, line: 614, type: !483, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!483 = !DISubroutineType(types: !484)
!484 = !{null, !79}
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !486, file: !427, line: 147)
!486 = !DISubprogram(name: "free", scope: !76, file: !76, line: 563, type: !487, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!487 = !DISubroutineType(types: !488)
!488 = !{null, !442}
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !490, file: !427, line: 148)
!490 = !DISubprogram(name: "getenv", scope: !76, file: !76, line: 631, type: !491, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!491 = !DISubroutineType(types: !492)
!492 = !{!493, !323}
!493 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !325, size: 64)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !495, file: !427, line: 149)
!495 = !DISubprogram(name: "labs", scope: !76, file: !76, line: 838, type: !496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!496 = !DISubroutineType(types: !497)
!497 = !{!304, !304}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !499, file: !427, line: 150)
!499 = !DISubprogram(name: "ldiv", scope: !76, file: !76, line: 851, type: !500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!500 = !DISubroutineType(types: !501)
!501 = !{!429, !304, !304}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !503, file: !427, line: 151)
!503 = !DISubprogram(name: "malloc", scope: !76, file: !76, line: 539, type: !504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!504 = !DISubroutineType(types: !505)
!505 = !{!442, !443}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !507, file: !427, line: 153)
!507 = !DISubprogram(name: "mblen", scope: !76, file: !76, line: 919, type: !508, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!508 = !DISubroutineType(types: !509)
!509 = !{!79, !323, !443}
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !511, file: !427, line: 154)
!511 = !DISubprogram(name: "mbstowcs", scope: !76, file: !76, line: 930, type: !512, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!512 = !DISubroutineType(types: !513)
!513 = !{!443, !514, !517, !443}
!514 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !515)
!515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !516, size: 64)
!516 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!517 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !323)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !519, file: !427, line: 155)
!519 = !DISubprogram(name: "mbtowc", scope: !76, file: !76, line: 922, type: !520, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!520 = !DISubroutineType(types: !521)
!521 = !{!79, !514, !517, !443}
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !523, file: !427, line: 157)
!523 = !DISubprogram(name: "qsort", scope: !76, file: !76, line: 827, type: !524, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!524 = !DISubroutineType(types: !525)
!525 = !{null, !442, !443, !443, !471}
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !527, file: !427, line: 160)
!527 = !DISubprogram(name: "quick_exit", scope: !76, file: !76, line: 620, type: !483, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !529, file: !427, line: 163)
!529 = !DISubprogram(name: "rand", scope: !76, file: !76, line: 453, type: !530, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!530 = !DISubroutineType(types: !531)
!531 = !{!79}
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !533, file: !427, line: 164)
!533 = !DISubprogram(name: "realloc", scope: !76, file: !76, line: 549, type: !534, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!534 = !DISubroutineType(types: !535)
!535 = !{!442, !442, !443}
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !537, file: !427, line: 165)
!537 = !DISubprogram(name: "srand", scope: !76, file: !76, line: 455, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!538 = !DISubroutineType(types: !539)
!539 = !{null, !6}
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !541, file: !427, line: 166)
!541 = !DISubprogram(name: "strtod", scope: !76, file: !76, line: 117, type: !542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!542 = !DISubroutineType(types: !543)
!543 = !{!86, !517, !544}
!544 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !545)
!545 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !493, size: 64)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !547, file: !427, line: 167)
!547 = !DISubprogram(name: "strtol", scope: !76, file: !76, line: 176, type: !548, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!548 = !DISubroutineType(types: !549)
!549 = !{!304, !517, !544, !79}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !551, file: !427, line: 168)
!551 = !DISubprogram(name: "strtoul", scope: !76, file: !76, line: 180, type: !552, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!552 = !DISubroutineType(types: !553)
!553 = !{!445, !517, !544, !79}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !555, file: !427, line: 169)
!555 = !DISubprogram(name: "system", scope: !76, file: !76, line: 781, type: !458, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !557, file: !427, line: 171)
!557 = !DISubprogram(name: "wcstombs", scope: !76, file: !76, line: 933, type: !558, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!558 = !DISubroutineType(types: !559)
!559 = !{!443, !560, !561, !443}
!560 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !493)
!561 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !562)
!562 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !563, size: 64)
!563 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !516)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !565, file: !427, line: 172)
!565 = !DISubprogram(name: "wctomb", scope: !76, file: !76, line: 926, type: !566, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!566 = !DISubroutineType(types: !567)
!567 = !{!79, !493, !516}
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !569, file: !427, line: 200)
!569 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !76, line: 80, baseType: !570)
!570 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !76, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !571, identifier: "_ZTS7lldiv_t")
!571 = !{!572, !573}
!572 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !570, file: !76, line: 78, baseType: !267, size: 64)
!573 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !570, file: !76, line: 79, baseType: !267, size: 64, offset: 64)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !575, file: !427, line: 206)
!575 = !DISubprogram(name: "_Exit", scope: !76, file: !76, line: 626, type: !483, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !577, file: !427, line: 210)
!577 = !DISubprogram(name: "llabs", scope: !76, file: !76, line: 841, type: !578, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!578 = !DISubroutineType(types: !579)
!579 = !{!267, !267}
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !581, file: !427, line: 216)
!581 = !DISubprogram(name: "lldiv", scope: !76, file: !76, line: 855, type: !582, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!582 = !DISubroutineType(types: !583)
!583 = !{!569, !267, !267}
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !585, file: !427, line: 227)
!585 = !DISubprogram(name: "atoll", scope: !76, file: !76, line: 373, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!586 = !DISubroutineType(types: !587)
!587 = !{!267, !323}
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !589, file: !427, line: 228)
!589 = !DISubprogram(name: "strtoll", scope: !76, file: !76, line: 200, type: !590, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!590 = !DISubroutineType(types: !591)
!591 = !{!267, !517, !544, !79}
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !593, file: !427, line: 229)
!593 = !DISubprogram(name: "strtoull", scope: !76, file: !76, line: 205, type: !594, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!594 = !DISubroutineType(types: !595)
!595 = !{!596, !517, !544, !79}
!596 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !598, file: !427, line: 231)
!598 = !DISubprogram(name: "strtof", scope: !76, file: !76, line: 123, type: !599, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!599 = !DISubroutineType(types: !600)
!600 = !{!145, !517, !544}
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !602, file: !427, line: 232)
!602 = !DISubprogram(name: "strtold", scope: !76, file: !76, line: 126, type: !603, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!603 = !DISubroutineType(types: !604)
!604 = !{!156, !517, !544}
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !569, file: !427, line: 240)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !575, file: !427, line: 242)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !577, file: !427, line: 244)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !609, file: !427, line: 245)
!609 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !5, file: !427, line: 213, type: !582, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !581, file: !427, line: 246)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !585, file: !427, line: 248)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !598, file: !427, line: 249)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !589, file: !427, line: 250)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !593, file: !427, line: 251)
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !602, file: !427, line: 252)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !435, file: !617, line: 38)
!617 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "74812296ae1ebf65f0c19983efc04bc1")
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !447, file: !617, line: 39)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !482, file: !617, line: 40)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !452, file: !617, line: 43)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !527, file: !617, line: 46)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !425, file: !617, line: 51)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !429, file: !617, line: 52)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !625, file: !617, line: 54)
!625 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !74, file: !80, line: 79, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !454, file: !617, line: 55)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !457, file: !617, line: 56)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !461, file: !617, line: 57)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !465, file: !617, line: 58)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !476, file: !617, line: 59)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !609, file: !617, line: 60)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !486, file: !617, line: 61)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !490, file: !617, line: 62)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !495, file: !617, line: 63)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !499, file: !617, line: 64)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !503, file: !617, line: 65)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !507, file: !617, line: 67)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !511, file: !617, line: 68)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !519, file: !617, line: 69)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !523, file: !617, line: 71)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !529, file: !617, line: 72)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !533, file: !617, line: 73)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !537, file: !617, line: 74)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !541, file: !617, line: 75)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !547, file: !617, line: 76)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !551, file: !617, line: 77)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !555, file: !617, line: 78)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !557, file: !617, line: 80)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !565, file: !617, line: 81)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !651, file: !652, line: 58)
!651 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !653, file: !652, line: 80, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!652 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "9bda7d21a11cfdb902745e8f6fa7810a")
!653 = !DINamespace(name: "__exception_ptr", scope: !74)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !653, entity: !655, file: !652, line: 74)
!655 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !74, file: !652, line: 70, type: !656, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!656 = !DISubroutineType(types: !657)
!657 = !{null, !651}
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !659, file: !660, line: 200)
!659 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !660, file: !660, line: 28, type: !84, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!660 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !662, file: !660, line: 201)
!662 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !660, file: !660, line: 32, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !664, file: !660, line: 202)
!664 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !660, file: !660, line: 34, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !666, file: !660, line: 203)
!666 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !660, file: !660, line: 36, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !668, file: !660, line: 204)
!668 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !660, file: !660, line: 38, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !670, file: !660, line: 205)
!670 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !660, file: !660, line: 42, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !672, file: !660, line: 206)
!672 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !660, file: !660, line: 40, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !674, file: !660, line: 207)
!674 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !660, file: !660, line: 44, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !676, file: !660, line: 208)
!676 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !660, file: !660, line: 46, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !678, file: !660, line: 209)
!678 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !660, file: !660, line: 48, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !680, file: !660, line: 210)
!680 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !660, file: !660, line: 50, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !682, file: !660, line: 211)
!682 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !660, file: !660, line: 52, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !684, file: !660, line: 212)
!684 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !660, file: !660, line: 54, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !686, file: !660, line: 213)
!686 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !660, file: !660, line: 58, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !688, file: !660, line: 214)
!688 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !660, file: !660, line: 56, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !690, file: !660, line: 215)
!690 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !660, file: !660, line: 62, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !692, file: !660, line: 216)
!692 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !660, file: !660, line: 60, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !694, file: !660, line: 217)
!694 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !660, file: !660, line: 64, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !696, file: !660, line: 218)
!696 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !660, file: !660, line: 66, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !698, file: !660, line: 219)
!698 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !660, file: !660, line: 68, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !700, file: !660, line: 220)
!700 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !660, file: !660, line: 70, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !702, file: !660, line: 221)
!702 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !660, file: !660, line: 72, type: !221, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !704, file: !660, line: 222)
!704 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !660, file: !660, line: 74, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !706, file: !660, line: 223)
!706 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !660, file: !660, line: 76, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !708, file: !660, line: 224)
!708 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !660, file: !660, line: 78, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !710, file: !660, line: 225)
!710 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !660, file: !660, line: 80, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !712, file: !660, line: 226)
!712 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !660, file: !660, line: 82, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!713 = !DISubroutineType(types: !714)
!714 = !{!145, !145, !114}
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !716, file: !660, line: 227)
!716 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !660, file: !660, line: 84, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !718, file: !660, line: 228)
!718 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !660, file: !660, line: 86, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !720, file: !660, line: 229)
!720 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !660, file: !660, line: 91, type: !721, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!721 = !DISubroutineType(types: !722)
!722 = !{!723, !145}
!723 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !725, file: !660, line: 230)
!725 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !660, file: !660, line: 95, type: !726, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!726 = !DISubroutineType(types: !727)
!727 = !{!723, !145, !145}
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !729, file: !660, line: 231)
!729 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !660, file: !660, line: 94, type: !726, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !731, file: !660, line: 232)
!731 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !660, file: !660, line: 100, type: !721, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !733, file: !660, line: 233)
!733 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !660, file: !660, line: 104, type: !726, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !735, file: !660, line: 234)
!735 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !660, file: !660, line: 103, type: !726, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !737, file: !660, line: 235)
!737 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !660, file: !660, line: 106, type: !726, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !739, file: !660, line: 236)
!739 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !660, file: !660, line: 111, type: !721, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !741, file: !660, line: 237)
!741 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !660, file: !660, line: 113, type: !721, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !743, file: !660, line: 238)
!743 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !660, file: !660, line: 115, type: !726, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !745, file: !660, line: 239)
!745 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !660, file: !660, line: 116, type: !496, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !747, file: !660, line: 240)
!747 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !660, file: !660, line: 118, type: !402, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !749, file: !660, line: 241)
!749 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !660, file: !660, line: 120, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !751, file: !660, line: 242)
!751 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !660, file: !660, line: 121, type: !578, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !753, file: !660, line: 243)
!753 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !660, file: !660, line: 123, type: !270, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !755, file: !660, line: 244)
!755 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !660, file: !660, line: 133, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !757, file: !660, line: 245)
!757 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !660, file: !660, line: 125, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !759, file: !660, line: 246)
!759 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !660, file: !660, line: 127, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !761, file: !660, line: 247)
!761 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !660, file: !660, line: 129, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !763, file: !660, line: 248)
!763 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !660, file: !660, line: 131, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !765, file: !660, line: 249)
!765 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !660, file: !660, line: 135, type: !307, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !767, file: !660, line: 250)
!767 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !660, file: !660, line: 137, type: !307, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !769, file: !660, line: 251)
!769 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !660, file: !660, line: 138, type: !270, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !771, file: !660, line: 252)
!771 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !660, file: !660, line: 140, type: !772, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!772 = !DISubroutineType(types: !773)
!773 = !{!145, !145, !774}
!774 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !145, size: 64)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !776, file: !660, line: 253)
!776 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !660, file: !660, line: 141, type: !321, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !778, file: !660, line: 254)
!778 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !660, file: !660, line: 142, type: !328, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !780, file: !660, line: 255)
!780 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !660, file: !660, line: 144, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !782, file: !660, line: 256)
!782 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !660, file: !660, line: 146, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !784, file: !660, line: 257)
!784 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !660, file: !660, line: 150, type: !402, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !786, file: !660, line: 258)
!786 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !660, file: !660, line: 152, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !788, file: !660, line: 259)
!788 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !660, file: !660, line: 154, type: !368, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !790, file: !660, line: 260)
!790 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !660, file: !660, line: 156, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !792, file: !660, line: 261)
!792 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !660, file: !660, line: 158, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !794, file: !660, line: 262)
!794 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !660, file: !660, line: 160, type: !392, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !796, file: !660, line: 263)
!796 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !660, file: !660, line: 162, type: !402, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !798, file: !660, line: 264)
!798 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !660, file: !660, line: 167, type: !721, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !800, file: !660, line: 265)
!800 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !660, file: !660, line: 169, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !802, file: !660, line: 266)
!802 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !660, file: !660, line: 171, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !804, file: !660, line: 267)
!804 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !660, file: !660, line: 173, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !806, file: !660, line: 268)
!806 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !660, file: !660, line: 175, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !808, file: !660, line: 269)
!808 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !660, file: !660, line: 177, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !810, file: !660, line: 270)
!810 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !660, file: !660, line: 179, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !812, file: !660, line: 271)
!812 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !660, file: !660, line: 181, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !814, file: !816, line: 727)
!814 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !815, file: !815, line: 183, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!815 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "d4f0e84980e083350535310c8ec512a2")
!816 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "854a3dc6d81a4654631a5bce14ca059c")
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !818, file: !816, line: 728)
!818 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !815, file: !815, line: 186, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !820, file: !816, line: 729)
!820 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !815, file: !815, line: 189, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !822, file: !816, line: 730)
!822 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !815, file: !815, line: 192, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !824, file: !816, line: 731)
!824 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !815, file: !815, line: 195, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !826, file: !816, line: 732)
!826 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !815, file: !815, line: 198, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !828, file: !816, line: 733)
!828 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !815, file: !815, line: 201, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !830, file: !816, line: 734)
!830 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !815, file: !815, line: 204, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !832, file: !816, line: 735)
!832 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !815, file: !815, line: 207, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !834, file: !816, line: 736)
!834 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !815, file: !815, line: 210, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !836, file: !816, line: 737)
!836 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !815, file: !815, line: 213, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !838, file: !816, line: 738)
!838 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !815, file: !815, line: 216, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !840, file: !816, line: 739)
!840 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !815, file: !815, line: 228, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !842, file: !816, line: 740)
!842 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !815, file: !815, line: 237, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !844, file: !816, line: 741)
!844 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !815, file: !815, line: 246, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !846, file: !816, line: 742)
!846 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !815, file: !815, line: 249, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !848, file: !816, line: 743)
!848 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !815, file: !815, line: 252, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !850, file: !816, line: 744)
!850 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !815, file: !815, line: 255, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !852, file: !816, line: 745)
!852 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !815, file: !815, line: 258, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !854, file: !816, line: 746)
!854 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !815, file: !815, line: 264, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !856, file: !816, line: 747)
!856 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !815, file: !815, line: 267, type: !221, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !858, file: !816, line: 748)
!858 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !815, file: !815, line: 272, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !860, file: !816, line: 749)
!860 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !815, file: !815, line: 275, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !862, file: !816, line: 750)
!862 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !815, file: !815, line: 278, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !864, file: !816, line: 751)
!864 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !815, file: !815, line: 281, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !866, file: !816, line: 752)
!866 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !815, file: !815, line: 294, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !868, file: !816, line: 753)
!868 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !815, file: !815, line: 297, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !870, file: !816, line: 754)
!870 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !815, file: !815, line: 336, type: !402, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !872, file: !816, line: 755)
!872 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !815, file: !815, line: 339, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !874, file: !816, line: 756)
!874 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !815, file: !815, line: 342, type: !270, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !876, file: !816, line: 757)
!876 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !815, file: !815, line: 345, type: !270, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !878, file: !816, line: 758)
!878 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !815, file: !815, line: 348, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !880, file: !816, line: 759)
!880 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !815, file: !815, line: 351, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !882, file: !816, line: 760)
!882 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !815, file: !815, line: 354, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !884, file: !816, line: 761)
!884 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !815, file: !815, line: 360, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !886, file: !816, line: 762)
!886 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !815, file: !815, line: 363, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !888, file: !816, line: 763)
!888 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !815, file: !815, line: 366, type: !307, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !890, file: !816, line: 764)
!890 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !815, file: !815, line: 369, type: !307, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !892, file: !816, line: 765)
!892 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !815, file: !815, line: 372, type: !772, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !894, file: !816, line: 766)
!894 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !815, file: !815, line: 408, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !896, file: !816, line: 767)
!896 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !815, file: !815, line: 411, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !898, file: !816, line: 769)
!898 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !815, file: !815, line: 444, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !900, file: !816, line: 770)
!900 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !815, file: !815, line: 469, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !902, file: !816, line: 771)
!902 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !815, file: !815, line: 474, type: !368, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !904, file: !816, line: 772)
!904 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !815, file: !815, line: 490, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !906, file: !816, line: 773)
!906 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !815, file: !815, line: 515, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !908, file: !816, line: 774)
!908 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !815, file: !815, line: 521, type: !392, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !910, file: !816, line: 775)
!910 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !815, file: !815, line: 527, type: !402, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !912, file: !816, line: 776)
!912 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !815, file: !815, line: 555, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !914, file: !816, line: 777)
!914 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !815, file: !815, line: 558, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !916, file: !816, line: 778)
!916 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !815, file: !815, line: 564, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !918, file: !816, line: 779)
!918 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !815, file: !815, line: 567, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !920, file: !816, line: 780)
!920 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !815, file: !815, line: 570, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !922, file: !816, line: 781)
!922 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !815, file: !815, line: 573, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !924, file: !816, line: 782)
!924 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !815, file: !815, line: 576, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !926, file: !941, line: 64)
!926 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !927, line: 6, baseType: !928)
!927 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!928 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !929, line: 21, baseType: !930)
!929 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!930 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !929, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !931, identifier: "_ZTS11__mbstate_t")
!931 = !{!932, !933}
!932 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !930, file: !929, line: 15, baseType: !79, size: 32)
!933 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !930, file: !929, line: 20, baseType: !934, size: 32, offset: 32)
!934 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !930, file: !929, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !935, identifier: "_ZTSN11__mbstate_tUt_E")
!935 = !{!936, !937}
!936 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !934, file: !929, line: 18, baseType: !6, size: 32)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !934, file: !929, line: 19, baseType: !938, size: 32)
!938 = !DICompositeType(tag: DW_TAG_array_type, baseType: !325, size: 32, elements: !939)
!939 = !{!940}
!940 = !DISubrange(count: 4)
!941 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cwchar", directory: "")
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !943, file: !941, line: 141)
!943 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !944, line: 20, baseType: !6)
!944 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !946, file: !941, line: 143)
!946 = !DISubprogram(name: "btowc", scope: !947, file: !947, line: 318, type: !948, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!947 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "5c0512b032e303d7adfb2a47454ecb1c")
!948 = !DISubroutineType(types: !949)
!949 = !{!943, !79}
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !951, file: !941, line: 144)
!951 = !DISubprogram(name: "fgetwc", scope: !947, file: !947, line: 727, type: !952, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!952 = !DISubroutineType(types: !953)
!953 = !{!943, !954}
!954 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !955, size: 64)
!955 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !956, line: 5, baseType: !957)
!956 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!957 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !958, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !959, identifier: "_ZTS8_IO_FILE")
!958 = !DIFile(filename: "/usr/include/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "58de959587374b9ee900baa441e1355b")
!959 = !{!960, !961, !962, !963, !964, !965, !966, !967, !968, !969, !970, !971, !972, !975, !977, !978, !979, !981, !983, !985, !989, !992, !994, !997, !1000, !1001, !1002, !1003, !1004}
!960 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !957, file: !958, line: 51, baseType: !79, size: 32)
!961 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !957, file: !958, line: 54, baseType: !493, size: 64, offset: 64)
!962 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !957, file: !958, line: 55, baseType: !493, size: 64, offset: 128)
!963 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !957, file: !958, line: 56, baseType: !493, size: 64, offset: 192)
!964 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !957, file: !958, line: 57, baseType: !493, size: 64, offset: 256)
!965 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !957, file: !958, line: 58, baseType: !493, size: 64, offset: 320)
!966 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !957, file: !958, line: 59, baseType: !493, size: 64, offset: 384)
!967 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !957, file: !958, line: 60, baseType: !493, size: 64, offset: 448)
!968 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !957, file: !958, line: 61, baseType: !493, size: 64, offset: 512)
!969 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !957, file: !958, line: 64, baseType: !493, size: 64, offset: 576)
!970 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !957, file: !958, line: 65, baseType: !493, size: 64, offset: 640)
!971 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !957, file: !958, line: 66, baseType: !493, size: 64, offset: 704)
!972 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !957, file: !958, line: 68, baseType: !973, size: 64, offset: 768)
!973 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !974, size: 64)
!974 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !958, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!975 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !957, file: !958, line: 70, baseType: !976, size: 64, offset: 832)
!976 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !957, size: 64)
!977 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !957, file: !958, line: 72, baseType: !79, size: 32, offset: 896)
!978 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !957, file: !958, line: 73, baseType: !79, size: 32, offset: 928)
!979 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !957, file: !958, line: 74, baseType: !980, size: 64, offset: 960)
!980 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !21, line: 150, baseType: !304)
!981 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !957, file: !958, line: 77, baseType: !982, size: 16, offset: 1024)
!982 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!983 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !957, file: !958, line: 78, baseType: !984, size: 8, offset: 1040)
!984 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!985 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !957, file: !958, line: 79, baseType: !986, size: 8, offset: 1048)
!986 = !DICompositeType(tag: DW_TAG_array_type, baseType: !325, size: 8, elements: !987)
!987 = !{!988}
!988 = !DISubrange(count: 1)
!989 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !957, file: !958, line: 81, baseType: !990, size: 64, offset: 1088)
!990 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !991, size: 64)
!991 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !958, line: 43, baseType: null)
!992 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !957, file: !958, line: 89, baseType: !993, size: 64, offset: 1152)
!993 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !21, line: 151, baseType: !304)
!994 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !957, file: !958, line: 91, baseType: !995, size: 64, offset: 1216)
!995 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !996, size: 64)
!996 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !958, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!997 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !957, file: !958, line: 92, baseType: !998, size: 64, offset: 1280)
!998 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !999, size: 64)
!999 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !958, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!1000 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !957, file: !958, line: 93, baseType: !976, size: 64, offset: 1344)
!1001 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !957, file: !958, line: 94, baseType: !442, size: 64, offset: 1408)
!1002 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !957, file: !958, line: 95, baseType: !443, size: 64, offset: 1472)
!1003 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !957, file: !958, line: 96, baseType: !79, size: 32, offset: 1536)
!1004 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !957, file: !958, line: 98, baseType: !1005, size: 160, offset: 1568)
!1005 = !DICompositeType(tag: DW_TAG_array_type, baseType: !325, size: 160, elements: !1006)
!1006 = !{!1007}
!1007 = !DISubrange(count: 20)
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1009, file: !941, line: 145)
!1009 = !DISubprogram(name: "fgetws", scope: !947, file: !947, line: 756, type: !1010, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1010 = !DISubroutineType(types: !1011)
!1011 = !{!515, !514, !79, !1012}
!1012 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !954)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1014, file: !941, line: 146)
!1014 = !DISubprogram(name: "fputwc", scope: !947, file: !947, line: 741, type: !1015, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!943, !516, !954}
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1018, file: !941, line: 147)
!1018 = !DISubprogram(name: "fputws", scope: !947, file: !947, line: 763, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!79, !561, !1012}
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1022, file: !941, line: 148)
!1022 = !DISubprogram(name: "fwide", scope: !947, file: !947, line: 573, type: !1023, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!79, !954, !79}
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1026, file: !941, line: 149)
!1026 = !DISubprogram(name: "fwprintf", scope: !947, file: !947, line: 580, type: !1027, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!79, !1012, !561, null}
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1030, file: !941, line: 150)
!1030 = !DISubprogram(name: "fwscanf", scope: !947, file: !947, line: 621, type: !1027, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1032, file: !941, line: 151)
!1032 = !DISubprogram(name: "getwc", scope: !947, file: !947, line: 728, type: !952, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1034, file: !941, line: 152)
!1034 = !DISubprogram(name: "getwchar", scope: !947, file: !947, line: 734, type: !1035, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1035 = !DISubroutineType(types: !1036)
!1036 = !{!943}
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1038, file: !941, line: 153)
!1038 = !DISubprogram(name: "mbrlen", scope: !947, file: !947, line: 329, type: !1039, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1039 = !DISubroutineType(types: !1040)
!1040 = !{!443, !517, !443, !1041}
!1041 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1042)
!1042 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !926, size: 64)
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1044, file: !941, line: 154)
!1044 = !DISubprogram(name: "mbrtowc", scope: !947, file: !947, line: 296, type: !1045, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!443, !514, !517, !443, !1041}
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1048, file: !941, line: 155)
!1048 = !DISubprogram(name: "mbsinit", scope: !947, file: !947, line: 292, type: !1049, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!79, !1051}
!1051 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1052, size: 64)
!1052 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !926)
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1054, file: !941, line: 156)
!1054 = !DISubprogram(name: "mbsrtowcs", scope: !947, file: !947, line: 337, type: !1055, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1055 = !DISubroutineType(types: !1056)
!1056 = !{!443, !514, !1057, !443, !1041}
!1057 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1058)
!1058 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !323, size: 64)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1060, file: !941, line: 157)
!1060 = !DISubprogram(name: "putwc", scope: !947, file: !947, line: 742, type: !1015, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1062, file: !941, line: 158)
!1062 = !DISubprogram(name: "putwchar", scope: !947, file: !947, line: 748, type: !1063, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1063 = !DISubroutineType(types: !1064)
!1064 = !{!943, !516}
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1066, file: !941, line: 160)
!1066 = !DISubprogram(name: "swprintf", scope: !947, file: !947, line: 590, type: !1067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!79, !514, !443, !561, null}
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1070, file: !941, line: 162)
!1070 = !DISubprogram(name: "swscanf", scope: !947, file: !947, line: 631, type: !1071, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1071 = !DISubroutineType(types: !1072)
!1072 = !{!79, !561, !561, null}
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1074, file: !941, line: 163)
!1074 = !DISubprogram(name: "ungetwc", scope: !947, file: !947, line: 771, type: !1075, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!943, !943, !954}
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1078, file: !941, line: 164)
!1078 = !DISubprogram(name: "vfwprintf", scope: !947, file: !947, line: 598, type: !1079, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!79, !1012, !561, !1081}
!1081 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1082, line: 14, baseType: !1083)
!1082 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/stdarg.h", directory: "", checksumkind: CSK_MD5, checksum: "4c819f80dd915987182e9ab226e27a5a")
!1083 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1084, baseType: !493)
!1084 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard")
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1086, file: !941, line: 166)
!1086 = !DISubprogram(name: "vfwscanf", scope: !947, file: !947, line: 673, type: !1079, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1088, file: !941, line: 169)
!1088 = !DISubprogram(name: "vswprintf", scope: !947, file: !947, line: 611, type: !1089, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1089 = !DISubroutineType(types: !1090)
!1090 = !{!79, !514, !443, !561, !1081}
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1092, file: !941, line: 172)
!1092 = !DISubprogram(name: "vswscanf", scope: !947, file: !947, line: 685, type: !1093, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1093 = !DISubroutineType(types: !1094)
!1094 = !{!79, !561, !561, !1081}
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1096, file: !941, line: 174)
!1096 = !DISubprogram(name: "vwprintf", scope: !947, file: !947, line: 606, type: !1097, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1097 = !DISubroutineType(types: !1098)
!1098 = !{!79, !561, !1081}
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1100, file: !941, line: 176)
!1100 = !DISubprogram(name: "vwscanf", scope: !947, file: !947, line: 681, type: !1097, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1102, file: !941, line: 178)
!1102 = !DISubprogram(name: "wcrtomb", scope: !947, file: !947, line: 301, type: !1103, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!443, !560, !516, !1041}
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1106, file: !941, line: 179)
!1106 = !DISubprogram(name: "wcscat", scope: !947, file: !947, line: 97, type: !1107, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{!515, !514, !561}
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1110, file: !941, line: 180)
!1110 = !DISubprogram(name: "wcscmp", scope: !947, file: !947, line: 106, type: !1111, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1111 = !DISubroutineType(types: !1112)
!1112 = !{!79, !562, !562}
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1114, file: !941, line: 181)
!1114 = !DISubprogram(name: "wcscoll", scope: !947, file: !947, line: 131, type: !1111, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1116, file: !941, line: 182)
!1116 = !DISubprogram(name: "wcscpy", scope: !947, file: !947, line: 87, type: !1107, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1118, file: !941, line: 183)
!1118 = !DISubprogram(name: "wcscspn", scope: !947, file: !947, line: 187, type: !1119, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1119 = !DISubroutineType(types: !1120)
!1120 = !{!443, !562, !562}
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1122, file: !941, line: 184)
!1122 = !DISubprogram(name: "wcsftime", scope: !947, file: !947, line: 835, type: !1123, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{!443, !514, !443, !561, !1125}
!1125 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1126)
!1126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1127, size: 64)
!1127 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1128)
!1128 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1129, line: 7, size: 448, flags: DIFlagTypePassByValue, elements: !1130, identifier: "_ZTS2tm")
!1129 = !DIFile(filename: "/usr/include/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!1130 = !{!1131, !1132, !1133, !1134, !1135, !1136, !1137, !1138, !1139, !1140, !1141}
!1131 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !1128, file: !1129, line: 9, baseType: !79, size: 32)
!1132 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !1128, file: !1129, line: 10, baseType: !79, size: 32, offset: 32)
!1133 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !1128, file: !1129, line: 11, baseType: !79, size: 32, offset: 64)
!1134 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !1128, file: !1129, line: 12, baseType: !79, size: 32, offset: 96)
!1135 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !1128, file: !1129, line: 13, baseType: !79, size: 32, offset: 128)
!1136 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !1128, file: !1129, line: 14, baseType: !79, size: 32, offset: 160)
!1137 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !1128, file: !1129, line: 15, baseType: !79, size: 32, offset: 192)
!1138 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !1128, file: !1129, line: 16, baseType: !79, size: 32, offset: 224)
!1139 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !1128, file: !1129, line: 17, baseType: !79, size: 32, offset: 256)
!1140 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !1128, file: !1129, line: 20, baseType: !304, size: 64, offset: 320)
!1141 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !1128, file: !1129, line: 21, baseType: !323, size: 64, offset: 384)
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1143, file: !941, line: 185)
!1143 = !DISubprogram(name: "wcslen", scope: !947, file: !947, line: 222, type: !1144, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1144 = !DISubroutineType(types: !1145)
!1145 = !{!443, !562}
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1147, file: !941, line: 186)
!1147 = !DISubprogram(name: "wcsncat", scope: !947, file: !947, line: 101, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1148 = !DISubroutineType(types: !1149)
!1149 = !{!515, !514, !561, !443}
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1151, file: !941, line: 187)
!1151 = !DISubprogram(name: "wcsncmp", scope: !947, file: !947, line: 109, type: !1152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1152 = !DISubroutineType(types: !1153)
!1153 = !{!79, !562, !562, !443}
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1155, file: !941, line: 188)
!1155 = !DISubprogram(name: "wcsncpy", scope: !947, file: !947, line: 92, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1157, file: !941, line: 189)
!1157 = !DISubprogram(name: "wcsrtombs", scope: !947, file: !947, line: 343, type: !1158, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1158 = !DISubroutineType(types: !1159)
!1159 = !{!443, !560, !1160, !443, !1041}
!1160 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1161)
!1161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !562, size: 64)
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1163, file: !941, line: 190)
!1163 = !DISubprogram(name: "wcsspn", scope: !947, file: !947, line: 191, type: !1119, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1165, file: !941, line: 191)
!1165 = !DISubprogram(name: "wcstod", scope: !947, file: !947, line: 377, type: !1166, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1166 = !DISubroutineType(types: !1167)
!1167 = !{!86, !561, !1168}
!1168 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1169)
!1169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !515, size: 64)
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1171, file: !941, line: 193)
!1171 = !DISubprogram(name: "wcstof", scope: !947, file: !947, line: 382, type: !1172, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1172 = !DISubroutineType(types: !1173)
!1173 = !{!145, !561, !1168}
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1175, file: !941, line: 195)
!1175 = !DISubprogram(name: "wcstok", scope: !947, file: !947, line: 217, type: !1176, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1176 = !DISubroutineType(types: !1177)
!1177 = !{!515, !514, !561, !1168}
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1179, file: !941, line: 196)
!1179 = !DISubprogram(name: "wcstol", scope: !947, file: !947, line: 428, type: !1180, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1180 = !DISubroutineType(types: !1181)
!1181 = !{!304, !561, !1168, !79}
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1183, file: !941, line: 197)
!1183 = !DISubprogram(name: "wcstoul", scope: !947, file: !947, line: 433, type: !1184, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1184 = !DISubroutineType(types: !1185)
!1185 = !{!445, !561, !1168, !79}
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1187, file: !941, line: 198)
!1187 = !DISubprogram(name: "wcsxfrm", scope: !947, file: !947, line: 135, type: !1188, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1188 = !DISubroutineType(types: !1189)
!1189 = !{!443, !514, !561, !443}
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1191, file: !941, line: 199)
!1191 = !DISubprogram(name: "wctob", scope: !947, file: !947, line: 324, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1192 = !DISubroutineType(types: !1193)
!1193 = !{!79, !943}
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1195, file: !941, line: 200)
!1195 = !DISubprogram(name: "wmemcmp", scope: !947, file: !947, line: 258, type: !1152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1197, file: !941, line: 201)
!1197 = !DISubprogram(name: "wmemcpy", scope: !947, file: !947, line: 262, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1199, file: !941, line: 202)
!1199 = !DISubprogram(name: "wmemmove", scope: !947, file: !947, line: 267, type: !1200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1200 = !DISubroutineType(types: !1201)
!1201 = !{!515, !515, !562, !443}
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1203, file: !941, line: 203)
!1203 = !DISubprogram(name: "wmemset", scope: !947, file: !947, line: 271, type: !1204, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1204 = !DISubroutineType(types: !1205)
!1205 = !{!515, !515, !516, !443}
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1207, file: !941, line: 204)
!1207 = !DISubprogram(name: "wprintf", scope: !947, file: !947, line: 587, type: !1208, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1208 = !DISubroutineType(types: !1209)
!1209 = !{!79, !561, null}
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1211, file: !941, line: 205)
!1211 = !DISubprogram(name: "wscanf", scope: !947, file: !947, line: 628, type: !1208, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1213, file: !941, line: 206)
!1213 = !DISubprogram(name: "wcschr", scope: !947, file: !947, line: 164, type: !1214, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1214 = !DISubroutineType(types: !1215)
!1215 = !{!515, !562, !516}
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1217, file: !941, line: 207)
!1217 = !DISubprogram(name: "wcspbrk", scope: !947, file: !947, line: 201, type: !1218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1218 = !DISubroutineType(types: !1219)
!1219 = !{!515, !562, !562}
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1221, file: !941, line: 208)
!1221 = !DISubprogram(name: "wcsrchr", scope: !947, file: !947, line: 174, type: !1214, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1223, file: !941, line: 209)
!1223 = !DISubprogram(name: "wcsstr", scope: !947, file: !947, line: 212, type: !1218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1225, file: !941, line: 210)
!1225 = !DISubprogram(name: "wmemchr", scope: !947, file: !947, line: 253, type: !1226, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1226 = !DISubroutineType(types: !1227)
!1227 = !{!515, !562, !516, !443}
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1229, file: !941, line: 251)
!1229 = !DISubprogram(name: "wcstold", scope: !947, file: !947, line: 384, type: !1230, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1230 = !DISubroutineType(types: !1231)
!1231 = !{!156, !561, !1168}
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1233, file: !941, line: 260)
!1233 = !DISubprogram(name: "wcstoll", scope: !947, file: !947, line: 441, type: !1234, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1234 = !DISubroutineType(types: !1235)
!1235 = !{!267, !561, !1168, !79}
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1237, file: !941, line: 261)
!1237 = !DISubprogram(name: "wcstoull", scope: !947, file: !947, line: 448, type: !1238, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{!596, !561, !1168, !79}
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1229, file: !941, line: 267)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1233, file: !941, line: 268)
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1237, file: !941, line: 269)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1171, file: !941, line: 283)
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1086, file: !941, line: 286)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1092, file: !941, line: 289)
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1100, file: !941, line: 292)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1229, file: !941, line: 296)
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1233, file: !941, line: 297)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1237, file: !941, line: 298)
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1251, file: !1254, line: 47)
!1251 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1252, line: 24, baseType: !1253)
!1252 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "457547631e07cd24d9a14c8410e28e57")
!1253 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !21, line: 36, baseType: !984)
!1254 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdint", directory: "")
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1256, file: !1254, line: 48)
!1256 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1252, line: 25, baseType: !1257)
!1257 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !21, line: 38, baseType: !1258)
!1258 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1260, file: !1254, line: 49)
!1260 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1252, line: 26, baseType: !1261)
!1261 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !21, line: 40, baseType: !79)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1263, file: !1254, line: 50)
!1263 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1252, line: 27, baseType: !1264)
!1264 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !21, line: 43, baseType: !304)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1266, file: !1254, line: 52)
!1266 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1267, line: 58, baseType: !984)
!1267 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "5faa52c8a2d48b1d936594c77c73ce42")
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1269, file: !1254, line: 53)
!1269 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1267, line: 60, baseType: !304)
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1271, file: !1254, line: 54)
!1271 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1267, line: 61, baseType: !304)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1273, file: !1254, line: 55)
!1273 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1267, line: 62, baseType: !304)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1275, file: !1254, line: 57)
!1275 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1267, line: 43, baseType: !1276)
!1276 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !21, line: 51, baseType: !1253)
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1278, file: !1254, line: 58)
!1278 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1267, line: 44, baseType: !1279)
!1279 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !21, line: 53, baseType: !1257)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1281, file: !1254, line: 59)
!1281 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1267, line: 45, baseType: !1282)
!1282 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !21, line: 55, baseType: !1261)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1284, file: !1254, line: 60)
!1284 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1267, line: 46, baseType: !1285)
!1285 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !21, line: 57, baseType: !1264)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1287, file: !1254, line: 62)
!1287 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1267, line: 101, baseType: !1288)
!1288 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !21, line: 71, baseType: !304)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1290, file: !1254, line: 63)
!1290 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1267, line: 87, baseType: !304)
!1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1292, file: !1254, line: 65)
!1292 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !19, line: 24, baseType: !1293)
!1293 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !21, line: 37, baseType: !1294)
!1294 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1296, file: !1254, line: 66)
!1296 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !19, line: 25, baseType: !1297)
!1297 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !21, line: 39, baseType: !982)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !18, file: !1254, line: 67)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1300, file: !1254, line: 68)
!1300 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !19, line: 27, baseType: !1301)
!1301 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !21, line: 44, baseType: !445)
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1303, file: !1254, line: 70)
!1303 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1267, line: 71, baseType: !1294)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1305, file: !1254, line: 71)
!1305 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1267, line: 73, baseType: !445)
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1307, file: !1254, line: 72)
!1307 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1267, line: 74, baseType: !445)
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1309, file: !1254, line: 73)
!1309 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1267, line: 75, baseType: !445)
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1311, file: !1254, line: 75)
!1311 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1267, line: 49, baseType: !1312)
!1312 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !21, line: 52, baseType: !1293)
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1314, file: !1254, line: 76)
!1314 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1267, line: 50, baseType: !1315)
!1315 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !21, line: 54, baseType: !1297)
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1317, file: !1254, line: 77)
!1317 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1267, line: 51, baseType: !1318)
!1318 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !21, line: 56, baseType: !20)
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1320, file: !1254, line: 78)
!1320 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1267, line: 52, baseType: !1321)
!1321 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !21, line: 58, baseType: !1301)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1323, file: !1254, line: 80)
!1323 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1267, line: 102, baseType: !1324)
!1324 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !21, line: 72, baseType: !445)
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1326, file: !1254, line: 81)
!1326 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1267, line: 90, baseType: !445)
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1328, file: !1330, line: 53)
!1328 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1329, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1329 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "0595275e3f5b502d28f7cd61a0dff888")
!1330 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/clocale", directory: "")
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1332, file: !1330, line: 54)
!1332 = !DISubprogram(name: "setlocale", scope: !1329, file: !1329, line: 122, type: !1333, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1333 = !DISubroutineType(types: !1334)
!1334 = !{!493, !79, !323}
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1336, file: !1330, line: 55)
!1336 = !DISubprogram(name: "localeconv", scope: !1329, file: !1329, line: 125, type: !1337, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1337 = !DISubroutineType(types: !1338)
!1338 = !{!1339}
!1339 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1328, size: 64)
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1341, file: !1343, line: 64)
!1341 = !DISubprogram(name: "isalnum", scope: !1342, file: !1342, line: 108, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1342 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "c67c809b09ef8ea9c273687bc20a7fd3")
!1343 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cctype", directory: "")
!1344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1345, file: !1343, line: 65)
!1345 = !DISubprogram(name: "isalpha", scope: !1342, file: !1342, line: 109, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1347, file: !1343, line: 66)
!1347 = !DISubprogram(name: "iscntrl", scope: !1342, file: !1342, line: 110, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1349, file: !1343, line: 67)
!1349 = !DISubprogram(name: "isdigit", scope: !1342, file: !1342, line: 111, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1351, file: !1343, line: 68)
!1351 = !DISubprogram(name: "isgraph", scope: !1342, file: !1342, line: 113, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1353, file: !1343, line: 69)
!1353 = !DISubprogram(name: "islower", scope: !1342, file: !1342, line: 112, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1355, file: !1343, line: 70)
!1355 = !DISubprogram(name: "isprint", scope: !1342, file: !1342, line: 114, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1357, file: !1343, line: 71)
!1357 = !DISubprogram(name: "ispunct", scope: !1342, file: !1342, line: 115, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1359, file: !1343, line: 72)
!1359 = !DISubprogram(name: "isspace", scope: !1342, file: !1342, line: 116, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1361, file: !1343, line: 73)
!1361 = !DISubprogram(name: "isupper", scope: !1342, file: !1342, line: 117, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1363, file: !1343, line: 74)
!1363 = !DISubprogram(name: "isxdigit", scope: !1342, file: !1342, line: 118, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1365, file: !1343, line: 75)
!1365 = !DISubprogram(name: "tolower", scope: !1342, file: !1342, line: 122, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1367, file: !1343, line: 76)
!1367 = !DISubprogram(name: "toupper", scope: !1342, file: !1342, line: 125, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1369, file: !1343, line: 87)
!1369 = !DISubprogram(name: "isblank", scope: !1342, file: !1342, line: 130, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1371, file: !1373, line: 98)
!1371 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1372, line: 7, baseType: !957)
!1372 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1373 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdio", directory: "")
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1375, file: !1373, line: 99)
!1375 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1376, line: 84, baseType: !1377)
!1376 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "75d393d9743f4e6c39653f794c599a10")
!1377 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1378, line: 14, baseType: !1379)
!1378 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1379 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1378, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1381, file: !1373, line: 101)
!1381 = !DISubprogram(name: "clearerr", scope: !1376, file: !1376, line: 763, type: !1382, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1382 = !DISubroutineType(types: !1383)
!1383 = !{null, !1384}
!1384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1371, size: 64)
!1385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1386, file: !1373, line: 102)
!1386 = !DISubprogram(name: "fclose", scope: !1376, file: !1376, line: 213, type: !1387, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1387 = !DISubroutineType(types: !1388)
!1388 = !{!79, !1384}
!1389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1390, file: !1373, line: 103)
!1390 = !DISubprogram(name: "feof", scope: !1376, file: !1376, line: 765, type: !1387, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1392, file: !1373, line: 104)
!1392 = !DISubprogram(name: "ferror", scope: !1376, file: !1376, line: 767, type: !1387, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1394, file: !1373, line: 105)
!1394 = !DISubprogram(name: "fflush", scope: !1376, file: !1376, line: 218, type: !1387, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1396, file: !1373, line: 106)
!1396 = !DISubprogram(name: "fgetc", scope: !1376, file: !1376, line: 491, type: !1387, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1398, file: !1373, line: 107)
!1398 = !DISubprogram(name: "fgetpos", scope: !1376, file: !1376, line: 737, type: !1399, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1399 = !DISubroutineType(types: !1400)
!1400 = !{!79, !1401, !1402}
!1401 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1384)
!1402 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1403)
!1403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1375, size: 64)
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1405, file: !1373, line: 108)
!1405 = !DISubprogram(name: "fgets", scope: !1376, file: !1376, line: 570, type: !1406, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1406 = !DISubroutineType(types: !1407)
!1407 = !{!493, !560, !79, !1401}
!1408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1409, file: !1373, line: 109)
!1409 = !DISubprogram(name: "fopen", scope: !1376, file: !1376, line: 246, type: !1410, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1410 = !DISubroutineType(types: !1411)
!1411 = !{!1384, !517, !517}
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1413, file: !1373, line: 110)
!1413 = !DISubprogram(name: "fprintf", scope: !1376, file: !1376, line: 326, type: !1414, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1414 = !DISubroutineType(types: !1415)
!1415 = !{!79, !1401, !517, null}
!1416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1417, file: !1373, line: 111)
!1417 = !DISubprogram(name: "fputc", scope: !1376, file: !1376, line: 527, type: !1418, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1418 = !DISubroutineType(types: !1419)
!1419 = !{!79, !79, !1384}
!1420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1421, file: !1373, line: 112)
!1421 = !DISubprogram(name: "fputs", scope: !1376, file: !1376, line: 632, type: !1422, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1422 = !DISubroutineType(types: !1423)
!1423 = !{!79, !517, !1401}
!1424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1425, file: !1373, line: 113)
!1425 = !DISubprogram(name: "fread", scope: !1376, file: !1376, line: 652, type: !1426, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1426 = !DISubroutineType(types: !1427)
!1427 = !{!443, !1428, !443, !443, !1401}
!1428 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !442)
!1429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1430, file: !1373, line: 114)
!1430 = !DISubprogram(name: "freopen", scope: !1376, file: !1376, line: 252, type: !1431, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1431 = !DISubroutineType(types: !1432)
!1432 = !{!1384, !517, !517, !1401}
!1433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1434, file: !1373, line: 115)
!1434 = !DISubprogram(name: "fscanf", scope: !1376, file: !1376, line: 391, type: !1414, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1436, file: !1373, line: 116)
!1436 = !DISubprogram(name: "fseek", scope: !1376, file: !1376, line: 690, type: !1437, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1437 = !DISubroutineType(types: !1438)
!1438 = !{!79, !1384, !304, !79}
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1440, file: !1373, line: 117)
!1440 = !DISubprogram(name: "fsetpos", scope: !1376, file: !1376, line: 742, type: !1441, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1441 = !DISubroutineType(types: !1442)
!1442 = !{!79, !1384, !1443}
!1443 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1444, size: 64)
!1444 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1375)
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1446, file: !1373, line: 118)
!1446 = !DISubprogram(name: "ftell", scope: !1376, file: !1376, line: 695, type: !1447, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{!304, !1384}
!1449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1450, file: !1373, line: 119)
!1450 = !DISubprogram(name: "fwrite", scope: !1376, file: !1376, line: 658, type: !1451, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1451 = !DISubroutineType(types: !1452)
!1452 = !{!443, !1453, !443, !443, !1401}
!1453 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !469)
!1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1455, file: !1373, line: 120)
!1455 = !DISubprogram(name: "getc", scope: !1376, file: !1376, line: 492, type: !1387, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1457, file: !1373, line: 121)
!1457 = !DISubprogram(name: "getchar", scope: !1458, file: !1458, line: 47, type: !530, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1458 = !DIFile(filename: "/usr/include/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "81194b3c12a36527b791b06f928a2e25")
!1459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1460, file: !1373, line: 126)
!1460 = !DISubprogram(name: "perror", scope: !1376, file: !1376, line: 781, type: !1461, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1461 = !DISubroutineType(types: !1462)
!1462 = !{null, !323}
!1463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1464, file: !1373, line: 127)
!1464 = !DISubprogram(name: "printf", scope: !1376, file: !1376, line: 332, type: !1465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1465 = !DISubroutineType(types: !1466)
!1466 = !{!79, !517, null}
!1467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1468, file: !1373, line: 128)
!1468 = !DISubprogram(name: "putc", scope: !1376, file: !1376, line: 528, type: !1418, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1470, file: !1373, line: 129)
!1470 = !DISubprogram(name: "putchar", scope: !1458, file: !1458, line: 82, type: !77, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1472, file: !1373, line: 130)
!1472 = !DISubprogram(name: "puts", scope: !1376, file: !1376, line: 638, type: !458, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1474, file: !1373, line: 131)
!1474 = !DISubprogram(name: "remove", scope: !1376, file: !1376, line: 146, type: !458, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1476, file: !1373, line: 132)
!1476 = !DISubprogram(name: "rename", scope: !1376, file: !1376, line: 148, type: !1477, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1477 = !DISubroutineType(types: !1478)
!1478 = !{!79, !323, !323}
!1479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1480, file: !1373, line: 133)
!1480 = !DISubprogram(name: "rewind", scope: !1376, file: !1376, line: 700, type: !1382, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1482, file: !1373, line: 134)
!1482 = !DISubprogram(name: "scanf", scope: !1376, file: !1376, line: 397, type: !1465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1484, file: !1373, line: 135)
!1484 = !DISubprogram(name: "setbuf", scope: !1376, file: !1376, line: 304, type: !1485, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1485 = !DISubroutineType(types: !1486)
!1486 = !{null, !1401, !560}
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1488, file: !1373, line: 136)
!1488 = !DISubprogram(name: "setvbuf", scope: !1376, file: !1376, line: 308, type: !1489, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1489 = !DISubroutineType(types: !1490)
!1490 = !{!79, !1401, !560, !79, !443}
!1491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1492, file: !1373, line: 137)
!1492 = !DISubprogram(name: "sprintf", scope: !1376, file: !1376, line: 334, type: !1493, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1493 = !DISubroutineType(types: !1494)
!1494 = !{!79, !560, !517, null}
!1495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1496, file: !1373, line: 138)
!1496 = !DISubprogram(name: "sscanf", scope: !1376, file: !1376, line: 399, type: !1497, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1497 = !DISubroutineType(types: !1498)
!1498 = !{!79, !517, !517, null}
!1499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1500, file: !1373, line: 139)
!1500 = !DISubprogram(name: "tmpfile", scope: !1376, file: !1376, line: 173, type: !1501, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1501 = !DISubroutineType(types: !1502)
!1502 = !{!1384}
!1503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1504, file: !1373, line: 141)
!1504 = !DISubprogram(name: "tmpnam", scope: !1376, file: !1376, line: 187, type: !1505, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1505 = !DISubroutineType(types: !1506)
!1506 = !{!493, !493}
!1507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1508, file: !1373, line: 143)
!1508 = !DISubprogram(name: "ungetc", scope: !1376, file: !1376, line: 645, type: !1418, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1510, file: !1373, line: 144)
!1510 = !DISubprogram(name: "vfprintf", scope: !1376, file: !1376, line: 341, type: !1511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1511 = !DISubroutineType(types: !1512)
!1512 = !{!79, !1401, !517, !1081}
!1513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1514, file: !1373, line: 145)
!1514 = !DISubprogram(name: "vprintf", scope: !1458, file: !1458, line: 39, type: !1515, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1515 = !DISubroutineType(types: !1516)
!1516 = !{!79, !517, !1081}
!1517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1518, file: !1373, line: 146)
!1518 = !DISubprogram(name: "vsprintf", scope: !1376, file: !1376, line: 349, type: !1519, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1519 = !DISubroutineType(types: !1520)
!1520 = !{!79, !560, !517, !1081}
!1521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1522, file: !1373, line: 175)
!1522 = !DISubprogram(name: "snprintf", scope: !1376, file: !1376, line: 354, type: !1523, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1523 = !DISubroutineType(types: !1524)
!1524 = !{!79, !560, !443, !517, null}
!1525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1526, file: !1373, line: 176)
!1526 = !DISubprogram(name: "vfscanf", scope: !1376, file: !1376, line: 434, type: !1511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1528, file: !1373, line: 177)
!1528 = !DISubprogram(name: "vscanf", scope: !1376, file: !1376, line: 442, type: !1515, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1530, file: !1373, line: 178)
!1530 = !DISubprogram(name: "vsnprintf", scope: !1376, file: !1376, line: 358, type: !1531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1531 = !DISubroutineType(types: !1532)
!1532 = !{!79, !560, !443, !517, !1081}
!1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1534, file: !1373, line: 179)
!1534 = !DISubprogram(name: "vsscanf", scope: !1376, file: !1376, line: 446, type: !1535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1535 = !DISubroutineType(types: !1536)
!1536 = !{!79, !517, !517, !1081}
!1537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1522, file: !1373, line: 185)
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1526, file: !1373, line: 186)
!1539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1528, file: !1373, line: 187)
!1540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1530, file: !1373, line: 188)
!1541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1534, file: !1373, line: 189)
!1542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1543, file: !1547, line: 82)
!1543 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1544, line: 48, baseType: !1545)
!1544 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "760693b7fbeea3d686e1f29058fc2257")
!1545 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1546, size: 64)
!1546 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1261)
!1547 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cwctype", directory: "")
!1548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1549, file: !1547, line: 83)
!1549 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1550, line: 38, baseType: !445)
!1550 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "45eef9c3aa1d99faffa3945ed9be039a")
!1551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !943, file: !1547, line: 84)
!1552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1553, file: !1547, line: 86)
!1553 = !DISubprogram(name: "iswalnum", scope: !1550, file: !1550, line: 95, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1555, file: !1547, line: 87)
!1555 = !DISubprogram(name: "iswalpha", scope: !1550, file: !1550, line: 101, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1557, file: !1547, line: 89)
!1557 = !DISubprogram(name: "iswblank", scope: !1550, file: !1550, line: 146, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1559, file: !1547, line: 91)
!1559 = !DISubprogram(name: "iswcntrl", scope: !1550, file: !1550, line: 104, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1561, file: !1547, line: 92)
!1561 = !DISubprogram(name: "iswctype", scope: !1550, file: !1550, line: 159, type: !1562, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1562 = !DISubroutineType(types: !1563)
!1563 = !{!79, !943, !1549}
!1564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1565, file: !1547, line: 93)
!1565 = !DISubprogram(name: "iswdigit", scope: !1550, file: !1550, line: 108, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1567, file: !1547, line: 94)
!1567 = !DISubprogram(name: "iswgraph", scope: !1550, file: !1550, line: 112, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1569, file: !1547, line: 95)
!1569 = !DISubprogram(name: "iswlower", scope: !1550, file: !1550, line: 117, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1571, file: !1547, line: 96)
!1571 = !DISubprogram(name: "iswprint", scope: !1550, file: !1550, line: 120, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1573, file: !1547, line: 97)
!1573 = !DISubprogram(name: "iswpunct", scope: !1550, file: !1550, line: 125, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1575, file: !1547, line: 98)
!1575 = !DISubprogram(name: "iswspace", scope: !1550, file: !1550, line: 130, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1577, file: !1547, line: 99)
!1577 = !DISubprogram(name: "iswupper", scope: !1550, file: !1550, line: 135, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1579, file: !1547, line: 100)
!1579 = !DISubprogram(name: "iswxdigit", scope: !1550, file: !1550, line: 140, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1581, file: !1547, line: 101)
!1581 = !DISubprogram(name: "towctrans", scope: !1544, file: !1544, line: 55, type: !1582, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1582 = !DISubroutineType(types: !1583)
!1583 = !{!943, !943, !1543}
!1584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1585, file: !1547, line: 102)
!1585 = !DISubprogram(name: "towlower", scope: !1550, file: !1550, line: 166, type: !1586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1586 = !DISubroutineType(types: !1587)
!1587 = !{!943, !943}
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1589, file: !1547, line: 103)
!1589 = !DISubprogram(name: "towupper", scope: !1550, file: !1550, line: 169, type: !1586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1591, file: !1547, line: 104)
!1591 = !DISubprogram(name: "wctrans", scope: !1544, file: !1544, line: 52, type: !1592, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1592 = !DISubroutineType(types: !1593)
!1593 = !{!1543, !323}
!1594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1595, file: !1547, line: 105)
!1595 = !DISubprogram(name: "wctype", scope: !1550, file: !1550, line: 155, type: !1596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1596 = !DISubroutineType(types: !1597)
!1597 = !{!1549, !323}
!1598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1599, file: !1602, line: 60)
!1599 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1600, line: 7, baseType: !1601)
!1600 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1601 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !21, line: 154, baseType: !304)
!1602 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ctime", directory: "")
!1603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1604, file: !1602, line: 61)
!1604 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1605, line: 7, baseType: !1606)
!1605 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "49b4e16ef1215de5afdbb283400ab90c")
!1606 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !21, line: 158, baseType: !304)
!1607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1128, file: !1602, line: 62)
!1608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1609, file: !1602, line: 64)
!1609 = !DISubprogram(name: "clock", scope: !1610, file: !1610, line: 72, type: !1611, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1610 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b21b4c7d8bf3fafdb33a1c7ed8e024a")
!1611 = !DISubroutineType(types: !1612)
!1612 = !{!1599}
!1613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1614, file: !1602, line: 65)
!1614 = !DISubprogram(name: "difftime", scope: !1610, file: !1610, line: 78, type: !1615, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1615 = !DISubroutineType(types: !1616)
!1616 = !{!86, !1604, !1604}
!1617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1618, file: !1602, line: 66)
!1618 = !DISubprogram(name: "mktime", scope: !1610, file: !1610, line: 82, type: !1619, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1619 = !DISubroutineType(types: !1620)
!1620 = !{!1604, !1621}
!1621 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1128, size: 64)
!1622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1623, file: !1602, line: 67)
!1623 = !DISubprogram(name: "time", scope: !1610, file: !1610, line: 75, type: !1624, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1624 = !DISubroutineType(types: !1625)
!1625 = !{!1604, !1626}
!1626 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1604, size: 64)
!1627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1628, file: !1602, line: 68)
!1628 = !DISubprogram(name: "asctime", scope: !1610, file: !1610, line: 139, type: !1629, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1629 = !DISubroutineType(types: !1630)
!1630 = !{!493, !1126}
!1631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1632, file: !1602, line: 69)
!1632 = !DISubprogram(name: "ctime", scope: !1610, file: !1610, line: 142, type: !1633, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1633 = !DISubroutineType(types: !1634)
!1634 = !{!493, !1635}
!1635 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1636, size: 64)
!1636 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1604)
!1637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1638, file: !1602, line: 70)
!1638 = !DISubprogram(name: "gmtime", scope: !1610, file: !1610, line: 119, type: !1639, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1639 = !DISubroutineType(types: !1640)
!1640 = !{!1621, !1635}
!1641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1642, file: !1602, line: 71)
!1642 = !DISubprogram(name: "localtime", scope: !1610, file: !1610, line: 123, type: !1639, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1644, file: !1602, line: 72)
!1644 = !DISubprogram(name: "strftime", scope: !1610, file: !1610, line: 88, type: !1645, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1645 = !DISubroutineType(types: !1646)
!1646 = !{!443, !560, !443, !517, !1125}
!1647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1648, file: !1602, line: 79)
!1648 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1649, line: 9, size: 128, flags: DIFlagTypePassByValue, elements: !1650, identifier: "_ZTS8timespec")
!1649 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "7074babe5447b53c4390dc147eee8679")
!1650 = !{!1651, !1652}
!1651 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1648, file: !1649, line: 11, baseType: !1606, size: 64)
!1652 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1648, file: !1649, line: 12, baseType: !1653, size: 64, offset: 64)
!1653 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !21, line: 194, baseType: !304)
!1654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1655, file: !1602, line: 80)
!1655 = !DISubprogram(name: "timespec_get", scope: !1610, file: !1610, line: 263, type: !1656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1656 = !DISubroutineType(types: !1657)
!1657 = !{!79, !1658, !79}
!1658 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1648, size: 64)
!1659 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1660, entity: !1661, file: !1663, line: 1250)
!1660 = !DINamespace(name: "chrono", scope: !74)
!1661 = !DINamespace(name: "chrono_literals", scope: !1662, exportSymbols: true)
!1662 = !DINamespace(name: "literals", scope: !74, exportSymbols: true)
!1663 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/chrono", directory: "")
!1664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !3, file: !1665, line: 89)
!1665 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/shared_ptr_base.h", directory: "", checksumkind: CSK_MD5, checksum: "a9031cc66fad8948937b85efd4835986")
!1666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1667, file: !1665, line: 90)
!1667 = !DIGlobalVariable(name: "__default_lock_policy", linkageName: "_ZN9__gnu_cxxL21__default_lock_policyE", scope: !5, file: !4, line: 53, type: !1668, isLocal: true, isDefinition: false, memorySpace: DW_MSPACE_LLVM_constant)
!1668 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3)
!1669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1670, file: !1673, line: 58)
!1670 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !1671, line: 24, baseType: !1672)
!1671 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "48e8e2456f77e6cda35d245130fa7259")
!1672 = !DICompositeType(tag: DW_TAG_structure_type, file: !1671, line: 19, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS11max_align_t")
!1673 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstddef", directory: "")
!1674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1675, file: !1679, line: 77)
!1675 = !DISubprogram(name: "memchr", scope: !1676, file: !1676, line: 84, type: !1677, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1676 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "cc7eed1dc136352012a229a96542ae3d")
!1677 = !DISubroutineType(types: !1678)
!1678 = !{!469, !469, !79, !443}
!1679 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstring", directory: "")
!1680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1681, file: !1679, line: 78)
!1681 = !DISubprogram(name: "memcmp", scope: !1676, file: !1676, line: 64, type: !1682, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1682 = !DISubroutineType(types: !1683)
!1683 = !{!79, !469, !469, !443}
!1684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1685, file: !1679, line: 79)
!1685 = !DISubprogram(name: "memcpy", linkageName: "_ZL6memcpyPvPKvm", scope: !1686, file: !1686, line: 1091, type: !1687, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1686 = !DIFile(filename: "/opt/rocm-6.0.0/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "84c2a92b1697d2eb768bfffa64d66c1f")
!1687 = !DISubroutineType(types: !1688)
!1688 = !{!442, !442, !469, !443}
!1689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1690, file: !1679, line: 80)
!1690 = !DISubprogram(name: "memmove", scope: !1676, file: !1676, line: 47, type: !1687, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1692, file: !1679, line: 81)
!1692 = !DISubprogram(name: "memset", linkageName: "_ZL6memsetPvim", scope: !1686, file: !1686, line: 1095, type: !1693, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1693 = !DISubroutineType(types: !1694)
!1694 = !{!442, !442, !79, !443}
!1695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1696, file: !1679, line: 82)
!1696 = !DISubprogram(name: "strcat", scope: !1676, file: !1676, line: 130, type: !1697, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1697 = !DISubroutineType(types: !1698)
!1698 = !{!493, !560, !517}
!1699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1700, file: !1679, line: 83)
!1700 = !DISubprogram(name: "strcmp", scope: !1676, file: !1676, line: 137, type: !1477, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1702, file: !1679, line: 84)
!1702 = !DISubprogram(name: "strcoll", scope: !1676, file: !1676, line: 144, type: !1477, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1704, file: !1679, line: 85)
!1704 = !DISubprogram(name: "strcpy", scope: !1676, file: !1676, line: 122, type: !1697, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1706, file: !1679, line: 86)
!1706 = !DISubprogram(name: "strcspn", scope: !1676, file: !1676, line: 273, type: !1707, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1707 = !DISubroutineType(types: !1708)
!1708 = !{!443, !323, !323}
!1709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1710, file: !1679, line: 87)
!1710 = !DISubprogram(name: "strerror", scope: !1676, file: !1676, line: 397, type: !1711, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1711 = !DISubroutineType(types: !1712)
!1712 = !{!493, !79}
!1713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1714, file: !1679, line: 88)
!1714 = !DISubprogram(name: "strlen", scope: !1676, file: !1676, line: 385, type: !1715, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1715 = !DISubroutineType(types: !1716)
!1716 = !{!443, !323}
!1717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1718, file: !1679, line: 89)
!1718 = !DISubprogram(name: "strncat", scope: !1676, file: !1676, line: 133, type: !1719, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1719 = !DISubroutineType(types: !1720)
!1720 = !{!493, !560, !517, !443}
!1721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1722, file: !1679, line: 90)
!1722 = !DISubprogram(name: "strncmp", scope: !1676, file: !1676, line: 140, type: !1723, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1723 = !DISubroutineType(types: !1724)
!1724 = !{!79, !323, !323, !443}
!1725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1726, file: !1679, line: 91)
!1726 = !DISubprogram(name: "strncpy", scope: !1676, file: !1676, line: 125, type: !1719, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1728, file: !1679, line: 92)
!1728 = !DISubprogram(name: "strspn", scope: !1676, file: !1676, line: 277, type: !1707, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1730, file: !1679, line: 93)
!1730 = !DISubprogram(name: "strtok", scope: !1676, file: !1676, line: 336, type: !1697, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1732, file: !1679, line: 94)
!1732 = !DISubprogram(name: "strxfrm", scope: !1676, file: !1676, line: 147, type: !1733, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1733 = !DISubroutineType(types: !1734)
!1734 = !{!443, !560, !517, !443}
!1735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1736, file: !1679, line: 95)
!1736 = !DISubprogram(name: "strchr", scope: !1676, file: !1676, line: 219, type: !1737, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1737 = !DISubroutineType(types: !1738)
!1738 = !{!323, !323, !79}
!1739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1740, file: !1679, line: 96)
!1740 = !DISubprogram(name: "strpbrk", scope: !1676, file: !1676, line: 296, type: !1741, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1741 = !DISubroutineType(types: !1742)
!1742 = !{!323, !323, !323}
!1743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1744, file: !1679, line: 97)
!1744 = !DISubprogram(name: "strrchr", scope: !1676, file: !1676, line: 246, type: !1737, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !74, entity: !1746, file: !1679, line: 98)
!1746 = !DISubprogram(name: "strstr", scope: !1676, file: !1676, line: 323, type: !1741, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1747 = !{i32 4, !"amdgpu_hostcall", i32 1}
!1748 = !{i32 1, !"amdgpu_code_object_version", i32 500}
!1749 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!1750 = !{i32 7, !"Dwarf Version", i32 5}
!1751 = !{i32 2, !"Debug Info Version", i32 3}
!1752 = !{i32 1, !"wchar_size", i32 4}
!1753 = !{i32 8, !"PIC Level", i32 2}
!1754 = !{i32 2, i32 0}
!1755 = !{!"AMD clang version 17.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-6.0.0 23483 7208e8d15fbf218deb74483ea8c549c67ca4985e)"}
!1756 = distinct !DISubprogram(name: "tick_all_kernel", linkageName: "_Z15tick_all_kernelPU7_AtomicmPmPli", scope: !1, file: !1, line: 57, type: !1757, scopeLine: 58, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1763)
!1757 = !DISubroutineType(types: !1758)
!1758 = !{null, !1759, !1761, !1762, !79}
!1759 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1760, size: 64)
!1760 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !1300)
!1761 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1300, size: 64)
!1762 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1263, size: 64)
!1763 = !{!1764, !1765, !1766, !1767}
!1764 = !DILocalVariable(name: "clk", arg: 1, scope: !1756, file: !1, line: 57, type: !1759)
!1765 = !DILocalVariable(name: "vals", arg: 2, scope: !1756, file: !1, line: 57, type: !1761)
!1766 = !DILocalVariable(name: "dummy_data", arg: 3, scope: !1756, file: !1, line: 57, type: !1762)
!1767 = !DILocalVariable(name: "test", arg: 4, scope: !1756, file: !1, line: 57, type: !79)
!1768 = !DILocation(line: 59, column: 3, scope: !1756)
!1769 = !DILocation(line: 60, column: 34, scope: !1756)
!1770 = !DILocation(line: 273, column: 12, scope: !1771, inlinedAt: !1776)
!1771 = distinct !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !63, file: !31, line: 272, type: !66, scopeLine: 272, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !65, retainedNodes: !1772)
!1772 = !{!1773, !1775}
!1773 = !DILocalVariable(name: "this", arg: 1, scope: !1771, type: !1774, flags: DIFlagArtificial | DIFlagObjectPointer)
!1774 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!1775 = !DILocalVariable(name: "x", arg: 2, scope: !1771, file: !31, line: 272, type: !18)
!1776 = distinct !DILocation(line: 295, column: 53, scope: !1777, inlinedAt: !1781)
!1777 = distinct !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !37, file: !31, line: 295, type: !40, scopeLine: 295, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !39, retainedNodes: !1778)
!1778 = !{!1779}
!1779 = !DILocalVariable(name: "this", arg: 1, scope: !1777, type: !1780, flags: DIFlagArtificial | DIFlagObjectPointer)
!1780 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!1781 = distinct !DILocation(line: 60, column: 8, scope: !1756)
!1782 = !{i32 0, i32 1024}
!1783 = !{}
!1784 = !DILocation(line: 60, column: 19, scope: !1756)
!1785 = !DILocation(line: 60, column: 3, scope: !1756)
!1786 = !DILocation(line: 60, column: 26, scope: !1756)
!1787 = !{!1788, !1788, i64 0}
!1788 = !{!"long", !1789, i64 0}
!1789 = !{!"omnipotent char", !1790, i64 0}
!1790 = !{!"Simple C++ TBAA"}
!1791 = !DILocation(line: 865, column: 9, scope: !1792, inlinedAt: !1799)
!1792 = distinct !DILexicalBlock(scope: !1793, file: !1686, line: 864, column: 16)
!1793 = distinct !DILexicalBlock(scope: !1794, file: !1686, line: 864, column: 9)
!1794 = distinct !DISubprogram(name: "__work_group_barrier", linkageName: "_ZL20__work_group_barrierj", scope: !1686, file: !1686, line: 863, type: !1795, scopeLine: 863, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1797)
!1795 = !DISubroutineType(types: !1796)
!1796 = !{null, !12}
!1797 = !{!1798}
!1798 = !DILocalVariable(name: "flags", arg: 1, scope: !1794, file: !1686, line: 863, type: !12)
!1799 = distinct !DILocation(line: 877, column: 3, scope: !1800, inlinedAt: !1803)
!1800 = distinct !DISubprogram(name: "__barrier", linkageName: "_ZL9__barrieri", scope: !1686, file: !1686, line: 875, type: !483, scopeLine: 876, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1801)
!1801 = !{!1802}
!1802 = !DILocalVariable(name: "n", arg: 1, scope: !1800, file: !1686, line: 875, type: !79)
!1803 = distinct !DILocation(line: 885, column: 3, scope: !1804, inlinedAt: !1805)
!1804 = distinct !DISubprogram(name: "__syncthreads", linkageName: "_Z13__syncthreadsv", scope: !1686, file: !1686, line: 883, type: !436, scopeLine: 884, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1783)
!1805 = distinct !DILocation(line: 61, column: 3, scope: !1756)
!1806 = !DILocation(line: 866, column: 9, scope: !1792, inlinedAt: !1799)
!1807 = !DILocation(line: 867, column: 9, scope: !1792, inlinedAt: !1799)
!1808 = !DILocation(line: 62, column: 3, scope: !1756)
!1809 = !DILocation(line: 63, column: 1, scope: !1756)
!1810 = distinct !DISubprogram(name: "dummy_work", linkageName: "_Z10dummy_workPl", scope: !1, file: !1, line: 195, type: !1811, scopeLine: 196, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1813)
!1811 = !DISubroutineType(types: !1812)
!1812 = !{null, !1762}
!1813 = !{!1814, !1815}
!1814 = !DILocalVariable(name: "dummy_data", arg: 1, scope: !1810, file: !1, line: 195, type: !1762)
!1815 = !DILocalVariable(name: "i", scope: !1810, file: !1, line: 197, type: !79)
!1816 = !DILocation(line: 197, column: 11, scope: !1810)
!1817 = !DILocation(line: 197, column: 28, scope: !1810)
!1818 = !{!1819, !1819, i64 0}
!1819 = !{!"int", !1820, i64 0}
!1820 = !{!"omnipotent char", !1821, i64 0}
!1821 = !{!"Simple C/C++ TBAA"}
!1822 = !{!1823, !1823, i64 0}
!1823 = !{!"short", !1820, i64 0}
!1824 = !DILocation(line: 197, column: 44, scope: !1810)
!1825 = !DILocation(line: 197, column: 42, scope: !1810)
!1826 = !DILocation(line: 197, column: 26, scope: !1810)
!1827 = !DILocation(line: 198, column: 20, scope: !1810)
!1828 = !DILocation(line: 198, column: 3, scope: !1810)
!1829 = !DILocation(line: 198, column: 17, scope: !1810)
!1830 = !DILocation(line: 199, column: 1, scope: !1810)
!1831 = distinct !DISubprogram(name: "dummy_kernel", linkageName: "_Z12dummy_kernelv", scope: !1, file: !1, line: 155, type: !436, scopeLine: 156, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1783)
!1832 = !DILocation(line: 865, column: 9, scope: !1792, inlinedAt: !1833)
!1833 = distinct !DILocation(line: 877, column: 3, scope: !1800, inlinedAt: !1834)
!1834 = distinct !DILocation(line: 885, column: 3, scope: !1804, inlinedAt: !1835)
!1835 = distinct !DILocation(line: 157, column: 3, scope: !1831)
!1836 = !DILocation(line: 866, column: 9, scope: !1792, inlinedAt: !1833)
!1837 = !DILocation(line: 867, column: 9, scope: !1792, inlinedAt: !1833)
!1838 = !DILocation(line: 158, column: 1, scope: !1831)
!1839 = distinct !DISubprogram(name: "dummy_init", linkageName: "_Z10dummy_initPl", scope: !1, file: !1, line: 188, type: !1811, scopeLine: 189, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1840)
!1840 = !{!1841, !1842}
!1841 = !DILocalVariable(name: "dummy_data", arg: 1, scope: !1839, file: !1, line: 188, type: !1762)
!1842 = !DILocalVariable(name: "i", scope: !1839, file: !1, line: 190, type: !79)
!1843 = !DILocation(line: 190, column: 11, scope: !1839)
!1844 = !DILocation(line: 190, column: 28, scope: !1839)
!1845 = !DILocation(line: 190, column: 44, scope: !1839)
!1846 = !DILocation(line: 190, column: 42, scope: !1839)
!1847 = !DILocation(line: 190, column: 26, scope: !1839)
!1848 = !DILocation(line: 191, column: 3, scope: !1839)
!1849 = !DILocation(line: 191, column: 17, scope: !1839)
!1850 = !DILocation(line: 192, column: 1, scope: !1839)
!1851 = !{!1852, !1852, i64 0}
!1852 = !{!"float", !1789, i64 0}
!1853 = !{i64 0, i64 8, !1787, i64 8, i64 2, !1854, i64 16, i64 8, !1787, i64 16, i64 2, !1856, i64 18, i64 2, !1856, i64 20, i64 4, !1858, i64 24, i64 2, !1856, i64 26, i64 2, !1856, i64 28, i64 2, !1856, i64 30, i64 2, !1856, i64 32, i64 1, !1860, i64 16, i64 8, !1861, i64 40, i64 8, !1861, i64 48, i64 8, !1787, i64 56, i64 4, !1858, i64 60, i64 4, !1858, i64 64, i64 8, !1787}
!1854 = !{!1855, !1855, i64 0}
!1855 = !{!"_ZTSN8scabbard9InstrDataE", !1789, i64 0}
!1856 = !{!1857, !1857, i64 0}
!1857 = !{!"short", !1789, i64 0}
!1858 = !{!1859, !1859, i64 0}
!1859 = !{!"int", !1789, i64 0}
!1860 = !{!1789, !1789, i64 0}
!1861 = !{!1862, !1862, i64 0}
!1862 = !{!"any pointer", !1789, i64 0}
!1863 = !{i64 0, i64 2, !1854, i64 8, i64 8, !1787, i64 8, i64 2, !1856, i64 10, i64 2, !1856, i64 12, i64 4, !1858, i64 16, i64 2, !1856, i64 18, i64 2, !1856, i64 20, i64 2, !1856, i64 22, i64 2, !1856, i64 24, i64 1, !1860, i64 8, i64 8, !1861, i64 32, i64 8, !1861, i64 40, i64 8, !1787, i64 48, i64 4, !1858, i64 52, i64 4, !1858, i64 56, i64 8, !1787}
!1864 = !{i64 6, i64 8, !1787, i64 6, i64 2, !1856, i64 8, i64 2, !1856, i64 10, i64 4, !1858, i64 14, i64 2, !1856, i64 16, i64 2, !1856, i64 18, i64 2, !1856, i64 20, i64 2, !1856, i64 22, i64 1, !1860, i64 6, i64 8, !1861, i64 30, i64 8, !1861, i64 38, i64 8, !1787, i64 46, i64 4, !1858, i64 50, i64 4, !1858, i64 54, i64 8, !1787}
!1865 = !{i64 0, i64 8, !1787, i64 0, i64 2, !1856, i64 2, i64 2, !1856, i64 4, i64 4, !1858, i64 8, i64 2, !1856, i64 10, i64 2, !1856, i64 12, i64 2, !1856, i64 14, i64 2, !1856, i64 16, i64 1, !1860, i64 0, i64 8, !1861, i64 24, i64 8, !1861, i64 32, i64 8, !1787, i64 40, i64 4, !1858, i64 44, i64 4, !1858, i64 48, i64 8, !1787}
!1866 = !{i64 0, i64 4, !1787, i64 0, i64 4, !1858, i64 4, i64 2, !1856, i64 6, i64 2, !1856, i64 8, i64 2, !1856, i64 10, i64 2, !1856, i64 12, i64 1, !1860, i64 0, i64 4, !1861, i64 20, i64 8, !1861, i64 28, i64 8, !1787, i64 36, i64 4, !1858, i64 40, i64 4, !1858, i64 44, i64 8, !1787}
!1867 = !{i64 0, i64 1, !1860, i64 8, i64 8, !1861, i64 16, i64 8, !1787, i64 24, i64 4, !1858, i64 28, i64 4, !1858, i64 32, i64 8, !1787}
!1868 = !{i64 7, i64 8, !1861, i64 15, i64 8, !1787, i64 23, i64 4, !1858, i64 27, i64 4, !1858, i64 31, i64 8, !1787}
!1869 = !{i64 0, i64 8, !1861, i64 8, i64 8, !1787, i64 16, i64 4, !1858, i64 20, i64 4, !1858, i64 24, i64 8, !1787}
!1870 = !{i64 0, i64 8, !1787, i64 8, i64 4, !1858, i64 12, i64 4, !1858, i64 16, i64 8, !1787}
!1871 = !{i64 0, i64 4, !1858, i64 4, i64 4, !1858, i64 8, i64 8, !1787}
!1872 = !{i64 0, i64 4, !1858, i64 4, i64 8, !1787}
!1873 = !{i64 0, i64 8, !1787}
!1874 = distinct !DISubprogram(name: "tick_all_kernel", linkageName: "_Z15tick_all_kernelPU7_AtomicmPmPli", scope: !1, file: !1, line: 57, type: !1757, scopeLine: 58, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1875)
!1875 = !{!1876, !1877, !1878, !1879}
!1876 = !DILocalVariable(name: "clk", arg: 1, scope: !1874, file: !1, line: 57, type: !1759)
!1877 = !DILocalVariable(name: "vals", arg: 2, scope: !1874, file: !1, line: 57, type: !1761)
!1878 = !DILocalVariable(name: "dummy_data", arg: 3, scope: !1874, file: !1, line: 57, type: !1762)
!1879 = !DILocalVariable(name: "test", arg: 4, scope: !1874, file: !1, line: 57, type: !79)
!1880 = distinct !DISubprogram(name: "dummy_work", linkageName: "_Z10dummy_workPl", scope: !1, file: !1, line: 195, type: !1811, scopeLine: 196, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1881)
!1881 = !{!1882, !1883}
!1882 = !DILocalVariable(name: "dummy_data", arg: 1, scope: !1880, file: !1, line: 195, type: !1762)
!1883 = !DILocalVariable(name: "i", scope: !1880, file: !1, line: 197, type: !79)
!1884 = distinct !DISubprogram(name: "dummy_kernel", linkageName: "_Z12dummy_kernelv", scope: !1, file: !1, line: 155, type: !436, scopeLine: 156, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1783)
!1885 = !DILocation(line: 865, column: 9, scope: !1792, inlinedAt: !1886)
!1886 = distinct !DILocation(line: 877, column: 3, scope: !1800, inlinedAt: !1887)
!1887 = distinct !DILocation(line: 885, column: 3, scope: !1804, inlinedAt: !1888)
!1888 = distinct !DILocation(line: 157, column: 3, scope: !1884)
!1889 = !DILocation(line: 866, column: 9, scope: !1792, inlinedAt: !1886)
!1890 = !DILocation(line: 867, column: 9, scope: !1792, inlinedAt: !1886)
!1891 = !DILocation(line: 158, column: 1, scope: !1884)
!1892 = distinct !DISubprogram(name: "dummy_init", linkageName: "_Z10dummy_initPl", scope: !1, file: !1, line: 188, type: !1811, scopeLine: 189, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1893)
!1893 = !{!1894, !1895}
!1894 = !DILocalVariable(name: "dummy_data", arg: 1, scope: !1892, file: !1, line: 188, type: !1762)
!1895 = !DILocalVariable(name: "i", scope: !1892, file: !1, line: 190, type: !79)

; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa--gfx90a

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu-
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
%struct.hipDeviceProp_tR0600 = type { [256 x i8], %struct.hipUUID_t, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [63 x i32], [32 x i32], [256 x i8], i64, i32, %struct.hipDeviceArch_t, ptr, ptr, i32, i32, i32, i32, i32, i32 }
%struct.hipUUID_t = type { [16 x i8] }
%struct.hipDeviceArch_t = type { i24 }

$__hip_gpubin_handle = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@_Z15tick_all_kernelPU7_AtomicmPmPli = dso_local constant ptr @_Z30__device_stub__tick_all_kernelPU7_AtomicmPmPli, align 8
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [37 x i8] c"\0A==== STARTING TEST: tick all ====\0A\0A\00", align 1, !dbg !7
@.str.1 = private unnamed_addr constant [27 x i8] c"Using GPU with device ID: \00", align 1, !dbg !15
@_Z10dummy_initPl = dso_local constant ptr @_Z25__device_stub__dummy_initPl, align 8
@.str.2 = private unnamed_addr constant [19 x i8] c"Dummy Data init: {\00", align 1, !dbg !20
@.str.3 = private unnamed_addr constant [6 x i8] c"\0A    \00", align 1, !dbg !25
@.str.4 = private unnamed_addr constant [2 x i8] c" \00", align 1, !dbg !30
@.str.5 = private unnamed_addr constant [4 x i8] c"...\00", align 1, !dbg !35
@.str.6 = private unnamed_addr constant [6 x i8] c"\0A  }\0A\00", align 1, !dbg !40
@.str.7 = private unnamed_addr constant [60 x i8] c"\0ASUCCESS managed mem registered change before call to sync!\00", align 1, !dbg !42
@.str.8 = private unnamed_addr constant [24 x i8] c"\0AFinal ``Clock'' time: \00", align 1, !dbg !47
@.str.9 = private unnamed_addr constant [36 x i8] c"\0AGPU Threads modified as follows: {\00", align 1, !dbg !52
@.str.10 = private unnamed_addr constant [35 x i8] c"\0A==== ENDING TEST: tick all ====\0A\0A\00", align 1, !dbg !57
@_Z12dummy_kernelv = dso_local constant ptr @_Z27__device_stub__dummy_kernelv, align 8
@.str.11 = private unnamed_addr constant [15 x i8] c" System minor \00", align 1, !dbg !62
@.str.12 = private unnamed_addr constant [15 x i8] c" System major \00", align 1, !dbg !67
@.str.13 = private unnamed_addr constant [18 x i8] c" agent prop name \00", align 1, !dbg !69
@_ZSt4cerr = external dso_local global %"class.std::basic_ostream", align 8
@.str.14 = private unnamed_addr constant [13 x i8] c"\0AHIP ERROR: \00", align 1, !dbg !74
@0 = private unnamed_addr constant [36 x i8] c"_Z15tick_all_kernelPU7_AtomicmPmPli\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"_Z12dummy_kernelv\00", align 1
@2 = private unnamed_addr constant [17 x i8] c"_Z10dummy_initPl\00", align 1
@__hip_fatbin = external constant i8, section ".hip_fatbin"
@__hip_fatbin_wrapper = internal constant { i32, i32, ptr, ptr } { i32 1212764230, i32 1, ptr @__hip_fatbin, ptr null }, section ".hipFatBinSegment", align 8
@__hip_gpubin_handle = linkonce hidden local_unnamed_addr global ptr null, comdat, align 8
@"scabbard.metadata.host.srcId$0x0000" = private global i64 0
@"scabbard.metadata.host.srcId$0x0001" = private global i64 0
@"scabbard.metadata.srcData$0x0001" = private unnamed_addr constant [59 x i8] c"/g/g11/osterhou/repos/scabbard/test/managed_clock_test.cpp\00", align 1
@"scabbard.metadata.srcData$0x0000" = private unnamed_addr constant [47 x i8] c"//opt/rocm-6.0.0/include/hip/hip_runtime_api.h\00", align 1
@llvm.global_ctors = appending global [3 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_managed_clock_test.cpp, ptr null }, { i32, ptr, ptr } { i32 65535, ptr @__hip_module_ctor, ptr null }, { i32, ptr, ptr } { i32 -1, ptr @scabbard.trace.module_ctor, ptr null }]

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
  store ptr %0, ptr %5, align 8, !tbaa !2290
  store ptr %1, ptr %6, align 8, !tbaa !2290
  store ptr %2, ptr %7, align 8, !tbaa !2290
  store i32 %3, ptr %8, align 4, !tbaa !2294
  %13 = alloca [5 x ptr], align 8
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
  %26 = alloca ptr, align 8
  %27 = call ptr @scabbard.trace.register_job(ptr %19)
  store ptr %27, ptr %26, align 8
  %28 = getelementptr inbounds ptr, ptr %13, i64 4
  store ptr %26, ptr %28, align 8
  %29 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z15tick_all_kernelPU7_AtomicmPmPli, i64 %20, i32 %22, i64 %23, i32 %25, ptr noundef nonnull %13, i64 noundef %18, ptr noundef %19)
  call void @scabbard.trace.register_job_callback(ptr %27, ptr %19)
  ret void
}

declare dso_local i32 @__hipPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare dso_local i32 @hipLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: noinline uwtable
define dso_local void @_Z13tick_all_testi(i32 noundef %0) local_unnamed_addr #4 personality ptr @__gxx_personality_v0 !dbg !2296 {
  %2 = alloca %struct.timespec, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca [5 x ptr], align 8
  %12 = alloca ptr, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = alloca [2 x ptr], align 8
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !2298, metadata !DIExpression()), !dbg !2319
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %18) #19, !dbg !2320
  call void @llvm.dbg.value(metadata i32 0, metadata !2299, metadata !DIExpression()), !dbg !2319
  store i32 0, ptr %18, align 4, !dbg !2321, !tbaa !2294
  call void @llvm.dbg.value(metadata ptr %18, metadata !2299, metadata !DIExpression(DW_OP_deref)), !dbg !2319
  %22 = call i32 @hipGetDevice(ptr noundef nonnull %18), !dbg !2322
  call void @llvm.dbg.value(metadata i32 %22, metadata !2323, metadata !DIExpression()), !dbg !2329
  %23 = icmp eq i32 %22, 0, !dbg !2331
  br i1 %23, label %28, label %24, !dbg !2333

24:                                               ; preds = %1
  %25 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2334
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %25, i32 noundef %22), !dbg !2336
  call void @llvm.dbg.value(metadata ptr %26, metadata !2337, metadata !DIExpression()), !dbg !2354
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !2354
  %27 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %26), !dbg !2356
  call void @exit(i32 noundef 1) #20, !dbg !2357
  unreachable, !dbg !2357

28:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2420
  call void @llvm.dbg.value(metadata ptr @.str, metadata !2364, metadata !DIExpression()), !dbg !2420
  %29 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str, i64 noundef 36), !dbg !2422
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2337, metadata !DIExpression()), !dbg !2424
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2426, metadata !DIExpression()), !dbg !2432
  %30 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout), !dbg !2434
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2435
  call void @llvm.dbg.value(metadata ptr @.str.1, metadata !2364, metadata !DIExpression()), !dbg !2435
  %31 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.1, i64 noundef 26), !dbg !2437
  %32 = load i32, ptr %18, align 4, !dbg !2438, !tbaa !2294
  call void @llvm.dbg.value(metadata i32 %32, metadata !2299, metadata !DIExpression()), !dbg !2319
  %33 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %32), !dbg !2439
  call void @llvm.dbg.value(metadata ptr %33, metadata !2337, metadata !DIExpression()), !dbg !2440
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !2440
  call void @llvm.dbg.value(metadata ptr %33, metadata !2442, metadata !DIExpression()), !dbg !2445
  %34 = load ptr, ptr %33, align 8, !dbg !2447, !tbaa !2448
  %35 = getelementptr i8, ptr %34, i64 -24, !dbg !2447
  %36 = load i64, ptr %35, align 8, !dbg !2447
  %37 = getelementptr inbounds i8, ptr %33, i64 %36, !dbg !2447
  call void @llvm.dbg.value(metadata ptr %37, metadata !2450, metadata !DIExpression()), !dbg !2464
  call void @llvm.dbg.value(metadata i8 10, metadata !2462, metadata !DIExpression()), !dbg !2464
  %38 = getelementptr inbounds %"class.std::basic_ios", ptr %37, i64 0, i32 5, !dbg !2466
  %39 = load ptr, ptr %38, align 8, !dbg !2466, !tbaa !2467
  call void @llvm.dbg.value(metadata ptr %39, metadata !2476, metadata !DIExpression()), !dbg !2488
  %40 = icmp eq ptr %39, null, !dbg !2490
  br i1 %40, label %41, label %42, !dbg !2492

41:                                               ; preds = %28
  call void @_ZSt16__throw_bad_castv() #21, !dbg !2493
  unreachable, !dbg !2493

42:                                               ; preds = %28
  call void @llvm.dbg.value(metadata ptr %39, metadata !2494, metadata !DIExpression()), !dbg !2503
  call void @llvm.dbg.value(metadata i8 10, metadata !2502, metadata !DIExpression()), !dbg !2503
  %43 = getelementptr inbounds %"class.std::ctype", ptr %39, i64 0, i32 8, !dbg !2505
  %44 = load i8, ptr %43, align 8, !dbg !2505, !tbaa !2507
  %45 = icmp eq i8 %44, 0, !dbg !2505
  br i1 %45, label %49, label %46, !dbg !2510

46:                                               ; preds = %42
  %47 = getelementptr inbounds %"class.std::ctype", ptr %39, i64 0, i32 9, i64 10, !dbg !2511
  %48 = load i8, ptr %47, align 1, !dbg !2511, !tbaa !2512
  br label %54, !dbg !2513

49:                                               ; preds = %42
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %39), !dbg !2514
  %50 = load ptr, ptr %39, align 8, !dbg !2515, !tbaa !2448
  %51 = getelementptr inbounds ptr, ptr %50, i64 6, !dbg !2515
  %52 = load ptr, ptr %51, align 8, !dbg !2515
  %53 = call noundef signext i8 %52(ptr noundef nonnull align 8 dereferenceable(570) %39, i8 noundef signext 10), !dbg !2515
  br label %54, !dbg !2516

54:                                               ; preds = %46, %49
  %55 = phi i8 [ %48, %46 ], [ %53, %49 ], !dbg !2503
  %56 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %33, i8 noundef signext %55), !dbg !2517
  call void @llvm.dbg.value(metadata ptr %56, metadata !2426, metadata !DIExpression()), !dbg !2518
  %57 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %56), !dbg !2520
  call void @llvm.dbg.value(metadata i32 1024, metadata !2300, metadata !DIExpression()), !dbg !2319
  call void @llvm.dbg.value(metadata i64 64, metadata !2302, metadata !DIExpression()), !dbg !2319
  call void @llvm.dbg.value(metadata i64 128, metadata !2303, metadata !DIExpression()), !dbg !2319
  call void @llvm.dbg.value(metadata i64 16, metadata !2305, metadata !DIExpression()), !dbg !2319
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %19) #19, !dbg !2521
  call void @llvm.dbg.value(metadata ptr %19, metadata !2306, metadata !DIExpression(DW_OP_deref)), !dbg !2319
  call void @llvm.dbg.value(metadata ptr %19, metadata !2522, metadata !DIExpression()), !dbg !2534
  call void @llvm.dbg.value(metadata i64 1, metadata !2530, metadata !DIExpression()), !dbg !2534
  call void @llvm.dbg.value(metadata i32 1, metadata !2531, metadata !DIExpression()), !dbg !2534
  %58 = call i32 @hipMallocManaged(ptr noundef nonnull %19, i64 noundef 1, i32 noundef 1), !dbg !2536
  call void @llvm.dbg.value(metadata i32 %58, metadata !2323, metadata !DIExpression()), !dbg !2537
  %59 = icmp eq i32 %58, 0, !dbg !2539
  br i1 %59, label %64, label %60, !dbg !2540

60:                                               ; preds = %54
  %61 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2541
  %62 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %61, i32 noundef %58), !dbg !2542
  call void @llvm.dbg.value(metadata ptr %62, metadata !2337, metadata !DIExpression()), !dbg !2543
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !2543
  %63 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %62), !dbg !2545
  call void @exit(i32 noundef 1) #20, !dbg !2546
  unreachable, !dbg !2546

64:                                               ; preds = %54
  %65 = load ptr, ptr %19, align 8, !dbg !2547, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %65, metadata !2306, metadata !DIExpression()), !dbg !2319
  store atomic i64 0, ptr %65 seq_cst, align 8, !dbg !2548, !tbaa !2512
  %66 = call noalias noundef nonnull dereferenceable(8192) ptr @_Znam(i64 noundef 8192) #22, !dbg !2549, !heapallocsite !1681
  call void @llvm.dbg.value(metadata ptr %66, metadata !2309, metadata !DIExpression()), !dbg !2319
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(8192) %66, i8 0, i64 8192, i1 false), !dbg !2550
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %20) #19, !dbg !2551
  call void @llvm.dbg.value(metadata ptr %20, metadata !2311, metadata !DIExpression(DW_OP_deref)), !dbg !2319
  call void @llvm.dbg.value(metadata ptr %20, metadata !2552, metadata !DIExpression()), !dbg !2562
  call void @llvm.dbg.value(metadata i64 8192, metadata !2559, metadata !DIExpression()), !dbg !2562
  %67 = call i32 @hipMalloc(ptr noundef nonnull %20, i64 noundef 8192), !dbg !2564
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4112, ptr nonnull %20, ptr nonnull @"scabbard.metadata.host.srcId$0x0000", i32 8593, i32 12, i64 8192)
  call void @llvm.dbg.value(metadata i32 %67, metadata !2323, metadata !DIExpression()), !dbg !2565
  %68 = icmp eq i32 %67, 0, !dbg !2567
  br i1 %68, label %73, label %69, !dbg !2568

69:                                               ; preds = %64
  %70 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2569
  %71 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %70, i32 noundef %67), !dbg !2570
  call void @llvm.dbg.value(metadata ptr %71, metadata !2337, metadata !DIExpression()), !dbg !2571
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !2571
  %72 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %71), !dbg !2573
  call void @exit(i32 noundef 1) #20, !dbg !2574
  unreachable, !dbg !2574

73:                                               ; preds = %64
  %74 = load ptr, ptr %20, align 8, !dbg !2575, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %74, metadata !2311, metadata !DIExpression()), !dbg !2319
  call void @"scabbard.trace.host.trace_append$mem"(i16 -32768, ptr null, ptr nonnull @"scabbard.metadata.host.srcId$0x0001", i32 89, i32 17)
  %75 = call i32 @hipMemcpy(ptr noundef %74, ptr noundef nonnull %66, i64 noundef 8192, i32 noundef 1), !dbg !2576
  call void @llvm.dbg.value(metadata i32 %75, metadata !2323, metadata !DIExpression()), !dbg !2577
  %76 = icmp eq i32 %75, 0, !dbg !2579
  br i1 %76, label %81, label %77, !dbg !2580

77:                                               ; preds = %73
  %78 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2581
  %79 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %78, i32 noundef %75), !dbg !2582
  call void @llvm.dbg.value(metadata ptr %79, metadata !2337, metadata !DIExpression()), !dbg !2583
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !2583
  %80 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %79), !dbg !2585
  call void @exit(i32 noundef 1) #20, !dbg !2586
  unreachable, !dbg !2586

81:                                               ; preds = %73
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %21) #19, !dbg !2587
  call void @llvm.dbg.value(metadata ptr %21, metadata !2312, metadata !DIExpression(DW_OP_deref)), !dbg !2319
  call void @llvm.dbg.value(metadata ptr %21, metadata !2588, metadata !DIExpression()), !dbg !2598
  call void @llvm.dbg.value(metadata i64 8192, metadata !2595, metadata !DIExpression()), !dbg !2598
  %82 = call i32 @hipMalloc(ptr noundef nonnull %21, i64 noundef 8192), !dbg !2600
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4112, ptr nonnull %21, ptr nonnull @"scabbard.metadata.host.srcId$0x0000", i32 8593, i32 12, i64 8192)
  call void @llvm.dbg.value(metadata i32 %82, metadata !2323, metadata !DIExpression()), !dbg !2601
  %83 = icmp eq i32 %82, 0, !dbg !2603
  br i1 %83, label %88, label %84, !dbg !2604

84:                                               ; preds = %81
  %85 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2605
  %86 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %85, i32 noundef %82), !dbg !2606
  call void @llvm.dbg.value(metadata ptr %86, metadata !2337, metadata !DIExpression()), !dbg !2607
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !2607
  %87 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %86), !dbg !2609
  call void @exit(i32 noundef 1) #20, !dbg !2610
  unreachable, !dbg !2610

88:                                               ; preds = %81
  %89 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294968320, i32 1, i64 noundef 0, ptr noundef null), !dbg !2611
  %90 = icmp eq i32 %89, 0, !dbg !2611
  br i1 %90, label %91, label %106, !dbg !2611

91:                                               ; preds = %88
  %92 = load ptr, ptr %21, align 8, !dbg !2611, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %92, metadata !2312, metadata !DIExpression()), !dbg !2319
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %12), !dbg !2611
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %13), !dbg !2611
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %14), !dbg !2611
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %15), !dbg !2611
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %16), !dbg !2611
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %17), !dbg !2611
  store ptr %92, ptr %12, align 8, !dbg !2611, !tbaa !2290
  store ptr %12, ptr %17, align 16, !dbg !2611
  %93 = call i32 @__hipPopCallConfiguration(ptr nonnull %13, ptr nonnull %14, ptr nonnull %15, ptr nonnull %16), !dbg !2611
  %94 = load i64, ptr %15, align 8, !dbg !2611
  %95 = load ptr, ptr %16, align 8, !dbg !2611
  %96 = load i64, ptr %13, align 8, !dbg !2611
  %97 = getelementptr inbounds i8, ptr %13, i64 8, !dbg !2611
  %98 = load i32, ptr %97, align 8, !dbg !2611
  %99 = load i64, ptr %14, align 8, !dbg !2611
  %100 = getelementptr inbounds i8, ptr %14, i64 8, !dbg !2611
  %101 = load i32, ptr %100, align 8, !dbg !2611
  %102 = alloca ptr, align 8
  %103 = call ptr @scabbard.trace.register_job(ptr %95)
  store ptr %103, ptr %102, align 8
  %104 = getelementptr inbounds ptr, ptr %17, i64 1
  store ptr %102, ptr %104, align 8
  %105 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z10dummy_initPl, i64 %96, i32 %98, i64 %99, i32 %101, ptr noundef nonnull %17, i64 noundef %94, ptr noundef %95), !dbg !2611
  call void @scabbard.trace.register_job_callback(ptr %103, ptr %95)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %12), !dbg !2611
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %13), !dbg !2611
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %14), !dbg !2611
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %15), !dbg !2611
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %16), !dbg !2611
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %17), !dbg !2611
  br label %106, !dbg !2611

106:                                              ; preds = %91, %88
  %107 = call noalias noundef nonnull dereferenceable(8192) ptr @_Znam(i64 noundef 8192) #22, !dbg !2613, !heapallocsite !1648
  call void @llvm.dbg.value(metadata ptr %107, metadata !2314, metadata !DIExpression()), !dbg !2319
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(8192) %107, i8 0, i64 8192, i1 false), !dbg !2614
  %108 = load ptr, ptr %21, align 8, !dbg !2615, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %108, metadata !2312, metadata !DIExpression()), !dbg !2319
  call void @"scabbard.trace.host.trace_append$mem"(i16 -32768, ptr null, ptr nonnull @"scabbard.metadata.host.srcId$0x0001", i32 100, i32 17)
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4138, ptr nonnull %107, ptr nonnull @"scabbard.metadata.host.srcId$0x0001", i32 100, i32 17, i64 8192)
  %109 = call i32 @hipMemcpy(ptr noundef nonnull %107, ptr noundef %108, i64 noundef 8192, i32 noundef 2), !dbg !2616
  call void @llvm.dbg.value(metadata i32 %109, metadata !2323, metadata !DIExpression()), !dbg !2617
  %110 = icmp eq i32 %109, 0, !dbg !2619
  br i1 %110, label %115, label %111, !dbg !2620

111:                                              ; preds = %106
  %112 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2621
  %113 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %112, i32 noundef %109), !dbg !2622
  call void @llvm.dbg.value(metadata ptr %113, metadata !2337, metadata !DIExpression()), !dbg !2623
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !2623
  %114 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %113), !dbg !2625
  call void @exit(i32 noundef 1) #20, !dbg !2626
  unreachable, !dbg !2626

115:                                              ; preds = %106
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2627
  call void @llvm.dbg.value(metadata ptr @.str.2, metadata !2364, metadata !DIExpression()), !dbg !2627
  %116 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.2, i64 noundef 18), !dbg !2629
  call void @llvm.dbg.value(metadata i64 0, metadata !2315, metadata !DIExpression()), !dbg !2630
  br label %155, !dbg !2631

117:                                              ; preds = %186
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2632
  call void @llvm.dbg.value(metadata ptr @.str.3, metadata !2364, metadata !DIExpression()), !dbg !2632
  %118 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5), !dbg !2635
  call void @llvm.dbg.value(metadata i8 32, metadata !2636, metadata !DIExpression()), !dbg !2646
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2645, metadata !DIExpression()), !dbg !2646
  %119 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2648, !tbaa !2448
  %120 = getelementptr i8, ptr %119, i64 -24, !dbg !2648
  %121 = load i64, ptr %120, align 8, !dbg !2648
  %122 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %121, !dbg !2648
  call void @llvm.dbg.value(metadata ptr %122, metadata !2649, metadata !DIExpression()), !dbg !2659
  call void @llvm.dbg.value(metadata i8 32, metadata !2656, metadata !DIExpression()), !dbg !2659
  call void @llvm.dbg.value(metadata ptr %122, metadata !2661, metadata !DIExpression()), !dbg !2667
  %123 = getelementptr inbounds %"class.std::basic_ios", ptr %122, i64 0, i32 3, !dbg !2669
  %124 = load i8, ptr %123, align 1, !dbg !2669, !tbaa !2671, !range !2672, !noundef !297
  %125 = icmp eq i8 %124, 0, !dbg !2669
  br i1 %125, label %126, label %143, !dbg !2673

126:                                              ; preds = %117
  call void @llvm.dbg.value(metadata ptr %122, metadata !2450, metadata !DIExpression()), !dbg !2674
  call void @llvm.dbg.value(metadata i8 32, metadata !2462, metadata !DIExpression()), !dbg !2674
  %127 = getelementptr inbounds %"class.std::basic_ios", ptr %122, i64 0, i32 5, !dbg !2677
  %128 = load ptr, ptr %127, align 8, !dbg !2677, !tbaa !2467
  call void @llvm.dbg.value(metadata ptr %128, metadata !2476, metadata !DIExpression()), !dbg !2678
  %129 = icmp eq ptr %128, null, !dbg !2680
  br i1 %129, label %130, label %131, !dbg !2681

130:                                              ; preds = %126
  call void @_ZSt16__throw_bad_castv() #21, !dbg !2682
  unreachable, !dbg !2682

131:                                              ; preds = %126
  call void @llvm.dbg.value(metadata ptr %128, metadata !2494, metadata !DIExpression()), !dbg !2683
  call void @llvm.dbg.value(metadata i8 32, metadata !2502, metadata !DIExpression()), !dbg !2683
  %132 = getelementptr inbounds %"class.std::ctype", ptr %128, i64 0, i32 8, !dbg !2685
  %133 = load i8, ptr %132, align 8, !dbg !2685, !tbaa !2507
  %134 = icmp eq i8 %133, 0, !dbg !2685
  br i1 %134, label %135, label %141, !dbg !2686

135:                                              ; preds = %131
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %128), !dbg !2687
  %136 = load ptr, ptr %128, align 8, !dbg !2688, !tbaa !2448
  %137 = getelementptr inbounds ptr, ptr %136, i64 6, !dbg !2688
  %138 = load ptr, ptr %137, align 8, !dbg !2688
  %139 = call noundef signext i8 %138(ptr noundef nonnull align 8 dereferenceable(570) %128, i8 noundef signext 32), !dbg !2688
  %140 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2689, !tbaa !2448
  br label %141, !dbg !2700

141:                                              ; preds = %135, %131
  %142 = phi ptr [ %140, %135 ], [ %119, %131 ], !dbg !2689
  store i8 1, ptr %123, align 1, !dbg !2701, !tbaa !2671
  br label %143, !dbg !2702

143:                                              ; preds = %117, %141
  %144 = phi ptr [ %119, %117 ], [ %142, %141 ], !dbg !2689
  call void @llvm.dbg.value(metadata i8 poison, metadata !2657, metadata !DIExpression()), !dbg !2659
  %145 = getelementptr inbounds %"class.std::basic_ios", ptr %122, i64 0, i32 2, !dbg !2703
  store i8 32, ptr %145, align 8, !dbg !2704, !tbaa !2705
  call void @llvm.dbg.value(metadata i32 8, metadata !2698, metadata !DIExpression()), !dbg !2706
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2697, metadata !DIExpression()), !dbg !2706
  %146 = getelementptr i8, ptr %144, i64 -24, !dbg !2689
  %147 = load i64, ptr %146, align 8, !dbg !2689
  %148 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %147, !dbg !2689
  call void @llvm.dbg.value(metadata ptr %148, metadata !2707, metadata !DIExpression()), !dbg !2717
  call void @llvm.dbg.value(metadata i64 8, metadata !2714, metadata !DIExpression()), !dbg !2717
  %149 = getelementptr inbounds %"class.std::ios_base", ptr %148, i64 0, i32 2, !dbg !2719
  call void @llvm.dbg.value(metadata i64 poison, metadata !2715, metadata !DIExpression()), !dbg !2717
  store i64 8, ptr %149, align 8, !dbg !2720, !tbaa !2721
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2722
  call void @llvm.dbg.value(metadata ptr @.str.5, metadata !2364, metadata !DIExpression()), !dbg !2722
  %150 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.5, i64 noundef 3), !dbg !2724
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2725
  call void @llvm.dbg.value(metadata ptr @.str.6, metadata !2364, metadata !DIExpression()), !dbg !2725
  %151 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.6, i64 noundef 5), !dbg !2727
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2337, metadata !DIExpression()), !dbg !2728
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2426, metadata !DIExpression()), !dbg !2730
  %152 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout), !dbg !2732
  %153 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294968320, i32 1, i64 noundef 0, ptr noundef null), !dbg !2733
  %154 = icmp eq i32 %153, 0, !dbg !2733
  br i1 %154, label %199, label %219, !dbg !2734

155:                                              ; preds = %115, %186
  %156 = phi i64 [ 0, %115 ], [ %197, %186 ]
  call void @llvm.dbg.value(metadata i64 %156, metadata !2315, metadata !DIExpression()), !dbg !2630
  %157 = and i64 %156, 15, !dbg !2735
  %158 = icmp eq i64 %157, 0, !dbg !2739
  br i1 %158, label %159, label %161, !dbg !2740

159:                                              ; preds = %155
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2741
  call void @llvm.dbg.value(metadata ptr @.str.3, metadata !2364, metadata !DIExpression()), !dbg !2741
  %160 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5), !dbg !2743
  br label %161, !dbg !2744

161:                                              ; preds = %159, %155
  call void @llvm.dbg.value(metadata i8 32, metadata !2636, metadata !DIExpression()), !dbg !2745
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2645, metadata !DIExpression()), !dbg !2745
  %162 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2747, !tbaa !2448
  %163 = getelementptr i8, ptr %162, i64 -24, !dbg !2747
  %164 = load i64, ptr %163, align 8, !dbg !2747
  %165 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %164, !dbg !2747
  call void @llvm.dbg.value(metadata ptr %165, metadata !2649, metadata !DIExpression()), !dbg !2748
  call void @llvm.dbg.value(metadata i8 32, metadata !2656, metadata !DIExpression()), !dbg !2748
  call void @llvm.dbg.value(metadata ptr %165, metadata !2661, metadata !DIExpression()), !dbg !2750
  %166 = getelementptr inbounds %"class.std::basic_ios", ptr %165, i64 0, i32 3, !dbg !2752
  %167 = load i8, ptr %166, align 1, !dbg !2752, !tbaa !2671, !range !2672, !noundef !297
  %168 = icmp eq i8 %167, 0, !dbg !2752
  br i1 %168, label %169, label %186, !dbg !2753

169:                                              ; preds = %161
  call void @llvm.dbg.value(metadata ptr %165, metadata !2450, metadata !DIExpression()), !dbg !2754
  call void @llvm.dbg.value(metadata i8 32, metadata !2462, metadata !DIExpression()), !dbg !2754
  %170 = getelementptr inbounds %"class.std::basic_ios", ptr %165, i64 0, i32 5, !dbg !2756
  %171 = load ptr, ptr %170, align 8, !dbg !2756, !tbaa !2467
  call void @llvm.dbg.value(metadata ptr %171, metadata !2476, metadata !DIExpression()), !dbg !2757
  %172 = icmp eq ptr %171, null, !dbg !2759
  br i1 %172, label %173, label %174, !dbg !2760

173:                                              ; preds = %169
  call void @_ZSt16__throw_bad_castv() #21, !dbg !2761
  unreachable, !dbg !2761

174:                                              ; preds = %169
  call void @llvm.dbg.value(metadata ptr %171, metadata !2494, metadata !DIExpression()), !dbg !2762
  call void @llvm.dbg.value(metadata i8 32, metadata !2502, metadata !DIExpression()), !dbg !2762
  %175 = getelementptr inbounds %"class.std::ctype", ptr %171, i64 0, i32 8, !dbg !2764
  %176 = load i8, ptr %175, align 8, !dbg !2764, !tbaa !2507
  %177 = icmp eq i8 %176, 0, !dbg !2764
  br i1 %177, label %178, label %184, !dbg !2765

178:                                              ; preds = %174
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %171), !dbg !2766
  %179 = load ptr, ptr %171, align 8, !dbg !2767, !tbaa !2448
  %180 = getelementptr inbounds ptr, ptr %179, i64 6, !dbg !2767
  %181 = load ptr, ptr %180, align 8, !dbg !2767
  %182 = call noundef signext i8 %181(ptr noundef nonnull align 8 dereferenceable(570) %171, i8 noundef signext 32), !dbg !2767
  %183 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2768, !tbaa !2448
  br label %184, !dbg !2770

184:                                              ; preds = %178, %174
  %185 = phi ptr [ %183, %178 ], [ %162, %174 ], !dbg !2768
  store i8 1, ptr %166, align 1, !dbg !2771, !tbaa !2671
  br label %186, !dbg !2772

186:                                              ; preds = %161, %184
  %187 = phi ptr [ %162, %161 ], [ %185, %184 ], !dbg !2768
  call void @llvm.dbg.value(metadata i8 poison, metadata !2657, metadata !DIExpression()), !dbg !2748
  %188 = getelementptr inbounds %"class.std::basic_ios", ptr %165, i64 0, i32 2, !dbg !2773
  store i8 32, ptr %188, align 8, !dbg !2774, !tbaa !2705
  call void @llvm.dbg.value(metadata i32 8, metadata !2698, metadata !DIExpression()), !dbg !2775
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2697, metadata !DIExpression()), !dbg !2775
  %189 = getelementptr i8, ptr %187, i64 -24, !dbg !2768
  %190 = load i64, ptr %189, align 8, !dbg !2768
  %191 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %190, !dbg !2768
  call void @llvm.dbg.value(metadata ptr %191, metadata !2707, metadata !DIExpression()), !dbg !2776
  call void @llvm.dbg.value(metadata i64 8, metadata !2714, metadata !DIExpression()), !dbg !2776
  %192 = getelementptr inbounds %"class.std::ios_base", ptr %191, i64 0, i32 2, !dbg !2778
  call void @llvm.dbg.value(metadata i64 poison, metadata !2715, metadata !DIExpression()), !dbg !2776
  store i64 8, ptr %192, align 8, !dbg !2779, !tbaa !2721
  %193 = getelementptr inbounds i64, ptr %107, i64 %156, !dbg !2780
  %194 = load i64, ptr %193, align 8, !dbg !2780, !tbaa !2781
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2782, metadata !DIExpression()), !dbg !2789
  call void @llvm.dbg.value(metadata i64 %194, metadata !2788, metadata !DIExpression()), !dbg !2789
  %195 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertIlEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %194), !dbg !2791
  call void @llvm.dbg.value(metadata ptr %195, metadata !2358, metadata !DIExpression()), !dbg !2792
  call void @llvm.dbg.value(metadata ptr @.str.4, metadata !2364, metadata !DIExpression()), !dbg !2792
  %196 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %195, ptr noundef nonnull @.str.4, i64 noundef 1), !dbg !2794
  %197 = add nuw nsw i64 %156, 1, !dbg !2795
  call void @llvm.dbg.value(metadata i64 %197, metadata !2315, metadata !DIExpression()), !dbg !2630
  %198 = icmp eq i64 %197, 128, !dbg !2796
  br i1 %198, label %117, label %155, !dbg !2631, !llvm.loop !2797

199:                                              ; preds = %143
  %200 = load ptr, ptr %19, align 8, !dbg !2800, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %200, metadata !2306, metadata !DIExpression()), !dbg !2319
  %201 = load ptr, ptr %20, align 8, !dbg !2801, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %201, metadata !2311, metadata !DIExpression()), !dbg !2319
  %202 = load ptr, ptr %21, align 8, !dbg !2802, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %202, metadata !2312, metadata !DIExpression()), !dbg !2319
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3), !dbg !2734
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4), !dbg !2734
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5), !dbg !2734
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6), !dbg !2734
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %7), !dbg !2734
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %8), !dbg !2734
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %9), !dbg !2734
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %10), !dbg !2734
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %11), !dbg !2734
  store ptr %200, ptr %3, align 8, !dbg !2734, !tbaa !2290
  store ptr %201, ptr %4, align 8, !dbg !2734, !tbaa !2290
  store ptr %202, ptr %5, align 8, !dbg !2734, !tbaa !2290
  store i32 %0, ptr %6, align 4, !dbg !2734, !tbaa !2294
  store ptr %3, ptr %11, align 16, !dbg !2734
  %203 = getelementptr inbounds ptr, ptr %11, i64 1, !dbg !2734
  store ptr %4, ptr %203, align 8, !dbg !2734
  %204 = getelementptr inbounds ptr, ptr %11, i64 2, !dbg !2734
  store ptr %5, ptr %204, align 16, !dbg !2734
  %205 = getelementptr inbounds ptr, ptr %11, i64 3, !dbg !2734
  store ptr %6, ptr %205, align 8, !dbg !2734
  %206 = call i32 @__hipPopCallConfiguration(ptr nonnull %7, ptr nonnull %8, ptr nonnull %9, ptr nonnull %10), !dbg !2734
  %207 = load i64, ptr %9, align 8, !dbg !2734
  %208 = load ptr, ptr %10, align 8, !dbg !2734
  %209 = load i64, ptr %7, align 8, !dbg !2734
  %210 = getelementptr inbounds i8, ptr %7, i64 8, !dbg !2734
  %211 = load i32, ptr %210, align 8, !dbg !2734
  %212 = load i64, ptr %8, align 8, !dbg !2734
  %213 = getelementptr inbounds i8, ptr %8, i64 8, !dbg !2734
  %214 = load i32, ptr %213, align 8, !dbg !2734
  %215 = alloca ptr, align 8
  %216 = call ptr @scabbard.trace.register_job(ptr %208)
  store ptr %216, ptr %215, align 8
  %217 = getelementptr inbounds ptr, ptr %11, i64 4
  store ptr %215, ptr %217, align 8
  %218 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z15tick_all_kernelPU7_AtomicmPmPli, i64 %209, i32 %211, i64 %212, i32 %214, ptr noundef nonnull %11, i64 noundef %207, ptr noundef %208), !dbg !2734
  call void @scabbard.trace.register_job_callback(ptr %216, ptr %208)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3), !dbg !2734
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4), !dbg !2734
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5), !dbg !2734
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6), !dbg !2734
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %7), !dbg !2734
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %8), !dbg !2734
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9), !dbg !2734
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %10), !dbg !2734
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %11), !dbg !2734
  br label %219, !dbg !2734

219:                                              ; preds = %199, %143
  %220 = getelementptr inbounds %struct.timespec, ptr %2, i64 0, i32 1
  br label %221, !dbg !2803

221:                                              ; preds = %235, %219
  %222 = phi i64 [ %236, %235 ], [ 64, %219 ]
  br label %223, !dbg !2804

223:                                              ; preds = %221, %231
  call void @llvm.dbg.value(metadata i64 %222, metadata !2302, metadata !DIExpression()), !dbg !2319
  call void @llvm.dbg.value(metadata ptr undef, metadata !2811, metadata !DIExpression()), !dbg !2830
  call void @llvm.dbg.value(metadata i64 0, metadata !2812, metadata !DIExpression()), !dbg !2830
  call void @llvm.dbg.value(metadata i64 1000000, metadata !2819, metadata !DIExpression()), !dbg !2830
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #19, !dbg !2831
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2825, metadata !DIExpression()), !dbg !2832
  store i64 0, ptr %2, align 8, !dbg !2833, !tbaa !2834
  store i64 1000000, ptr %220, align 8, !dbg !2833, !tbaa !2836
  br label %224, !dbg !2804

224:                                              ; preds = %227, %223
  %225 = call i32 @nanosleep(ptr noundef nonnull %2, ptr noundef nonnull %2), !dbg !2837
  %226 = icmp eq i32 %225, -1, !dbg !2838
  br i1 %226, label %227, label %231, !dbg !2839

227:                                              ; preds = %224
  %228 = tail call ptr @__errno_location() #23, !dbg !2840
  %229 = load i32, ptr %228, align 4, !dbg !2840, !tbaa !2294
  %230 = icmp eq i32 %229, 4, !dbg !2841
  br i1 %230, label %224, label %231, !dbg !2804, !llvm.loop !2842

231:                                              ; preds = %224, %227
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #19, !dbg !2844
  %232 = load ptr, ptr %19, align 8, !dbg !2845, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %232, metadata !2306, metadata !DIExpression()), !dbg !2319
  %233 = load atomic i64, ptr %232 seq_cst, align 8, !dbg !2846, !tbaa !2512
  %234 = icmp eq i64 %233, 0, !dbg !2847
  br i1 %234, label %223, label %235, !dbg !2848

235:                                              ; preds = %231
  %236 = add nsw i64 %222, -1, !dbg !2849
  call void @llvm.dbg.value(metadata i64 %236, metadata !2302, metadata !DIExpression()), !dbg !2319
  %237 = icmp ugt i64 %222, 1, !dbg !2850
  br i1 %237, label %221, label %238, !dbg !2851, !llvm.loop !2852

238:                                              ; preds = %235
  %239 = load ptr, ptr %19, align 8, !dbg !2854, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %239, metadata !2306, metadata !DIExpression()), !dbg !2319
  %240 = load atomic i64, ptr %239 seq_cst, align 8, !dbg !2856, !tbaa !2512
  %241 = icmp eq i64 %240, 0, !dbg !2857
  br i1 %241, label %268, label %242, !dbg !2858

242:                                              ; preds = %238
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2859
  call void @llvm.dbg.value(metadata ptr @.str.7, metadata !2364, metadata !DIExpression()), !dbg !2859
  %243 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.7, i64 noundef 59), !dbg !2861
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2337, metadata !DIExpression()), !dbg !2862
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !2862
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2442, metadata !DIExpression()), !dbg !2864
  %244 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2866, !tbaa !2448
  %245 = getelementptr i8, ptr %244, i64 -24, !dbg !2866
  %246 = load i64, ptr %245, align 8, !dbg !2866
  %247 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %246, !dbg !2866
  call void @llvm.dbg.value(metadata ptr %247, metadata !2450, metadata !DIExpression()), !dbg !2867
  call void @llvm.dbg.value(metadata i8 10, metadata !2462, metadata !DIExpression()), !dbg !2867
  %248 = getelementptr inbounds %"class.std::basic_ios", ptr %247, i64 0, i32 5, !dbg !2869
  %249 = load ptr, ptr %248, align 8, !dbg !2869, !tbaa !2467
  call void @llvm.dbg.value(metadata ptr %249, metadata !2476, metadata !DIExpression()), !dbg !2870
  %250 = icmp eq ptr %249, null, !dbg !2872
  br i1 %250, label %251, label %252, !dbg !2873

251:                                              ; preds = %242
  call void @_ZSt16__throw_bad_castv() #21, !dbg !2874
  unreachable, !dbg !2874

252:                                              ; preds = %242
  call void @llvm.dbg.value(metadata ptr %249, metadata !2494, metadata !DIExpression()), !dbg !2875
  call void @llvm.dbg.value(metadata i8 10, metadata !2502, metadata !DIExpression()), !dbg !2875
  %253 = getelementptr inbounds %"class.std::ctype", ptr %249, i64 0, i32 8, !dbg !2877
  %254 = load i8, ptr %253, align 8, !dbg !2877, !tbaa !2507
  %255 = icmp eq i8 %254, 0, !dbg !2877
  br i1 %255, label %259, label %256, !dbg !2878

256:                                              ; preds = %252
  %257 = getelementptr inbounds %"class.std::ctype", ptr %249, i64 0, i32 9, i64 10, !dbg !2879
  %258 = load i8, ptr %257, align 1, !dbg !2879, !tbaa !2512
  br label %264, !dbg !2880

259:                                              ; preds = %252
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %249), !dbg !2881
  %260 = load ptr, ptr %249, align 8, !dbg !2882, !tbaa !2448
  %261 = getelementptr inbounds ptr, ptr %260, i64 6, !dbg !2882
  %262 = load ptr, ptr %261, align 8, !dbg !2882
  %263 = call noundef signext i8 %262(ptr noundef nonnull align 8 dereferenceable(570) %249, i8 noundef signext 10), !dbg !2882
  br label %264, !dbg !2883

264:                                              ; preds = %256, %259
  %265 = phi i8 [ %258, %256 ], [ %263, %259 ], !dbg !2875
  %266 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %265), !dbg !2884
  call void @llvm.dbg.value(metadata ptr %266, metadata !2426, metadata !DIExpression()), !dbg !2885
  %267 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %266), !dbg !2887
  br label %268, !dbg !2888

268:                                              ; preds = %264, %238
  %269 = load ptr, ptr %20, align 8, !dbg !2889, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %269, metadata !2311, metadata !DIExpression()), !dbg !2319
  call void @"scabbard.trace.host.trace_append$mem"(i16 -32768, ptr null, ptr nonnull @"scabbard.metadata.host.srcId$0x0001", i32 130, i32 17)
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4138, ptr nonnull %66, ptr nonnull @"scabbard.metadata.host.srcId$0x0001", i32 130, i32 17, i64 8192)
  %270 = call i32 @hipMemcpy(ptr noundef nonnull %66, ptr noundef %269, i64 noundef 8192, i32 noundef 2), !dbg !2890
  call void @llvm.dbg.value(metadata i32 %270, metadata !2323, metadata !DIExpression()), !dbg !2891
  %271 = icmp eq i32 %270, 0, !dbg !2893
  br i1 %271, label %276, label %272, !dbg !2894

272:                                              ; preds = %268
  %273 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2895
  %274 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %273, i32 noundef %270), !dbg !2896
  call void @llvm.dbg.value(metadata ptr %274, metadata !2337, metadata !DIExpression()), !dbg !2897
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !2897
  %275 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %274), !dbg !2899
  call void @exit(i32 noundef 1) #20, !dbg !2900
  unreachable, !dbg !2900

276:                                              ; preds = %268
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2901
  call void @llvm.dbg.value(metadata ptr @.str.8, metadata !2364, metadata !DIExpression()), !dbg !2901
  %277 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.8, i64 noundef 23), !dbg !2903
  %278 = load ptr, ptr %19, align 8, !dbg !2904, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %278, metadata !2306, metadata !DIExpression()), !dbg !2319
  %279 = load atomic i64, ptr %278 seq_cst, align 8, !dbg !2905, !tbaa !2512
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2906, metadata !DIExpression()), !dbg !2913
  call void @llvm.dbg.value(metadata i64 %279, metadata !2912, metadata !DIExpression()), !dbg !2913
  %280 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %279), !dbg !2915
  call void @llvm.dbg.value(metadata ptr %280, metadata !2358, metadata !DIExpression()), !dbg !2916
  call void @llvm.dbg.value(metadata ptr @.str.9, metadata !2364, metadata !DIExpression()), !dbg !2916
  %281 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %280, ptr noundef nonnull @.str.9, i64 noundef 35), !dbg !2918
  call void @llvm.dbg.value(metadata i64 0, metadata !2317, metadata !DIExpression()), !dbg !2919
  br label %367, !dbg !2920

282:                                              ; preds = %398
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2921
  call void @llvm.dbg.value(metadata ptr @.str.3, metadata !2364, metadata !DIExpression()), !dbg !2921
  %283 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5), !dbg !2924
  call void @llvm.dbg.value(metadata i8 32, metadata !2636, metadata !DIExpression()), !dbg !2925
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2645, metadata !DIExpression()), !dbg !2925
  %284 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2927, !tbaa !2448
  %285 = getelementptr i8, ptr %284, i64 -24, !dbg !2927
  %286 = load i64, ptr %285, align 8, !dbg !2927
  %287 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %286, !dbg !2927
  call void @llvm.dbg.value(metadata ptr %287, metadata !2649, metadata !DIExpression()), !dbg !2928
  call void @llvm.dbg.value(metadata i8 32, metadata !2656, metadata !DIExpression()), !dbg !2928
  call void @llvm.dbg.value(metadata ptr %287, metadata !2661, metadata !DIExpression()), !dbg !2930
  %288 = getelementptr inbounds %"class.std::basic_ios", ptr %287, i64 0, i32 3, !dbg !2932
  %289 = load i8, ptr %288, align 1, !dbg !2932, !tbaa !2671, !range !2672, !noundef !297
  %290 = icmp eq i8 %289, 0, !dbg !2932
  br i1 %290, label %291, label %308, !dbg !2933

291:                                              ; preds = %282
  call void @llvm.dbg.value(metadata ptr %287, metadata !2450, metadata !DIExpression()), !dbg !2934
  call void @llvm.dbg.value(metadata i8 32, metadata !2462, metadata !DIExpression()), !dbg !2934
  %292 = getelementptr inbounds %"class.std::basic_ios", ptr %287, i64 0, i32 5, !dbg !2936
  %293 = load ptr, ptr %292, align 8, !dbg !2936, !tbaa !2467
  call void @llvm.dbg.value(metadata ptr %293, metadata !2476, metadata !DIExpression()), !dbg !2937
  %294 = icmp eq ptr %293, null, !dbg !2939
  br i1 %294, label %295, label %296, !dbg !2940

295:                                              ; preds = %291
  call void @_ZSt16__throw_bad_castv() #21, !dbg !2941
  unreachable, !dbg !2941

296:                                              ; preds = %291
  call void @llvm.dbg.value(metadata ptr %293, metadata !2494, metadata !DIExpression()), !dbg !2942
  call void @llvm.dbg.value(metadata i8 32, metadata !2502, metadata !DIExpression()), !dbg !2942
  %297 = getelementptr inbounds %"class.std::ctype", ptr %293, i64 0, i32 8, !dbg !2944
  %298 = load i8, ptr %297, align 8, !dbg !2944, !tbaa !2507
  %299 = icmp eq i8 %298, 0, !dbg !2944
  br i1 %299, label %300, label %306, !dbg !2945

300:                                              ; preds = %296
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %293), !dbg !2946
  %301 = load ptr, ptr %293, align 8, !dbg !2947, !tbaa !2448
  %302 = getelementptr inbounds ptr, ptr %301, i64 6, !dbg !2947
  %303 = load ptr, ptr %302, align 8, !dbg !2947
  %304 = call noundef signext i8 %303(ptr noundef nonnull align 8 dereferenceable(570) %293, i8 noundef signext 32), !dbg !2947
  %305 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2948, !tbaa !2448
  br label %306, !dbg !2950

306:                                              ; preds = %300, %296
  %307 = phi ptr [ %305, %300 ], [ %284, %296 ], !dbg !2948
  store i8 1, ptr %288, align 1, !dbg !2951, !tbaa !2671
  br label %308, !dbg !2952

308:                                              ; preds = %282, %306
  %309 = phi ptr [ %284, %282 ], [ %307, %306 ], !dbg !2948
  call void @llvm.dbg.value(metadata i8 poison, metadata !2657, metadata !DIExpression()), !dbg !2928
  %310 = getelementptr inbounds %"class.std::basic_ios", ptr %287, i64 0, i32 2, !dbg !2953
  store i8 32, ptr %310, align 8, !dbg !2954, !tbaa !2705
  call void @llvm.dbg.value(metadata i32 8, metadata !2698, metadata !DIExpression()), !dbg !2955
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2697, metadata !DIExpression()), !dbg !2955
  %311 = getelementptr i8, ptr %309, i64 -24, !dbg !2948
  %312 = load i64, ptr %311, align 8, !dbg !2948
  %313 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %312, !dbg !2948
  call void @llvm.dbg.value(metadata ptr %313, metadata !2707, metadata !DIExpression()), !dbg !2956
  call void @llvm.dbg.value(metadata i64 8, metadata !2714, metadata !DIExpression()), !dbg !2956
  %314 = getelementptr inbounds %"class.std::ios_base", ptr %313, i64 0, i32 2, !dbg !2958
  call void @llvm.dbg.value(metadata i64 poison, metadata !2715, metadata !DIExpression()), !dbg !2956
  store i64 8, ptr %314, align 8, !dbg !2959, !tbaa !2721
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2960
  call void @llvm.dbg.value(metadata ptr @.str.5, metadata !2364, metadata !DIExpression()), !dbg !2960
  %315 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.5, i64 noundef 3), !dbg !2962
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2963
  call void @llvm.dbg.value(metadata ptr @.str.6, metadata !2364, metadata !DIExpression()), !dbg !2963
  %316 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.6, i64 noundef 5), !dbg !2965
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2337, metadata !DIExpression()), !dbg !2966
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !2966
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2442, metadata !DIExpression()), !dbg !2968
  %317 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2970, !tbaa !2448
  %318 = getelementptr i8, ptr %317, i64 -24, !dbg !2970
  %319 = load i64, ptr %318, align 8, !dbg !2970
  %320 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %319, !dbg !2970
  call void @llvm.dbg.value(metadata ptr %320, metadata !2450, metadata !DIExpression()), !dbg !2971
  call void @llvm.dbg.value(metadata i8 10, metadata !2462, metadata !DIExpression()), !dbg !2971
  %321 = getelementptr inbounds %"class.std::basic_ios", ptr %320, i64 0, i32 5, !dbg !2973
  %322 = load ptr, ptr %321, align 8, !dbg !2973, !tbaa !2467
  call void @llvm.dbg.value(metadata ptr %322, metadata !2476, metadata !DIExpression()), !dbg !2974
  %323 = icmp eq ptr %322, null, !dbg !2976
  br i1 %323, label %324, label %325, !dbg !2977

324:                                              ; preds = %308
  call void @_ZSt16__throw_bad_castv() #21, !dbg !2978
  unreachable, !dbg !2978

325:                                              ; preds = %308
  call void @llvm.dbg.value(metadata ptr %322, metadata !2494, metadata !DIExpression()), !dbg !2979
  call void @llvm.dbg.value(metadata i8 10, metadata !2502, metadata !DIExpression()), !dbg !2979
  %326 = getelementptr inbounds %"class.std::ctype", ptr %322, i64 0, i32 8, !dbg !2981
  %327 = load i8, ptr %326, align 8, !dbg !2981, !tbaa !2507
  %328 = icmp eq i8 %327, 0, !dbg !2981
  br i1 %328, label %332, label %329, !dbg !2982

329:                                              ; preds = %325
  %330 = getelementptr inbounds %"class.std::ctype", ptr %322, i64 0, i32 9, i64 10, !dbg !2983
  %331 = load i8, ptr %330, align 1, !dbg !2983, !tbaa !2512
  br label %337, !dbg !2984

332:                                              ; preds = %325
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %322), !dbg !2985
  %333 = load ptr, ptr %322, align 8, !dbg !2986, !tbaa !2448
  %334 = getelementptr inbounds ptr, ptr %333, i64 6, !dbg !2986
  %335 = load ptr, ptr %334, align 8, !dbg !2986
  %336 = call noundef signext i8 %335(ptr noundef nonnull align 8 dereferenceable(570) %322, i8 noundef signext 10), !dbg !2986
  br label %337, !dbg !2987

337:                                              ; preds = %329, %332
  %338 = phi i8 [ %331, %329 ], [ %336, %332 ], !dbg !2979
  %339 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %338), !dbg !2988
  call void @llvm.dbg.value(metadata ptr %339, metadata !2426, metadata !DIExpression()), !dbg !2989
  %340 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %339), !dbg !2991
  %341 = load ptr, ptr %20, align 8, !dbg !2992, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %341, metadata !2311, metadata !DIExpression()), !dbg !2319
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4160, ptr null, ptr nonnull @"scabbard.metadata.host.srcId$0x0001", i32 148, i32 17, i64 0)
  %342 = call i32 @hipFree(ptr noundef %341), !dbg !2993
  call void @llvm.dbg.value(metadata i32 %342, metadata !2323, metadata !DIExpression()), !dbg !2994
  %343 = icmp eq i32 %342, 0, !dbg !2996
  br i1 %343, label %348, label %344, !dbg !2997

344:                                              ; preds = %337
  %345 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2998
  %346 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %345, i32 noundef %342), !dbg !2999
  call void @llvm.dbg.value(metadata ptr %346, metadata !2337, metadata !DIExpression()), !dbg !3000
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !3000
  %347 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %346), !dbg !3002
  call void @exit(i32 noundef 1) #20, !dbg !3003
  unreachable, !dbg !3003

348:                                              ; preds = %337
  %349 = load ptr, ptr %19, align 8, !dbg !3004, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %349, metadata !2306, metadata !DIExpression()), !dbg !2319
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4160, ptr null, ptr nonnull @"scabbard.metadata.host.srcId$0x0001", i32 149, i32 17, i64 0)
  %350 = call i32 @hipFree(ptr noundef %349), !dbg !3005
  call void @llvm.dbg.value(metadata i32 %350, metadata !2323, metadata !DIExpression()), !dbg !3006
  %351 = icmp eq i32 %350, 0, !dbg !3008
  br i1 %351, label %356, label %352, !dbg !3009

352:                                              ; preds = %348
  %353 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !3010
  %354 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %353, i32 noundef %350), !dbg !3011
  call void @llvm.dbg.value(metadata ptr %354, metadata !2337, metadata !DIExpression()), !dbg !3012
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !3012
  %355 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %354), !dbg !3014
  call void @exit(i32 noundef 1) #20, !dbg !3015
  unreachable, !dbg !3015

356:                                              ; preds = %348
  %357 = load ptr, ptr %21, align 8, !dbg !3016, !tbaa !2290
  call void @llvm.dbg.value(metadata ptr %357, metadata !2312, metadata !DIExpression()), !dbg !2319
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4160, ptr null, ptr nonnull @"scabbard.metadata.host.srcId$0x0001", i32 150, i32 17, i64 0)
  %358 = call i32 @hipFree(ptr noundef %357), !dbg !3017
  call void @llvm.dbg.value(metadata i32 %358, metadata !2323, metadata !DIExpression()), !dbg !3018
  %359 = icmp eq i32 %358, 0, !dbg !3020
  br i1 %359, label %364, label %360, !dbg !3021

360:                                              ; preds = %356
  %361 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !3022
  %362 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %361, i32 noundef %358), !dbg !3023
  call void @llvm.dbg.value(metadata ptr %362, metadata !2337, metadata !DIExpression()), !dbg !3024
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !3024
  %363 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %362), !dbg !3026
  call void @exit(i32 noundef 1) #20, !dbg !3027
  unreachable, !dbg !3027

364:                                              ; preds = %356
  call void @_ZdaPv(ptr noundef nonnull %66) #24, !dbg !3028
  call void @_ZdaPv(ptr noundef nonnull %107) #24, !dbg !3029
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !3030
  call void @llvm.dbg.value(metadata ptr @.str.10, metadata !2364, metadata !DIExpression()), !dbg !3030
  %365 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.10, i64 noundef 34), !dbg !3032
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2337, metadata !DIExpression()), !dbg !3033
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2426, metadata !DIExpression()), !dbg !3035
  %366 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout), !dbg !3037
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %21) #19, !dbg !3038
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %20) #19, !dbg !3038
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %19) #19, !dbg !3038
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %18) #19, !dbg !3038
  ret void, !dbg !3038

367:                                              ; preds = %276, %398
  %368 = phi i64 [ 0, %276 ], [ %409, %398 ]
  call void @llvm.dbg.value(metadata i64 %368, metadata !2317, metadata !DIExpression()), !dbg !2919
  %369 = and i64 %368, 15, !dbg !3039
  %370 = icmp eq i64 %369, 0, !dbg !3043
  br i1 %370, label %371, label %373, !dbg !3044

371:                                              ; preds = %367
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !3045
  call void @llvm.dbg.value(metadata ptr @.str.3, metadata !2364, metadata !DIExpression()), !dbg !3045
  %372 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5), !dbg !3047
  br label %373, !dbg !3048

373:                                              ; preds = %371, %367
  call void @llvm.dbg.value(metadata i8 32, metadata !2636, metadata !DIExpression()), !dbg !3049
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2645, metadata !DIExpression()), !dbg !3049
  %374 = load ptr, ptr @_ZSt4cout, align 8, !dbg !3051, !tbaa !2448
  %375 = getelementptr i8, ptr %374, i64 -24, !dbg !3051
  %376 = load i64, ptr %375, align 8, !dbg !3051
  %377 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %376, !dbg !3051
  call void @llvm.dbg.value(metadata ptr %377, metadata !2649, metadata !DIExpression()), !dbg !3052
  call void @llvm.dbg.value(metadata i8 32, metadata !2656, metadata !DIExpression()), !dbg !3052
  call void @llvm.dbg.value(metadata ptr %377, metadata !2661, metadata !DIExpression()), !dbg !3054
  %378 = getelementptr inbounds %"class.std::basic_ios", ptr %377, i64 0, i32 3, !dbg !3056
  %379 = load i8, ptr %378, align 1, !dbg !3056, !tbaa !2671, !range !2672, !noundef !297
  %380 = icmp eq i8 %379, 0, !dbg !3056
  br i1 %380, label %381, label %398, !dbg !3057

381:                                              ; preds = %373
  call void @llvm.dbg.value(metadata ptr %377, metadata !2450, metadata !DIExpression()), !dbg !3058
  call void @llvm.dbg.value(metadata i8 32, metadata !2462, metadata !DIExpression()), !dbg !3058
  %382 = getelementptr inbounds %"class.std::basic_ios", ptr %377, i64 0, i32 5, !dbg !3060
  %383 = load ptr, ptr %382, align 8, !dbg !3060, !tbaa !2467
  call void @llvm.dbg.value(metadata ptr %383, metadata !2476, metadata !DIExpression()), !dbg !3061
  %384 = icmp eq ptr %383, null, !dbg !3063
  br i1 %384, label %385, label %386, !dbg !3064

385:                                              ; preds = %381
  call void @_ZSt16__throw_bad_castv() #21, !dbg !3065
  unreachable, !dbg !3065

386:                                              ; preds = %381
  call void @llvm.dbg.value(metadata ptr %383, metadata !2494, metadata !DIExpression()), !dbg !3066
  call void @llvm.dbg.value(metadata i8 32, metadata !2502, metadata !DIExpression()), !dbg !3066
  %387 = getelementptr inbounds %"class.std::ctype", ptr %383, i64 0, i32 8, !dbg !3068
  %388 = load i8, ptr %387, align 8, !dbg !3068, !tbaa !2507
  %389 = icmp eq i8 %388, 0, !dbg !3068
  br i1 %389, label %390, label %396, !dbg !3069

390:                                              ; preds = %386
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %383), !dbg !3070
  %391 = load ptr, ptr %383, align 8, !dbg !3071, !tbaa !2448
  %392 = getelementptr inbounds ptr, ptr %391, i64 6, !dbg !3071
  %393 = load ptr, ptr %392, align 8, !dbg !3071
  %394 = call noundef signext i8 %393(ptr noundef nonnull align 8 dereferenceable(570) %383, i8 noundef signext 32), !dbg !3071
  %395 = load ptr, ptr @_ZSt4cout, align 8, !dbg !3072, !tbaa !2448
  br label %396, !dbg !3074

396:                                              ; preds = %390, %386
  %397 = phi ptr [ %395, %390 ], [ %374, %386 ], !dbg !3072
  store i8 1, ptr %378, align 1, !dbg !3075, !tbaa !2671
  br label %398, !dbg !3076

398:                                              ; preds = %373, %396
  %399 = phi ptr [ %374, %373 ], [ %397, %396 ], !dbg !3072
  call void @llvm.dbg.value(metadata i8 poison, metadata !2657, metadata !DIExpression()), !dbg !3052
  %400 = getelementptr inbounds %"class.std::basic_ios", ptr %377, i64 0, i32 2, !dbg !3077
  store i8 32, ptr %400, align 8, !dbg !3078, !tbaa !2705
  call void @llvm.dbg.value(metadata i32 8, metadata !2698, metadata !DIExpression()), !dbg !3079
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2697, metadata !DIExpression()), !dbg !3079
  %401 = getelementptr i8, ptr %399, i64 -24, !dbg !3072
  %402 = load i64, ptr %401, align 8, !dbg !3072
  %403 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %402, !dbg !3072
  call void @llvm.dbg.value(metadata ptr %403, metadata !2707, metadata !DIExpression()), !dbg !3080
  call void @llvm.dbg.value(metadata i64 8, metadata !2714, metadata !DIExpression()), !dbg !3080
  %404 = getelementptr inbounds %"class.std::ios_base", ptr %403, i64 0, i32 2, !dbg !3082
  call void @llvm.dbg.value(metadata i64 poison, metadata !2715, metadata !DIExpression()), !dbg !3080
  store i64 8, ptr %404, align 8, !dbg !3083, !tbaa !2721
  %405 = getelementptr inbounds i64, ptr %66, i64 %368, !dbg !3084
  %406 = load i64, ptr %405, align 8, !dbg !3084, !tbaa !2781
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2906, metadata !DIExpression()), !dbg !3085
  call void @llvm.dbg.value(metadata i64 %406, metadata !2912, metadata !DIExpression()), !dbg !3085
  %407 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %406), !dbg !3087
  call void @llvm.dbg.value(metadata ptr %407, metadata !2358, metadata !DIExpression()), !dbg !3088
  call void @llvm.dbg.value(metadata ptr @.str.4, metadata !2364, metadata !DIExpression()), !dbg !3088
  %408 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %407, ptr noundef nonnull @.str.4, i64 noundef 1), !dbg !3090
  %409 = add nuw nsw i64 %368, 1, !dbg !3091
  call void @llvm.dbg.value(metadata i64 %409, metadata !2317, metadata !DIExpression()), !dbg !2919
  %410 = icmp eq i64 %409, 128, !dbg !3092
  br i1 %410, label %282, label %367, !dbg !2920, !llvm.loop !3093
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #6

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13__HIP_CHECK__10hipError_t(i32 noundef %0) local_unnamed_addr #7 !dbg !2324 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !2323, metadata !DIExpression()), !dbg !3095
  %2 = icmp eq i32 %0, 0, !dbg !3096
  br i1 %2, label %7, label %3, !dbg !3097

3:                                                ; preds = %1
  %4 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !3098
  %5 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %4, i32 noundef %0), !dbg !3099
  call void @llvm.dbg.value(metadata ptr %5, metadata !2337, metadata !DIExpression()), !dbg !3100
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !3100
  %6 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !3102
  tail call void @exit(i32 noundef 1) #20, !dbg !3103
  unreachable, !dbg !3103

7:                                                ; preds = %1
  ret void, !dbg !3104
}

declare !dbg !3105 dso_local i32 @hipGetDevice(ptr noundef) local_unnamed_addr #0

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) local_unnamed_addr #8

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #0

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #8

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull ptr @_Znam(i64 noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #10

declare !dbg !3108 dso_local i32 @hipMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare !dbg !3112 dso_local i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #0

; Function Attrs: norecurse uwtable
define dso_local void @_Z25__device_stub__dummy_initPl(ptr noundef %0) #3 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.dim3, align 8
  %4 = alloca %struct.dim3, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !2290
  %7 = alloca [2 x ptr], align 8
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
  %17 = alloca ptr, align 8
  %18 = call ptr @scabbard.trace.register_job(ptr %10)
  store ptr %18, ptr %17, align 8
  %19 = getelementptr inbounds ptr, ptr %7, i64 1
  store ptr %17, ptr %19, align 8
  %20 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z10dummy_initPl, i64 %11, i32 %13, i64 %14, i32 %16, ptr noundef nonnull %7, i64 noundef %9, ptr noundef %10)
  call void @scabbard.trace.register_job_callback(ptr %18, ptr %10)
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #6

declare !dbg !3118 dso_local i32 @hipFree(ptr noundef) local_unnamed_addr #0

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdaPv(ptr noundef) local_unnamed_addr #11

; Function Attrs: norecurse uwtable
define dso_local void @_Z27__device_stub__dummy_kernelv() #3 {
  %1 = alloca %struct.dim3, align 8
  %2 = alloca %struct.dim3, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [2 x ptr], align 8
  %6 = call i32 @__hipPopCallConfiguration(ptr nonnull %1, ptr nonnull %2, ptr nonnull %3, ptr nonnull %4)
  %7 = load i64, ptr %3, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %1, align 8
  %10 = getelementptr inbounds i8, ptr %1, i64 8
  %11 = load i32, ptr %10, align 8
  %12 = load i64, ptr %2, align 8
  %13 = getelementptr inbounds i8, ptr %2, i64 8
  %14 = load i32, ptr %13, align 8
  %15 = alloca ptr, align 8
  %16 = call ptr @scabbard.trace.register_job(ptr %8)
  store ptr %16, ptr %15, align 8
  %17 = getelementptr inbounds ptr, ptr %5, i64 1
  store ptr %15, ptr %17, align 8
  %18 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z12dummy_kernelv, i64 %9, i32 %11, i64 %12, i32 %14, ptr noundef nonnull %5, i64 noundef %7, ptr noundef %8)
  call void @scabbard.trace.register_job_callback(ptr %16, ptr %8)
  ret void
}

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #12 !dbg !2124 {
  tail call void @scabbard.trace.scabbard_init()
  %3 = alloca %struct.dim3, align 8
  %4 = alloca %struct.dim3, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca [2 x ptr], align 8
  %8 = alloca %struct.hipDeviceProp_tR0600, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !2128, metadata !DIExpression()), !dbg !3121
  call void @llvm.dbg.value(metadata ptr %1, metadata !2129, metadata !DIExpression()), !dbg !3121
  call void @llvm.lifetime.start.p0(i64 1472, ptr nonnull %8) #19, !dbg !3122
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2130, metadata !DIExpression()), !dbg !3123
  %9 = call i32 @hipGetDevicePropertiesR0600(ptr noundef nonnull %8, i32 noundef 0), !dbg !3124
  call void @llvm.dbg.value(metadata i32 %9, metadata !2323, metadata !DIExpression()), !dbg !3125
  %10 = icmp eq i32 %9, 0, !dbg !3127
  br i1 %10, label %15, label %11, !dbg !3128

11:                                               ; preds = %2
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !3129
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %12, i32 noundef %9), !dbg !3130
  call void @llvm.dbg.value(metadata ptr %13, metadata !2337, metadata !DIExpression()), !dbg !3131
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !3131
  %14 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %13), !dbg !3133
  call void @exit(i32 noundef 1) #20, !dbg !3134
  unreachable, !dbg !3134

15:                                               ; preds = %2
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !3135
  call void @llvm.dbg.value(metadata ptr @.str.11, metadata !2364, metadata !DIExpression()), !dbg !3135
  call void @llvm.dbg.value(metadata ptr @.str.11, metadata !3137, metadata !DIExpression()), !dbg !3140
  %16 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.11, i64 noundef 14), !dbg !3142
  %17 = getelementptr inbounds %struct.hipDeviceProp_tR0600, ptr %8, i64 0, i32 15, !dbg !3143
  %18 = load i32, ptr %17, align 4, !dbg !3143, !tbaa !3144
  %19 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %18), !dbg !3148
  call void @llvm.dbg.value(metadata ptr %19, metadata !2337, metadata !DIExpression()), !dbg !3149
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !3149
  call void @llvm.dbg.value(metadata ptr %19, metadata !2442, metadata !DIExpression()), !dbg !3151
  %20 = load ptr, ptr %19, align 8, !dbg !3153, !tbaa !2448
  %21 = getelementptr i8, ptr %20, i64 -24, !dbg !3153
  %22 = load i64, ptr %21, align 8, !dbg !3153
  %23 = getelementptr inbounds i8, ptr %19, i64 %22, !dbg !3153
  call void @llvm.dbg.value(metadata ptr %23, metadata !2450, metadata !DIExpression()), !dbg !3154
  call void @llvm.dbg.value(metadata i8 10, metadata !2462, metadata !DIExpression()), !dbg !3154
  %24 = getelementptr inbounds %"class.std::basic_ios", ptr %23, i64 0, i32 5, !dbg !3156
  %25 = load ptr, ptr %24, align 8, !dbg !3156, !tbaa !2467
  call void @llvm.dbg.value(metadata ptr %25, metadata !2476, metadata !DIExpression()), !dbg !3157
  %26 = icmp eq ptr %25, null, !dbg !3159
  br i1 %26, label %27, label %28, !dbg !3160

27:                                               ; preds = %15
  call void @_ZSt16__throw_bad_castv() #21, !dbg !3161
  unreachable, !dbg !3161

28:                                               ; preds = %15
  call void @llvm.dbg.value(metadata ptr %25, metadata !2494, metadata !DIExpression()), !dbg !3162
  call void @llvm.dbg.value(metadata i8 10, metadata !2502, metadata !DIExpression()), !dbg !3162
  %29 = getelementptr inbounds %"class.std::ctype", ptr %25, i64 0, i32 8, !dbg !3164
  %30 = load i8, ptr %29, align 8, !dbg !3164, !tbaa !2507
  %31 = icmp eq i8 %30, 0, !dbg !3164
  br i1 %31, label %35, label %32, !dbg !3165

32:                                               ; preds = %28
  %33 = getelementptr inbounds %"class.std::ctype", ptr %25, i64 0, i32 9, i64 10, !dbg !3166
  %34 = load i8, ptr %33, align 1, !dbg !3166, !tbaa !2512
  br label %40, !dbg !3167

35:                                               ; preds = %28
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %25), !dbg !3168
  %36 = load ptr, ptr %25, align 8, !dbg !3169, !tbaa !2448
  %37 = getelementptr inbounds ptr, ptr %36, i64 6, !dbg !3169
  %38 = load ptr, ptr %37, align 8, !dbg !3169
  %39 = call noundef signext i8 %38(ptr noundef nonnull align 8 dereferenceable(570) %25, i8 noundef signext 10), !dbg !3169
  br label %40, !dbg !3170

40:                                               ; preds = %32, %35
  %41 = phi i8 [ %34, %32 ], [ %39, %35 ], !dbg !3162
  %42 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %19, i8 noundef signext %41), !dbg !3171
  call void @llvm.dbg.value(metadata ptr %42, metadata !2426, metadata !DIExpression()), !dbg !3172
  %43 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %42), !dbg !3174
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !3175
  call void @llvm.dbg.value(metadata ptr @.str.12, metadata !2364, metadata !DIExpression()), !dbg !3175
  call void @llvm.dbg.value(metadata ptr @.str.12, metadata !3137, metadata !DIExpression()), !dbg !3177
  %44 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.12, i64 noundef 14), !dbg !3179
  %45 = getelementptr inbounds %struct.hipDeviceProp_tR0600, ptr %8, i64 0, i32 14, !dbg !3180
  %46 = load i32, ptr %45, align 8, !dbg !3180, !tbaa !3181
  %47 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %46), !dbg !3182
  call void @llvm.dbg.value(metadata ptr %47, metadata !2337, metadata !DIExpression()), !dbg !3183
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !3183
  call void @llvm.dbg.value(metadata ptr %47, metadata !2442, metadata !DIExpression()), !dbg !3185
  %48 = load ptr, ptr %47, align 8, !dbg !3187, !tbaa !2448
  %49 = getelementptr i8, ptr %48, i64 -24, !dbg !3187
  %50 = load i64, ptr %49, align 8, !dbg !3187
  %51 = getelementptr inbounds i8, ptr %47, i64 %50, !dbg !3187
  call void @llvm.dbg.value(metadata ptr %51, metadata !2450, metadata !DIExpression()), !dbg !3188
  call void @llvm.dbg.value(metadata i8 10, metadata !2462, metadata !DIExpression()), !dbg !3188
  %52 = getelementptr inbounds %"class.std::basic_ios", ptr %51, i64 0, i32 5, !dbg !3190
  %53 = load ptr, ptr %52, align 8, !dbg !3190, !tbaa !2467
  call void @llvm.dbg.value(metadata ptr %53, metadata !2476, metadata !DIExpression()), !dbg !3191
  %54 = icmp eq ptr %53, null, !dbg !3193
  br i1 %54, label %55, label %56, !dbg !3194

55:                                               ; preds = %40
  call void @_ZSt16__throw_bad_castv() #21, !dbg !3195
  unreachable, !dbg !3195

56:                                               ; preds = %40
  call void @llvm.dbg.value(metadata ptr %53, metadata !2494, metadata !DIExpression()), !dbg !3196
  call void @llvm.dbg.value(metadata i8 10, metadata !2502, metadata !DIExpression()), !dbg !3196
  %57 = getelementptr inbounds %"class.std::ctype", ptr %53, i64 0, i32 8, !dbg !3198
  %58 = load i8, ptr %57, align 8, !dbg !3198, !tbaa !2507
  %59 = icmp eq i8 %58, 0, !dbg !3198
  br i1 %59, label %63, label %60, !dbg !3199

60:                                               ; preds = %56
  %61 = getelementptr inbounds %"class.std::ctype", ptr %53, i64 0, i32 9, i64 10, !dbg !3200
  %62 = load i8, ptr %61, align 1, !dbg !3200, !tbaa !2512
  br label %68, !dbg !3201

63:                                               ; preds = %56
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %53), !dbg !3202
  %64 = load ptr, ptr %53, align 8, !dbg !3203, !tbaa !2448
  %65 = getelementptr inbounds ptr, ptr %64, i64 6, !dbg !3203
  %66 = load ptr, ptr %65, align 8, !dbg !3203
  %67 = call noundef signext i8 %66(ptr noundef nonnull align 8 dereferenceable(570) %53, i8 noundef signext 10), !dbg !3203
  br label %68, !dbg !3204

68:                                               ; preds = %60, %63
  %69 = phi i8 [ %62, %60 ], [ %67, %63 ], !dbg !3196
  %70 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %47, i8 noundef signext %69), !dbg !3205
  call void @llvm.dbg.value(metadata ptr %70, metadata !2426, metadata !DIExpression()), !dbg !3206
  %71 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %70), !dbg !3208
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !3209
  call void @llvm.dbg.value(metadata ptr @.str.13, metadata !2364, metadata !DIExpression()), !dbg !3209
  call void @llvm.dbg.value(metadata ptr @.str.13, metadata !3137, metadata !DIExpression()), !dbg !3211
  %72 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.13, i64 noundef 17), !dbg !3213
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !3214
  call void @llvm.dbg.value(metadata ptr %8, metadata !2364, metadata !DIExpression()), !dbg !3214
  call void @llvm.dbg.value(metadata ptr %8, metadata !3137, metadata !DIExpression()), !dbg !3216
  %73 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %8) #19, !dbg !3218
  %74 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull %8, i64 noundef %73), !dbg !3219
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2337, metadata !DIExpression()), !dbg !3220
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2352, metadata !DIExpression()), !dbg !3220
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2442, metadata !DIExpression()), !dbg !3222
  %75 = load ptr, ptr @_ZSt4cout, align 8, !dbg !3224, !tbaa !2448
  %76 = getelementptr i8, ptr %75, i64 -24, !dbg !3224
  %77 = load i64, ptr %76, align 8, !dbg !3224
  %78 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %77, !dbg !3224
  call void @llvm.dbg.value(metadata ptr %78, metadata !2450, metadata !DIExpression()), !dbg !3225
  call void @llvm.dbg.value(metadata i8 10, metadata !2462, metadata !DIExpression()), !dbg !3225
  %79 = getelementptr inbounds %"class.std::basic_ios", ptr %78, i64 0, i32 5, !dbg !3227
  %80 = load ptr, ptr %79, align 8, !dbg !3227, !tbaa !2467
  call void @llvm.dbg.value(metadata ptr %80, metadata !2476, metadata !DIExpression()), !dbg !3228
  %81 = icmp eq ptr %80, null, !dbg !3230
  br i1 %81, label %82, label %83, !dbg !3231

82:                                               ; preds = %68
  call void @_ZSt16__throw_bad_castv() #21, !dbg !3232
  unreachable, !dbg !3232

83:                                               ; preds = %68
  call void @llvm.dbg.value(metadata ptr %80, metadata !2494, metadata !DIExpression()), !dbg !3233
  call void @llvm.dbg.value(metadata i8 10, metadata !2502, metadata !DIExpression()), !dbg !3233
  %84 = getelementptr inbounds %"class.std::ctype", ptr %80, i64 0, i32 8, !dbg !3235
  %85 = load i8, ptr %84, align 8, !dbg !3235, !tbaa !2507
  %86 = icmp eq i8 %85, 0, !dbg !3235
  br i1 %86, label %90, label %87, !dbg !3236

87:                                               ; preds = %83
  %88 = getelementptr inbounds %"class.std::ctype", ptr %80, i64 0, i32 9, i64 10, !dbg !3237
  %89 = load i8, ptr %88, align 1, !dbg !3237, !tbaa !2512
  br label %95, !dbg !3238

90:                                               ; preds = %83
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %80), !dbg !3239
  %91 = load ptr, ptr %80, align 8, !dbg !3240, !tbaa !2448
  %92 = getelementptr inbounds ptr, ptr %91, i64 6, !dbg !3240
  %93 = load ptr, ptr %92, align 8, !dbg !3240
  %94 = call noundef signext i8 %93(ptr noundef nonnull align 8 dereferenceable(570) %80, i8 noundef signext 10), !dbg !3240
  br label %95, !dbg !3241

95:                                               ; preds = %87, %90
  %96 = phi i8 [ %89, %87 ], [ %94, %90 ], !dbg !3233
  %97 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %96), !dbg !3242
  call void @llvm.dbg.value(metadata ptr %97, metadata !2426, metadata !DIExpression()), !dbg !3243
  %98 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %97), !dbg !3245
  call void @_Z13tick_all_testi(i32 noundef %0), !dbg !3246
  %99 = call i32 @__hipPushCallConfiguration(i64 4294968320, i32 1, i64 4294968320, i32 1, i64 noundef 0, ptr noundef null), !dbg !3247
  %100 = icmp eq i32 %99, 0, !dbg !3247
  br i1 %100, label %101, label %115, !dbg !3248

101:                                              ; preds = %95
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %3), !dbg !3248
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4), !dbg !3248
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5), !dbg !3248
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6), !dbg !3248
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7), !dbg !3248
  %102 = call i32 @__hipPopCallConfiguration(ptr nonnull %3, ptr nonnull %4, ptr nonnull %5, ptr nonnull %6), !dbg !3248
  %103 = load i64, ptr %5, align 8, !dbg !3248
  %104 = load ptr, ptr %6, align 8, !dbg !3248
  %105 = load i64, ptr %3, align 8, !dbg !3248
  %106 = getelementptr inbounds i8, ptr %3, i64 8, !dbg !3248
  %107 = load i32, ptr %106, align 8, !dbg !3248
  %108 = load i64, ptr %4, align 8, !dbg !3248
  %109 = getelementptr inbounds i8, ptr %4, i64 8, !dbg !3248
  %110 = load i32, ptr %109, align 8, !dbg !3248
  %111 = alloca ptr, align 8
  %112 = call ptr @scabbard.trace.register_job(ptr %104)
  store ptr %112, ptr %111, align 8
  %113 = getelementptr inbounds ptr, ptr %7, i64 1
  store ptr %111, ptr %113, align 8
  %114 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z12dummy_kernelv, i64 %105, i32 %107, i64 %108, i32 %110, ptr noundef nonnull %7, i64 noundef %103, ptr noundef %104), !dbg !3248
  call void @scabbard.trace.register_job_callback(ptr %112, ptr %104)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %3), !dbg !3248
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %4), !dbg !3248
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5), !dbg !3248
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6), !dbg !3248
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7), !dbg !3248
  br label %115, !dbg !3248

115:                                              ; preds = %101, %95
  call void @llvm.lifetime.end.p0(i64 1472, ptr nonnull %8) #19, !dbg !3249
  ret i32 0, !dbg !3250
}

declare !dbg !3251 dso_local i32 @hipGetDevicePropertiesR0600(ptr noundef, i32 noundef) local_unnamed_addr #0

; Function Attrs: noreturn nounwind
declare !dbg !3255 dso_local void @exit(i32 noundef) local_unnamed_addr #13

declare !dbg !3256 dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef, i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare !dbg !3260 dso_local i64 @strlen(ptr nocapture noundef) local_unnamed_addr #14

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

; Function Attrs: noreturn
declare !dbg !3264 dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #15

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

declare !dbg !3266 dso_local i32 @hipMallocManaged(ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare !dbg !3269 dso_local i32 @hipMalloc(ptr noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertIlEERSoT_(ptr noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

declare !dbg !3272 dso_local i32 @nanosleep(ptr noundef, ptr noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare !dbg !3277 dso_local ptr @__errno_location() local_unnamed_addr #16

declare dso_local i32 @__gxx_personality_v0(...)

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_managed_clock_test.cpp() #17 section ".text.startup" !dbg !3281 {
  tail call void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit), !dbg !3283
  %1 = tail call i32 @__cxa_atexit(ptr nonnull @_ZNSt8ios_base4InitD1Ev, ptr nonnull @_ZStL8__ioinit, ptr nonnull @__dso_handle) #19, !dbg !3287
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

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #18

declare void @scabbard.trace.scabbard_init(void)

declare void @"scabbard.trace.host.trace_append$mem"(i16, ptr, ptr, i32, i32)

declare void @"scabbard.trace.host.trace_append$alloc"(i16, ptr, ptr, i32, i32, i64)

declare ptr @scabbard.trace.register_job(ptr)

declare void @scabbard.trace.register_job_callback(ptr, ptr)

declare i64 @"scabbard.trace.metadata_register$src"(ptr)

define void @scabbard.trace.module_ctor() {
  %1 = load ptr, ptr @__hip_gpubin_handle, align 8
  %2 = call i64 @"scabbard.trace.metadata_register$src"(ptr @"scabbard.metadata.srcData$0x0001")
  store i64 %2, ptr @"scabbard.metadata.host.srcId$0x0001", align 8
  %3 = call i64 @"scabbard.trace.metadata_register$src"(ptr @"scabbard.metadata.srcData$0x0000")
  store i64 %3, ptr @"scabbard.metadata.host.srcId$0x0000", align 8
  ret void
}

attributes #0 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size"="true" }
attributes #4 = { noinline uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { inlinehint mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nobuiltin allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #11 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { mustprogress nofree nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #19 = { nounwind }
attributes #20 = { noreturn nounwind }
attributes #21 = { noreturn }
attributes #22 = { builtin allocsize(0) }
attributes #23 = { nounwind willreturn memory(none) }
attributes #24 = { builtin nounwind }

!llvm.dbg.cu = !{!79}
!llvm.module.flags = !{!2285, !2286, !2287, !2288}
!llvm.ident = !{!2289}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/iostream", directory: "")
!4 = !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 626, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/ios_base.h", directory: "")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt8ios_base")
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !9, line: 70, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard", checksumkind: CSK_MD5, checksum: "84927e4bf98b7e7efaf685dc29fe5570")
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
!63 = distinct !DIGlobalVariable(scope: null, file: !9, line: 170, type: !64, isLocal: true, isDefinition: true)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 120, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 15)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(scope: null, file: !9, line: 171, type: !64, isLocal: true, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(scope: null, file: !9, line: 172, type: !71, isLocal: true, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 144, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 18)
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(scope: null, file: !9, line: 182, type: !76, isLocal: true, isDefinition: true)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 104, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 13)
!79 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !9, producer: "AMD clang version 17.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-6.0.0 23483 7208e8d15fbf218deb74483ea8c549c67ca4985e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !80, retainedTypes: !188, globals: !461, imports: !462, splitDebugInlining: false, nameTableKind: None)
!80 = !{!81, !89, !170, !178}
!81 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Lock_policy", scope: !83, file: !82, line: 49, baseType: !84, size: 32, elements: !85, identifier: "_ZTSN9__gnu_cxx12_Lock_policyE")
!82 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ext/concurrence.h", directory: "")
!83 = !DINamespace(name: "__gnu_cxx", scope: null)
!84 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!85 = !{!86, !87, !88}
!86 = !DIEnumerator(name: "_S_single", value: 0, isUnsigned: true)
!87 = !DIEnumerator(name: "_S_mutex", value: 1, isUnsigned: true)
!88 = !DIEnumerator(name: "_S_atomic", value: 2, isUnsigned: true)
!89 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipError_t", file: !90, line: 286, baseType: !84, size: 32, elements: !91, identifier: "_ZTS10hipError_t")
!90 = !DIFile(filename: "/opt/rocm-6.0.0/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "6aa15d18d5522d6c94f4e18d95fe9007")
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
!170 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipMemcpyKind", file: !171, line: 333, baseType: !84, size: 32, elements: !172, identifier: "_ZTS13hipMemcpyKind")
!171 = !DIFile(filename: "/opt/rocm-6.0.0/include/hip/driver_types.h", directory: "", checksumkind: CSK_MD5, checksum: "5da8abc9af3b706147da80bf66632cf6")
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
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !90, line: 1034, baseType: !190)
!190 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !90, line: 1027, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !191, identifier: "_ZTS4dim3")
!191 = !{!192, !197, !198, !199}
!192 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !190, file: !90, line: 1028, baseType: !193, size: 32)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !194, line: 26, baseType: !195)
!194 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "9754ebe022edbe8d7928fa709e442f0d")
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !196, line: 41, baseType: !84)
!196 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "eac2c46b20ddc2be81186b6ffebfd845")
!197 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !190, file: !90, line: 1029, baseType: !193, size: 32, offset: 32)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !190, file: !90, line: 1030, baseType: !193, size: 32, offset: 64)
!199 = !DISubprogram(name: "dim3", scope: !190, file: !90, line: 1032, type: !200, scopeLine: 1032, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
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
!351 = !DITemplateTypeParameter(name: "_Period", type: !352, defaulted: true)
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
!434 = !DITemplateTypeParameter(name: "_Dp1", type: !210, defaulted: true)
!435 = !DITemplateTypeParameter(name: "_Dp2", type: !210, defaulted: true)
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
!462 = !{!463, !469, !476, !478, !480, !484, !486, !488, !490, !492, !494, !496, !498, !503, !507, !509, !511, !516, !518, !520, !522, !524, !526, !528, !531, !534, !536, !540, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !569, !573, !575, !577, !579, !581, !583, !585, !587, !589, !591, !593, !595, !597, !599, !601, !603, !607, !611, !615, !617, !619, !621, !623, !625, !627, !629, !631, !633, !637, !641, !645, !647, !649, !651, !656, !660, !664, !666, !668, !670, !672, !674, !676, !678, !680, !682, !684, !686, !688, !692, !696, !700, !702, !704, !706, !711, !715, !719, !721, !723, !725, !727, !729, !731, !735, !739, !741, !743, !745, !747, !751, !755, !759, !761, !763, !765, !767, !769, !771, !775, !779, !783, !785, !789, !793, !795, !797, !799, !801, !803, !805, !809, !813, !819, !823, !830, !835, !837, !840, !844, !848, !859, !861, !865, !869, !873, !878, !882, !886, !890, !894, !902, !906, !910, !912, !916, !920, !924, !930, !934, !938, !940, !948, !952, !958, !960, !964, !968, !972, !976, !981, !985, !989, !990, !991, !992, !994, !995, !996, !997, !998, !999, !1000, !1002, !1003, !1004, !1005, !1006, !1007, !1008, !1010, !1011, !1012, !1013, !1014, !1015, !1016, !1017, !1018, !1019, !1020, !1021, !1022, !1023, !1024, !1025, !1026, !1027, !1028, !1029, !1030, !1031, !1032, !1033, !1034, !1038, !1042, !1045, !1047, !1049, !1051, !1053, !1055, !1057, !1059, !1061, !1063, !1065, !1067, !1069, !1071, !1073, !1075, !1077, !1079, !1081, !1083, !1085, !1087, !1089, !1091, !1093, !1095, !1099, !1101, !1103, !1107, !1111, !1113, !1115, !1117, !1119, !1121, !1123, !1125, !1127, !1129, !1131, !1133, !1135, !1137, !1139, !1141, !1143, !1145, !1147, !1149, !1151, !1153, !1158, !1160, !1162, !1164, !1166, !1168, !1170, !1172, !1174, !1176, !1178, !1180, !1182, !1184, !1186, !1188, !1190, !1192, !1194, !1196, !1200, !1202, !1204, !1206, !1208, !1210, !1212, !1214, !1216, !1218, !1220, !1222, !1224, !1226, !1228, !1230, !1232, !1234, !1236, !1238, !1240, !1242, !1244, !1246, !1248, !1250, !1252, !1254, !1256, !1258, !1260, !1262, !1264, !1266, !1268, !1270, !1272, !1274, !1276, !1278, !1280, !1282, !1284, !1286, !1288, !1290, !1292, !1294, !1296, !1298, !1300, !1302, !1304, !1306, !1308, !1323, !1326, !1331, !1389, !1394, !1398, !1402, !1406, !1410, !1412, !1414, !1418, !1424, !1428, !1434, !1440, !1442, !1446, !1450, !1454, !1458, !1470, !1472, !1476, !1480, !1484, !1486, !1490, !1494, !1498, !1500, !1502, !1506, !1527, !1531, !1535, !1539, !1541, !1547, !1549, !1555, !1559, !1563, !1567, !1571, !1575, !1579, !1581, !1583, !1587, !1591, !1595, !1597, !1601, !1605, !1607, !1609, !1613, !1617, !1621, !1625, !1626, !1627, !1628, !1629, !1630, !1631, !1632, !1633, !1634, !1635, !1640, !1644, !1647, !1650, !1652, !1654, !1656, !1658, !1661, !1664, !1667, !1670, !1671, !1673, !1676, !1679, !1680, !1683, !1685, !1687, !1689, !1691, !1694, !1697, !1700, !1703, !1706, !1708, !1712, !1716, !1721, !1725, !1727, !1729, !1731, !1733, !1735, !1737, !1739, !1741, !1743, !1745, !1747, !1749, !1751, !1755, !1761, !1766, !1770, !1772, !1774, !1776, !1778, !1785, !1789, !1793, !1797, !1801, !1805, !1810, !1814, !1816, !1820, !1826, !1830, !1835, !1837, !1840, !1844, !1848, !1850, !1852, !1854, !1856, !1860, !1862, !1864, !1868, !1872, !1876, !1880, !1884, !1888, !1890, !1894, !1898, !1902, !1906, !1908, !1910, !1914, !1918, !1919, !1920, !1921, !1922, !1923, !1929, !1932, !1933, !1935, !1937, !1939, !1941, !1945, !1947, !1949, !1951, !1953, !1955, !1957, !1959, !1961, !1965, !1969, !1971, !1975, !1979, !1984, !1985, !1986, !1991, !1995, !2000, !2005, !2009, !2015, !2019, !2021, !2025, !2032, !2037, !2040, !2042, !2045, !2050, !2056, !2060, !2065, !2067, !2071, !2075, !2077, !2079, !2081, !2085, !2089, !2093, !2097, !2101, !2103, !2105, !2107, !2111, !2115, !2119, !2121, !2123}
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
!828 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "d1776268f398bd1ca997c840ad581432")
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
!1044 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
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
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1197, file: !1199, line: 727)
!1197 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !1198, file: !1198, line: 183, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1198 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "d4f0e84980e083350535310c8ec512a2")
!1199 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "854a3dc6d81a4654631a5bce14ca059c")
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1201, file: !1199, line: 728)
!1201 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !1198, file: !1198, line: 186, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1203, file: !1199, line: 729)
!1203 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !1198, file: !1198, line: 189, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1205, file: !1199, line: 730)
!1205 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !1198, file: !1198, line: 192, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1207, file: !1199, line: 731)
!1207 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !1198, file: !1198, line: 195, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1209, file: !1199, line: 732)
!1209 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !1198, file: !1198, line: 198, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1211, file: !1199, line: 733)
!1211 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !1198, file: !1198, line: 201, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1213, file: !1199, line: 734)
!1213 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !1198, file: !1198, line: 204, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1215, file: !1199, line: 735)
!1215 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !1198, file: !1198, line: 207, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1217, file: !1199, line: 736)
!1217 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !1198, file: !1198, line: 210, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1219, file: !1199, line: 737)
!1219 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !1198, file: !1198, line: 213, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1221, file: !1199, line: 738)
!1221 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !1198, file: !1198, line: 216, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1223, file: !1199, line: 739)
!1223 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !1198, file: !1198, line: 228, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1225, file: !1199, line: 740)
!1225 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !1198, file: !1198, line: 237, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1227, file: !1199, line: 741)
!1227 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !1198, file: !1198, line: 246, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1229, file: !1199, line: 742)
!1229 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !1198, file: !1198, line: 249, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1231, file: !1199, line: 743)
!1231 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !1198, file: !1198, line: 252, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1233, file: !1199, line: 744)
!1233 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !1198, file: !1198, line: 255, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1235, file: !1199, line: 745)
!1235 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !1198, file: !1198, line: 258, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1237, file: !1199, line: 746)
!1237 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !1198, file: !1198, line: 264, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1239, file: !1199, line: 747)
!1239 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !1198, file: !1198, line: 267, type: !609, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1241, file: !1199, line: 748)
!1241 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !1198, file: !1198, line: 272, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1243, file: !1199, line: 749)
!1243 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !1198, file: !1198, line: 275, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1245, file: !1199, line: 750)
!1245 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !1198, file: !1198, line: 278, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1247, file: !1199, line: 751)
!1247 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !1198, file: !1198, line: 281, type: !1097, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1249, file: !1199, line: 752)
!1249 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !1198, file: !1198, line: 294, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1251, file: !1199, line: 753)
!1251 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !1198, file: !1198, line: 297, type: !639, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1253, file: !1199, line: 754)
!1253 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !1198, file: !1198, line: 336, type: !787, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1255, file: !1199, line: 755)
!1255 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !1198, file: !1198, line: 339, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1257, file: !1199, line: 756)
!1257 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !1198, file: !1198, line: 342, type: !658, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1259, file: !1199, line: 757)
!1259 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !1198, file: !1198, line: 345, type: !658, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1261, file: !1199, line: 758)
!1261 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !1198, file: !1198, line: 348, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1263, file: !1199, line: 759)
!1263 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !1198, file: !1198, line: 351, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1265, file: !1199, line: 760)
!1265 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !1198, file: !1198, line: 354, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1267, file: !1199, line: 761)
!1267 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !1198, file: !1198, line: 360, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1269, file: !1199, line: 762)
!1269 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !1198, file: !1198, line: 363, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1271, file: !1199, line: 763)
!1271 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !1198, file: !1198, line: 366, type: !694, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1273, file: !1199, line: 764)
!1273 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !1198, file: !1198, line: 369, type: !694, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1275, file: !1199, line: 765)
!1275 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !1198, file: !1198, line: 372, type: !1155, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1277, file: !1199, line: 766)
!1277 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !1198, file: !1198, line: 408, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1279, file: !1199, line: 767)
!1279 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !1198, file: !1198, line: 411, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1281, file: !1199, line: 769)
!1281 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !1198, file: !1198, line: 444, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1283, file: !1199, line: 770)
!1283 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !1198, file: !1198, line: 469, type: !567, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1285, file: !1199, line: 771)
!1285 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !1198, file: !1198, line: 474, type: !753, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1287, file: !1199, line: 772)
!1287 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !1198, file: !1198, line: 490, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1289, file: !1199, line: 773)
!1289 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !1198, file: !1198, line: 515, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1291, file: !1199, line: 774)
!1291 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !1198, file: !1198, line: 521, type: !777, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1293, file: !1199, line: 775)
!1293 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !1198, file: !1198, line: 527, type: !787, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1295, file: !1199, line: 776)
!1295 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !1198, file: !1198, line: 555, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1297, file: !1199, line: 777)
!1297 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !1198, file: !1198, line: 558, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1299, file: !1199, line: 778)
!1299 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !1198, file: !1198, line: 564, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1301, file: !1199, line: 779)
!1301 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !1198, file: !1198, line: 567, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1303, file: !1199, line: 780)
!1303 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !1198, file: !1198, line: 570, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1305, file: !1199, line: 781)
!1305 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !1198, file: !1198, line: 573, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1307, file: !1199, line: 782)
!1307 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !1198, file: !1198, line: 576, type: !538, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
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
!1463 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, flags: DIFlagTypePassByValue, elements: !1464, identifier: "_ZTS13__va_list_tag")
!1464 = !{!1465, !1467, !1468, !1469}
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !1463, file: !1466, baseType: !84, size: 32)
!1466 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard")
!1467 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !1463, file: !1466, baseType: !84, size: 32, offset: 32)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !1463, file: !1466, baseType: !278, size: 64, offset: 64)
!1469 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !1463, file: !1466, baseType: !278, size: 64, offset: 128)
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
!2045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2046, file: !2049, line: 58)
!2046 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !2047, line: 24, baseType: !2048)
!2047 = !DIFile(filename: "/opt/rocm-6.0.0/lib/llvm/lib/clang/17.0.0/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "48e8e2456f77e6cda35d245130fa7259")
!2048 = !DICompositeType(tag: DW_TAG_structure_type, file: !2047, line: 19, size: 256, flags: DIFlagFwdDecl, identifier: "_ZTS11max_align_t")
!2049 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstddef", directory: "")
!2050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2051, file: !2055, line: 77)
!2051 = !DISubprogram(name: "memchr", scope: !2052, file: !2052, line: 84, type: !2053, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2052 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "cc7eed1dc136352012a229a96542ae3d")
!2053 = !DISubroutineType(types: !2054)
!2054 = !{!853, !853, !179, !827}
!2055 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstring", directory: "")
!2056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2057, file: !2055, line: 78)
!2057 = !DISubprogram(name: "memcmp", scope: !2052, file: !2052, line: 64, type: !2058, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2058 = !DISubroutineType(types: !2059)
!2059 = !{!179, !853, !853, !827}
!2060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2061, file: !2055, line: 79)
!2061 = !DISubprogram(name: "memcpy", linkageName: "_ZL6memcpyPvPKvm", scope: !2062, file: !2062, line: 1091, type: !2063, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2062 = !DIFile(filename: "/opt/rocm-6.0.0/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "84c2a92b1697d2eb768bfffa64d66c1f")
!2063 = !DISubroutineType(types: !2064)
!2064 = !{!278, !278, !853, !827}
!2065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2066, file: !2055, line: 80)
!2066 = !DISubprogram(name: "memmove", scope: !2052, file: !2052, line: 47, type: !2063, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2068, file: !2055, line: 81)
!2068 = !DISubprogram(name: "memset", linkageName: "_ZL6memsetPvim", scope: !2062, file: !2062, line: 1095, type: !2069, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2069 = !DISubroutineType(types: !2070)
!2070 = !{!278, !278, !179, !827}
!2071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2072, file: !2055, line: 82)
!2072 = !DISubprogram(name: "strcat", scope: !2052, file: !2052, line: 130, type: !2073, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2073 = !DISubroutineType(types: !2074)
!2074 = !{!877, !944, !901}
!2075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2076, file: !2055, line: 83)
!2076 = !DISubprogram(name: "strcmp", scope: !2052, file: !2052, line: 137, type: !1858, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2078, file: !2055, line: 84)
!2078 = !DISubprogram(name: "strcoll", scope: !2052, file: !2052, line: 144, type: !1858, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2080, file: !2055, line: 85)
!2080 = !DISubprogram(name: "strcpy", scope: !2052, file: !2052, line: 122, type: !2073, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2082, file: !2055, line: 86)
!2082 = !DISubprogram(name: "strcspn", scope: !2052, file: !2052, line: 273, type: !2083, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2083 = !DISubroutineType(types: !2084)
!2084 = !{!827, !710, !710}
!2085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2086, file: !2055, line: 87)
!2086 = !DISubprogram(name: "strerror", scope: !2052, file: !2052, line: 397, type: !2087, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2087 = !DISubroutineType(types: !2088)
!2088 = !{!877, !179}
!2089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2090, file: !2055, line: 88)
!2090 = !DISubprogram(name: "strlen", scope: !2052, file: !2052, line: 385, type: !2091, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2091 = !DISubroutineType(types: !2092)
!2092 = !{!827, !710}
!2093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2094, file: !2055, line: 89)
!2094 = !DISubprogram(name: "strncat", scope: !2052, file: !2052, line: 133, type: !2095, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2095 = !DISubroutineType(types: !2096)
!2096 = !{!877, !944, !901, !827}
!2097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2098, file: !2055, line: 90)
!2098 = !DISubprogram(name: "strncmp", scope: !2052, file: !2052, line: 140, type: !2099, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2099 = !DISubroutineType(types: !2100)
!2100 = !{!179, !710, !710, !827}
!2101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2102, file: !2055, line: 91)
!2102 = !DISubprogram(name: "strncpy", scope: !2052, file: !2052, line: 125, type: !2095, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2104, file: !2055, line: 92)
!2104 = !DISubprogram(name: "strspn", scope: !2052, file: !2052, line: 277, type: !2083, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2106, file: !2055, line: 93)
!2106 = !DISubprogram(name: "strtok", scope: !2052, file: !2052, line: 336, type: !2073, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2108, file: !2055, line: 94)
!2108 = !DISubprogram(name: "strxfrm", scope: !2052, file: !2052, line: 147, type: !2109, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2109 = !DISubroutineType(types: !2110)
!2110 = !{!827, !944, !901, !827}
!2111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2112, file: !2055, line: 95)
!2112 = !DISubprogram(name: "strchr", scope: !2052, file: !2052, line: 219, type: !2113, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2113 = !DISubroutineType(types: !2114)
!2114 = !{!710, !710, !179}
!2115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2116, file: !2055, line: 96)
!2116 = !DISubprogram(name: "strpbrk", scope: !2052, file: !2052, line: 296, type: !2117, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2117 = !DISubroutineType(types: !2118)
!2118 = !{!710, !710, !710}
!2119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2120, file: !2055, line: 97)
!2120 = !DISubprogram(name: "strrchr", scope: !2052, file: !2052, line: 246, type: !2113, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2122, file: !2055, line: 98)
!2122 = !DISubprogram(name: "strstr", scope: !2052, file: !2052, line: 323, type: !2117, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2123 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2124, entity: !2, file: !9, line: 167)
!2124 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 165, type: !2125, scopeLine: 166, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !2127)
!2125 = !DISubroutineType(types: !2126)
!2126 = !{!179, !179, !929}
!2127 = !{!2128, !2129, !2130}
!2128 = !DILocalVariable(name: "argc", arg: 1, scope: !2124, file: !9, line: 165, type: !179)
!2129 = !DILocalVariable(name: "argv", arg: 2, scope: !2124, file: !9, line: 165, type: !929)
!2130 = !DILocalVariable(name: "devProp", scope: !2124, file: !9, line: 168, type: !2131)
!2131 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipDeviceProp_tR0600", file: !90, line: 236, baseType: !2132)
!2132 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hipDeviceProp_tR0600", file: !90, line: 99, size: 11776, flags: DIFlagTypePassByValue, elements: !2133, identifier: "_ZTS20hipDeviceProp_tR0600")
!2133 = !{!2134, !2138, !2146, !2150, !2151, !2152, !2153, !2154, !2155, !2156, !2157, !2161, !2162, !2163, !2164, !2165, !2166, !2167, !2168, !2169, !2170, !2171, !2172, !2173, !2174, !2175, !2176, !2177, !2179, !2180, !2181, !2182, !2183, !2184, !2185, !2186, !2187, !2188, !2189, !2190, !2191, !2192, !2193, !2194, !2195, !2196, !2197, !2198, !2199, !2200, !2201, !2202, !2203, !2204, !2205, !2206, !2207, !2208, !2209, !2210, !2211, !2212, !2213, !2214, !2215, !2216, !2217, !2218, !2219, !2220, !2221, !2222, !2223, !2224, !2225, !2226, !2227, !2228, !2229, !2230, !2231, !2232, !2233, !2234, !2235, !2236, !2237, !2238, !2239, !2240, !2241, !2242, !2243, !2244, !2248, !2252, !2253, !2254, !2255, !2276, !2278, !2279, !2280, !2281, !2282, !2283, !2284}
!2134 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !2132, file: !90, line: 100, baseType: !2135, size: 2048)
!2135 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 2048, elements: !2136)
!2136 = !{!2137}
!2137 = !DISubrange(count: 256)
!2138 = !DIDerivedType(tag: DW_TAG_member, name: "uuid", scope: !2132, file: !90, line: 101, baseType: !2139, size: 128, offset: 2048)
!2139 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipUUID", file: !90, line: 86, baseType: !2140)
!2140 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hipUUID_t", file: !90, line: 84, size: 128, flags: DIFlagTypePassByValue, elements: !2141, identifier: "_ZTS9hipUUID_t")
!2141 = !{!2142}
!2142 = !DIDerivedType(tag: DW_TAG_member, name: "bytes", scope: !2140, file: !90, line: 85, baseType: !2143, size: 128)
!2143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 128, elements: !2144)
!2144 = !{!2145}
!2145 = !DISubrange(count: 16)
!2146 = !DIDerivedType(tag: DW_TAG_member, name: "luid", scope: !2132, file: !90, line: 102, baseType: !2147, size: 64, offset: 2176)
!2147 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 64, elements: !2148)
!2148 = !{!2149}
!2149 = !DISubrange(count: 8)
!2150 = !DIDerivedType(tag: DW_TAG_member, name: "luidDeviceNodeMask", scope: !2132, file: !90, line: 103, baseType: !84, size: 32, offset: 2240)
!2151 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !2132, file: !90, line: 104, baseType: !827, size: 64, offset: 2304)
!2152 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !2132, file: !90, line: 105, baseType: !827, size: 64, offset: 2368)
!2153 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !2132, file: !90, line: 106, baseType: !179, size: 32, offset: 2432)
!2154 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !2132, file: !90, line: 107, baseType: !179, size: 32, offset: 2464)
!2155 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !2132, file: !90, line: 108, baseType: !827, size: 64, offset: 2496)
!2156 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !2132, file: !90, line: 110, baseType: !179, size: 32, offset: 2560)
!2157 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !2132, file: !90, line: 111, baseType: !2158, size: 96, offset: 2592)
!2158 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 96, elements: !2159)
!2159 = !{!2160}
!2160 = !DISubrange(count: 3)
!2161 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !2132, file: !90, line: 112, baseType: !2158, size: 96, offset: 2688)
!2162 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !2132, file: !90, line: 113, baseType: !179, size: 32, offset: 2784)
!2163 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !2132, file: !90, line: 114, baseType: !827, size: 64, offset: 2816)
!2164 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !2132, file: !90, line: 115, baseType: !179, size: 32, offset: 2880)
!2165 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !2132, file: !90, line: 118, baseType: !179, size: 32, offset: 2912)
!2166 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !2132, file: !90, line: 121, baseType: !827, size: 64, offset: 2944)
!2167 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !2132, file: !90, line: 122, baseType: !827, size: 64, offset: 3008)
!2168 = !DIDerivedType(tag: DW_TAG_member, name: "deviceOverlap", scope: !2132, file: !90, line: 123, baseType: !179, size: 32, offset: 3072)
!2169 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !2132, file: !90, line: 124, baseType: !179, size: 32, offset: 3104)
!2170 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !2132, file: !90, line: 125, baseType: !179, size: 32, offset: 3136)
!2171 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !2132, file: !90, line: 126, baseType: !179, size: 32, offset: 3168)
!2172 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !2132, file: !90, line: 127, baseType: !179, size: 32, offset: 3200)
!2173 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !2132, file: !90, line: 128, baseType: !179, size: 32, offset: 3232)
!2174 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !2132, file: !90, line: 129, baseType: !179, size: 32, offset: 3264)
!2175 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DMipmap", scope: !2132, file: !90, line: 130, baseType: !179, size: 32, offset: 3296)
!2176 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !2132, file: !90, line: 131, baseType: !179, size: 32, offset: 3328)
!2177 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !2132, file: !90, line: 132, baseType: !2178, size: 64, offset: 3360)
!2178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 64, elements: !33)
!2179 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DMipmap", scope: !2132, file: !90, line: 133, baseType: !2178, size: 64, offset: 3424)
!2180 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLinear", scope: !2132, file: !90, line: 134, baseType: !2158, size: 96, offset: 3488)
!2181 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DGather", scope: !2132, file: !90, line: 135, baseType: !2178, size: 64, offset: 3584)
!2182 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !2132, file: !90, line: 136, baseType: !2158, size: 96, offset: 3648)
!2183 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3DAlt", scope: !2132, file: !90, line: 138, baseType: !2158, size: 96, offset: 3744)
!2184 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemap", scope: !2132, file: !90, line: 139, baseType: !179, size: 32, offset: 3840)
!2185 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLayered", scope: !2132, file: !90, line: 140, baseType: !2178, size: 64, offset: 3872)
!2186 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLayered", scope: !2132, file: !90, line: 141, baseType: !2158, size: 96, offset: 3936)
!2187 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemapLayered", scope: !2132, file: !90, line: 142, baseType: !2178, size: 64, offset: 4032)
!2188 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1D", scope: !2132, file: !90, line: 143, baseType: !179, size: 32, offset: 4096)
!2189 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2D", scope: !2132, file: !90, line: 144, baseType: !2178, size: 64, offset: 4128)
!2190 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface3D", scope: !2132, file: !90, line: 145, baseType: !2158, size: 96, offset: 4192)
!2191 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1DLayered", scope: !2132, file: !90, line: 146, baseType: !2178, size: 64, offset: 4288)
!2192 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2DLayered", scope: !2132, file: !90, line: 147, baseType: !2158, size: 96, offset: 4352)
!2193 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemap", scope: !2132, file: !90, line: 148, baseType: !179, size: 32, offset: 4448)
!2194 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemapLayered", scope: !2132, file: !90, line: 149, baseType: !2178, size: 64, offset: 4480)
!2195 = !DIDerivedType(tag: DW_TAG_member, name: "surfaceAlignment", scope: !2132, file: !90, line: 150, baseType: !827, size: 64, offset: 4544)
!2196 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !2132, file: !90, line: 151, baseType: !179, size: 32, offset: 4608)
!2197 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !2132, file: !90, line: 152, baseType: !179, size: 32, offset: 4640)
!2198 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !2132, file: !90, line: 153, baseType: !179, size: 32, offset: 4672)
!2199 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !2132, file: !90, line: 154, baseType: !179, size: 32, offset: 4704)
!2200 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !2132, file: !90, line: 155, baseType: !179, size: 32, offset: 4736)
!2201 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !2132, file: !90, line: 156, baseType: !179, size: 32, offset: 4768)
!2202 = !DIDerivedType(tag: DW_TAG_member, name: "asyncEngineCount", scope: !2132, file: !90, line: 157, baseType: !179, size: 32, offset: 4800)
!2203 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedAddressing", scope: !2132, file: !90, line: 158, baseType: !179, size: 32, offset: 4832)
!2204 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !2132, file: !90, line: 159, baseType: !179, size: 32, offset: 4864)
!2205 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !2132, file: !90, line: 160, baseType: !179, size: 32, offset: 4896)
!2206 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !2132, file: !90, line: 161, baseType: !179, size: 32, offset: 4928)
!2207 = !DIDerivedType(tag: DW_TAG_member, name: "persistingL2CacheMaxSize", scope: !2132, file: !90, line: 162, baseType: !179, size: 32, offset: 4960)
!2208 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !2132, file: !90, line: 163, baseType: !179, size: 32, offset: 4992)
!2209 = !DIDerivedType(tag: DW_TAG_member, name: "streamPrioritiesSupported", scope: !2132, file: !90, line: 164, baseType: !179, size: 32, offset: 5024)
!2210 = !DIDerivedType(tag: DW_TAG_member, name: "globalL1CacheSupported", scope: !2132, file: !90, line: 165, baseType: !179, size: 32, offset: 5056)
!2211 = !DIDerivedType(tag: DW_TAG_member, name: "localL1CacheSupported", scope: !2132, file: !90, line: 166, baseType: !179, size: 32, offset: 5088)
!2212 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerMultiprocessor", scope: !2132, file: !90, line: 167, baseType: !827, size: 64, offset: 5120)
!2213 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerMultiprocessor", scope: !2132, file: !90, line: 168, baseType: !179, size: 32, offset: 5184)
!2214 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !2132, file: !90, line: 169, baseType: !179, size: 32, offset: 5216)
!2215 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !2132, file: !90, line: 170, baseType: !179, size: 32, offset: 5248)
!2216 = !DIDerivedType(tag: DW_TAG_member, name: "multiGpuBoardGroupID", scope: !2132, file: !90, line: 171, baseType: !179, size: 32, offset: 5280)
!2217 = !DIDerivedType(tag: DW_TAG_member, name: "hostNativeAtomicSupported", scope: !2132, file: !90, line: 172, baseType: !179, size: 32, offset: 5312)
!2218 = !DIDerivedType(tag: DW_TAG_member, name: "singleToDoublePrecisionPerfRatio", scope: !2132, file: !90, line: 173, baseType: !179, size: 32, offset: 5344)
!2219 = !DIDerivedType(tag: DW_TAG_member, name: "pageableMemoryAccess", scope: !2132, file: !90, line: 174, baseType: !179, size: 32, offset: 5376)
!2220 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentManagedAccess", scope: !2132, file: !90, line: 176, baseType: !179, size: 32, offset: 5408)
!2221 = !DIDerivedType(tag: DW_TAG_member, name: "computePreemptionSupported", scope: !2132, file: !90, line: 178, baseType: !179, size: 32, offset: 5440)
!2222 = !DIDerivedType(tag: DW_TAG_member, name: "canUseHostPointerForRegisteredMem", scope: !2132, file: !90, line: 179, baseType: !179, size: 32, offset: 5472)
!2223 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeLaunch", scope: !2132, file: !90, line: 181, baseType: !179, size: 32, offset: 5504)
!2224 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceLaunch", scope: !2132, file: !90, line: 182, baseType: !179, size: 32, offset: 5536)
!2225 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlockOptin", scope: !2132, file: !90, line: 185, baseType: !827, size: 64, offset: 5568)
!2226 = !DIDerivedType(tag: DW_TAG_member, name: "pageableMemoryAccessUsesHostPageTables", scope: !2132, file: !90, line: 186, baseType: !179, size: 32, offset: 5632)
!2227 = !DIDerivedType(tag: DW_TAG_member, name: "directManagedMemAccessFromHost", scope: !2132, file: !90, line: 188, baseType: !179, size: 32, offset: 5664)
!2228 = !DIDerivedType(tag: DW_TAG_member, name: "maxBlocksPerMultiProcessor", scope: !2132, file: !90, line: 190, baseType: !179, size: 32, offset: 5696)
!2229 = !DIDerivedType(tag: DW_TAG_member, name: "accessPolicyMaxWindowSize", scope: !2132, file: !90, line: 191, baseType: !179, size: 32, offset: 5728)
!2230 = !DIDerivedType(tag: DW_TAG_member, name: "reservedSharedMemPerBlock", scope: !2132, file: !90, line: 192, baseType: !827, size: 64, offset: 5760)
!2231 = !DIDerivedType(tag: DW_TAG_member, name: "hostRegisterSupported", scope: !2132, file: !90, line: 193, baseType: !179, size: 32, offset: 5824)
!2232 = !DIDerivedType(tag: DW_TAG_member, name: "sparseHipArraySupported", scope: !2132, file: !90, line: 194, baseType: !179, size: 32, offset: 5856)
!2233 = !DIDerivedType(tag: DW_TAG_member, name: "hostRegisterReadOnlySupported", scope: !2132, file: !90, line: 195, baseType: !179, size: 32, offset: 5888)
!2234 = !DIDerivedType(tag: DW_TAG_member, name: "timelineSemaphoreInteropSupported", scope: !2132, file: !90, line: 197, baseType: !179, size: 32, offset: 5920)
!2235 = !DIDerivedType(tag: DW_TAG_member, name: "memoryPoolsSupported", scope: !2132, file: !90, line: 198, baseType: !179, size: 32, offset: 5952)
!2236 = !DIDerivedType(tag: DW_TAG_member, name: "gpuDirectRDMASupported", scope: !2132, file: !90, line: 199, baseType: !179, size: 32, offset: 5984)
!2237 = !DIDerivedType(tag: DW_TAG_member, name: "gpuDirectRDMAFlushWritesOptions", scope: !2132, file: !90, line: 200, baseType: !84, size: 32, offset: 6016)
!2238 = !DIDerivedType(tag: DW_TAG_member, name: "gpuDirectRDMAWritesOrdering", scope: !2132, file: !90, line: 202, baseType: !179, size: 32, offset: 6048)
!2239 = !DIDerivedType(tag: DW_TAG_member, name: "memoryPoolSupportedHandleTypes", scope: !2132, file: !90, line: 204, baseType: !84, size: 32, offset: 6080)
!2240 = !DIDerivedType(tag: DW_TAG_member, name: "deferredMappingHipArraySupported", scope: !2132, file: !90, line: 205, baseType: !179, size: 32, offset: 6112)
!2241 = !DIDerivedType(tag: DW_TAG_member, name: "ipcEventSupported", scope: !2132, file: !90, line: 207, baseType: !179, size: 32, offset: 6144)
!2242 = !DIDerivedType(tag: DW_TAG_member, name: "clusterLaunch", scope: !2132, file: !90, line: 208, baseType: !179, size: 32, offset: 6176)
!2243 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedFunctionPointers", scope: !2132, file: !90, line: 209, baseType: !179, size: 32, offset: 6208)
!2244 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !2132, file: !90, line: 210, baseType: !2245, size: 2016, offset: 6240)
!2245 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 2016, elements: !2246)
!2246 = !{!2247}
!2247 = !DISubrange(count: 63)
!2248 = !DIDerivedType(tag: DW_TAG_member, name: "hipReserved", scope: !2132, file: !90, line: 212, baseType: !2249, size: 1024, offset: 8256)
!2249 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 1024, elements: !2250)
!2250 = !{!2251}
!2251 = !DISubrange(count: 32)
!2252 = !DIDerivedType(tag: DW_TAG_member, name: "gcnArchName", scope: !2132, file: !90, line: 215, baseType: !2135, size: 2048, offset: 9280)
!2253 = !DIDerivedType(tag: DW_TAG_member, name: "maxSharedMemoryPerMultiProcessor", scope: !2132, file: !90, line: 216, baseType: !827, size: 64, offset: 11328)
!2254 = !DIDerivedType(tag: DW_TAG_member, name: "clockInstructionRate", scope: !2132, file: !90, line: 217, baseType: !179, size: 32, offset: 11392)
!2255 = !DIDerivedType(tag: DW_TAG_member, name: "arch", scope: !2132, file: !90, line: 219, baseType: !2256, size: 32, offset: 11424)
!2256 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipDeviceArch_t", file: !90, line: 82, baseType: !2257)
!2257 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !90, line: 53, size: 32, flags: DIFlagTypePassByValue, elements: !2258, identifier: "_ZTS15hipDeviceArch_t")
!2258 = !{!2259, !2260, !2261, !2262, !2263, !2264, !2265, !2266, !2267, !2268, !2269, !2270, !2271, !2272, !2273, !2274, !2275}
!2259 = !DIDerivedType(tag: DW_TAG_member, name: "hasGlobalInt32Atomics", scope: !2257, file: !90, line: 55, baseType: !84, size: 1, flags: DIFlagBitField, extraData: i64 0)
!2260 = !DIDerivedType(tag: DW_TAG_member, name: "hasGlobalFloatAtomicExch", scope: !2257, file: !90, line: 56, baseType: !84, size: 1, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!2261 = !DIDerivedType(tag: DW_TAG_member, name: "hasSharedInt32Atomics", scope: !2257, file: !90, line: 57, baseType: !84, size: 1, offset: 2, flags: DIFlagBitField, extraData: i64 0)
!2262 = !DIDerivedType(tag: DW_TAG_member, name: "hasSharedFloatAtomicExch", scope: !2257, file: !90, line: 58, baseType: !84, size: 1, offset: 3, flags: DIFlagBitField, extraData: i64 0)
!2263 = !DIDerivedType(tag: DW_TAG_member, name: "hasFloatAtomicAdd", scope: !2257, file: !90, line: 59, baseType: !84, size: 1, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!2264 = !DIDerivedType(tag: DW_TAG_member, name: "hasGlobalInt64Atomics", scope: !2257, file: !90, line: 62, baseType: !84, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!2265 = !DIDerivedType(tag: DW_TAG_member, name: "hasSharedInt64Atomics", scope: !2257, file: !90, line: 63, baseType: !84, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!2266 = !DIDerivedType(tag: DW_TAG_member, name: "hasDoubles", scope: !2257, file: !90, line: 66, baseType: !84, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!2267 = !DIDerivedType(tag: DW_TAG_member, name: "hasWarpVote", scope: !2257, file: !90, line: 69, baseType: !84, size: 1, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!2268 = !DIDerivedType(tag: DW_TAG_member, name: "hasWarpBallot", scope: !2257, file: !90, line: 70, baseType: !84, size: 1, offset: 9, flags: DIFlagBitField, extraData: i64 0)
!2269 = !DIDerivedType(tag: DW_TAG_member, name: "hasWarpShuffle", scope: !2257, file: !90, line: 71, baseType: !84, size: 1, offset: 10, flags: DIFlagBitField, extraData: i64 0)
!2270 = !DIDerivedType(tag: DW_TAG_member, name: "hasFunnelShift", scope: !2257, file: !90, line: 72, baseType: !84, size: 1, offset: 11, flags: DIFlagBitField, extraData: i64 0)
!2271 = !DIDerivedType(tag: DW_TAG_member, name: "hasThreadFenceSystem", scope: !2257, file: !90, line: 75, baseType: !84, size: 1, offset: 12, flags: DIFlagBitField, extraData: i64 0)
!2272 = !DIDerivedType(tag: DW_TAG_member, name: "hasSyncThreadsExt", scope: !2257, file: !90, line: 76, baseType: !84, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 0)
!2273 = !DIDerivedType(tag: DW_TAG_member, name: "hasSurfaceFuncs", scope: !2257, file: !90, line: 79, baseType: !84, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 0)
!2274 = !DIDerivedType(tag: DW_TAG_member, name: "has3dGrid", scope: !2257, file: !90, line: 80, baseType: !84, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 0)
!2275 = !DIDerivedType(tag: DW_TAG_member, name: "hasDynamicParallelism", scope: !2257, file: !90, line: 81, baseType: !84, size: 1, offset: 16, flags: DIFlagBitField, extraData: i64 0)
!2276 = !DIDerivedType(tag: DW_TAG_member, name: "hdpMemFlushCntl", scope: !2132, file: !90, line: 220, baseType: !2277, size: 64, offset: 11456)
!2277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!2278 = !DIDerivedType(tag: DW_TAG_member, name: "hdpRegFlushCntl", scope: !2132, file: !90, line: 221, baseType: !2277, size: 64, offset: 11520)
!2279 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedFunc", scope: !2132, file: !90, line: 222, baseType: !179, size: 32, offset: 11584)
!2280 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedGridDim", scope: !2132, file: !90, line: 225, baseType: !179, size: 32, offset: 11616)
!2281 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedBlockDim", scope: !2132, file: !90, line: 228, baseType: !179, size: 32, offset: 11648)
!2282 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedSharedMem", scope: !2132, file: !90, line: 231, baseType: !179, size: 32, offset: 11680)
!2283 = !DIDerivedType(tag: DW_TAG_member, name: "isLargeBar", scope: !2132, file: !90, line: 234, baseType: !179, size: 32, offset: 11712)
!2284 = !DIDerivedType(tag: DW_TAG_member, name: "asicRevision", scope: !2132, file: !90, line: 235, baseType: !179, size: 32, offset: 11744)
!2285 = !{i32 7, !"Dwarf Version", i32 5}
!2286 = !{i32 2, !"Debug Info Version", i32 3}
!2287 = !{i32 1, !"wchar_size", i32 4}
!2288 = !{i32 7, !"uwtable", i32 2}
!2289 = !{!"AMD clang version 17.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-6.0.0 23483 7208e8d15fbf218deb74483ea8c549c67ca4985e)"}
!2290 = !{!2291, !2291, i64 0}
!2291 = !{!"any pointer", !2292, i64 0}
!2292 = !{!"omnipotent char", !2293, i64 0}
!2293 = !{!"Simple C++ TBAA"}
!2294 = !{!2295, !2295, i64 0}
!2295 = !{!"int", !2292, i64 0}
!2296 = distinct !DISubprogram(name: "tick_all_test", linkageName: "_Z13tick_all_testi", scope: !9, file: !9, line: 66, type: !867, scopeLine: 67, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !2297)
!2297 = !{!2298, !2299, !2300, !2302, !2303, !2305, !2306, !2309, !2311, !2312, !2314, !2315, !2317}
!2298 = !DILocalVariable(name: "test", arg: 1, scope: !2296, file: !9, line: 66, type: !179)
!2299 = !DILocalVariable(name: "device", scope: !2296, file: !9, line: 68, type: !179)
!2300 = !DILocalVariable(name: "SIZE", scope: !2296, file: !9, line: 72, type: !2301)
!2301 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !193)
!2302 = !DILocalVariable(name: "spin_limit", scope: !2296, file: !9, line: 73, type: !1648)
!2303 = !DILocalVariable(name: "DISPLAY_LIMIT", scope: !2296, file: !9, line: 74, type: !2304)
!2304 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !827)
!2305 = !DILocalVariable(name: "DISPLAY_LINE_LIMIT", scope: !2296, file: !9, line: 75, type: !2304)
!2306 = !DILocalVariable(name: "clk", scope: !2296, file: !9, line: 79, type: !2307)
!2307 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2308, size: 64)
!2308 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !1681)
!2309 = !DILocalVariable(name: "h_vals", scope: !2296, file: !9, line: 85, type: !2310)
!2310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1681, size: 64)
!2311 = !DILocalVariable(name: "d_vals", scope: !2296, file: !9, line: 87, type: !2310)
!2312 = !DILocalVariable(name: "dummy_data", scope: !2296, file: !9, line: 92, type: !2313)
!2313 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1648, size: 64)
!2314 = !DILocalVariable(name: "h_dummy_data", scope: !2296, file: !9, line: 98, type: !2313)
!2315 = !DILocalVariable(name: "i", scope: !2316, file: !9, line: 102, type: !827)
!2316 = distinct !DILexicalBlock(scope: !2296, file: !9, line: 102, column: 3)
!2317 = !DILocalVariable(name: "i", scope: !2318, file: !9, line: 137, type: !827)
!2318 = distinct !DILexicalBlock(scope: !2296, file: !9, line: 137, column: 3)
!2319 = !DILocation(line: 0, scope: !2296)
!2320 = !DILocation(line: 68, column: 3, scope: !2296)
!2321 = !DILocation(line: 68, column: 7, scope: !2296)
!2322 = !DILocation(line: 69, column: 17, scope: !2296)
!2323 = !DILocalVariable(name: "resCode", arg: 1, scope: !2324, file: !9, line: 180, type: !2327)
!2324 = distinct !DISubprogram(name: "__HIP_CHECK__", linkageName: "_Z13__HIP_CHECK__10hipError_t", scope: !9, file: !9, line: 180, type: !2325, scopeLine: 180, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !2328)
!2325 = !DISubroutineType(types: !2326)
!2326 = !{null, !2327}
!2327 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipError_t", file: !90, line: 400, baseType: !89)
!2328 = !{!2323}
!2329 = !DILocation(line: 0, scope: !2324, inlinedAt: !2330)
!2330 = distinct !DILocation(line: 69, column: 3, scope: !2296)
!2331 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !2330)
!2332 = distinct !DILexicalBlock(scope: !2324, file: !9, line: 181, column: 7)
!2333 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !2330)
!2334 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !2330)
!2335 = distinct !DILexicalBlock(scope: !2332, file: !9, line: 181, column: 30)
!2336 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !2330)
!2337 = !DILocalVariable(name: "this", arg: 1, scope: !2338, type: !2353, flags: DIFlagArtificial | DIFlagObjectPointer)
!2338 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !2340, file: !2339, line: 108, type: !2342, scopeLine: 109, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2350, retainedNodes: !2351)
!2339 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ostream", directory: "")
!2340 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ostream<char, std::char_traits<char> >", scope: !2, file: !2341, line: 359, size: 2176, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!2341 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/ostream.tcc", directory: "")
!2342 = !DISubroutineType(types: !2343)
!2343 = !{!2344, !2346, !2347}
!2344 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2345, size: 64)
!2345 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ostream_type", scope: !2340, file: !2339, line: 71, baseType: !2340, flags: DIFlagPublic)
!2346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2340, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2348, size: 64)
!2348 = !DISubroutineType(types: !2349)
!2349 = !{!2344, !2344}
!2350 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !2340, file: !2339, line: 108, type: !2342, scopeLine: 108, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2351 = !{!2337, !2352}
!2352 = !DILocalVariable(name: "__pf", arg: 2, scope: !2338, file: !2339, line: 108, type: !2347)
!2353 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2340, size: 64)
!2354 = !DILocation(line: 0, scope: !2338, inlinedAt: !2355)
!2355 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !2330)
!2356 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2355)
!2357 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !2330)
!2358 = !DILocalVariable(name: "__out", arg: 1, scope: !2359, file: !2339, line: 606, type: !2362)
!2359 = distinct !DISubprogram(name: "operator<<<std::char_traits<char> >", linkageName: "_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc", scope: !2, file: !2339, line: 606, type: !2360, scopeLine: 607, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2365, retainedNodes: !2363)
!2360 = !DISubroutineType(types: !2361)
!2361 = !{!2362, !2362, !710}
!2362 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2340, size: 64)
!2363 = !{!2358, !2364}
!2364 = !DILocalVariable(name: "__s", arg: 2, scope: !2359, file: !2339, line: 606, type: !710)
!2365 = !{!2366}
!2366 = !DITemplateTypeParameter(name: "_Traits", type: !2367)
!2367 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !2, file: !2368, line: 316, size: 8, flags: DIFlagTypePassByValue, elements: !2369, templateParams: !2418, identifier: "_ZTSSt11char_traitsIcE")
!2368 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/char_traits.h", directory: "")
!2369 = !{!2370, !2377, !2380, !2381, !2386, !2389, !2392, !2396, !2397, !2400, !2406, !2409, !2412, !2415}
!2370 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignERcRKc", scope: !2367, file: !2368, line: 328, type: !2371, scopeLine: 328, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2371 = !DISubroutineType(types: !2372)
!2372 = !{null, !2373, !2375}
!2373 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2374, size: 64)
!2374 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2367, file: !2368, line: 318, baseType: !12)
!2375 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2376, size: 64)
!2376 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2374)
!2377 = !DISubprogram(name: "eq", linkageName: "_ZNSt11char_traitsIcE2eqERKcS2_", scope: !2367, file: !2368, line: 332, type: !2378, scopeLine: 332, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2378 = !DISubroutineType(types: !2379)
!2379 = !{!286, !2375, !2375}
!2380 = !DISubprogram(name: "lt", linkageName: "_ZNSt11char_traitsIcE2ltERKcS2_", scope: !2367, file: !2368, line: 336, type: !2378, scopeLine: 336, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2381 = !DISubprogram(name: "compare", linkageName: "_ZNSt11char_traitsIcE7compareEPKcS2_m", scope: !2367, file: !2368, line: 344, type: !2382, scopeLine: 344, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2382 = !DISubroutineType(types: !2383)
!2383 = !{!179, !2384, !2384, !2385}
!2384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2376, size: 64)
!2385 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !2, file: !275, line: 2306, baseType: !829)
!2386 = !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !2367, file: !2368, line: 365, type: !2387, scopeLine: 365, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2387 = !DISubroutineType(types: !2388)
!2388 = !{!2385, !2384}
!2389 = !DISubprogram(name: "find", linkageName: "_ZNSt11char_traitsIcE4findEPKcmRS1_", scope: !2367, file: !2368, line: 375, type: !2390, scopeLine: 375, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2390 = !DISubroutineType(types: !2391)
!2391 = !{!2384, !2384, !2385, !2375}
!2392 = !DISubprogram(name: "move", linkageName: "_ZNSt11char_traitsIcE4moveEPcPKcm", scope: !2367, file: !2368, line: 389, type: !2393, scopeLine: 389, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2393 = !DISubroutineType(types: !2394)
!2394 = !{!2395, !2395, !2384, !2385}
!2395 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2374, size: 64)
!2396 = !DISubprogram(name: "copy", linkageName: "_ZNSt11char_traitsIcE4copyEPcPKcm", scope: !2367, file: !2368, line: 401, type: !2393, scopeLine: 401, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2397 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignEPcmc", scope: !2367, file: !2368, line: 413, type: !2398, scopeLine: 413, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2398 = !DISubroutineType(types: !2399)
!2399 = !{!2395, !2395, !2385, !2374}
!2400 = !DISubprogram(name: "to_char_type", linkageName: "_ZNSt11char_traitsIcE12to_char_typeERKi", scope: !2367, file: !2368, line: 425, type: !2401, scopeLine: 425, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2401 = !DISubroutineType(types: !2402)
!2402 = !{!2374, !2403}
!2403 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2404, size: 64)
!2404 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2405)
!2405 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !2367, file: !2368, line: 319, baseType: !179)
!2406 = !DISubprogram(name: "to_int_type", linkageName: "_ZNSt11char_traitsIcE11to_int_typeERKc", scope: !2367, file: !2368, line: 431, type: !2407, scopeLine: 431, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2407 = !DISubroutineType(types: !2408)
!2408 = !{!2405, !2375}
!2409 = !DISubprogram(name: "eq_int_type", linkageName: "_ZNSt11char_traitsIcE11eq_int_typeERKiS2_", scope: !2367, file: !2368, line: 435, type: !2410, scopeLine: 435, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2410 = !DISubroutineType(types: !2411)
!2411 = !{!286, !2403, !2403}
!2412 = !DISubprogram(name: "eof", linkageName: "_ZNSt11char_traitsIcE3eofEv", scope: !2367, file: !2368, line: 439, type: !2413, scopeLine: 439, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2413 = !DISubroutineType(types: !2414)
!2414 = !{!2405}
!2415 = !DISubprogram(name: "not_eof", linkageName: "_ZNSt11char_traitsIcE7not_eofERKi", scope: !2367, file: !2368, line: 443, type: !2416, scopeLine: 443, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2416 = !DISubroutineType(types: !2417)
!2417 = !{!2405, !2403}
!2418 = !{!2419}
!2419 = !DITemplateTypeParameter(name: "_CharT", type: !12)
!2420 = !DILocation(line: 0, scope: !2359, inlinedAt: !2421)
!2421 = distinct !DILocation(line: 70, column: 13, scope: !2296)
!2422 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2421)
!2423 = distinct !DILexicalBlock(scope: !2359, file: !2339, line: 608, column: 11)
!2424 = !DILocation(line: 0, scope: !2338, inlinedAt: !2425)
!2425 = distinct !DILocation(line: 70, column: 58, scope: !2296)
!2426 = !DILocalVariable(name: "__os", arg: 1, scope: !2427, file: !2339, line: 703, type: !2362)
!2427 = distinct !DISubprogram(name: "flush<char, std::char_traits<char> >", linkageName: "_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !2, file: !2339, line: 703, type: !2428, scopeLine: 704, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2431, retainedNodes: !2430)
!2428 = !DISubroutineType(types: !2429)
!2429 = !{!2362, !2362}
!2430 = !{!2426}
!2431 = !{!2419, !2366}
!2432 = !DILocation(line: 0, scope: !2427, inlinedAt: !2433)
!2433 = distinct !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2425)
!2434 = !DILocation(line: 704, column: 19, scope: !2427, inlinedAt: !2433)
!2435 = !DILocation(line: 0, scope: !2359, inlinedAt: !2436)
!2436 = distinct !DILocation(line: 71, column: 13, scope: !2296)
!2437 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2436)
!2438 = !DILocation(line: 71, column: 48, scope: !2296)
!2439 = !DILocation(line: 71, column: 45, scope: !2296)
!2440 = !DILocation(line: 0, scope: !2338, inlinedAt: !2441)
!2441 = distinct !DILocation(line: 71, column: 55, scope: !2296)
!2442 = !DILocalVariable(name: "__os", arg: 1, scope: !2443, file: !2339, line: 681, type: !2362)
!2443 = distinct !DISubprogram(name: "endl<char, std::char_traits<char> >", linkageName: "_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !2, file: !2339, line: 681, type: !2428, scopeLine: 682, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2431, retainedNodes: !2444)
!2444 = !{!2442}
!2445 = !DILocation(line: 0, scope: !2443, inlinedAt: !2446)
!2446 = distinct !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2441)
!2447 = !DILocation(line: 682, column: 29, scope: !2443, inlinedAt: !2446)
!2448 = !{!2449, !2449, i64 0}
!2449 = !{!"vtable pointer", !2293, i64 0}
!2450 = !DILocalVariable(name: "this", arg: 1, scope: !2451, type: !2463, flags: DIFlagArtificial | DIFlagObjectPointer)
!2451 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !2453, file: !2452, line: 449, type: !2455, scopeLine: 450, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2460, retainedNodes: !2461)
!2452 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/basic_ios.h", directory: "")
!2453 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ios<char, std::char_traits<char> >", scope: !2, file: !2454, line: 178, size: 2112, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!2454 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/basic_ios.tcc", directory: "")
!2455 = !DISubroutineType(types: !2456)
!2456 = !{!2457, !2458, !12}
!2457 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2453, file: !2452, line: 76, baseType: !12, flags: DIFlagPublic)
!2458 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2459, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2459 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2453)
!2460 = !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !2453, file: !2452, line: 449, type: !2455, scopeLine: 449, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2461 = !{!2450, !2462}
!2462 = !DILocalVariable(name: "__c", arg: 2, scope: !2451, file: !2452, line: 449, type: !12)
!2463 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2459, size: 64)
!2464 = !DILocation(line: 0, scope: !2451, inlinedAt: !2465)
!2465 = distinct !DILocation(line: 682, column: 34, scope: !2443, inlinedAt: !2446)
!2466 = !DILocation(line: 450, column: 30, scope: !2451, inlinedAt: !2465)
!2467 = !{!2468, !2291, i64 240}
!2468 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !2469, i64 0, !2291, i64 216, !2292, i64 224, !2475, i64 225, !2291, i64 232, !2291, i64 240, !2291, i64 248, !2291, i64 256}
!2469 = !{!"_ZTSSt8ios_base", !2470, i64 8, !2470, i64 16, !2471, i64 24, !2472, i64 28, !2472, i64 32, !2291, i64 40, !2473, i64 48, !2292, i64 64, !2295, i64 192, !2291, i64 200, !2474, i64 208}
!2470 = !{!"long", !2292, i64 0}
!2471 = !{!"_ZTSSt13_Ios_Fmtflags", !2292, i64 0}
!2472 = !{!"_ZTSSt12_Ios_Iostate", !2292, i64 0}
!2473 = !{!"_ZTSNSt8ios_base6_WordsE", !2291, i64 0, !2470, i64 8}
!2474 = !{!"_ZTSSt6locale", !2291, i64 0}
!2475 = !{!"bool", !2292, i64 0}
!2476 = !DILocalVariable(name: "__f", arg: 1, scope: !2477, file: !2452, line: 47, type: !2484)
!2477 = distinct !DISubprogram(name: "__check_facet<std::ctype<char> >", linkageName: "_ZSt13__check_facetISt5ctypeIcEERKT_PS3_", scope: !2, file: !2452, line: 47, type: !2478, scopeLine: 48, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2486, retainedNodes: !2485)
!2478 = !DISubroutineType(types: !2479)
!2479 = !{!2480, !2484}
!2480 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2481, size: 64)
!2481 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2482)
!2482 = !DICompositeType(tag: DW_TAG_class_type, name: "ctype<char>", scope: !2, file: !2483, line: 681, size: 4608, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt5ctypeIcE")
!2483 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/locale_facets.h", directory: "")
!2484 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2481, size: 64)
!2485 = !{!2476}
!2486 = !{!2487}
!2487 = !DITemplateTypeParameter(name: "_Facet", type: !2482)
!2488 = !DILocation(line: 0, scope: !2477, inlinedAt: !2489)
!2489 = distinct !DILocation(line: 450, column: 16, scope: !2451, inlinedAt: !2465)
!2490 = !DILocation(line: 49, column: 12, scope: !2491, inlinedAt: !2489)
!2491 = distinct !DILexicalBlock(scope: !2477, file: !2452, line: 49, column: 11)
!2492 = !DILocation(line: 49, column: 11, scope: !2477, inlinedAt: !2489)
!2493 = !DILocation(line: 50, column: 2, scope: !2491, inlinedAt: !2489)
!2494 = !DILocalVariable(name: "this", arg: 1, scope: !2495, type: !2484, flags: DIFlagArtificial | DIFlagObjectPointer)
!2495 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !2482, file: !2483, line: 872, type: !2496, scopeLine: 873, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2500, retainedNodes: !2501)
!2496 = !DISubroutineType(types: !2497)
!2497 = !{!2498, !2499, !12}
!2498 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2482, file: !2483, line: 686, baseType: !12, flags: DIFlagPublic)
!2499 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2481, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2500 = !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !2482, file: !2483, line: 872, type: !2496, scopeLine: 872, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2501 = !{!2494, !2502}
!2502 = !DILocalVariable(name: "__c", arg: 2, scope: !2495, file: !2483, line: 872, type: !12)
!2503 = !DILocation(line: 0, scope: !2495, inlinedAt: !2504)
!2504 = distinct !DILocation(line: 450, column: 40, scope: !2451, inlinedAt: !2465)
!2505 = !DILocation(line: 874, column: 6, scope: !2506, inlinedAt: !2504)
!2506 = distinct !DILexicalBlock(scope: !2495, file: !2483, line: 874, column: 6)
!2507 = !{!2508, !2292, i64 56}
!2508 = !{!"_ZTSSt5ctypeIcE", !2509, i64 0, !2291, i64 16, !2475, i64 24, !2291, i64 32, !2291, i64 40, !2291, i64 48, !2292, i64 56, !2292, i64 57, !2292, i64 313, !2292, i64 569}
!2509 = !{!"_ZTSNSt6locale5facetE", !2295, i64 8}
!2510 = !DILocation(line: 874, column: 6, scope: !2495, inlinedAt: !2504)
!2511 = !DILocation(line: 875, column: 11, scope: !2506, inlinedAt: !2504)
!2512 = !{!2292, !2292, i64 0}
!2513 = !DILocation(line: 875, column: 4, scope: !2506, inlinedAt: !2504)
!2514 = !DILocation(line: 876, column: 8, scope: !2495, inlinedAt: !2504)
!2515 = !DILocation(line: 877, column: 15, scope: !2495, inlinedAt: !2504)
!2516 = !DILocation(line: 877, column: 2, scope: !2495, inlinedAt: !2504)
!2517 = !DILocation(line: 682, column: 25, scope: !2443, inlinedAt: !2446)
!2518 = !DILocation(line: 0, scope: !2427, inlinedAt: !2519)
!2519 = distinct !DILocation(line: 682, column: 14, scope: !2443, inlinedAt: !2446)
!2520 = !DILocation(line: 704, column: 19, scope: !2427, inlinedAt: !2519)
!2521 = !DILocation(line: 79, column: 3, scope: !2296)
!2522 = !DILocalVariable(name: "devPtr", arg: 1, scope: !2523, file: !90, line: 8627, type: !2526)
!2523 = distinct !DISubprogram(name: "hipMallocManaged<_Atomic(unsigned long)>", linkageName: "_ZL16hipMallocManagedIU7_AtomicmE10hipError_tPPT_mj", scope: !90, file: !90, line: 8627, type: !2524, scopeLine: 8628, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2532, retainedNodes: !2529)
!2524 = !DISubroutineType(types: !2525)
!2525 = !{!2327, !2526, !827, !84}
!2526 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2527, size: 64)
!2527 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2528, size: 64)
!2528 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !829)
!2529 = !{!2522, !2530, !2531}
!2530 = !DILocalVariable(name: "size", arg: 2, scope: !2523, file: !90, line: 8627, type: !827)
!2531 = !DILocalVariable(name: "flags", arg: 3, scope: !2523, file: !90, line: 8628, type: !84)
!2532 = !{!2533}
!2533 = !DITemplateTypeParameter(name: "T", type: !2528)
!2534 = !DILocation(line: 0, scope: !2523, inlinedAt: !2535)
!2535 = distinct !DILocation(line: 80, column: 17, scope: !2296)
!2536 = !DILocation(line: 8629, column: 12, scope: !2523, inlinedAt: !2535)
!2537 = !DILocation(line: 0, scope: !2324, inlinedAt: !2538)
!2538 = distinct !DILocation(line: 80, column: 3, scope: !2296)
!2539 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !2538)
!2540 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !2538)
!2541 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !2538)
!2542 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !2538)
!2543 = !DILocation(line: 0, scope: !2338, inlinedAt: !2544)
!2544 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !2538)
!2545 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2544)
!2546 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !2538)
!2547 = !DILocation(line: 82, column: 4, scope: !2296)
!2548 = !DILocation(line: 82, column: 8, scope: !2296)
!2549 = !DILocation(line: 85, column: 22, scope: !2296)
!2550 = !DILocation(line: 86, column: 3, scope: !2296)
!2551 = !DILocation(line: 87, column: 3, scope: !2296)
!2552 = !DILocalVariable(name: "devPtr", arg: 1, scope: !2553, file: !90, line: 8592, type: !2556)
!2553 = distinct !DISubprogram(name: "hipMalloc<unsigned long>", linkageName: "_ZL9hipMallocImE10hipError_tPPT_m", scope: !90, file: !90, line: 8592, type: !2554, scopeLine: 8592, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2560, retainedNodes: !2558)
!2554 = !DISubroutineType(types: !2555)
!2555 = !{!2327, !2556, !827}
!2556 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2557, size: 64)
!2557 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !829, size: 64)
!2558 = !{!2552, !2559}
!2559 = !DILocalVariable(name: "size", arg: 2, scope: !2553, file: !90, line: 8592, type: !827)
!2560 = !{!2561}
!2561 = !DITemplateTypeParameter(name: "T", type: !829)
!2562 = !DILocation(line: 0, scope: !2553, inlinedAt: !2563)
!2563 = distinct !DILocation(line: 88, column: 17, scope: !2296)
!2564 = !DILocation(line: 8593, column: 12, scope: !2553, inlinedAt: !2563)
!2565 = !DILocation(line: 0, scope: !2324, inlinedAt: !2566)
!2566 = distinct !DILocation(line: 88, column: 3, scope: !2296)
!2567 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !2566)
!2568 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !2566)
!2569 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !2566)
!2570 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !2566)
!2571 = !DILocation(line: 0, scope: !2338, inlinedAt: !2572)
!2572 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !2566)
!2573 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2572)
!2574 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !2566)
!2575 = !DILocation(line: 89, column: 27, scope: !2296)
!2576 = !DILocation(line: 89, column: 17, scope: !2296)
!2577 = !DILocation(line: 0, scope: !2324, inlinedAt: !2578)
!2578 = distinct !DILocation(line: 89, column: 3, scope: !2296)
!2579 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !2578)
!2580 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !2578)
!2581 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !2578)
!2582 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !2578)
!2583 = !DILocation(line: 0, scope: !2338, inlinedAt: !2584)
!2584 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !2578)
!2585 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2584)
!2586 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !2578)
!2587 = !DILocation(line: 92, column: 3, scope: !2296)
!2588 = !DILocalVariable(name: "devPtr", arg: 1, scope: !2589, file: !90, line: 8592, type: !2592)
!2589 = distinct !DISubprogram(name: "hipMalloc<long>", linkageName: "_ZL9hipMallocIlE10hipError_tPPT_m", scope: !90, file: !90, line: 8592, type: !2590, scopeLine: 8592, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2596, retainedNodes: !2594)
!2590 = !DISubroutineType(types: !2591)
!2591 = !{!2327, !2592, !827}
!2592 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2593, size: 64)
!2593 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !210, size: 64)
!2594 = !{!2588, !2595}
!2595 = !DILocalVariable(name: "size", arg: 2, scope: !2589, file: !90, line: 8592, type: !827)
!2596 = !{!2597}
!2597 = !DITemplateTypeParameter(name: "T", type: !210)
!2598 = !DILocation(line: 0, scope: !2589, inlinedAt: !2599)
!2599 = distinct !DILocation(line: 93, column: 17, scope: !2296)
!2600 = !DILocation(line: 8593, column: 12, scope: !2589, inlinedAt: !2599)
!2601 = !DILocation(line: 0, scope: !2324, inlinedAt: !2602)
!2602 = distinct !DILocation(line: 93, column: 3, scope: !2296)
!2603 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !2602)
!2604 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !2602)
!2605 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !2602)
!2606 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !2602)
!2607 = !DILocation(line: 0, scope: !2338, inlinedAt: !2608)
!2608 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !2602)
!2609 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2608)
!2610 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !2602)
!2611 = !DILocation(line: 95, column: 2, scope: !2612)
!2612 = distinct !DILexicalBlock(scope: !2296, file: !9, line: 95, column: 2)
!2613 = !DILocation(line: 98, column: 27, scope: !2296)
!2614 = !DILocation(line: 99, column: 3, scope: !2296)
!2615 = !DILocation(line: 100, column: 41, scope: !2296)
!2616 = !DILocation(line: 100, column: 17, scope: !2296)
!2617 = !DILocation(line: 0, scope: !2324, inlinedAt: !2618)
!2618 = distinct !DILocation(line: 100, column: 3, scope: !2296)
!2619 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !2618)
!2620 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !2618)
!2621 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !2618)
!2622 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !2618)
!2623 = !DILocation(line: 0, scope: !2338, inlinedAt: !2624)
!2624 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !2618)
!2625 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2624)
!2626 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !2618)
!2627 = !DILocation(line: 0, scope: !2359, inlinedAt: !2628)
!2628 = distinct !DILocation(line: 101, column: 13, scope: !2296)
!2629 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2628)
!2630 = !DILocation(line: 0, scope: !2316)
!2631 = !DILocation(line: 102, column: 3, scope: !2316)
!2632 = !DILocation(line: 0, scope: !2359, inlinedAt: !2633)
!2633 = distinct !DILocation(line: 108, column: 15, scope: !2634)
!2634 = distinct !DILexicalBlock(scope: !2296, file: !9, line: 107, column: 7)
!2635 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2633)
!2636 = !DILocalVariable(name: "__f", arg: 2, scope: !2637, file: !2638, line: 178, type: !2641)
!2637 = distinct !DISubprogram(name: "operator<<<char, std::char_traits<char> >", linkageName: "_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E", scope: !2, file: !2638, line: 178, type: !2639, scopeLine: 179, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2431, retainedNodes: !2644)
!2638 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/iomanip", directory: "")
!2639 = !DISubroutineType(types: !2640)
!2640 = !{!2362, !2362, !2641}
!2641 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Setfill<char>", scope: !2, file: !2638, line: 154, size: 8, flags: DIFlagTypePassByValue, elements: !2642, templateParams: !2418, identifier: "_ZTSSt8_SetfillIcE")
!2642 = !{!2643}
!2643 = !DIDerivedType(tag: DW_TAG_member, name: "_M_c", scope: !2641, file: !2638, line: 154, baseType: !12, size: 8)
!2644 = !{!2645, !2636}
!2645 = !DILocalVariable(name: "__os", arg: 1, scope: !2637, file: !2638, line: 178, type: !2362)
!2646 = !DILocation(line: 0, scope: !2637, inlinedAt: !2647)
!2647 = distinct !DILocation(line: 108, column: 27, scope: !2634)
!2648 = !DILocation(line: 180, column: 7, scope: !2637, inlinedAt: !2647)
!2649 = !DILocalVariable(name: "this", arg: 1, scope: !2650, type: !2658, flags: DIFlagArtificial | DIFlagObjectPointer)
!2650 = distinct !DISubprogram(name: "fill", linkageName: "_ZNSt9basic_iosIcSt11char_traitsIcEE4fillEc", scope: !2453, file: !2452, line: 390, type: !2651, scopeLine: 391, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2654, retainedNodes: !2655)
!2651 = !DISubroutineType(types: !2652)
!2652 = !{!2457, !2653, !2457}
!2653 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2453, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2654 = !DISubprogram(name: "fill", linkageName: "_ZNSt9basic_iosIcSt11char_traitsIcEE4fillEc", scope: !2453, file: !2452, line: 390, type: !2651, scopeLine: 390, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2655 = !{!2649, !2656, !2657}
!2656 = !DILocalVariable(name: "__ch", arg: 2, scope: !2650, file: !2452, line: 390, type: !2457)
!2657 = !DILocalVariable(name: "__old", scope: !2650, file: !2452, line: 392, type: !2457)
!2658 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2453, size: 64)
!2659 = !DILocation(line: 0, scope: !2650, inlinedAt: !2660)
!2660 = distinct !DILocation(line: 180, column: 12, scope: !2637, inlinedAt: !2647)
!2661 = !DILocalVariable(name: "this", arg: 1, scope: !2662, type: !2463, flags: DIFlagArtificial | DIFlagObjectPointer)
!2662 = distinct !DISubprogram(name: "fill", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv", scope: !2453, file: !2452, line: 370, type: !2663, scopeLine: 371, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2665, retainedNodes: !2666)
!2663 = !DISubroutineType(types: !2664)
!2664 = !{!2457, !2458}
!2665 = !DISubprogram(name: "fill", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv", scope: !2453, file: !2452, line: 370, type: !2663, scopeLine: 370, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2666 = !{!2661}
!2667 = !DILocation(line: 0, scope: !2662, inlinedAt: !2668)
!2668 = distinct !DILocation(line: 392, column: 26, scope: !2650, inlinedAt: !2660)
!2669 = !DILocation(line: 372, column: 7, scope: !2670, inlinedAt: !2668)
!2670 = distinct !DILexicalBlock(scope: !2662, file: !2452, line: 372, column: 6)
!2671 = !{!2468, !2475, i64 225}
!2672 = !{i8 0, i8 2}
!2673 = !DILocation(line: 372, column: 6, scope: !2662, inlinedAt: !2668)
!2674 = !DILocation(line: 0, scope: !2451, inlinedAt: !2675)
!2675 = distinct !DILocation(line: 374, column: 22, scope: !2676, inlinedAt: !2668)
!2676 = distinct !DILexicalBlock(scope: !2670, file: !2452, line: 373, column: 4)
!2677 = !DILocation(line: 450, column: 30, scope: !2451, inlinedAt: !2675)
!2678 = !DILocation(line: 0, scope: !2477, inlinedAt: !2679)
!2679 = distinct !DILocation(line: 450, column: 16, scope: !2451, inlinedAt: !2675)
!2680 = !DILocation(line: 49, column: 12, scope: !2491, inlinedAt: !2679)
!2681 = !DILocation(line: 49, column: 11, scope: !2477, inlinedAt: !2679)
!2682 = !DILocation(line: 50, column: 2, scope: !2491, inlinedAt: !2679)
!2683 = !DILocation(line: 0, scope: !2495, inlinedAt: !2684)
!2684 = distinct !DILocation(line: 450, column: 40, scope: !2451, inlinedAt: !2675)
!2685 = !DILocation(line: 874, column: 6, scope: !2506, inlinedAt: !2684)
!2686 = !DILocation(line: 874, column: 6, scope: !2495, inlinedAt: !2684)
!2687 = !DILocation(line: 876, column: 8, scope: !2495, inlinedAt: !2684)
!2688 = !DILocation(line: 877, column: 15, scope: !2495, inlinedAt: !2684)
!2689 = !DILocation(line: 240, column: 7, scope: !2690, inlinedAt: !2699)
!2690 = distinct !DISubprogram(name: "operator<<<char, std::char_traits<char> >", linkageName: "_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw", scope: !2, file: !2638, line: 238, type: !2691, scopeLine: 239, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2431, retainedNodes: !2696)
!2691 = !DISubroutineType(types: !2692)
!2692 = !{!2362, !2362, !2693}
!2693 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Setw", scope: !2, file: !2638, line: 215, size: 32, flags: DIFlagTypePassByValue, elements: !2694, identifier: "_ZTSSt5_Setw")
!2694 = !{!2695}
!2695 = !DIDerivedType(tag: DW_TAG_member, name: "_M_n", scope: !2693, file: !2638, line: 215, baseType: !179, size: 32)
!2696 = !{!2697, !2698}
!2697 = !DILocalVariable(name: "__os", arg: 1, scope: !2690, file: !2638, line: 238, type: !2362)
!2698 = !DILocalVariable(name: "__f", arg: 2, scope: !2690, file: !2638, line: 238, type: !2693)
!2699 = distinct !DILocation(line: 108, column: 48, scope: !2634)
!2700 = !DILocation(line: 877, column: 2, scope: !2495, inlinedAt: !2684)
!2701 = !DILocation(line: 375, column: 19, scope: !2676, inlinedAt: !2668)
!2702 = !DILocation(line: 376, column: 4, scope: !2676, inlinedAt: !2668)
!2703 = !DILocation(line: 393, column: 2, scope: !2650, inlinedAt: !2660)
!2704 = !DILocation(line: 393, column: 10, scope: !2650, inlinedAt: !2660)
!2705 = !{!2468, !2292, i64 224}
!2706 = !DILocation(line: 0, scope: !2690, inlinedAt: !2699)
!2707 = !DILocalVariable(name: "this", arg: 1, scope: !2708, type: !2716, flags: DIFlagArtificial | DIFlagObjectPointer)
!2708 = distinct !DISubprogram(name: "width", linkageName: "_ZNSt8ios_base5widthEl", scope: !6, file: !5, line: 751, type: !2709, scopeLine: 752, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2712, retainedNodes: !2713)
!2709 = !DISubroutineType(types: !2710)
!2710 = !{!272, !2711, !272}
!2711 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2712 = !DISubprogram(name: "width", linkageName: "_ZNSt8ios_base5widthEl", scope: !6, file: !5, line: 751, type: !2709, scopeLine: 751, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2713 = !{!2707, !2714, !2715}
!2714 = !DILocalVariable(name: "__wide", arg: 2, scope: !2708, file: !5, line: 751, type: !272)
!2715 = !DILocalVariable(name: "__old", scope: !2708, file: !5, line: 753, type: !272)
!2716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!2717 = !DILocation(line: 0, scope: !2708, inlinedAt: !2718)
!2718 = distinct !DILocation(line: 240, column: 12, scope: !2690, inlinedAt: !2699)
!2719 = !DILocation(line: 753, column: 26, scope: !2708, inlinedAt: !2718)
!2720 = !DILocation(line: 754, column: 16, scope: !2708, inlinedAt: !2718)
!2721 = !{!2469, !2470, i64 16}
!2722 = !DILocation(line: 0, scope: !2359, inlinedAt: !2723)
!2723 = distinct !DILocation(line: 108, column: 64, scope: !2634)
!2724 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2723)
!2725 = !DILocation(line: 0, scope: !2359, inlinedAt: !2726)
!2726 = distinct !DILocation(line: 109, column: 13, scope: !2296)
!2727 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2726)
!2728 = !DILocation(line: 0, scope: !2338, inlinedAt: !2729)
!2729 = distinct !DILocation(line: 109, column: 26, scope: !2296)
!2730 = !DILocation(line: 0, scope: !2427, inlinedAt: !2731)
!2731 = distinct !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2729)
!2732 = !DILocation(line: 704, column: 19, scope: !2427, inlinedAt: !2731)
!2733 = !DILocation(line: 113, column: 18, scope: !2296)
!2734 = !DILocation(line: 113, column: 3, scope: !2296)
!2735 = !DILocation(line: 103, column: 11, scope: !2736)
!2736 = distinct !DILexicalBlock(scope: !2737, file: !9, line: 103, column: 9)
!2737 = distinct !DILexicalBlock(scope: !2738, file: !9, line: 102, column: 42)
!2738 = distinct !DILexicalBlock(scope: !2316, file: !9, line: 102, column: 3)
!2739 = !DILocation(line: 103, column: 32, scope: !2736)
!2740 = !DILocation(line: 103, column: 9, scope: !2737)
!2741 = !DILocation(line: 0, scope: !2359, inlinedAt: !2742)
!2742 = distinct !DILocation(line: 104, column: 17, scope: !2736)
!2743 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2742)
!2744 = !DILocation(line: 104, column: 7, scope: !2736)
!2745 = !DILocation(line: 0, scope: !2637, inlinedAt: !2746)
!2746 = distinct !DILocation(line: 105, column: 15, scope: !2737)
!2747 = !DILocation(line: 180, column: 7, scope: !2637, inlinedAt: !2746)
!2748 = !DILocation(line: 0, scope: !2650, inlinedAt: !2749)
!2749 = distinct !DILocation(line: 180, column: 12, scope: !2637, inlinedAt: !2746)
!2750 = !DILocation(line: 0, scope: !2662, inlinedAt: !2751)
!2751 = distinct !DILocation(line: 392, column: 26, scope: !2650, inlinedAt: !2749)
!2752 = !DILocation(line: 372, column: 7, scope: !2670, inlinedAt: !2751)
!2753 = !DILocation(line: 372, column: 6, scope: !2662, inlinedAt: !2751)
!2754 = !DILocation(line: 0, scope: !2451, inlinedAt: !2755)
!2755 = distinct !DILocation(line: 374, column: 22, scope: !2676, inlinedAt: !2751)
!2756 = !DILocation(line: 450, column: 30, scope: !2451, inlinedAt: !2755)
!2757 = !DILocation(line: 0, scope: !2477, inlinedAt: !2758)
!2758 = distinct !DILocation(line: 450, column: 16, scope: !2451, inlinedAt: !2755)
!2759 = !DILocation(line: 49, column: 12, scope: !2491, inlinedAt: !2758)
!2760 = !DILocation(line: 49, column: 11, scope: !2477, inlinedAt: !2758)
!2761 = !DILocation(line: 50, column: 2, scope: !2491, inlinedAt: !2758)
!2762 = !DILocation(line: 0, scope: !2495, inlinedAt: !2763)
!2763 = distinct !DILocation(line: 450, column: 40, scope: !2451, inlinedAt: !2755)
!2764 = !DILocation(line: 874, column: 6, scope: !2506, inlinedAt: !2763)
!2765 = !DILocation(line: 874, column: 6, scope: !2495, inlinedAt: !2763)
!2766 = !DILocation(line: 876, column: 8, scope: !2495, inlinedAt: !2763)
!2767 = !DILocation(line: 877, column: 15, scope: !2495, inlinedAt: !2763)
!2768 = !DILocation(line: 240, column: 7, scope: !2690, inlinedAt: !2769)
!2769 = distinct !DILocation(line: 105, column: 36, scope: !2737)
!2770 = !DILocation(line: 877, column: 2, scope: !2495, inlinedAt: !2763)
!2771 = !DILocation(line: 375, column: 19, scope: !2676, inlinedAt: !2751)
!2772 = !DILocation(line: 376, column: 4, scope: !2676, inlinedAt: !2751)
!2773 = !DILocation(line: 393, column: 2, scope: !2650, inlinedAt: !2749)
!2774 = !DILocation(line: 393, column: 10, scope: !2650, inlinedAt: !2749)
!2775 = !DILocation(line: 0, scope: !2690, inlinedAt: !2769)
!2776 = !DILocation(line: 0, scope: !2708, inlinedAt: !2777)
!2777 = distinct !DILocation(line: 240, column: 12, scope: !2690, inlinedAt: !2769)
!2778 = !DILocation(line: 753, column: 26, scope: !2708, inlinedAt: !2777)
!2779 = !DILocation(line: 754, column: 16, scope: !2708, inlinedAt: !2777)
!2780 = !DILocation(line: 105, column: 55, scope: !2737)
!2781 = !{!2470, !2470, i64 0}
!2782 = !DILocalVariable(name: "this", arg: 1, scope: !2783, type: !2353, flags: DIFlagArtificial | DIFlagObjectPointer)
!2783 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEl", scope: !2340, file: !2339, line: 166, type: !2784, scopeLine: 167, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2786, retainedNodes: !2787)
!2784 = !DISubroutineType(types: !2785)
!2785 = !{!2344, !2346, !210}
!2786 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEl", scope: !2340, file: !2339, line: 166, type: !2784, scopeLine: 166, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2787 = !{!2782, !2788}
!2788 = !DILocalVariable(name: "__n", arg: 2, scope: !2783, file: !2339, line: 166, type: !210)
!2789 = !DILocation(line: 0, scope: !2783, inlinedAt: !2790)
!2790 = distinct !DILocation(line: 105, column: 52, scope: !2737)
!2791 = !DILocation(line: 167, column: 16, scope: !2783, inlinedAt: !2790)
!2792 = !DILocation(line: 0, scope: !2359, inlinedAt: !2793)
!2793 = distinct !DILocation(line: 105, column: 71, scope: !2737)
!2794 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2793)
!2795 = !DILocation(line: 102, column: 37, scope: !2738)
!2796 = !DILocation(line: 102, column: 21, scope: !2738)
!2797 = distinct !{!2797, !2631, !2798, !2799}
!2798 = !DILocation(line: 106, column: 3, scope: !2316)
!2799 = !{!"llvm.loop.mustprogress"}
!2800 = !DILocation(line: 113, column: 49, scope: !2296)
!2801 = !DILocation(line: 113, column: 54, scope: !2296)
!2802 = !DILocation(line: 113, column: 62, scope: !2296)
!2803 = !DILocation(line: 117, column: 3, scope: !2296)
!2804 = !DILocation(line: 401, column: 2, scope: !2805, inlinedAt: !2828)
!2805 = distinct !DISubprogram(name: "sleep_for<long, std::ratio<1L, 1000L> >", linkageName: "_ZNSt11this_thread9sleep_forIlSt5ratioILl1ELl1000EEEEvRKNSt6chrono8durationIT_T0_EE", scope: !2807, file: !2806, line: 389, type: !2808, scopeLine: 390, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !260, retainedNodes: !2810)
!2806 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/thread", directory: "")
!2807 = !DINamespace(name: "this_thread", scope: !2)
!2808 = !DISubroutineType(types: !2809)
!2809 = !{null, !224}
!2810 = !{!2811, !2812, !2819, !2825}
!2811 = !DILocalVariable(name: "__rtime", arg: 1, scope: !2805, file: !2806, line: 389, type: !224)
!2812 = !DILocalVariable(name: "__s", scope: !2805, file: !2806, line: 393, type: !2813)
!2813 = !DIDerivedType(tag: DW_TAG_typedef, name: "__enable_if_is_duration<std::chrono::duration<long> >", scope: !205, file: !204, line: 242, baseType: !2814)
!2814 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2815, file: !423, line: 2188, baseType: !302)
!2815 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, std::chrono::duration<long, std::ratio<1L, 1L> > >", scope: !2, file: !423, line: 2187, size: 8, flags: DIFlagTypePassByValue, elements: !297, templateParams: !2816, identifier: "_ZTSSt9enable_ifILb1ENSt6chrono8durationIlSt5ratioILl1ELl1EEEEE")
!2816 = !{!2817, !2818}
!2817 = !DITemplateValueParameter(type: !286, value: i1 true)
!2818 = !DITemplateTypeParameter(name: "_Tp", type: !302)
!2819 = !DILocalVariable(name: "__ns", scope: !2805, file: !2806, line: 394, type: !2820)
!2820 = !DIDerivedType(tag: DW_TAG_typedef, name: "__enable_if_is_duration<std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !205, file: !204, line: 242, baseType: !2821)
!2821 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2822, file: !423, line: 2188, baseType: !358)
!2822 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !2, file: !423, line: 2187, size: 8, flags: DIFlagTypePassByValue, elements: !297, templateParams: !2823, identifier: "_ZTSSt9enable_ifILb1ENSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEEE")
!2823 = !{!2817, !2824}
!2824 = !DITemplateTypeParameter(name: "_Tp", type: !358)
!2825 = !DILocalVariable(name: "__ts", scope: !2805, file: !2806, line: 396, type: !2826)
!2826 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gthread_time_t", file: !2827, line: 53, baseType: !2026)
!2827 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/x86_64-redhat-linux/bits/gthr-default.h", directory: "", checksumkind: CSK_MD5, checksum: "67de20ea417b349191308ef2cace4b80")
!2828 = distinct !DILocation(line: 118, column: 5, scope: !2829)
!2829 = distinct !DILexicalBlock(scope: !2296, file: !9, line: 117, column: 6)
!2830 = !DILocation(line: 0, scope: !2805, inlinedAt: !2828)
!2831 = !DILocation(line: 396, column: 2, scope: !2805, inlinedAt: !2828)
!2832 = !DILocation(line: 396, column: 19, scope: !2805, inlinedAt: !2828)
!2833 = !DILocation(line: 397, column: 4, scope: !2805, inlinedAt: !2828)
!2834 = !{!2835, !2470, i64 0}
!2835 = !{!"_ZTS8timespec", !2470, i64 0, !2470, i64 8}
!2836 = !{!2835, !2470, i64 8}
!2837 = !DILocation(line: 401, column: 9, scope: !2805, inlinedAt: !2828)
!2838 = !DILocation(line: 401, column: 35, scope: !2805, inlinedAt: !2828)
!2839 = !DILocation(line: 401, column: 41, scope: !2805, inlinedAt: !2828)
!2840 = !DILocation(line: 401, column: 44, scope: !2805, inlinedAt: !2828)
!2841 = !DILocation(line: 401, column: 50, scope: !2805, inlinedAt: !2828)
!2842 = distinct !{!2842, !2804, !2843, !2799}
!2843 = !DILocation(line: 402, column: 6, scope: !2805, inlinedAt: !2828)
!2844 = !DILocation(line: 406, column: 7, scope: !2805, inlinedAt: !2828)
!2845 = !DILocation(line: 119, column: 13, scope: !2296)
!2846 = !DILocation(line: 119, column: 12, scope: !2296)
!2847 = !DILocation(line: 119, column: 17, scope: !2296)
!2848 = !DILocation(line: 119, column: 22, scope: !2296)
!2849 = !DILocation(line: 119, column: 26, scope: !2296)
!2850 = !DILocation(line: 119, column: 39, scope: !2296)
!2851 = !DILocation(line: 119, column: 3, scope: !2829)
!2852 = distinct !{!2852, !2803, !2853, !2799}
!2853 = !DILocation(line: 119, column: 43, scope: !2296)
!2854 = !DILocation(line: 121, column: 8, scope: !2855)
!2855 = distinct !DILexicalBlock(scope: !2296, file: !9, line: 121, column: 7)
!2856 = !DILocation(line: 121, column: 7, scope: !2855)
!2857 = !DILocation(line: 121, column: 12, scope: !2855)
!2858 = !DILocation(line: 121, column: 7, scope: !2296)
!2859 = !DILocation(line: 0, scope: !2359, inlinedAt: !2860)
!2860 = distinct !DILocation(line: 122, column: 15, scope: !2855)
!2861 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2860)
!2862 = !DILocation(line: 0, scope: !2338, inlinedAt: !2863)
!2863 = distinct !DILocation(line: 122, column: 81, scope: !2855)
!2864 = !DILocation(line: 0, scope: !2443, inlinedAt: !2865)
!2865 = distinct !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2863)
!2866 = !DILocation(line: 682, column: 29, scope: !2443, inlinedAt: !2865)
!2867 = !DILocation(line: 0, scope: !2451, inlinedAt: !2868)
!2868 = distinct !DILocation(line: 682, column: 34, scope: !2443, inlinedAt: !2865)
!2869 = !DILocation(line: 450, column: 30, scope: !2451, inlinedAt: !2868)
!2870 = !DILocation(line: 0, scope: !2477, inlinedAt: !2871)
!2871 = distinct !DILocation(line: 450, column: 16, scope: !2451, inlinedAt: !2868)
!2872 = !DILocation(line: 49, column: 12, scope: !2491, inlinedAt: !2871)
!2873 = !DILocation(line: 49, column: 11, scope: !2477, inlinedAt: !2871)
!2874 = !DILocation(line: 50, column: 2, scope: !2491, inlinedAt: !2871)
!2875 = !DILocation(line: 0, scope: !2495, inlinedAt: !2876)
!2876 = distinct !DILocation(line: 450, column: 40, scope: !2451, inlinedAt: !2868)
!2877 = !DILocation(line: 874, column: 6, scope: !2506, inlinedAt: !2876)
!2878 = !DILocation(line: 874, column: 6, scope: !2495, inlinedAt: !2876)
!2879 = !DILocation(line: 875, column: 11, scope: !2506, inlinedAt: !2876)
!2880 = !DILocation(line: 875, column: 4, scope: !2506, inlinedAt: !2876)
!2881 = !DILocation(line: 876, column: 8, scope: !2495, inlinedAt: !2876)
!2882 = !DILocation(line: 877, column: 15, scope: !2495, inlinedAt: !2876)
!2883 = !DILocation(line: 877, column: 2, scope: !2495, inlinedAt: !2876)
!2884 = !DILocation(line: 682, column: 25, scope: !2443, inlinedAt: !2865)
!2885 = !DILocation(line: 0, scope: !2427, inlinedAt: !2886)
!2886 = distinct !DILocation(line: 682, column: 14, scope: !2443, inlinedAt: !2865)
!2887 = !DILocation(line: 704, column: 19, scope: !2427, inlinedAt: !2886)
!2888 = !DILocation(line: 122, column: 5, scope: !2855)
!2889 = !DILocation(line: 130, column: 35, scope: !2296)
!2890 = !DILocation(line: 130, column: 17, scope: !2296)
!2891 = !DILocation(line: 0, scope: !2324, inlinedAt: !2892)
!2892 = distinct !DILocation(line: 130, column: 3, scope: !2296)
!2893 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !2892)
!2894 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !2892)
!2895 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !2892)
!2896 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !2892)
!2897 = !DILocation(line: 0, scope: !2338, inlinedAt: !2898)
!2898 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !2892)
!2899 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2898)
!2900 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !2892)
!2901 = !DILocation(line: 0, scope: !2359, inlinedAt: !2902)
!2902 = distinct !DILocation(line: 134, column: 13, scope: !2296)
!2903 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2902)
!2904 = !DILocation(line: 134, column: 47, scope: !2296)
!2905 = !DILocation(line: 134, column: 46, scope: !2296)
!2906 = !DILocalVariable(name: "this", arg: 1, scope: !2907, type: !2353, flags: DIFlagArtificial | DIFlagObjectPointer)
!2907 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !2340, file: !2339, line: 170, type: !2908, scopeLine: 171, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2910, retainedNodes: !2911)
!2908 = !DISubroutineType(types: !2909)
!2909 = !{!2344, !2346, !829}
!2910 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !2340, file: !2339, line: 170, type: !2908, scopeLine: 170, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2911 = !{!2906, !2912}
!2912 = !DILocalVariable(name: "__n", arg: 2, scope: !2907, file: !2339, line: 170, type: !829)
!2913 = !DILocation(line: 0, scope: !2907, inlinedAt: !2914)
!2914 = distinct !DILocation(line: 134, column: 43, scope: !2296)
!2915 = !DILocation(line: 171, column: 16, scope: !2907, inlinedAt: !2914)
!2916 = !DILocation(line: 0, scope: !2359, inlinedAt: !2917)
!2917 = distinct !DILocation(line: 135, column: 13, scope: !2296)
!2918 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2917)
!2919 = !DILocation(line: 0, scope: !2318)
!2920 = !DILocation(line: 137, column: 3, scope: !2318)
!2921 = !DILocation(line: 0, scope: !2359, inlinedAt: !2922)
!2922 = distinct !DILocation(line: 143, column: 15, scope: !2923)
!2923 = distinct !DILexicalBlock(scope: !2296, file: !9, line: 142, column: 7)
!2924 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2922)
!2925 = !DILocation(line: 0, scope: !2637, inlinedAt: !2926)
!2926 = distinct !DILocation(line: 143, column: 27, scope: !2923)
!2927 = !DILocation(line: 180, column: 7, scope: !2637, inlinedAt: !2926)
!2928 = !DILocation(line: 0, scope: !2650, inlinedAt: !2929)
!2929 = distinct !DILocation(line: 180, column: 12, scope: !2637, inlinedAt: !2926)
!2930 = !DILocation(line: 0, scope: !2662, inlinedAt: !2931)
!2931 = distinct !DILocation(line: 392, column: 26, scope: !2650, inlinedAt: !2929)
!2932 = !DILocation(line: 372, column: 7, scope: !2670, inlinedAt: !2931)
!2933 = !DILocation(line: 372, column: 6, scope: !2662, inlinedAt: !2931)
!2934 = !DILocation(line: 0, scope: !2451, inlinedAt: !2935)
!2935 = distinct !DILocation(line: 374, column: 22, scope: !2676, inlinedAt: !2931)
!2936 = !DILocation(line: 450, column: 30, scope: !2451, inlinedAt: !2935)
!2937 = !DILocation(line: 0, scope: !2477, inlinedAt: !2938)
!2938 = distinct !DILocation(line: 450, column: 16, scope: !2451, inlinedAt: !2935)
!2939 = !DILocation(line: 49, column: 12, scope: !2491, inlinedAt: !2938)
!2940 = !DILocation(line: 49, column: 11, scope: !2477, inlinedAt: !2938)
!2941 = !DILocation(line: 50, column: 2, scope: !2491, inlinedAt: !2938)
!2942 = !DILocation(line: 0, scope: !2495, inlinedAt: !2943)
!2943 = distinct !DILocation(line: 450, column: 40, scope: !2451, inlinedAt: !2935)
!2944 = !DILocation(line: 874, column: 6, scope: !2506, inlinedAt: !2943)
!2945 = !DILocation(line: 874, column: 6, scope: !2495, inlinedAt: !2943)
!2946 = !DILocation(line: 876, column: 8, scope: !2495, inlinedAt: !2943)
!2947 = !DILocation(line: 877, column: 15, scope: !2495, inlinedAt: !2943)
!2948 = !DILocation(line: 240, column: 7, scope: !2690, inlinedAt: !2949)
!2949 = distinct !DILocation(line: 143, column: 48, scope: !2923)
!2950 = !DILocation(line: 877, column: 2, scope: !2495, inlinedAt: !2943)
!2951 = !DILocation(line: 375, column: 19, scope: !2676, inlinedAt: !2931)
!2952 = !DILocation(line: 376, column: 4, scope: !2676, inlinedAt: !2931)
!2953 = !DILocation(line: 393, column: 2, scope: !2650, inlinedAt: !2929)
!2954 = !DILocation(line: 393, column: 10, scope: !2650, inlinedAt: !2929)
!2955 = !DILocation(line: 0, scope: !2690, inlinedAt: !2949)
!2956 = !DILocation(line: 0, scope: !2708, inlinedAt: !2957)
!2957 = distinct !DILocation(line: 240, column: 12, scope: !2690, inlinedAt: !2949)
!2958 = !DILocation(line: 753, column: 26, scope: !2708, inlinedAt: !2957)
!2959 = !DILocation(line: 754, column: 16, scope: !2708, inlinedAt: !2957)
!2960 = !DILocation(line: 0, scope: !2359, inlinedAt: !2961)
!2961 = distinct !DILocation(line: 143, column: 64, scope: !2923)
!2962 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2961)
!2963 = !DILocation(line: 0, scope: !2359, inlinedAt: !2964)
!2964 = distinct !DILocation(line: 144, column: 13, scope: !2296)
!2965 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !2964)
!2966 = !DILocation(line: 0, scope: !2338, inlinedAt: !2967)
!2967 = distinct !DILocation(line: 144, column: 26, scope: !2296)
!2968 = !DILocation(line: 0, scope: !2443, inlinedAt: !2969)
!2969 = distinct !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !2967)
!2970 = !DILocation(line: 682, column: 29, scope: !2443, inlinedAt: !2969)
!2971 = !DILocation(line: 0, scope: !2451, inlinedAt: !2972)
!2972 = distinct !DILocation(line: 682, column: 34, scope: !2443, inlinedAt: !2969)
!2973 = !DILocation(line: 450, column: 30, scope: !2451, inlinedAt: !2972)
!2974 = !DILocation(line: 0, scope: !2477, inlinedAt: !2975)
!2975 = distinct !DILocation(line: 450, column: 16, scope: !2451, inlinedAt: !2972)
!2976 = !DILocation(line: 49, column: 12, scope: !2491, inlinedAt: !2975)
!2977 = !DILocation(line: 49, column: 11, scope: !2477, inlinedAt: !2975)
!2978 = !DILocation(line: 50, column: 2, scope: !2491, inlinedAt: !2975)
!2979 = !DILocation(line: 0, scope: !2495, inlinedAt: !2980)
!2980 = distinct !DILocation(line: 450, column: 40, scope: !2451, inlinedAt: !2972)
!2981 = !DILocation(line: 874, column: 6, scope: !2506, inlinedAt: !2980)
!2982 = !DILocation(line: 874, column: 6, scope: !2495, inlinedAt: !2980)
!2983 = !DILocation(line: 875, column: 11, scope: !2506, inlinedAt: !2980)
!2984 = !DILocation(line: 875, column: 4, scope: !2506, inlinedAt: !2980)
!2985 = !DILocation(line: 876, column: 8, scope: !2495, inlinedAt: !2980)
!2986 = !DILocation(line: 877, column: 15, scope: !2495, inlinedAt: !2980)
!2987 = !DILocation(line: 877, column: 2, scope: !2495, inlinedAt: !2980)
!2988 = !DILocation(line: 682, column: 25, scope: !2443, inlinedAt: !2969)
!2989 = !DILocation(line: 0, scope: !2427, inlinedAt: !2990)
!2990 = distinct !DILocation(line: 682, column: 14, scope: !2443, inlinedAt: !2969)
!2991 = !DILocation(line: 704, column: 19, scope: !2427, inlinedAt: !2990)
!2992 = !DILocation(line: 148, column: 25, scope: !2296)
!2993 = !DILocation(line: 148, column: 17, scope: !2296)
!2994 = !DILocation(line: 0, scope: !2324, inlinedAt: !2995)
!2995 = distinct !DILocation(line: 148, column: 3, scope: !2296)
!2996 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !2995)
!2997 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !2995)
!2998 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !2995)
!2999 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !2995)
!3000 = !DILocation(line: 0, scope: !2338, inlinedAt: !3001)
!3001 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !2995)
!3002 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !3001)
!3003 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !2995)
!3004 = !DILocation(line: 149, column: 25, scope: !2296)
!3005 = !DILocation(line: 149, column: 17, scope: !2296)
!3006 = !DILocation(line: 0, scope: !2324, inlinedAt: !3007)
!3007 = distinct !DILocation(line: 149, column: 3, scope: !2296)
!3008 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !3007)
!3009 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !3007)
!3010 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !3007)
!3011 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !3007)
!3012 = !DILocation(line: 0, scope: !2338, inlinedAt: !3013)
!3013 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !3007)
!3014 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !3013)
!3015 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !3007)
!3016 = !DILocation(line: 150, column: 25, scope: !2296)
!3017 = !DILocation(line: 150, column: 17, scope: !2296)
!3018 = !DILocation(line: 0, scope: !2324, inlinedAt: !3019)
!3019 = distinct !DILocation(line: 150, column: 3, scope: !2296)
!3020 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !3019)
!3021 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !3019)
!3022 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !3019)
!3023 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !3019)
!3024 = !DILocation(line: 0, scope: !2338, inlinedAt: !3025)
!3025 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !3019)
!3026 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !3025)
!3027 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !3019)
!3028 = !DILocation(line: 151, column: 3, scope: !2296)
!3029 = !DILocation(line: 151, column: 20, scope: !2296)
!3030 = !DILocation(line: 0, scope: !2359, inlinedAt: !3031)
!3031 = distinct !DILocation(line: 152, column: 13, scope: !2296)
!3032 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !3031)
!3033 = !DILocation(line: 0, scope: !2338, inlinedAt: !3034)
!3034 = distinct !DILocation(line: 152, column: 56, scope: !2296)
!3035 = !DILocation(line: 0, scope: !2427, inlinedAt: !3036)
!3036 = distinct !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !3034)
!3037 = !DILocation(line: 704, column: 19, scope: !2427, inlinedAt: !3036)
!3038 = !DILocation(line: 153, column: 1, scope: !2296)
!3039 = !DILocation(line: 138, column: 11, scope: !3040)
!3040 = distinct !DILexicalBlock(scope: !3041, file: !9, line: 138, column: 9)
!3041 = distinct !DILexicalBlock(scope: !3042, file: !9, line: 137, column: 42)
!3042 = distinct !DILexicalBlock(scope: !2318, file: !9, line: 137, column: 3)
!3043 = !DILocation(line: 138, column: 32, scope: !3040)
!3044 = !DILocation(line: 138, column: 9, scope: !3041)
!3045 = !DILocation(line: 0, scope: !2359, inlinedAt: !3046)
!3046 = distinct !DILocation(line: 139, column: 17, scope: !3040)
!3047 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !3046)
!3048 = !DILocation(line: 139, column: 7, scope: !3040)
!3049 = !DILocation(line: 0, scope: !2637, inlinedAt: !3050)
!3050 = distinct !DILocation(line: 140, column: 15, scope: !3041)
!3051 = !DILocation(line: 180, column: 7, scope: !2637, inlinedAt: !3050)
!3052 = !DILocation(line: 0, scope: !2650, inlinedAt: !3053)
!3053 = distinct !DILocation(line: 180, column: 12, scope: !2637, inlinedAt: !3050)
!3054 = !DILocation(line: 0, scope: !2662, inlinedAt: !3055)
!3055 = distinct !DILocation(line: 392, column: 26, scope: !2650, inlinedAt: !3053)
!3056 = !DILocation(line: 372, column: 7, scope: !2670, inlinedAt: !3055)
!3057 = !DILocation(line: 372, column: 6, scope: !2662, inlinedAt: !3055)
!3058 = !DILocation(line: 0, scope: !2451, inlinedAt: !3059)
!3059 = distinct !DILocation(line: 374, column: 22, scope: !2676, inlinedAt: !3055)
!3060 = !DILocation(line: 450, column: 30, scope: !2451, inlinedAt: !3059)
!3061 = !DILocation(line: 0, scope: !2477, inlinedAt: !3062)
!3062 = distinct !DILocation(line: 450, column: 16, scope: !2451, inlinedAt: !3059)
!3063 = !DILocation(line: 49, column: 12, scope: !2491, inlinedAt: !3062)
!3064 = !DILocation(line: 49, column: 11, scope: !2477, inlinedAt: !3062)
!3065 = !DILocation(line: 50, column: 2, scope: !2491, inlinedAt: !3062)
!3066 = !DILocation(line: 0, scope: !2495, inlinedAt: !3067)
!3067 = distinct !DILocation(line: 450, column: 40, scope: !2451, inlinedAt: !3059)
!3068 = !DILocation(line: 874, column: 6, scope: !2506, inlinedAt: !3067)
!3069 = !DILocation(line: 874, column: 6, scope: !2495, inlinedAt: !3067)
!3070 = !DILocation(line: 876, column: 8, scope: !2495, inlinedAt: !3067)
!3071 = !DILocation(line: 877, column: 15, scope: !2495, inlinedAt: !3067)
!3072 = !DILocation(line: 240, column: 7, scope: !2690, inlinedAt: !3073)
!3073 = distinct !DILocation(line: 140, column: 36, scope: !3041)
!3074 = !DILocation(line: 877, column: 2, scope: !2495, inlinedAt: !3067)
!3075 = !DILocation(line: 375, column: 19, scope: !2676, inlinedAt: !3055)
!3076 = !DILocation(line: 376, column: 4, scope: !2676, inlinedAt: !3055)
!3077 = !DILocation(line: 393, column: 2, scope: !2650, inlinedAt: !3053)
!3078 = !DILocation(line: 393, column: 10, scope: !2650, inlinedAt: !3053)
!3079 = !DILocation(line: 0, scope: !2690, inlinedAt: !3073)
!3080 = !DILocation(line: 0, scope: !2708, inlinedAt: !3081)
!3081 = distinct !DILocation(line: 240, column: 12, scope: !2690, inlinedAt: !3073)
!3082 = !DILocation(line: 753, column: 26, scope: !2708, inlinedAt: !3081)
!3083 = !DILocation(line: 754, column: 16, scope: !2708, inlinedAt: !3081)
!3084 = !DILocation(line: 140, column: 55, scope: !3041)
!3085 = !DILocation(line: 0, scope: !2907, inlinedAt: !3086)
!3086 = distinct !DILocation(line: 140, column: 52, scope: !3041)
!3087 = !DILocation(line: 171, column: 16, scope: !2907, inlinedAt: !3086)
!3088 = !DILocation(line: 0, scope: !2359, inlinedAt: !3089)
!3089 = distinct !DILocation(line: 140, column: 65, scope: !3041)
!3090 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !3089)
!3091 = !DILocation(line: 137, column: 37, scope: !3042)
!3092 = !DILocation(line: 137, column: 21, scope: !3042)
!3093 = distinct !{!3093, !2920, !3094, !2799}
!3094 = !DILocation(line: 141, column: 3, scope: !2318)
!3095 = !DILocation(line: 0, scope: !2324)
!3096 = !DILocation(line: 181, column: 15, scope: !2332)
!3097 = !DILocation(line: 181, column: 7, scope: !2324)
!3098 = !DILocation(line: 182, column: 15, scope: !2335)
!3099 = !DILocation(line: 182, column: 34, scope: !2335)
!3100 = !DILocation(line: 0, scope: !2338, inlinedAt: !3101)
!3101 = distinct !DILocation(line: 182, column: 45, scope: !2335)
!3102 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !3101)
!3103 = !DILocation(line: 183, column: 5, scope: !2335)
!3104 = !DILocation(line: 185, column: 1, scope: !2324)
!3105 = !DISubprogram(name: "hipGetDevice", scope: !90, file: !90, line: 1686, type: !3106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3106 = !DISubroutineType(types: !3107)
!3107 = !{!2327, !502}
!3108 = !DISubprogram(name: "hipMemcpy", scope: !90, file: !90, line: 3762, type: !3109, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3109 = !DISubroutineType(types: !3110)
!3110 = !{!2327, !278, !853, !827, !3111}
!3111 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipMemcpyKind", file: !171, line: 340, baseType: !170)
!3112 = !DISubprogram(name: "__hipPushCallConfiguration", scope: !90, file: !90, line: 5469, type: !3113, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3113 = !DISubroutineType(types: !3114)
!3114 = !{!2327, !189, !189, !827, !3115}
!3115 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipStream_t", file: !90, line: 597, baseType: !3116)
!3116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3117, size: 64)
!3117 = !DICompositeType(tag: DW_TAG_structure_type, name: "ihipStream_t", file: !90, line: 597, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS12ihipStream_t")
!3118 = !DISubprogram(name: "hipFree", scope: !90, file: !90, line: 3706, type: !3119, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3119 = !DISubroutineType(types: !3120)
!3120 = !{!2327, !278}
!3121 = !DILocation(line: 0, scope: !2124)
!3122 = !DILocation(line: 168, column: 3, scope: !2124)
!3123 = !DILocation(line: 168, column: 19, scope: !2124)
!3124 = !DILocation(line: 169, column: 17, scope: !2124)
!3125 = !DILocation(line: 0, scope: !2324, inlinedAt: !3126)
!3126 = distinct !DILocation(line: 169, column: 3, scope: !2124)
!3127 = !DILocation(line: 181, column: 15, scope: !2332, inlinedAt: !3126)
!3128 = !DILocation(line: 181, column: 7, scope: !2324, inlinedAt: !3126)
!3129 = !DILocation(line: 182, column: 15, scope: !2335, inlinedAt: !3126)
!3130 = !DILocation(line: 182, column: 34, scope: !2335, inlinedAt: !3126)
!3131 = !DILocation(line: 0, scope: !2338, inlinedAt: !3132)
!3132 = distinct !DILocation(line: 182, column: 45, scope: !2335, inlinedAt: !3126)
!3133 = !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !3132)
!3134 = !DILocation(line: 183, column: 5, scope: !2335, inlinedAt: !3126)
!3135 = !DILocation(line: 0, scope: !2359, inlinedAt: !3136)
!3136 = distinct !DILocation(line: 170, column: 8, scope: !2124)
!3137 = !DILocalVariable(name: "__s", arg: 1, scope: !3138, file: !2368, line: 365, type: !2384)
!3138 = distinct !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !2367, file: !2368, line: 365, type: !2387, scopeLine: 366, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2386, retainedNodes: !3139)
!3139 = !{!3137}
!3140 = !DILocation(line: 0, scope: !3138, inlinedAt: !3141)
!3141 = distinct !DILocation(line: 612, column: 29, scope: !2423, inlinedAt: !3136)
!3142 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !3136)
!3143 = !DILocation(line: 170, column: 39, scope: !2124)
!3144 = !{!3145, !2295, i64 364}
!3145 = !{!"_ZTS20hipDeviceProp_tR0600", !2292, i64 0, !3146, i64 256, !2292, i64 272, !2295, i64 280, !2470, i64 288, !2470, i64 296, !2295, i64 304, !2295, i64 308, !2470, i64 312, !2295, i64 320, !2292, i64 324, !2292, i64 336, !2295, i64 348, !2470, i64 352, !2295, i64 360, !2295, i64 364, !2470, i64 368, !2470, i64 376, !2295, i64 384, !2295, i64 388, !2295, i64 392, !2295, i64 396, !2295, i64 400, !2295, i64 404, !2295, i64 408, !2295, i64 412, !2295, i64 416, !2292, i64 420, !2292, i64 428, !2292, i64 436, !2292, i64 448, !2292, i64 456, !2292, i64 468, !2295, i64 480, !2292, i64 484, !2292, i64 492, !2292, i64 504, !2295, i64 512, !2292, i64 516, !2292, i64 524, !2292, i64 536, !2292, i64 544, !2295, i64 556, !2292, i64 560, !2470, i64 568, !2295, i64 576, !2295, i64 580, !2295, i64 584, !2295, i64 588, !2295, i64 592, !2295, i64 596, !2295, i64 600, !2295, i64 604, !2295, i64 608, !2295, i64 612, !2295, i64 616, !2295, i64 620, !2295, i64 624, !2295, i64 628, !2295, i64 632, !2295, i64 636, !2470, i64 640, !2295, i64 648, !2295, i64 652, !2295, i64 656, !2295, i64 660, !2295, i64 664, !2295, i64 668, !2295, i64 672, !2295, i64 676, !2295, i64 680, !2295, i64 684, !2295, i64 688, !2295, i64 692, !2470, i64 696, !2295, i64 704, !2295, i64 708, !2295, i64 712, !2295, i64 716, !2470, i64 720, !2295, i64 728, !2295, i64 732, !2295, i64 736, !2295, i64 740, !2295, i64 744, !2295, i64 748, !2295, i64 752, !2295, i64 756, !2295, i64 760, !2295, i64 764, !2295, i64 768, !2295, i64 772, !2295, i64 776, !2292, i64 780, !2292, i64 1032, !2292, i64 1160, !2470, i64 1416, !2295, i64 1424, !3147, i64 1428, !2291, i64 1432, !2291, i64 1440, !2295, i64 1448, !2295, i64 1452, !2295, i64 1456, !2295, i64 1460, !2295, i64 1464, !2295, i64 1468}
!3146 = !{!"_ZTS9hipUUID_t", !2292, i64 0}
!3147 = !{!"_ZTS15hipDeviceArch_t", !2295, i64 0, !2295, i64 0, !2295, i64 0, !2295, i64 0, !2295, i64 0, !2295, i64 0, !2295, i64 0, !2295, i64 0, !2295, i64 1, !2295, i64 1, !2295, i64 1, !2295, i64 1, !2295, i64 1, !2295, i64 1, !2295, i64 1, !2295, i64 1, !2295, i64 2}
!3148 = !DILocation(line: 170, column: 28, scope: !2124)
!3149 = !DILocation(line: 0, scope: !2338, inlinedAt: !3150)
!3150 = distinct !DILocation(line: 170, column: 45, scope: !2124)
!3151 = !DILocation(line: 0, scope: !2443, inlinedAt: !3152)
!3152 = distinct !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !3150)
!3153 = !DILocation(line: 682, column: 29, scope: !2443, inlinedAt: !3152)
!3154 = !DILocation(line: 0, scope: !2451, inlinedAt: !3155)
!3155 = distinct !DILocation(line: 682, column: 34, scope: !2443, inlinedAt: !3152)
!3156 = !DILocation(line: 450, column: 30, scope: !2451, inlinedAt: !3155)
!3157 = !DILocation(line: 0, scope: !2477, inlinedAt: !3158)
!3158 = distinct !DILocation(line: 450, column: 16, scope: !2451, inlinedAt: !3155)
!3159 = !DILocation(line: 49, column: 12, scope: !2491, inlinedAt: !3158)
!3160 = !DILocation(line: 49, column: 11, scope: !2477, inlinedAt: !3158)
!3161 = !DILocation(line: 50, column: 2, scope: !2491, inlinedAt: !3158)
!3162 = !DILocation(line: 0, scope: !2495, inlinedAt: !3163)
!3163 = distinct !DILocation(line: 450, column: 40, scope: !2451, inlinedAt: !3155)
!3164 = !DILocation(line: 874, column: 6, scope: !2506, inlinedAt: !3163)
!3165 = !DILocation(line: 874, column: 6, scope: !2495, inlinedAt: !3163)
!3166 = !DILocation(line: 875, column: 11, scope: !2506, inlinedAt: !3163)
!3167 = !DILocation(line: 875, column: 4, scope: !2506, inlinedAt: !3163)
!3168 = !DILocation(line: 876, column: 8, scope: !2495, inlinedAt: !3163)
!3169 = !DILocation(line: 877, column: 15, scope: !2495, inlinedAt: !3163)
!3170 = !DILocation(line: 877, column: 2, scope: !2495, inlinedAt: !3163)
!3171 = !DILocation(line: 682, column: 25, scope: !2443, inlinedAt: !3152)
!3172 = !DILocation(line: 0, scope: !2427, inlinedAt: !3173)
!3173 = distinct !DILocation(line: 682, column: 14, scope: !2443, inlinedAt: !3152)
!3174 = !DILocation(line: 704, column: 19, scope: !2427, inlinedAt: !3173)
!3175 = !DILocation(line: 0, scope: !2359, inlinedAt: !3176)
!3176 = distinct !DILocation(line: 171, column: 8, scope: !2124)
!3177 = !DILocation(line: 0, scope: !3138, inlinedAt: !3178)
!3178 = distinct !DILocation(line: 612, column: 29, scope: !2423, inlinedAt: !3176)
!3179 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !3176)
!3180 = !DILocation(line: 171, column: 39, scope: !2124)
!3181 = !{!3145, !2295, i64 360}
!3182 = !DILocation(line: 171, column: 28, scope: !2124)
!3183 = !DILocation(line: 0, scope: !2338, inlinedAt: !3184)
!3184 = distinct !DILocation(line: 171, column: 45, scope: !2124)
!3185 = !DILocation(line: 0, scope: !2443, inlinedAt: !3186)
!3186 = distinct !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !3184)
!3187 = !DILocation(line: 682, column: 29, scope: !2443, inlinedAt: !3186)
!3188 = !DILocation(line: 0, scope: !2451, inlinedAt: !3189)
!3189 = distinct !DILocation(line: 682, column: 34, scope: !2443, inlinedAt: !3186)
!3190 = !DILocation(line: 450, column: 30, scope: !2451, inlinedAt: !3189)
!3191 = !DILocation(line: 0, scope: !2477, inlinedAt: !3192)
!3192 = distinct !DILocation(line: 450, column: 16, scope: !2451, inlinedAt: !3189)
!3193 = !DILocation(line: 49, column: 12, scope: !2491, inlinedAt: !3192)
!3194 = !DILocation(line: 49, column: 11, scope: !2477, inlinedAt: !3192)
!3195 = !DILocation(line: 50, column: 2, scope: !2491, inlinedAt: !3192)
!3196 = !DILocation(line: 0, scope: !2495, inlinedAt: !3197)
!3197 = distinct !DILocation(line: 450, column: 40, scope: !2451, inlinedAt: !3189)
!3198 = !DILocation(line: 874, column: 6, scope: !2506, inlinedAt: !3197)
!3199 = !DILocation(line: 874, column: 6, scope: !2495, inlinedAt: !3197)
!3200 = !DILocation(line: 875, column: 11, scope: !2506, inlinedAt: !3197)
!3201 = !DILocation(line: 875, column: 4, scope: !2506, inlinedAt: !3197)
!3202 = !DILocation(line: 876, column: 8, scope: !2495, inlinedAt: !3197)
!3203 = !DILocation(line: 877, column: 15, scope: !2495, inlinedAt: !3197)
!3204 = !DILocation(line: 877, column: 2, scope: !2495, inlinedAt: !3197)
!3205 = !DILocation(line: 682, column: 25, scope: !2443, inlinedAt: !3186)
!3206 = !DILocation(line: 0, scope: !2427, inlinedAt: !3207)
!3207 = distinct !DILocation(line: 682, column: 14, scope: !2443, inlinedAt: !3186)
!3208 = !DILocation(line: 704, column: 19, scope: !2427, inlinedAt: !3207)
!3209 = !DILocation(line: 0, scope: !2359, inlinedAt: !3210)
!3210 = distinct !DILocation(line: 172, column: 8, scope: !2124)
!3211 = !DILocation(line: 0, scope: !3138, inlinedAt: !3212)
!3212 = distinct !DILocation(line: 612, column: 29, scope: !2423, inlinedAt: !3210)
!3213 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !3210)
!3214 = !DILocation(line: 0, scope: !2359, inlinedAt: !3215)
!3215 = distinct !DILocation(line: 172, column: 31, scope: !2124)
!3216 = !DILocation(line: 0, scope: !3138, inlinedAt: !3217)
!3217 = distinct !DILocation(line: 612, column: 29, scope: !2423, inlinedAt: !3215)
!3218 = !DILocation(line: 371, column: 9, scope: !3138, inlinedAt: !3217)
!3219 = !DILocation(line: 611, column: 2, scope: !2423, inlinedAt: !3215)
!3220 = !DILocation(line: 0, scope: !2338, inlinedAt: !3221)
!3221 = distinct !DILocation(line: 172, column: 47, scope: !2124)
!3222 = !DILocation(line: 0, scope: !2443, inlinedAt: !3223)
!3223 = distinct !DILocation(line: 113, column: 9, scope: !2338, inlinedAt: !3221)
!3224 = !DILocation(line: 682, column: 29, scope: !2443, inlinedAt: !3223)
!3225 = !DILocation(line: 0, scope: !2451, inlinedAt: !3226)
!3226 = distinct !DILocation(line: 682, column: 34, scope: !2443, inlinedAt: !3223)
!3227 = !DILocation(line: 450, column: 30, scope: !2451, inlinedAt: !3226)
!3228 = !DILocation(line: 0, scope: !2477, inlinedAt: !3229)
!3229 = distinct !DILocation(line: 450, column: 16, scope: !2451, inlinedAt: !3226)
!3230 = !DILocation(line: 49, column: 12, scope: !2491, inlinedAt: !3229)
!3231 = !DILocation(line: 49, column: 11, scope: !2477, inlinedAt: !3229)
!3232 = !DILocation(line: 50, column: 2, scope: !2491, inlinedAt: !3229)
!3233 = !DILocation(line: 0, scope: !2495, inlinedAt: !3234)
!3234 = distinct !DILocation(line: 450, column: 40, scope: !2451, inlinedAt: !3226)
!3235 = !DILocation(line: 874, column: 6, scope: !2506, inlinedAt: !3234)
!3236 = !DILocation(line: 874, column: 6, scope: !2495, inlinedAt: !3234)
!3237 = !DILocation(line: 875, column: 11, scope: !2506, inlinedAt: !3234)
!3238 = !DILocation(line: 875, column: 4, scope: !2506, inlinedAt: !3234)
!3239 = !DILocation(line: 876, column: 8, scope: !2495, inlinedAt: !3234)
!3240 = !DILocation(line: 877, column: 15, scope: !2495, inlinedAt: !3234)
!3241 = !DILocation(line: 877, column: 2, scope: !2495, inlinedAt: !3234)
!3242 = !DILocation(line: 682, column: 25, scope: !2443, inlinedAt: !3223)
!3243 = !DILocation(line: 0, scope: !2427, inlinedAt: !3244)
!3244 = distinct !DILocation(line: 682, column: 14, scope: !2443, inlinedAt: !3223)
!3245 = !DILocation(line: 704, column: 19, scope: !2427, inlinedAt: !3244)
!3246 = !DILocation(line: 174, column: 3, scope: !2124)
!3247 = !DILocation(line: 175, column: 15, scope: !2124)
!3248 = !DILocation(line: 175, column: 3, scope: !2124)
!3249 = !DILocation(line: 177, column: 1, scope: !2124)
!3250 = !DILocation(line: 176, column: 3, scope: !2124)
!3251 = !DISubprogram(name: "hipGetDevicePropertiesR0600", scope: !90, file: !90, line: 1780, type: !3252, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3252 = !DISubroutineType(types: !3253)
!3253 = !{!2327, !3254, !179}
!3254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2131, size: 64)
!3255 = !DISubprogram(name: "exit", scope: !465, file: !465, line: 614, type: !867, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3256 = !DISubprogram(name: "__ostream_insert<char, std::char_traits<char> >", linkageName: "_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l", scope: !2, file: !3257, line: 76, type: !3258, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2431, retainedNodes: !297)
!3257 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/ostream_insert.h", directory: "")
!3258 = !DISubroutineType(types: !3259)
!3259 = !{!2362, !2362, !710, !272}
!3260 = !DISubprogram(name: "__builtin_strlen", scope: !3261, file: !3261, line: 146, type: !3262, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3261 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/typeinfo", directory: "")
!3262 = !DISubroutineType(types: !3263)
!3263 = !{!829, !710}
!3264 = !DISubprogram(name: "__throw_bad_cast", linkageName: "_ZSt16__throw_bad_castv", scope: !2, file: !3265, line: 56, type: !821, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3265 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/functexcept.h", directory: "", checksumkind: CSK_MD5, checksum: "9769ec5cf1d70f5d388572a69a3a88d5")
!3266 = !DISubprogram(name: "hipMallocManaged", scope: !90, file: !90, line: 3036, type: !3267, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3267 = !DISubroutineType(types: !3268)
!3268 = !{!2327, !277, !827, !84}
!3269 = !DISubprogram(name: "hipMalloc", scope: !90, file: !90, line: 2923, type: !3270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3270 = !DISubroutineType(types: !3271)
!3271 = !{!2327, !277, !827}
!3272 = !DISubprogram(name: "nanosleep", scope: !1988, file: !1988, line: 211, type: !3273, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3273 = !DISubroutineType(types: !3274)
!3274 = !{!179, !3275, !2036}
!3275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3276, size: 64)
!3276 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2026)
!3277 = !DISubprogram(name: "__errno_location", scope: !3278, file: !3278, line: 37, type: !3279, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !297)
!3278 = !DIFile(filename: "/usr/include/errno.h", directory: "", checksumkind: CSK_MD5, checksum: "9b8a133827bb73107ff5520cd7a28f22")
!3279 = !DISubroutineType(types: !3280)
!3280 = !{!502}
!3281 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_managed_clock_test.cpp", scope: !1466, file: !1466, type: !3282, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !297)
!3282 = !DISubroutineType(types: !297)
!3283 = !DILocation(line: 74, column: 25, scope: !3284, inlinedAt: !3286)
!3284 = !DILexicalBlockFile(scope: !3285, file: !3, discriminator: 0)
!3285 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1466, file: !1466, type: !821, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !297)
!3286 = distinct !DILocation(line: 0, scope: !3281)
!3287 = !DILocation(line: 0, scope: !3285, inlinedAt: !3286)

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu-
