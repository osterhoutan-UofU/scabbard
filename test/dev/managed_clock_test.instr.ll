
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx1030
; ModuleID = 'test/managed_clock_test.cpp'
source_filename = "test/managed_clock_test.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%"struct.scabbard::trace::device::DeviceTracker" = type { %"struct.scabbard::jobId_t", i64, i64, i64, i8, [128 x %"struct.scabbard::TraceData"] }
%"struct.scabbard::jobId_t" = type { i16, i16 }
%"struct.scabbard::TraceData" = type { i64, i16, %"union.scabbard::ThreadId", ptr, %"struct.scabbard::LocationMetadata", i64 }
%"union.scabbard::ThreadId" = type { %"class.std::thread::id", [16 x i8] }
%"class.std::thread::id" = type { i64 }
%"struct.scabbard::LocationMetadata" = type { i64, i32, i32 }
%struct.__HIP_Coordinates = type { i8 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }

$scabbard.trace.device.dummyFunc = comdat any

@_ZN8scabbard5trace12_GLOBAL__N_114src_id_reg_tmpE = internal addrspace(1) global i64 84, align 8
@_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp2E = internal addrspace(1) global i64 84, align 8
@_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp3E = internal addrspace(1) global i64 84, align 8
@"scabbard.metadata.device.srcId$0x0000" = private addrspace(1) global i64 0

; Function Attrs: convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none)
define amdgpu_kernel void @scabbard.trace.device.dummyFunc(ptr addrspace(1) nocapture %0, i32 %1, float %2, i16 %3, ptr addrspace(1) %4, ptr addrspace(1) nocapture readnone %5, ptr addrspace(1) nocapture readonly %6) local_unnamed_addr #2 comdat {
  %8 = addrspacecast ptr addrspace(1) %0 to ptr
  %9 = addrspacecast ptr addrspace(1) %4 to ptr
  %10 = addrspacecast ptr addrspace(1) %6 to ptr
  %11 = sitofp i32 %1 to float
  %12 = fmul contract float %11, %2
  store float %12, ptr addrspace(1) %0, align 4, !tbaa !1738
  tail call fastcc void @"scabbard.trace.device.trace_append$mem"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr addrspacecast (ptr addrspace(1) @_ZN8scabbard5trace12_GLOBAL__N_114src_id_reg_tmpE to ptr), i32 19, i32 9) #10
  tail call fastcc void @"scabbard.trace.device.trace_append$mem"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr addrspacecast (ptr addrspace(1) @_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp2E to ptr), i32 1024, i32 4) #10
  tail call fastcc void @"scabbard.trace.device.trace_append$mem"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr %10, i32 10240, i32 40) #10
  tail call fastcc void @"scabbard.trace.device.trace_append$alloc"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr addrspacecast (ptr addrspace(1) @_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp2E to ptr), i32 88, i32 256, i64 7) #10
  tail call fastcc void @"scabbard.trace.device.trace_append$alloc"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr addrspacecast (ptr addrspace(1) @_ZN8scabbard5trace12_GLOBAL__N_115src_id_reg_tmp3E to ptr), i32 98, i32 6, i64 23) #10
  tail call fastcc void @"scabbard.trace.device.trace_append$alloc"(ptr nonnull %8, i16 zeroext %3, ptr %9, ptr %10, i32 980, i32 60, i64 230) #10
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nounwind willreturn memory(argmem: readwrite)
define internal fastcc void @"scabbard.trace.device.trace_append$mem"(ptr nocapture %0, i16 zeroext %1, ptr %2, ptr nocapture readonly %3, i32 %4, i32 %5) unnamed_addr #3 {
  %7 = alloca [6 x i8], align 2, addrspace(5)
  %8 = alloca [7 x i8], align 1, addrspace(5)
  call void @llvm.lifetime.start.p5(i64 6, ptr addrspace(5) %7)
  call void @llvm.lifetime.start.p5(i64 7, ptr addrspace(5) %8)
  %9 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 1
  %10 = atomicrmw add ptr %9, i64 1 seq_cst, align 8
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !1742, !noundef !1743
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !1742, !noundef !1743
  %16 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !1742, !noundef !1743
  %17 = load i64, ptr %3, align 8, !tbaa !1744
  %18 = load i32, ptr %0, align 1
  %19 = trunc i32 %16 to i8
  %20 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 2
  %21 = atomicrmw add ptr %20, i64 1 seq_cst, align 8
  %22 = and i64 %21, 127
  %23 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 5, i64 %22
  store i64 %10, ptr %23, align 8, !tbaa.struct !1746
  %24 = getelementptr inbounds i8, ptr %23, i64 8
  store i16 %1, ptr %24, align 8, !tbaa.struct !1756
  %25 = getelementptr inbounds i8, ptr %23, i64 10
  call void @llvm.memcpy.p0.p5.i64(ptr noundef nonnull align 2 dereferenceable(6) %25, ptr addrspace(5) noundef align 2 dereferenceable(6) %7, i64 6, i1 false), !tbaa.struct !1757
  %26 = getelementptr inbounds i8, ptr %23, i64 16
  store i32 %18, ptr %26, align 8, !tbaa.struct !1758
  %27 = getelementptr inbounds i8, ptr %23, i64 20
  store i32 %11, ptr %27, align 4, !tbaa.struct !1759
  %28 = getelementptr inbounds i8, ptr %23, i64 24
  %29 = insertelement <2 x i32> poison, i32 %12, i64 0
  %30 = insertelement <2 x i32> %29, i32 %13, i64 1
  %31 = trunc <2 x i32> %30 to <2 x i16>
  store <2 x i16> %31, ptr %28, align 8
  %32 = getelementptr inbounds i8, ptr %23, i64 28
  %33 = insertelement <2 x i32> poison, i32 %14, i64 0
  %34 = insertelement <2 x i32> %33, i32 %15, i64 1
  %35 = trunc <2 x i32> %34 to <2 x i16>
  store <2 x i16> %35, ptr %32, align 4
  %36 = getelementptr inbounds i8, ptr %23, i64 32
  store i8 %19, ptr %36, align 8, !tbaa.struct !1760
  %37 = getelementptr inbounds i8, ptr %23, i64 33
  call void @llvm.memcpy.p0.p5.i64(ptr noundef nonnull align 1 dereferenceable(7) %37, ptr addrspace(5) noundef align 1 dereferenceable(7) %8, i64 7, i1 false), !tbaa.struct !1761
  %38 = getelementptr inbounds i8, ptr %23, i64 40
  store ptr %2, ptr %38, align 8, !tbaa.struct !1762
  %39 = getelementptr inbounds i8, ptr %23, i64 48
  store i64 %17, ptr %39, align 8, !tbaa.struct !1763
  %40 = getelementptr inbounds i8, ptr %23, i64 56
  store i32 %4, ptr %40, align 8, !tbaa.struct !1764
  %41 = getelementptr inbounds i8, ptr %23, i64 60
  store i32 %5, ptr %41, align 4, !tbaa.struct !1765
  %42 = getelementptr inbounds i8, ptr %23, i64 64
  store i64 0, ptr %42, align 8, !tbaa.struct !1766
  call void @llvm.lifetime.end.p5(i64 6, ptr addrspace(5) %7)
  call void @llvm.lifetime.end.p5(i64 7, ptr addrspace(5) %8)
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nounwind willreturn memory(argmem: readwrite)
define internal fastcc void @"scabbard.trace.device.trace_append$alloc"(ptr nocapture %0, i16 zeroext %1, ptr %2, ptr nocapture readonly %3, i32 %4, i32 %5, i64 %6) unnamed_addr #3 {
  %8 = alloca [6 x i8], align 2, addrspace(5)
  %9 = alloca [7 x i8], align 1, addrspace(5)
  call void @llvm.lifetime.start.p5(i64 6, ptr addrspace(5) %8)
  call void @llvm.lifetime.start.p5(i64 7, ptr addrspace(5) %9)
  %10 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 1
  %11 = atomicrmw add ptr %10, i64 1 seq_cst, align 8
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !1742, !noundef !1743
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !1742, !noundef !1743
  %17 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !1742, !noundef !1743
  %18 = load i64, ptr %3, align 8, !tbaa !1744
  %19 = load i32, ptr %0, align 1
  %20 = trunc i32 %17 to i8
  %21 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 2
  %22 = atomicrmw add ptr %21, i64 1 seq_cst, align 8
  %23 = and i64 %22, 127
  %24 = getelementptr inbounds %"struct.scabbard::trace::device::DeviceTracker", ptr %0, i64 0, i32 5, i64 %23
  store i64 %11, ptr %24, align 8, !tbaa.struct !1746
  %25 = getelementptr inbounds i8, ptr %24, i64 8
  store i16 %1, ptr %25, align 8, !tbaa.struct !1756
  %26 = getelementptr inbounds i8, ptr %24, i64 10
  call void @llvm.memcpy.p0.p5.i64(ptr noundef nonnull align 2 dereferenceable(6) %26, ptr addrspace(5) noundef align 2 dereferenceable(6) %8, i64 6, i1 false), !tbaa.struct !1757
  %27 = getelementptr inbounds i8, ptr %24, i64 16
  store i32 %19, ptr %27, align 8, !tbaa.struct !1758
  %28 = getelementptr inbounds i8, ptr %24, i64 20
  store i32 %12, ptr %28, align 4, !tbaa.struct !1759
  %29 = getelementptr inbounds i8, ptr %24, i64 24
  %30 = insertelement <2 x i32> poison, i32 %13, i64 0
  %31 = insertelement <2 x i32> %30, i32 %14, i64 1
  %32 = trunc <2 x i32> %31 to <2 x i16>
  store <2 x i16> %32, ptr %29, align 8
  %33 = getelementptr inbounds i8, ptr %24, i64 28
  %34 = insertelement <2 x i32> poison, i32 %15, i64 0
  %35 = insertelement <2 x i32> %34, i32 %16, i64 1
  %36 = trunc <2 x i32> %35 to <2 x i16>
  store <2 x i16> %36, ptr %33, align 4
  %37 = getelementptr inbounds i8, ptr %24, i64 32
  store i8 %20, ptr %37, align 8, !tbaa.struct !1760
  %38 = getelementptr inbounds i8, ptr %24, i64 33
  call void @llvm.memcpy.p0.p5.i64(ptr noundef nonnull align 1 dereferenceable(7) %38, ptr addrspace(5) noundef align 1 dereferenceable(7) %9, i64 7, i1 false), !tbaa.struct !1761
  %39 = getelementptr inbounds i8, ptr %24, i64 40
  store ptr %2, ptr %39, align 8, !tbaa.struct !1762
  %40 = getelementptr inbounds i8, ptr %24, i64 48
  store i64 %18, ptr %40, align 8, !tbaa.struct !1763
  %41 = getelementptr inbounds i8, ptr %24, i64 56
  store i32 %4, ptr %41, align 8, !tbaa.struct !1764
  %42 = getelementptr inbounds i8, ptr %24, i64 60
  store i32 %5, ptr %42, align 4, !tbaa.struct !1765
  %43 = getelementptr inbounds i8, ptr %24, i64 64
  store i64 %6, ptr %43, align 8, !tbaa.struct !1766
  call void @llvm.lifetime.end.p5(i64 6, ptr addrspace(5) %8)
  call void @llvm.lifetime.end.p5(i64 7, ptr addrspace(5) %9)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workgroup.id.y() #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workgroup.id.z() #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workitem.id.y() #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.amdgcn.workitem.id.z() #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p5.i64(ptr noalias nocapture writeonly, ptr addrspace(5) noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p5(i64 immarg, ptr addrspace(5) nocapture) #4

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15tick_all_kernelPU7_AtomicmPmPli(ptr addrspace(1) nocapture %0, ptr addrspace(1) nocapture writeonly %1, ptr addrspace(1) nocapture %2, i32 %3, ptr %4) local_unnamed_addr #7 !dbg !1767 {
  %6 = addrspacecast ptr addrspace(1) %2 to ptr
  tail call fastcc void @_Z10dummy_workPl(ptr %6, ptr %4), !dbg !1779
  %7 = atomicrmw add ptr addrspace(1) %0, i64 1 seq_cst, align 8, !dbg !1780
  call void @"scabbard.trace.device.trace_append$mem"(ptr %4, i16 676, ptr addrspace(1) %0, ptr addrspace(1) @"scabbard.metadata.device.srcId$0x0000", i32 60, i32 34)
  %8 = add i64 %7, 1, !dbg !1780
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !dbg !1781, !range !1742, !noundef !1743
  %10 = add i32 %9, %3, !dbg !1793
  %11 = zext i32 %10 to i64, !dbg !1794
  %12 = getelementptr inbounds i64, ptr addrspace(1) %1, i64 %11, !dbg !1794
  store i64 %8, ptr addrspace(1) %12, align 8, !dbg !1795, !tbaa !1744
  call void @"scabbard.trace.device.trace_append$mem"(ptr %4, i16 8324, ptr addrspace(1) %12, ptr addrspace(1) @"scabbard.metadata.device.srcId$0x0000", i32 60, i32 26)
  fence syncscope("workgroup") release, !dbg !1796
  tail call void @llvm.amdgcn.s.barrier(), !dbg !1811
  fence syncscope("workgroup") acquire, !dbg !1812
  tail call fastcc void @_Z10dummy_workPl(ptr %6, ptr %4), !dbg !1813
  ret void, !dbg !1814
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local fastcc void @_Z10dummy_workPl(ptr nocapture %0, ptr %1) unnamed_addr #8 !dbg !1815 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !dbg !1821, !range !1742, !noundef !1743
  %4 = zext i32 %3 to i64, !dbg !1821
  %5 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr(), !dbg !1822
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x(), !dbg !1822
  %7 = load i32, ptr addrspace(4) %5, align 4, !dbg !1822, !tbaa !1823
  %8 = icmp ult i32 %6, %7, !dbg !1822
  %9 = select i1 %8, i64 6, i64 9, !dbg !1822
  %10 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 %9, !dbg !1822
  %11 = load i16, ptr addrspace(4) %10, align 2, !dbg !1822, !tbaa !1827
  %12 = zext i16 %11 to i64, !dbg !1822
  %13 = zext i32 %6 to i64, !dbg !1829
  %14 = mul nuw nsw i64 %12, %13, !dbg !1830
  %15 = add nuw nsw i64 %14, %4, !dbg !1831
  %16 = shl i64 %15, 32, !dbg !1832
  %17 = ashr exact i64 %16, 32, !dbg !1832
  %18 = getelementptr inbounds i64, ptr %0, i64 %17, !dbg !1833
  %19 = load i64, ptr %18, align 8, !dbg !1834, !tbaa !1744
  %20 = add nsw i64 %17, %19, !dbg !1834
  store i64 %20, ptr %18, align 8, !dbg !1834, !tbaa !1744
  call void @"scabbard.trace.device.trace_append$mem"(ptr %1, i16 8324, ptr %18, ptr addrspace(1) @"scabbard.metadata.device.srcId$0x0000", i32 198, i32 17)
  ret void, !dbg !1835
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z12dummy_kernelv(ptr %0) local_unnamed_addr #7 !dbg !1836 {
  fence syncscope("workgroup") release, !dbg !1837
  tail call void @llvm.amdgcn.s.barrier(), !dbg !1841
  fence syncscope("workgroup") acquire, !dbg !1842
  ret void, !dbg !1843
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define protected amdgpu_kernel void @_Z10dummy_initPl(ptr addrspace(1) nocapture writeonly %0, ptr %1) local_unnamed_addr #9 !dbg !1844 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !dbg !1848, !range !1742, !noundef !1743
  %4 = zext i32 %3 to i64, !dbg !1848
  %5 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr(), !dbg !1849
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x(), !dbg !1849
  %7 = getelementptr inbounds i16, ptr addrspace(4) %5, i64 6, !dbg !1849
  %8 = load i16, ptr addrspace(4) %7, align 4, !dbg !1849, !tbaa !1827
  %9 = zext i16 %8 to i64, !dbg !1849
  %10 = zext i32 %6 to i64, !dbg !1850
  %11 = mul nuw nsw i64 %9, %10, !dbg !1851
  %12 = add nuw nsw i64 %11, %4, !dbg !1852
  %13 = shl i64 %12, 32, !dbg !1853
  %14 = ashr exact i64 %13, 32, !dbg !1853
  %15 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %14, !dbg !1853
  store i64 0, ptr addrspace(1) %15, align 8, !dbg !1854, !tbaa !1744
  call void @"scabbard.trace.device.trace_append$mem"(ptr %1, i16 8324, ptr addrspace(1) %15, ptr addrspace(1) @"scabbard.metadata.device.srcId$0x0000", i32 191, i32 17)
  ret void, !dbg !1855
}

attributes #0 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nounwind willreturn memory(readwrite, inaccessiblemem: none) "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1030" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx10-3-insts,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" "uniform-work-group-size"="true" }
attributes #3 = { mustprogress nofree noinline norecurse nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1030" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx10-3-insts,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { convergent mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1030" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx10-3-insts,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" "uniform-work-group-size"="true" }
attributes #8 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1030" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx10-3-insts,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #9 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1030" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx10-3-insts,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" "uniform-work-group-size"="true" }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.dbg.retainedNodes = !{!1686, !1728}
!llvm.module.flags = !{!1731, !1732, !1733, !1734, !1735}
!opencl.ocl.version = !{!1736, !1736}
!llvm.ident = !{!1737, !1737}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "AMD clang version 16.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.6.0 23243 be997b2f3651a41597d7a41441fff8ade4ac59ac)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, imports: !20, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/home/oster/repos/scabbard", checksumkind: CSK_MD5, checksum: "84927e4bf98b7e7efaf685dc29fe5570")
!2 = !{!3, !6}
!3 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cl_mem_fence_flags", file: !4, line: 129, baseType: !5)
!4 = !DIFile(filename: "/opt/rocm-5.6.0/include/hip/amd_detail/device_library_decls.h", directory: "", checksumkind: CSK_MD5, checksum: "20a00d5030bea304a61205b38f5fc6c2")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !7, line: 964, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !8, identifier: "_ZTS4dim3")
!7 = !DIFile(filename: "/opt/rocm-5.6.0/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "d1551dc8d03ade62421a6a2c511a6461")
!8 = !{!9, !14, !15, !16}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !6, file: !7, line: 965, baseType: !10, size: 32)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !11, line: 26, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !13, line: 42, baseType: !5)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!14 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !6, file: !7, line: 966, baseType: !10, size: 32, offset: 32)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !6, file: !7, line: 967, baseType: !10, size: 32, offset: 64)
!16 = !DISubprogram(name: "dim3", scope: !6, file: !7, line: 969, type: !17, scopeLine: 969, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19, !10, !10, !10}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!20 = !{!21, !29, !36, !38, !40, !44, !46, !48, !50, !52, !54, !56, !58, !63, !67, !69, !71, !76, !78, !80, !82, !84, !86, !88, !91, !94, !96, !100, !105, !107, !109, !111, !113, !115, !117, !119, !121, !123, !125, !129, !133, !135, !137, !139, !141, !143, !145, !147, !149, !151, !153, !155, !157, !159, !161, !163, !167, !171, !175, !177, !179, !181, !183, !185, !187, !189, !191, !193, !197, !201, !205, !207, !209, !211, !216, !220, !224, !226, !228, !230, !232, !234, !236, !238, !240, !242, !244, !246, !248, !253, !257, !261, !263, !265, !267, !274, !278, !282, !284, !286, !288, !290, !292, !294, !298, !302, !304, !306, !308, !310, !314, !318, !322, !324, !326, !328, !330, !332, !334, !338, !342, !346, !348, !352, !356, !358, !360, !362, !364, !366, !368, !372, !376, !382, !386, !394, !399, !401, !404, !408, !412, !423, !425, !429, !433, !437, !442, !446, !450, !454, !458, !466, !470, !474, !476, !480, !484, !488, !494, !498, !502, !504, !512, !516, !523, !525, !529, !533, !537, !541, !546, !550, !554, !555, !556, !557, !559, !560, !561, !562, !563, !564, !565, !567, !568, !569, !570, !571, !572, !573, !575, !576, !577, !578, !579, !580, !581, !582, !583, !584, !585, !586, !587, !588, !589, !590, !591, !592, !593, !594, !595, !596, !597, !598, !599, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652, !656, !658, !660, !665, !669, !671, !673, !675, !677, !679, !681, !683, !685, !687, !689, !691, !693, !695, !697, !699, !701, !703, !705, !707, !709, !711, !716, !718, !720, !722, !724, !726, !728, !730, !732, !734, !736, !738, !740, !742, !744, !746, !748, !750, !752, !754, !758, !760, !762, !764, !766, !768, !770, !772, !774, !776, !778, !780, !782, !784, !786, !788, !790, !792, !794, !796, !798, !800, !802, !804, !806, !808, !810, !812, !814, !816, !818, !820, !822, !824, !826, !828, !830, !832, !834, !836, !838, !840, !842, !844, !846, !848, !850, !852, !854, !856, !858, !860, !862, !864, !866, !870, !874, !891, !894, !899, !957, !962, !966, !970, !974, !978, !980, !982, !986, !992, !996, !1002, !1008, !1010, !1014, !1018, !1022, !1026, !1034, !1036, !1040, !1044, !1048, !1050, !1054, !1058, !1062, !1064, !1066, !1070, !1091, !1095, !1099, !1103, !1105, !1111, !1113, !1119, !1123, !1127, !1131, !1135, !1139, !1143, !1145, !1147, !1151, !1155, !1159, !1161, !1165, !1169, !1171, !1173, !1177, !1181, !1185, !1189, !1190, !1191, !1192, !1193, !1194, !1195, !1196, !1197, !1198, !1199, !1204, !1208, !1211, !1214, !1217, !1219, !1221, !1223, !1226, !1229, !1232, !1235, !1238, !1240, !1244, !1247, !1248, !1251, !1253, !1255, !1257, !1259, !1262, !1265, !1268, !1271, !1274, !1276, !1280, !1284, !1289, !1293, !1295, !1297, !1299, !1301, !1303, !1305, !1307, !1309, !1311, !1313, !1315, !1317, !1319, !1323, !1329, !1334, !1338, !1340, !1342, !1344, !1346, !1353, !1357, !1361, !1365, !1369, !1373, !1378, !1382, !1384, !1388, !1394, !1398, !1403, !1405, !1408, !1412, !1416, !1418, !1420, !1422, !1424, !1428, !1430, !1432, !1436, !1440, !1444, !1448, !1452, !1456, !1458, !1462, !1466, !1470, !1474, !1476, !1478, !1482, !1486, !1487, !1488, !1489, !1490, !1491, !1497, !1500, !1501, !1503, !1505, !1507, !1509, !1513, !1515, !1517, !1519, !1521, !1523, !1525, !1527, !1529, !1533, !1537, !1539, !1543, !1547, !1552, !1556, !1557, !1562, !1566, !1571, !1576, !1580, !1586, !1590, !1592, !1596, !1603, !1608, !1613, !1619, !1623, !1628, !1630, !1634, !1638, !1640, !1642, !1644, !1648, !1652, !1656, !1660, !1664, !1666, !1668, !1670, !1674, !1678, !1682, !1684}
!21 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !23, file: !28, line: 52)
!22 = !DINamespace(name: "std", scope: null)
!23 = !DISubprogram(name: "abs", scope: !24, file: !24, line: 848, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!24 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!25 = !DISubroutineType(types: !26)
!26 = !{!27, !27}
!27 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!28 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/std_abs.h", directory: "")
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !30, file: !35, line: 83)
!30 = !DISubprogram(name: "acos", scope: !31, file: !31, line: 53, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!31 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "8c6e2d0d2bda65bc5ba1ca02b65383b7")
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !34}
!34 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!35 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cmath", directory: "")
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !37, file: !35, line: 102)
!37 = !DISubprogram(name: "asin", scope: !31, file: !31, line: 55, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !39, file: !35, line: 121)
!39 = !DISubprogram(name: "atan", scope: !31, file: !31, line: 57, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !41, file: !35, line: 140)
!41 = !DISubprogram(name: "atan2", scope: !31, file: !31, line: 59, type: !42, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!42 = !DISubroutineType(types: !43)
!43 = !{!34, !34, !34}
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !45, file: !35, line: 161)
!45 = !DISubprogram(name: "ceil", scope: !31, file: !31, line: 159, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !47, file: !35, line: 180)
!47 = !DISubprogram(name: "cos", scope: !31, file: !31, line: 62, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !49, file: !35, line: 199)
!49 = !DISubprogram(name: "cosh", scope: !31, file: !31, line: 71, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !51, file: !35, line: 218)
!51 = !DISubprogram(name: "exp", scope: !31, file: !31, line: 95, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !53, file: !35, line: 237)
!53 = !DISubprogram(name: "fabs", scope: !31, file: !31, line: 162, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !55, file: !35, line: 256)
!55 = !DISubprogram(name: "floor", scope: !31, file: !31, line: 165, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !57, file: !35, line: 275)
!57 = !DISubprogram(name: "fmod", scope: !31, file: !31, line: 168, type: !42, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !59, file: !35, line: 296)
!59 = !DISubprogram(name: "frexp", scope: !31, file: !31, line: 98, type: !60, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!60 = !DISubroutineType(types: !61)
!61 = !{!34, !34, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !64, file: !35, line: 315)
!64 = !DISubprogram(name: "ldexp", scope: !31, file: !31, line: 101, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!65 = !DISubroutineType(types: !66)
!66 = !{!34, !34, !27}
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !68, file: !35, line: 334)
!68 = !DISubprogram(name: "log", scope: !31, file: !31, line: 104, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !70, file: !35, line: 353)
!70 = !DISubprogram(name: "log10", scope: !31, file: !31, line: 107, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !72, file: !35, line: 372)
!72 = !DISubprogram(name: "modf", scope: !31, file: !31, line: 110, type: !73, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!73 = !DISubroutineType(types: !74)
!74 = !{!34, !34, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !77, file: !35, line: 384)
!77 = !DISubprogram(name: "pow", scope: !31, file: !31, line: 140, type: !42, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !79, file: !35, line: 421)
!79 = !DISubprogram(name: "sin", scope: !31, file: !31, line: 64, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !81, file: !35, line: 440)
!81 = !DISubprogram(name: "sinh", scope: !31, file: !31, line: 73, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !83, file: !35, line: 459)
!83 = !DISubprogram(name: "sqrt", scope: !31, file: !31, line: 143, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !85, file: !35, line: 478)
!85 = !DISubprogram(name: "tan", scope: !31, file: !31, line: 66, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !87, file: !35, line: 497)
!87 = !DISubprogram(name: "tanh", scope: !31, file: !31, line: 75, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !89, file: !35, line: 1065)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !90, line: 164, baseType: !34)
!90 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "f3450d1d586f704597de1a1b2bed18f3")
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !92, file: !35, line: 1066)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !90, line: 163, baseType: !93)
!93 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !95, file: !35, line: 1069)
!95 = !DISubprogram(name: "acosh", scope: !31, file: !31, line: 85, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !97, file: !35, line: 1070)
!97 = !DISubprogram(name: "acoshf", scope: !31, file: !31, line: 85, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!98 = !DISubroutineType(types: !99)
!99 = !{!93, !93}
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !101, file: !35, line: 1071)
!101 = !DISubprogram(name: "acoshl", scope: !31, file: !31, line: 85, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!102 = !DISubroutineType(types: !103)
!103 = !{!104, !104}
!104 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !106, file: !35, line: 1073)
!106 = !DISubprogram(name: "asinh", scope: !31, file: !31, line: 87, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !108, file: !35, line: 1074)
!108 = !DISubprogram(name: "asinhf", scope: !31, file: !31, line: 87, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !110, file: !35, line: 1075)
!110 = !DISubprogram(name: "asinhl", scope: !31, file: !31, line: 87, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !112, file: !35, line: 1077)
!112 = !DISubprogram(name: "atanh", scope: !31, file: !31, line: 89, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !114, file: !35, line: 1078)
!114 = !DISubprogram(name: "atanhf", scope: !31, file: !31, line: 89, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !116, file: !35, line: 1079)
!116 = !DISubprogram(name: "atanhl", scope: !31, file: !31, line: 89, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !118, file: !35, line: 1081)
!118 = !DISubprogram(name: "cbrt", scope: !31, file: !31, line: 152, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !120, file: !35, line: 1082)
!120 = !DISubprogram(name: "cbrtf", scope: !31, file: !31, line: 152, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !122, file: !35, line: 1083)
!122 = !DISubprogram(name: "cbrtl", scope: !31, file: !31, line: 152, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !124, file: !35, line: 1085)
!124 = !DISubprogram(name: "copysign", scope: !31, file: !31, line: 198, type: !42, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !126, file: !35, line: 1086)
!126 = !DISubprogram(name: "copysignf", scope: !31, file: !31, line: 198, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!127 = !DISubroutineType(types: !128)
!128 = !{!93, !93, !93}
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !130, file: !35, line: 1087)
!130 = !DISubprogram(name: "copysignl", scope: !31, file: !31, line: 198, type: !131, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!131 = !DISubroutineType(types: !132)
!132 = !{!104, !104, !104}
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !134, file: !35, line: 1089)
!134 = !DISubprogram(name: "erf", scope: !31, file: !31, line: 231, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !136, file: !35, line: 1090)
!136 = !DISubprogram(name: "erff", scope: !31, file: !31, line: 231, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !138, file: !35, line: 1091)
!138 = !DISubprogram(name: "erfl", scope: !31, file: !31, line: 231, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !140, file: !35, line: 1093)
!140 = !DISubprogram(name: "erfc", scope: !31, file: !31, line: 232, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !142, file: !35, line: 1094)
!142 = !DISubprogram(name: "erfcf", scope: !31, file: !31, line: 232, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !144, file: !35, line: 1095)
!144 = !DISubprogram(name: "erfcl", scope: !31, file: !31, line: 232, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !146, file: !35, line: 1097)
!146 = !DISubprogram(name: "exp2", scope: !31, file: !31, line: 130, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !148, file: !35, line: 1098)
!148 = !DISubprogram(name: "exp2f", scope: !31, file: !31, line: 130, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !150, file: !35, line: 1099)
!150 = !DISubprogram(name: "exp2l", scope: !31, file: !31, line: 130, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !152, file: !35, line: 1101)
!152 = !DISubprogram(name: "expm1", scope: !31, file: !31, line: 119, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !154, file: !35, line: 1102)
!154 = !DISubprogram(name: "expm1f", scope: !31, file: !31, line: 119, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !156, file: !35, line: 1103)
!156 = !DISubprogram(name: "expm1l", scope: !31, file: !31, line: 119, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !158, file: !35, line: 1105)
!158 = !DISubprogram(name: "fdim", scope: !31, file: !31, line: 329, type: !42, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !160, file: !35, line: 1106)
!160 = !DISubprogram(name: "fdimf", scope: !31, file: !31, line: 329, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !162, file: !35, line: 1107)
!162 = !DISubprogram(name: "fdiml", scope: !31, file: !31, line: 329, type: !131, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !164, file: !35, line: 1109)
!164 = !DISubprogram(name: "fma", scope: !31, file: !31, line: 340, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!165 = !DISubroutineType(types: !166)
!166 = !{!34, !34, !34, !34}
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !168, file: !35, line: 1110)
!168 = !DISubprogram(name: "fmaf", scope: !31, file: !31, line: 340, type: !169, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!169 = !DISubroutineType(types: !170)
!170 = !{!93, !93, !93, !93}
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !172, file: !35, line: 1111)
!172 = !DISubprogram(name: "fmal", scope: !31, file: !31, line: 340, type: !173, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!173 = !DISubroutineType(types: !174)
!174 = !{!104, !104, !104, !104}
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !176, file: !35, line: 1113)
!176 = !DISubprogram(name: "fmax", scope: !31, file: !31, line: 333, type: !42, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !178, file: !35, line: 1114)
!178 = !DISubprogram(name: "fmaxf", scope: !31, file: !31, line: 333, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !180, file: !35, line: 1115)
!180 = !DISubprogram(name: "fmaxl", scope: !31, file: !31, line: 333, type: !131, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !182, file: !35, line: 1117)
!182 = !DISubprogram(name: "fmin", scope: !31, file: !31, line: 336, type: !42, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !184, file: !35, line: 1118)
!184 = !DISubprogram(name: "fminf", scope: !31, file: !31, line: 336, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !186, file: !35, line: 1119)
!186 = !DISubprogram(name: "fminl", scope: !31, file: !31, line: 336, type: !131, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !188, file: !35, line: 1121)
!188 = !DISubprogram(name: "hypot", scope: !31, file: !31, line: 147, type: !42, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !190, file: !35, line: 1122)
!190 = !DISubprogram(name: "hypotf", scope: !31, file: !31, line: 147, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !192, file: !35, line: 1123)
!192 = !DISubprogram(name: "hypotl", scope: !31, file: !31, line: 147, type: !131, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !194, file: !35, line: 1125)
!194 = !DISubprogram(name: "ilogb", scope: !31, file: !31, line: 283, type: !195, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!195 = !DISubroutineType(types: !196)
!196 = !{!27, !34}
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !198, file: !35, line: 1126)
!198 = !DISubprogram(name: "ilogbf", scope: !31, file: !31, line: 283, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!199 = !DISubroutineType(types: !200)
!200 = !{!27, !93}
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !202, file: !35, line: 1127)
!202 = !DISubprogram(name: "ilogbl", scope: !31, file: !31, line: 283, type: !203, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!203 = !DISubroutineType(types: !204)
!204 = !{!27, !104}
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !206, file: !35, line: 1129)
!206 = !DISubprogram(name: "lgamma", scope: !31, file: !31, line: 233, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !208, file: !35, line: 1130)
!208 = !DISubprogram(name: "lgammaf", scope: !31, file: !31, line: 233, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !210, file: !35, line: 1131)
!210 = !DISubprogram(name: "lgammal", scope: !31, file: !31, line: 233, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !212, file: !35, line: 1134)
!212 = !DISubprogram(name: "llrint", scope: !31, file: !31, line: 319, type: !213, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!213 = !DISubroutineType(types: !214)
!214 = !{!215, !34}
!215 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !217, file: !35, line: 1135)
!217 = !DISubprogram(name: "llrintf", scope: !31, file: !31, line: 319, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!218 = !DISubroutineType(types: !219)
!219 = !{!215, !93}
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !221, file: !35, line: 1136)
!221 = !DISubprogram(name: "llrintl", scope: !31, file: !31, line: 319, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!222 = !DISubroutineType(types: !223)
!223 = !{!215, !104}
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !225, file: !35, line: 1138)
!225 = !DISubprogram(name: "llround", scope: !31, file: !31, line: 325, type: !213, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !227, file: !35, line: 1139)
!227 = !DISubprogram(name: "llroundf", scope: !31, file: !31, line: 325, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !229, file: !35, line: 1140)
!229 = !DISubprogram(name: "llroundl", scope: !31, file: !31, line: 325, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !231, file: !35, line: 1143)
!231 = !DISubprogram(name: "log1p", scope: !31, file: !31, line: 122, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !233, file: !35, line: 1144)
!233 = !DISubprogram(name: "log1pf", scope: !31, file: !31, line: 122, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !235, file: !35, line: 1145)
!235 = !DISubprogram(name: "log1pl", scope: !31, file: !31, line: 122, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !237, file: !35, line: 1147)
!237 = !DISubprogram(name: "log2", scope: !31, file: !31, line: 133, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !239, file: !35, line: 1148)
!239 = !DISubprogram(name: "log2f", scope: !31, file: !31, line: 133, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !241, file: !35, line: 1149)
!241 = !DISubprogram(name: "log2l", scope: !31, file: !31, line: 133, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !243, file: !35, line: 1151)
!243 = !DISubprogram(name: "logb", scope: !31, file: !31, line: 125, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !245, file: !35, line: 1152)
!245 = !DISubprogram(name: "logbf", scope: !31, file: !31, line: 125, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !247, file: !35, line: 1153)
!247 = !DISubprogram(name: "logbl", scope: !31, file: !31, line: 125, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !249, file: !35, line: 1155)
!249 = !DISubprogram(name: "lrint", scope: !31, file: !31, line: 317, type: !250, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!250 = !DISubroutineType(types: !251)
!251 = !{!252, !34}
!252 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !254, file: !35, line: 1156)
!254 = !DISubprogram(name: "lrintf", scope: !31, file: !31, line: 317, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!255 = !DISubroutineType(types: !256)
!256 = !{!252, !93}
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !258, file: !35, line: 1157)
!258 = !DISubprogram(name: "lrintl", scope: !31, file: !31, line: 317, type: !259, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!259 = !DISubroutineType(types: !260)
!260 = !{!252, !104}
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !262, file: !35, line: 1159)
!262 = !DISubprogram(name: "lround", scope: !31, file: !31, line: 323, type: !250, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !264, file: !35, line: 1160)
!264 = !DISubprogram(name: "lroundf", scope: !31, file: !31, line: 323, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !266, file: !35, line: 1161)
!266 = !DISubprogram(name: "lroundl", scope: !31, file: !31, line: 323, type: !259, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !268, file: !35, line: 1163)
!268 = !DISubprogram(name: "nan", scope: !31, file: !31, line: 203, type: !269, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!269 = !DISubroutineType(types: !270)
!270 = !{!34, !271}
!271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!272 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !273)
!273 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !275, file: !35, line: 1164)
!275 = !DISubprogram(name: "nanf", scope: !31, file: !31, line: 203, type: !276, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!276 = !DISubroutineType(types: !277)
!277 = !{!93, !271}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !279, file: !35, line: 1165)
!279 = !DISubprogram(name: "nanl", scope: !31, file: !31, line: 203, type: !280, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!280 = !DISubroutineType(types: !281)
!281 = !{!104, !271}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !283, file: !35, line: 1167)
!283 = !DISubprogram(name: "nearbyint", scope: !31, file: !31, line: 297, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !285, file: !35, line: 1168)
!285 = !DISubprogram(name: "nearbyintf", scope: !31, file: !31, line: 297, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !287, file: !35, line: 1169)
!287 = !DISubprogram(name: "nearbyintl", scope: !31, file: !31, line: 297, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !289, file: !35, line: 1171)
!289 = !DISubprogram(name: "nextafter", scope: !31, file: !31, line: 262, type: !42, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !291, file: !35, line: 1172)
!291 = !DISubprogram(name: "nextafterf", scope: !31, file: !31, line: 262, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !293, file: !35, line: 1173)
!293 = !DISubprogram(name: "nextafterl", scope: !31, file: !31, line: 262, type: !131, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !295, file: !35, line: 1175)
!295 = !DISubprogram(name: "nexttoward", scope: !31, file: !31, line: 264, type: !296, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!296 = !DISubroutineType(types: !297)
!297 = !{!34, !34, !104}
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !299, file: !35, line: 1176)
!299 = !DISubprogram(name: "nexttowardf", scope: !31, file: !31, line: 264, type: !300, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!300 = !DISubroutineType(types: !301)
!301 = !{!93, !93, !104}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !303, file: !35, line: 1177)
!303 = !DISubprogram(name: "nexttowardl", scope: !31, file: !31, line: 264, type: !131, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !305, file: !35, line: 1179)
!305 = !DISubprogram(name: "remainder", scope: !31, file: !31, line: 275, type: !42, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !307, file: !35, line: 1180)
!307 = !DISubprogram(name: "remainderf", scope: !31, file: !31, line: 275, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !309, file: !35, line: 1181)
!309 = !DISubprogram(name: "remainderl", scope: !31, file: !31, line: 275, type: !131, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !311, file: !35, line: 1183)
!311 = !DISubprogram(name: "remquo", scope: !31, file: !31, line: 310, type: !312, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!312 = !DISubroutineType(types: !313)
!313 = !{!34, !34, !34, !62}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !315, file: !35, line: 1184)
!315 = !DISubprogram(name: "remquof", scope: !31, file: !31, line: 310, type: !316, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!316 = !DISubroutineType(types: !317)
!317 = !{!93, !93, !93, !62}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !319, file: !35, line: 1185)
!319 = !DISubprogram(name: "remquol", scope: !31, file: !31, line: 310, type: !320, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!320 = !DISubroutineType(types: !321)
!321 = !{!104, !104, !104, !62}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !323, file: !35, line: 1187)
!323 = !DISubprogram(name: "rint", scope: !31, file: !31, line: 259, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !325, file: !35, line: 1188)
!325 = !DISubprogram(name: "rintf", scope: !31, file: !31, line: 259, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !327, file: !35, line: 1189)
!327 = !DISubprogram(name: "rintl", scope: !31, file: !31, line: 259, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !329, file: !35, line: 1191)
!329 = !DISubprogram(name: "round", scope: !31, file: !31, line: 301, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !331, file: !35, line: 1192)
!331 = !DISubprogram(name: "roundf", scope: !31, file: !31, line: 301, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !333, file: !35, line: 1193)
!333 = !DISubprogram(name: "roundl", scope: !31, file: !31, line: 301, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !335, file: !35, line: 1195)
!335 = !DISubprogram(name: "scalbln", scope: !31, file: !31, line: 293, type: !336, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!336 = !DISubroutineType(types: !337)
!337 = !{!34, !34, !252}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !339, file: !35, line: 1196)
!339 = !DISubprogram(name: "scalblnf", scope: !31, file: !31, line: 293, type: !340, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!340 = !DISubroutineType(types: !341)
!341 = !{!93, !93, !252}
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !343, file: !35, line: 1197)
!343 = !DISubprogram(name: "scalblnl", scope: !31, file: !31, line: 293, type: !344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!344 = !DISubroutineType(types: !345)
!345 = !{!104, !104, !252}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !347, file: !35, line: 1199)
!347 = !DISubprogram(name: "scalbn", scope: !31, file: !31, line: 279, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !349, file: !35, line: 1200)
!349 = !DISubprogram(name: "scalbnf", scope: !31, file: !31, line: 279, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!350 = !DISubroutineType(types: !351)
!351 = !{!93, !93, !27}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !353, file: !35, line: 1201)
!353 = !DISubprogram(name: "scalbnl", scope: !31, file: !31, line: 279, type: !354, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!354 = !DISubroutineType(types: !355)
!355 = !{!104, !104, !27}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !357, file: !35, line: 1203)
!357 = !DISubprogram(name: "tgamma", scope: !31, file: !31, line: 238, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !359, file: !35, line: 1204)
!359 = !DISubprogram(name: "tgammaf", scope: !31, file: !31, line: 238, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !361, file: !35, line: 1205)
!361 = !DISubprogram(name: "tgammal", scope: !31, file: !31, line: 238, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !363, file: !35, line: 1207)
!363 = !DISubprogram(name: "trunc", scope: !31, file: !31, line: 305, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !365, file: !35, line: 1208)
!365 = !DISubprogram(name: "truncf", scope: !31, file: !31, line: 305, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !367, file: !35, line: 1209)
!367 = !DISubprogram(name: "truncl", scope: !31, file: !31, line: 305, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!368 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !369, entity: !370, file: !371, line: 58)
!369 = !DINamespace(name: "__gnu_debug", scope: null)
!370 = !DINamespace(name: "__debug", scope: !22)
!371 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "09fce61e0085ea92b4bd81d6cd4dcc16")
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !373, file: !375, line: 127)
!373 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !24, line: 63, baseType: !374)
!374 = !DICompositeType(tag: DW_TAG_structure_type, file: !24, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!375 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdlib", directory: "")
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !377, file: !375, line: 128)
!377 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !24, line: 71, baseType: !378)
!378 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !24, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !379, identifier: "_ZTS6ldiv_t")
!379 = !{!380, !381}
!380 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !378, file: !24, line: 69, baseType: !252, size: 64)
!381 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !378, file: !24, line: 70, baseType: !252, size: 64, offset: 64)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !383, file: !375, line: 130)
!383 = !DISubprogram(name: "abort", scope: !24, file: !24, line: 598, type: !384, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!384 = !DISubroutineType(types: !385)
!385 = !{null}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !387, file: !375, line: 132)
!387 = !DISubprogram(name: "aligned_alloc", scope: !24, file: !24, line: 592, type: !388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!388 = !DISubroutineType(types: !389)
!389 = !{!390, !391, !391}
!390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !392, line: 46, baseType: !393)
!392 = !DIFile(filename: "/opt/rocm-5.6.0/llvm/lib/clang/16.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!393 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !395, file: !375, line: 134)
!395 = !DISubprogram(name: "atexit", scope: !24, file: !24, line: 602, type: !396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!396 = !DISubroutineType(types: !397)
!397 = !{!27, !398}
!398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !384, size: 64)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !400, file: !375, line: 137)
!400 = !DISubprogram(name: "at_quick_exit", scope: !24, file: !24, line: 607, type: !396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !402, file: !375, line: 140)
!402 = !DISubprogram(name: "atof", scope: !403, file: !403, line: 25, type: !269, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!403 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "adfe1626ff4efc68ac58c367ff5f206b")
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !405, file: !375, line: 141)
!405 = !DISubprogram(name: "atoi", scope: !24, file: !24, line: 362, type: !406, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!406 = !DISubroutineType(types: !407)
!407 = !{!27, !271}
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !409, file: !375, line: 142)
!409 = !DISubprogram(name: "atol", scope: !24, file: !24, line: 367, type: !410, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!410 = !DISubroutineType(types: !411)
!411 = !{!252, !271}
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !413, file: !375, line: 143)
!413 = !DISubprogram(name: "bsearch", scope: !414, file: !414, line: 20, type: !415, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!414 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "724ededa330cc3e0cbd34c5b4030a6f6")
!415 = !DISubroutineType(types: !416)
!416 = !{!390, !417, !417, !391, !391, !419}
!417 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !418, size: 64)
!418 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !24, line: 816, baseType: !420)
!420 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !421, size: 64)
!421 = !DISubroutineType(types: !422)
!422 = !{!27, !417, !417}
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !424, file: !375, line: 144)
!424 = !DISubprogram(name: "calloc", scope: !24, file: !24, line: 543, type: !388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !426, file: !375, line: 145)
!426 = !DISubprogram(name: "div", scope: !24, file: !24, line: 860, type: !427, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!427 = !DISubroutineType(types: !428)
!428 = !{!373, !27, !27}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !430, file: !375, line: 146)
!430 = !DISubprogram(name: "exit", scope: !24, file: !24, line: 624, type: !431, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!431 = !DISubroutineType(types: !432)
!432 = !{null, !27}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !434, file: !375, line: 147)
!434 = !DISubprogram(name: "free", scope: !24, file: !24, line: 555, type: !435, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!435 = !DISubroutineType(types: !436)
!436 = !{null, !390}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !438, file: !375, line: 148)
!438 = !DISubprogram(name: "getenv", scope: !24, file: !24, line: 641, type: !439, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!439 = !DISubroutineType(types: !440)
!440 = !{!441, !271}
!441 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !443, file: !375, line: 149)
!443 = !DISubprogram(name: "labs", scope: !24, file: !24, line: 849, type: !444, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!444 = !DISubroutineType(types: !445)
!445 = !{!252, !252}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !447, file: !375, line: 150)
!447 = !DISubprogram(name: "ldiv", scope: !24, file: !24, line: 862, type: !448, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!448 = !DISubroutineType(types: !449)
!449 = !{!377, !252, !252}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !451, file: !375, line: 151)
!451 = !DISubprogram(name: "malloc", scope: !24, file: !24, line: 540, type: !452, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!452 = !DISubroutineType(types: !453)
!453 = !{!390, !391}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !455, file: !375, line: 153)
!455 = !DISubprogram(name: "mblen", scope: !24, file: !24, line: 930, type: !456, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!456 = !DISubroutineType(types: !457)
!457 = !{!27, !271, !391}
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !459, file: !375, line: 154)
!459 = !DISubprogram(name: "mbstowcs", scope: !24, file: !24, line: 941, type: !460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!460 = !DISubroutineType(types: !461)
!461 = !{!391, !462, !465, !391}
!462 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !463)
!463 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !464, size: 64)
!464 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!465 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !271)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !467, file: !375, line: 155)
!467 = !DISubprogram(name: "mbtowc", scope: !24, file: !24, line: 933, type: !468, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!468 = !DISubroutineType(types: !469)
!469 = !{!27, !462, !465, !391}
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !471, file: !375, line: 157)
!471 = !DISubprogram(name: "qsort", scope: !24, file: !24, line: 838, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!472 = !DISubroutineType(types: !473)
!473 = !{null, !390, !391, !391, !419}
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !475, file: !375, line: 160)
!475 = !DISubprogram(name: "quick_exit", scope: !24, file: !24, line: 630, type: !431, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !477, file: !375, line: 163)
!477 = !DISubprogram(name: "rand", scope: !24, file: !24, line: 454, type: !478, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!478 = !DISubroutineType(types: !479)
!479 = !{!27}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !481, file: !375, line: 164)
!481 = !DISubprogram(name: "realloc", scope: !24, file: !24, line: 551, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!482 = !DISubroutineType(types: !483)
!483 = !{!390, !390, !391}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !485, file: !375, line: 165)
!485 = !DISubprogram(name: "srand", scope: !24, file: !24, line: 456, type: !486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!486 = !DISubroutineType(types: !487)
!487 = !{null, !5}
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !489, file: !375, line: 166)
!489 = !DISubprogram(name: "strtod", scope: !24, file: !24, line: 118, type: !490, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!490 = !DISubroutineType(types: !491)
!491 = !{!34, !465, !492}
!492 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !493)
!493 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !441, size: 64)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !495, file: !375, line: 167)
!495 = !DISubprogram(name: "strtol", scope: !24, file: !24, line: 177, type: !496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!496 = !DISubroutineType(types: !497)
!497 = !{!252, !465, !492, !27}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !499, file: !375, line: 168)
!499 = !DISubprogram(name: "strtoul", scope: !24, file: !24, line: 181, type: !500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!500 = !DISubroutineType(types: !501)
!501 = !{!393, !465, !492, !27}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !503, file: !375, line: 169)
!503 = !DISubprogram(name: "system", scope: !24, file: !24, line: 791, type: !406, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !505, file: !375, line: 171)
!505 = !DISubprogram(name: "wcstombs", scope: !24, file: !24, line: 945, type: !506, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!506 = !DISubroutineType(types: !507)
!507 = !{!391, !508, !509, !391}
!508 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !441)
!509 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !510)
!510 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !511, size: 64)
!511 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !464)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !513, file: !375, line: 172)
!513 = !DISubprogram(name: "wctomb", scope: !24, file: !24, line: 937, type: !514, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!514 = !DISubroutineType(types: !515)
!515 = !{!27, !441, !464}
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !518, file: !375, line: 200)
!517 = !DINamespace(name: "__gnu_cxx", scope: null)
!518 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !24, line: 81, baseType: !519)
!519 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !24, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !520, identifier: "_ZTS7lldiv_t")
!520 = !{!521, !522}
!521 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !519, file: !24, line: 79, baseType: !215, size: 64)
!522 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !519, file: !24, line: 80, baseType: !215, size: 64, offset: 64)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !524, file: !375, line: 206)
!524 = !DISubprogram(name: "_Exit", scope: !24, file: !24, line: 636, type: !431, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !526, file: !375, line: 210)
!526 = !DISubprogram(name: "llabs", scope: !24, file: !24, line: 852, type: !527, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!527 = !DISubroutineType(types: !528)
!528 = !{!215, !215}
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !530, file: !375, line: 216)
!530 = !DISubprogram(name: "lldiv", scope: !24, file: !24, line: 866, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!531 = !DISubroutineType(types: !532)
!532 = !{!518, !215, !215}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !534, file: !375, line: 227)
!534 = !DISubprogram(name: "atoll", scope: !24, file: !24, line: 374, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!535 = !DISubroutineType(types: !536)
!536 = !{!215, !271}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !538, file: !375, line: 228)
!538 = !DISubprogram(name: "strtoll", scope: !24, file: !24, line: 201, type: !539, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!539 = !DISubroutineType(types: !540)
!540 = !{!215, !465, !492, !27}
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !542, file: !375, line: 229)
!542 = !DISubprogram(name: "strtoull", scope: !24, file: !24, line: 206, type: !543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!543 = !DISubroutineType(types: !544)
!544 = !{!545, !465, !492, !27}
!545 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !547, file: !375, line: 231)
!547 = !DISubprogram(name: "strtof", scope: !24, file: !24, line: 124, type: !548, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!548 = !DISubroutineType(types: !549)
!549 = !{!93, !465, !492}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !551, file: !375, line: 232)
!551 = !DISubprogram(name: "strtold", scope: !24, file: !24, line: 127, type: !552, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!552 = !DISubroutineType(types: !553)
!553 = !{!104, !465, !492}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !518, file: !375, line: 240)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !524, file: !375, line: 242)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !526, file: !375, line: 244)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !558, file: !375, line: 245)
!558 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !517, file: !375, line: 213, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !530, file: !375, line: 246)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !534, file: !375, line: 248)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !547, file: !375, line: 249)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !538, file: !375, line: 250)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !542, file: !375, line: 251)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !551, file: !375, line: 252)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !383, file: !566, line: 38)
!566 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "ce88caced6ed945413de73c65016f4c2")
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !395, file: !566, line: 39)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !430, file: !566, line: 40)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !400, file: !566, line: 43)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !475, file: !566, line: 46)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !373, file: !566, line: 51)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !377, file: !566, line: 52)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !574, file: !566, line: 54)
!574 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !22, file: !28, line: 79, type: !102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !402, file: !566, line: 55)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !405, file: !566, line: 56)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !409, file: !566, line: 57)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !413, file: !566, line: 58)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !424, file: !566, line: 59)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !558, file: !566, line: 60)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !434, file: !566, line: 61)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !438, file: !566, line: 62)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !443, file: !566, line: 63)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !447, file: !566, line: 64)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !451, file: !566, line: 65)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !455, file: !566, line: 67)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !459, file: !566, line: 68)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !467, file: !566, line: 69)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !471, file: !566, line: 71)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !477, file: !566, line: 72)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !481, file: !566, line: 73)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !485, file: !566, line: 74)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !489, file: !566, line: 75)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !495, file: !566, line: 76)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !499, file: !566, line: 77)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !503, file: !566, line: 78)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !505, file: !566, line: 80)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !513, file: !566, line: 81)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !600, file: !601, line: 200)
!600 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !601, file: !601, line: 28, type: !32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!601 = !DIFile(filename: "/opt/rocm-5.6.0/llvm/lib/clang/16.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !603, file: !601, line: 201)
!603 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !601, file: !601, line: 32, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !605, file: !601, line: 202)
!605 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !601, file: !601, line: 34, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !607, file: !601, line: 203)
!607 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !601, file: !601, line: 36, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !609, file: !601, line: 204)
!609 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !601, file: !601, line: 38, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !611, file: !601, line: 205)
!611 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !601, file: !601, line: 42, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !613, file: !601, line: 206)
!613 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !601, file: !601, line: 40, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !615, file: !601, line: 207)
!615 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !601, file: !601, line: 44, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !617, file: !601, line: 208)
!617 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !601, file: !601, line: 46, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !619, file: !601, line: 209)
!619 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !601, file: !601, line: 48, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !621, file: !601, line: 210)
!621 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !601, file: !601, line: 50, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !623, file: !601, line: 211)
!623 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !601, file: !601, line: 52, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !625, file: !601, line: 212)
!625 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !601, file: !601, line: 54, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !627, file: !601, line: 213)
!627 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !601, file: !601, line: 58, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !629, file: !601, line: 214)
!629 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !601, file: !601, line: 56, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !631, file: !601, line: 215)
!631 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !601, file: !601, line: 62, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !633, file: !601, line: 216)
!633 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !601, file: !601, line: 60, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !635, file: !601, line: 217)
!635 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !601, file: !601, line: 64, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !637, file: !601, line: 218)
!637 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !601, file: !601, line: 66, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !639, file: !601, line: 219)
!639 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !601, file: !601, line: 68, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !641, file: !601, line: 220)
!641 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !601, file: !601, line: 70, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !643, file: !601, line: 221)
!643 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !601, file: !601, line: 72, type: !169, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !645, file: !601, line: 222)
!645 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !601, file: !601, line: 74, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !647, file: !601, line: 223)
!647 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !601, file: !601, line: 76, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !649, file: !601, line: 224)
!649 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !601, file: !601, line: 78, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !651, file: !601, line: 225)
!651 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !601, file: !601, line: 80, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !653, file: !601, line: 226)
!653 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !601, file: !601, line: 82, type: !654, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!654 = !DISubroutineType(types: !655)
!655 = !{!93, !93, !62}
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !657, file: !601, line: 227)
!657 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !601, file: !601, line: 84, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !659, file: !601, line: 228)
!659 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !601, file: !601, line: 86, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !661, file: !601, line: 229)
!661 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !601, file: !601, line: 91, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!662 = !DISubroutineType(types: !663)
!663 = !{!664, !93}
!664 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !666, file: !601, line: 230)
!666 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !601, file: !601, line: 95, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!667 = !DISubroutineType(types: !668)
!668 = !{!664, !93, !93}
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !670, file: !601, line: 231)
!670 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !601, file: !601, line: 94, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !672, file: !601, line: 232)
!672 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !601, file: !601, line: 100, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !674, file: !601, line: 233)
!674 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !601, file: !601, line: 104, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !676, file: !601, line: 234)
!676 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !601, file: !601, line: 103, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !678, file: !601, line: 235)
!678 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !601, file: !601, line: 106, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !680, file: !601, line: 236)
!680 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !601, file: !601, line: 111, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !682, file: !601, line: 237)
!682 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !601, file: !601, line: 113, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !684, file: !601, line: 238)
!684 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !601, file: !601, line: 115, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !686, file: !601, line: 239)
!686 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !601, file: !601, line: 116, type: !444, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !688, file: !601, line: 240)
!688 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !601, file: !601, line: 118, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !690, file: !601, line: 241)
!690 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !601, file: !601, line: 120, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !692, file: !601, line: 242)
!692 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !601, file: !601, line: 121, type: !527, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !694, file: !601, line: 243)
!694 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !601, file: !601, line: 123, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !696, file: !601, line: 244)
!696 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !601, file: !601, line: 133, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !698, file: !601, line: 245)
!698 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !601, file: !601, line: 125, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !700, file: !601, line: 246)
!700 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !601, file: !601, line: 127, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !702, file: !601, line: 247)
!702 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !601, file: !601, line: 129, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !704, file: !601, line: 248)
!704 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !601, file: !601, line: 131, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !706, file: !601, line: 249)
!706 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !601, file: !601, line: 135, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !708, file: !601, line: 250)
!708 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !601, file: !601, line: 137, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !710, file: !601, line: 251)
!710 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !601, file: !601, line: 138, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !712, file: !601, line: 252)
!712 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !601, file: !601, line: 140, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!713 = !DISubroutineType(types: !714)
!714 = !{!93, !93, !715}
!715 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !717, file: !601, line: 253)
!717 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !601, file: !601, line: 141, type: !269, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !719, file: !601, line: 254)
!719 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !601, file: !601, line: 142, type: !276, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !721, file: !601, line: 255)
!721 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !601, file: !601, line: 144, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !723, file: !601, line: 256)
!723 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !601, file: !601, line: 146, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !725, file: !601, line: 257)
!725 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !601, file: !601, line: 150, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !727, file: !601, line: 258)
!727 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !601, file: !601, line: 152, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !729, file: !601, line: 259)
!729 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !601, file: !601, line: 154, type: !316, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !731, file: !601, line: 260)
!731 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !601, file: !601, line: 156, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !733, file: !601, line: 261)
!733 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !601, file: !601, line: 158, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !735, file: !601, line: 262)
!735 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !601, file: !601, line: 160, type: !340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !737, file: !601, line: 263)
!737 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !601, file: !601, line: 162, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !739, file: !601, line: 264)
!739 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !601, file: !601, line: 167, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !741, file: !601, line: 265)
!741 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !601, file: !601, line: 169, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !743, file: !601, line: 266)
!743 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !601, file: !601, line: 171, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !745, file: !601, line: 267)
!745 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !601, file: !601, line: 173, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !747, file: !601, line: 268)
!747 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !601, file: !601, line: 175, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !749, file: !601, line: 269)
!749 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !601, file: !601, line: 177, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !751, file: !601, line: 270)
!751 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !601, file: !601, line: 179, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !753, file: !601, line: 271)
!753 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !601, file: !601, line: 181, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !755, file: !757, line: 727)
!755 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !756, file: !756, line: 183, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!756 = !DIFile(filename: "/opt/rocm-5.6.0/llvm/lib/clang/16.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "d4f0e84980e083350535310c8ec512a2")
!757 = !DIFile(filename: "/opt/rocm-5.6.0/llvm/lib/clang/16.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "854a3dc6d81a4654631a5bce14ca059c")
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !759, file: !757, line: 728)
!759 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !756, file: !756, line: 186, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !761, file: !757, line: 729)
!761 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !756, file: !756, line: 189, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !763, file: !757, line: 730)
!763 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !756, file: !756, line: 192, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !765, file: !757, line: 731)
!765 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !756, file: !756, line: 195, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !767, file: !757, line: 732)
!767 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !756, file: !756, line: 198, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !769, file: !757, line: 733)
!769 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !756, file: !756, line: 201, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !771, file: !757, line: 734)
!771 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !756, file: !756, line: 204, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !773, file: !757, line: 735)
!773 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !756, file: !756, line: 207, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !775, file: !757, line: 736)
!775 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !756, file: !756, line: 210, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !777, file: !757, line: 737)
!777 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !756, file: !756, line: 213, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !779, file: !757, line: 738)
!779 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !756, file: !756, line: 216, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !781, file: !757, line: 739)
!781 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !756, file: !756, line: 228, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !783, file: !757, line: 740)
!783 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !756, file: !756, line: 237, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !785, file: !757, line: 741)
!785 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !756, file: !756, line: 246, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !787, file: !757, line: 742)
!787 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !756, file: !756, line: 249, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !789, file: !757, line: 743)
!789 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !756, file: !756, line: 252, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !791, file: !757, line: 744)
!791 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !756, file: !756, line: 255, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !793, file: !757, line: 745)
!793 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !756, file: !756, line: 258, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !795, file: !757, line: 746)
!795 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !756, file: !756, line: 264, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !797, file: !757, line: 747)
!797 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !756, file: !756, line: 267, type: !169, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !799, file: !757, line: 748)
!799 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !756, file: !756, line: 272, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !801, file: !757, line: 749)
!801 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !756, file: !756, line: 275, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !803, file: !757, line: 750)
!803 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !756, file: !756, line: 278, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !805, file: !757, line: 751)
!805 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !756, file: !756, line: 281, type: !654, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !807, file: !757, line: 752)
!807 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !756, file: !756, line: 294, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !809, file: !757, line: 753)
!809 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !756, file: !756, line: 297, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !811, file: !757, line: 754)
!811 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !756, file: !756, line: 336, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !813, file: !757, line: 755)
!813 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !756, file: !756, line: 339, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !815, file: !757, line: 756)
!815 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !756, file: !756, line: 342, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !817, file: !757, line: 757)
!817 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !756, file: !756, line: 345, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !819, file: !757, line: 758)
!819 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !756, file: !756, line: 348, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !821, file: !757, line: 759)
!821 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !756, file: !756, line: 351, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !823, file: !757, line: 760)
!823 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !756, file: !756, line: 354, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !825, file: !757, line: 761)
!825 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !756, file: !756, line: 360, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !827, file: !757, line: 762)
!827 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !756, file: !756, line: 363, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !829, file: !757, line: 763)
!829 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !756, file: !756, line: 366, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !831, file: !757, line: 764)
!831 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !756, file: !756, line: 369, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !833, file: !757, line: 765)
!833 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !756, file: !756, line: 372, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !835, file: !757, line: 766)
!835 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !756, file: !756, line: 408, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !837, file: !757, line: 767)
!837 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !756, file: !756, line: 411, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !839, file: !757, line: 769)
!839 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !756, file: !756, line: 444, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !841, file: !757, line: 770)
!841 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !756, file: !756, line: 469, type: !127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !843, file: !757, line: 771)
!843 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !756, file: !756, line: 474, type: !316, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !845, file: !757, line: 772)
!845 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !756, file: !756, line: 490, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !847, file: !757, line: 773)
!847 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !756, file: !756, line: 515, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !849, file: !757, line: 774)
!849 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !756, file: !756, line: 521, type: !340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !851, file: !757, line: 775)
!851 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !756, file: !756, line: 527, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !853, file: !757, line: 776)
!853 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !756, file: !756, line: 555, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !855, file: !757, line: 777)
!855 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !756, file: !756, line: 558, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !857, file: !757, line: 778)
!857 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !756, file: !756, line: 564, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !859, file: !757, line: 779)
!859 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !756, file: !756, line: 567, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !861, file: !757, line: 780)
!861 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !756, file: !756, line: 570, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !863, file: !757, line: 781)
!863 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !756, file: !756, line: 573, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !865, file: !757, line: 782)
!865 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !756, file: !756, line: 576, type: !98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !867, file: !868, line: 68)
!867 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !869, file: !868, line: 90, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!868 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "e8a32dcadc5d06d341e371fb480b7b44")
!869 = !DINamespace(name: "__exception_ptr", scope: !22)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !869, entity: !871, file: !868, line: 84)
!871 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !22, file: !868, line: 80, type: !872, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!872 = !DISubroutineType(types: !873)
!873 = !{null, !867}
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !875, file: !890, line: 64)
!875 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !876, line: 6, baseType: !877)
!876 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!877 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !878, line: 21, baseType: !879)
!878 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!879 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !878, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !880, identifier: "_ZTS11__mbstate_t")
!880 = !{!881, !882}
!881 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !879, file: !878, line: 15, baseType: !27, size: 32)
!882 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !879, file: !878, line: 20, baseType: !883, size: 32, offset: 32)
!883 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !879, file: !878, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !884, identifier: "_ZTSN11__mbstate_tUt_E")
!884 = !{!885, !886}
!885 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !883, file: !878, line: 18, baseType: !5, size: 32)
!886 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !883, file: !878, line: 19, baseType: !887, size: 32)
!887 = !DICompositeType(tag: DW_TAG_array_type, baseType: !273, size: 32, elements: !888)
!888 = !{!889}
!889 = !DISubrange(count: 4)
!890 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cwchar", directory: "")
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !892, file: !890, line: 141)
!892 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !893, line: 20, baseType: !5)
!893 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !895, file: !890, line: 143)
!895 = !DISubprogram(name: "btowc", scope: !896, file: !896, line: 319, type: !897, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!896 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "484b7adbbc849bb51cdbcb2d985b07a0")
!897 = !DISubroutineType(types: !898)
!898 = !{!892, !27}
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !900, file: !890, line: 144)
!900 = !DISubprogram(name: "fgetwc", scope: !896, file: !896, line: 744, type: !901, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!901 = !DISubroutineType(types: !902)
!902 = !{!892, !903}
!903 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !904, size: 64)
!904 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !905, line: 5, baseType: !906)
!905 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!906 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !907, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !908, identifier: "_ZTS8_IO_FILE")
!907 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!908 = !{!909, !910, !911, !912, !913, !914, !915, !916, !917, !918, !919, !920, !921, !924, !926, !927, !928, !930, !932, !934, !938, !941, !943, !946, !949, !950, !951, !952, !953}
!909 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !906, file: !907, line: 51, baseType: !27, size: 32)
!910 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !906, file: !907, line: 54, baseType: !441, size: 64, offset: 64)
!911 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !906, file: !907, line: 55, baseType: !441, size: 64, offset: 128)
!912 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !906, file: !907, line: 56, baseType: !441, size: 64, offset: 192)
!913 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !906, file: !907, line: 57, baseType: !441, size: 64, offset: 256)
!914 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !906, file: !907, line: 58, baseType: !441, size: 64, offset: 320)
!915 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !906, file: !907, line: 59, baseType: !441, size: 64, offset: 384)
!916 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !906, file: !907, line: 60, baseType: !441, size: 64, offset: 448)
!917 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !906, file: !907, line: 61, baseType: !441, size: 64, offset: 512)
!918 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !906, file: !907, line: 64, baseType: !441, size: 64, offset: 576)
!919 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !906, file: !907, line: 65, baseType: !441, size: 64, offset: 640)
!920 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !906, file: !907, line: 66, baseType: !441, size: 64, offset: 704)
!921 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !906, file: !907, line: 68, baseType: !922, size: 64, offset: 768)
!922 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !923, size: 64)
!923 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !907, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!924 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !906, file: !907, line: 70, baseType: !925, size: 64, offset: 832)
!925 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !906, size: 64)
!926 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !906, file: !907, line: 72, baseType: !27, size: 32, offset: 896)
!927 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !906, file: !907, line: 73, baseType: !27, size: 32, offset: 928)
!928 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !906, file: !907, line: 74, baseType: !929, size: 64, offset: 960)
!929 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !13, line: 152, baseType: !252)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !906, file: !907, line: 77, baseType: !931, size: 16, offset: 1024)
!931 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !906, file: !907, line: 78, baseType: !933, size: 8, offset: 1040)
!933 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!934 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !906, file: !907, line: 79, baseType: !935, size: 8, offset: 1048)
!935 = !DICompositeType(tag: DW_TAG_array_type, baseType: !273, size: 8, elements: !936)
!936 = !{!937}
!937 = !DISubrange(count: 1)
!938 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !906, file: !907, line: 81, baseType: !939, size: 64, offset: 1088)
!939 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !940, size: 64)
!940 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !907, line: 43, baseType: null)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !906, file: !907, line: 89, baseType: !942, size: 64, offset: 1152)
!942 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !13, line: 153, baseType: !252)
!943 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !906, file: !907, line: 91, baseType: !944, size: 64, offset: 1216)
!944 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !945, size: 64)
!945 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !907, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!946 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !906, file: !907, line: 92, baseType: !947, size: 64, offset: 1280)
!947 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !948, size: 64)
!948 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !907, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!949 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !906, file: !907, line: 93, baseType: !925, size: 64, offset: 1344)
!950 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !906, file: !907, line: 94, baseType: !390, size: 64, offset: 1408)
!951 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !906, file: !907, line: 95, baseType: !391, size: 64, offset: 1472)
!952 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !906, file: !907, line: 96, baseType: !27, size: 32, offset: 1536)
!953 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !906, file: !907, line: 98, baseType: !954, size: 160, offset: 1568)
!954 = !DICompositeType(tag: DW_TAG_array_type, baseType: !273, size: 160, elements: !955)
!955 = !{!956}
!956 = !DISubrange(count: 20)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !958, file: !890, line: 145)
!958 = !DISubprogram(name: "fgetws", scope: !896, file: !896, line: 773, type: !959, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!959 = !DISubroutineType(types: !960)
!960 = !{!463, !462, !27, !961}
!961 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !903)
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !963, file: !890, line: 146)
!963 = !DISubprogram(name: "fputwc", scope: !896, file: !896, line: 758, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!964 = !DISubroutineType(types: !965)
!965 = !{!892, !464, !903}
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !967, file: !890, line: 147)
!967 = !DISubprogram(name: "fputws", scope: !896, file: !896, line: 780, type: !968, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!968 = !DISubroutineType(types: !969)
!969 = !{!27, !509, !961}
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !971, file: !890, line: 148)
!971 = !DISubprogram(name: "fwide", scope: !896, file: !896, line: 588, type: !972, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!972 = !DISubroutineType(types: !973)
!973 = !{!27, !903, !27}
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !975, file: !890, line: 149)
!975 = !DISubprogram(name: "fwprintf", scope: !896, file: !896, line: 595, type: !976, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!976 = !DISubroutineType(types: !977)
!977 = !{!27, !961, !509, null}
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !979, file: !890, line: 150)
!979 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !896, file: !896, line: 657, type: !976, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !981, file: !890, line: 151)
!981 = !DISubprogram(name: "getwc", scope: !896, file: !896, line: 745, type: !901, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !983, file: !890, line: 152)
!983 = !DISubprogram(name: "getwchar", scope: !896, file: !896, line: 751, type: !984, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!984 = !DISubroutineType(types: !985)
!985 = !{!892}
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !987, file: !890, line: 153)
!987 = !DISubprogram(name: "mbrlen", scope: !896, file: !896, line: 330, type: !988, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!988 = !DISubroutineType(types: !989)
!989 = !{!391, !465, !391, !990}
!990 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !991)
!991 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !875, size: 64)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !993, file: !890, line: 154)
!993 = !DISubprogram(name: "mbrtowc", scope: !896, file: !896, line: 297, type: !994, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!994 = !DISubroutineType(types: !995)
!995 = !{!391, !462, !465, !391, !990}
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !997, file: !890, line: 155)
!997 = !DISubprogram(name: "mbsinit", scope: !896, file: !896, line: 293, type: !998, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!998 = !DISubroutineType(types: !999)
!999 = !{!27, !1000}
!1000 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1001, size: 64)
!1001 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !875)
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1003, file: !890, line: 156)
!1003 = !DISubprogram(name: "mbsrtowcs", scope: !896, file: !896, line: 338, type: !1004, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1004 = !DISubroutineType(types: !1005)
!1005 = !{!391, !462, !1006, !391, !990}
!1006 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1007)
!1007 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1009, file: !890, line: 157)
!1009 = !DISubprogram(name: "putwc", scope: !896, file: !896, line: 759, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1011, file: !890, line: 158)
!1011 = !DISubprogram(name: "putwchar", scope: !896, file: !896, line: 765, type: !1012, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!892, !464}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1015, file: !890, line: 160)
!1015 = !DISubprogram(name: "swprintf", scope: !896, file: !896, line: 605, type: !1016, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!27, !462, !391, !509, null}
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1019, file: !890, line: 162)
!1019 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !896, file: !896, line: 664, type: !1020, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1020 = !DISubroutineType(types: !1021)
!1021 = !{!27, !509, !509, null}
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1023, file: !890, line: 163)
!1023 = !DISubprogram(name: "ungetwc", scope: !896, file: !896, line: 788, type: !1024, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{!892, !892, !903}
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1027, file: !890, line: 164)
!1027 = !DISubprogram(name: "vfwprintf", scope: !896, file: !896, line: 613, type: !1028, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1028 = !DISubroutineType(types: !1029)
!1029 = !{!27, !961, !509, !1030}
!1030 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1031, line: 14, baseType: !1032)
!1031 = !DIFile(filename: "/opt/rocm-5.6.0/llvm/lib/clang/16.0.0/include/stdarg.h", directory: "", checksumkind: CSK_MD5, checksum: "4c819f80dd915987182e9ab226e27a5a")
!1032 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1033, baseType: !441)
!1033 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/home/oster/repos/scabbard")
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1035, file: !890, line: 166)
!1035 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !896, file: !896, line: 711, type: !1028, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1036 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1037, file: !890, line: 169)
!1037 = !DISubprogram(name: "vswprintf", scope: !896, file: !896, line: 626, type: !1038, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1038 = !DISubroutineType(types: !1039)
!1039 = !{!27, !462, !391, !509, !1030}
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1041, file: !890, line: 172)
!1041 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !896, file: !896, line: 718, type: !1042, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!27, !509, !509, !1030}
!1044 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1045, file: !890, line: 174)
!1045 = !DISubprogram(name: "vwprintf", scope: !896, file: !896, line: 621, type: !1046, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1046 = !DISubroutineType(types: !1047)
!1047 = !{!27, !509, !1030}
!1048 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1049, file: !890, line: 176)
!1049 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !896, file: !896, line: 715, type: !1046, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1051, file: !890, line: 178)
!1051 = !DISubprogram(name: "wcrtomb", scope: !896, file: !896, line: 302, type: !1052, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1052 = !DISubroutineType(types: !1053)
!1053 = !{!391, !508, !464, !990}
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1055, file: !890, line: 179)
!1055 = !DISubprogram(name: "wcscat", scope: !896, file: !896, line: 97, type: !1056, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1056 = !DISubroutineType(types: !1057)
!1057 = !{!463, !462, !509}
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1059, file: !890, line: 180)
!1059 = !DISubprogram(name: "wcscmp", scope: !896, file: !896, line: 106, type: !1060, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1060 = !DISubroutineType(types: !1061)
!1061 = !{!27, !510, !510}
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1063, file: !890, line: 181)
!1063 = !DISubprogram(name: "wcscoll", scope: !896, file: !896, line: 131, type: !1060, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1065, file: !890, line: 182)
!1065 = !DISubprogram(name: "wcscpy", scope: !896, file: !896, line: 87, type: !1056, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1067, file: !890, line: 183)
!1067 = !DISubprogram(name: "wcscspn", scope: !896, file: !896, line: 188, type: !1068, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1068 = !DISubroutineType(types: !1069)
!1069 = !{!391, !510, !510}
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1071, file: !890, line: 184)
!1071 = !DISubprogram(name: "wcsftime", scope: !896, file: !896, line: 852, type: !1072, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!391, !462, !391, !509, !1074}
!1074 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1075)
!1075 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1076, size: 64)
!1076 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1077)
!1077 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1078, line: 7, size: 448, flags: DIFlagTypePassByValue, elements: !1079, identifier: "_ZTS2tm")
!1078 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!1079 = !{!1080, !1081, !1082, !1083, !1084, !1085, !1086, !1087, !1088, !1089, !1090}
!1080 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !1077, file: !1078, line: 9, baseType: !27, size: 32)
!1081 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !1077, file: !1078, line: 10, baseType: !27, size: 32, offset: 32)
!1082 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !1077, file: !1078, line: 11, baseType: !27, size: 32, offset: 64)
!1083 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !1077, file: !1078, line: 12, baseType: !27, size: 32, offset: 96)
!1084 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !1077, file: !1078, line: 13, baseType: !27, size: 32, offset: 128)
!1085 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !1077, file: !1078, line: 14, baseType: !27, size: 32, offset: 160)
!1086 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !1077, file: !1078, line: 15, baseType: !27, size: 32, offset: 192)
!1087 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !1077, file: !1078, line: 16, baseType: !27, size: 32, offset: 224)
!1088 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !1077, file: !1078, line: 17, baseType: !27, size: 32, offset: 256)
!1089 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !1077, file: !1078, line: 20, baseType: !252, size: 64, offset: 320)
!1090 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !1077, file: !1078, line: 21, baseType: !271, size: 64, offset: 384)
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1092, file: !890, line: 185)
!1092 = !DISubprogram(name: "wcslen", scope: !896, file: !896, line: 223, type: !1093, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1093 = !DISubroutineType(types: !1094)
!1094 = !{!391, !510}
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1096, file: !890, line: 186)
!1096 = !DISubprogram(name: "wcsncat", scope: !896, file: !896, line: 101, type: !1097, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1097 = !DISubroutineType(types: !1098)
!1098 = !{!463, !462, !509, !391}
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1100, file: !890, line: 187)
!1100 = !DISubprogram(name: "wcsncmp", scope: !896, file: !896, line: 109, type: !1101, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1101 = !DISubroutineType(types: !1102)
!1102 = !{!27, !510, !510, !391}
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1104, file: !890, line: 188)
!1104 = !DISubprogram(name: "wcsncpy", scope: !896, file: !896, line: 92, type: !1097, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1106, file: !890, line: 189)
!1106 = !DISubprogram(name: "wcsrtombs", scope: !896, file: !896, line: 344, type: !1107, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{!391, !508, !1109, !391, !990}
!1109 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1110)
!1110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !510, size: 64)
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1112, file: !890, line: 190)
!1112 = !DISubprogram(name: "wcsspn", scope: !896, file: !896, line: 192, type: !1068, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1114, file: !890, line: 191)
!1114 = !DISubprogram(name: "wcstod", scope: !896, file: !896, line: 378, type: !1115, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{!34, !509, !1117}
!1117 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1118)
!1118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !463, size: 64)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1120, file: !890, line: 193)
!1120 = !DISubprogram(name: "wcstof", scope: !896, file: !896, line: 383, type: !1121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!93, !509, !1117}
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1124, file: !890, line: 195)
!1124 = !DISubprogram(name: "wcstok", scope: !896, file: !896, line: 218, type: !1125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1125 = !DISubroutineType(types: !1126)
!1126 = !{!463, !462, !509, !1117}
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1128, file: !890, line: 196)
!1128 = !DISubprogram(name: "wcstol", scope: !896, file: !896, line: 429, type: !1129, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!252, !509, !1117, !27}
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1132, file: !890, line: 197)
!1132 = !DISubprogram(name: "wcstoul", scope: !896, file: !896, line: 434, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1133 = !DISubroutineType(types: !1134)
!1134 = !{!393, !509, !1117, !27}
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1136, file: !890, line: 198)
!1136 = !DISubprogram(name: "wcsxfrm", scope: !896, file: !896, line: 135, type: !1137, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{!391, !462, !509, !391}
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1140, file: !890, line: 199)
!1140 = !DISubprogram(name: "wctob", scope: !896, file: !896, line: 325, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!27, !892}
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1144, file: !890, line: 200)
!1144 = !DISubprogram(name: "wmemcmp", scope: !896, file: !896, line: 259, type: !1101, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1146, file: !890, line: 201)
!1146 = !DISubprogram(name: "wmemcpy", scope: !896, file: !896, line: 263, type: !1097, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1148, file: !890, line: 202)
!1148 = !DISubprogram(name: "wmemmove", scope: !896, file: !896, line: 268, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!463, !463, !510, !391}
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1152, file: !890, line: 203)
!1152 = !DISubprogram(name: "wmemset", scope: !896, file: !896, line: 272, type: !1153, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{!463, !463, !464, !391}
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1156, file: !890, line: 204)
!1156 = !DISubprogram(name: "wprintf", scope: !896, file: !896, line: 602, type: !1157, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1157 = !DISubroutineType(types: !1158)
!1158 = !{!27, !509, null}
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1160, file: !890, line: 205)
!1160 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !896, file: !896, line: 661, type: !1157, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1162, file: !890, line: 206)
!1162 = !DISubprogram(name: "wcschr", scope: !896, file: !896, line: 165, type: !1163, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1163 = !DISubroutineType(types: !1164)
!1164 = !{!463, !510, !464}
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1166, file: !890, line: 207)
!1166 = !DISubprogram(name: "wcspbrk", scope: !896, file: !896, line: 202, type: !1167, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1167 = !DISubroutineType(types: !1168)
!1168 = !{!463, !510, !510}
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1170, file: !890, line: 208)
!1170 = !DISubprogram(name: "wcsrchr", scope: !896, file: !896, line: 175, type: !1163, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1172, file: !890, line: 209)
!1172 = !DISubprogram(name: "wcsstr", scope: !896, file: !896, line: 213, type: !1167, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1174, file: !890, line: 210)
!1174 = !DISubprogram(name: "wmemchr", scope: !896, file: !896, line: 254, type: !1175, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1175 = !DISubroutineType(types: !1176)
!1176 = !{!463, !510, !464, !391}
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1178, file: !890, line: 251)
!1178 = !DISubprogram(name: "wcstold", scope: !896, file: !896, line: 385, type: !1179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1179 = !DISubroutineType(types: !1180)
!1180 = !{!104, !509, !1117}
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1182, file: !890, line: 260)
!1182 = !DISubprogram(name: "wcstoll", scope: !896, file: !896, line: 442, type: !1183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1183 = !DISubroutineType(types: !1184)
!1184 = !{!215, !509, !1117, !27}
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1186, file: !890, line: 261)
!1186 = !DISubprogram(name: "wcstoull", scope: !896, file: !896, line: 449, type: !1187, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1187 = !DISubroutineType(types: !1188)
!1188 = !{!545, !509, !1117, !27}
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1178, file: !890, line: 267)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1182, file: !890, line: 268)
!1191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1186, file: !890, line: 269)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1120, file: !890, line: 283)
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1035, file: !890, line: 286)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1041, file: !890, line: 289)
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1049, file: !890, line: 292)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1178, file: !890, line: 296)
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1182, file: !890, line: 297)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1186, file: !890, line: 298)
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1200, file: !1203, line: 47)
!1200 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1201, line: 24, baseType: !1202)
!1201 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!1202 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !13, line: 37, baseType: !933)
!1203 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdint", directory: "")
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1205, file: !1203, line: 48)
!1205 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1201, line: 25, baseType: !1206)
!1206 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !13, line: 39, baseType: !1207)
!1207 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1209, file: !1203, line: 49)
!1209 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1201, line: 26, baseType: !1210)
!1210 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !13, line: 41, baseType: !27)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1212, file: !1203, line: 50)
!1212 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1201, line: 27, baseType: !1213)
!1213 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !13, line: 44, baseType: !252)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1215, file: !1203, line: 52)
!1215 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1216, line: 58, baseType: !933)
!1216 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1218, file: !1203, line: 53)
!1218 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1216, line: 60, baseType: !252)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1220, file: !1203, line: 54)
!1220 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1216, line: 61, baseType: !252)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1222, file: !1203, line: 55)
!1222 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1216, line: 62, baseType: !252)
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1224, file: !1203, line: 57)
!1224 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1216, line: 43, baseType: !1225)
!1225 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !13, line: 52, baseType: !1202)
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1227, file: !1203, line: 58)
!1227 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1216, line: 44, baseType: !1228)
!1228 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !13, line: 54, baseType: !1206)
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1230, file: !1203, line: 59)
!1230 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1216, line: 45, baseType: !1231)
!1231 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !13, line: 56, baseType: !1210)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1233, file: !1203, line: 60)
!1233 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1216, line: 46, baseType: !1234)
!1234 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !13, line: 58, baseType: !1213)
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1236, file: !1203, line: 62)
!1236 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1216, line: 101, baseType: !1237)
!1237 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !13, line: 72, baseType: !252)
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1239, file: !1203, line: 63)
!1239 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1216, line: 87, baseType: !252)
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1241, file: !1203, line: 65)
!1241 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !11, line: 24, baseType: !1242)
!1242 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !13, line: 38, baseType: !1243)
!1243 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1245, file: !1203, line: 66)
!1245 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !11, line: 25, baseType: !1246)
!1246 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !13, line: 40, baseType: !931)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !10, file: !1203, line: 67)
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1249, file: !1203, line: 68)
!1249 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !11, line: 27, baseType: !1250)
!1250 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !13, line: 45, baseType: !393)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1252, file: !1203, line: 70)
!1252 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1216, line: 71, baseType: !1243)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1254, file: !1203, line: 71)
!1254 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1216, line: 73, baseType: !393)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1256, file: !1203, line: 72)
!1256 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1216, line: 74, baseType: !393)
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1258, file: !1203, line: 73)
!1258 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1216, line: 75, baseType: !393)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1260, file: !1203, line: 75)
!1260 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1216, line: 49, baseType: !1261)
!1261 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !13, line: 53, baseType: !1242)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1263, file: !1203, line: 76)
!1263 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1216, line: 50, baseType: !1264)
!1264 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !13, line: 55, baseType: !1246)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1266, file: !1203, line: 77)
!1266 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1216, line: 51, baseType: !1267)
!1267 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !13, line: 57, baseType: !12)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1269, file: !1203, line: 78)
!1269 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1216, line: 52, baseType: !1270)
!1270 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !13, line: 59, baseType: !1250)
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1272, file: !1203, line: 80)
!1272 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1216, line: 102, baseType: !1273)
!1273 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !13, line: 73, baseType: !393)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1275, file: !1203, line: 81)
!1275 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1216, line: 90, baseType: !393)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1277, file: !1279, line: 53)
!1277 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1278, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1278 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a1d177e0f311dc60a74cb347049d75bc")
!1279 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/clocale", directory: "")
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1281, file: !1279, line: 54)
!1281 = !DISubprogram(name: "setlocale", scope: !1278, file: !1278, line: 122, type: !1282, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1282 = !DISubroutineType(types: !1283)
!1283 = !{!441, !27, !271}
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1285, file: !1279, line: 55)
!1285 = !DISubprogram(name: "localeconv", scope: !1278, file: !1278, line: 125, type: !1286, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!1288}
!1288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1277, size: 64)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1290, file: !1292, line: 64)
!1290 = !DISubprogram(name: "isalnum", scope: !1291, file: !1291, line: 108, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1291 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "3ab3dd7fdf2578005732722ee2393e59")
!1292 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cctype", directory: "")
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1294, file: !1292, line: 65)
!1294 = !DISubprogram(name: "isalpha", scope: !1291, file: !1291, line: 109, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1296, file: !1292, line: 66)
!1296 = !DISubprogram(name: "iscntrl", scope: !1291, file: !1291, line: 110, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1298, file: !1292, line: 67)
!1298 = !DISubprogram(name: "isdigit", scope: !1291, file: !1291, line: 111, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1300, file: !1292, line: 68)
!1300 = !DISubprogram(name: "isgraph", scope: !1291, file: !1291, line: 113, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1302, file: !1292, line: 69)
!1302 = !DISubprogram(name: "islower", scope: !1291, file: !1291, line: 112, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1304, file: !1292, line: 70)
!1304 = !DISubprogram(name: "isprint", scope: !1291, file: !1291, line: 114, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1306, file: !1292, line: 71)
!1306 = !DISubprogram(name: "ispunct", scope: !1291, file: !1291, line: 115, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1308, file: !1292, line: 72)
!1308 = !DISubprogram(name: "isspace", scope: !1291, file: !1291, line: 116, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1310, file: !1292, line: 73)
!1310 = !DISubprogram(name: "isupper", scope: !1291, file: !1291, line: 117, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1312, file: !1292, line: 74)
!1312 = !DISubprogram(name: "isxdigit", scope: !1291, file: !1291, line: 118, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1314, file: !1292, line: 75)
!1314 = !DISubprogram(name: "tolower", scope: !1291, file: !1291, line: 122, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1316, file: !1292, line: 76)
!1316 = !DISubprogram(name: "toupper", scope: !1291, file: !1291, line: 125, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1318, file: !1292, line: 87)
!1318 = !DISubprogram(name: "isblank", scope: !1291, file: !1291, line: 130, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1320, file: !1322, line: 98)
!1320 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1321, line: 7, baseType: !906)
!1321 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1322 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdio", directory: "")
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1324, file: !1322, line: 99)
!1324 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1325, line: 84, baseType: !1326)
!1325 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!1326 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1327, line: 14, baseType: !1328)
!1327 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1328 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1327, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1330, file: !1322, line: 101)
!1330 = !DISubprogram(name: "clearerr", scope: !1325, file: !1325, line: 786, type: !1331, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1331 = !DISubroutineType(types: !1332)
!1332 = !{null, !1333}
!1333 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1320, size: 64)
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1335, file: !1322, line: 102)
!1335 = !DISubprogram(name: "fclose", scope: !1325, file: !1325, line: 178, type: !1336, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1336 = !DISubroutineType(types: !1337)
!1337 = !{!27, !1333}
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1339, file: !1322, line: 103)
!1339 = !DISubprogram(name: "feof", scope: !1325, file: !1325, line: 788, type: !1336, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1341, file: !1322, line: 104)
!1341 = !DISubprogram(name: "ferror", scope: !1325, file: !1325, line: 790, type: !1336, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1343, file: !1322, line: 105)
!1343 = !DISubprogram(name: "fflush", scope: !1325, file: !1325, line: 230, type: !1336, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1345, file: !1322, line: 106)
!1345 = !DISubprogram(name: "fgetc", scope: !1325, file: !1325, line: 513, type: !1336, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1347, file: !1322, line: 107)
!1347 = !DISubprogram(name: "fgetpos", scope: !1325, file: !1325, line: 760, type: !1348, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1348 = !DISubroutineType(types: !1349)
!1349 = !{!27, !1350, !1351}
!1350 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1333)
!1351 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1352)
!1352 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1324, size: 64)
!1353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1354, file: !1322, line: 108)
!1354 = !DISubprogram(name: "fgets", scope: !1325, file: !1325, line: 592, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1355 = !DISubroutineType(types: !1356)
!1356 = !{!441, !508, !27, !1350}
!1357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1358, file: !1322, line: 109)
!1358 = !DISubprogram(name: "fopen", scope: !1325, file: !1325, line: 258, type: !1359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1359 = !DISubroutineType(types: !1360)
!1360 = !{!1333, !465, !465}
!1361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1362, file: !1322, line: 110)
!1362 = !DISubprogram(name: "fprintf", scope: !1325, file: !1325, line: 350, type: !1363, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1363 = !DISubroutineType(types: !1364)
!1364 = !{!27, !1350, !465, null}
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1366, file: !1322, line: 111)
!1366 = !DISubprogram(name: "fputc", scope: !1325, file: !1325, line: 549, type: !1367, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1367 = !DISubroutineType(types: !1368)
!1368 = !{!27, !27, !1333}
!1369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1370, file: !1322, line: 112)
!1370 = !DISubprogram(name: "fputs", scope: !1325, file: !1325, line: 655, type: !1371, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1371 = !DISubroutineType(types: !1372)
!1372 = !{!27, !465, !1350}
!1373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1374, file: !1322, line: 113)
!1374 = !DISubprogram(name: "fread", scope: !1325, file: !1325, line: 675, type: !1375, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1375 = !DISubroutineType(types: !1376)
!1376 = !{!391, !1377, !391, !391, !1350}
!1377 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !390)
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1379, file: !1322, line: 114)
!1379 = !DISubprogram(name: "freopen", scope: !1325, file: !1325, line: 265, type: !1380, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1380 = !DISubroutineType(types: !1381)
!1381 = !{!1333, !465, !465, !1350}
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1383, file: !1322, line: 115)
!1383 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !1325, file: !1325, line: 434, type: !1363, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1385, file: !1322, line: 116)
!1385 = !DISubprogram(name: "fseek", scope: !1325, file: !1325, line: 713, type: !1386, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1386 = !DISubroutineType(types: !1387)
!1387 = !{!27, !1333, !252, !27}
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1389, file: !1322, line: 117)
!1389 = !DISubprogram(name: "fsetpos", scope: !1325, file: !1325, line: 765, type: !1390, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1390 = !DISubroutineType(types: !1391)
!1391 = !{!27, !1333, !1392}
!1392 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1393, size: 64)
!1393 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1324)
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1395, file: !1322, line: 118)
!1395 = !DISubprogram(name: "ftell", scope: !1325, file: !1325, line: 718, type: !1396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1396 = !DISubroutineType(types: !1397)
!1397 = !{!252, !1333}
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1399, file: !1322, line: 119)
!1399 = !DISubprogram(name: "fwrite", scope: !1325, file: !1325, line: 681, type: !1400, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1400 = !DISubroutineType(types: !1401)
!1401 = !{!391, !1402, !391, !391, !1350}
!1402 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !417)
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1404, file: !1322, line: 120)
!1404 = !DISubprogram(name: "getc", scope: !1325, file: !1325, line: 514, type: !1336, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1406, file: !1322, line: 121)
!1406 = !DISubprogram(name: "getchar", scope: !1407, file: !1407, line: 47, type: !478, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1407 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c10e343656e7a2bf1044ef4e4442d902")
!1408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1409, file: !1322, line: 126)
!1409 = !DISubprogram(name: "perror", scope: !1325, file: !1325, line: 804, type: !1410, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1410 = !DISubroutineType(types: !1411)
!1411 = !{null, !271}
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1413, file: !1322, line: 127)
!1413 = !DISubprogram(name: "printf", scope: !1325, file: !1325, line: 356, type: !1414, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1414 = !DISubroutineType(types: !1415)
!1415 = !{!27, !465, null}
!1416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1417, file: !1322, line: 128)
!1417 = !DISubprogram(name: "putc", scope: !1325, file: !1325, line: 550, type: !1367, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1419, file: !1322, line: 129)
!1419 = !DISubprogram(name: "putchar", scope: !1407, file: !1407, line: 82, type: !25, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1421, file: !1322, line: 130)
!1421 = !DISubprogram(name: "puts", scope: !1325, file: !1325, line: 661, type: !406, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1423, file: !1322, line: 131)
!1423 = !DISubprogram(name: "remove", scope: !1325, file: !1325, line: 152, type: !406, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1425, file: !1322, line: 132)
!1425 = !DISubprogram(name: "rename", scope: !1325, file: !1325, line: 154, type: !1426, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1426 = !DISubroutineType(types: !1427)
!1427 = !{!27, !271, !271}
!1428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1429, file: !1322, line: 133)
!1429 = !DISubprogram(name: "rewind", scope: !1325, file: !1325, line: 723, type: !1331, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1431, file: !1322, line: 134)
!1431 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !1325, file: !1325, line: 437, type: !1414, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1433, file: !1322, line: 135)
!1433 = !DISubprogram(name: "setbuf", scope: !1325, file: !1325, line: 328, type: !1434, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1434 = !DISubroutineType(types: !1435)
!1435 = !{null, !1350, !508}
!1436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1437, file: !1322, line: 136)
!1437 = !DISubprogram(name: "setvbuf", scope: !1325, file: !1325, line: 332, type: !1438, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1438 = !DISubroutineType(types: !1439)
!1439 = !{!27, !1350, !508, !27, !391}
!1440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1441, file: !1322, line: 137)
!1441 = !DISubprogram(name: "sprintf", scope: !1325, file: !1325, line: 358, type: !1442, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1442 = !DISubroutineType(types: !1443)
!1443 = !{!27, !508, !465, null}
!1444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1445, file: !1322, line: 138)
!1445 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !1325, file: !1325, line: 439, type: !1446, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1446 = !DISubroutineType(types: !1447)
!1447 = !{!27, !465, !465, null}
!1448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1449, file: !1322, line: 139)
!1449 = !DISubprogram(name: "tmpfile", scope: !1325, file: !1325, line: 188, type: !1450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1450 = !DISubroutineType(types: !1451)
!1451 = !{!1333}
!1452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1453, file: !1322, line: 141)
!1453 = !DISubprogram(name: "tmpnam", scope: !1325, file: !1325, line: 205, type: !1454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1454 = !DISubroutineType(types: !1455)
!1455 = !{!441, !441}
!1456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1457, file: !1322, line: 143)
!1457 = !DISubprogram(name: "ungetc", scope: !1325, file: !1325, line: 668, type: !1367, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1459, file: !1322, line: 144)
!1459 = !DISubprogram(name: "vfprintf", scope: !1325, file: !1325, line: 365, type: !1460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1460 = !DISubroutineType(types: !1461)
!1461 = !{!27, !1350, !465, !1030}
!1462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1463, file: !1322, line: 145)
!1463 = !DISubprogram(name: "vprintf", scope: !1407, file: !1407, line: 39, type: !1464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1464 = !DISubroutineType(types: !1465)
!1465 = !{!27, !465, !1030}
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1467, file: !1322, line: 146)
!1467 = !DISubprogram(name: "vsprintf", scope: !1325, file: !1325, line: 373, type: !1468, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1468 = !DISubroutineType(types: !1469)
!1469 = !{!27, !508, !465, !1030}
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1471, file: !1322, line: 175)
!1471 = !DISubprogram(name: "snprintf", scope: !1325, file: !1325, line: 378, type: !1472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1472 = !DISubroutineType(types: !1473)
!1473 = !{!27, !508, !391, !465, null}
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1475, file: !1322, line: 176)
!1475 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !1325, file: !1325, line: 479, type: !1460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1477, file: !1322, line: 177)
!1477 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !1325, file: !1325, line: 484, type: !1464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1479, file: !1322, line: 178)
!1479 = !DISubprogram(name: "vsnprintf", scope: !1325, file: !1325, line: 382, type: !1480, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1480 = !DISubroutineType(types: !1481)
!1481 = !{!27, !508, !391, !465, !1030}
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1483, file: !1322, line: 179)
!1483 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !1325, file: !1325, line: 487, type: !1484, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1484 = !DISubroutineType(types: !1485)
!1485 = !{!27, !465, !465, !1030}
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1471, file: !1322, line: 185)
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1475, file: !1322, line: 186)
!1488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1477, file: !1322, line: 187)
!1489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1479, file: !1322, line: 188)
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1483, file: !1322, line: 189)
!1491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1492, file: !1496, line: 82)
!1492 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1493, line: 48, baseType: !1494)
!1493 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "9bcd8e8b8cd2078c8a6c42e262af7d7b")
!1494 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1495, size: 64)
!1495 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1210)
!1496 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cwctype", directory: "")
!1497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1498, file: !1496, line: 83)
!1498 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1499, line: 38, baseType: !393)
!1499 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "48fed714a84c77fca0455b433489fc47")
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !892, file: !1496, line: 84)
!1501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1502, file: !1496, line: 86)
!1502 = !DISubprogram(name: "iswalnum", scope: !1499, file: !1499, line: 95, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1504, file: !1496, line: 87)
!1504 = !DISubprogram(name: "iswalpha", scope: !1499, file: !1499, line: 101, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1506, file: !1496, line: 89)
!1506 = !DISubprogram(name: "iswblank", scope: !1499, file: !1499, line: 146, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1508, file: !1496, line: 91)
!1508 = !DISubprogram(name: "iswcntrl", scope: !1499, file: !1499, line: 104, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1510, file: !1496, line: 92)
!1510 = !DISubprogram(name: "iswctype", scope: !1499, file: !1499, line: 159, type: !1511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1511 = !DISubroutineType(types: !1512)
!1512 = !{!27, !892, !1498}
!1513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1514, file: !1496, line: 93)
!1514 = !DISubprogram(name: "iswdigit", scope: !1499, file: !1499, line: 108, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1516, file: !1496, line: 94)
!1516 = !DISubprogram(name: "iswgraph", scope: !1499, file: !1499, line: 112, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1518, file: !1496, line: 95)
!1518 = !DISubprogram(name: "iswlower", scope: !1499, file: !1499, line: 117, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1520, file: !1496, line: 96)
!1520 = !DISubprogram(name: "iswprint", scope: !1499, file: !1499, line: 120, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1522, file: !1496, line: 97)
!1522 = !DISubprogram(name: "iswpunct", scope: !1499, file: !1499, line: 125, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1524, file: !1496, line: 98)
!1524 = !DISubprogram(name: "iswspace", scope: !1499, file: !1499, line: 130, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1526, file: !1496, line: 99)
!1526 = !DISubprogram(name: "iswupper", scope: !1499, file: !1499, line: 135, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1528, file: !1496, line: 100)
!1528 = !DISubprogram(name: "iswxdigit", scope: !1499, file: !1499, line: 140, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1530, file: !1496, line: 101)
!1530 = !DISubprogram(name: "towctrans", scope: !1493, file: !1493, line: 55, type: !1531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1531 = !DISubroutineType(types: !1532)
!1532 = !{!892, !892, !1492}
!1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1534, file: !1496, line: 102)
!1534 = !DISubprogram(name: "towlower", scope: !1499, file: !1499, line: 166, type: !1535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1535 = !DISubroutineType(types: !1536)
!1536 = !{!892, !892}
!1537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1538, file: !1496, line: 103)
!1538 = !DISubprogram(name: "towupper", scope: !1499, file: !1499, line: 169, type: !1535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1540, file: !1496, line: 104)
!1540 = !DISubprogram(name: "wctrans", scope: !1493, file: !1493, line: 52, type: !1541, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1541 = !DISubroutineType(types: !1542)
!1542 = !{!1492, !271}
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1544, file: !1496, line: 105)
!1544 = !DISubprogram(name: "wctype", scope: !1499, file: !1499, line: 155, type: !1545, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1545 = !DISubroutineType(types: !1546)
!1546 = !{!1498, !271}
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1548, file: !1551, line: 60)
!1548 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1549, line: 7, baseType: !1550)
!1549 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1550 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !13, line: 156, baseType: !252)
!1551 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ctime", directory: "")
!1552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1553, file: !1551, line: 61)
!1553 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1554, line: 10, baseType: !1555)
!1554 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!1555 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !13, line: 160, baseType: !252)
!1556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1077, file: !1551, line: 62)
!1557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1558, file: !1551, line: 64)
!1558 = !DISubprogram(name: "clock", scope: !1559, file: !1559, line: 72, type: !1560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1559 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "db37158473a25e1d89b19f8bc6892801")
!1560 = !DISubroutineType(types: !1561)
!1561 = !{!1548}
!1562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1563, file: !1551, line: 65)
!1563 = !DISubprogram(name: "difftime", scope: !1559, file: !1559, line: 79, type: !1564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1564 = !DISubroutineType(types: !1565)
!1565 = !{!34, !1553, !1553}
!1566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1567, file: !1551, line: 66)
!1567 = !DISubprogram(name: "mktime", scope: !1559, file: !1559, line: 83, type: !1568, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1568 = !DISubroutineType(types: !1569)
!1569 = !{!1553, !1570}
!1570 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1077, size: 64)
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1572, file: !1551, line: 67)
!1572 = !DISubprogram(name: "time", scope: !1559, file: !1559, line: 76, type: !1573, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1573 = !DISubroutineType(types: !1574)
!1574 = !{!1553, !1575}
!1575 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1553, size: 64)
!1576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1577, file: !1551, line: 68)
!1577 = !DISubprogram(name: "asctime", scope: !1559, file: !1559, line: 179, type: !1578, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1578 = !DISubroutineType(types: !1579)
!1579 = !{!441, !1075}
!1580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1581, file: !1551, line: 69)
!1581 = !DISubprogram(name: "ctime", scope: !1559, file: !1559, line: 183, type: !1582, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1582 = !DISubroutineType(types: !1583)
!1583 = !{!441, !1584}
!1584 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1585, size: 64)
!1585 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1553)
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1587, file: !1551, line: 70)
!1587 = !DISubprogram(name: "gmtime", scope: !1559, file: !1559, line: 132, type: !1588, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1588 = !DISubroutineType(types: !1589)
!1589 = !{!1570, !1584}
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1591, file: !1551, line: 71)
!1591 = !DISubprogram(name: "localtime", scope: !1559, file: !1559, line: 136, type: !1588, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1593, file: !1551, line: 72)
!1593 = !DISubprogram(name: "strftime", scope: !1559, file: !1559, line: 100, type: !1594, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1594 = !DISubroutineType(types: !1595)
!1595 = !{!391, !508, !391, !465, !1074}
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1597, file: !1551, line: 79)
!1597 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1598, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1599, identifier: "_ZTS8timespec")
!1598 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!1599 = !{!1600, !1601}
!1600 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1597, file: !1598, line: 16, baseType: !1555, size: 64)
!1601 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1597, file: !1598, line: 21, baseType: !1602, size: 64, offset: 64)
!1602 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !13, line: 197, baseType: !252)
!1603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1604, file: !1551, line: 80)
!1604 = !DISubprogram(name: "timespec_get", scope: !1559, file: !1559, line: 371, type: !1605, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1605 = !DISubroutineType(types: !1606)
!1606 = !{!27, !1607, !27}
!1607 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1597, size: 64)
!1608 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1609, entity: !1610, file: !1612, line: 1428)
!1609 = !DINamespace(name: "chrono", scope: !22)
!1610 = !DINamespace(name: "chrono_literals", scope: !1611, exportSymbols: true)
!1611 = !DINamespace(name: "literals", scope: !22, exportSymbols: true)
!1612 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/chrono.h", directory: "")
!1613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1614, file: !1618, line: 77)
!1614 = !DISubprogram(name: "memchr", scope: !1615, file: !1615, line: 100, type: !1616, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1615 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "f443da8025a0b7c1498fb6c554ec788d")
!1616 = !DISubroutineType(types: !1617)
!1617 = !{!417, !417, !27, !391}
!1618 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstring", directory: "")
!1619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1620, file: !1618, line: 78)
!1620 = !DISubprogram(name: "memcmp", scope: !1615, file: !1615, line: 64, type: !1621, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1621 = !DISubroutineType(types: !1622)
!1622 = !{!27, !417, !417, !391}
!1623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1624, file: !1618, line: 79)
!1624 = !DISubprogram(name: "memcpy", linkageName: "_ZL6memcpyPvPKvm", scope: !1625, file: !1625, line: 1033, type: !1626, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1625 = !DIFile(filename: "/opt/rocm-5.6.0/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "007b363385afd7b068da381439832c46")
!1626 = !DISubroutineType(types: !1627)
!1627 = !{!390, !390, !417, !391}
!1628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1629, file: !1618, line: 80)
!1629 = !DISubprogram(name: "memmove", scope: !1615, file: !1615, line: 47, type: !1626, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1631, file: !1618, line: 81)
!1631 = !DISubprogram(name: "memset", linkageName: "_ZL6memsetPvim", scope: !1625, file: !1625, line: 1037, type: !1632, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1632 = !DISubroutineType(types: !1633)
!1633 = !{!390, !390, !27, !391}
!1634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1635, file: !1618, line: 82)
!1635 = !DISubprogram(name: "strcat", scope: !1615, file: !1615, line: 149, type: !1636, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1636 = !DISubroutineType(types: !1637)
!1637 = !{!441, !508, !465}
!1638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1639, file: !1618, line: 83)
!1639 = !DISubprogram(name: "strcmp", scope: !1615, file: !1615, line: 156, type: !1426, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1641, file: !1618, line: 84)
!1641 = !DISubprogram(name: "strcoll", scope: !1615, file: !1615, line: 163, type: !1426, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1643, file: !1618, line: 85)
!1643 = !DISubprogram(name: "strcpy", scope: !1615, file: !1615, line: 141, type: !1636, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1645, file: !1618, line: 86)
!1645 = !DISubprogram(name: "strcspn", scope: !1615, file: !1615, line: 293, type: !1646, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1646 = !DISubroutineType(types: !1647)
!1647 = !{!391, !271, !271}
!1648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1649, file: !1618, line: 87)
!1649 = !DISubprogram(name: "strerror", scope: !1615, file: !1615, line: 419, type: !1650, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1650 = !DISubroutineType(types: !1651)
!1651 = !{!441, !27}
!1652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1653, file: !1618, line: 88)
!1653 = !DISubprogram(name: "strlen", scope: !1615, file: !1615, line: 407, type: !1654, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1654 = !DISubroutineType(types: !1655)
!1655 = !{!391, !271}
!1656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1657, file: !1618, line: 89)
!1657 = !DISubprogram(name: "strncat", scope: !1615, file: !1615, line: 152, type: !1658, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1658 = !DISubroutineType(types: !1659)
!1659 = !{!441, !508, !465, !391}
!1660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1661, file: !1618, line: 90)
!1661 = !DISubprogram(name: "strncmp", scope: !1615, file: !1615, line: 159, type: !1662, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1662 = !DISubroutineType(types: !1663)
!1663 = !{!27, !271, !271, !391}
!1664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1665, file: !1618, line: 91)
!1665 = !DISubprogram(name: "strncpy", scope: !1615, file: !1615, line: 144, type: !1658, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1667, file: !1618, line: 92)
!1667 = !DISubprogram(name: "strspn", scope: !1615, file: !1615, line: 297, type: !1646, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1669, file: !1618, line: 93)
!1669 = !DISubprogram(name: "strtok", scope: !1615, file: !1615, line: 356, type: !1636, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1671, file: !1618, line: 94)
!1671 = !DISubprogram(name: "strxfrm", scope: !1615, file: !1615, line: 166, type: !1672, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1672 = !DISubroutineType(types: !1673)
!1673 = !{!391, !508, !465, !391}
!1674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1675, file: !1618, line: 95)
!1675 = !DISubprogram(name: "strchr", scope: !1615, file: !1615, line: 239, type: !1676, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1676 = !DISubroutineType(types: !1677)
!1677 = !{!271, !271, !27}
!1678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1679, file: !1618, line: 96)
!1679 = !DISubprogram(name: "strpbrk", scope: !1615, file: !1615, line: 316, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1680 = !DISubroutineType(types: !1681)
!1681 = !{!271, !271, !271}
!1682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1683, file: !1618, line: 97)
!1683 = !DISubprogram(name: "strrchr", scope: !1615, file: !1615, line: 266, type: !1676, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1685, file: !1618, line: 98)
!1685 = !DISubprogram(name: "strstr", scope: !1615, file: !1615, line: 343, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1686 = distinct !DILifetime(object: !1687, location: !DIExpr(DIOpArg(0, ptr addrspace(4)), DIOpDeref(%struct.__HIP_Coordinates)), argObjects: {!1727})
!1687 = distinct !DIGlobalVariable(name: "threadIdx", linkageName: "_ZL9threadIdx", scope: !0, file: !1688, line: 360, type: !1689, isLocal: true, isDefinition: true)
!1688 = !DIFile(filename: "/opt/rocm-5.6.0/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "9cfc3747d2817d5ed172bf90a7fffe36")
!1689 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1690)
!1690 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_Coordinates<__HIP_ThreadIdx>", file: !1688, line: 279, size: 8, flags: DIFlagTypePassByValue, elements: !1691, templateParams: !1718, identifier: "_ZTS17__HIP_CoordinatesI15__HIP_ThreadIdxE")
!1691 = !{!1692, !1707, !1710, !1713}
!1692 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1690, file: !1688, line: 295, baseType: !1693, flags: DIFlagStaticMember)
!1693 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1694)
!1694 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__X", scope: !1690, file: !1688, line: 282, size: 8, flags: DIFlagTypePassByValue, elements: !1695, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XE")
!1695 = !{!1696, !1701}
!1696 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !1694, file: !1688, line: 283, type: !1697, scopeLine: 283, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1697 = !DISubroutineType(types: !1698)
!1698 = !{!1699, !1700}
!1699 = !DIDerivedType(tag: DW_TAG_typedef, name: "R", scope: !1690, file: !1688, line: 280, baseType: !10)
!1700 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1693, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1701 = !DISubprogram(name: "operator+=", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XpLERKj", scope: !1694, file: !1688, line: 284, type: !1702, scopeLine: 284, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1702 = !DISubroutineType(types: !1703)
!1703 = !{!1699, !1704, !1705}
!1704 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1694, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1705 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1706, size: 64)
!1706 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1699)
!1707 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1690, file: !1688, line: 296, baseType: !1708, flags: DIFlagStaticMember)
!1708 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1709)
!1709 = !DICompositeType(tag: DW_TAG_structure_type, name: "__Y", scope: !1690, file: !1688, line: 286, size: 8, flags: DIFlagFwdDecl, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YE")
!1710 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1690, file: !1688, line: 297, baseType: !1711, flags: DIFlagStaticMember)
!1711 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1712)
!1712 = !DICompositeType(tag: DW_TAG_structure_type, name: "__Z", scope: !1690, file: !1688, line: 290, size: 8, flags: DIFlagFwdDecl, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZE")
!1713 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxEcv4dim3Ev", scope: !1690, file: !1688, line: 299, type: !1714, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1714 = !DISubroutineType(types: !1715)
!1715 = !{!1716, !1717}
!1716 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !7, line: 971, baseType: !6)
!1717 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1689, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1718 = !{!1719}
!1719 = !DITemplateTypeParameter(name: "F", type: !1720)
!1720 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_ThreadIdx", file: !1688, line: 260, size: 8, flags: DIFlagTypePassByValue, elements: !1721, identifier: "_ZTS15__HIP_ThreadIdx")
!1721 = !{!1722}
!1722 = !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !1720, file: !1688, line: 262, type: !1723, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1723 = !DISubroutineType(types: !1724)
!1724 = !{!10, !1725, !10}
!1725 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1726, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1726 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1720)
!1727 = distinct !DIFragment()
!1728 = distinct !DILifetime(object: !1729, location: !DIExpr(DIOpArg(0, ptr addrspace(4)), DIOpDeref(%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X")), argObjects: {!1730})
!1729 = distinct !DIGlobalVariable(name: "x", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE", scope: !0, file: !1688, line: 295, type: !1693, isLocal: false, isDefinition: true, declaration: !1692)
!1730 = distinct !DIFragment()
!1731 = !{i32 1, !"amdgpu_code_object_version", i32 500}
!1732 = !{i32 7, !"Dwarf Version", i32 5}
!1733 = !{i32 2, !"Debug Info Version", i32 4}
!1734 = !{i32 1, !"wchar_size", i32 4}
!1735 = !{i32 8, !"PIC Level", i32 1}
!1736 = !{i32 2, i32 0}
!1737 = !{!"AMD clang version 16.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.6.0 23243 be997b2f3651a41597d7a41441fff8ade4ac59ac)"}
!1738 = !{!1739, !1739, i64 0}
!1739 = !{!"float", !1740, i64 0}
!1740 = !{!"omnipotent char", !1741, i64 0}
!1741 = !{!"Simple C++ TBAA"}
!1742 = !{i32 0, i32 1024}
!1743 = !{}
!1744 = !{!1745, !1745, i64 0}
!1745 = !{!"long", !1740, i64 0}
!1746 = !{i64 0, i64 8, !1744, i64 8, i64 2, !1747, i64 16, i64 8, !1744, i64 16, i64 2, !1749, i64 18, i64 2, !1749, i64 20, i64 4, !1751, i64 24, i64 2, !1749, i64 26, i64 2, !1749, i64 28, i64 2, !1749, i64 30, i64 2, !1749, i64 32, i64 1, !1753, i64 16, i64 8, !1754, i64 40, i64 8, !1754, i64 48, i64 8, !1744, i64 56, i64 4, !1751, i64 60, i64 4, !1751, i64 64, i64 8, !1744}
!1747 = !{!1748, !1748, i64 0}
!1748 = !{!"_ZTSN8scabbard9InstrDataE", !1740, i64 0}
!1749 = !{!1750, !1750, i64 0}
!1750 = !{!"short", !1740, i64 0}
!1751 = !{!1752, !1752, i64 0}
!1752 = !{!"int", !1740, i64 0}
!1753 = !{!1740, !1740, i64 0}
!1754 = !{!1755, !1755, i64 0}
!1755 = !{!"any pointer", !1740, i64 0}
!1756 = !{i64 0, i64 2, !1747, i64 8, i64 8, !1744, i64 8, i64 2, !1749, i64 10, i64 2, !1749, i64 12, i64 4, !1751, i64 16, i64 2, !1749, i64 18, i64 2, !1749, i64 20, i64 2, !1749, i64 22, i64 2, !1749, i64 24, i64 1, !1753, i64 8, i64 8, !1754, i64 32, i64 8, !1754, i64 40, i64 8, !1744, i64 48, i64 4, !1751, i64 52, i64 4, !1751, i64 56, i64 8, !1744}
!1757 = !{i64 6, i64 8, !1744, i64 6, i64 2, !1749, i64 8, i64 2, !1749, i64 10, i64 4, !1751, i64 14, i64 2, !1749, i64 16, i64 2, !1749, i64 18, i64 2, !1749, i64 20, i64 2, !1749, i64 22, i64 1, !1753, i64 6, i64 8, !1754, i64 30, i64 8, !1754, i64 38, i64 8, !1744, i64 46, i64 4, !1751, i64 50, i64 4, !1751, i64 54, i64 8, !1744}
!1758 = !{i64 0, i64 8, !1744, i64 0, i64 2, !1749, i64 2, i64 2, !1749, i64 4, i64 4, !1751, i64 8, i64 2, !1749, i64 10, i64 2, !1749, i64 12, i64 2, !1749, i64 14, i64 2, !1749, i64 16, i64 1, !1753, i64 0, i64 8, !1754, i64 24, i64 8, !1754, i64 32, i64 8, !1744, i64 40, i64 4, !1751, i64 44, i64 4, !1751, i64 48, i64 8, !1744}
!1759 = !{i64 0, i64 4, !1744, i64 0, i64 4, !1751, i64 4, i64 2, !1749, i64 6, i64 2, !1749, i64 8, i64 2, !1749, i64 10, i64 2, !1749, i64 12, i64 1, !1753, i64 0, i64 4, !1754, i64 20, i64 8, !1754, i64 28, i64 8, !1744, i64 36, i64 4, !1751, i64 40, i64 4, !1751, i64 44, i64 8, !1744}
!1760 = !{i64 0, i64 1, !1753, i64 8, i64 8, !1754, i64 16, i64 8, !1744, i64 24, i64 4, !1751, i64 28, i64 4, !1751, i64 32, i64 8, !1744}
!1761 = !{i64 7, i64 8, !1754, i64 15, i64 8, !1744, i64 23, i64 4, !1751, i64 27, i64 4, !1751, i64 31, i64 8, !1744}
!1762 = !{i64 0, i64 8, !1754, i64 8, i64 8, !1744, i64 16, i64 4, !1751, i64 20, i64 4, !1751, i64 24, i64 8, !1744}
!1763 = !{i64 0, i64 8, !1744, i64 8, i64 4, !1751, i64 12, i64 4, !1751, i64 16, i64 8, !1744}
!1764 = !{i64 0, i64 4, !1751, i64 4, i64 4, !1751, i64 8, i64 8, !1744}
!1765 = !{i64 0, i64 4, !1751, i64 4, i64 8, !1744}
!1766 = !{i64 0, i64 8, !1744}
!1767 = distinct !DISubprogram(name: "tick_all_kernel", linkageName: "_Z15tick_all_kernelPU7_AtomicmPmPli", scope: !1, file: !1, line: 57, type: !1768, scopeLine: 58, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1774)
!1768 = !DISubroutineType(types: !1769)
!1769 = !{null, !1770, !1772, !1773, !27}
!1770 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1771, size: 64)
!1771 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !1249)
!1772 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1249, size: 64)
!1773 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1212, size: 64)
!1774 = !{!1775, !1776, !1777, !1778}
!1775 = !DILocalVariable(name: "clk", arg: 1, scope: !1767, file: !1, line: 57, type: !1770)
!1776 = !DILocalVariable(name: "vals", arg: 2, scope: !1767, file: !1, line: 57, type: !1772)
!1777 = !DILocalVariable(name: "dummy_data", arg: 3, scope: !1767, file: !1, line: 57, type: !1773)
!1778 = !DILocalVariable(name: "test", arg: 4, scope: !1767, file: !1, line: 57, type: !27)
!1779 = !DILocation(line: 59, column: 3, scope: !1767)
!1780 = !DILocation(line: 60, column: 34, scope: !1767)
!1781 = !DILocation(line: 263, column: 12, scope: !1782, inlinedAt: !1787)
!1782 = distinct !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !1720, file: !1688, line: 262, type: !1723, scopeLine: 262, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !1722, retainedNodes: !1783)
!1783 = !{!1784, !1786}
!1784 = !DILocalVariable(name: "this", arg: 1, scope: !1782, type: !1785, flags: DIFlagArtificial | DIFlagObjectPointer)
!1785 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1726, size: 64)
!1786 = !DILocalVariable(name: "x", arg: 2, scope: !1782, file: !1688, line: 262, type: !10)
!1787 = distinct !DILocation(line: 283, column: 53, scope: !1788, inlinedAt: !1792)
!1788 = distinct !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !1694, file: !1688, line: 283, type: !1697, scopeLine: 283, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !1696, retainedNodes: !1789)
!1789 = !{!1790}
!1790 = !DILocalVariable(name: "this", arg: 1, scope: !1788, type: !1791, flags: DIFlagArtificial | DIFlagObjectPointer)
!1791 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1693, size: 64)
!1792 = distinct !DILocation(line: 60, column: 8, scope: !1767)
!1793 = !DILocation(line: 60, column: 19, scope: !1767)
!1794 = !DILocation(line: 60, column: 3, scope: !1767)
!1795 = !DILocation(line: 60, column: 26, scope: !1767)
!1796 = !DILocation(line: 873, column: 9, scope: !1797, inlinedAt: !1804)
!1797 = distinct !DILexicalBlock(scope: !1798, file: !1625, line: 872, column: 16)
!1798 = distinct !DILexicalBlock(scope: !1799, file: !1625, line: 872, column: 9)
!1799 = distinct !DISubprogram(name: "__work_group_barrier", linkageName: "_ZL20__work_group_barrierj", scope: !1625, file: !1625, line: 871, type: !1800, scopeLine: 871, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1802)
!1800 = !DISubroutineType(types: !1801)
!1801 = !{null, !3}
!1802 = !{!1803}
!1803 = !DILocalVariable(name: "flags", arg: 1, scope: !1799, file: !1625, line: 871, type: !3)
!1804 = distinct !DILocation(line: 885, column: 3, scope: !1805, inlinedAt: !1808)
!1805 = distinct !DISubprogram(name: "__barrier", linkageName: "_ZL9__barrieri", scope: !1625, file: !1625, line: 883, type: !431, scopeLine: 884, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1806)
!1806 = !{!1807}
!1807 = !DILocalVariable(name: "n", arg: 1, scope: !1805, file: !1625, line: 883, type: !27)
!1808 = distinct !DILocation(line: 893, column: 3, scope: !1809, inlinedAt: !1810)
!1809 = distinct !DISubprogram(name: "__syncthreads", linkageName: "_Z13__syncthreadsv", scope: !1625, file: !1625, line: 891, type: !384, scopeLine: 892, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1743)
!1810 = distinct !DILocation(line: 61, column: 3, scope: !1767)
!1811 = !DILocation(line: 874, column: 9, scope: !1797, inlinedAt: !1804)
!1812 = !DILocation(line: 875, column: 9, scope: !1797, inlinedAt: !1804)
!1813 = !DILocation(line: 62, column: 3, scope: !1767)
!1814 = !DILocation(line: 63, column: 1, scope: !1767)
!1815 = distinct !DISubprogram(name: "dummy_work", linkageName: "_Z10dummy_workPl", scope: !1, file: !1, line: 195, type: !1816, scopeLine: 196, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1818)
!1816 = !DISubroutineType(types: !1817)
!1817 = !{null, !1773}
!1818 = !{!1819, !1820}
!1819 = !DILocalVariable(name: "dummy_data", arg: 1, scope: !1815, file: !1, line: 195, type: !1773)
!1820 = !DILocalVariable(name: "i", scope: !1815, file: !1, line: 197, type: !27)
!1821 = !DILocation(line: 197, column: 11, scope: !1815)
!1822 = !DILocation(line: 197, column: 28, scope: !1815)
!1823 = !{!1824, !1824, i64 0}
!1824 = !{!"int", !1825, i64 0}
!1825 = !{!"omnipotent char", !1826, i64 0}
!1826 = !{!"Simple C/C++ TBAA"}
!1827 = !{!1828, !1828, i64 0}
!1828 = !{!"short", !1825, i64 0}
!1829 = !DILocation(line: 197, column: 44, scope: !1815)
!1830 = !DILocation(line: 197, column: 42, scope: !1815)
!1831 = !DILocation(line: 197, column: 26, scope: !1815)
!1832 = !DILocation(line: 198, column: 20, scope: !1815)
!1833 = !DILocation(line: 198, column: 3, scope: !1815)
!1834 = !DILocation(line: 198, column: 17, scope: !1815)
!1835 = !DILocation(line: 199, column: 1, scope: !1815)
!1836 = distinct !DISubprogram(name: "dummy_kernel", linkageName: "_Z12dummy_kernelv", scope: !1, file: !1, line: 155, type: !384, scopeLine: 156, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1743)
!1837 = !DILocation(line: 873, column: 9, scope: !1797, inlinedAt: !1838)
!1838 = distinct !DILocation(line: 885, column: 3, scope: !1805, inlinedAt: !1839)
!1839 = distinct !DILocation(line: 893, column: 3, scope: !1809, inlinedAt: !1840)
!1840 = distinct !DILocation(line: 157, column: 3, scope: !1836)
!1841 = !DILocation(line: 874, column: 9, scope: !1797, inlinedAt: !1838)
!1842 = !DILocation(line: 875, column: 9, scope: !1797, inlinedAt: !1838)
!1843 = !DILocation(line: 158, column: 1, scope: !1836)
!1844 = distinct !DISubprogram(name: "dummy_init", linkageName: "_Z10dummy_initPl", scope: !1, file: !1, line: 188, type: !1816, scopeLine: 189, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1845)
!1845 = !{!1846, !1847}
!1846 = !DILocalVariable(name: "dummy_data", arg: 1, scope: !1844, file: !1, line: 188, type: !1773)
!1847 = !DILocalVariable(name: "i", scope: !1844, file: !1, line: 190, type: !27)
!1848 = !DILocation(line: 190, column: 11, scope: !1844)
!1849 = !DILocation(line: 190, column: 28, scope: !1844)
!1850 = !DILocation(line: 190, column: 44, scope: !1844)
!1851 = !DILocation(line: 190, column: 42, scope: !1844)
!1852 = !DILocation(line: 190, column: 26, scope: !1844)
!1853 = !DILocation(line: 191, column: 3, scope: !1844)
!1854 = !DILocation(line: 191, column: 17, scope: !1844)
!1855 = !DILocation(line: 192, column: 1, scope: !1844)

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
@"scabbard.metadata.srcData$0x0001" = private unnamed_addr constant [55 x i8] c"/home/oster/repos/scabbard/test/managed_clock_test.cpp\00", align 1
@"scabbard.metadata.srcData$0x0000" = private unnamed_addr constant [47 x i8] c"//opt/rocm-5.6.0/include/hip/hip_runtime_api.h\00", align 1
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
  store ptr %0, ptr %5, align 8, !tbaa !2206
  store ptr %1, ptr %6, align 8, !tbaa !2206
  store ptr %2, ptr %7, align 8, !tbaa !2206
  store i32 %3, ptr %8, align 4, !tbaa !2210
  %13 = alloca ptr, i32 5, align 8
  %14 = getelementptr ptr, ptr %13, i64 0
  store ptr %5, ptr %14, align 16
  %15 = getelementptr inbounds ptr, ptr %14, i64 1
  store ptr %6, ptr %15, align 8
  %16 = getelementptr inbounds ptr, ptr %14, i64 2
  store ptr %7, ptr %16, align 16
  %17 = getelementptr inbounds ptr, ptr %14, i64 3
  store ptr %8, ptr %17, align 8
  %18 = call i32 @__hipPopCallConfiguration(ptr nonnull %9, ptr nonnull %10, ptr nonnull %11, ptr nonnull %12)
  %19 = load i64, ptr %11, align 8
  %20 = load ptr, ptr %12, align 8
  %21 = load i64, ptr %9, align 8
  %22 = getelementptr inbounds i8, ptr %9, i64 8
  %23 = load i32, ptr %22, align 8
  %24 = load i64, ptr %10, align 8
  %25 = getelementptr inbounds i8, ptr %10, i64 8
  %26 = load i32, ptr %25, align 8
  %27 = alloca ptr, align 8
  %28 = call ptr @scabbard.trace.register_job(ptr %20)
  store ptr %28, ptr %27, align 8
  %29 = getelementptr ptr, ptr %13, i64 4
  store ptr %27, ptr %29, align 8
  %30 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z15tick_all_kernelPU7_AtomicmPmPli, i64 %21, i32 %23, i64 %24, i32 %26, ptr noundef nonnull %14, i64 noundef %19, ptr noundef %20)
  call void @scabbard.trace.register_job_callback(ptr %28, ptr %20)
  ret void
}

declare dso_local i32 @__hipPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare dso_local i32 @hipLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: noinline uwtable
define dso_local void @_Z13tick_all_testi(i32 noundef %0) local_unnamed_addr #4 personality ptr @__gxx_personality_v0 !dbg !2212 {
  %2 = alloca %struct.timespec, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, i32 5, align 8
  %12 = getelementptr ptr, ptr %11, i64 0
  %13 = alloca ptr, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca %struct.dim3, align 8
  %16 = alloca i64, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, i32 2, align 8
  %19 = getelementptr ptr, ptr %18, i64 0
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !2214, metadata !DIExpression()), !dbg !2235
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %20) #18, !dbg !2236
  call void @llvm.dbg.value(metadata i32 0, metadata !2215, metadata !DIExpression()), !dbg !2235
  store i32 0, ptr %20, align 4, !dbg !2237, !tbaa !2210
  call void @llvm.dbg.value(metadata ptr %20, metadata !2215, metadata !DIExpression(DW_OP_deref)), !dbg !2235
  %24 = call i32 @hipGetDevice(ptr noundef nonnull %20), !dbg !2238
  call void @llvm.dbg.value(metadata i32 %24, metadata !2239, metadata !DIExpression()), !dbg !2245
  %25 = icmp eq i32 %24, 0, !dbg !2247
  br i1 %25, label %30, label %26, !dbg !2249

26:                                               ; preds = %1
  %27 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2250
  %28 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %27, i32 noundef %24), !dbg !2252
  call void @llvm.dbg.value(metadata ptr %28, metadata !2253, metadata !DIExpression()), !dbg !2270
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2270
  %29 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %28), !dbg !2272
  call void @exit(i32 noundef 1) #19, !dbg !2273
  unreachable, !dbg !2273

30:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2336
  call void @llvm.dbg.value(metadata ptr @.str, metadata !2280, metadata !DIExpression()), !dbg !2336
  %31 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str, i64 noundef 36), !dbg !2338
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2253, metadata !DIExpression()), !dbg !2340
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2342, metadata !DIExpression()), !dbg !2348
  %32 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout), !dbg !2350
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2351
  call void @llvm.dbg.value(metadata ptr @.str.1, metadata !2280, metadata !DIExpression()), !dbg !2351
  %33 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.1, i64 noundef 26), !dbg !2353
  %34 = load i32, ptr %20, align 4, !dbg !2354, !tbaa !2210
  call void @llvm.dbg.value(metadata i32 %34, metadata !2215, metadata !DIExpression()), !dbg !2235
  %35 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %34), !dbg !2355
  call void @llvm.dbg.value(metadata ptr %35, metadata !2253, metadata !DIExpression()), !dbg !2356
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2356
  call void @llvm.dbg.value(metadata ptr %35, metadata !2358, metadata !DIExpression()), !dbg !2361
  %36 = load ptr, ptr %35, align 8, !dbg !2363, !tbaa !2364
  %37 = getelementptr i8, ptr %36, i64 -24, !dbg !2363
  %38 = load i64, ptr %37, align 8, !dbg !2363
  %39 = getelementptr inbounds i8, ptr %35, i64 %38, !dbg !2363
  call void @llvm.dbg.value(metadata ptr %39, metadata !2366, metadata !DIExpression()), !dbg !2380
  call void @llvm.dbg.value(metadata i8 10, metadata !2378, metadata !DIExpression()), !dbg !2380
  %40 = getelementptr inbounds %"class.std::basic_ios", ptr %39, i64 0, i32 5, !dbg !2382
  %41 = load ptr, ptr %40, align 8, !dbg !2382, !tbaa !2383
  call void @llvm.dbg.value(metadata ptr %41, metadata !2392, metadata !DIExpression()), !dbg !2404
  %42 = icmp eq ptr %41, null, !dbg !2406
  br i1 %42, label %43, label %44, !dbg !2408

43:                                               ; preds = %30
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2409
  unreachable, !dbg !2409

44:                                               ; preds = %30
  call void @llvm.dbg.value(metadata ptr %41, metadata !2410, metadata !DIExpression()), !dbg !2419
  call void @llvm.dbg.value(metadata i8 10, metadata !2418, metadata !DIExpression()), !dbg !2419
  %45 = getelementptr inbounds %"class.std::ctype", ptr %41, i64 0, i32 8, !dbg !2421
  %46 = load i8, ptr %45, align 8, !dbg !2421, !tbaa !2423
  %47 = icmp eq i8 %46, 0, !dbg !2421
  br i1 %47, label %51, label %48, !dbg !2426

48:                                               ; preds = %44
  %49 = getelementptr inbounds %"class.std::ctype", ptr %41, i64 0, i32 9, i64 10, !dbg !2427
  %50 = load i8, ptr %49, align 1, !dbg !2427, !tbaa !2428
  br label %56, !dbg !2429

51:                                               ; preds = %44
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %41), !dbg !2430
  %52 = load ptr, ptr %41, align 8, !dbg !2431, !tbaa !2364
  %53 = getelementptr inbounds ptr, ptr %52, i64 6, !dbg !2431
  %54 = load ptr, ptr %53, align 8, !dbg !2431
  %55 = call noundef signext i8 %54(ptr noundef nonnull align 8 dereferenceable(570) %41, i8 noundef signext 10), !dbg !2431
  br label %56, !dbg !2432

56:                                               ; preds = %48, %51
  %57 = phi i8 [ %50, %48 ], [ %55, %51 ], !dbg !2419
  %58 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %35, i8 noundef signext %57), !dbg !2433
  call void @llvm.dbg.value(metadata ptr %58, metadata !2342, metadata !DIExpression()), !dbg !2434
  %59 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %58), !dbg !2436
  call void @llvm.dbg.value(metadata i32 1024, metadata !2216, metadata !DIExpression()), !dbg !2235
  call void @llvm.dbg.value(metadata i64 64, metadata !2218, metadata !DIExpression()), !dbg !2235
  call void @llvm.dbg.value(metadata i64 128, metadata !2219, metadata !DIExpression()), !dbg !2235
  call void @llvm.dbg.value(metadata i64 16, metadata !2221, metadata !DIExpression()), !dbg !2235
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %21) #18, !dbg !2437
  call void @llvm.dbg.value(metadata ptr %21, metadata !2222, metadata !DIExpression(DW_OP_deref)), !dbg !2235
  call void @llvm.dbg.value(metadata ptr %21, metadata !2438, metadata !DIExpression()), !dbg !2450
  call void @llvm.dbg.value(metadata i64 1, metadata !2446, metadata !DIExpression()), !dbg !2450
  call void @llvm.dbg.value(metadata i32 1, metadata !2447, metadata !DIExpression()), !dbg !2450
  %60 = call i32 @hipMallocManaged(ptr noundef nonnull %21, i64 noundef 1, i32 noundef 1), !dbg !2452
  call void @llvm.dbg.value(metadata i32 %60, metadata !2239, metadata !DIExpression()), !dbg !2453
  %61 = icmp eq i32 %60, 0, !dbg !2455
  br i1 %61, label %66, label %62, !dbg !2456

62:                                               ; preds = %56
  %63 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2457
  %64 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %63, i32 noundef %60), !dbg !2458
  call void @llvm.dbg.value(metadata ptr %64, metadata !2253, metadata !DIExpression()), !dbg !2459
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2459
  %65 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %64), !dbg !2461
  call void @exit(i32 noundef 1) #19, !dbg !2462
  unreachable, !dbg !2462

66:                                               ; preds = %56
  %67 = load ptr, ptr %21, align 8, !dbg !2463, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %67, metadata !2222, metadata !DIExpression()), !dbg !2235
  store atomic i64 0, ptr %67 seq_cst, align 8, !dbg !2464, !tbaa !2428
  %68 = call noalias noundef nonnull dereferenceable(8192) ptr @_Znam(i64 noundef 8192) #21, !dbg !2465, !heapallocsite !1675
  call void @llvm.dbg.value(metadata ptr %68, metadata !2225, metadata !DIExpression()), !dbg !2235
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(8192) %68, i8 0, i64 8192, i1 false), !dbg !2466
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %22) #18, !dbg !2467
  call void @llvm.dbg.value(metadata ptr %22, metadata !2227, metadata !DIExpression(DW_OP_deref)), !dbg !2235
  call void @llvm.dbg.value(metadata ptr %22, metadata !2468, metadata !DIExpression()), !dbg !2478
  call void @llvm.dbg.value(metadata i64 8192, metadata !2475, metadata !DIExpression()), !dbg !2478
  %69 = call i32 @hipMalloc(ptr noundef nonnull %22, i64 noundef 8192), !dbg !2480
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4112, ptr %22, ptr @"scabbard.metadata.host.srcId$0x0000", i32 8381, i32 12, i64 8192)
  call void @llvm.dbg.value(metadata i32 %69, metadata !2239, metadata !DIExpression()), !dbg !2481
  %70 = icmp eq i32 %69, 0, !dbg !2483
  br i1 %70, label %75, label %71, !dbg !2484

71:                                               ; preds = %66
  %72 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2485
  %73 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %72, i32 noundef %69), !dbg !2486
  call void @llvm.dbg.value(metadata ptr %73, metadata !2253, metadata !DIExpression()), !dbg !2487
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2487
  %74 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %73), !dbg !2489
  call void @exit(i32 noundef 1) #19, !dbg !2490
  unreachable, !dbg !2490

75:                                               ; preds = %66
  %76 = load ptr, ptr %22, align 8, !dbg !2491, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %76, metadata !2227, metadata !DIExpression()), !dbg !2235
  call void @"scabbard.trace.host.trace_append$mem"(i16 -32768, ptr null, ptr @"scabbard.metadata.host.srcId$0x0001", i32 89, i32 17)
  %77 = call i32 @hipMemcpy(ptr noundef %76, ptr noundef nonnull %68, i64 noundef 8192, i32 noundef 1), !dbg !2492
  call void @llvm.dbg.value(metadata i32 %77, metadata !2239, metadata !DIExpression()), !dbg !2493
  %78 = icmp eq i32 %77, 0, !dbg !2495
  br i1 %78, label %83, label %79, !dbg !2496

79:                                               ; preds = %75
  %80 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2497
  %81 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %80, i32 noundef %77), !dbg !2498
  call void @llvm.dbg.value(metadata ptr %81, metadata !2253, metadata !DIExpression()), !dbg !2499
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2499
  %82 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %81), !dbg !2501
  call void @exit(i32 noundef 1) #19, !dbg !2502
  unreachable, !dbg !2502

83:                                               ; preds = %75
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %23) #18, !dbg !2503
  call void @llvm.dbg.value(metadata ptr %23, metadata !2228, metadata !DIExpression(DW_OP_deref)), !dbg !2235
  call void @llvm.dbg.value(metadata ptr %23, metadata !2504, metadata !DIExpression()), !dbg !2514
  call void @llvm.dbg.value(metadata i64 8192, metadata !2511, metadata !DIExpression()), !dbg !2514
  %84 = call i32 @hipMalloc(ptr noundef nonnull %23, i64 noundef 8192), !dbg !2516
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4112, ptr %23, ptr @"scabbard.metadata.host.srcId$0x0000", i32 8381, i32 12, i64 8192)
  call void @llvm.dbg.value(metadata i32 %84, metadata !2239, metadata !DIExpression()), !dbg !2517
  %85 = icmp eq i32 %84, 0, !dbg !2519
  br i1 %85, label %90, label %86, !dbg !2520

86:                                               ; preds = %83
  %87 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2521
  %88 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %87, i32 noundef %84), !dbg !2522
  call void @llvm.dbg.value(metadata ptr %88, metadata !2253, metadata !DIExpression()), !dbg !2523
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2523
  %89 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %88), !dbg !2525
  call void @exit(i32 noundef 1) #19, !dbg !2526
  unreachable, !dbg !2526

90:                                               ; preds = %83
  %91 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294968320, i32 1, i64 noundef 0, ptr noundef null), !dbg !2527
  %92 = icmp eq i32 %91, 0, !dbg !2527
  br i1 %92, label %93, label %108, !dbg !2527

93:                                               ; preds = %90
  %94 = load ptr, ptr %23, align 8, !dbg !2527, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %94, metadata !2228, metadata !DIExpression()), !dbg !2235
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %13), !dbg !2527
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %14), !dbg !2527
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %15), !dbg !2527
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %16), !dbg !2527
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %17), !dbg !2527
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %19), !dbg !2527
  store ptr %94, ptr %13, align 8, !dbg !2527, !tbaa !2206
  store ptr %13, ptr %19, align 16, !dbg !2527
  %95 = call i32 @__hipPopCallConfiguration(ptr nonnull %14, ptr nonnull %15, ptr nonnull %16, ptr nonnull %17), !dbg !2527
  %96 = load i64, ptr %16, align 8, !dbg !2527
  %97 = load ptr, ptr %17, align 8, !dbg !2527
  %98 = load i64, ptr %14, align 8, !dbg !2527
  %99 = getelementptr inbounds i8, ptr %14, i64 8, !dbg !2527
  %100 = load i32, ptr %99, align 8, !dbg !2527
  %101 = load i64, ptr %15, align 8, !dbg !2527
  %102 = getelementptr inbounds i8, ptr %15, i64 8, !dbg !2527
  %103 = load i32, ptr %102, align 8, !dbg !2527
  %104 = alloca ptr, align 8
  %105 = call ptr @scabbard.trace.register_job(ptr %97)
  store ptr %105, ptr %104, align 8
  %106 = getelementptr ptr, ptr %18, i64 1
  store ptr %104, ptr %106, align 8
  %107 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z10dummy_initPl, i64 %98, i32 %100, i64 %101, i32 %103, ptr noundef nonnull %19, i64 noundef %96, ptr noundef %97), !dbg !2527
  call void @scabbard.trace.register_job_callback(ptr %105, ptr %97)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %13), !dbg !2527
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %14), !dbg !2527
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %15), !dbg !2527
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %16), !dbg !2527
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %17), !dbg !2527
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %19), !dbg !2527
  br label %108, !dbg !2527

108:                                              ; preds = %93, %90
  %109 = call noalias noundef nonnull dereferenceable(8192) ptr @_Znam(i64 noundef 8192) #21, !dbg !2529, !heapallocsite !1642
  call void @llvm.dbg.value(metadata ptr %109, metadata !2230, metadata !DIExpression()), !dbg !2235
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(8192) %109, i8 0, i64 8192, i1 false), !dbg !2530
  %110 = load ptr, ptr %23, align 8, !dbg !2531, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %110, metadata !2228, metadata !DIExpression()), !dbg !2235
  call void @"scabbard.trace.host.trace_append$mem"(i16 -32768, ptr null, ptr @"scabbard.metadata.host.srcId$0x0001", i32 100, i32 17)
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4138, ptr %109, ptr @"scabbard.metadata.host.srcId$0x0001", i32 100, i32 17, i64 8192)
  %111 = call i32 @hipMemcpy(ptr noundef nonnull %109, ptr noundef %110, i64 noundef 8192, i32 noundef 2), !dbg !2532
  call void @llvm.dbg.value(metadata i32 %111, metadata !2239, metadata !DIExpression()), !dbg !2533
  %112 = icmp eq i32 %111, 0, !dbg !2535
  br i1 %112, label %117, label %113, !dbg !2536

113:                                              ; preds = %108
  %114 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2537
  %115 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %114, i32 noundef %111), !dbg !2538
  call void @llvm.dbg.value(metadata ptr %115, metadata !2253, metadata !DIExpression()), !dbg !2539
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2539
  %116 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %115), !dbg !2541
  call void @exit(i32 noundef 1) #19, !dbg !2542
  unreachable, !dbg !2542

117:                                              ; preds = %108
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2543
  call void @llvm.dbg.value(metadata ptr @.str.2, metadata !2280, metadata !DIExpression()), !dbg !2543
  %118 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.2, i64 noundef 18), !dbg !2545
  call void @llvm.dbg.value(metadata i64 0, metadata !2231, metadata !DIExpression()), !dbg !2546
  br label %157, !dbg !2547

119:                                              ; preds = %188
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2548
  call void @llvm.dbg.value(metadata ptr @.str.3, metadata !2280, metadata !DIExpression()), !dbg !2548
  %120 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5), !dbg !2551
  call void @llvm.dbg.value(metadata i8 32, metadata !2552, metadata !DIExpression()), !dbg !2562
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2561, metadata !DIExpression()), !dbg !2562
  %121 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2564, !tbaa !2364
  %122 = getelementptr i8, ptr %121, i64 -24, !dbg !2564
  %123 = load i64, ptr %122, align 8, !dbg !2564
  %124 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %123, !dbg !2564
  call void @llvm.dbg.value(metadata ptr %124, metadata !2565, metadata !DIExpression()), !dbg !2575
  call void @llvm.dbg.value(metadata i8 32, metadata !2572, metadata !DIExpression()), !dbg !2575
  call void @llvm.dbg.value(metadata ptr %124, metadata !2577, metadata !DIExpression()), !dbg !2583
  %125 = getelementptr inbounds %"class.std::basic_ios", ptr %124, i64 0, i32 3, !dbg !2585
  %126 = load i8, ptr %125, align 1, !dbg !2585, !tbaa !2587, !range !2588, !noundef !290
  %127 = icmp eq i8 %126, 0, !dbg !2585
  br i1 %127, label %128, label %145, !dbg !2589

128:                                              ; preds = %119
  call void @llvm.dbg.value(metadata ptr %124, metadata !2366, metadata !DIExpression()), !dbg !2590
  call void @llvm.dbg.value(metadata i8 32, metadata !2378, metadata !DIExpression()), !dbg !2590
  %129 = getelementptr inbounds %"class.std::basic_ios", ptr %124, i64 0, i32 5, !dbg !2593
  %130 = load ptr, ptr %129, align 8, !dbg !2593, !tbaa !2383
  call void @llvm.dbg.value(metadata ptr %130, metadata !2392, metadata !DIExpression()), !dbg !2594
  %131 = icmp eq ptr %130, null, !dbg !2596
  br i1 %131, label %132, label %133, !dbg !2597

132:                                              ; preds = %128
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2598
  unreachable, !dbg !2598

133:                                              ; preds = %128
  call void @llvm.dbg.value(metadata ptr %130, metadata !2410, metadata !DIExpression()), !dbg !2599
  call void @llvm.dbg.value(metadata i8 32, metadata !2418, metadata !DIExpression()), !dbg !2599
  %134 = getelementptr inbounds %"class.std::ctype", ptr %130, i64 0, i32 8, !dbg !2601
  %135 = load i8, ptr %134, align 8, !dbg !2601, !tbaa !2423
  %136 = icmp eq i8 %135, 0, !dbg !2601
  br i1 %136, label %137, label %143, !dbg !2602

137:                                              ; preds = %133
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %130), !dbg !2603
  %138 = load ptr, ptr %130, align 8, !dbg !2604, !tbaa !2364
  %139 = getelementptr inbounds ptr, ptr %138, i64 6, !dbg !2604
  %140 = load ptr, ptr %139, align 8, !dbg !2604
  %141 = call noundef signext i8 %140(ptr noundef nonnull align 8 dereferenceable(570) %130, i8 noundef signext 32), !dbg !2604
  %142 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2605, !tbaa !2364
  br label %143, !dbg !2616

143:                                              ; preds = %137, %133
  %144 = phi ptr [ %142, %137 ], [ %121, %133 ], !dbg !2605
  store i8 1, ptr %125, align 1, !dbg !2617, !tbaa !2587
  br label %145, !dbg !2618

145:                                              ; preds = %119, %143
  %146 = phi ptr [ %121, %119 ], [ %144, %143 ], !dbg !2605
  call void @llvm.dbg.value(metadata i8 poison, metadata !2573, metadata !DIExpression()), !dbg !2575
  %147 = getelementptr inbounds %"class.std::basic_ios", ptr %124, i64 0, i32 2, !dbg !2619
  store i8 32, ptr %147, align 8, !dbg !2620, !tbaa !2621
  call void @llvm.dbg.value(metadata i32 8, metadata !2614, metadata !DIExpression()), !dbg !2622
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2613, metadata !DIExpression()), !dbg !2622
  %148 = getelementptr i8, ptr %146, i64 -24, !dbg !2605
  %149 = load i64, ptr %148, align 8, !dbg !2605
  %150 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %149, !dbg !2605
  call void @llvm.dbg.value(metadata ptr %150, metadata !2623, metadata !DIExpression()), !dbg !2633
  call void @llvm.dbg.value(metadata i64 8, metadata !2630, metadata !DIExpression()), !dbg !2633
  %151 = getelementptr inbounds %"class.std::ios_base", ptr %150, i64 0, i32 2, !dbg !2635
  call void @llvm.dbg.value(metadata i64 poison, metadata !2631, metadata !DIExpression()), !dbg !2633
  store i64 8, ptr %151, align 8, !dbg !2636, !tbaa !2637
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2638
  call void @llvm.dbg.value(metadata ptr @.str.5, metadata !2280, metadata !DIExpression()), !dbg !2638
  %152 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.5, i64 noundef 3), !dbg !2640
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2641
  call void @llvm.dbg.value(metadata ptr @.str.6, metadata !2280, metadata !DIExpression()), !dbg !2641
  %153 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.6, i64 noundef 5), !dbg !2643
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2253, metadata !DIExpression()), !dbg !2644
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2342, metadata !DIExpression()), !dbg !2646
  %154 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout), !dbg !2648
  %155 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 4294968320, i32 1, i64 noundef 0, ptr noundef null), !dbg !2649
  %156 = icmp eq i32 %155, 0, !dbg !2649
  br i1 %156, label %201, label %221, !dbg !2650

157:                                              ; preds = %117, %188
  %158 = phi i64 [ 0, %117 ], [ %199, %188 ]
  call void @llvm.dbg.value(metadata i64 %158, metadata !2231, metadata !DIExpression()), !dbg !2546
  %159 = and i64 %158, 15, !dbg !2651
  %160 = icmp eq i64 %159, 0, !dbg !2655
  br i1 %160, label %161, label %163, !dbg !2656

161:                                              ; preds = %157
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2657
  call void @llvm.dbg.value(metadata ptr @.str.3, metadata !2280, metadata !DIExpression()), !dbg !2657
  %162 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5), !dbg !2659
  br label %163, !dbg !2660

163:                                              ; preds = %161, %157
  call void @llvm.dbg.value(metadata i8 32, metadata !2552, metadata !DIExpression()), !dbg !2661
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2561, metadata !DIExpression()), !dbg !2661
  %164 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2663, !tbaa !2364
  %165 = getelementptr i8, ptr %164, i64 -24, !dbg !2663
  %166 = load i64, ptr %165, align 8, !dbg !2663
  %167 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %166, !dbg !2663
  call void @llvm.dbg.value(metadata ptr %167, metadata !2565, metadata !DIExpression()), !dbg !2664
  call void @llvm.dbg.value(metadata i8 32, metadata !2572, metadata !DIExpression()), !dbg !2664
  call void @llvm.dbg.value(metadata ptr %167, metadata !2577, metadata !DIExpression()), !dbg !2666
  %168 = getelementptr inbounds %"class.std::basic_ios", ptr %167, i64 0, i32 3, !dbg !2668
  %169 = load i8, ptr %168, align 1, !dbg !2668, !tbaa !2587, !range !2588, !noundef !290
  %170 = icmp eq i8 %169, 0, !dbg !2668
  br i1 %170, label %171, label %188, !dbg !2669

171:                                              ; preds = %163
  call void @llvm.dbg.value(metadata ptr %167, metadata !2366, metadata !DIExpression()), !dbg !2670
  call void @llvm.dbg.value(metadata i8 32, metadata !2378, metadata !DIExpression()), !dbg !2670
  %172 = getelementptr inbounds %"class.std::basic_ios", ptr %167, i64 0, i32 5, !dbg !2672
  %173 = load ptr, ptr %172, align 8, !dbg !2672, !tbaa !2383
  call void @llvm.dbg.value(metadata ptr %173, metadata !2392, metadata !DIExpression()), !dbg !2673
  %174 = icmp eq ptr %173, null, !dbg !2675
  br i1 %174, label %175, label %176, !dbg !2676

175:                                              ; preds = %171
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2677
  unreachable, !dbg !2677

176:                                              ; preds = %171
  call void @llvm.dbg.value(metadata ptr %173, metadata !2410, metadata !DIExpression()), !dbg !2678
  call void @llvm.dbg.value(metadata i8 32, metadata !2418, metadata !DIExpression()), !dbg !2678
  %177 = getelementptr inbounds %"class.std::ctype", ptr %173, i64 0, i32 8, !dbg !2680
  %178 = load i8, ptr %177, align 8, !dbg !2680, !tbaa !2423
  %179 = icmp eq i8 %178, 0, !dbg !2680
  br i1 %179, label %180, label %186, !dbg !2681

180:                                              ; preds = %176
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %173), !dbg !2682
  %181 = load ptr, ptr %173, align 8, !dbg !2683, !tbaa !2364
  %182 = getelementptr inbounds ptr, ptr %181, i64 6, !dbg !2683
  %183 = load ptr, ptr %182, align 8, !dbg !2683
  %184 = call noundef signext i8 %183(ptr noundef nonnull align 8 dereferenceable(570) %173, i8 noundef signext 32), !dbg !2683
  %185 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2684, !tbaa !2364
  br label %186, !dbg !2686

186:                                              ; preds = %180, %176
  %187 = phi ptr [ %185, %180 ], [ %164, %176 ], !dbg !2684
  store i8 1, ptr %168, align 1, !dbg !2687, !tbaa !2587
  br label %188, !dbg !2688

188:                                              ; preds = %163, %186
  %189 = phi ptr [ %164, %163 ], [ %187, %186 ], !dbg !2684
  call void @llvm.dbg.value(metadata i8 poison, metadata !2573, metadata !DIExpression()), !dbg !2664
  %190 = getelementptr inbounds %"class.std::basic_ios", ptr %167, i64 0, i32 2, !dbg !2689
  store i8 32, ptr %190, align 8, !dbg !2690, !tbaa !2621
  call void @llvm.dbg.value(metadata i32 8, metadata !2614, metadata !DIExpression()), !dbg !2691
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2613, metadata !DIExpression()), !dbg !2691
  %191 = getelementptr i8, ptr %189, i64 -24, !dbg !2684
  %192 = load i64, ptr %191, align 8, !dbg !2684
  %193 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %192, !dbg !2684
  call void @llvm.dbg.value(metadata ptr %193, metadata !2623, metadata !DIExpression()), !dbg !2692
  call void @llvm.dbg.value(metadata i64 8, metadata !2630, metadata !DIExpression()), !dbg !2692
  %194 = getelementptr inbounds %"class.std::ios_base", ptr %193, i64 0, i32 2, !dbg !2694
  call void @llvm.dbg.value(metadata i64 poison, metadata !2631, metadata !DIExpression()), !dbg !2692
  store i64 8, ptr %194, align 8, !dbg !2695, !tbaa !2637
  %195 = getelementptr inbounds i64, ptr %109, i64 %158, !dbg !2696
  %196 = load i64, ptr %195, align 8, !dbg !2696, !tbaa !2697
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2698, metadata !DIExpression()), !dbg !2705
  call void @llvm.dbg.value(metadata i64 %196, metadata !2704, metadata !DIExpression()), !dbg !2705
  %197 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertIlEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %196), !dbg !2707
  call void @llvm.dbg.value(metadata ptr %197, metadata !2274, metadata !DIExpression()), !dbg !2708
  call void @llvm.dbg.value(metadata ptr @.str.4, metadata !2280, metadata !DIExpression()), !dbg !2708
  %198 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %197, ptr noundef nonnull @.str.4, i64 noundef 1), !dbg !2710
  %199 = add nuw nsw i64 %158, 1, !dbg !2711
  call void @llvm.dbg.value(metadata i64 %199, metadata !2231, metadata !DIExpression()), !dbg !2546
  %200 = icmp eq i64 %199, 128, !dbg !2712
  br i1 %200, label %119, label %157, !dbg !2547, !llvm.loop !2713

201:                                              ; preds = %145
  %202 = load ptr, ptr %21, align 8, !dbg !2716, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %202, metadata !2222, metadata !DIExpression()), !dbg !2235
  %203 = load ptr, ptr %22, align 8, !dbg !2717, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %203, metadata !2227, metadata !DIExpression()), !dbg !2235
  %204 = load ptr, ptr %23, align 8, !dbg !2718, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %204, metadata !2228, metadata !DIExpression()), !dbg !2235
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3), !dbg !2650
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4), !dbg !2650
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5), !dbg !2650
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6), !dbg !2650
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %7), !dbg !2650
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %8), !dbg !2650
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %9), !dbg !2650
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %10), !dbg !2650
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %12), !dbg !2650
  store ptr %202, ptr %3, align 8, !dbg !2650, !tbaa !2206
  store ptr %203, ptr %4, align 8, !dbg !2650, !tbaa !2206
  store ptr %204, ptr %5, align 8, !dbg !2650, !tbaa !2206
  store i32 %0, ptr %6, align 4, !dbg !2650, !tbaa !2210
  store ptr %3, ptr %12, align 16, !dbg !2650
  %205 = getelementptr inbounds ptr, ptr %12, i64 1, !dbg !2650
  store ptr %4, ptr %205, align 8, !dbg !2650
  %206 = getelementptr inbounds ptr, ptr %12, i64 2, !dbg !2650
  store ptr %5, ptr %206, align 16, !dbg !2650
  %207 = getelementptr inbounds ptr, ptr %12, i64 3, !dbg !2650
  store ptr %6, ptr %207, align 8, !dbg !2650
  %208 = call i32 @__hipPopCallConfiguration(ptr nonnull %7, ptr nonnull %8, ptr nonnull %9, ptr nonnull %10), !dbg !2650
  %209 = load i64, ptr %9, align 8, !dbg !2650
  %210 = load ptr, ptr %10, align 8, !dbg !2650
  %211 = load i64, ptr %7, align 8, !dbg !2650
  %212 = getelementptr inbounds i8, ptr %7, i64 8, !dbg !2650
  %213 = load i32, ptr %212, align 8, !dbg !2650
  %214 = load i64, ptr %8, align 8, !dbg !2650
  %215 = getelementptr inbounds i8, ptr %8, i64 8, !dbg !2650
  %216 = load i32, ptr %215, align 8, !dbg !2650
  %217 = alloca ptr, align 8
  %218 = call ptr @scabbard.trace.register_job(ptr %210)
  store ptr %218, ptr %217, align 8
  %219 = getelementptr ptr, ptr %11, i64 4
  store ptr %217, ptr %219, align 8
  %220 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z15tick_all_kernelPU7_AtomicmPmPli, i64 %211, i32 %213, i64 %214, i32 %216, ptr noundef nonnull %12, i64 noundef %209, ptr noundef %210), !dbg !2650
  call void @scabbard.trace.register_job_callback(ptr %218, ptr %210)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3), !dbg !2650
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4), !dbg !2650
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5), !dbg !2650
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6), !dbg !2650
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %7), !dbg !2650
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %8), !dbg !2650
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9), !dbg !2650
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %10), !dbg !2650
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %12), !dbg !2650
  br label %221, !dbg !2650

221:                                              ; preds = %201, %145
  %222 = getelementptr inbounds %struct.timespec, ptr %2, i64 0, i32 1
  br label %223, !dbg !2719

223:                                              ; preds = %237, %221
  %224 = phi i64 [ %238, %237 ], [ 64, %221 ]
  br label %225, !dbg !2720

225:                                              ; preds = %223, %233
  call void @llvm.dbg.value(metadata i64 %224, metadata !2218, metadata !DIExpression()), !dbg !2235
  call void @llvm.dbg.value(metadata ptr undef, metadata !2727, metadata !DIExpression()), !dbg !2744
  call void @llvm.dbg.value(metadata i64 0, metadata !2728, metadata !DIExpression()), !dbg !2744
  call void @llvm.dbg.value(metadata i64 1000000, metadata !2735, metadata !DIExpression()), !dbg !2744
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #18, !dbg !2745
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2741, metadata !DIExpression()), !dbg !2746
  store i64 0, ptr %2, align 8, !dbg !2747, !tbaa !2748
  store i64 1000000, ptr %222, align 8, !dbg !2747, !tbaa !2750
  br label %226, !dbg !2720

226:                                              ; preds = %229, %225
  %227 = call i32 @nanosleep(ptr noundef nonnull %2, ptr noundef nonnull %2), !dbg !2751
  %228 = icmp eq i32 %227, -1, !dbg !2752
  br i1 %228, label %229, label %233, !dbg !2753

229:                                              ; preds = %226
  %230 = tail call ptr @__errno_location() #22, !dbg !2754
  %231 = load i32, ptr %230, align 4, !dbg !2754, !tbaa !2210
  %232 = icmp eq i32 %231, 4, !dbg !2755
  br i1 %232, label %226, label %233, !dbg !2720, !llvm.loop !2756

233:                                              ; preds = %226, %229
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #18, !dbg !2758
  %234 = load ptr, ptr %21, align 8, !dbg !2759, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %234, metadata !2222, metadata !DIExpression()), !dbg !2235
  %235 = load atomic i64, ptr %234 seq_cst, align 8, !dbg !2760, !tbaa !2428
  %236 = icmp eq i64 %235, 0, !dbg !2761
  br i1 %236, label %225, label %237, !dbg !2762

237:                                              ; preds = %233
  %238 = add nsw i64 %224, -1, !dbg !2763
  call void @llvm.dbg.value(metadata i64 %238, metadata !2218, metadata !DIExpression()), !dbg !2235
  %239 = icmp ugt i64 %224, 1, !dbg !2764
  br i1 %239, label %223, label %240, !dbg !2765, !llvm.loop !2766

240:                                              ; preds = %237
  %241 = load ptr, ptr %21, align 8, !dbg !2768, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %241, metadata !2222, metadata !DIExpression()), !dbg !2235
  %242 = load atomic i64, ptr %241 seq_cst, align 8, !dbg !2770, !tbaa !2428
  %243 = icmp eq i64 %242, 0, !dbg !2771
  br i1 %243, label %270, label %244, !dbg !2772

244:                                              ; preds = %240
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2773
  call void @llvm.dbg.value(metadata ptr @.str.7, metadata !2280, metadata !DIExpression()), !dbg !2773
  %245 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.7, i64 noundef 59), !dbg !2775
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2253, metadata !DIExpression()), !dbg !2776
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2776
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2778
  %246 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2780, !tbaa !2364
  %247 = getelementptr i8, ptr %246, i64 -24, !dbg !2780
  %248 = load i64, ptr %247, align 8, !dbg !2780
  %249 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %248, !dbg !2780
  call void @llvm.dbg.value(metadata ptr %249, metadata !2366, metadata !DIExpression()), !dbg !2781
  call void @llvm.dbg.value(metadata i8 10, metadata !2378, metadata !DIExpression()), !dbg !2781
  %250 = getelementptr inbounds %"class.std::basic_ios", ptr %249, i64 0, i32 5, !dbg !2783
  %251 = load ptr, ptr %250, align 8, !dbg !2783, !tbaa !2383
  call void @llvm.dbg.value(metadata ptr %251, metadata !2392, metadata !DIExpression()), !dbg !2784
  %252 = icmp eq ptr %251, null, !dbg !2786
  br i1 %252, label %253, label %254, !dbg !2787

253:                                              ; preds = %244
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2788
  unreachable, !dbg !2788

254:                                              ; preds = %244
  call void @llvm.dbg.value(metadata ptr %251, metadata !2410, metadata !DIExpression()), !dbg !2789
  call void @llvm.dbg.value(metadata i8 10, metadata !2418, metadata !DIExpression()), !dbg !2789
  %255 = getelementptr inbounds %"class.std::ctype", ptr %251, i64 0, i32 8, !dbg !2791
  %256 = load i8, ptr %255, align 8, !dbg !2791, !tbaa !2423
  %257 = icmp eq i8 %256, 0, !dbg !2791
  br i1 %257, label %261, label %258, !dbg !2792

258:                                              ; preds = %254
  %259 = getelementptr inbounds %"class.std::ctype", ptr %251, i64 0, i32 9, i64 10, !dbg !2793
  %260 = load i8, ptr %259, align 1, !dbg !2793, !tbaa !2428
  br label %266, !dbg !2794

261:                                              ; preds = %254
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %251), !dbg !2795
  %262 = load ptr, ptr %251, align 8, !dbg !2796, !tbaa !2364
  %263 = getelementptr inbounds ptr, ptr %262, i64 6, !dbg !2796
  %264 = load ptr, ptr %263, align 8, !dbg !2796
  %265 = call noundef signext i8 %264(ptr noundef nonnull align 8 dereferenceable(570) %251, i8 noundef signext 10), !dbg !2796
  br label %266, !dbg !2797

266:                                              ; preds = %258, %261
  %267 = phi i8 [ %260, %258 ], [ %265, %261 ], !dbg !2789
  %268 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %267), !dbg !2798
  call void @llvm.dbg.value(metadata ptr %268, metadata !2342, metadata !DIExpression()), !dbg !2799
  %269 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %268), !dbg !2801
  br label %270, !dbg !2802

270:                                              ; preds = %266, %240
  %271 = load ptr, ptr %22, align 8, !dbg !2803, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %271, metadata !2227, metadata !DIExpression()), !dbg !2235
  call void @"scabbard.trace.host.trace_append$mem"(i16 -32768, ptr null, ptr @"scabbard.metadata.host.srcId$0x0001", i32 130, i32 17)
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4138, ptr %68, ptr @"scabbard.metadata.host.srcId$0x0001", i32 130, i32 17, i64 8192)
  %272 = call i32 @hipMemcpy(ptr noundef nonnull %68, ptr noundef %271, i64 noundef 8192, i32 noundef 2), !dbg !2804
  call void @llvm.dbg.value(metadata i32 %272, metadata !2239, metadata !DIExpression()), !dbg !2805
  %273 = icmp eq i32 %272, 0, !dbg !2807
  br i1 %273, label %278, label %274, !dbg !2808

274:                                              ; preds = %270
  %275 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2809
  %276 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %275, i32 noundef %272), !dbg !2810
  call void @llvm.dbg.value(metadata ptr %276, metadata !2253, metadata !DIExpression()), !dbg !2811
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2811
  %277 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %276), !dbg !2813
  call void @exit(i32 noundef 1) #19, !dbg !2814
  unreachable, !dbg !2814

278:                                              ; preds = %270
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2815
  call void @llvm.dbg.value(metadata ptr @.str.8, metadata !2280, metadata !DIExpression()), !dbg !2815
  %279 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.8, i64 noundef 23), !dbg !2817
  %280 = load ptr, ptr %21, align 8, !dbg !2818, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %280, metadata !2222, metadata !DIExpression()), !dbg !2235
  %281 = load atomic i64, ptr %280 seq_cst, align 8, !dbg !2819, !tbaa !2428
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2820, metadata !DIExpression()), !dbg !2827
  call void @llvm.dbg.value(metadata i64 %281, metadata !2826, metadata !DIExpression()), !dbg !2827
  %282 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %281), !dbg !2829
  call void @llvm.dbg.value(metadata ptr %282, metadata !2274, metadata !DIExpression()), !dbg !2830
  call void @llvm.dbg.value(metadata ptr @.str.9, metadata !2280, metadata !DIExpression()), !dbg !2830
  %283 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %282, ptr noundef nonnull @.str.9, i64 noundef 35), !dbg !2832
  call void @llvm.dbg.value(metadata i64 0, metadata !2233, metadata !DIExpression()), !dbg !2833
  br label %369, !dbg !2834

284:                                              ; preds = %400
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2835
  call void @llvm.dbg.value(metadata ptr @.str.3, metadata !2280, metadata !DIExpression()), !dbg !2835
  %285 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5), !dbg !2838
  call void @llvm.dbg.value(metadata i8 32, metadata !2552, metadata !DIExpression()), !dbg !2839
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2561, metadata !DIExpression()), !dbg !2839
  %286 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2841, !tbaa !2364
  %287 = getelementptr i8, ptr %286, i64 -24, !dbg !2841
  %288 = load i64, ptr %287, align 8, !dbg !2841
  %289 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %288, !dbg !2841
  call void @llvm.dbg.value(metadata ptr %289, metadata !2565, metadata !DIExpression()), !dbg !2842
  call void @llvm.dbg.value(metadata i8 32, metadata !2572, metadata !DIExpression()), !dbg !2842
  call void @llvm.dbg.value(metadata ptr %289, metadata !2577, metadata !DIExpression()), !dbg !2844
  %290 = getelementptr inbounds %"class.std::basic_ios", ptr %289, i64 0, i32 3, !dbg !2846
  %291 = load i8, ptr %290, align 1, !dbg !2846, !tbaa !2587, !range !2588, !noundef !290
  %292 = icmp eq i8 %291, 0, !dbg !2846
  br i1 %292, label %293, label %310, !dbg !2847

293:                                              ; preds = %284
  call void @llvm.dbg.value(metadata ptr %289, metadata !2366, metadata !DIExpression()), !dbg !2848
  call void @llvm.dbg.value(metadata i8 32, metadata !2378, metadata !DIExpression()), !dbg !2848
  %294 = getelementptr inbounds %"class.std::basic_ios", ptr %289, i64 0, i32 5, !dbg !2850
  %295 = load ptr, ptr %294, align 8, !dbg !2850, !tbaa !2383
  call void @llvm.dbg.value(metadata ptr %295, metadata !2392, metadata !DIExpression()), !dbg !2851
  %296 = icmp eq ptr %295, null, !dbg !2853
  br i1 %296, label %297, label %298, !dbg !2854

297:                                              ; preds = %293
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2855
  unreachable, !dbg !2855

298:                                              ; preds = %293
  call void @llvm.dbg.value(metadata ptr %295, metadata !2410, metadata !DIExpression()), !dbg !2856
  call void @llvm.dbg.value(metadata i8 32, metadata !2418, metadata !DIExpression()), !dbg !2856
  %299 = getelementptr inbounds %"class.std::ctype", ptr %295, i64 0, i32 8, !dbg !2858
  %300 = load i8, ptr %299, align 8, !dbg !2858, !tbaa !2423
  %301 = icmp eq i8 %300, 0, !dbg !2858
  br i1 %301, label %302, label %308, !dbg !2859

302:                                              ; preds = %298
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %295), !dbg !2860
  %303 = load ptr, ptr %295, align 8, !dbg !2861, !tbaa !2364
  %304 = getelementptr inbounds ptr, ptr %303, i64 6, !dbg !2861
  %305 = load ptr, ptr %304, align 8, !dbg !2861
  %306 = call noundef signext i8 %305(ptr noundef nonnull align 8 dereferenceable(570) %295, i8 noundef signext 32), !dbg !2861
  %307 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2862, !tbaa !2364
  br label %308, !dbg !2864

308:                                              ; preds = %302, %298
  %309 = phi ptr [ %307, %302 ], [ %286, %298 ], !dbg !2862
  store i8 1, ptr %290, align 1, !dbg !2865, !tbaa !2587
  br label %310, !dbg !2866

310:                                              ; preds = %284, %308
  %311 = phi ptr [ %286, %284 ], [ %309, %308 ], !dbg !2862
  call void @llvm.dbg.value(metadata i8 poison, metadata !2573, metadata !DIExpression()), !dbg !2842
  %312 = getelementptr inbounds %"class.std::basic_ios", ptr %289, i64 0, i32 2, !dbg !2867
  store i8 32, ptr %312, align 8, !dbg !2868, !tbaa !2621
  call void @llvm.dbg.value(metadata i32 8, metadata !2614, metadata !DIExpression()), !dbg !2869
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2613, metadata !DIExpression()), !dbg !2869
  %313 = getelementptr i8, ptr %311, i64 -24, !dbg !2862
  %314 = load i64, ptr %313, align 8, !dbg !2862
  %315 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %314, !dbg !2862
  call void @llvm.dbg.value(metadata ptr %315, metadata !2623, metadata !DIExpression()), !dbg !2870
  call void @llvm.dbg.value(metadata i64 8, metadata !2630, metadata !DIExpression()), !dbg !2870
  %316 = getelementptr inbounds %"class.std::ios_base", ptr %315, i64 0, i32 2, !dbg !2872
  call void @llvm.dbg.value(metadata i64 poison, metadata !2631, metadata !DIExpression()), !dbg !2870
  store i64 8, ptr %316, align 8, !dbg !2873, !tbaa !2637
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2874
  call void @llvm.dbg.value(metadata ptr @.str.5, metadata !2280, metadata !DIExpression()), !dbg !2874
  %317 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.5, i64 noundef 3), !dbg !2876
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2877
  call void @llvm.dbg.value(metadata ptr @.str.6, metadata !2280, metadata !DIExpression()), !dbg !2877
  %318 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.6, i64 noundef 5), !dbg !2879
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2253, metadata !DIExpression()), !dbg !2880
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2880
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !2882
  %319 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2884, !tbaa !2364
  %320 = getelementptr i8, ptr %319, i64 -24, !dbg !2884
  %321 = load i64, ptr %320, align 8, !dbg !2884
  %322 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %321, !dbg !2884
  call void @llvm.dbg.value(metadata ptr %322, metadata !2366, metadata !DIExpression()), !dbg !2885
  call void @llvm.dbg.value(metadata i8 10, metadata !2378, metadata !DIExpression()), !dbg !2885
  %323 = getelementptr inbounds %"class.std::basic_ios", ptr %322, i64 0, i32 5, !dbg !2887
  %324 = load ptr, ptr %323, align 8, !dbg !2887, !tbaa !2383
  call void @llvm.dbg.value(metadata ptr %324, metadata !2392, metadata !DIExpression()), !dbg !2888
  %325 = icmp eq ptr %324, null, !dbg !2890
  br i1 %325, label %326, label %327, !dbg !2891

326:                                              ; preds = %310
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2892
  unreachable, !dbg !2892

327:                                              ; preds = %310
  call void @llvm.dbg.value(metadata ptr %324, metadata !2410, metadata !DIExpression()), !dbg !2893
  call void @llvm.dbg.value(metadata i8 10, metadata !2418, metadata !DIExpression()), !dbg !2893
  %328 = getelementptr inbounds %"class.std::ctype", ptr %324, i64 0, i32 8, !dbg !2895
  %329 = load i8, ptr %328, align 8, !dbg !2895, !tbaa !2423
  %330 = icmp eq i8 %329, 0, !dbg !2895
  br i1 %330, label %334, label %331, !dbg !2896

331:                                              ; preds = %327
  %332 = getelementptr inbounds %"class.std::ctype", ptr %324, i64 0, i32 9, i64 10, !dbg !2897
  %333 = load i8, ptr %332, align 1, !dbg !2897, !tbaa !2428
  br label %339, !dbg !2898

334:                                              ; preds = %327
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %324), !dbg !2899
  %335 = load ptr, ptr %324, align 8, !dbg !2900, !tbaa !2364
  %336 = getelementptr inbounds ptr, ptr %335, i64 6, !dbg !2900
  %337 = load ptr, ptr %336, align 8, !dbg !2900
  %338 = call noundef signext i8 %337(ptr noundef nonnull align 8 dereferenceable(570) %324, i8 noundef signext 10), !dbg !2900
  br label %339, !dbg !2901

339:                                              ; preds = %331, %334
  %340 = phi i8 [ %333, %331 ], [ %338, %334 ], !dbg !2893
  %341 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %340), !dbg !2902
  call void @llvm.dbg.value(metadata ptr %341, metadata !2342, metadata !DIExpression()), !dbg !2903
  %342 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %341), !dbg !2905
  %343 = load ptr, ptr %22, align 8, !dbg !2906, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %343, metadata !2227, metadata !DIExpression()), !dbg !2235
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4160, ptr null, ptr @"scabbard.metadata.host.srcId$0x0001", i32 148, i32 17, i64 0)
  %344 = call i32 @hipFree(ptr noundef %343), !dbg !2907
  call void @llvm.dbg.value(metadata i32 %344, metadata !2239, metadata !DIExpression()), !dbg !2908
  %345 = icmp eq i32 %344, 0, !dbg !2910
  br i1 %345, label %350, label %346, !dbg !2911

346:                                              ; preds = %339
  %347 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2912
  %348 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %347, i32 noundef %344), !dbg !2913
  call void @llvm.dbg.value(metadata ptr %348, metadata !2253, metadata !DIExpression()), !dbg !2914
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2914
  %349 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %348), !dbg !2916
  call void @exit(i32 noundef 1) #19, !dbg !2917
  unreachable, !dbg !2917

350:                                              ; preds = %339
  %351 = load ptr, ptr %21, align 8, !dbg !2918, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %351, metadata !2222, metadata !DIExpression()), !dbg !2235
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4160, ptr null, ptr @"scabbard.metadata.host.srcId$0x0001", i32 149, i32 17, i64 0)
  %352 = call i32 @hipFree(ptr noundef %351), !dbg !2919
  call void @llvm.dbg.value(metadata i32 %352, metadata !2239, metadata !DIExpression()), !dbg !2920
  %353 = icmp eq i32 %352, 0, !dbg !2922
  br i1 %353, label %358, label %354, !dbg !2923

354:                                              ; preds = %350
  %355 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2924
  %356 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %355, i32 noundef %352), !dbg !2925
  call void @llvm.dbg.value(metadata ptr %356, metadata !2253, metadata !DIExpression()), !dbg !2926
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2926
  %357 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %356), !dbg !2928
  call void @exit(i32 noundef 1) #19, !dbg !2929
  unreachable, !dbg !2929

358:                                              ; preds = %350
  %359 = load ptr, ptr %23, align 8, !dbg !2930, !tbaa !2206
  call void @llvm.dbg.value(metadata ptr %359, metadata !2228, metadata !DIExpression()), !dbg !2235
  call void @"scabbard.trace.host.trace_append$alloc"(i16 4160, ptr null, ptr @"scabbard.metadata.host.srcId$0x0001", i32 150, i32 17, i64 0)
  %360 = call i32 @hipFree(ptr noundef %359), !dbg !2931
  call void @llvm.dbg.value(metadata i32 %360, metadata !2239, metadata !DIExpression()), !dbg !2932
  %361 = icmp eq i32 %360, 0, !dbg !2934
  br i1 %361, label %366, label %362, !dbg !2935

362:                                              ; preds = %358
  %363 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !2936
  %364 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %363, i32 noundef %360), !dbg !2937
  call void @llvm.dbg.value(metadata ptr %364, metadata !2253, metadata !DIExpression()), !dbg !2938
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !2938
  %365 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %364), !dbg !2940
  call void @exit(i32 noundef 1) #19, !dbg !2941
  unreachable, !dbg !2941

366:                                              ; preds = %358
  call void @_ZdaPv(ptr noundef nonnull %68) #23, !dbg !2942
  call void @_ZdaPv(ptr noundef nonnull %109) #23, !dbg !2943
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2944
  call void @llvm.dbg.value(metadata ptr @.str.10, metadata !2280, metadata !DIExpression()), !dbg !2944
  %367 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.10, i64 noundef 34), !dbg !2946
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2253, metadata !DIExpression()), !dbg !2947
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2342, metadata !DIExpression()), !dbg !2949
  %368 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout), !dbg !2951
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %23) #18, !dbg !2952
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %22) #18, !dbg !2952
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %21) #18, !dbg !2952
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %20) #18, !dbg !2952
  ret void, !dbg !2952

369:                                              ; preds = %278, %400
  %370 = phi i64 [ 0, %278 ], [ %411, %400 ]
  call void @llvm.dbg.value(metadata i64 %370, metadata !2233, metadata !DIExpression()), !dbg !2833
  %371 = and i64 %370, 15, !dbg !2953
  %372 = icmp eq i64 %371, 0, !dbg !2957
  br i1 %372, label %373, label %375, !dbg !2958

373:                                              ; preds = %369
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !2959
  call void @llvm.dbg.value(metadata ptr @.str.3, metadata !2280, metadata !DIExpression()), !dbg !2959
  %374 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 5), !dbg !2961
  br label %375, !dbg !2962

375:                                              ; preds = %373, %369
  call void @llvm.dbg.value(metadata i8 32, metadata !2552, metadata !DIExpression()), !dbg !2963
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2561, metadata !DIExpression()), !dbg !2963
  %376 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2965, !tbaa !2364
  %377 = getelementptr i8, ptr %376, i64 -24, !dbg !2965
  %378 = load i64, ptr %377, align 8, !dbg !2965
  %379 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %378, !dbg !2965
  call void @llvm.dbg.value(metadata ptr %379, metadata !2565, metadata !DIExpression()), !dbg !2966
  call void @llvm.dbg.value(metadata i8 32, metadata !2572, metadata !DIExpression()), !dbg !2966
  call void @llvm.dbg.value(metadata ptr %379, metadata !2577, metadata !DIExpression()), !dbg !2968
  %380 = getelementptr inbounds %"class.std::basic_ios", ptr %379, i64 0, i32 3, !dbg !2970
  %381 = load i8, ptr %380, align 1, !dbg !2970, !tbaa !2587, !range !2588, !noundef !290
  %382 = icmp eq i8 %381, 0, !dbg !2970
  br i1 %382, label %383, label %400, !dbg !2971

383:                                              ; preds = %375
  call void @llvm.dbg.value(metadata ptr %379, metadata !2366, metadata !DIExpression()), !dbg !2972
  call void @llvm.dbg.value(metadata i8 32, metadata !2378, metadata !DIExpression()), !dbg !2972
  %384 = getelementptr inbounds %"class.std::basic_ios", ptr %379, i64 0, i32 5, !dbg !2974
  %385 = load ptr, ptr %384, align 8, !dbg !2974, !tbaa !2383
  call void @llvm.dbg.value(metadata ptr %385, metadata !2392, metadata !DIExpression()), !dbg !2975
  %386 = icmp eq ptr %385, null, !dbg !2977
  br i1 %386, label %387, label %388, !dbg !2978

387:                                              ; preds = %383
  call void @_ZSt16__throw_bad_castv() #20, !dbg !2979
  unreachable, !dbg !2979

388:                                              ; preds = %383
  call void @llvm.dbg.value(metadata ptr %385, metadata !2410, metadata !DIExpression()), !dbg !2980
  call void @llvm.dbg.value(metadata i8 32, metadata !2418, metadata !DIExpression()), !dbg !2980
  %389 = getelementptr inbounds %"class.std::ctype", ptr %385, i64 0, i32 8, !dbg !2982
  %390 = load i8, ptr %389, align 8, !dbg !2982, !tbaa !2423
  %391 = icmp eq i8 %390, 0, !dbg !2982
  br i1 %391, label %392, label %398, !dbg !2983

392:                                              ; preds = %388
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %385), !dbg !2984
  %393 = load ptr, ptr %385, align 8, !dbg !2985, !tbaa !2364
  %394 = getelementptr inbounds ptr, ptr %393, i64 6, !dbg !2985
  %395 = load ptr, ptr %394, align 8, !dbg !2985
  %396 = call noundef signext i8 %395(ptr noundef nonnull align 8 dereferenceable(570) %385, i8 noundef signext 32), !dbg !2985
  %397 = load ptr, ptr @_ZSt4cout, align 8, !dbg !2986, !tbaa !2364
  br label %398, !dbg !2988

398:                                              ; preds = %392, %388
  %399 = phi ptr [ %397, %392 ], [ %376, %388 ], !dbg !2986
  store i8 1, ptr %380, align 1, !dbg !2989, !tbaa !2587
  br label %400, !dbg !2990

400:                                              ; preds = %375, %398
  %401 = phi ptr [ %376, %375 ], [ %399, %398 ], !dbg !2986
  call void @llvm.dbg.value(metadata i8 poison, metadata !2573, metadata !DIExpression()), !dbg !2966
  %402 = getelementptr inbounds %"class.std::basic_ios", ptr %379, i64 0, i32 2, !dbg !2991
  store i8 32, ptr %402, align 8, !dbg !2992, !tbaa !2621
  call void @llvm.dbg.value(metadata i32 8, metadata !2614, metadata !DIExpression()), !dbg !2993
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2613, metadata !DIExpression()), !dbg !2993
  %403 = getelementptr i8, ptr %401, i64 -24, !dbg !2986
  %404 = load i64, ptr %403, align 8, !dbg !2986
  %405 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %404, !dbg !2986
  call void @llvm.dbg.value(metadata ptr %405, metadata !2623, metadata !DIExpression()), !dbg !2994
  call void @llvm.dbg.value(metadata i64 8, metadata !2630, metadata !DIExpression()), !dbg !2994
  %406 = getelementptr inbounds %"class.std::ios_base", ptr %405, i64 0, i32 2, !dbg !2996
  call void @llvm.dbg.value(metadata i64 poison, metadata !2631, metadata !DIExpression()), !dbg !2994
  store i64 8, ptr %406, align 8, !dbg !2997, !tbaa !2637
  %407 = getelementptr inbounds i64, ptr %68, i64 %370, !dbg !2998
  %408 = load i64, ptr %407, align 8, !dbg !2998, !tbaa !2697
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2820, metadata !DIExpression()), !dbg !2999
  call void @llvm.dbg.value(metadata i64 %408, metadata !2826, metadata !DIExpression()), !dbg !2999
  %409 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %408), !dbg !3001
  call void @llvm.dbg.value(metadata ptr %409, metadata !2274, metadata !DIExpression()), !dbg !3002
  call void @llvm.dbg.value(metadata ptr @.str.4, metadata !2280, metadata !DIExpression()), !dbg !3002
  %410 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %409, ptr noundef nonnull @.str.4, i64 noundef 1), !dbg !3004
  %411 = add nuw nsw i64 %370, 1, !dbg !3005
  call void @llvm.dbg.value(metadata i64 %411, metadata !2233, metadata !DIExpression()), !dbg !2833
  %412 = icmp eq i64 %411, 128, !dbg !3006
  br i1 %412, label %284, label %369, !dbg !2834, !llvm.loop !3007
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #6

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13__HIP_CHECK__10hipError_t(i32 noundef %0) local_unnamed_addr #7 !dbg !2240 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !2239, metadata !DIExpression()), !dbg !3009
  %2 = icmp eq i32 %0, 0, !dbg !3010
  br i1 %2, label %7, label %3, !dbg !3011

3:                                                ; preds = %1
  %4 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !3012
  %5 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %4, i32 noundef %0), !dbg !3013
  call void @llvm.dbg.value(metadata ptr %5, metadata !2253, metadata !DIExpression()), !dbg !3014
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !3014
  %6 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !3016
  tail call void @exit(i32 noundef 1) #19, !dbg !3017
  unreachable, !dbg !3017

7:                                                ; preds = %1
  ret void, !dbg !3018
}

declare !dbg !3019 dso_local i32 @hipGetDevice(ptr noundef) local_unnamed_addr #0

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) local_unnamed_addr #8

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #0

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #8

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull ptr @_Znam(i64 noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #10

declare !dbg !3022 dso_local i32 @hipMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare !dbg !3026 dso_local i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #0

; Function Attrs: norecurse uwtable
define dso_local void @_Z25__device_stub__dummy_initPl(ptr noundef %0) #3 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.dim3, align 8
  %4 = alloca %struct.dim3, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !2206
  %7 = alloca ptr, i32 2, align 8
  %8 = getelementptr ptr, ptr %7, i64 0
  store ptr %2, ptr %8, align 16
  %9 = call i32 @__hipPopCallConfiguration(ptr nonnull %3, ptr nonnull %4, ptr nonnull %5, ptr nonnull %6)
  %10 = load i64, ptr %5, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load i64, ptr %3, align 8
  %13 = getelementptr inbounds i8, ptr %3, i64 8
  %14 = load i32, ptr %13, align 8
  %15 = load i64, ptr %4, align 8
  %16 = getelementptr inbounds i8, ptr %4, i64 8
  %17 = load i32, ptr %16, align 8
  %18 = alloca ptr, align 8
  %19 = call ptr @scabbard.trace.register_job(ptr %11)
  store ptr %19, ptr %18, align 8
  %20 = getelementptr ptr, ptr %7, i64 1
  store ptr %18, ptr %20, align 8
  %21 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z10dummy_initPl, i64 %12, i32 %14, i64 %15, i32 %17, ptr noundef nonnull %8, i64 noundef %10, ptr noundef %11)
  call void @scabbard.trace.register_job_callback(ptr %19, ptr %11)
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #6

declare !dbg !3032 dso_local i32 @hipFree(ptr noundef) local_unnamed_addr #0

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdaPv(ptr noundef) local_unnamed_addr #11

; Function Attrs: norecurse uwtable
define dso_local void @_Z27__device_stub__dummy_kernelv() #3 {
  %1 = alloca %struct.dim3, align 8
  %2 = alloca %struct.dim3, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, i32 2, align 8
  %6 = getelementptr ptr, ptr %5, i64 0
  %7 = call i32 @__hipPopCallConfiguration(ptr nonnull %1, ptr nonnull %2, ptr nonnull %3, ptr nonnull %4)
  %8 = load i64, ptr %3, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load i64, ptr %1, align 8
  %11 = getelementptr inbounds i8, ptr %1, i64 8
  %12 = load i32, ptr %11, align 8
  %13 = load i64, ptr %2, align 8
  %14 = getelementptr inbounds i8, ptr %2, i64 8
  %15 = load i32, ptr %14, align 8
  %16 = alloca ptr, align 8
  %17 = call ptr @scabbard.trace.register_job(ptr %9)
  store ptr %17, ptr %16, align 8
  %18 = getelementptr ptr, ptr %5, i64 1
  store ptr %16, ptr %18, align 8
  %19 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z12dummy_kernelv, i64 %10, i32 %12, i64 %13, i32 %15, ptr noundef nonnull %6, i64 noundef %8, ptr noundef %9)
  call void @scabbard.trace.register_job_callback(ptr %17, ptr %9)
  ret void
}

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #3 !dbg !2108 {
  call void @scabbard.trace.scabbard_init()
  %3 = alloca %struct.dim3, align 8
  %4 = alloca %struct.dim3, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, i32 2, align 8
  %8 = getelementptr ptr, ptr %7, i64 0
  %9 = alloca %struct.hipDeviceProp_t, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !2112, metadata !DIExpression()), !dbg !3035
  call void @llvm.dbg.value(metadata ptr %1, metadata !2113, metadata !DIExpression()), !dbg !3035
  call void @llvm.lifetime.start.p0(i64 792, ptr nonnull %9) #18, !dbg !3036
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2114, metadata !DIExpression()), !dbg !3037
  %10 = call i32 @hipGetDeviceProperties(ptr noundef nonnull %9, i32 noundef 0), !dbg !3038
  call void @llvm.dbg.value(metadata i32 %10, metadata !2239, metadata !DIExpression()), !dbg !3039
  %11 = icmp eq i32 %10, 0, !dbg !3041
  br i1 %11, label %16, label %12, !dbg !3042

12:                                               ; preds = %2
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, ptr noundef nonnull @.str.14), !dbg !3043
  %14 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %13, i32 noundef %10), !dbg !3044
  call void @llvm.dbg.value(metadata ptr %14, metadata !2253, metadata !DIExpression()), !dbg !3045
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !3045
  %15 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8) %14), !dbg !3047
  call void @exit(i32 noundef 1) #19, !dbg !3048
  unreachable, !dbg !3048

16:                                               ; preds = %2
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !3049
  call void @llvm.dbg.value(metadata ptr @.str.11, metadata !2280, metadata !DIExpression()), !dbg !3049
  call void @llvm.dbg.value(metadata ptr @.str.11, metadata !3051, metadata !DIExpression()), !dbg !3054
  %17 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.11, i64 noundef 14), !dbg !3056
  %18 = getelementptr inbounds %struct.hipDeviceProp_t, ptr %9, i64 0, i32 13, !dbg !3057
  %19 = load i32, ptr %18, align 4, !dbg !3057, !tbaa !3058
  %20 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %19), !dbg !3061
  call void @llvm.dbg.value(metadata ptr %20, metadata !2253, metadata !DIExpression()), !dbg !3062
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !3062
  call void @llvm.dbg.value(metadata ptr %20, metadata !2358, metadata !DIExpression()), !dbg !3064
  %21 = load ptr, ptr %20, align 8, !dbg !3066, !tbaa !2364
  %22 = getelementptr i8, ptr %21, i64 -24, !dbg !3066
  %23 = load i64, ptr %22, align 8, !dbg !3066
  %24 = getelementptr inbounds i8, ptr %20, i64 %23, !dbg !3066
  call void @llvm.dbg.value(metadata ptr %24, metadata !2366, metadata !DIExpression()), !dbg !3067
  call void @llvm.dbg.value(metadata i8 10, metadata !2378, metadata !DIExpression()), !dbg !3067
  %25 = getelementptr inbounds %"class.std::basic_ios", ptr %24, i64 0, i32 5, !dbg !3069
  %26 = load ptr, ptr %25, align 8, !dbg !3069, !tbaa !2383
  call void @llvm.dbg.value(metadata ptr %26, metadata !2392, metadata !DIExpression()), !dbg !3070
  %27 = icmp eq ptr %26, null, !dbg !3072
  br i1 %27, label %28, label %29, !dbg !3073

28:                                               ; preds = %16
  call void @_ZSt16__throw_bad_castv() #20, !dbg !3074
  unreachable, !dbg !3074

29:                                               ; preds = %16
  call void @llvm.dbg.value(metadata ptr %26, metadata !2410, metadata !DIExpression()), !dbg !3075
  call void @llvm.dbg.value(metadata i8 10, metadata !2418, metadata !DIExpression()), !dbg !3075
  %30 = getelementptr inbounds %"class.std::ctype", ptr %26, i64 0, i32 8, !dbg !3077
  %31 = load i8, ptr %30, align 8, !dbg !3077, !tbaa !2423
  %32 = icmp eq i8 %31, 0, !dbg !3077
  br i1 %32, label %36, label %33, !dbg !3078

33:                                               ; preds = %29
  %34 = getelementptr inbounds %"class.std::ctype", ptr %26, i64 0, i32 9, i64 10, !dbg !3079
  %35 = load i8, ptr %34, align 1, !dbg !3079, !tbaa !2428
  br label %41, !dbg !3080

36:                                               ; preds = %29
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %26), !dbg !3081
  %37 = load ptr, ptr %26, align 8, !dbg !3082, !tbaa !2364
  %38 = getelementptr inbounds ptr, ptr %37, i64 6, !dbg !3082
  %39 = load ptr, ptr %38, align 8, !dbg !3082
  %40 = call noundef signext i8 %39(ptr noundef nonnull align 8 dereferenceable(570) %26, i8 noundef signext 10), !dbg !3082
  br label %41, !dbg !3083

41:                                               ; preds = %33, %36
  %42 = phi i8 [ %35, %33 ], [ %40, %36 ], !dbg !3075
  %43 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %20, i8 noundef signext %42), !dbg !3084
  call void @llvm.dbg.value(metadata ptr %43, metadata !2342, metadata !DIExpression()), !dbg !3085
  %44 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %43), !dbg !3087
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !3088
  call void @llvm.dbg.value(metadata ptr @.str.12, metadata !2280, metadata !DIExpression()), !dbg !3088
  call void @llvm.dbg.value(metadata ptr @.str.12, metadata !3051, metadata !DIExpression()), !dbg !3090
  %45 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.12, i64 noundef 14), !dbg !3092
  %46 = getelementptr inbounds %struct.hipDeviceProp_t, ptr %9, i64 0, i32 12, !dbg !3093
  %47 = load i32, ptr %46, align 8, !dbg !3093, !tbaa !3094
  %48 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %47), !dbg !3095
  call void @llvm.dbg.value(metadata ptr %48, metadata !2253, metadata !DIExpression()), !dbg !3096
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !3096
  call void @llvm.dbg.value(metadata ptr %48, metadata !2358, metadata !DIExpression()), !dbg !3098
  %49 = load ptr, ptr %48, align 8, !dbg !3100, !tbaa !2364
  %50 = getelementptr i8, ptr %49, i64 -24, !dbg !3100
  %51 = load i64, ptr %50, align 8, !dbg !3100
  %52 = getelementptr inbounds i8, ptr %48, i64 %51, !dbg !3100
  call void @llvm.dbg.value(metadata ptr %52, metadata !2366, metadata !DIExpression()), !dbg !3101
  call void @llvm.dbg.value(metadata i8 10, metadata !2378, metadata !DIExpression()), !dbg !3101
  %53 = getelementptr inbounds %"class.std::basic_ios", ptr %52, i64 0, i32 5, !dbg !3103
  %54 = load ptr, ptr %53, align 8, !dbg !3103, !tbaa !2383
  call void @llvm.dbg.value(metadata ptr %54, metadata !2392, metadata !DIExpression()), !dbg !3104
  %55 = icmp eq ptr %54, null, !dbg !3106
  br i1 %55, label %56, label %57, !dbg !3107

56:                                               ; preds = %41
  call void @_ZSt16__throw_bad_castv() #20, !dbg !3108
  unreachable, !dbg !3108

57:                                               ; preds = %41
  call void @llvm.dbg.value(metadata ptr %54, metadata !2410, metadata !DIExpression()), !dbg !3109
  call void @llvm.dbg.value(metadata i8 10, metadata !2418, metadata !DIExpression()), !dbg !3109
  %58 = getelementptr inbounds %"class.std::ctype", ptr %54, i64 0, i32 8, !dbg !3111
  %59 = load i8, ptr %58, align 8, !dbg !3111, !tbaa !2423
  %60 = icmp eq i8 %59, 0, !dbg !3111
  br i1 %60, label %64, label %61, !dbg !3112

61:                                               ; preds = %57
  %62 = getelementptr inbounds %"class.std::ctype", ptr %54, i64 0, i32 9, i64 10, !dbg !3113
  %63 = load i8, ptr %62, align 1, !dbg !3113, !tbaa !2428
  br label %69, !dbg !3114

64:                                               ; preds = %57
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %54), !dbg !3115
  %65 = load ptr, ptr %54, align 8, !dbg !3116, !tbaa !2364
  %66 = getelementptr inbounds ptr, ptr %65, i64 6, !dbg !3116
  %67 = load ptr, ptr %66, align 8, !dbg !3116
  %68 = call noundef signext i8 %67(ptr noundef nonnull align 8 dereferenceable(570) %54, i8 noundef signext 10), !dbg !3116
  br label %69, !dbg !3117

69:                                               ; preds = %61, %64
  %70 = phi i8 [ %63, %61 ], [ %68, %64 ], !dbg !3109
  %71 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %48, i8 noundef signext %70), !dbg !3118
  call void @llvm.dbg.value(metadata ptr %71, metadata !2342, metadata !DIExpression()), !dbg !3119
  %72 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %71), !dbg !3121
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !3122
  call void @llvm.dbg.value(metadata ptr @.str.13, metadata !2280, metadata !DIExpression()), !dbg !3122
  call void @llvm.dbg.value(metadata ptr @.str.13, metadata !3051, metadata !DIExpression()), !dbg !3124
  %73 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.13, i64 noundef 17), !dbg !3126
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2274, metadata !DIExpression()), !dbg !3127
  call void @llvm.dbg.value(metadata ptr %9, metadata !2280, metadata !DIExpression()), !dbg !3127
  call void @llvm.dbg.value(metadata ptr %9, metadata !3051, metadata !DIExpression()), !dbg !3129
  %74 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %9) #18, !dbg !3131
  %75 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull %9, i64 noundef %74), !dbg !3132
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2253, metadata !DIExpression()), !dbg !3133
  call void @llvm.dbg.value(metadata ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2268, metadata !DIExpression()), !dbg !3133
  call void @llvm.dbg.value(metadata ptr @_ZSt4cout, metadata !2358, metadata !DIExpression()), !dbg !3135
  %76 = load ptr, ptr @_ZSt4cout, align 8, !dbg !3137, !tbaa !2364
  %77 = getelementptr i8, ptr %76, i64 -24, !dbg !3137
  %78 = load i64, ptr %77, align 8, !dbg !3137
  %79 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %78, !dbg !3137
  call void @llvm.dbg.value(metadata ptr %79, metadata !2366, metadata !DIExpression()), !dbg !3138
  call void @llvm.dbg.value(metadata i8 10, metadata !2378, metadata !DIExpression()), !dbg !3138
  %80 = getelementptr inbounds %"class.std::basic_ios", ptr %79, i64 0, i32 5, !dbg !3140
  %81 = load ptr, ptr %80, align 8, !dbg !3140, !tbaa !2383
  call void @llvm.dbg.value(metadata ptr %81, metadata !2392, metadata !DIExpression()), !dbg !3141
  %82 = icmp eq ptr %81, null, !dbg !3143
  br i1 %82, label %83, label %84, !dbg !3144

83:                                               ; preds = %69
  call void @_ZSt16__throw_bad_castv() #20, !dbg !3145
  unreachable, !dbg !3145

84:                                               ; preds = %69
  call void @llvm.dbg.value(metadata ptr %81, metadata !2410, metadata !DIExpression()), !dbg !3146
  call void @llvm.dbg.value(metadata i8 10, metadata !2418, metadata !DIExpression()), !dbg !3146
  %85 = getelementptr inbounds %"class.std::ctype", ptr %81, i64 0, i32 8, !dbg !3148
  %86 = load i8, ptr %85, align 8, !dbg !3148, !tbaa !2423
  %87 = icmp eq i8 %86, 0, !dbg !3148
  br i1 %87, label %91, label %88, !dbg !3149

88:                                               ; preds = %84
  %89 = getelementptr inbounds %"class.std::ctype", ptr %81, i64 0, i32 9, i64 10, !dbg !3150
  %90 = load i8, ptr %89, align 1, !dbg !3150, !tbaa !2428
  br label %96, !dbg !3151

91:                                               ; preds = %84
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %81), !dbg !3152
  %92 = load ptr, ptr %81, align 8, !dbg !3153, !tbaa !2364
  %93 = getelementptr inbounds ptr, ptr %92, i64 6, !dbg !3153
  %94 = load ptr, ptr %93, align 8, !dbg !3153
  %95 = call noundef signext i8 %94(ptr noundef nonnull align 8 dereferenceable(570) %81, i8 noundef signext 10), !dbg !3153
  br label %96, !dbg !3154

96:                                               ; preds = %88, %91
  %97 = phi i8 [ %90, %88 ], [ %95, %91 ], !dbg !3146
  %98 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %97), !dbg !3155
  call void @llvm.dbg.value(metadata ptr %98, metadata !2342, metadata !DIExpression()), !dbg !3156
  %99 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %98), !dbg !3158
  call void @_Z13tick_all_testi(i32 noundef %0), !dbg !3159
  %100 = call i32 @__hipPushCallConfiguration(i64 4294968320, i32 1, i64 4294968320, i32 1, i64 noundef 0, ptr noundef null), !dbg !3160
  %101 = icmp eq i32 %100, 0, !dbg !3160
  br i1 %101, label %102, label %116, !dbg !3161

102:                                              ; preds = %96
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %3), !dbg !3161
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4), !dbg !3161
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5), !dbg !3161
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6), !dbg !3161
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %8), !dbg !3161
  %103 = call i32 @__hipPopCallConfiguration(ptr nonnull %3, ptr nonnull %4, ptr nonnull %5, ptr nonnull %6), !dbg !3161
  %104 = load i64, ptr %5, align 8, !dbg !3161
  %105 = load ptr, ptr %6, align 8, !dbg !3161
  %106 = load i64, ptr %3, align 8, !dbg !3161
  %107 = getelementptr inbounds i8, ptr %3, i64 8, !dbg !3161
  %108 = load i32, ptr %107, align 8, !dbg !3161
  %109 = load i64, ptr %4, align 8, !dbg !3161
  %110 = getelementptr inbounds i8, ptr %4, i64 8, !dbg !3161
  %111 = load i32, ptr %110, align 8, !dbg !3161
  %112 = alloca ptr, align 8
  %113 = call ptr @scabbard.trace.register_job(ptr %105)
  store ptr %113, ptr %112, align 8
  %114 = getelementptr ptr, ptr %7, i64 1
  store ptr %112, ptr %114, align 8
  %115 = call noundef i32 @hipLaunchKernel(ptr noundef nonnull @_Z12dummy_kernelv, i64 %106, i32 %108, i64 %109, i32 %111, ptr noundef nonnull %8, i64 noundef %104, ptr noundef %105), !dbg !3161
  call void @scabbard.trace.register_job_callback(ptr %113, ptr %105)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %3), !dbg !3161
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %4), !dbg !3161
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5), !dbg !3161
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6), !dbg !3161
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8), !dbg !3161
  br label %116, !dbg !3161

116:                                              ; preds = %102, %96
  call void @llvm.lifetime.end.p0(i64 792, ptr nonnull %9) #18, !dbg !3162
  ret i32 0, !dbg !3163
}

declare !dbg !3164 dso_local i32 @hipGetDeviceProperties(ptr noundef, i32 noundef) local_unnamed_addr #0

; Function Attrs: noreturn nounwind
declare !dbg !3168 dso_local void @exit(i32 noundef) local_unnamed_addr #12

declare !dbg !3169 dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef, i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare !dbg !3173 dso_local i64 @strlen(ptr nocapture noundef) local_unnamed_addr #13

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

; Function Attrs: noreturn
declare !dbg !3177 dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #14

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

declare !dbg !3179 dso_local i32 @hipMallocManaged(ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare !dbg !3182 dso_local i32 @hipMalloc(ptr noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertIlEERSoT_(ptr noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

declare !dbg !3185 dso_local i32 @nanosleep(ptr noundef, ptr noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare !dbg !3190 dso_local ptr @__errno_location() local_unnamed_addr #15

declare dso_local i32 @__gxx_personality_v0(...)

declare dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_managed_clock_test.cpp() #16 section ".text.startup" !dbg !3194 {
  tail call void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit), !dbg !3196
  %1 = tail call i32 @__cxa_atexit(ptr nonnull @_ZNSt8ios_base4InitD1Ev, ptr nonnull @_ZStL8__ioinit, ptr nonnull @__dso_handle) #18, !dbg !3200
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
declare void @llvm.dbg.value(metadata, metadata, metadata) #17

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
attributes #3 = { norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { inlinehint mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nobuiltin allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #11 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { mustprogress nofree nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #18 = { nounwind }
attributes #19 = { noreturn nounwind }
attributes #20 = { noreturn }
attributes #21 = { builtin allocsize(0) }
attributes #22 = { nounwind willreturn memory(none) }
attributes #23 = { builtin nounwind }

!llvm.dbg.cu = !{!79}
!llvm.module.flags = !{!2201, !2202, !2203, !2204}
!llvm.ident = !{!2205}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/iostream", directory: "")
!4 = !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 639, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/ios_base.h", directory: "")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 233, size: 1728, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt8ios_base")
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !9, line: 70, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/home/oster/repos/scabbard", checksumkind: CSK_MD5, checksum: "84927e4bf98b7e7efaf685dc29fe5570")
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
!79 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !9, producer: "AMD clang version 16.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.6.0 23243 be997b2f3651a41597d7a41441fff8ade4ac59ac)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !80, retainedTypes: !181, globals: !454, imports: !455, splitDebugInlining: false, nameTableKind: None)
!80 = !{!81, !163, !171}
!81 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipError_t", file: !82, line: 213, baseType: !83, size: 32, elements: !84, identifier: "_ZTS10hipError_t")
!82 = !DIFile(filename: "/opt/rocm-5.6.0/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "d1551dc8d03ade62421a6a2c511a6461")
!83 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!84 = !{!85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162}
!85 = !DIEnumerator(name: "hipSuccess", value: 0, isUnsigned: true)
!86 = !DIEnumerator(name: "hipErrorInvalidValue", value: 1, isUnsigned: true)
!87 = !DIEnumerator(name: "hipErrorOutOfMemory", value: 2, isUnsigned: true)
!88 = !DIEnumerator(name: "hipErrorMemoryAllocation", value: 2, isUnsigned: true)
!89 = !DIEnumerator(name: "hipErrorNotInitialized", value: 3, isUnsigned: true)
!90 = !DIEnumerator(name: "hipErrorInitializationError", value: 3, isUnsigned: true)
!91 = !DIEnumerator(name: "hipErrorDeinitialized", value: 4, isUnsigned: true)
!92 = !DIEnumerator(name: "hipErrorProfilerDisabled", value: 5, isUnsigned: true)
!93 = !DIEnumerator(name: "hipErrorProfilerNotInitialized", value: 6, isUnsigned: true)
!94 = !DIEnumerator(name: "hipErrorProfilerAlreadyStarted", value: 7, isUnsigned: true)
!95 = !DIEnumerator(name: "hipErrorProfilerAlreadyStopped", value: 8, isUnsigned: true)
!96 = !DIEnumerator(name: "hipErrorInvalidConfiguration", value: 9, isUnsigned: true)
!97 = !DIEnumerator(name: "hipErrorInvalidPitchValue", value: 12, isUnsigned: true)
!98 = !DIEnumerator(name: "hipErrorInvalidSymbol", value: 13, isUnsigned: true)
!99 = !DIEnumerator(name: "hipErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!100 = !DIEnumerator(name: "hipErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!101 = !DIEnumerator(name: "hipErrorInsufficientDriver", value: 35, isUnsigned: true)
!102 = !DIEnumerator(name: "hipErrorMissingConfiguration", value: 52, isUnsigned: true)
!103 = !DIEnumerator(name: "hipErrorPriorLaunchFailure", value: 53, isUnsigned: true)
!104 = !DIEnumerator(name: "hipErrorInvalidDeviceFunction", value: 98, isUnsigned: true)
!105 = !DIEnumerator(name: "hipErrorNoDevice", value: 100, isUnsigned: true)
!106 = !DIEnumerator(name: "hipErrorInvalidDevice", value: 101, isUnsigned: true)
!107 = !DIEnumerator(name: "hipErrorInvalidImage", value: 200, isUnsigned: true)
!108 = !DIEnumerator(name: "hipErrorInvalidContext", value: 201, isUnsigned: true)
!109 = !DIEnumerator(name: "hipErrorContextAlreadyCurrent", value: 202, isUnsigned: true)
!110 = !DIEnumerator(name: "hipErrorMapFailed", value: 205, isUnsigned: true)
!111 = !DIEnumerator(name: "hipErrorMapBufferObjectFailed", value: 205, isUnsigned: true)
!112 = !DIEnumerator(name: "hipErrorUnmapFailed", value: 206, isUnsigned: true)
!113 = !DIEnumerator(name: "hipErrorArrayIsMapped", value: 207, isUnsigned: true)
!114 = !DIEnumerator(name: "hipErrorAlreadyMapped", value: 208, isUnsigned: true)
!115 = !DIEnumerator(name: "hipErrorNoBinaryForGpu", value: 209, isUnsigned: true)
!116 = !DIEnumerator(name: "hipErrorAlreadyAcquired", value: 210, isUnsigned: true)
!117 = !DIEnumerator(name: "hipErrorNotMapped", value: 211, isUnsigned: true)
!118 = !DIEnumerator(name: "hipErrorNotMappedAsArray", value: 212, isUnsigned: true)
!119 = !DIEnumerator(name: "hipErrorNotMappedAsPointer", value: 213, isUnsigned: true)
!120 = !DIEnumerator(name: "hipErrorECCNotCorrectable", value: 214, isUnsigned: true)
!121 = !DIEnumerator(name: "hipErrorUnsupportedLimit", value: 215, isUnsigned: true)
!122 = !DIEnumerator(name: "hipErrorContextAlreadyInUse", value: 216, isUnsigned: true)
!123 = !DIEnumerator(name: "hipErrorPeerAccessUnsupported", value: 217, isUnsigned: true)
!124 = !DIEnumerator(name: "hipErrorInvalidKernelFile", value: 218, isUnsigned: true)
!125 = !DIEnumerator(name: "hipErrorInvalidGraphicsContext", value: 219, isUnsigned: true)
!126 = !DIEnumerator(name: "hipErrorInvalidSource", value: 300, isUnsigned: true)
!127 = !DIEnumerator(name: "hipErrorFileNotFound", value: 301, isUnsigned: true)
!128 = !DIEnumerator(name: "hipErrorSharedObjectSymbolNotFound", value: 302, isUnsigned: true)
!129 = !DIEnumerator(name: "hipErrorSharedObjectInitFailed", value: 303, isUnsigned: true)
!130 = !DIEnumerator(name: "hipErrorOperatingSystem", value: 304, isUnsigned: true)
!131 = !DIEnumerator(name: "hipErrorInvalidHandle", value: 400, isUnsigned: true)
!132 = !DIEnumerator(name: "hipErrorInvalidResourceHandle", value: 400, isUnsigned: true)
!133 = !DIEnumerator(name: "hipErrorIllegalState", value: 401, isUnsigned: true)
!134 = !DIEnumerator(name: "hipErrorNotFound", value: 500, isUnsigned: true)
!135 = !DIEnumerator(name: "hipErrorNotReady", value: 600, isUnsigned: true)
!136 = !DIEnumerator(name: "hipErrorIllegalAddress", value: 700, isUnsigned: true)
!137 = !DIEnumerator(name: "hipErrorLaunchOutOfResources", value: 701, isUnsigned: true)
!138 = !DIEnumerator(name: "hipErrorLaunchTimeOut", value: 702, isUnsigned: true)
!139 = !DIEnumerator(name: "hipErrorPeerAccessAlreadyEnabled", value: 704, isUnsigned: true)
!140 = !DIEnumerator(name: "hipErrorPeerAccessNotEnabled", value: 705, isUnsigned: true)
!141 = !DIEnumerator(name: "hipErrorSetOnActiveProcess", value: 708, isUnsigned: true)
!142 = !DIEnumerator(name: "hipErrorContextIsDestroyed", value: 709, isUnsigned: true)
!143 = !DIEnumerator(name: "hipErrorAssert", value: 710, isUnsigned: true)
!144 = !DIEnumerator(name: "hipErrorHostMemoryAlreadyRegistered", value: 712, isUnsigned: true)
!145 = !DIEnumerator(name: "hipErrorHostMemoryNotRegistered", value: 713, isUnsigned: true)
!146 = !DIEnumerator(name: "hipErrorLaunchFailure", value: 719, isUnsigned: true)
!147 = !DIEnumerator(name: "hipErrorCooperativeLaunchTooLarge", value: 720, isUnsigned: true)
!148 = !DIEnumerator(name: "hipErrorNotSupported", value: 801, isUnsigned: true)
!149 = !DIEnumerator(name: "hipErrorStreamCaptureUnsupported", value: 900, isUnsigned: true)
!150 = !DIEnumerator(name: "hipErrorStreamCaptureInvalidated", value: 901, isUnsigned: true)
!151 = !DIEnumerator(name: "hipErrorStreamCaptureMerge", value: 902, isUnsigned: true)
!152 = !DIEnumerator(name: "hipErrorStreamCaptureUnmatched", value: 903, isUnsigned: true)
!153 = !DIEnumerator(name: "hipErrorStreamCaptureUnjoined", value: 904, isUnsigned: true)
!154 = !DIEnumerator(name: "hipErrorStreamCaptureIsolation", value: 905, isUnsigned: true)
!155 = !DIEnumerator(name: "hipErrorStreamCaptureImplicit", value: 906, isUnsigned: true)
!156 = !DIEnumerator(name: "hipErrorCapturedEvent", value: 907, isUnsigned: true)
!157 = !DIEnumerator(name: "hipErrorStreamCaptureWrongThread", value: 908, isUnsigned: true)
!158 = !DIEnumerator(name: "hipErrorGraphExecUpdateFailure", value: 910, isUnsigned: true)
!159 = !DIEnumerator(name: "hipErrorUnknown", value: 999, isUnsigned: true)
!160 = !DIEnumerator(name: "hipErrorRuntimeMemory", value: 1052, isUnsigned: true)
!161 = !DIEnumerator(name: "hipErrorRuntimeOther", value: 1053, isUnsigned: true)
!162 = !DIEnumerator(name: "hipErrorTbd", value: 1054, isUnsigned: true)
!163 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipMemcpyKind", file: !164, line: 345, baseType: !83, size: 32, elements: !165, identifier: "_ZTS13hipMemcpyKind")
!164 = !DIFile(filename: "/opt/rocm-5.6.0/include/hip/driver_types.h", directory: "", checksumkind: CSK_MD5, checksum: "864c13499dbb8252628ddc7a640707f7")
!165 = !{!166, !167, !168, !169, !170}
!166 = !DIEnumerator(name: "hipMemcpyHostToHost", value: 0, isUnsigned: true)
!167 = !DIEnumerator(name: "hipMemcpyHostToDevice", value: 1, isUnsigned: true)
!168 = !DIEnumerator(name: "hipMemcpyDeviceToHost", value: 2, isUnsigned: true)
!169 = !DIEnumerator(name: "hipMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!170 = !DIEnumerator(name: "hipMemcpyDefault", value: 4, isUnsigned: true)
!171 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Ios_Iostate", scope: !2, file: !5, line: 154, baseType: !172, size: 32, elements: !173, identifier: "_ZTSSt12_Ios_Iostate")
!172 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!173 = !{!174, !175, !176, !177, !178, !179, !180}
!174 = !DIEnumerator(name: "_S_goodbit", value: 0)
!175 = !DIEnumerator(name: "_S_badbit", value: 1)
!176 = !DIEnumerator(name: "_S_eofbit", value: 2)
!177 = !DIEnumerator(name: "_S_failbit", value: 4)
!178 = !DIEnumerator(name: "_S_ios_iostate_end", value: 65536)
!179 = !DIEnumerator(name: "_S_ios_iostate_max", value: 2147483647)
!180 = !DIEnumerator(name: "_S_ios_iostate_min", value: -2147483648)
!181 = !{!182, !196, !202, !265, !171, !172, !269, !270, !272, !203, !275, !199, !295, !298, !351, !354, !407, !183, !6, !256, !442, !448}
!182 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !82, line: 971, baseType: !183)
!183 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !82, line: 964, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !184, identifier: "_ZTS4dim3")
!184 = !{!185, !190, !191, !192}
!185 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !183, file: !82, line: 965, baseType: !186, size: 32)
!186 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !187, line: 26, baseType: !188)
!187 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!188 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !189, line: 42, baseType: !83)
!189 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!190 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !183, file: !82, line: 966, baseType: !186, size: 32, offset: 32)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !183, file: !82, line: 967, baseType: !186, size: 32, offset: 64)
!192 = !DISubprogram(name: "dim3", scope: !183, file: !82, line: 969, type: !193, scopeLine: 969, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!193 = !DISubroutineType(types: !194)
!194 = !{null, !195, !186, !186, !186}
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!196 = !DIDerivedType(tag: DW_TAG_typedef, name: "milliseconds", scope: !198, file: !197, line: 885, baseType: !199)
!197 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/chrono.h", directory: "")
!198 = !DINamespace(name: "chrono", scope: !2)
!199 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "duration<long, std::ratio<1L, 1000L> >", scope: !198, file: !197, line: 501, size: 64, flags: DIFlagTypePassByValue, elements: !200, templateParams: !253, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000EEEE")
!200 = !{!201, !204, !210, !214, !219, !220, !224, !228, !231, !232, !235, !238, !239, !240, !241, !242, !247, !248, !251, !252}
!201 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !199, file: !197, line: 676, baseType: !202, size: 64)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !199, file: !197, line: 549, baseType: !203, flags: DIFlagPublic)
!203 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!204 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEE6_S_gcdEll", scope: !199, file: !197, line: 512, type: !205, scopeLine: 512, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!205 = !DISubroutineType(types: !206)
!206 = !{!207, !207, !207}
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !208, line: 101, baseType: !209)
!208 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !189, line: 72, baseType: !203)
!210 = !DISubprogram(name: "duration", scope: !199, file: !197, line: 553, type: !211, scopeLine: 553, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!211 = !DISubroutineType(types: !212)
!212 = !{null, !213}
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!214 = !DISubprogram(name: "duration", scope: !199, file: !197, line: 555, type: !215, scopeLine: 555, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!215 = !DISubroutineType(types: !216)
!216 = !{null, !213, !217}
!217 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !218, size: 64)
!218 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !199)
!219 = !DISubprogram(name: "~duration", scope: !199, file: !197, line: 573, type: !211, scopeLine: 573, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!220 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEaSERKS3_", scope: !199, file: !197, line: 574, type: !221, scopeLine: 574, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!221 = !DISubroutineType(types: !222)
!222 = !{!223, !213, !217}
!223 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !199, size: 64)
!224 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000EEE5countEv", scope: !199, file: !197, line: 578, type: !225, scopeLine: 578, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!225 = !DISubroutineType(types: !226)
!226 = !{!202, !227}
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !218, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!228 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000EEEpsEv", scope: !199, file: !197, line: 584, type: !229, scopeLine: 584, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!229 = !DISubroutineType(types: !230)
!230 = !{!199, !227}
!231 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000EEEngEv", scope: !199, file: !197, line: 588, type: !229, scopeLine: 588, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!232 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEppEv", scope: !199, file: !197, line: 592, type: !233, scopeLine: 592, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!233 = !DISubroutineType(types: !234)
!234 = !{!223, !213}
!235 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEppEi", scope: !199, file: !197, line: 599, type: !236, scopeLine: 599, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!236 = !DISubroutineType(types: !237)
!237 = !{!199, !213, !172}
!238 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEmmEv", scope: !199, file: !197, line: 603, type: !233, scopeLine: 603, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!239 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEmmEi", scope: !199, file: !197, line: 610, type: !236, scopeLine: 610, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!240 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEpLERKS3_", scope: !199, file: !197, line: 614, type: !221, scopeLine: 614, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!241 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEmIERKS3_", scope: !199, file: !197, line: 621, type: !221, scopeLine: 621, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!242 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEmLERKl", scope: !199, file: !197, line: 628, type: !243, scopeLine: 628, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!243 = !DISubroutineType(types: !244)
!244 = !{!223, !213, !245}
!245 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !246, size: 64)
!246 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !202)
!247 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEEdVERKl", scope: !199, file: !197, line: 635, type: !243, scopeLine: 635, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEE4zeroEv", scope: !199, file: !197, line: 664, type: !249, scopeLine: 664, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!249 = !DISubroutineType(types: !250)
!250 = !{!199}
!251 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEE3minEv", scope: !199, file: !197, line: 668, type: !249, scopeLine: 668, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!252 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000EEE3maxEv", scope: !199, file: !197, line: 672, type: !249, scopeLine: 672, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!253 = !{!254, !255}
!254 = !DITemplateTypeParameter(name: "_Rep", type: !203)
!255 = !DITemplateTypeParameter(name: "_Period", type: !256)
!256 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000L>", scope: !2, file: !257, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !258, templateParams: !262, identifier: "_ZTSSt5ratioILl1ELl1000EE")
!257 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ratio", directory: "")
!258 = !{!259, !261}
!259 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !256, file: !257, line: 273, baseType: !260, flags: DIFlagStaticMember, extraData: i64 1)
!260 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !207)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !256, file: !257, line: 276, baseType: !260, flags: DIFlagStaticMember, extraData: i64 1000)
!262 = !{!263, !264}
!263 = !DITemplateValueParameter(name: "_Num", type: !203, value: i64 1)
!264 = !DITemplateValueParameter(name: "_Den", type: !203, value: i64 1000)
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "streamsize", scope: !2, file: !266, line: 68, baseType: !267)
!266 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/postypes.h", directory: "")
!267 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !2, file: !268, line: 299, baseType: !203)
!268 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++config.h", directory: "", checksumkind: CSK_MD5, checksum: "1035510fa573a2a294e7e4fd7d234766")
!269 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!270 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!272 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !273, line: 10, baseType: !274)
!273 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !189, line: 160, baseType: !203)
!275 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ct", scope: !276, file: !197, line: 818, baseType: !288)
!276 = distinct !DISubprogram(name: "operator<<long, std::ratio<1L, 1000L>, long, std::ratio<1L, 1000L> >", linkageName: "_ZNSt6chronoltIlSt5ratioILl1ELl1000EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE", scope: !198, file: !197, line: 813, type: !277, scopeLine: 815, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !283, retainedNodes: !280)
!277 = !DISubroutineType(types: !278)
!278 = !{!279, !217, !217}
!279 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!280 = !{!281, !282}
!281 = !DILocalVariable(name: "__lhs", arg: 1, scope: !276, file: !197, line: 813, type: !217)
!282 = !DILocalVariable(name: "__rhs", arg: 2, scope: !276, file: !197, line: 814, type: !217)
!283 = !{!284, !285, !286, !287}
!284 = !DITemplateTypeParameter(name: "_Rep1", type: !203)
!285 = !DITemplateTypeParameter(name: "_Period1", type: !256)
!286 = !DITemplateTypeParameter(name: "_Rep2", type: !203)
!287 = !DITemplateTypeParameter(name: "_Period2", type: !256)
!288 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !289, file: !197, line: 115, baseType: !199)
!289 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "common_type<std::chrono::duration<long, std::ratio<1L, 1000L> >, std::chrono::duration<long, std::ratio<1L, 1000L> > >", scope: !2, file: !197, line: 112, size: 8, flags: DIFlagTypePassByValue, elements: !290, templateParams: !291, identifier: "_ZTSSt11common_typeIJNSt6chrono8durationIlSt5ratioILl1ELl1000EEEES4_EE")
!290 = !{}
!291 = !{!292}
!292 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tp", value: !293)
!293 = !{!294, !294}
!294 = !DITemplateTypeParameter(type: !199)
!295 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "duration<long, std::ratio<1L, 1L> >", scope: !198, file: !197, line: 501, size: 64, flags: DIFlagTypePassByValue, elements: !296, templateParams: !343, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1EEEE")
!296 = !{!297, !299, !300, !304, !309, !310, !314, !318, !321, !322, !325, !328, !329, !330, !331, !332, !337, !338, !341, !342}
!297 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !295, file: !197, line: 676, baseType: !298, size: 64)
!298 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !295, file: !197, line: 549, baseType: !203, flags: DIFlagPublic)
!299 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE6_S_gcdEll", scope: !295, file: !197, line: 512, type: !205, scopeLine: 512, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!300 = !DISubprogram(name: "duration", scope: !295, file: !197, line: 553, type: !301, scopeLine: 553, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!301 = !DISubroutineType(types: !302)
!302 = !{null, !303}
!303 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !295, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!304 = !DISubprogram(name: "duration", scope: !295, file: !197, line: 555, type: !305, scopeLine: 555, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!305 = !DISubroutineType(types: !306)
!306 = !{null, !303, !307}
!307 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !308, size: 64)
!308 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !295)
!309 = !DISubprogram(name: "~duration", scope: !295, file: !197, line: 573, type: !301, scopeLine: 573, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!310 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEaSERKS3_", scope: !295, file: !197, line: 574, type: !311, scopeLine: 574, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!311 = !DISubroutineType(types: !312)
!312 = !{!313, !303, !307}
!313 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !295, size: 64)
!314 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv", scope: !295, file: !197, line: 578, type: !315, scopeLine: 578, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!315 = !DISubroutineType(types: !316)
!316 = !{!298, !317}
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !308, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!318 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEEpsEv", scope: !295, file: !197, line: 584, type: !319, scopeLine: 584, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!319 = !DISubroutineType(types: !320)
!320 = !{!295, !317}
!321 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEEngEv", scope: !295, file: !197, line: 588, type: !319, scopeLine: 588, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!322 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEppEv", scope: !295, file: !197, line: 592, type: !323, scopeLine: 592, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!323 = !DISubroutineType(types: !324)
!324 = !{!313, !303}
!325 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEppEi", scope: !295, file: !197, line: 599, type: !326, scopeLine: 599, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!326 = !DISubroutineType(types: !327)
!327 = !{!295, !303, !172}
!328 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmmEv", scope: !295, file: !197, line: 603, type: !323, scopeLine: 603, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!329 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmmEi", scope: !295, file: !197, line: 610, type: !326, scopeLine: 610, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!330 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEpLERKS3_", scope: !295, file: !197, line: 614, type: !311, scopeLine: 614, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!331 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmIERKS3_", scope: !295, file: !197, line: 621, type: !311, scopeLine: 621, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!332 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmLERKl", scope: !295, file: !197, line: 628, type: !333, scopeLine: 628, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!333 = !DISubroutineType(types: !334)
!334 = !{!313, !303, !335}
!335 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !336, size: 64)
!336 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !298)
!337 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEdVERKl", scope: !295, file: !197, line: 635, type: !333, scopeLine: 635, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!338 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE4zeroEv", scope: !295, file: !197, line: 664, type: !339, scopeLine: 664, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!339 = !DISubroutineType(types: !340)
!340 = !{!295}
!341 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE3minEv", scope: !295, file: !197, line: 668, type: !339, scopeLine: 668, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!342 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE3maxEv", scope: !295, file: !197, line: 672, type: !339, scopeLine: 672, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!343 = !{!254, !344}
!344 = !DITemplateTypeParameter(name: "_Period", type: !345, defaulted: true)
!345 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1L>", scope: !2, file: !257, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !346, templateParams: !349, identifier: "_ZTSSt5ratioILl1ELl1EE")
!346 = !{!347, !348}
!347 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !345, file: !257, line: 273, baseType: !260, flags: DIFlagStaticMember, extraData: i64 1)
!348 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !345, file: !257, line: 276, baseType: !260, flags: DIFlagStaticMember, extraData: i64 1)
!349 = !{!263, !350}
!350 = !DITemplateValueParameter(name: "_Den", type: !203, defaulted: true, value: i64 1)
!351 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "duration<long, std::ratio<1L, 1000000000L> >", scope: !198, file: !197, line: 501, size: 64, flags: DIFlagTypePassByValue, elements: !352, templateParams: !399, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEE")
!352 = !{!353, !355, !356, !360, !365, !366, !370, !374, !377, !378, !381, !384, !385, !386, !387, !388, !393, !394, !397, !398}
!353 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !351, file: !197, line: 676, baseType: !354, size: 64)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !351, file: !197, line: 549, baseType: !203, flags: DIFlagPublic)
!355 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE6_S_gcdEll", scope: !351, file: !197, line: 512, type: !205, scopeLine: 512, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!356 = !DISubprogram(name: "duration", scope: !351, file: !197, line: 553, type: !357, scopeLine: 553, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!357 = !DISubroutineType(types: !358)
!358 = !{null, !359}
!359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !351, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!360 = !DISubprogram(name: "duration", scope: !351, file: !197, line: 555, type: !361, scopeLine: 555, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!361 = !DISubroutineType(types: !362)
!362 = !{null, !359, !363}
!363 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !364, size: 64)
!364 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !351)
!365 = !DISubprogram(name: "~duration", scope: !351, file: !197, line: 573, type: !357, scopeLine: 573, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!366 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEaSERKS3_", scope: !351, file: !197, line: 574, type: !367, scopeLine: 574, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!367 = !DISubroutineType(types: !368)
!368 = !{!369, !359, !363}
!369 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !351, size: 64)
!370 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv", scope: !351, file: !197, line: 578, type: !371, scopeLine: 578, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!371 = !DISubroutineType(types: !372)
!372 = !{!354, !373}
!373 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !364, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!374 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpsEv", scope: !351, file: !197, line: 584, type: !375, scopeLine: 584, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!375 = !DISubroutineType(types: !376)
!376 = !{!351, !373}
!377 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEngEv", scope: !351, file: !197, line: 588, type: !375, scopeLine: 588, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!378 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEv", scope: !351, file: !197, line: 592, type: !379, scopeLine: 592, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!379 = !DISubroutineType(types: !380)
!380 = !{!369, !359}
!381 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEi", scope: !351, file: !197, line: 599, type: !382, scopeLine: 599, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!382 = !DISubroutineType(types: !383)
!383 = !{!351, !359, !172}
!384 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEv", scope: !351, file: !197, line: 603, type: !379, scopeLine: 603, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!385 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEi", scope: !351, file: !197, line: 610, type: !382, scopeLine: 610, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!386 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpLERKS3_", scope: !351, file: !197, line: 614, type: !367, scopeLine: 614, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!387 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmIERKS3_", scope: !351, file: !197, line: 621, type: !367, scopeLine: 621, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!388 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmLERKl", scope: !351, file: !197, line: 628, type: !389, scopeLine: 628, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!389 = !DISubroutineType(types: !390)
!390 = !{!369, !359, !391}
!391 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !392, size: 64)
!392 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !354)
!393 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEdVERKl", scope: !351, file: !197, line: 635, type: !389, scopeLine: 635, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!394 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE4zeroEv", scope: !351, file: !197, line: 664, type: !395, scopeLine: 664, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!395 = !DISubroutineType(types: !396)
!396 = !{!351}
!397 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3minEv", scope: !351, file: !197, line: 668, type: !395, scopeLine: 668, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!398 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3maxEv", scope: !351, file: !197, line: 672, type: !395, scopeLine: 672, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!399 = !{!254, !400}
!400 = !DITemplateTypeParameter(name: "_Period", type: !401)
!401 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000000000L>", scope: !2, file: !257, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !402, templateParams: !405, identifier: "_ZTSSt5ratioILl1ELl1000000000EE")
!402 = !{!403, !404}
!403 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !401, file: !257, line: 273, baseType: !260, flags: DIFlagStaticMember, extraData: i64 1)
!404 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !401, file: !257, line: 276, baseType: !260, flags: DIFlagStaticMember, extraData: i64 1000000000)
!405 = !{!263, !406}
!406 = !DITemplateValueParameter(name: "_Den", type: !203, value: i64 1000000000)
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cd", scope: !408, file: !197, line: 706, baseType: !411)
!408 = distinct !DISubprogram(name: "operator-<long, std::ratio<1L, 1000L>, long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chronomiIlSt5ratioILl1ELl1000EElS1_ILl1ELl1EEEENSt11common_typeIJNS_8durationIT_T0_EENS5_IT1_T2_EEEE4typeERKS8_RKSB_", scope: !198, file: !197, line: 701, type: !409, scopeLine: 703, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !441, retainedNodes: !438)
!409 = !DISubroutineType(types: !410)
!410 = !{!411, !217, !307}
!411 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !412, file: !197, line: 93, baseType: !199)
!412 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__duration_common_type<std::common_type<long, long>, std::ratio<1L, 1000L>, std::ratio<1L, 1L>, void>", scope: !2, file: !197, line: 82, size: 8, flags: DIFlagTypePassByValue, elements: !290, templateParams: !413, identifier: "_ZTSSt22__duration_common_typeISt11common_typeIJllEESt5ratioILl1ELl1000EES2_ILl1ELl1EEvE")
!413 = !{!414, !285, !436, !437}
!414 = !DITemplateTypeParameter(name: "_CT", type: !415)
!415 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "common_type<long, long>", scope: !2, file: !416, line: 2325, size: 8, flags: DIFlagTypePassByValue, elements: !417, templateParams: !432, identifier: "_ZTSSt11common_typeIJllEE")
!416 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/type_traits", directory: "")
!417 = !{!418}
!418 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !415, baseType: !419, extraData: i32 0)
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !420, file: !416, line: 2320, baseType: !429)
!420 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__common_type_impl<long, long, long, long>", scope: !2, file: !416, line: 2315, size: 8, flags: DIFlagTypePassByValue, elements: !421, templateParams: !424, identifier: "_ZTSSt18__common_type_implIllllE")
!421 = !{!422}
!422 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !420, baseType: !423, flags: DIFlagPrivate, extraData: i32 0)
!423 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__do_common_type_impl", scope: !2, file: !416, line: 2264, size: 8, flags: DIFlagTypePassByValue, elements: !290, identifier: "_ZTSSt21__do_common_type_impl")
!424 = !{!425, !426, !427, !428}
!425 = !DITemplateTypeParameter(name: "_Tp1", type: !203)
!426 = !DITemplateTypeParameter(name: "_Tp2", type: !203)
!427 = !DITemplateTypeParameter(name: "_Dp1", type: !203)
!428 = !DITemplateTypeParameter(name: "_Dp2", type: !203)
!429 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__success_type<long>", scope: !2, file: !416, line: 262, size: 8, flags: DIFlagTypePassByValue, elements: !290, templateParams: !430, identifier: "_ZTSSt14__success_typeIlE")
!430 = !{!431}
!431 = !DITemplateTypeParameter(name: "_Tp", type: !203)
!432 = !{!433}
!433 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tp", value: !434)
!434 = !{!435, !435}
!435 = !DITemplateTypeParameter(type: !203)
!436 = !DITemplateTypeParameter(name: "_Period2", type: !345)
!437 = !DITemplateTypeParameter(type: null, defaulted: true)
!438 = !{!439, !440}
!439 = !DILocalVariable(name: "__lhs", arg: 1, scope: !408, file: !197, line: 701, type: !217)
!440 = !DILocalVariable(name: "__rhs", arg: 2, scope: !408, file: !197, line: 702, type: !307)
!441 = !{!284, !285, !286, !436}
!442 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1000000L, 1L>", scope: !2, file: !257, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !443, templateParams: !446, identifier: "_ZTSSt5ratioILl1000000ELl1EE")
!443 = !{!444, !445}
!444 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !442, file: !257, line: 273, baseType: !260, flags: DIFlagStaticMember, extraData: i64 1000000)
!445 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !442, file: !257, line: 276, baseType: !260, flags: DIFlagStaticMember, extraData: i64 1)
!446 = !{!447, !350}
!447 = !DITemplateValueParameter(name: "_Num", type: !203, value: i64 1000000)
!448 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1000L, 1L>", scope: !2, file: !257, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !449, templateParams: !452, identifier: "_ZTSSt5ratioILl1000ELl1EE")
!449 = !{!450, !451}
!450 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !448, file: !257, line: 273, baseType: !260, flags: DIFlagStaticMember, extraData: i64 1000)
!451 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !448, file: !257, line: 276, baseType: !260, flags: DIFlagStaticMember, extraData: i64 1)
!452 = !{!453, !350}
!453 = !DITemplateValueParameter(name: "_Num", type: !203, value: i64 1000)
!454 = !{!0, !7, !15, !20, !25, !30, !35, !40, !42, !47, !52, !57, !62, !67, !69, !74}
!455 = !{!456, !462, !469, !471, !473, !477, !479, !481, !483, !485, !487, !489, !491, !496, !500, !502, !504, !509, !511, !513, !515, !517, !519, !521, !524, !527, !529, !533, !538, !540, !542, !544, !546, !548, !550, !552, !554, !556, !558, !562, !566, !568, !570, !572, !574, !576, !578, !580, !582, !584, !586, !588, !590, !592, !594, !596, !600, !604, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !630, !634, !638, !640, !642, !644, !649, !653, !657, !659, !661, !663, !665, !667, !669, !671, !673, !675, !677, !679, !681, !685, !689, !693, !695, !697, !699, !704, !708, !712, !714, !716, !718, !720, !722, !724, !728, !732, !734, !736, !738, !740, !744, !748, !752, !754, !756, !758, !760, !762, !764, !768, !772, !776, !778, !782, !786, !788, !790, !792, !794, !796, !798, !802, !806, !812, !816, !823, !828, !830, !833, !837, !841, !852, !854, !858, !862, !866, !871, !875, !879, !883, !887, !895, !899, !903, !905, !909, !913, !917, !923, !927, !931, !933, !941, !945, !952, !954, !958, !962, !966, !970, !975, !979, !983, !984, !985, !986, !988, !989, !990, !991, !992, !993, !994, !996, !997, !998, !999, !1000, !1001, !1002, !1004, !1005, !1006, !1007, !1008, !1009, !1010, !1011, !1012, !1013, !1014, !1015, !1016, !1017, !1018, !1019, !1020, !1021, !1022, !1023, !1024, !1025, !1026, !1027, !1028, !1031, !1033, !1035, !1037, !1039, !1041, !1043, !1045, !1047, !1049, !1051, !1053, !1055, !1057, !1059, !1061, !1063, !1065, !1067, !1069, !1071, !1073, !1075, !1077, !1079, !1081, !1085, !1087, !1089, !1093, !1097, !1099, !1101, !1103, !1105, !1107, !1109, !1111, !1113, !1115, !1117, !1119, !1121, !1123, !1125, !1127, !1129, !1131, !1133, !1135, !1137, !1139, !1144, !1146, !1148, !1150, !1152, !1154, !1156, !1158, !1160, !1162, !1164, !1166, !1168, !1170, !1172, !1174, !1176, !1178, !1180, !1182, !1186, !1188, !1190, !1192, !1194, !1196, !1198, !1200, !1202, !1204, !1206, !1208, !1210, !1212, !1214, !1216, !1218, !1220, !1222, !1224, !1226, !1228, !1230, !1232, !1234, !1236, !1238, !1240, !1242, !1244, !1246, !1248, !1250, !1252, !1254, !1256, !1258, !1260, !1262, !1264, !1266, !1268, !1270, !1272, !1274, !1276, !1278, !1280, !1282, !1284, !1286, !1288, !1290, !1292, !1294, !1298, !1302, !1317, !1320, !1325, !1383, !1388, !1392, !1396, !1400, !1404, !1406, !1408, !1412, !1418, !1422, !1428, !1434, !1436, !1440, !1444, !1448, !1452, !1464, !1466, !1470, !1474, !1478, !1480, !1484, !1488, !1492, !1494, !1496, !1500, !1521, !1525, !1529, !1533, !1535, !1541, !1543, !1549, !1553, !1557, !1561, !1565, !1569, !1573, !1575, !1577, !1581, !1585, !1589, !1591, !1595, !1599, !1601, !1603, !1607, !1611, !1615, !1619, !1620, !1621, !1622, !1623, !1624, !1625, !1626, !1627, !1628, !1629, !1634, !1638, !1641, !1644, !1646, !1648, !1650, !1652, !1655, !1658, !1661, !1664, !1665, !1667, !1670, !1673, !1674, !1677, !1679, !1681, !1683, !1685, !1688, !1691, !1694, !1697, !1700, !1702, !1706, !1710, !1715, !1719, !1721, !1723, !1725, !1727, !1729, !1731, !1733, !1735, !1737, !1739, !1741, !1743, !1745, !1749, !1755, !1760, !1764, !1766, !1768, !1770, !1772, !1779, !1783, !1787, !1791, !1795, !1799, !1804, !1808, !1810, !1814, !1820, !1824, !1829, !1831, !1834, !1838, !1842, !1844, !1846, !1848, !1850, !1854, !1856, !1858, !1862, !1866, !1870, !1874, !1878, !1882, !1884, !1888, !1892, !1896, !1900, !1902, !1904, !1908, !1912, !1913, !1914, !1915, !1916, !1917, !1923, !1926, !1927, !1929, !1931, !1933, !1935, !1939, !1941, !1943, !1945, !1947, !1949, !1951, !1953, !1955, !1959, !1963, !1965, !1969, !1973, !1978, !1979, !1980, !1985, !1989, !1994, !1999, !2003, !2009, !2013, !2015, !2019, !2026, !2031, !2034, !2040, !2044, !2049, !2051, !2055, !2059, !2061, !2063, !2065, !2069, !2073, !2077, !2081, !2085, !2087, !2089, !2091, !2095, !2099, !2103, !2105, !2107}
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !457, file: !461, line: 52)
!457 = !DISubprogram(name: "abs", scope: !458, file: !458, line: 848, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!458 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!459 = !DISubroutineType(types: !460)
!460 = !{!172, !172}
!461 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/std_abs.h", directory: "")
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !463, file: !468, line: 83)
!463 = !DISubprogram(name: "acos", scope: !464, file: !464, line: 53, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!464 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "8c6e2d0d2bda65bc5ba1ca02b65383b7")
!465 = !DISubroutineType(types: !466)
!466 = !{!467, !467}
!467 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!468 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cmath", directory: "")
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !470, file: !468, line: 102)
!470 = !DISubprogram(name: "asin", scope: !464, file: !464, line: 55, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !472, file: !468, line: 121)
!472 = !DISubprogram(name: "atan", scope: !464, file: !464, line: 57, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !474, file: !468, line: 140)
!474 = !DISubprogram(name: "atan2", scope: !464, file: !464, line: 59, type: !475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!475 = !DISubroutineType(types: !476)
!476 = !{!467, !467, !467}
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !468, line: 161)
!478 = !DISubprogram(name: "ceil", scope: !464, file: !464, line: 159, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !480, file: !468, line: 180)
!480 = !DISubprogram(name: "cos", scope: !464, file: !464, line: 62, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !482, file: !468, line: 199)
!482 = !DISubprogram(name: "cosh", scope: !464, file: !464, line: 71, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !484, file: !468, line: 218)
!484 = !DISubprogram(name: "exp", scope: !464, file: !464, line: 95, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !486, file: !468, line: 237)
!486 = !DISubprogram(name: "fabs", scope: !464, file: !464, line: 162, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !488, file: !468, line: 256)
!488 = !DISubprogram(name: "floor", scope: !464, file: !464, line: 165, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !490, file: !468, line: 275)
!490 = !DISubprogram(name: "fmod", scope: !464, file: !464, line: 168, type: !475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !492, file: !468, line: 296)
!492 = !DISubprogram(name: "frexp", scope: !464, file: !464, line: 98, type: !493, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!493 = !DISubroutineType(types: !494)
!494 = !{!467, !467, !495}
!495 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !497, file: !468, line: 315)
!497 = !DISubprogram(name: "ldexp", scope: !464, file: !464, line: 101, type: !498, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!498 = !DISubroutineType(types: !499)
!499 = !{!467, !467, !172}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !501, file: !468, line: 334)
!501 = !DISubprogram(name: "log", scope: !464, file: !464, line: 104, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !503, file: !468, line: 353)
!503 = !DISubprogram(name: "log10", scope: !464, file: !464, line: 107, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !505, file: !468, line: 372)
!505 = !DISubprogram(name: "modf", scope: !464, file: !464, line: 110, type: !506, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!506 = !DISubroutineType(types: !507)
!507 = !{!467, !467, !508}
!508 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !467, size: 64)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !510, file: !468, line: 384)
!510 = !DISubprogram(name: "pow", scope: !464, file: !464, line: 140, type: !475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !512, file: !468, line: 421)
!512 = !DISubprogram(name: "sin", scope: !464, file: !464, line: 64, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !514, file: !468, line: 440)
!514 = !DISubprogram(name: "sinh", scope: !464, file: !464, line: 73, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !516, file: !468, line: 459)
!516 = !DISubprogram(name: "sqrt", scope: !464, file: !464, line: 143, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !518, file: !468, line: 478)
!518 = !DISubprogram(name: "tan", scope: !464, file: !464, line: 66, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !520, file: !468, line: 497)
!520 = !DISubprogram(name: "tanh", scope: !464, file: !464, line: 75, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !522, file: !468, line: 1065)
!522 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !523, line: 164, baseType: !467)
!523 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "f3450d1d586f704597de1a1b2bed18f3")
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !525, file: !468, line: 1066)
!525 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !523, line: 163, baseType: !526)
!526 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !528, file: !468, line: 1069)
!528 = !DISubprogram(name: "acosh", scope: !464, file: !464, line: 85, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !530, file: !468, line: 1070)
!530 = !DISubprogram(name: "acoshf", scope: !464, file: !464, line: 85, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!531 = !DISubroutineType(types: !532)
!532 = !{!526, !526}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !534, file: !468, line: 1071)
!534 = !DISubprogram(name: "acoshl", scope: !464, file: !464, line: 85, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!535 = !DISubroutineType(types: !536)
!536 = !{!537, !537}
!537 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !539, file: !468, line: 1073)
!539 = !DISubprogram(name: "asinh", scope: !464, file: !464, line: 87, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !541, file: !468, line: 1074)
!541 = !DISubprogram(name: "asinhf", scope: !464, file: !464, line: 87, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !543, file: !468, line: 1075)
!543 = !DISubprogram(name: "asinhl", scope: !464, file: !464, line: 87, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !545, file: !468, line: 1077)
!545 = !DISubprogram(name: "atanh", scope: !464, file: !464, line: 89, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !547, file: !468, line: 1078)
!547 = !DISubprogram(name: "atanhf", scope: !464, file: !464, line: 89, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !549, file: !468, line: 1079)
!549 = !DISubprogram(name: "atanhl", scope: !464, file: !464, line: 89, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !551, file: !468, line: 1081)
!551 = !DISubprogram(name: "cbrt", scope: !464, file: !464, line: 152, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !553, file: !468, line: 1082)
!553 = !DISubprogram(name: "cbrtf", scope: !464, file: !464, line: 152, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !555, file: !468, line: 1083)
!555 = !DISubprogram(name: "cbrtl", scope: !464, file: !464, line: 152, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !557, file: !468, line: 1085)
!557 = !DISubprogram(name: "copysign", scope: !464, file: !464, line: 198, type: !475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !559, file: !468, line: 1086)
!559 = !DISubprogram(name: "copysignf", scope: !464, file: !464, line: 198, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!560 = !DISubroutineType(types: !561)
!561 = !{!526, !526, !526}
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !563, file: !468, line: 1087)
!563 = !DISubprogram(name: "copysignl", scope: !464, file: !464, line: 198, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!564 = !DISubroutineType(types: !565)
!565 = !{!537, !537, !537}
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !567, file: !468, line: 1089)
!567 = !DISubprogram(name: "erf", scope: !464, file: !464, line: 231, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !569, file: !468, line: 1090)
!569 = !DISubprogram(name: "erff", scope: !464, file: !464, line: 231, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !571, file: !468, line: 1091)
!571 = !DISubprogram(name: "erfl", scope: !464, file: !464, line: 231, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !573, file: !468, line: 1093)
!573 = !DISubprogram(name: "erfc", scope: !464, file: !464, line: 232, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !575, file: !468, line: 1094)
!575 = !DISubprogram(name: "erfcf", scope: !464, file: !464, line: 232, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !577, file: !468, line: 1095)
!577 = !DISubprogram(name: "erfcl", scope: !464, file: !464, line: 232, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !579, file: !468, line: 1097)
!579 = !DISubprogram(name: "exp2", scope: !464, file: !464, line: 130, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !581, file: !468, line: 1098)
!581 = !DISubprogram(name: "exp2f", scope: !464, file: !464, line: 130, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !583, file: !468, line: 1099)
!583 = !DISubprogram(name: "exp2l", scope: !464, file: !464, line: 130, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !585, file: !468, line: 1101)
!585 = !DISubprogram(name: "expm1", scope: !464, file: !464, line: 119, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !587, file: !468, line: 1102)
!587 = !DISubprogram(name: "expm1f", scope: !464, file: !464, line: 119, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !589, file: !468, line: 1103)
!589 = !DISubprogram(name: "expm1l", scope: !464, file: !464, line: 119, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !591, file: !468, line: 1105)
!591 = !DISubprogram(name: "fdim", scope: !464, file: !464, line: 329, type: !475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !593, file: !468, line: 1106)
!593 = !DISubprogram(name: "fdimf", scope: !464, file: !464, line: 329, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !595, file: !468, line: 1107)
!595 = !DISubprogram(name: "fdiml", scope: !464, file: !464, line: 329, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !597, file: !468, line: 1109)
!597 = !DISubprogram(name: "fma", scope: !464, file: !464, line: 340, type: !598, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!598 = !DISubroutineType(types: !599)
!599 = !{!467, !467, !467, !467}
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !601, file: !468, line: 1110)
!601 = !DISubprogram(name: "fmaf", scope: !464, file: !464, line: 340, type: !602, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!602 = !DISubroutineType(types: !603)
!603 = !{!526, !526, !526, !526}
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !605, file: !468, line: 1111)
!605 = !DISubprogram(name: "fmal", scope: !464, file: !464, line: 340, type: !606, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!606 = !DISubroutineType(types: !607)
!607 = !{!537, !537, !537, !537}
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !609, file: !468, line: 1113)
!609 = !DISubprogram(name: "fmax", scope: !464, file: !464, line: 333, type: !475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !611, file: !468, line: 1114)
!611 = !DISubprogram(name: "fmaxf", scope: !464, file: !464, line: 333, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !613, file: !468, line: 1115)
!613 = !DISubprogram(name: "fmaxl", scope: !464, file: !464, line: 333, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !615, file: !468, line: 1117)
!615 = !DISubprogram(name: "fmin", scope: !464, file: !464, line: 336, type: !475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !617, file: !468, line: 1118)
!617 = !DISubprogram(name: "fminf", scope: !464, file: !464, line: 336, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !619, file: !468, line: 1119)
!619 = !DISubprogram(name: "fminl", scope: !464, file: !464, line: 336, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !621, file: !468, line: 1121)
!621 = !DISubprogram(name: "hypot", scope: !464, file: !464, line: 147, type: !475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !623, file: !468, line: 1122)
!623 = !DISubprogram(name: "hypotf", scope: !464, file: !464, line: 147, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !625, file: !468, line: 1123)
!625 = !DISubprogram(name: "hypotl", scope: !464, file: !464, line: 147, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !627, file: !468, line: 1125)
!627 = !DISubprogram(name: "ilogb", scope: !464, file: !464, line: 283, type: !628, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!628 = !DISubroutineType(types: !629)
!629 = !{!172, !467}
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !631, file: !468, line: 1126)
!631 = !DISubprogram(name: "ilogbf", scope: !464, file: !464, line: 283, type: !632, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!632 = !DISubroutineType(types: !633)
!633 = !{!172, !526}
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !635, file: !468, line: 1127)
!635 = !DISubprogram(name: "ilogbl", scope: !464, file: !464, line: 283, type: !636, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!636 = !DISubroutineType(types: !637)
!637 = !{!172, !537}
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !639, file: !468, line: 1129)
!639 = !DISubprogram(name: "lgamma", scope: !464, file: !464, line: 233, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !641, file: !468, line: 1130)
!641 = !DISubprogram(name: "lgammaf", scope: !464, file: !464, line: 233, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !643, file: !468, line: 1131)
!643 = !DISubprogram(name: "lgammal", scope: !464, file: !464, line: 233, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !645, file: !468, line: 1134)
!645 = !DISubprogram(name: "llrint", scope: !464, file: !464, line: 319, type: !646, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!646 = !DISubroutineType(types: !647)
!647 = !{!648, !467}
!648 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !650, file: !468, line: 1135)
!650 = !DISubprogram(name: "llrintf", scope: !464, file: !464, line: 319, type: !651, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!651 = !DISubroutineType(types: !652)
!652 = !{!648, !526}
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !654, file: !468, line: 1136)
!654 = !DISubprogram(name: "llrintl", scope: !464, file: !464, line: 319, type: !655, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!655 = !DISubroutineType(types: !656)
!656 = !{!648, !537}
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !658, file: !468, line: 1138)
!658 = !DISubprogram(name: "llround", scope: !464, file: !464, line: 325, type: !646, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !660, file: !468, line: 1139)
!660 = !DISubprogram(name: "llroundf", scope: !464, file: !464, line: 325, type: !651, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !662, file: !468, line: 1140)
!662 = !DISubprogram(name: "llroundl", scope: !464, file: !464, line: 325, type: !655, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !664, file: !468, line: 1143)
!664 = !DISubprogram(name: "log1p", scope: !464, file: !464, line: 122, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !666, file: !468, line: 1144)
!666 = !DISubprogram(name: "log1pf", scope: !464, file: !464, line: 122, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !668, file: !468, line: 1145)
!668 = !DISubprogram(name: "log1pl", scope: !464, file: !464, line: 122, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !670, file: !468, line: 1147)
!670 = !DISubprogram(name: "log2", scope: !464, file: !464, line: 133, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !672, file: !468, line: 1148)
!672 = !DISubprogram(name: "log2f", scope: !464, file: !464, line: 133, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !674, file: !468, line: 1149)
!674 = !DISubprogram(name: "log2l", scope: !464, file: !464, line: 133, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !676, file: !468, line: 1151)
!676 = !DISubprogram(name: "logb", scope: !464, file: !464, line: 125, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !678, file: !468, line: 1152)
!678 = !DISubprogram(name: "logbf", scope: !464, file: !464, line: 125, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !680, file: !468, line: 1153)
!680 = !DISubprogram(name: "logbl", scope: !464, file: !464, line: 125, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !682, file: !468, line: 1155)
!682 = !DISubprogram(name: "lrint", scope: !464, file: !464, line: 317, type: !683, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!683 = !DISubroutineType(types: !684)
!684 = !{!203, !467}
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !686, file: !468, line: 1156)
!686 = !DISubprogram(name: "lrintf", scope: !464, file: !464, line: 317, type: !687, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!687 = !DISubroutineType(types: !688)
!688 = !{!203, !526}
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !690, file: !468, line: 1157)
!690 = !DISubprogram(name: "lrintl", scope: !464, file: !464, line: 317, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!691 = !DISubroutineType(types: !692)
!692 = !{!203, !537}
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !694, file: !468, line: 1159)
!694 = !DISubprogram(name: "lround", scope: !464, file: !464, line: 323, type: !683, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !696, file: !468, line: 1160)
!696 = !DISubprogram(name: "lroundf", scope: !464, file: !464, line: 323, type: !687, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !698, file: !468, line: 1161)
!698 = !DISubprogram(name: "lroundl", scope: !464, file: !464, line: 323, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !700, file: !468, line: 1163)
!700 = !DISubprogram(name: "nan", scope: !464, file: !464, line: 203, type: !701, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!701 = !DISubroutineType(types: !702)
!702 = !{!467, !703}
!703 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !705, file: !468, line: 1164)
!705 = !DISubprogram(name: "nanf", scope: !464, file: !464, line: 203, type: !706, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!706 = !DISubroutineType(types: !707)
!707 = !{!526, !703}
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !709, file: !468, line: 1165)
!709 = !DISubprogram(name: "nanl", scope: !464, file: !464, line: 203, type: !710, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!710 = !DISubroutineType(types: !711)
!711 = !{!537, !703}
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !713, file: !468, line: 1167)
!713 = !DISubprogram(name: "nearbyint", scope: !464, file: !464, line: 297, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !715, file: !468, line: 1168)
!715 = !DISubprogram(name: "nearbyintf", scope: !464, file: !464, line: 297, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !717, file: !468, line: 1169)
!717 = !DISubprogram(name: "nearbyintl", scope: !464, file: !464, line: 297, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !719, file: !468, line: 1171)
!719 = !DISubprogram(name: "nextafter", scope: !464, file: !464, line: 262, type: !475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !721, file: !468, line: 1172)
!721 = !DISubprogram(name: "nextafterf", scope: !464, file: !464, line: 262, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !723, file: !468, line: 1173)
!723 = !DISubprogram(name: "nextafterl", scope: !464, file: !464, line: 262, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !725, file: !468, line: 1175)
!725 = !DISubprogram(name: "nexttoward", scope: !464, file: !464, line: 264, type: !726, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!726 = !DISubroutineType(types: !727)
!727 = !{!467, !467, !537}
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !729, file: !468, line: 1176)
!729 = !DISubprogram(name: "nexttowardf", scope: !464, file: !464, line: 264, type: !730, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!730 = !DISubroutineType(types: !731)
!731 = !{!526, !526, !537}
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !733, file: !468, line: 1177)
!733 = !DISubprogram(name: "nexttowardl", scope: !464, file: !464, line: 264, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !735, file: !468, line: 1179)
!735 = !DISubprogram(name: "remainder", scope: !464, file: !464, line: 275, type: !475, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !737, file: !468, line: 1180)
!737 = !DISubprogram(name: "remainderf", scope: !464, file: !464, line: 275, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !739, file: !468, line: 1181)
!739 = !DISubprogram(name: "remainderl", scope: !464, file: !464, line: 275, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !741, file: !468, line: 1183)
!741 = !DISubprogram(name: "remquo", scope: !464, file: !464, line: 310, type: !742, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!742 = !DISubroutineType(types: !743)
!743 = !{!467, !467, !467, !495}
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !745, file: !468, line: 1184)
!745 = !DISubprogram(name: "remquof", scope: !464, file: !464, line: 310, type: !746, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!746 = !DISubroutineType(types: !747)
!747 = !{!526, !526, !526, !495}
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !749, file: !468, line: 1185)
!749 = !DISubprogram(name: "remquol", scope: !464, file: !464, line: 310, type: !750, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!750 = !DISubroutineType(types: !751)
!751 = !{!537, !537, !537, !495}
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !753, file: !468, line: 1187)
!753 = !DISubprogram(name: "rint", scope: !464, file: !464, line: 259, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !755, file: !468, line: 1188)
!755 = !DISubprogram(name: "rintf", scope: !464, file: !464, line: 259, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !757, file: !468, line: 1189)
!757 = !DISubprogram(name: "rintl", scope: !464, file: !464, line: 259, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !759, file: !468, line: 1191)
!759 = !DISubprogram(name: "round", scope: !464, file: !464, line: 301, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !761, file: !468, line: 1192)
!761 = !DISubprogram(name: "roundf", scope: !464, file: !464, line: 301, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !763, file: !468, line: 1193)
!763 = !DISubprogram(name: "roundl", scope: !464, file: !464, line: 301, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !765, file: !468, line: 1195)
!765 = !DISubprogram(name: "scalbln", scope: !464, file: !464, line: 293, type: !766, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!766 = !DISubroutineType(types: !767)
!767 = !{!467, !467, !203}
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !769, file: !468, line: 1196)
!769 = !DISubprogram(name: "scalblnf", scope: !464, file: !464, line: 293, type: !770, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!770 = !DISubroutineType(types: !771)
!771 = !{!526, !526, !203}
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !773, file: !468, line: 1197)
!773 = !DISubprogram(name: "scalblnl", scope: !464, file: !464, line: 293, type: !774, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!774 = !DISubroutineType(types: !775)
!775 = !{!537, !537, !203}
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !777, file: !468, line: 1199)
!777 = !DISubprogram(name: "scalbn", scope: !464, file: !464, line: 279, type: !498, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !779, file: !468, line: 1200)
!779 = !DISubprogram(name: "scalbnf", scope: !464, file: !464, line: 279, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!780 = !DISubroutineType(types: !781)
!781 = !{!526, !526, !172}
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !783, file: !468, line: 1201)
!783 = !DISubprogram(name: "scalbnl", scope: !464, file: !464, line: 279, type: !784, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!784 = !DISubroutineType(types: !785)
!785 = !{!537, !537, !172}
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !787, file: !468, line: 1203)
!787 = !DISubprogram(name: "tgamma", scope: !464, file: !464, line: 238, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !789, file: !468, line: 1204)
!789 = !DISubprogram(name: "tgammaf", scope: !464, file: !464, line: 238, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !791, file: !468, line: 1205)
!791 = !DISubprogram(name: "tgammal", scope: !464, file: !464, line: 238, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !793, file: !468, line: 1207)
!793 = !DISubprogram(name: "trunc", scope: !464, file: !464, line: 305, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !795, file: !468, line: 1208)
!795 = !DISubprogram(name: "truncf", scope: !464, file: !464, line: 305, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !797, file: !468, line: 1209)
!797 = !DISubprogram(name: "truncl", scope: !464, file: !464, line: 305, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!798 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !799, entity: !800, file: !801, line: 58)
!799 = !DINamespace(name: "__gnu_debug", scope: null)
!800 = !DINamespace(name: "__debug", scope: !2)
!801 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "09fce61e0085ea92b4bd81d6cd4dcc16")
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !803, file: !805, line: 127)
!803 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !458, line: 63, baseType: !804)
!804 = !DICompositeType(tag: DW_TAG_structure_type, file: !458, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!805 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdlib", directory: "")
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !807, file: !805, line: 128)
!807 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !458, line: 71, baseType: !808)
!808 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !458, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !809, identifier: "_ZTS6ldiv_t")
!809 = !{!810, !811}
!810 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !808, file: !458, line: 69, baseType: !203, size: 64)
!811 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !808, file: !458, line: 70, baseType: !203, size: 64, offset: 64)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !813, file: !805, line: 130)
!813 = !DISubprogram(name: "abort", scope: !458, file: !458, line: 598, type: !814, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!814 = !DISubroutineType(types: !815)
!815 = !{null}
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !817, file: !805, line: 132)
!817 = !DISubprogram(name: "aligned_alloc", scope: !458, file: !458, line: 592, type: !818, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!818 = !DISubroutineType(types: !819)
!819 = !{!271, !820, !820}
!820 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !821, line: 46, baseType: !822)
!821 = !DIFile(filename: "/opt/rocm-5.6.0/llvm/lib/clang/16.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!822 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !824, file: !805, line: 134)
!824 = !DISubprogram(name: "atexit", scope: !458, file: !458, line: 602, type: !825, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!825 = !DISubroutineType(types: !826)
!826 = !{!172, !827}
!827 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !814, size: 64)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !829, file: !805, line: 137)
!829 = !DISubprogram(name: "at_quick_exit", scope: !458, file: !458, line: 607, type: !825, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !831, file: !805, line: 140)
!831 = !DISubprogram(name: "atof", scope: !832, file: !832, line: 25, type: !701, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!832 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "adfe1626ff4efc68ac58c367ff5f206b")
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !834, file: !805, line: 141)
!834 = !DISubprogram(name: "atoi", scope: !458, file: !458, line: 362, type: !835, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!835 = !DISubroutineType(types: !836)
!836 = !{!172, !703}
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !838, file: !805, line: 142)
!838 = !DISubprogram(name: "atol", scope: !458, file: !458, line: 367, type: !839, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!839 = !DISubroutineType(types: !840)
!840 = !{!203, !703}
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !842, file: !805, line: 143)
!842 = !DISubprogram(name: "bsearch", scope: !843, file: !843, line: 20, type: !844, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!843 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "724ededa330cc3e0cbd34c5b4030a6f6")
!844 = !DISubroutineType(types: !845)
!845 = !{!271, !846, !846, !820, !820, !848}
!846 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !847, size: 64)
!847 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!848 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !458, line: 816, baseType: !849)
!849 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !850, size: 64)
!850 = !DISubroutineType(types: !851)
!851 = !{!172, !846, !846}
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !853, file: !805, line: 144)
!853 = !DISubprogram(name: "calloc", scope: !458, file: !458, line: 543, type: !818, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !855, file: !805, line: 145)
!855 = !DISubprogram(name: "div", scope: !458, file: !458, line: 860, type: !856, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!856 = !DISubroutineType(types: !857)
!857 = !{!803, !172, !172}
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !859, file: !805, line: 146)
!859 = !DISubprogram(name: "exit", scope: !458, file: !458, line: 624, type: !860, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!860 = !DISubroutineType(types: !861)
!861 = !{null, !172}
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !863, file: !805, line: 147)
!863 = !DISubprogram(name: "free", scope: !458, file: !458, line: 555, type: !864, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!864 = !DISubroutineType(types: !865)
!865 = !{null, !271}
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !867, file: !805, line: 148)
!867 = !DISubprogram(name: "getenv", scope: !458, file: !458, line: 641, type: !868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!868 = !DISubroutineType(types: !869)
!869 = !{!870, !703}
!870 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !872, file: !805, line: 149)
!872 = !DISubprogram(name: "labs", scope: !458, file: !458, line: 849, type: !873, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!873 = !DISubroutineType(types: !874)
!874 = !{!203, !203}
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !876, file: !805, line: 150)
!876 = !DISubprogram(name: "ldiv", scope: !458, file: !458, line: 862, type: !877, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!877 = !DISubroutineType(types: !878)
!878 = !{!807, !203, !203}
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !880, file: !805, line: 151)
!880 = !DISubprogram(name: "malloc", scope: !458, file: !458, line: 540, type: !881, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!881 = !DISubroutineType(types: !882)
!882 = !{!271, !820}
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !884, file: !805, line: 153)
!884 = !DISubprogram(name: "mblen", scope: !458, file: !458, line: 930, type: !885, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!885 = !DISubroutineType(types: !886)
!886 = !{!172, !703, !820}
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !888, file: !805, line: 154)
!888 = !DISubprogram(name: "mbstowcs", scope: !458, file: !458, line: 941, type: !889, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!889 = !DISubroutineType(types: !890)
!890 = !{!820, !891, !894, !820}
!891 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !892)
!892 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !893, size: 64)
!893 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!894 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !703)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !896, file: !805, line: 155)
!896 = !DISubprogram(name: "mbtowc", scope: !458, file: !458, line: 933, type: !897, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!897 = !DISubroutineType(types: !898)
!898 = !{!172, !891, !894, !820}
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !900, file: !805, line: 157)
!900 = !DISubprogram(name: "qsort", scope: !458, file: !458, line: 838, type: !901, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!901 = !DISubroutineType(types: !902)
!902 = !{null, !271, !820, !820, !848}
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !904, file: !805, line: 160)
!904 = !DISubprogram(name: "quick_exit", scope: !458, file: !458, line: 630, type: !860, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !906, file: !805, line: 163)
!906 = !DISubprogram(name: "rand", scope: !458, file: !458, line: 454, type: !907, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!907 = !DISubroutineType(types: !908)
!908 = !{!172}
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !910, file: !805, line: 164)
!910 = !DISubprogram(name: "realloc", scope: !458, file: !458, line: 551, type: !911, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!911 = !DISubroutineType(types: !912)
!912 = !{!271, !271, !820}
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !914, file: !805, line: 165)
!914 = !DISubprogram(name: "srand", scope: !458, file: !458, line: 456, type: !915, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!915 = !DISubroutineType(types: !916)
!916 = !{null, !83}
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !918, file: !805, line: 166)
!918 = !DISubprogram(name: "strtod", scope: !458, file: !458, line: 118, type: !919, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!919 = !DISubroutineType(types: !920)
!920 = !{!467, !894, !921}
!921 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !922)
!922 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !870, size: 64)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !924, file: !805, line: 167)
!924 = !DISubprogram(name: "strtol", scope: !458, file: !458, line: 177, type: !925, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!925 = !DISubroutineType(types: !926)
!926 = !{!203, !894, !921, !172}
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !928, file: !805, line: 168)
!928 = !DISubprogram(name: "strtoul", scope: !458, file: !458, line: 181, type: !929, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!929 = !DISubroutineType(types: !930)
!930 = !{!822, !894, !921, !172}
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !932, file: !805, line: 169)
!932 = !DISubprogram(name: "system", scope: !458, file: !458, line: 791, type: !835, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !934, file: !805, line: 171)
!934 = !DISubprogram(name: "wcstombs", scope: !458, file: !458, line: 945, type: !935, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!935 = !DISubroutineType(types: !936)
!936 = !{!820, !937, !938, !820}
!937 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !870)
!938 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !939)
!939 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !940, size: 64)
!940 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !893)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !942, file: !805, line: 172)
!942 = !DISubprogram(name: "wctomb", scope: !458, file: !458, line: 937, type: !943, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!943 = !DISubroutineType(types: !944)
!944 = !{!172, !870, !893}
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !947, file: !805, line: 200)
!946 = !DINamespace(name: "__gnu_cxx", scope: null)
!947 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !458, line: 81, baseType: !948)
!948 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !458, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !949, identifier: "_ZTS7lldiv_t")
!949 = !{!950, !951}
!950 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !948, file: !458, line: 79, baseType: !648, size: 64)
!951 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !948, file: !458, line: 80, baseType: !648, size: 64, offset: 64)
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !953, file: !805, line: 206)
!953 = !DISubprogram(name: "_Exit", scope: !458, file: !458, line: 636, type: !860, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !955, file: !805, line: 210)
!955 = !DISubprogram(name: "llabs", scope: !458, file: !458, line: 852, type: !956, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!956 = !DISubroutineType(types: !957)
!957 = !{!648, !648}
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !959, file: !805, line: 216)
!959 = !DISubprogram(name: "lldiv", scope: !458, file: !458, line: 866, type: !960, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!960 = !DISubroutineType(types: !961)
!961 = !{!947, !648, !648}
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !963, file: !805, line: 227)
!963 = !DISubprogram(name: "atoll", scope: !458, file: !458, line: 374, type: !964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!964 = !DISubroutineType(types: !965)
!965 = !{!648, !703}
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !967, file: !805, line: 228)
!967 = !DISubprogram(name: "strtoll", scope: !458, file: !458, line: 201, type: !968, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!968 = !DISubroutineType(types: !969)
!969 = !{!648, !894, !921, !172}
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !971, file: !805, line: 229)
!971 = !DISubprogram(name: "strtoull", scope: !458, file: !458, line: 206, type: !972, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!972 = !DISubroutineType(types: !973)
!973 = !{!974, !894, !921, !172}
!974 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !976, file: !805, line: 231)
!976 = !DISubprogram(name: "strtof", scope: !458, file: !458, line: 124, type: !977, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!977 = !DISubroutineType(types: !978)
!978 = !{!526, !894, !921}
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !980, file: !805, line: 232)
!980 = !DISubprogram(name: "strtold", scope: !458, file: !458, line: 127, type: !981, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!981 = !DISubroutineType(types: !982)
!982 = !{!537, !894, !921}
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !947, file: !805, line: 240)
!984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !953, file: !805, line: 242)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !955, file: !805, line: 244)
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !987, file: !805, line: 245)
!987 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !946, file: !805, line: 213, type: !960, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !959, file: !805, line: 246)
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !963, file: !805, line: 248)
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !976, file: !805, line: 249)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !967, file: !805, line: 250)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !971, file: !805, line: 251)
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !980, file: !805, line: 252)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !813, file: !995, line: 38)
!995 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "ce88caced6ed945413de73c65016f4c2")
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !824, file: !995, line: 39)
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !859, file: !995, line: 40)
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !829, file: !995, line: 43)
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !904, file: !995, line: 46)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !803, file: !995, line: 51)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !807, file: !995, line: 52)
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !1003, file: !995, line: 54)
!1003 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !2, file: !461, line: 79, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !831, file: !995, line: 55)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !834, file: !995, line: 56)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !838, file: !995, line: 57)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !842, file: !995, line: 58)
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !853, file: !995, line: 59)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !987, file: !995, line: 60)
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !863, file: !995, line: 61)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !867, file: !995, line: 62)
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !872, file: !995, line: 63)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !876, file: !995, line: 64)
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !880, file: !995, line: 65)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !884, file: !995, line: 67)
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !888, file: !995, line: 68)
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !896, file: !995, line: 69)
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !900, file: !995, line: 71)
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !906, file: !995, line: 72)
!1020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !910, file: !995, line: 73)
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !914, file: !995, line: 74)
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !918, file: !995, line: 75)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !924, file: !995, line: 76)
!1024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !928, file: !995, line: 77)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !932, file: !995, line: 78)
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !934, file: !995, line: 80)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !79, entity: !942, file: !995, line: 81)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1029, file: !1030, line: 200)
!1029 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !1030, file: !1030, line: 28, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1030 = !DIFile(filename: "/opt/rocm-5.6.0/llvm/lib/clang/16.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1032, file: !1030, line: 201)
!1032 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !1030, file: !1030, line: 32, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1034, file: !1030, line: 202)
!1034 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !1030, file: !1030, line: 34, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1036, file: !1030, line: 203)
!1036 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !1030, file: !1030, line: 36, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1038, file: !1030, line: 204)
!1038 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !1030, file: !1030, line: 38, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1040, file: !1030, line: 205)
!1040 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !1030, file: !1030, line: 42, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1042, file: !1030, line: 206)
!1042 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !1030, file: !1030, line: 40, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1044, file: !1030, line: 207)
!1044 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !1030, file: !1030, line: 44, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1046, file: !1030, line: 208)
!1046 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !1030, file: !1030, line: 46, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1048, file: !1030, line: 209)
!1048 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !1030, file: !1030, line: 48, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1050, file: !1030, line: 210)
!1050 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !1030, file: !1030, line: 50, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1052, file: !1030, line: 211)
!1052 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !1030, file: !1030, line: 52, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1054, file: !1030, line: 212)
!1054 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !1030, file: !1030, line: 54, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1056, file: !1030, line: 213)
!1056 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !1030, file: !1030, line: 58, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1058, file: !1030, line: 214)
!1058 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !1030, file: !1030, line: 56, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1060, file: !1030, line: 215)
!1060 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !1030, file: !1030, line: 62, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1062, file: !1030, line: 216)
!1062 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !1030, file: !1030, line: 60, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1064, file: !1030, line: 217)
!1064 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !1030, file: !1030, line: 64, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1066, file: !1030, line: 218)
!1066 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !1030, file: !1030, line: 66, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1068, file: !1030, line: 219)
!1068 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !1030, file: !1030, line: 68, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1070, file: !1030, line: 220)
!1070 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !1030, file: !1030, line: 70, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1072, file: !1030, line: 221)
!1072 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !1030, file: !1030, line: 72, type: !602, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1074, file: !1030, line: 222)
!1074 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !1030, file: !1030, line: 74, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1076, file: !1030, line: 223)
!1076 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !1030, file: !1030, line: 76, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1078, file: !1030, line: 224)
!1078 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !1030, file: !1030, line: 78, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1080, file: !1030, line: 225)
!1080 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !1030, file: !1030, line: 80, type: !632, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1082, file: !1030, line: 226)
!1082 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !1030, file: !1030, line: 82, type: !1083, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!526, !526, !495}
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1086, file: !1030, line: 227)
!1086 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !1030, file: !1030, line: 84, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1088, file: !1030, line: 228)
!1088 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !1030, file: !1030, line: 86, type: !632, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1090, file: !1030, line: 229)
!1090 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !1030, file: !1030, line: 91, type: !1091, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!279, !526}
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1094, file: !1030, line: 230)
!1094 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !1030, file: !1030, line: 95, type: !1095, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1095 = !DISubroutineType(types: !1096)
!1096 = !{!279, !526, !526}
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1098, file: !1030, line: 231)
!1098 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !1030, file: !1030, line: 94, type: !1095, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1100, file: !1030, line: 232)
!1100 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !1030, file: !1030, line: 100, type: !1091, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1102, file: !1030, line: 233)
!1102 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !1030, file: !1030, line: 104, type: !1095, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1104, file: !1030, line: 234)
!1104 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !1030, file: !1030, line: 103, type: !1095, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1106, file: !1030, line: 235)
!1106 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !1030, file: !1030, line: 106, type: !1095, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1108, file: !1030, line: 236)
!1108 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !1030, file: !1030, line: 111, type: !1091, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1110, file: !1030, line: 237)
!1110 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !1030, file: !1030, line: 113, type: !1091, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1112, file: !1030, line: 238)
!1112 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !1030, file: !1030, line: 115, type: !1095, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1114, file: !1030, line: 239)
!1114 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !1030, file: !1030, line: 116, type: !873, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1116, file: !1030, line: 240)
!1116 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !1030, file: !1030, line: 118, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1118, file: !1030, line: 241)
!1118 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !1030, file: !1030, line: 120, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1120, file: !1030, line: 242)
!1120 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !1030, file: !1030, line: 121, type: !956, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1122, file: !1030, line: 243)
!1122 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !1030, file: !1030, line: 123, type: !651, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1124, file: !1030, line: 244)
!1124 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !1030, file: !1030, line: 133, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1126, file: !1030, line: 245)
!1126 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !1030, file: !1030, line: 125, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1128, file: !1030, line: 246)
!1128 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !1030, file: !1030, line: 127, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1130, file: !1030, line: 247)
!1130 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !1030, file: !1030, line: 129, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1132, file: !1030, line: 248)
!1132 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !1030, file: !1030, line: 131, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1134, file: !1030, line: 249)
!1134 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !1030, file: !1030, line: 135, type: !687, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1136, file: !1030, line: 250)
!1136 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !1030, file: !1030, line: 137, type: !687, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1138, file: !1030, line: 251)
!1138 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !1030, file: !1030, line: 138, type: !651, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1140, file: !1030, line: 252)
!1140 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !1030, file: !1030, line: 140, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!526, !526, !1143}
!1143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !526, size: 64)
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1145, file: !1030, line: 253)
!1145 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !1030, file: !1030, line: 141, type: !701, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1147, file: !1030, line: 254)
!1147 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !1030, file: !1030, line: 142, type: !706, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1149, file: !1030, line: 255)
!1149 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !1030, file: !1030, line: 144, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1151, file: !1030, line: 256)
!1151 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !1030, file: !1030, line: 146, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1153, file: !1030, line: 257)
!1153 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !1030, file: !1030, line: 150, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1155, file: !1030, line: 258)
!1155 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !1030, file: !1030, line: 152, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1157, file: !1030, line: 259)
!1157 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !1030, file: !1030, line: 154, type: !746, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1159, file: !1030, line: 260)
!1159 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !1030, file: !1030, line: 156, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1161, file: !1030, line: 261)
!1161 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !1030, file: !1030, line: 158, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1163, file: !1030, line: 262)
!1163 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !1030, file: !1030, line: 160, type: !770, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1165, file: !1030, line: 263)
!1165 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !1030, file: !1030, line: 162, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1167, file: !1030, line: 264)
!1167 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !1030, file: !1030, line: 167, type: !1091, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1169, file: !1030, line: 265)
!1169 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !1030, file: !1030, line: 169, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1171, file: !1030, line: 266)
!1171 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !1030, file: !1030, line: 171, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1173, file: !1030, line: 267)
!1173 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !1030, file: !1030, line: 173, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1175, file: !1030, line: 268)
!1175 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !1030, file: !1030, line: 175, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1177, file: !1030, line: 269)
!1177 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !1030, file: !1030, line: 177, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1179, file: !1030, line: 270)
!1179 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !1030, file: !1030, line: 179, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1181, file: !1030, line: 271)
!1181 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !1030, file: !1030, line: 181, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1183, file: !1185, line: 727)
!1183 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !1184, file: !1184, line: 183, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1184 = !DIFile(filename: "/opt/rocm-5.6.0/llvm/lib/clang/16.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "d4f0e84980e083350535310c8ec512a2")
!1185 = !DIFile(filename: "/opt/rocm-5.6.0/llvm/lib/clang/16.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "854a3dc6d81a4654631a5bce14ca059c")
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1187, file: !1185, line: 728)
!1187 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !1184, file: !1184, line: 186, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1189, file: !1185, line: 729)
!1189 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !1184, file: !1184, line: 189, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1191, file: !1185, line: 730)
!1191 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !1184, file: !1184, line: 192, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1193, file: !1185, line: 731)
!1193 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !1184, file: !1184, line: 195, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1195, file: !1185, line: 732)
!1195 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !1184, file: !1184, line: 198, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1197, file: !1185, line: 733)
!1197 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !1184, file: !1184, line: 201, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1199, file: !1185, line: 734)
!1199 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !1184, file: !1184, line: 204, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1201, file: !1185, line: 735)
!1201 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !1184, file: !1184, line: 207, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1203, file: !1185, line: 736)
!1203 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !1184, file: !1184, line: 210, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1205, file: !1185, line: 737)
!1205 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !1184, file: !1184, line: 213, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1207, file: !1185, line: 738)
!1207 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !1184, file: !1184, line: 216, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1209, file: !1185, line: 739)
!1209 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !1184, file: !1184, line: 228, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1211, file: !1185, line: 740)
!1211 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !1184, file: !1184, line: 237, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1213, file: !1185, line: 741)
!1213 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !1184, file: !1184, line: 246, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1215, file: !1185, line: 742)
!1215 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !1184, file: !1184, line: 249, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1217, file: !1185, line: 743)
!1217 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !1184, file: !1184, line: 252, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1219, file: !1185, line: 744)
!1219 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !1184, file: !1184, line: 255, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1221, file: !1185, line: 745)
!1221 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !1184, file: !1184, line: 258, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1223, file: !1185, line: 746)
!1223 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !1184, file: !1184, line: 264, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1225, file: !1185, line: 747)
!1225 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !1184, file: !1184, line: 267, type: !602, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1227, file: !1185, line: 748)
!1227 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !1184, file: !1184, line: 272, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1229, file: !1185, line: 749)
!1229 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !1184, file: !1184, line: 275, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1231, file: !1185, line: 750)
!1231 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !1184, file: !1184, line: 278, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1233, file: !1185, line: 751)
!1233 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !1184, file: !1184, line: 281, type: !1083, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1235, file: !1185, line: 752)
!1235 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !1184, file: !1184, line: 294, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1237, file: !1185, line: 753)
!1237 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !1184, file: !1184, line: 297, type: !632, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1239, file: !1185, line: 754)
!1239 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !1184, file: !1184, line: 336, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1241, file: !1185, line: 755)
!1241 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !1184, file: !1184, line: 339, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1243, file: !1185, line: 756)
!1243 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !1184, file: !1184, line: 342, type: !651, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1245, file: !1185, line: 757)
!1245 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !1184, file: !1184, line: 345, type: !651, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1247, file: !1185, line: 758)
!1247 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !1184, file: !1184, line: 348, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1249, file: !1185, line: 759)
!1249 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !1184, file: !1184, line: 351, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1251, file: !1185, line: 760)
!1251 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !1184, file: !1184, line: 354, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1253, file: !1185, line: 761)
!1253 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !1184, file: !1184, line: 360, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1255, file: !1185, line: 762)
!1255 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !1184, file: !1184, line: 363, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1257, file: !1185, line: 763)
!1257 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !1184, file: !1184, line: 366, type: !687, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1259, file: !1185, line: 764)
!1259 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !1184, file: !1184, line: 369, type: !687, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1261, file: !1185, line: 765)
!1261 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !1184, file: !1184, line: 372, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1263, file: !1185, line: 766)
!1263 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !1184, file: !1184, line: 408, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1265, file: !1185, line: 767)
!1265 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !1184, file: !1184, line: 411, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1267, file: !1185, line: 769)
!1267 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !1184, file: !1184, line: 444, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1269, file: !1185, line: 770)
!1269 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !1184, file: !1184, line: 469, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1271, file: !1185, line: 771)
!1271 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !1184, file: !1184, line: 474, type: !746, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1273, file: !1185, line: 772)
!1273 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !1184, file: !1184, line: 490, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1275, file: !1185, line: 773)
!1275 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !1184, file: !1184, line: 515, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1277, file: !1185, line: 774)
!1277 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !1184, file: !1184, line: 521, type: !770, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1279, file: !1185, line: 775)
!1279 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !1184, file: !1184, line: 527, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1281, file: !1185, line: 776)
!1281 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !1184, file: !1184, line: 555, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1283, file: !1185, line: 777)
!1283 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !1184, file: !1184, line: 558, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1285, file: !1185, line: 778)
!1285 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !1184, file: !1184, line: 564, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1287, file: !1185, line: 779)
!1287 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !1184, file: !1184, line: 567, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1289, file: !1185, line: 780)
!1289 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !1184, file: !1184, line: 570, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1291, file: !1185, line: 781)
!1291 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !1184, file: !1184, line: 573, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1293, file: !1185, line: 782)
!1293 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !1184, file: !1184, line: 576, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1295, file: !1296, line: 68)
!1295 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !1297, file: !1296, line: 90, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!1296 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "e8a32dcadc5d06d341e371fb480b7b44")
!1297 = !DINamespace(name: "__exception_ptr", scope: !2)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1297, entity: !1299, file: !1296, line: 84)
!1299 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !1296, line: 80, type: !1300, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1300 = !DISubroutineType(types: !1301)
!1301 = !{null, !1295}
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1303, file: !1316, line: 64)
!1303 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !1304, line: 6, baseType: !1305)
!1304 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!1305 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !1306, line: 21, baseType: !1307)
!1306 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!1307 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1306, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !1308, identifier: "_ZTS11__mbstate_t")
!1308 = !{!1309, !1310}
!1309 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !1307, file: !1306, line: 15, baseType: !172, size: 32)
!1310 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !1307, file: !1306, line: 20, baseType: !1311, size: 32, offset: 32)
!1311 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1307, file: !1306, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !1312, identifier: "_ZTSN11__mbstate_tUt_E")
!1312 = !{!1313, !1314}
!1313 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !1311, file: !1306, line: 18, baseType: !83, size: 32)
!1314 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !1311, file: !1306, line: 19, baseType: !1315, size: 32)
!1315 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 32, elements: !38)
!1316 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cwchar", directory: "")
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1318, file: !1316, line: 141)
!1318 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !1319, line: 20, baseType: !83)
!1319 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1321, file: !1316, line: 143)
!1321 = !DISubprogram(name: "btowc", scope: !1322, file: !1322, line: 319, type: !1323, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1322 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "484b7adbbc849bb51cdbcb2d985b07a0")
!1323 = !DISubroutineType(types: !1324)
!1324 = !{!1318, !172}
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1326, file: !1316, line: 144)
!1326 = !DISubprogram(name: "fgetwc", scope: !1322, file: !1322, line: 744, type: !1327, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1327 = !DISubroutineType(types: !1328)
!1328 = !{!1318, !1329}
!1329 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1330, size: 64)
!1330 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !1331, line: 5, baseType: !1332)
!1331 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!1332 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !1333, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !1334, identifier: "_ZTS8_IO_FILE")
!1333 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!1334 = !{!1335, !1336, !1337, !1338, !1339, !1340, !1341, !1342, !1343, !1344, !1345, !1346, !1347, !1350, !1352, !1353, !1354, !1356, !1358, !1360, !1364, !1367, !1369, !1372, !1375, !1376, !1377, !1378, !1379}
!1335 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !1332, file: !1333, line: 51, baseType: !172, size: 32)
!1336 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !1332, file: !1333, line: 54, baseType: !870, size: 64, offset: 64)
!1337 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !1332, file: !1333, line: 55, baseType: !870, size: 64, offset: 128)
!1338 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !1332, file: !1333, line: 56, baseType: !870, size: 64, offset: 192)
!1339 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !1332, file: !1333, line: 57, baseType: !870, size: 64, offset: 256)
!1340 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !1332, file: !1333, line: 58, baseType: !870, size: 64, offset: 320)
!1341 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !1332, file: !1333, line: 59, baseType: !870, size: 64, offset: 384)
!1342 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !1332, file: !1333, line: 60, baseType: !870, size: 64, offset: 448)
!1343 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !1332, file: !1333, line: 61, baseType: !870, size: 64, offset: 512)
!1344 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !1332, file: !1333, line: 64, baseType: !870, size: 64, offset: 576)
!1345 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !1332, file: !1333, line: 65, baseType: !870, size: 64, offset: 640)
!1346 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !1332, file: !1333, line: 66, baseType: !870, size: 64, offset: 704)
!1347 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !1332, file: !1333, line: 68, baseType: !1348, size: 64, offset: 768)
!1348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1349, size: 64)
!1349 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !1333, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!1350 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !1332, file: !1333, line: 70, baseType: !1351, size: 64, offset: 832)
!1351 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1332, size: 64)
!1352 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !1332, file: !1333, line: 72, baseType: !172, size: 32, offset: 896)
!1353 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !1332, file: !1333, line: 73, baseType: !172, size: 32, offset: 928)
!1354 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !1332, file: !1333, line: 74, baseType: !1355, size: 64, offset: 960)
!1355 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !189, line: 152, baseType: !203)
!1356 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !1332, file: !1333, line: 77, baseType: !1357, size: 16, offset: 1024)
!1357 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1358 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !1332, file: !1333, line: 78, baseType: !1359, size: 8, offset: 1040)
!1359 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1360 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !1332, file: !1333, line: 79, baseType: !1361, size: 8, offset: 1048)
!1361 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 8, elements: !1362)
!1362 = !{!1363}
!1363 = !DISubrange(count: 1)
!1364 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !1332, file: !1333, line: 81, baseType: !1365, size: 64, offset: 1088)
!1365 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1366, size: 64)
!1366 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !1333, line: 43, baseType: null)
!1367 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !1332, file: !1333, line: 89, baseType: !1368, size: 64, offset: 1152)
!1368 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !189, line: 153, baseType: !203)
!1369 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !1332, file: !1333, line: 91, baseType: !1370, size: 64, offset: 1216)
!1370 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1371, size: 64)
!1371 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !1333, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!1372 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !1332, file: !1333, line: 92, baseType: !1373, size: 64, offset: 1280)
!1373 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1374, size: 64)
!1374 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !1333, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!1375 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !1332, file: !1333, line: 93, baseType: !1351, size: 64, offset: 1344)
!1376 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !1332, file: !1333, line: 94, baseType: !271, size: 64, offset: 1408)
!1377 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !1332, file: !1333, line: 95, baseType: !820, size: 64, offset: 1472)
!1378 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !1332, file: !1333, line: 96, baseType: !172, size: 32, offset: 1536)
!1379 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !1332, file: !1333, line: 98, baseType: !1380, size: 160, offset: 1568)
!1380 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, elements: !1381)
!1381 = !{!1382}
!1382 = !DISubrange(count: 20)
!1383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1384, file: !1316, line: 145)
!1384 = !DISubprogram(name: "fgetws", scope: !1322, file: !1322, line: 773, type: !1385, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1385 = !DISubroutineType(types: !1386)
!1386 = !{!892, !891, !172, !1387}
!1387 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1329)
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1389, file: !1316, line: 146)
!1389 = !DISubprogram(name: "fputwc", scope: !1322, file: !1322, line: 758, type: !1390, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1390 = !DISubroutineType(types: !1391)
!1391 = !{!1318, !893, !1329}
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1393, file: !1316, line: 147)
!1393 = !DISubprogram(name: "fputws", scope: !1322, file: !1322, line: 780, type: !1394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1394 = !DISubroutineType(types: !1395)
!1395 = !{!172, !938, !1387}
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1397, file: !1316, line: 148)
!1397 = !DISubprogram(name: "fwide", scope: !1322, file: !1322, line: 588, type: !1398, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1398 = !DISubroutineType(types: !1399)
!1399 = !{!172, !1329, !172}
!1400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1401, file: !1316, line: 149)
!1401 = !DISubprogram(name: "fwprintf", scope: !1322, file: !1322, line: 595, type: !1402, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1402 = !DISubroutineType(types: !1403)
!1403 = !{!172, !1387, !938, null}
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1405, file: !1316, line: 150)
!1405 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !1322, file: !1322, line: 657, type: !1402, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1407, file: !1316, line: 151)
!1407 = !DISubprogram(name: "getwc", scope: !1322, file: !1322, line: 745, type: !1327, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1409, file: !1316, line: 152)
!1409 = !DISubprogram(name: "getwchar", scope: !1322, file: !1322, line: 751, type: !1410, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1410 = !DISubroutineType(types: !1411)
!1411 = !{!1318}
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1413, file: !1316, line: 153)
!1413 = !DISubprogram(name: "mbrlen", scope: !1322, file: !1322, line: 330, type: !1414, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1414 = !DISubroutineType(types: !1415)
!1415 = !{!820, !894, !820, !1416}
!1416 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1417)
!1417 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1303, size: 64)
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1419, file: !1316, line: 154)
!1419 = !DISubprogram(name: "mbrtowc", scope: !1322, file: !1322, line: 297, type: !1420, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1420 = !DISubroutineType(types: !1421)
!1421 = !{!820, !891, !894, !820, !1416}
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1423, file: !1316, line: 155)
!1423 = !DISubprogram(name: "mbsinit", scope: !1322, file: !1322, line: 293, type: !1424, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1424 = !DISubroutineType(types: !1425)
!1425 = !{!172, !1426}
!1426 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1427, size: 64)
!1427 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1303)
!1428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1429, file: !1316, line: 156)
!1429 = !DISubprogram(name: "mbsrtowcs", scope: !1322, file: !1322, line: 338, type: !1430, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1430 = !DISubroutineType(types: !1431)
!1431 = !{!820, !891, !1432, !820, !1416}
!1432 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1433)
!1433 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !703, size: 64)
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1435, file: !1316, line: 157)
!1435 = !DISubprogram(name: "putwc", scope: !1322, file: !1322, line: 759, type: !1390, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1437, file: !1316, line: 158)
!1437 = !DISubprogram(name: "putwchar", scope: !1322, file: !1322, line: 765, type: !1438, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1438 = !DISubroutineType(types: !1439)
!1439 = !{!1318, !893}
!1440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1441, file: !1316, line: 160)
!1441 = !DISubprogram(name: "swprintf", scope: !1322, file: !1322, line: 605, type: !1442, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1442 = !DISubroutineType(types: !1443)
!1443 = !{!172, !891, !820, !938, null}
!1444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1445, file: !1316, line: 162)
!1445 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !1322, file: !1322, line: 664, type: !1446, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1446 = !DISubroutineType(types: !1447)
!1447 = !{!172, !938, !938, null}
!1448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1449, file: !1316, line: 163)
!1449 = !DISubprogram(name: "ungetwc", scope: !1322, file: !1322, line: 788, type: !1450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1450 = !DISubroutineType(types: !1451)
!1451 = !{!1318, !1318, !1329}
!1452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1453, file: !1316, line: 164)
!1453 = !DISubprogram(name: "vfwprintf", scope: !1322, file: !1322, line: 613, type: !1454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1454 = !DISubroutineType(types: !1455)
!1455 = !{!172, !1387, !938, !1456}
!1456 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1457, size: 64)
!1457 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, flags: DIFlagTypePassByValue, elements: !1458, identifier: "_ZTS13__va_list_tag")
!1458 = !{!1459, !1461, !1462, !1463}
!1459 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !1457, file: !1460, baseType: !83, size: 32)
!1460 = !DIFile(filename: "test/managed_clock_test.cpp", directory: "/home/oster/repos/scabbard")
!1461 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !1457, file: !1460, baseType: !83, size: 32, offset: 32)
!1462 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !1457, file: !1460, baseType: !271, size: 64, offset: 64)
!1463 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !1457, file: !1460, baseType: !271, size: 64, offset: 128)
!1464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1465, file: !1316, line: 166)
!1465 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !1322, file: !1322, line: 711, type: !1454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1467, file: !1316, line: 169)
!1467 = !DISubprogram(name: "vswprintf", scope: !1322, file: !1322, line: 626, type: !1468, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1468 = !DISubroutineType(types: !1469)
!1469 = !{!172, !891, !820, !938, !1456}
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1471, file: !1316, line: 172)
!1471 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !1322, file: !1322, line: 718, type: !1472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1472 = !DISubroutineType(types: !1473)
!1473 = !{!172, !938, !938, !1456}
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1475, file: !1316, line: 174)
!1475 = !DISubprogram(name: "vwprintf", scope: !1322, file: !1322, line: 621, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1476 = !DISubroutineType(types: !1477)
!1477 = !{!172, !938, !1456}
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1479, file: !1316, line: 176)
!1479 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !1322, file: !1322, line: 715, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1481, file: !1316, line: 178)
!1481 = !DISubprogram(name: "wcrtomb", scope: !1322, file: !1322, line: 302, type: !1482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1482 = !DISubroutineType(types: !1483)
!1483 = !{!820, !937, !893, !1416}
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1485, file: !1316, line: 179)
!1485 = !DISubprogram(name: "wcscat", scope: !1322, file: !1322, line: 97, type: !1486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1486 = !DISubroutineType(types: !1487)
!1487 = !{!892, !891, !938}
!1488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1489, file: !1316, line: 180)
!1489 = !DISubprogram(name: "wcscmp", scope: !1322, file: !1322, line: 106, type: !1490, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1490 = !DISubroutineType(types: !1491)
!1491 = !{!172, !939, !939}
!1492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1493, file: !1316, line: 181)
!1493 = !DISubprogram(name: "wcscoll", scope: !1322, file: !1322, line: 131, type: !1490, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1495, file: !1316, line: 182)
!1495 = !DISubprogram(name: "wcscpy", scope: !1322, file: !1322, line: 87, type: !1486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1497, file: !1316, line: 183)
!1497 = !DISubprogram(name: "wcscspn", scope: !1322, file: !1322, line: 188, type: !1498, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1498 = !DISubroutineType(types: !1499)
!1499 = !{!820, !939, !939}
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1501, file: !1316, line: 184)
!1501 = !DISubprogram(name: "wcsftime", scope: !1322, file: !1322, line: 852, type: !1502, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1502 = !DISubroutineType(types: !1503)
!1503 = !{!820, !891, !820, !938, !1504}
!1504 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1505)
!1505 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1506, size: 64)
!1506 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1507)
!1507 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1508, line: 7, size: 448, flags: DIFlagTypePassByValue, elements: !1509, identifier: "_ZTS2tm")
!1508 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!1509 = !{!1510, !1511, !1512, !1513, !1514, !1515, !1516, !1517, !1518, !1519, !1520}
!1510 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !1507, file: !1508, line: 9, baseType: !172, size: 32)
!1511 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !1507, file: !1508, line: 10, baseType: !172, size: 32, offset: 32)
!1512 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !1507, file: !1508, line: 11, baseType: !172, size: 32, offset: 64)
!1513 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !1507, file: !1508, line: 12, baseType: !172, size: 32, offset: 96)
!1514 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !1507, file: !1508, line: 13, baseType: !172, size: 32, offset: 128)
!1515 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !1507, file: !1508, line: 14, baseType: !172, size: 32, offset: 160)
!1516 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !1507, file: !1508, line: 15, baseType: !172, size: 32, offset: 192)
!1517 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !1507, file: !1508, line: 16, baseType: !172, size: 32, offset: 224)
!1518 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !1507, file: !1508, line: 17, baseType: !172, size: 32, offset: 256)
!1519 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !1507, file: !1508, line: 20, baseType: !203, size: 64, offset: 320)
!1520 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !1507, file: !1508, line: 21, baseType: !703, size: 64, offset: 384)
!1521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1522, file: !1316, line: 185)
!1522 = !DISubprogram(name: "wcslen", scope: !1322, file: !1322, line: 223, type: !1523, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1523 = !DISubroutineType(types: !1524)
!1524 = !{!820, !939}
!1525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1526, file: !1316, line: 186)
!1526 = !DISubprogram(name: "wcsncat", scope: !1322, file: !1322, line: 101, type: !1527, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1527 = !DISubroutineType(types: !1528)
!1528 = !{!892, !891, !938, !820}
!1529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1530, file: !1316, line: 187)
!1530 = !DISubprogram(name: "wcsncmp", scope: !1322, file: !1322, line: 109, type: !1531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1531 = !DISubroutineType(types: !1532)
!1532 = !{!172, !939, !939, !820}
!1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1534, file: !1316, line: 188)
!1534 = !DISubprogram(name: "wcsncpy", scope: !1322, file: !1322, line: 92, type: !1527, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1536, file: !1316, line: 189)
!1536 = !DISubprogram(name: "wcsrtombs", scope: !1322, file: !1322, line: 344, type: !1537, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1537 = !DISubroutineType(types: !1538)
!1538 = !{!820, !937, !1539, !820, !1416}
!1539 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1540)
!1540 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !939, size: 64)
!1541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1542, file: !1316, line: 190)
!1542 = !DISubprogram(name: "wcsspn", scope: !1322, file: !1322, line: 192, type: !1498, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1544, file: !1316, line: 191)
!1544 = !DISubprogram(name: "wcstod", scope: !1322, file: !1322, line: 378, type: !1545, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1545 = !DISubroutineType(types: !1546)
!1546 = !{!467, !938, !1547}
!1547 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1548)
!1548 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !892, size: 64)
!1549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1550, file: !1316, line: 193)
!1550 = !DISubprogram(name: "wcstof", scope: !1322, file: !1322, line: 383, type: !1551, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1551 = !DISubroutineType(types: !1552)
!1552 = !{!526, !938, !1547}
!1553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1554, file: !1316, line: 195)
!1554 = !DISubprogram(name: "wcstok", scope: !1322, file: !1322, line: 218, type: !1555, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1555 = !DISubroutineType(types: !1556)
!1556 = !{!892, !891, !938, !1547}
!1557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1558, file: !1316, line: 196)
!1558 = !DISubprogram(name: "wcstol", scope: !1322, file: !1322, line: 429, type: !1559, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1559 = !DISubroutineType(types: !1560)
!1560 = !{!203, !938, !1547, !172}
!1561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1562, file: !1316, line: 197)
!1562 = !DISubprogram(name: "wcstoul", scope: !1322, file: !1322, line: 434, type: !1563, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1563 = !DISubroutineType(types: !1564)
!1564 = !{!822, !938, !1547, !172}
!1565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1566, file: !1316, line: 198)
!1566 = !DISubprogram(name: "wcsxfrm", scope: !1322, file: !1322, line: 135, type: !1567, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1567 = !DISubroutineType(types: !1568)
!1568 = !{!820, !891, !938, !820}
!1569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1570, file: !1316, line: 199)
!1570 = !DISubprogram(name: "wctob", scope: !1322, file: !1322, line: 325, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1571 = !DISubroutineType(types: !1572)
!1572 = !{!172, !1318}
!1573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1574, file: !1316, line: 200)
!1574 = !DISubprogram(name: "wmemcmp", scope: !1322, file: !1322, line: 259, type: !1531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1576, file: !1316, line: 201)
!1576 = !DISubprogram(name: "wmemcpy", scope: !1322, file: !1322, line: 263, type: !1527, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1578, file: !1316, line: 202)
!1578 = !DISubprogram(name: "wmemmove", scope: !1322, file: !1322, line: 268, type: !1579, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1579 = !DISubroutineType(types: !1580)
!1580 = !{!892, !892, !939, !820}
!1581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1582, file: !1316, line: 203)
!1582 = !DISubprogram(name: "wmemset", scope: !1322, file: !1322, line: 272, type: !1583, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1583 = !DISubroutineType(types: !1584)
!1584 = !{!892, !892, !893, !820}
!1585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1586, file: !1316, line: 204)
!1586 = !DISubprogram(name: "wprintf", scope: !1322, file: !1322, line: 602, type: !1587, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1587 = !DISubroutineType(types: !1588)
!1588 = !{!172, !938, null}
!1589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1590, file: !1316, line: 205)
!1590 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !1322, file: !1322, line: 661, type: !1587, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1592, file: !1316, line: 206)
!1592 = !DISubprogram(name: "wcschr", scope: !1322, file: !1322, line: 165, type: !1593, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1593 = !DISubroutineType(types: !1594)
!1594 = !{!892, !939, !893}
!1595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1596, file: !1316, line: 207)
!1596 = !DISubprogram(name: "wcspbrk", scope: !1322, file: !1322, line: 202, type: !1597, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1597 = !DISubroutineType(types: !1598)
!1598 = !{!892, !939, !939}
!1599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1600, file: !1316, line: 208)
!1600 = !DISubprogram(name: "wcsrchr", scope: !1322, file: !1322, line: 175, type: !1593, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1602, file: !1316, line: 209)
!1602 = !DISubprogram(name: "wcsstr", scope: !1322, file: !1322, line: 213, type: !1597, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1604, file: !1316, line: 210)
!1604 = !DISubprogram(name: "wmemchr", scope: !1322, file: !1322, line: 254, type: !1605, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1605 = !DISubroutineType(types: !1606)
!1606 = !{!892, !939, !893, !820}
!1607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !1608, file: !1316, line: 251)
!1608 = !DISubprogram(name: "wcstold", scope: !1322, file: !1322, line: 385, type: !1609, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1609 = !DISubroutineType(types: !1610)
!1610 = !{!537, !938, !1547}
!1611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !1612, file: !1316, line: 260)
!1612 = !DISubprogram(name: "wcstoll", scope: !1322, file: !1322, line: 442, type: !1613, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1613 = !DISubroutineType(types: !1614)
!1614 = !{!648, !938, !1547, !172}
!1615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !1616, file: !1316, line: 261)
!1616 = !DISubprogram(name: "wcstoull", scope: !1322, file: !1322, line: 449, type: !1617, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1617 = !DISubroutineType(types: !1618)
!1618 = !{!974, !938, !1547, !172}
!1619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1608, file: !1316, line: 267)
!1620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1612, file: !1316, line: 268)
!1621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1616, file: !1316, line: 269)
!1622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1550, file: !1316, line: 283)
!1623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1465, file: !1316, line: 286)
!1624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1471, file: !1316, line: 289)
!1625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1479, file: !1316, line: 292)
!1626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1608, file: !1316, line: 296)
!1627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1612, file: !1316, line: 297)
!1628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1616, file: !1316, line: 298)
!1629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1630, file: !1633, line: 47)
!1630 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1631, line: 24, baseType: !1632)
!1631 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!1632 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !189, line: 37, baseType: !1359)
!1633 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdint", directory: "")
!1634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1635, file: !1633, line: 48)
!1635 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1631, line: 25, baseType: !1636)
!1636 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !189, line: 39, baseType: !1637)
!1637 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1639, file: !1633, line: 49)
!1639 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1631, line: 26, baseType: !1640)
!1640 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !189, line: 41, baseType: !172)
!1641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1642, file: !1633, line: 50)
!1642 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1631, line: 27, baseType: !1643)
!1643 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !189, line: 44, baseType: !203)
!1644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1645, file: !1633, line: 52)
!1645 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !208, line: 58, baseType: !1359)
!1646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1647, file: !1633, line: 53)
!1647 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !208, line: 60, baseType: !203)
!1648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1649, file: !1633, line: 54)
!1649 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !208, line: 61, baseType: !203)
!1650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1651, file: !1633, line: 55)
!1651 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !208, line: 62, baseType: !203)
!1652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1653, file: !1633, line: 57)
!1653 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !208, line: 43, baseType: !1654)
!1654 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !189, line: 52, baseType: !1632)
!1655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1656, file: !1633, line: 58)
!1656 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !208, line: 44, baseType: !1657)
!1657 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !189, line: 54, baseType: !1636)
!1658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1659, file: !1633, line: 59)
!1659 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !208, line: 45, baseType: !1660)
!1660 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !189, line: 56, baseType: !1640)
!1661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1662, file: !1633, line: 60)
!1662 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !208, line: 46, baseType: !1663)
!1663 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !189, line: 58, baseType: !1643)
!1664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !207, file: !1633, line: 62)
!1665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1666, file: !1633, line: 63)
!1666 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !208, line: 87, baseType: !203)
!1667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1668, file: !1633, line: 65)
!1668 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !187, line: 24, baseType: !1669)
!1669 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !189, line: 38, baseType: !269)
!1670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1671, file: !1633, line: 66)
!1671 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !187, line: 25, baseType: !1672)
!1672 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !189, line: 40, baseType: !1357)
!1673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !186, file: !1633, line: 67)
!1674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1675, file: !1633, line: 68)
!1675 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !187, line: 27, baseType: !1676)
!1676 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !189, line: 45, baseType: !822)
!1677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1678, file: !1633, line: 70)
!1678 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !208, line: 71, baseType: !269)
!1679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1680, file: !1633, line: 71)
!1680 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !208, line: 73, baseType: !822)
!1681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1682, file: !1633, line: 72)
!1682 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !208, line: 74, baseType: !822)
!1683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1684, file: !1633, line: 73)
!1684 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !208, line: 75, baseType: !822)
!1685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1686, file: !1633, line: 75)
!1686 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !208, line: 49, baseType: !1687)
!1687 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !189, line: 53, baseType: !1669)
!1688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1689, file: !1633, line: 76)
!1689 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !208, line: 50, baseType: !1690)
!1690 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !189, line: 55, baseType: !1672)
!1691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1692, file: !1633, line: 77)
!1692 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !208, line: 51, baseType: !1693)
!1693 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !189, line: 57, baseType: !188)
!1694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1695, file: !1633, line: 78)
!1695 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !208, line: 52, baseType: !1696)
!1696 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !189, line: 59, baseType: !1676)
!1697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1698, file: !1633, line: 80)
!1698 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !208, line: 102, baseType: !1699)
!1699 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !189, line: 73, baseType: !822)
!1700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1701, file: !1633, line: 81)
!1701 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !208, line: 90, baseType: !822)
!1702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1703, file: !1705, line: 53)
!1703 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1704, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1704 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a1d177e0f311dc60a74cb347049d75bc")
!1705 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/clocale", directory: "")
!1706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1707, file: !1705, line: 54)
!1707 = !DISubprogram(name: "setlocale", scope: !1704, file: !1704, line: 122, type: !1708, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1708 = !DISubroutineType(types: !1709)
!1709 = !{!870, !172, !703}
!1710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1711, file: !1705, line: 55)
!1711 = !DISubprogram(name: "localeconv", scope: !1704, file: !1704, line: 125, type: !1712, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1712 = !DISubroutineType(types: !1713)
!1713 = !{!1714}
!1714 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1703, size: 64)
!1715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1716, file: !1718, line: 64)
!1716 = !DISubprogram(name: "isalnum", scope: !1717, file: !1717, line: 108, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1717 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "3ab3dd7fdf2578005732722ee2393e59")
!1718 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cctype", directory: "")
!1719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1720, file: !1718, line: 65)
!1720 = !DISubprogram(name: "isalpha", scope: !1717, file: !1717, line: 109, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1722, file: !1718, line: 66)
!1722 = !DISubprogram(name: "iscntrl", scope: !1717, file: !1717, line: 110, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1724, file: !1718, line: 67)
!1724 = !DISubprogram(name: "isdigit", scope: !1717, file: !1717, line: 111, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1726, file: !1718, line: 68)
!1726 = !DISubprogram(name: "isgraph", scope: !1717, file: !1717, line: 113, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1728, file: !1718, line: 69)
!1728 = !DISubprogram(name: "islower", scope: !1717, file: !1717, line: 112, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1730, file: !1718, line: 70)
!1730 = !DISubprogram(name: "isprint", scope: !1717, file: !1717, line: 114, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1732, file: !1718, line: 71)
!1732 = !DISubprogram(name: "ispunct", scope: !1717, file: !1717, line: 115, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1734, file: !1718, line: 72)
!1734 = !DISubprogram(name: "isspace", scope: !1717, file: !1717, line: 116, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1736, file: !1718, line: 73)
!1736 = !DISubprogram(name: "isupper", scope: !1717, file: !1717, line: 117, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1738, file: !1718, line: 74)
!1738 = !DISubprogram(name: "isxdigit", scope: !1717, file: !1717, line: 118, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1740, file: !1718, line: 75)
!1740 = !DISubprogram(name: "tolower", scope: !1717, file: !1717, line: 122, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1742, file: !1718, line: 76)
!1742 = !DISubprogram(name: "toupper", scope: !1717, file: !1717, line: 125, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1744, file: !1718, line: 87)
!1744 = !DISubprogram(name: "isblank", scope: !1717, file: !1717, line: 130, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1746, file: !1748, line: 98)
!1746 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1747, line: 7, baseType: !1332)
!1747 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1748 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdio", directory: "")
!1749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1750, file: !1748, line: 99)
!1750 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1751, line: 84, baseType: !1752)
!1751 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!1752 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1753, line: 14, baseType: !1754)
!1753 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1754 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1753, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1756, file: !1748, line: 101)
!1756 = !DISubprogram(name: "clearerr", scope: !1751, file: !1751, line: 786, type: !1757, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1757 = !DISubroutineType(types: !1758)
!1758 = !{null, !1759}
!1759 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1746, size: 64)
!1760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1761, file: !1748, line: 102)
!1761 = !DISubprogram(name: "fclose", scope: !1751, file: !1751, line: 178, type: !1762, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1762 = !DISubroutineType(types: !1763)
!1763 = !{!172, !1759}
!1764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1765, file: !1748, line: 103)
!1765 = !DISubprogram(name: "feof", scope: !1751, file: !1751, line: 788, type: !1762, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1767, file: !1748, line: 104)
!1767 = !DISubprogram(name: "ferror", scope: !1751, file: !1751, line: 790, type: !1762, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1769, file: !1748, line: 105)
!1769 = !DISubprogram(name: "fflush", scope: !1751, file: !1751, line: 230, type: !1762, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1771, file: !1748, line: 106)
!1771 = !DISubprogram(name: "fgetc", scope: !1751, file: !1751, line: 513, type: !1762, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1773, file: !1748, line: 107)
!1773 = !DISubprogram(name: "fgetpos", scope: !1751, file: !1751, line: 760, type: !1774, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1774 = !DISubroutineType(types: !1775)
!1775 = !{!172, !1776, !1777}
!1776 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1759)
!1777 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1778)
!1778 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1750, size: 64)
!1779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1780, file: !1748, line: 108)
!1780 = !DISubprogram(name: "fgets", scope: !1751, file: !1751, line: 592, type: !1781, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1781 = !DISubroutineType(types: !1782)
!1782 = !{!870, !937, !172, !1776}
!1783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1784, file: !1748, line: 109)
!1784 = !DISubprogram(name: "fopen", scope: !1751, file: !1751, line: 258, type: !1785, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1785 = !DISubroutineType(types: !1786)
!1786 = !{!1759, !894, !894}
!1787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1788, file: !1748, line: 110)
!1788 = !DISubprogram(name: "fprintf", scope: !1751, file: !1751, line: 350, type: !1789, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1789 = !DISubroutineType(types: !1790)
!1790 = !{!172, !1776, !894, null}
!1791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1792, file: !1748, line: 111)
!1792 = !DISubprogram(name: "fputc", scope: !1751, file: !1751, line: 549, type: !1793, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1793 = !DISubroutineType(types: !1794)
!1794 = !{!172, !172, !1759}
!1795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1796, file: !1748, line: 112)
!1796 = !DISubprogram(name: "fputs", scope: !1751, file: !1751, line: 655, type: !1797, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1797 = !DISubroutineType(types: !1798)
!1798 = !{!172, !894, !1776}
!1799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1800, file: !1748, line: 113)
!1800 = !DISubprogram(name: "fread", scope: !1751, file: !1751, line: 675, type: !1801, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1801 = !DISubroutineType(types: !1802)
!1802 = !{!820, !1803, !820, !820, !1776}
!1803 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !271)
!1804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1805, file: !1748, line: 114)
!1805 = !DISubprogram(name: "freopen", scope: !1751, file: !1751, line: 265, type: !1806, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1806 = !DISubroutineType(types: !1807)
!1807 = !{!1759, !894, !894, !1776}
!1808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1809, file: !1748, line: 115)
!1809 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !1751, file: !1751, line: 434, type: !1789, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1811, file: !1748, line: 116)
!1811 = !DISubprogram(name: "fseek", scope: !1751, file: !1751, line: 713, type: !1812, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1812 = !DISubroutineType(types: !1813)
!1813 = !{!172, !1759, !203, !172}
!1814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1815, file: !1748, line: 117)
!1815 = !DISubprogram(name: "fsetpos", scope: !1751, file: !1751, line: 765, type: !1816, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1816 = !DISubroutineType(types: !1817)
!1817 = !{!172, !1759, !1818}
!1818 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1819, size: 64)
!1819 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1750)
!1820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1821, file: !1748, line: 118)
!1821 = !DISubprogram(name: "ftell", scope: !1751, file: !1751, line: 718, type: !1822, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1822 = !DISubroutineType(types: !1823)
!1823 = !{!203, !1759}
!1824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1825, file: !1748, line: 119)
!1825 = !DISubprogram(name: "fwrite", scope: !1751, file: !1751, line: 681, type: !1826, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1826 = !DISubroutineType(types: !1827)
!1827 = !{!820, !1828, !820, !820, !1776}
!1828 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !846)
!1829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1830, file: !1748, line: 120)
!1830 = !DISubprogram(name: "getc", scope: !1751, file: !1751, line: 514, type: !1762, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1832, file: !1748, line: 121)
!1832 = !DISubprogram(name: "getchar", scope: !1833, file: !1833, line: 47, type: !907, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1833 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c10e343656e7a2bf1044ef4e4442d902")
!1834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1835, file: !1748, line: 126)
!1835 = !DISubprogram(name: "perror", scope: !1751, file: !1751, line: 804, type: !1836, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1836 = !DISubroutineType(types: !1837)
!1837 = !{null, !703}
!1838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1839, file: !1748, line: 127)
!1839 = !DISubprogram(name: "printf", scope: !1751, file: !1751, line: 356, type: !1840, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1840 = !DISubroutineType(types: !1841)
!1841 = !{!172, !894, null}
!1842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1843, file: !1748, line: 128)
!1843 = !DISubprogram(name: "putc", scope: !1751, file: !1751, line: 550, type: !1793, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1845, file: !1748, line: 129)
!1845 = !DISubprogram(name: "putchar", scope: !1833, file: !1833, line: 82, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1847, file: !1748, line: 130)
!1847 = !DISubprogram(name: "puts", scope: !1751, file: !1751, line: 661, type: !835, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1849, file: !1748, line: 131)
!1849 = !DISubprogram(name: "remove", scope: !1751, file: !1751, line: 152, type: !835, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1851, file: !1748, line: 132)
!1851 = !DISubprogram(name: "rename", scope: !1751, file: !1751, line: 154, type: !1852, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1852 = !DISubroutineType(types: !1853)
!1853 = !{!172, !703, !703}
!1854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1855, file: !1748, line: 133)
!1855 = !DISubprogram(name: "rewind", scope: !1751, file: !1751, line: 723, type: !1757, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1857, file: !1748, line: 134)
!1857 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !1751, file: !1751, line: 437, type: !1840, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1859, file: !1748, line: 135)
!1859 = !DISubprogram(name: "setbuf", scope: !1751, file: !1751, line: 328, type: !1860, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1860 = !DISubroutineType(types: !1861)
!1861 = !{null, !1776, !937}
!1862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1863, file: !1748, line: 136)
!1863 = !DISubprogram(name: "setvbuf", scope: !1751, file: !1751, line: 332, type: !1864, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1864 = !DISubroutineType(types: !1865)
!1865 = !{!172, !1776, !937, !172, !820}
!1866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1867, file: !1748, line: 137)
!1867 = !DISubprogram(name: "sprintf", scope: !1751, file: !1751, line: 358, type: !1868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1868 = !DISubroutineType(types: !1869)
!1869 = !{!172, !937, !894, null}
!1870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1871, file: !1748, line: 138)
!1871 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !1751, file: !1751, line: 439, type: !1872, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1872 = !DISubroutineType(types: !1873)
!1873 = !{!172, !894, !894, null}
!1874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1875, file: !1748, line: 139)
!1875 = !DISubprogram(name: "tmpfile", scope: !1751, file: !1751, line: 188, type: !1876, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1876 = !DISubroutineType(types: !1877)
!1877 = !{!1759}
!1878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1879, file: !1748, line: 141)
!1879 = !DISubprogram(name: "tmpnam", scope: !1751, file: !1751, line: 205, type: !1880, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1880 = !DISubroutineType(types: !1881)
!1881 = !{!870, !870}
!1882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1883, file: !1748, line: 143)
!1883 = !DISubprogram(name: "ungetc", scope: !1751, file: !1751, line: 668, type: !1793, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1885, file: !1748, line: 144)
!1885 = !DISubprogram(name: "vfprintf", scope: !1751, file: !1751, line: 365, type: !1886, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1886 = !DISubroutineType(types: !1887)
!1887 = !{!172, !1776, !894, !1456}
!1888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1889, file: !1748, line: 145)
!1889 = !DISubprogram(name: "vprintf", scope: !1833, file: !1833, line: 39, type: !1890, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1890 = !DISubroutineType(types: !1891)
!1891 = !{!172, !894, !1456}
!1892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1893, file: !1748, line: 146)
!1893 = !DISubprogram(name: "vsprintf", scope: !1751, file: !1751, line: 373, type: !1894, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1894 = !DISubroutineType(types: !1895)
!1895 = !{!172, !937, !894, !1456}
!1896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !1897, file: !1748, line: 175)
!1897 = !DISubprogram(name: "snprintf", scope: !1751, file: !1751, line: 378, type: !1898, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1898 = !DISubroutineType(types: !1899)
!1899 = !{!172, !937, !820, !894, null}
!1900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !1901, file: !1748, line: 176)
!1901 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !1751, file: !1751, line: 479, type: !1886, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !1903, file: !1748, line: 177)
!1903 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !1751, file: !1751, line: 484, type: !1890, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !1905, file: !1748, line: 178)
!1905 = !DISubprogram(name: "vsnprintf", scope: !1751, file: !1751, line: 382, type: !1906, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1906 = !DISubroutineType(types: !1907)
!1907 = !{!172, !937, !820, !894, !1456}
!1908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !946, entity: !1909, file: !1748, line: 179)
!1909 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !1751, file: !1751, line: 487, type: !1910, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1910 = !DISubroutineType(types: !1911)
!1911 = !{!172, !894, !894, !1456}
!1912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1897, file: !1748, line: 185)
!1913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1901, file: !1748, line: 186)
!1914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1903, file: !1748, line: 187)
!1915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1905, file: !1748, line: 188)
!1916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1909, file: !1748, line: 189)
!1917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1918, file: !1922, line: 82)
!1918 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1919, line: 48, baseType: !1920)
!1919 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "9bcd8e8b8cd2078c8a6c42e262af7d7b")
!1920 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1921, size: 64)
!1921 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1640)
!1922 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cwctype", directory: "")
!1923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1924, file: !1922, line: 83)
!1924 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1925, line: 38, baseType: !822)
!1925 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "48fed714a84c77fca0455b433489fc47")
!1926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1318, file: !1922, line: 84)
!1927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1928, file: !1922, line: 86)
!1928 = !DISubprogram(name: "iswalnum", scope: !1925, file: !1925, line: 95, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1930, file: !1922, line: 87)
!1930 = !DISubprogram(name: "iswalpha", scope: !1925, file: !1925, line: 101, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1932, file: !1922, line: 89)
!1932 = !DISubprogram(name: "iswblank", scope: !1925, file: !1925, line: 146, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1934, file: !1922, line: 91)
!1934 = !DISubprogram(name: "iswcntrl", scope: !1925, file: !1925, line: 104, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1936, file: !1922, line: 92)
!1936 = !DISubprogram(name: "iswctype", scope: !1925, file: !1925, line: 159, type: !1937, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1937 = !DISubroutineType(types: !1938)
!1938 = !{!172, !1318, !1924}
!1939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1940, file: !1922, line: 93)
!1940 = !DISubprogram(name: "iswdigit", scope: !1925, file: !1925, line: 108, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1942, file: !1922, line: 94)
!1942 = !DISubprogram(name: "iswgraph", scope: !1925, file: !1925, line: 112, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1944, file: !1922, line: 95)
!1944 = !DISubprogram(name: "iswlower", scope: !1925, file: !1925, line: 117, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1946, file: !1922, line: 96)
!1946 = !DISubprogram(name: "iswprint", scope: !1925, file: !1925, line: 120, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1948, file: !1922, line: 97)
!1948 = !DISubprogram(name: "iswpunct", scope: !1925, file: !1925, line: 125, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1950, file: !1922, line: 98)
!1950 = !DISubprogram(name: "iswspace", scope: !1925, file: !1925, line: 130, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1952, file: !1922, line: 99)
!1952 = !DISubprogram(name: "iswupper", scope: !1925, file: !1925, line: 135, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1954, file: !1922, line: 100)
!1954 = !DISubprogram(name: "iswxdigit", scope: !1925, file: !1925, line: 140, type: !1571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1956, file: !1922, line: 101)
!1956 = !DISubprogram(name: "towctrans", scope: !1919, file: !1919, line: 55, type: !1957, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1957 = !DISubroutineType(types: !1958)
!1958 = !{!1318, !1318, !1918}
!1959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1960, file: !1922, line: 102)
!1960 = !DISubprogram(name: "towlower", scope: !1925, file: !1925, line: 166, type: !1961, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1961 = !DISubroutineType(types: !1962)
!1962 = !{!1318, !1318}
!1963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1964, file: !1922, line: 103)
!1964 = !DISubprogram(name: "towupper", scope: !1925, file: !1925, line: 169, type: !1961, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1966, file: !1922, line: 104)
!1966 = !DISubprogram(name: "wctrans", scope: !1919, file: !1919, line: 52, type: !1967, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1967 = !DISubroutineType(types: !1968)
!1968 = !{!1918, !703}
!1969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1970, file: !1922, line: 105)
!1970 = !DISubprogram(name: "wctype", scope: !1925, file: !1925, line: 155, type: !1971, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1971 = !DISubroutineType(types: !1972)
!1972 = !{!1924, !703}
!1973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1974, file: !1977, line: 60)
!1974 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1975, line: 7, baseType: !1976)
!1975 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1976 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !189, line: 156, baseType: !203)
!1977 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ctime", directory: "")
!1978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !272, file: !1977, line: 61)
!1979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1507, file: !1977, line: 62)
!1980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1981, file: !1977, line: 64)
!1981 = !DISubprogram(name: "clock", scope: !1982, file: !1982, line: 72, type: !1983, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1982 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "db37158473a25e1d89b19f8bc6892801")
!1983 = !DISubroutineType(types: !1984)
!1984 = !{!1974}
!1985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1986, file: !1977, line: 65)
!1986 = !DISubprogram(name: "difftime", scope: !1982, file: !1982, line: 79, type: !1987, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1987 = !DISubroutineType(types: !1988)
!1988 = !{!467, !272, !272}
!1989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1990, file: !1977, line: 66)
!1990 = !DISubprogram(name: "mktime", scope: !1982, file: !1982, line: 83, type: !1991, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1991 = !DISubroutineType(types: !1992)
!1992 = !{!272, !1993}
!1993 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1507, size: 64)
!1994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1995, file: !1977, line: 67)
!1995 = !DISubprogram(name: "time", scope: !1982, file: !1982, line: 76, type: !1996, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1996 = !DISubroutineType(types: !1997)
!1997 = !{!272, !1998}
!1998 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!1999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2000, file: !1977, line: 68)
!2000 = !DISubprogram(name: "asctime", scope: !1982, file: !1982, line: 179, type: !2001, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2001 = !DISubroutineType(types: !2002)
!2002 = !{!870, !1505}
!2003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2004, file: !1977, line: 69)
!2004 = !DISubprogram(name: "ctime", scope: !1982, file: !1982, line: 183, type: !2005, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2005 = !DISubroutineType(types: !2006)
!2006 = !{!870, !2007}
!2007 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2008, size: 64)
!2008 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !272)
!2009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2010, file: !1977, line: 70)
!2010 = !DISubprogram(name: "gmtime", scope: !1982, file: !1982, line: 132, type: !2011, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2011 = !DISubroutineType(types: !2012)
!2012 = !{!1993, !2007}
!2013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2014, file: !1977, line: 71)
!2014 = !DISubprogram(name: "localtime", scope: !1982, file: !1982, line: 136, type: !2011, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2016, file: !1977, line: 72)
!2016 = !DISubprogram(name: "strftime", scope: !1982, file: !1982, line: 100, type: !2017, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2017 = !DISubroutineType(types: !2018)
!2018 = !{!820, !937, !820, !894, !1504}
!2019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2020, file: !1977, line: 79)
!2020 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !2021, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !2022, identifier: "_ZTS8timespec")
!2021 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!2022 = !{!2023, !2024}
!2023 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !2020, file: !2021, line: 16, baseType: !274, size: 64)
!2024 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !2020, file: !2021, line: 21, baseType: !2025, size: 64, offset: 64)
!2025 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !189, line: 197, baseType: !203)
!2026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2027, file: !1977, line: 80)
!2027 = !DISubprogram(name: "timespec_get", scope: !1982, file: !1982, line: 371, type: !2028, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2028 = !DISubroutineType(types: !2029)
!2029 = !{!172, !2030, !172}
!2030 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2020, size: 64)
!2031 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !198, entity: !2032, file: !197, line: 1428)
!2032 = !DINamespace(name: "chrono_literals", scope: !2033, exportSymbols: true)
!2033 = !DINamespace(name: "literals", scope: !2, exportSymbols: true)
!2034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2035, file: !2039, line: 77)
!2035 = !DISubprogram(name: "memchr", scope: !2036, file: !2036, line: 100, type: !2037, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2036 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "f443da8025a0b7c1498fb6c554ec788d")
!2037 = !DISubroutineType(types: !2038)
!2038 = !{!846, !846, !172, !820}
!2039 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstring", directory: "")
!2040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2041, file: !2039, line: 78)
!2041 = !DISubprogram(name: "memcmp", scope: !2036, file: !2036, line: 64, type: !2042, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2042 = !DISubroutineType(types: !2043)
!2043 = !{!172, !846, !846, !820}
!2044 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2045, file: !2039, line: 79)
!2045 = !DISubprogram(name: "memcpy", linkageName: "_ZL6memcpyPvPKvm", scope: !2046, file: !2046, line: 1033, type: !2047, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2046 = !DIFile(filename: "/opt/rocm-5.6.0/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "007b363385afd7b068da381439832c46")
!2047 = !DISubroutineType(types: !2048)
!2048 = !{!271, !271, !846, !820}
!2049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2050, file: !2039, line: 80)
!2050 = !DISubprogram(name: "memmove", scope: !2036, file: !2036, line: 47, type: !2047, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2052, file: !2039, line: 81)
!2052 = !DISubprogram(name: "memset", linkageName: "_ZL6memsetPvim", scope: !2046, file: !2046, line: 1037, type: !2053, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2053 = !DISubroutineType(types: !2054)
!2054 = !{!271, !271, !172, !820}
!2055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2056, file: !2039, line: 82)
!2056 = !DISubprogram(name: "strcat", scope: !2036, file: !2036, line: 149, type: !2057, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2057 = !DISubroutineType(types: !2058)
!2058 = !{!870, !937, !894}
!2059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2060, file: !2039, line: 83)
!2060 = !DISubprogram(name: "strcmp", scope: !2036, file: !2036, line: 156, type: !1852, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2062, file: !2039, line: 84)
!2062 = !DISubprogram(name: "strcoll", scope: !2036, file: !2036, line: 163, type: !1852, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2064, file: !2039, line: 85)
!2064 = !DISubprogram(name: "strcpy", scope: !2036, file: !2036, line: 141, type: !2057, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2066, file: !2039, line: 86)
!2066 = !DISubprogram(name: "strcspn", scope: !2036, file: !2036, line: 293, type: !2067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2067 = !DISubroutineType(types: !2068)
!2068 = !{!820, !703, !703}
!2069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2070, file: !2039, line: 87)
!2070 = !DISubprogram(name: "strerror", scope: !2036, file: !2036, line: 419, type: !2071, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2071 = !DISubroutineType(types: !2072)
!2072 = !{!870, !172}
!2073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2074, file: !2039, line: 88)
!2074 = !DISubprogram(name: "strlen", scope: !2036, file: !2036, line: 407, type: !2075, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2075 = !DISubroutineType(types: !2076)
!2076 = !{!820, !703}
!2077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2078, file: !2039, line: 89)
!2078 = !DISubprogram(name: "strncat", scope: !2036, file: !2036, line: 152, type: !2079, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2079 = !DISubroutineType(types: !2080)
!2080 = !{!870, !937, !894, !820}
!2081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2082, file: !2039, line: 90)
!2082 = !DISubprogram(name: "strncmp", scope: !2036, file: !2036, line: 159, type: !2083, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2083 = !DISubroutineType(types: !2084)
!2084 = !{!172, !703, !703, !820}
!2085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2086, file: !2039, line: 91)
!2086 = !DISubprogram(name: "strncpy", scope: !2036, file: !2036, line: 144, type: !2079, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2088, file: !2039, line: 92)
!2088 = !DISubprogram(name: "strspn", scope: !2036, file: !2036, line: 297, type: !2067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2090, file: !2039, line: 93)
!2090 = !DISubprogram(name: "strtok", scope: !2036, file: !2036, line: 356, type: !2057, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2092, file: !2039, line: 94)
!2092 = !DISubprogram(name: "strxfrm", scope: !2036, file: !2036, line: 166, type: !2093, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2093 = !DISubroutineType(types: !2094)
!2094 = !{!820, !937, !894, !820}
!2095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2096, file: !2039, line: 95)
!2096 = !DISubprogram(name: "strchr", scope: !2036, file: !2036, line: 239, type: !2097, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2097 = !DISubroutineType(types: !2098)
!2098 = !{!703, !703, !172}
!2099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2100, file: !2039, line: 96)
!2100 = !DISubprogram(name: "strpbrk", scope: !2036, file: !2036, line: 316, type: !2101, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2101 = !DISubroutineType(types: !2102)
!2102 = !{!703, !703, !703}
!2103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2104, file: !2039, line: 97)
!2104 = !DISubprogram(name: "strrchr", scope: !2036, file: !2036, line: 266, type: !2097, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2106, file: !2039, line: 98)
!2106 = !DISubprogram(name: "strstr", scope: !2036, file: !2036, line: 343, type: !2101, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2107 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2108, entity: !2, file: !9, line: 167)
!2108 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 165, type: !2109, scopeLine: 166, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !2111)
!2109 = !DISubroutineType(types: !2110)
!2110 = !{!172, !172, !922}
!2111 = !{!2112, !2113, !2114}
!2112 = !DILocalVariable(name: "argc", arg: 1, scope: !2108, file: !9, line: 165, type: !172)
!2113 = !DILocalVariable(name: "argv", arg: 2, scope: !2108, file: !9, line: 165, type: !922)
!2114 = !DILocalVariable(name: "devProp", scope: !2108, file: !9, line: 168, type: !2115)
!2115 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipDeviceProp_t", file: !82, line: 153, baseType: !2116)
!2116 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hipDeviceProp_t", file: !82, line: 87, size: 6336, flags: DIFlagTypePassByValue, elements: !2117, identifier: "_ZTS15hipDeviceProp_t")
!2117 = !{!2118, !2122, !2123, !2124, !2125, !2126, !2127, !2131, !2132, !2133, !2134, !2135, !2136, !2137, !2138, !2139, !2140, !2141, !2142, !2143, !2164, !2165, !2166, !2167, !2168, !2169, !2170, !2171, !2172, !2173, !2174, !2175, !2176, !2177, !2178, !2180, !2181, !2183, !2184, !2185, !2186, !2187, !2188, !2189, !2190, !2191, !2192, !2193, !2194, !2195, !2196, !2197, !2198, !2199, !2200}
!2118 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !2116, file: !82, line: 88, baseType: !2119, size: 2048)
!2119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 2048, elements: !2120)
!2120 = !{!2121}
!2121 = !DISubrange(count: 256)
!2122 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !2116, file: !82, line: 89, baseType: !820, size: 64, offset: 2048)
!2123 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !2116, file: !82, line: 90, baseType: !820, size: 64, offset: 2112)
!2124 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !2116, file: !82, line: 91, baseType: !172, size: 32, offset: 2176)
!2125 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !2116, file: !82, line: 92, baseType: !172, size: 32, offset: 2208)
!2126 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !2116, file: !82, line: 93, baseType: !172, size: 32, offset: 2240)
!2127 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !2116, file: !82, line: 94, baseType: !2128, size: 96, offset: 2272)
!2128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !172, size: 96, elements: !2129)
!2129 = !{!2130}
!2130 = !DISubrange(count: 3)
!2131 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !2116, file: !82, line: 95, baseType: !2128, size: 96, offset: 2368)
!2132 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !2116, file: !82, line: 96, baseType: !172, size: 32, offset: 2464)
!2133 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !2116, file: !82, line: 97, baseType: !172, size: 32, offset: 2496)
!2134 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !2116, file: !82, line: 98, baseType: !172, size: 32, offset: 2528)
!2135 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !2116, file: !82, line: 99, baseType: !820, size: 64, offset: 2560)
!2136 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !2116, file: !82, line: 100, baseType: !172, size: 32, offset: 2624)
!2137 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !2116, file: !82, line: 103, baseType: !172, size: 32, offset: 2656)
!2138 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !2116, file: !82, line: 106, baseType: !172, size: 32, offset: 2688)
!2139 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !2116, file: !82, line: 107, baseType: !172, size: 32, offset: 2720)
!2140 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !2116, file: !82, line: 108, baseType: !172, size: 32, offset: 2752)
!2141 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !2116, file: !82, line: 109, baseType: !172, size: 32, offset: 2784)
!2142 = !DIDerivedType(tag: DW_TAG_member, name: "clockInstructionRate", scope: !2116, file: !82, line: 110, baseType: !172, size: 32, offset: 2816)
!2143 = !DIDerivedType(tag: DW_TAG_member, name: "arch", scope: !2116, file: !82, line: 112, baseType: !2144, size: 32, offset: 2848)
!2144 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipDeviceArch_t", file: !82, line: 74, baseType: !2145)
!2145 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !82, line: 45, size: 32, flags: DIFlagTypePassByValue, elements: !2146, identifier: "_ZTS15hipDeviceArch_t")
!2146 = !{!2147, !2148, !2149, !2150, !2151, !2152, !2153, !2154, !2155, !2156, !2157, !2158, !2159, !2160, !2161, !2162, !2163}
!2147 = !DIDerivedType(tag: DW_TAG_member, name: "hasGlobalInt32Atomics", scope: !2145, file: !82, line: 47, baseType: !83, size: 1, flags: DIFlagBitField, extraData: i64 0)
!2148 = !DIDerivedType(tag: DW_TAG_member, name: "hasGlobalFloatAtomicExch", scope: !2145, file: !82, line: 48, baseType: !83, size: 1, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!2149 = !DIDerivedType(tag: DW_TAG_member, name: "hasSharedInt32Atomics", scope: !2145, file: !82, line: 49, baseType: !83, size: 1, offset: 2, flags: DIFlagBitField, extraData: i64 0)
!2150 = !DIDerivedType(tag: DW_TAG_member, name: "hasSharedFloatAtomicExch", scope: !2145, file: !82, line: 50, baseType: !83, size: 1, offset: 3, flags: DIFlagBitField, extraData: i64 0)
!2151 = !DIDerivedType(tag: DW_TAG_member, name: "hasFloatAtomicAdd", scope: !2145, file: !82, line: 51, baseType: !83, size: 1, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!2152 = !DIDerivedType(tag: DW_TAG_member, name: "hasGlobalInt64Atomics", scope: !2145, file: !82, line: 54, baseType: !83, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!2153 = !DIDerivedType(tag: DW_TAG_member, name: "hasSharedInt64Atomics", scope: !2145, file: !82, line: 55, baseType: !83, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!2154 = !DIDerivedType(tag: DW_TAG_member, name: "hasDoubles", scope: !2145, file: !82, line: 58, baseType: !83, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!2155 = !DIDerivedType(tag: DW_TAG_member, name: "hasWarpVote", scope: !2145, file: !82, line: 61, baseType: !83, size: 1, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!2156 = !DIDerivedType(tag: DW_TAG_member, name: "hasWarpBallot", scope: !2145, file: !82, line: 62, baseType: !83, size: 1, offset: 9, flags: DIFlagBitField, extraData: i64 0)
!2157 = !DIDerivedType(tag: DW_TAG_member, name: "hasWarpShuffle", scope: !2145, file: !82, line: 63, baseType: !83, size: 1, offset: 10, flags: DIFlagBitField, extraData: i64 0)
!2158 = !DIDerivedType(tag: DW_TAG_member, name: "hasFunnelShift", scope: !2145, file: !82, line: 64, baseType: !83, size: 1, offset: 11, flags: DIFlagBitField, extraData: i64 0)
!2159 = !DIDerivedType(tag: DW_TAG_member, name: "hasThreadFenceSystem", scope: !2145, file: !82, line: 67, baseType: !83, size: 1, offset: 12, flags: DIFlagBitField, extraData: i64 0)
!2160 = !DIDerivedType(tag: DW_TAG_member, name: "hasSyncThreadsExt", scope: !2145, file: !82, line: 68, baseType: !83, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 0)
!2161 = !DIDerivedType(tag: DW_TAG_member, name: "hasSurfaceFuncs", scope: !2145, file: !82, line: 71, baseType: !83, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 0)
!2162 = !DIDerivedType(tag: DW_TAG_member, name: "has3dGrid", scope: !2145, file: !82, line: 72, baseType: !83, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 0)
!2163 = !DIDerivedType(tag: DW_TAG_member, name: "hasDynamicParallelism", scope: !2145, file: !82, line: 73, baseType: !83, size: 1, offset: 16, flags: DIFlagBitField, extraData: i64 0)
!2164 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !2116, file: !82, line: 113, baseType: !172, size: 32, offset: 2880)
!2165 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !2116, file: !82, line: 114, baseType: !172, size: 32, offset: 2912)
!2166 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !2116, file: !82, line: 115, baseType: !172, size: 32, offset: 2944)
!2167 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !2116, file: !82, line: 116, baseType: !172, size: 32, offset: 2976)
!2168 = !DIDerivedType(tag: DW_TAG_member, name: "maxSharedMemoryPerMultiProcessor", scope: !2116, file: !82, line: 117, baseType: !820, size: 64, offset: 3008)
!2169 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !2116, file: !82, line: 118, baseType: !172, size: 32, offset: 3072)
!2170 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !2116, file: !82, line: 119, baseType: !172, size: 32, offset: 3104)
!2171 = !DIDerivedType(tag: DW_TAG_member, name: "gcnArch", scope: !2116, file: !82, line: 120, baseType: !172, size: 32, offset: 3136)
!2172 = !DIDerivedType(tag: DW_TAG_member, name: "gcnArchName", scope: !2116, file: !82, line: 121, baseType: !2119, size: 2048, offset: 3168)
!2173 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !2116, file: !82, line: 122, baseType: !172, size: 32, offset: 5216)
!2174 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeLaunch", scope: !2116, file: !82, line: 123, baseType: !172, size: 32, offset: 5248)
!2175 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceLaunch", scope: !2116, file: !82, line: 124, baseType: !172, size: 32, offset: 5280)
!2176 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !2116, file: !82, line: 125, baseType: !172, size: 32, offset: 5312)
!2177 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !2116, file: !82, line: 126, baseType: !172, size: 32, offset: 5344)
!2178 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !2116, file: !82, line: 127, baseType: !2179, size: 64, offset: 5376)
!2179 = !DICompositeType(tag: DW_TAG_array_type, baseType: !172, size: 64, elements: !33)
!2180 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !2116, file: !82, line: 128, baseType: !2128, size: 96, offset: 5440)
!2181 = !DIDerivedType(tag: DW_TAG_member, name: "hdpMemFlushCntl", scope: !2116, file: !82, line: 129, baseType: !2182, size: 64, offset: 5568)
!2182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!2183 = !DIDerivedType(tag: DW_TAG_member, name: "hdpRegFlushCntl", scope: !2116, file: !82, line: 130, baseType: !2182, size: 64, offset: 5632)
!2184 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !2116, file: !82, line: 131, baseType: !820, size: 64, offset: 5696)
!2185 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !2116, file: !82, line: 132, baseType: !820, size: 64, offset: 5760)
!2186 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !2116, file: !82, line: 133, baseType: !820, size: 64, offset: 5824)
!2187 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !2116, file: !82, line: 134, baseType: !172, size: 32, offset: 5888)
!2188 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !2116, file: !82, line: 135, baseType: !172, size: 32, offset: 5920)
!2189 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !2116, file: !82, line: 136, baseType: !172, size: 32, offset: 5952)
!2190 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedFunc", scope: !2116, file: !82, line: 137, baseType: !172, size: 32, offset: 5984)
!2191 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedGridDim", scope: !2116, file: !82, line: 139, baseType: !172, size: 32, offset: 6016)
!2192 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedBlockDim", scope: !2116, file: !82, line: 141, baseType: !172, size: 32, offset: 6048)
!2193 = !DIDerivedType(tag: DW_TAG_member, name: "cooperativeMultiDeviceUnmatchedSharedMem", scope: !2116, file: !82, line: 143, baseType: !172, size: 32, offset: 6080)
!2194 = !DIDerivedType(tag: DW_TAG_member, name: "isLargeBar", scope: !2116, file: !82, line: 145, baseType: !172, size: 32, offset: 6112)
!2195 = !DIDerivedType(tag: DW_TAG_member, name: "asicRevision", scope: !2116, file: !82, line: 146, baseType: !172, size: 32, offset: 6144)
!2196 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !2116, file: !82, line: 147, baseType: !172, size: 32, offset: 6176)
!2197 = !DIDerivedType(tag: DW_TAG_member, name: "directManagedMemAccessFromHost", scope: !2116, file: !82, line: 148, baseType: !172, size: 32, offset: 6208)
!2198 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentManagedAccess", scope: !2116, file: !82, line: 149, baseType: !172, size: 32, offset: 6240)
!2199 = !DIDerivedType(tag: DW_TAG_member, name: "pageableMemoryAccess", scope: !2116, file: !82, line: 150, baseType: !172, size: 32, offset: 6272)
!2200 = !DIDerivedType(tag: DW_TAG_member, name: "pageableMemoryAccessUsesHostPageTables", scope: !2116, file: !82, line: 152, baseType: !172, size: 32, offset: 6304)
!2201 = !{i32 7, !"Dwarf Version", i32 5}
!2202 = !{i32 2, !"Debug Info Version", i32 3}
!2203 = !{i32 1, !"wchar_size", i32 4}
!2204 = !{i32 7, !"uwtable", i32 2}
!2205 = !{!"AMD clang version 16.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.6.0 23243 be997b2f3651a41597d7a41441fff8ade4ac59ac)"}
!2206 = !{!2207, !2207, i64 0}
!2207 = !{!"any pointer", !2208, i64 0}
!2208 = !{!"omnipotent char", !2209, i64 0}
!2209 = !{!"Simple C++ TBAA"}
!2210 = !{!2211, !2211, i64 0}
!2211 = !{!"int", !2208, i64 0}
!2212 = distinct !DISubprogram(name: "tick_all_test", linkageName: "_Z13tick_all_testi", scope: !9, file: !9, line: 66, type: !860, scopeLine: 67, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !2213)
!2213 = !{!2214, !2215, !2216, !2218, !2219, !2221, !2222, !2225, !2227, !2228, !2230, !2231, !2233}
!2214 = !DILocalVariable(name: "test", arg: 1, scope: !2212, file: !9, line: 66, type: !172)
!2215 = !DILocalVariable(name: "device", scope: !2212, file: !9, line: 68, type: !172)
!2216 = !DILocalVariable(name: "SIZE", scope: !2212, file: !9, line: 72, type: !2217)
!2217 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !186)
!2218 = !DILocalVariable(name: "spin_limit", scope: !2212, file: !9, line: 73, type: !1642)
!2219 = !DILocalVariable(name: "DISPLAY_LIMIT", scope: !2212, file: !9, line: 74, type: !2220)
!2220 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !820)
!2221 = !DILocalVariable(name: "DISPLAY_LINE_LIMIT", scope: !2212, file: !9, line: 75, type: !2220)
!2222 = !DILocalVariable(name: "clk", scope: !2212, file: !9, line: 79, type: !2223)
!2223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2224, size: 64)
!2224 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !1675)
!2225 = !DILocalVariable(name: "h_vals", scope: !2212, file: !9, line: 85, type: !2226)
!2226 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1675, size: 64)
!2227 = !DILocalVariable(name: "d_vals", scope: !2212, file: !9, line: 87, type: !2226)
!2228 = !DILocalVariable(name: "dummy_data", scope: !2212, file: !9, line: 92, type: !2229)
!2229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1642, size: 64)
!2230 = !DILocalVariable(name: "h_dummy_data", scope: !2212, file: !9, line: 98, type: !2229)
!2231 = !DILocalVariable(name: "i", scope: !2232, file: !9, line: 102, type: !820)
!2232 = distinct !DILexicalBlock(scope: !2212, file: !9, line: 102, column: 3)
!2233 = !DILocalVariable(name: "i", scope: !2234, file: !9, line: 137, type: !820)
!2234 = distinct !DILexicalBlock(scope: !2212, file: !9, line: 137, column: 3)
!2235 = !DILocation(line: 0, scope: !2212)
!2236 = !DILocation(line: 68, column: 3, scope: !2212)
!2237 = !DILocation(line: 68, column: 7, scope: !2212)
!2238 = !DILocation(line: 69, column: 17, scope: !2212)
!2239 = !DILocalVariable(name: "resCode", arg: 1, scope: !2240, file: !9, line: 180, type: !2243)
!2240 = distinct !DISubprogram(name: "__HIP_CHECK__", linkageName: "_Z13__HIP_CHECK__10hipError_t", scope: !9, file: !9, line: 180, type: !2241, scopeLine: 180, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !2244)
!2241 = !DISubroutineType(types: !2242)
!2242 = !{null, !2243}
!2243 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipError_t", file: !82, line: 327, baseType: !81)
!2244 = !{!2239}
!2245 = !DILocation(line: 0, scope: !2240, inlinedAt: !2246)
!2246 = distinct !DILocation(line: 69, column: 3, scope: !2212)
!2247 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !2246)
!2248 = distinct !DILexicalBlock(scope: !2240, file: !9, line: 181, column: 7)
!2249 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !2246)
!2250 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !2246)
!2251 = distinct !DILexicalBlock(scope: !2248, file: !9, line: 181, column: 30)
!2252 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !2246)
!2253 = !DILocalVariable(name: "this", arg: 1, scope: !2254, type: !2269, flags: DIFlagArtificial | DIFlagObjectPointer)
!2254 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !2256, file: !2255, line: 108, type: !2258, scopeLine: 109, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2266, retainedNodes: !2267)
!2255 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ostream", directory: "")
!2256 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ostream<char, std::char_traits<char> >", scope: !2, file: !2257, line: 345, size: 2176, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!2257 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/ostream.tcc", directory: "")
!2258 = !DISubroutineType(types: !2259)
!2259 = !{!2260, !2262, !2263}
!2260 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2261, size: 64)
!2261 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ostream_type", scope: !2256, file: !2255, line: 71, baseType: !2256, flags: DIFlagPublic)
!2262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2256, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2264, size: 64)
!2264 = !DISubroutineType(types: !2265)
!2265 = !{!2260, !2260}
!2266 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !2256, file: !2255, line: 108, type: !2258, scopeLine: 108, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2267 = !{!2253, !2268}
!2268 = !DILocalVariable(name: "__pf", arg: 2, scope: !2254, file: !2255, line: 108, type: !2263)
!2269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2256, size: 64)
!2270 = !DILocation(line: 0, scope: !2254, inlinedAt: !2271)
!2271 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !2246)
!2272 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2271)
!2273 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !2246)
!2274 = !DILocalVariable(name: "__out", arg: 1, scope: !2275, file: !2255, line: 615, type: !2278)
!2275 = distinct !DISubprogram(name: "operator<<<std::char_traits<char> >", linkageName: "_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc", scope: !2, file: !2255, line: 615, type: !2276, scopeLine: 616, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2281, retainedNodes: !2279)
!2276 = !DISubroutineType(types: !2277)
!2277 = !{!2278, !2278, !703}
!2278 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2256, size: 64)
!2279 = !{!2274, !2280}
!2280 = !DILocalVariable(name: "__s", arg: 2, scope: !2275, file: !2255, line: 615, type: !703)
!2281 = !{!2282}
!2282 = !DITemplateTypeParameter(name: "_Traits", type: !2283)
!2283 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !2, file: !2284, line: 339, size: 8, flags: DIFlagTypePassByValue, elements: !2285, templateParams: !2334, identifier: "_ZTSSt11char_traitsIcE")
!2284 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/char_traits.h", directory: "")
!2285 = !{!2286, !2293, !2296, !2297, !2302, !2305, !2308, !2312, !2313, !2316, !2322, !2325, !2328, !2331}
!2286 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignERcRKc", scope: !2283, file: !2284, line: 351, type: !2287, scopeLine: 351, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2287 = !DISubroutineType(types: !2288)
!2288 = !{null, !2289, !2291}
!2289 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2290, size: 64)
!2290 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2283, file: !2284, line: 341, baseType: !12)
!2291 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2292, size: 64)
!2292 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2290)
!2293 = !DISubprogram(name: "eq", linkageName: "_ZNSt11char_traitsIcE2eqERKcS2_", scope: !2283, file: !2284, line: 362, type: !2294, scopeLine: 362, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2294 = !DISubroutineType(types: !2295)
!2295 = !{!279, !2291, !2291}
!2296 = !DISubprogram(name: "lt", linkageName: "_ZNSt11char_traitsIcE2ltERKcS2_", scope: !2283, file: !2284, line: 366, type: !2294, scopeLine: 366, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2297 = !DISubprogram(name: "compare", linkageName: "_ZNSt11char_traitsIcE7compareEPKcS2_m", scope: !2283, file: !2284, line: 374, type: !2298, scopeLine: 374, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2298 = !DISubroutineType(types: !2299)
!2299 = !{!172, !2300, !2300, !2301}
!2300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2292, size: 64)
!2301 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !2, file: !268, line: 298, baseType: !822)
!2302 = !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !2283, file: !2284, line: 393, type: !2303, scopeLine: 393, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2303 = !DISubroutineType(types: !2304)
!2304 = !{!2301, !2300}
!2305 = !DISubprogram(name: "find", linkageName: "_ZNSt11char_traitsIcE4findEPKcmRS1_", scope: !2283, file: !2284, line: 403, type: !2306, scopeLine: 403, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2306 = !DISubroutineType(types: !2307)
!2307 = !{!2300, !2300, !2301, !2291}
!2308 = !DISubprogram(name: "move", linkageName: "_ZNSt11char_traitsIcE4moveEPcPKcm", scope: !2283, file: !2284, line: 415, type: !2309, scopeLine: 415, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2309 = !DISubroutineType(types: !2310)
!2310 = !{!2311, !2311, !2300, !2301}
!2311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2290, size: 64)
!2312 = !DISubprogram(name: "copy", linkageName: "_ZNSt11char_traitsIcE4copyEPcPKcm", scope: !2283, file: !2284, line: 427, type: !2309, scopeLine: 427, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2313 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignEPcmc", scope: !2283, file: !2284, line: 439, type: !2314, scopeLine: 439, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2314 = !DISubroutineType(types: !2315)
!2315 = !{!2311, !2311, !2301, !2290}
!2316 = !DISubprogram(name: "to_char_type", linkageName: "_ZNSt11char_traitsIcE12to_char_typeERKi", scope: !2283, file: !2284, line: 451, type: !2317, scopeLine: 451, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2317 = !DISubroutineType(types: !2318)
!2318 = !{!2290, !2319}
!2319 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2320, size: 64)
!2320 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2321)
!2321 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !2283, file: !2284, line: 342, baseType: !172)
!2322 = !DISubprogram(name: "to_int_type", linkageName: "_ZNSt11char_traitsIcE11to_int_typeERKc", scope: !2283, file: !2284, line: 457, type: !2323, scopeLine: 457, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2323 = !DISubroutineType(types: !2324)
!2324 = !{!2321, !2291}
!2325 = !DISubprogram(name: "eq_int_type", linkageName: "_ZNSt11char_traitsIcE11eq_int_typeERKiS2_", scope: !2283, file: !2284, line: 461, type: !2326, scopeLine: 461, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2326 = !DISubroutineType(types: !2327)
!2327 = !{!279, !2319, !2319}
!2328 = !DISubprogram(name: "eof", linkageName: "_ZNSt11char_traitsIcE3eofEv", scope: !2283, file: !2284, line: 465, type: !2329, scopeLine: 465, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2329 = !DISubroutineType(types: !2330)
!2330 = !{!2321}
!2331 = !DISubprogram(name: "not_eof", linkageName: "_ZNSt11char_traitsIcE7not_eofERKi", scope: !2283, file: !2284, line: 469, type: !2332, scopeLine: 469, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2332 = !DISubroutineType(types: !2333)
!2333 = !{!2321, !2319}
!2334 = !{!2335}
!2335 = !DITemplateTypeParameter(name: "_CharT", type: !12)
!2336 = !DILocation(line: 0, scope: !2275, inlinedAt: !2337)
!2337 = distinct !DILocation(line: 70, column: 13, scope: !2212)
!2338 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2337)
!2339 = distinct !DILexicalBlock(scope: !2275, file: !2255, line: 617, column: 11)
!2340 = !DILocation(line: 0, scope: !2254, inlinedAt: !2341)
!2341 = distinct !DILocation(line: 70, column: 58, scope: !2212)
!2342 = !DILocalVariable(name: "__os", arg: 1, scope: !2343, file: !2255, line: 710, type: !2278)
!2343 = distinct !DISubprogram(name: "flush<char, std::char_traits<char> >", linkageName: "_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !2, file: !2255, line: 710, type: !2344, scopeLine: 711, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2347, retainedNodes: !2346)
!2344 = !DISubroutineType(types: !2345)
!2345 = !{!2278, !2278}
!2346 = !{!2342}
!2347 = !{!2335, !2282}
!2348 = !DILocation(line: 0, scope: !2343, inlinedAt: !2349)
!2349 = distinct !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2341)
!2350 = !DILocation(line: 711, column: 19, scope: !2343, inlinedAt: !2349)
!2351 = !DILocation(line: 0, scope: !2275, inlinedAt: !2352)
!2352 = distinct !DILocation(line: 71, column: 13, scope: !2212)
!2353 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2352)
!2354 = !DILocation(line: 71, column: 48, scope: !2212)
!2355 = !DILocation(line: 71, column: 45, scope: !2212)
!2356 = !DILocation(line: 0, scope: !2254, inlinedAt: !2357)
!2357 = distinct !DILocation(line: 71, column: 55, scope: !2212)
!2358 = !DILocalVariable(name: "__os", arg: 1, scope: !2359, file: !2255, line: 688, type: !2278)
!2359 = distinct !DISubprogram(name: "endl<char, std::char_traits<char> >", linkageName: "_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !2, file: !2255, line: 688, type: !2344, scopeLine: 689, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2347, retainedNodes: !2360)
!2360 = !{!2358}
!2361 = !DILocation(line: 0, scope: !2359, inlinedAt: !2362)
!2362 = distinct !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2357)
!2363 = !DILocation(line: 689, column: 29, scope: !2359, inlinedAt: !2362)
!2364 = !{!2365, !2365, i64 0}
!2365 = !{!"vtable pointer", !2209, i64 0}
!2366 = !DILocalVariable(name: "this", arg: 1, scope: !2367, type: !2379, flags: DIFlagArtificial | DIFlagObjectPointer)
!2367 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !2369, file: !2368, line: 449, type: !2371, scopeLine: 450, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2376, retainedNodes: !2377)
!2368 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/basic_ios.h", directory: "")
!2369 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ios<char, std::char_traits<char> >", scope: !2, file: !2370, line: 178, size: 2112, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!2370 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/basic_ios.tcc", directory: "")
!2371 = !DISubroutineType(types: !2372)
!2372 = !{!2373, !2374, !12}
!2373 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2369, file: !2368, line: 76, baseType: !12, flags: DIFlagPublic)
!2374 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2375, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2375 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2369)
!2376 = !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !2369, file: !2368, line: 449, type: !2371, scopeLine: 449, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2377 = !{!2366, !2378}
!2378 = !DILocalVariable(name: "__c", arg: 2, scope: !2367, file: !2368, line: 449, type: !12)
!2379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2375, size: 64)
!2380 = !DILocation(line: 0, scope: !2367, inlinedAt: !2381)
!2381 = distinct !DILocation(line: 689, column: 34, scope: !2359, inlinedAt: !2362)
!2382 = !DILocation(line: 450, column: 30, scope: !2367, inlinedAt: !2381)
!2383 = !{!2384, !2207, i64 240}
!2384 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !2385, i64 0, !2207, i64 216, !2208, i64 224, !2391, i64 225, !2207, i64 232, !2207, i64 240, !2207, i64 248, !2207, i64 256}
!2385 = !{!"_ZTSSt8ios_base", !2386, i64 8, !2386, i64 16, !2387, i64 24, !2388, i64 28, !2388, i64 32, !2207, i64 40, !2389, i64 48, !2208, i64 64, !2211, i64 192, !2207, i64 200, !2390, i64 208}
!2386 = !{!"long", !2208, i64 0}
!2387 = !{!"_ZTSSt13_Ios_Fmtflags", !2208, i64 0}
!2388 = !{!"_ZTSSt12_Ios_Iostate", !2208, i64 0}
!2389 = !{!"_ZTSNSt8ios_base6_WordsE", !2207, i64 0, !2386, i64 8}
!2390 = !{!"_ZTSSt6locale", !2207, i64 0}
!2391 = !{!"bool", !2208, i64 0}
!2392 = !DILocalVariable(name: "__f", arg: 1, scope: !2393, file: !2368, line: 47, type: !2400)
!2393 = distinct !DISubprogram(name: "__check_facet<std::ctype<char> >", linkageName: "_ZSt13__check_facetISt5ctypeIcEERKT_PS3_", scope: !2, file: !2368, line: 47, type: !2394, scopeLine: 48, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2402, retainedNodes: !2401)
!2394 = !DISubroutineType(types: !2395)
!2395 = !{!2396, !2400}
!2396 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2397, size: 64)
!2397 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2398)
!2398 = !DICompositeType(tag: DW_TAG_class_type, name: "ctype<char>", scope: !2, file: !2399, line: 689, size: 4608, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt5ctypeIcE")
!2399 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/locale_facets.h", directory: "")
!2400 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2397, size: 64)
!2401 = !{!2392}
!2402 = !{!2403}
!2403 = !DITemplateTypeParameter(name: "_Facet", type: !2398)
!2404 = !DILocation(line: 0, scope: !2393, inlinedAt: !2405)
!2405 = distinct !DILocation(line: 450, column: 16, scope: !2367, inlinedAt: !2381)
!2406 = !DILocation(line: 49, column: 12, scope: !2407, inlinedAt: !2405)
!2407 = distinct !DILexicalBlock(scope: !2393, file: !2368, line: 49, column: 11)
!2408 = !DILocation(line: 49, column: 11, scope: !2393, inlinedAt: !2405)
!2409 = !DILocation(line: 50, column: 2, scope: !2407, inlinedAt: !2405)
!2410 = !DILocalVariable(name: "this", arg: 1, scope: !2411, type: !2400, flags: DIFlagArtificial | DIFlagObjectPointer)
!2411 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !2398, file: !2399, line: 880, type: !2412, scopeLine: 881, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2416, retainedNodes: !2417)
!2412 = !DISubroutineType(types: !2413)
!2413 = !{!2414, !2415, !12}
!2414 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2398, file: !2399, line: 694, baseType: !12, flags: DIFlagPublic)
!2415 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2397, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2416 = !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !2398, file: !2399, line: 880, type: !2412, scopeLine: 880, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2417 = !{!2410, !2418}
!2418 = !DILocalVariable(name: "__c", arg: 2, scope: !2411, file: !2399, line: 880, type: !12)
!2419 = !DILocation(line: 0, scope: !2411, inlinedAt: !2420)
!2420 = distinct !DILocation(line: 450, column: 40, scope: !2367, inlinedAt: !2381)
!2421 = !DILocation(line: 882, column: 6, scope: !2422, inlinedAt: !2420)
!2422 = distinct !DILexicalBlock(scope: !2411, file: !2399, line: 882, column: 6)
!2423 = !{!2424, !2208, i64 56}
!2424 = !{!"_ZTSSt5ctypeIcE", !2425, i64 0, !2207, i64 16, !2391, i64 24, !2207, i64 32, !2207, i64 40, !2207, i64 48, !2208, i64 56, !2208, i64 57, !2208, i64 313, !2208, i64 569}
!2425 = !{!"_ZTSNSt6locale5facetE", !2211, i64 8}
!2426 = !DILocation(line: 882, column: 6, scope: !2411, inlinedAt: !2420)
!2427 = !DILocation(line: 883, column: 11, scope: !2422, inlinedAt: !2420)
!2428 = !{!2208, !2208, i64 0}
!2429 = !DILocation(line: 883, column: 4, scope: !2422, inlinedAt: !2420)
!2430 = !DILocation(line: 884, column: 8, scope: !2411, inlinedAt: !2420)
!2431 = !DILocation(line: 885, column: 15, scope: !2411, inlinedAt: !2420)
!2432 = !DILocation(line: 885, column: 2, scope: !2411, inlinedAt: !2420)
!2433 = !DILocation(line: 689, column: 25, scope: !2359, inlinedAt: !2362)
!2434 = !DILocation(line: 0, scope: !2343, inlinedAt: !2435)
!2435 = distinct !DILocation(line: 689, column: 14, scope: !2359, inlinedAt: !2362)
!2436 = !DILocation(line: 711, column: 19, scope: !2343, inlinedAt: !2435)
!2437 = !DILocation(line: 79, column: 3, scope: !2212)
!2438 = !DILocalVariable(name: "devPtr", arg: 1, scope: !2439, file: !82, line: 8415, type: !2442)
!2439 = distinct !DISubprogram(name: "hipMallocManaged<_Atomic(unsigned long)>", linkageName: "_ZL16hipMallocManagedIU7_AtomicmE10hipError_tPPT_mj", scope: !82, file: !82, line: 8415, type: !2440, scopeLine: 8416, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2448, retainedNodes: !2445)
!2440 = !DISubroutineType(types: !2441)
!2441 = !{!2243, !2442, !820, !83}
!2442 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2443, size: 64)
!2443 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2444, size: 64)
!2444 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !822)
!2445 = !{!2438, !2446, !2447}
!2446 = !DILocalVariable(name: "size", arg: 2, scope: !2439, file: !82, line: 8415, type: !820)
!2447 = !DILocalVariable(name: "flags", arg: 3, scope: !2439, file: !82, line: 8416, type: !83)
!2448 = !{!2449}
!2449 = !DITemplateTypeParameter(name: "T", type: !2444)
!2450 = !DILocation(line: 0, scope: !2439, inlinedAt: !2451)
!2451 = distinct !DILocation(line: 80, column: 17, scope: !2212)
!2452 = !DILocation(line: 8417, column: 12, scope: !2439, inlinedAt: !2451)
!2453 = !DILocation(line: 0, scope: !2240, inlinedAt: !2454)
!2454 = distinct !DILocation(line: 80, column: 3, scope: !2212)
!2455 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !2454)
!2456 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !2454)
!2457 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !2454)
!2458 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !2454)
!2459 = !DILocation(line: 0, scope: !2254, inlinedAt: !2460)
!2460 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !2454)
!2461 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2460)
!2462 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !2454)
!2463 = !DILocation(line: 82, column: 4, scope: !2212)
!2464 = !DILocation(line: 82, column: 8, scope: !2212)
!2465 = !DILocation(line: 85, column: 22, scope: !2212)
!2466 = !DILocation(line: 86, column: 3, scope: !2212)
!2467 = !DILocation(line: 87, column: 3, scope: !2212)
!2468 = !DILocalVariable(name: "devPtr", arg: 1, scope: !2469, file: !82, line: 8380, type: !2472)
!2469 = distinct !DISubprogram(name: "hipMalloc<unsigned long>", linkageName: "_ZL9hipMallocImE10hipError_tPPT_m", scope: !82, file: !82, line: 8380, type: !2470, scopeLine: 8380, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2476, retainedNodes: !2474)
!2470 = !DISubroutineType(types: !2471)
!2471 = !{!2243, !2472, !820}
!2472 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2473, size: 64)
!2473 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !822, size: 64)
!2474 = !{!2468, !2475}
!2475 = !DILocalVariable(name: "size", arg: 2, scope: !2469, file: !82, line: 8380, type: !820)
!2476 = !{!2477}
!2477 = !DITemplateTypeParameter(name: "T", type: !822)
!2478 = !DILocation(line: 0, scope: !2469, inlinedAt: !2479)
!2479 = distinct !DILocation(line: 88, column: 17, scope: !2212)
!2480 = !DILocation(line: 8381, column: 12, scope: !2469, inlinedAt: !2479)
!2481 = !DILocation(line: 0, scope: !2240, inlinedAt: !2482)
!2482 = distinct !DILocation(line: 88, column: 3, scope: !2212)
!2483 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !2482)
!2484 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !2482)
!2485 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !2482)
!2486 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !2482)
!2487 = !DILocation(line: 0, scope: !2254, inlinedAt: !2488)
!2488 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !2482)
!2489 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2488)
!2490 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !2482)
!2491 = !DILocation(line: 89, column: 27, scope: !2212)
!2492 = !DILocation(line: 89, column: 17, scope: !2212)
!2493 = !DILocation(line: 0, scope: !2240, inlinedAt: !2494)
!2494 = distinct !DILocation(line: 89, column: 3, scope: !2212)
!2495 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !2494)
!2496 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !2494)
!2497 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !2494)
!2498 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !2494)
!2499 = !DILocation(line: 0, scope: !2254, inlinedAt: !2500)
!2500 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !2494)
!2501 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2500)
!2502 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !2494)
!2503 = !DILocation(line: 92, column: 3, scope: !2212)
!2504 = !DILocalVariable(name: "devPtr", arg: 1, scope: !2505, file: !82, line: 8380, type: !2508)
!2505 = distinct !DISubprogram(name: "hipMalloc<long>", linkageName: "_ZL9hipMallocIlE10hipError_tPPT_m", scope: !82, file: !82, line: 8380, type: !2506, scopeLine: 8380, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2512, retainedNodes: !2510)
!2506 = !DISubroutineType(types: !2507)
!2507 = !{!2243, !2508, !820}
!2508 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2509, size: 64)
!2509 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!2510 = !{!2504, !2511}
!2511 = !DILocalVariable(name: "size", arg: 2, scope: !2505, file: !82, line: 8380, type: !820)
!2512 = !{!2513}
!2513 = !DITemplateTypeParameter(name: "T", type: !203)
!2514 = !DILocation(line: 0, scope: !2505, inlinedAt: !2515)
!2515 = distinct !DILocation(line: 93, column: 17, scope: !2212)
!2516 = !DILocation(line: 8381, column: 12, scope: !2505, inlinedAt: !2515)
!2517 = !DILocation(line: 0, scope: !2240, inlinedAt: !2518)
!2518 = distinct !DILocation(line: 93, column: 3, scope: !2212)
!2519 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !2518)
!2520 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !2518)
!2521 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !2518)
!2522 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !2518)
!2523 = !DILocation(line: 0, scope: !2254, inlinedAt: !2524)
!2524 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !2518)
!2525 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2524)
!2526 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !2518)
!2527 = !DILocation(line: 95, column: 2, scope: !2528)
!2528 = distinct !DILexicalBlock(scope: !2212, file: !9, line: 95, column: 2)
!2529 = !DILocation(line: 98, column: 27, scope: !2212)
!2530 = !DILocation(line: 99, column: 3, scope: !2212)
!2531 = !DILocation(line: 100, column: 41, scope: !2212)
!2532 = !DILocation(line: 100, column: 17, scope: !2212)
!2533 = !DILocation(line: 0, scope: !2240, inlinedAt: !2534)
!2534 = distinct !DILocation(line: 100, column: 3, scope: !2212)
!2535 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !2534)
!2536 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !2534)
!2537 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !2534)
!2538 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !2534)
!2539 = !DILocation(line: 0, scope: !2254, inlinedAt: !2540)
!2540 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !2534)
!2541 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2540)
!2542 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !2534)
!2543 = !DILocation(line: 0, scope: !2275, inlinedAt: !2544)
!2544 = distinct !DILocation(line: 101, column: 13, scope: !2212)
!2545 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2544)
!2546 = !DILocation(line: 0, scope: !2232)
!2547 = !DILocation(line: 102, column: 3, scope: !2232)
!2548 = !DILocation(line: 0, scope: !2275, inlinedAt: !2549)
!2549 = distinct !DILocation(line: 108, column: 15, scope: !2550)
!2550 = distinct !DILexicalBlock(scope: !2212, file: !9, line: 107, column: 7)
!2551 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2549)
!2552 = !DILocalVariable(name: "__f", arg: 2, scope: !2553, file: !2554, line: 178, type: !2557)
!2553 = distinct !DISubprogram(name: "operator<<<char, std::char_traits<char> >", linkageName: "_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E", scope: !2, file: !2554, line: 178, type: !2555, scopeLine: 179, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2347, retainedNodes: !2560)
!2554 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/iomanip", directory: "")
!2555 = !DISubroutineType(types: !2556)
!2556 = !{!2278, !2278, !2557}
!2557 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Setfill<char>", scope: !2, file: !2554, line: 154, size: 8, flags: DIFlagTypePassByValue, elements: !2558, templateParams: !2334, identifier: "_ZTSSt8_SetfillIcE")
!2558 = !{!2559}
!2559 = !DIDerivedType(tag: DW_TAG_member, name: "_M_c", scope: !2557, file: !2554, line: 154, baseType: !12, size: 8)
!2560 = !{!2561, !2552}
!2561 = !DILocalVariable(name: "__os", arg: 1, scope: !2553, file: !2554, line: 178, type: !2278)
!2562 = !DILocation(line: 0, scope: !2553, inlinedAt: !2563)
!2563 = distinct !DILocation(line: 108, column: 27, scope: !2550)
!2564 = !DILocation(line: 180, column: 7, scope: !2553, inlinedAt: !2563)
!2565 = !DILocalVariable(name: "this", arg: 1, scope: !2566, type: !2574, flags: DIFlagArtificial | DIFlagObjectPointer)
!2566 = distinct !DISubprogram(name: "fill", linkageName: "_ZNSt9basic_iosIcSt11char_traitsIcEE4fillEc", scope: !2369, file: !2368, line: 390, type: !2567, scopeLine: 391, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2570, retainedNodes: !2571)
!2567 = !DISubroutineType(types: !2568)
!2568 = !{!2373, !2569, !2373}
!2569 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2369, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2570 = !DISubprogram(name: "fill", linkageName: "_ZNSt9basic_iosIcSt11char_traitsIcEE4fillEc", scope: !2369, file: !2368, line: 390, type: !2567, scopeLine: 390, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2571 = !{!2565, !2572, !2573}
!2572 = !DILocalVariable(name: "__ch", arg: 2, scope: !2566, file: !2368, line: 390, type: !2373)
!2573 = !DILocalVariable(name: "__old", scope: !2566, file: !2368, line: 392, type: !2373)
!2574 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2369, size: 64)
!2575 = !DILocation(line: 0, scope: !2566, inlinedAt: !2576)
!2576 = distinct !DILocation(line: 180, column: 12, scope: !2553, inlinedAt: !2563)
!2577 = !DILocalVariable(name: "this", arg: 1, scope: !2578, type: !2379, flags: DIFlagArtificial | DIFlagObjectPointer)
!2578 = distinct !DISubprogram(name: "fill", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv", scope: !2369, file: !2368, line: 370, type: !2579, scopeLine: 371, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2581, retainedNodes: !2582)
!2579 = !DISubroutineType(types: !2580)
!2580 = !{!2373, !2374}
!2581 = !DISubprogram(name: "fill", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE4fillEv", scope: !2369, file: !2368, line: 370, type: !2579, scopeLine: 370, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2582 = !{!2577}
!2583 = !DILocation(line: 0, scope: !2578, inlinedAt: !2584)
!2584 = distinct !DILocation(line: 392, column: 26, scope: !2566, inlinedAt: !2576)
!2585 = !DILocation(line: 372, column: 7, scope: !2586, inlinedAt: !2584)
!2586 = distinct !DILexicalBlock(scope: !2578, file: !2368, line: 372, column: 6)
!2587 = !{!2384, !2391, i64 225}
!2588 = !{i8 0, i8 2}
!2589 = !DILocation(line: 372, column: 6, scope: !2578, inlinedAt: !2584)
!2590 = !DILocation(line: 0, scope: !2367, inlinedAt: !2591)
!2591 = distinct !DILocation(line: 374, column: 22, scope: !2592, inlinedAt: !2584)
!2592 = distinct !DILexicalBlock(scope: !2586, file: !2368, line: 373, column: 4)
!2593 = !DILocation(line: 450, column: 30, scope: !2367, inlinedAt: !2591)
!2594 = !DILocation(line: 0, scope: !2393, inlinedAt: !2595)
!2595 = distinct !DILocation(line: 450, column: 16, scope: !2367, inlinedAt: !2591)
!2596 = !DILocation(line: 49, column: 12, scope: !2407, inlinedAt: !2595)
!2597 = !DILocation(line: 49, column: 11, scope: !2393, inlinedAt: !2595)
!2598 = !DILocation(line: 50, column: 2, scope: !2407, inlinedAt: !2595)
!2599 = !DILocation(line: 0, scope: !2411, inlinedAt: !2600)
!2600 = distinct !DILocation(line: 450, column: 40, scope: !2367, inlinedAt: !2591)
!2601 = !DILocation(line: 882, column: 6, scope: !2422, inlinedAt: !2600)
!2602 = !DILocation(line: 882, column: 6, scope: !2411, inlinedAt: !2600)
!2603 = !DILocation(line: 884, column: 8, scope: !2411, inlinedAt: !2600)
!2604 = !DILocation(line: 885, column: 15, scope: !2411, inlinedAt: !2600)
!2605 = !DILocation(line: 240, column: 7, scope: !2606, inlinedAt: !2615)
!2606 = distinct !DISubprogram(name: "operator<<<char, std::char_traits<char> >", linkageName: "_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw", scope: !2, file: !2554, line: 238, type: !2607, scopeLine: 239, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !2347, retainedNodes: !2612)
!2607 = !DISubroutineType(types: !2608)
!2608 = !{!2278, !2278, !2609}
!2609 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Setw", scope: !2, file: !2554, line: 215, size: 32, flags: DIFlagTypePassByValue, elements: !2610, identifier: "_ZTSSt5_Setw")
!2610 = !{!2611}
!2611 = !DIDerivedType(tag: DW_TAG_member, name: "_M_n", scope: !2609, file: !2554, line: 215, baseType: !172, size: 32)
!2612 = !{!2613, !2614}
!2613 = !DILocalVariable(name: "__os", arg: 1, scope: !2606, file: !2554, line: 238, type: !2278)
!2614 = !DILocalVariable(name: "__f", arg: 2, scope: !2606, file: !2554, line: 238, type: !2609)
!2615 = distinct !DILocation(line: 108, column: 48, scope: !2550)
!2616 = !DILocation(line: 885, column: 2, scope: !2411, inlinedAt: !2600)
!2617 = !DILocation(line: 375, column: 19, scope: !2592, inlinedAt: !2584)
!2618 = !DILocation(line: 376, column: 4, scope: !2592, inlinedAt: !2584)
!2619 = !DILocation(line: 393, column: 2, scope: !2566, inlinedAt: !2576)
!2620 = !DILocation(line: 393, column: 10, scope: !2566, inlinedAt: !2576)
!2621 = !{!2384, !2208, i64 224}
!2622 = !DILocation(line: 0, scope: !2606, inlinedAt: !2615)
!2623 = !DILocalVariable(name: "this", arg: 1, scope: !2624, type: !2632, flags: DIFlagArtificial | DIFlagObjectPointer)
!2624 = distinct !DISubprogram(name: "width", linkageName: "_ZNSt8ios_base5widthEl", scope: !6, file: !5, line: 764, type: !2625, scopeLine: 765, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2628, retainedNodes: !2629)
!2625 = !DISubroutineType(types: !2626)
!2626 = !{!265, !2627, !265}
!2627 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2628 = !DISubprogram(name: "width", linkageName: "_ZNSt8ios_base5widthEl", scope: !6, file: !5, line: 764, type: !2625, scopeLine: 764, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2629 = !{!2623, !2630, !2631}
!2630 = !DILocalVariable(name: "__wide", arg: 2, scope: !2624, file: !5, line: 764, type: !265)
!2631 = !DILocalVariable(name: "__old", scope: !2624, file: !5, line: 766, type: !265)
!2632 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!2633 = !DILocation(line: 0, scope: !2624, inlinedAt: !2634)
!2634 = distinct !DILocation(line: 240, column: 12, scope: !2606, inlinedAt: !2615)
!2635 = !DILocation(line: 766, column: 26, scope: !2624, inlinedAt: !2634)
!2636 = !DILocation(line: 767, column: 16, scope: !2624, inlinedAt: !2634)
!2637 = !{!2385, !2386, i64 16}
!2638 = !DILocation(line: 0, scope: !2275, inlinedAt: !2639)
!2639 = distinct !DILocation(line: 108, column: 64, scope: !2550)
!2640 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2639)
!2641 = !DILocation(line: 0, scope: !2275, inlinedAt: !2642)
!2642 = distinct !DILocation(line: 109, column: 13, scope: !2212)
!2643 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2642)
!2644 = !DILocation(line: 0, scope: !2254, inlinedAt: !2645)
!2645 = distinct !DILocation(line: 109, column: 26, scope: !2212)
!2646 = !DILocation(line: 0, scope: !2343, inlinedAt: !2647)
!2647 = distinct !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2645)
!2648 = !DILocation(line: 711, column: 19, scope: !2343, inlinedAt: !2647)
!2649 = !DILocation(line: 113, column: 18, scope: !2212)
!2650 = !DILocation(line: 113, column: 3, scope: !2212)
!2651 = !DILocation(line: 103, column: 11, scope: !2652)
!2652 = distinct !DILexicalBlock(scope: !2653, file: !9, line: 103, column: 9)
!2653 = distinct !DILexicalBlock(scope: !2654, file: !9, line: 102, column: 42)
!2654 = distinct !DILexicalBlock(scope: !2232, file: !9, line: 102, column: 3)
!2655 = !DILocation(line: 103, column: 32, scope: !2652)
!2656 = !DILocation(line: 103, column: 9, scope: !2653)
!2657 = !DILocation(line: 0, scope: !2275, inlinedAt: !2658)
!2658 = distinct !DILocation(line: 104, column: 17, scope: !2652)
!2659 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2658)
!2660 = !DILocation(line: 104, column: 7, scope: !2652)
!2661 = !DILocation(line: 0, scope: !2553, inlinedAt: !2662)
!2662 = distinct !DILocation(line: 105, column: 15, scope: !2653)
!2663 = !DILocation(line: 180, column: 7, scope: !2553, inlinedAt: !2662)
!2664 = !DILocation(line: 0, scope: !2566, inlinedAt: !2665)
!2665 = distinct !DILocation(line: 180, column: 12, scope: !2553, inlinedAt: !2662)
!2666 = !DILocation(line: 0, scope: !2578, inlinedAt: !2667)
!2667 = distinct !DILocation(line: 392, column: 26, scope: !2566, inlinedAt: !2665)
!2668 = !DILocation(line: 372, column: 7, scope: !2586, inlinedAt: !2667)
!2669 = !DILocation(line: 372, column: 6, scope: !2578, inlinedAt: !2667)
!2670 = !DILocation(line: 0, scope: !2367, inlinedAt: !2671)
!2671 = distinct !DILocation(line: 374, column: 22, scope: !2592, inlinedAt: !2667)
!2672 = !DILocation(line: 450, column: 30, scope: !2367, inlinedAt: !2671)
!2673 = !DILocation(line: 0, scope: !2393, inlinedAt: !2674)
!2674 = distinct !DILocation(line: 450, column: 16, scope: !2367, inlinedAt: !2671)
!2675 = !DILocation(line: 49, column: 12, scope: !2407, inlinedAt: !2674)
!2676 = !DILocation(line: 49, column: 11, scope: !2393, inlinedAt: !2674)
!2677 = !DILocation(line: 50, column: 2, scope: !2407, inlinedAt: !2674)
!2678 = !DILocation(line: 0, scope: !2411, inlinedAt: !2679)
!2679 = distinct !DILocation(line: 450, column: 40, scope: !2367, inlinedAt: !2671)
!2680 = !DILocation(line: 882, column: 6, scope: !2422, inlinedAt: !2679)
!2681 = !DILocation(line: 882, column: 6, scope: !2411, inlinedAt: !2679)
!2682 = !DILocation(line: 884, column: 8, scope: !2411, inlinedAt: !2679)
!2683 = !DILocation(line: 885, column: 15, scope: !2411, inlinedAt: !2679)
!2684 = !DILocation(line: 240, column: 7, scope: !2606, inlinedAt: !2685)
!2685 = distinct !DILocation(line: 105, column: 36, scope: !2653)
!2686 = !DILocation(line: 885, column: 2, scope: !2411, inlinedAt: !2679)
!2687 = !DILocation(line: 375, column: 19, scope: !2592, inlinedAt: !2667)
!2688 = !DILocation(line: 376, column: 4, scope: !2592, inlinedAt: !2667)
!2689 = !DILocation(line: 393, column: 2, scope: !2566, inlinedAt: !2665)
!2690 = !DILocation(line: 393, column: 10, scope: !2566, inlinedAt: !2665)
!2691 = !DILocation(line: 0, scope: !2606, inlinedAt: !2685)
!2692 = !DILocation(line: 0, scope: !2624, inlinedAt: !2693)
!2693 = distinct !DILocation(line: 240, column: 12, scope: !2606, inlinedAt: !2685)
!2694 = !DILocation(line: 766, column: 26, scope: !2624, inlinedAt: !2693)
!2695 = !DILocation(line: 767, column: 16, scope: !2624, inlinedAt: !2693)
!2696 = !DILocation(line: 105, column: 55, scope: !2653)
!2697 = !{!2386, !2386, i64 0}
!2698 = !DILocalVariable(name: "this", arg: 1, scope: !2699, type: !2269, flags: DIFlagArtificial | DIFlagObjectPointer)
!2699 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEl", scope: !2256, file: !2255, line: 166, type: !2700, scopeLine: 167, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2702, retainedNodes: !2703)
!2700 = !DISubroutineType(types: !2701)
!2701 = !{!2260, !2262, !203}
!2702 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEl", scope: !2256, file: !2255, line: 166, type: !2700, scopeLine: 166, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2703 = !{!2698, !2704}
!2704 = !DILocalVariable(name: "__n", arg: 2, scope: !2699, file: !2255, line: 166, type: !203)
!2705 = !DILocation(line: 0, scope: !2699, inlinedAt: !2706)
!2706 = distinct !DILocation(line: 105, column: 52, scope: !2653)
!2707 = !DILocation(line: 167, column: 16, scope: !2699, inlinedAt: !2706)
!2708 = !DILocation(line: 0, scope: !2275, inlinedAt: !2709)
!2709 = distinct !DILocation(line: 105, column: 71, scope: !2653)
!2710 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2709)
!2711 = !DILocation(line: 102, column: 37, scope: !2654)
!2712 = !DILocation(line: 102, column: 21, scope: !2654)
!2713 = distinct !{!2713, !2547, !2714, !2715}
!2714 = !DILocation(line: 106, column: 3, scope: !2232)
!2715 = !{!"llvm.loop.mustprogress"}
!2716 = !DILocation(line: 113, column: 49, scope: !2212)
!2717 = !DILocation(line: 113, column: 54, scope: !2212)
!2718 = !DILocation(line: 113, column: 62, scope: !2212)
!2719 = !DILocation(line: 117, column: 3, scope: !2212)
!2720 = !DILocation(line: 80, column: 2, scope: !2721, inlinedAt: !2742)
!2721 = distinct !DISubprogram(name: "sleep_for<long, std::ratio<1L, 1000L> >", linkageName: "_ZNSt11this_thread9sleep_forIlSt5ratioILl1ELl1000EEEEvRKNSt6chrono8durationIT_T0_EE", scope: !2723, file: !2722, line: 68, type: !2724, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, templateParams: !253, retainedNodes: !2726)
!2722 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/this_thread_sleep.h", directory: "")
!2723 = !DINamespace(name: "this_thread", scope: !2)
!2724 = !DISubroutineType(types: !2725)
!2725 = !{null, !217}
!2726 = !{!2727, !2728, !2735, !2741}
!2727 = !DILocalVariable(name: "__rtime", arg: 1, scope: !2721, file: !2722, line: 68, type: !217)
!2728 = !DILocalVariable(name: "__s", scope: !2721, file: !2722, line: 72, type: !2729)
!2729 = !DIDerivedType(tag: DW_TAG_typedef, name: "__enable_if_is_duration<std::chrono::duration<long> >", scope: !198, file: !197, line: 240, baseType: !2730)
!2730 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2731, file: !416, line: 2228, baseType: !295)
!2731 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, std::chrono::duration<long, std::ratio<1L, 1L> > >", scope: !2, file: !416, line: 2227, size: 8, flags: DIFlagTypePassByValue, elements: !290, templateParams: !2732, identifier: "_ZTSSt9enable_ifILb1ENSt6chrono8durationIlSt5ratioILl1ELl1EEEEE")
!2732 = !{!2733, !2734}
!2733 = !DITemplateValueParameter(type: !279, value: i1 true)
!2734 = !DITemplateTypeParameter(name: "_Tp", type: !295)
!2735 = !DILocalVariable(name: "__ns", scope: !2721, file: !2722, line: 73, type: !2736)
!2736 = !DIDerivedType(tag: DW_TAG_typedef, name: "__enable_if_is_duration<std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !198, file: !197, line: 240, baseType: !2737)
!2737 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2738, file: !416, line: 2228, baseType: !351)
!2738 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !2, file: !416, line: 2227, size: 8, flags: DIFlagTypePassByValue, elements: !290, templateParams: !2739, identifier: "_ZTSSt9enable_ifILb1ENSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEEE")
!2739 = !{!2733, !2740}
!2740 = !DITemplateTypeParameter(name: "_Tp", type: !351)
!2741 = !DILocalVariable(name: "__ts", scope: !2721, file: !2722, line: 75, type: !2020)
!2742 = distinct !DILocation(line: 118, column: 5, scope: !2743)
!2743 = distinct !DILexicalBlock(scope: !2212, file: !9, line: 117, column: 6)
!2744 = !DILocation(line: 0, scope: !2721, inlinedAt: !2742)
!2745 = !DILocation(line: 75, column: 2, scope: !2721, inlinedAt: !2742)
!2746 = !DILocation(line: 75, column: 20, scope: !2721, inlinedAt: !2742)
!2747 = !DILocation(line: 76, column: 4, scope: !2721, inlinedAt: !2742)
!2748 = !{!2749, !2386, i64 0}
!2749 = !{!"_ZTS8timespec", !2386, i64 0, !2386, i64 8}
!2750 = !{!2749, !2386, i64 8}
!2751 = !DILocation(line: 80, column: 9, scope: !2721, inlinedAt: !2742)
!2752 = !DILocation(line: 80, column: 35, scope: !2721, inlinedAt: !2742)
!2753 = !DILocation(line: 80, column: 41, scope: !2721, inlinedAt: !2742)
!2754 = !DILocation(line: 80, column: 44, scope: !2721, inlinedAt: !2742)
!2755 = !DILocation(line: 80, column: 50, scope: !2721, inlinedAt: !2742)
!2756 = distinct !{!2756, !2720, !2757, !2715}
!2757 = !DILocation(line: 81, column: 6, scope: !2721, inlinedAt: !2742)
!2758 = !DILocation(line: 85, column: 7, scope: !2721, inlinedAt: !2742)
!2759 = !DILocation(line: 119, column: 13, scope: !2212)
!2760 = !DILocation(line: 119, column: 12, scope: !2212)
!2761 = !DILocation(line: 119, column: 17, scope: !2212)
!2762 = !DILocation(line: 119, column: 22, scope: !2212)
!2763 = !DILocation(line: 119, column: 26, scope: !2212)
!2764 = !DILocation(line: 119, column: 39, scope: !2212)
!2765 = !DILocation(line: 119, column: 3, scope: !2743)
!2766 = distinct !{!2766, !2719, !2767, !2715}
!2767 = !DILocation(line: 119, column: 43, scope: !2212)
!2768 = !DILocation(line: 121, column: 8, scope: !2769)
!2769 = distinct !DILexicalBlock(scope: !2212, file: !9, line: 121, column: 7)
!2770 = !DILocation(line: 121, column: 7, scope: !2769)
!2771 = !DILocation(line: 121, column: 12, scope: !2769)
!2772 = !DILocation(line: 121, column: 7, scope: !2212)
!2773 = !DILocation(line: 0, scope: !2275, inlinedAt: !2774)
!2774 = distinct !DILocation(line: 122, column: 15, scope: !2769)
!2775 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2774)
!2776 = !DILocation(line: 0, scope: !2254, inlinedAt: !2777)
!2777 = distinct !DILocation(line: 122, column: 81, scope: !2769)
!2778 = !DILocation(line: 0, scope: !2359, inlinedAt: !2779)
!2779 = distinct !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2777)
!2780 = !DILocation(line: 689, column: 29, scope: !2359, inlinedAt: !2779)
!2781 = !DILocation(line: 0, scope: !2367, inlinedAt: !2782)
!2782 = distinct !DILocation(line: 689, column: 34, scope: !2359, inlinedAt: !2779)
!2783 = !DILocation(line: 450, column: 30, scope: !2367, inlinedAt: !2782)
!2784 = !DILocation(line: 0, scope: !2393, inlinedAt: !2785)
!2785 = distinct !DILocation(line: 450, column: 16, scope: !2367, inlinedAt: !2782)
!2786 = !DILocation(line: 49, column: 12, scope: !2407, inlinedAt: !2785)
!2787 = !DILocation(line: 49, column: 11, scope: !2393, inlinedAt: !2785)
!2788 = !DILocation(line: 50, column: 2, scope: !2407, inlinedAt: !2785)
!2789 = !DILocation(line: 0, scope: !2411, inlinedAt: !2790)
!2790 = distinct !DILocation(line: 450, column: 40, scope: !2367, inlinedAt: !2782)
!2791 = !DILocation(line: 882, column: 6, scope: !2422, inlinedAt: !2790)
!2792 = !DILocation(line: 882, column: 6, scope: !2411, inlinedAt: !2790)
!2793 = !DILocation(line: 883, column: 11, scope: !2422, inlinedAt: !2790)
!2794 = !DILocation(line: 883, column: 4, scope: !2422, inlinedAt: !2790)
!2795 = !DILocation(line: 884, column: 8, scope: !2411, inlinedAt: !2790)
!2796 = !DILocation(line: 885, column: 15, scope: !2411, inlinedAt: !2790)
!2797 = !DILocation(line: 885, column: 2, scope: !2411, inlinedAt: !2790)
!2798 = !DILocation(line: 689, column: 25, scope: !2359, inlinedAt: !2779)
!2799 = !DILocation(line: 0, scope: !2343, inlinedAt: !2800)
!2800 = distinct !DILocation(line: 689, column: 14, scope: !2359, inlinedAt: !2779)
!2801 = !DILocation(line: 711, column: 19, scope: !2343, inlinedAt: !2800)
!2802 = !DILocation(line: 122, column: 5, scope: !2769)
!2803 = !DILocation(line: 130, column: 35, scope: !2212)
!2804 = !DILocation(line: 130, column: 17, scope: !2212)
!2805 = !DILocation(line: 0, scope: !2240, inlinedAt: !2806)
!2806 = distinct !DILocation(line: 130, column: 3, scope: !2212)
!2807 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !2806)
!2808 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !2806)
!2809 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !2806)
!2810 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !2806)
!2811 = !DILocation(line: 0, scope: !2254, inlinedAt: !2812)
!2812 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !2806)
!2813 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2812)
!2814 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !2806)
!2815 = !DILocation(line: 0, scope: !2275, inlinedAt: !2816)
!2816 = distinct !DILocation(line: 134, column: 13, scope: !2212)
!2817 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2816)
!2818 = !DILocation(line: 134, column: 47, scope: !2212)
!2819 = !DILocation(line: 134, column: 46, scope: !2212)
!2820 = !DILocalVariable(name: "this", arg: 1, scope: !2821, type: !2269, flags: DIFlagArtificial | DIFlagObjectPointer)
!2821 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !2256, file: !2255, line: 170, type: !2822, scopeLine: 171, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2824, retainedNodes: !2825)
!2822 = !DISubroutineType(types: !2823)
!2823 = !{!2260, !2262, !822}
!2824 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !2256, file: !2255, line: 170, type: !2822, scopeLine: 170, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2825 = !{!2820, !2826}
!2826 = !DILocalVariable(name: "__n", arg: 2, scope: !2821, file: !2255, line: 170, type: !822)
!2827 = !DILocation(line: 0, scope: !2821, inlinedAt: !2828)
!2828 = distinct !DILocation(line: 134, column: 43, scope: !2212)
!2829 = !DILocation(line: 171, column: 16, scope: !2821, inlinedAt: !2828)
!2830 = !DILocation(line: 0, scope: !2275, inlinedAt: !2831)
!2831 = distinct !DILocation(line: 135, column: 13, scope: !2212)
!2832 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2831)
!2833 = !DILocation(line: 0, scope: !2234)
!2834 = !DILocation(line: 137, column: 3, scope: !2234)
!2835 = !DILocation(line: 0, scope: !2275, inlinedAt: !2836)
!2836 = distinct !DILocation(line: 143, column: 15, scope: !2837)
!2837 = distinct !DILexicalBlock(scope: !2212, file: !9, line: 142, column: 7)
!2838 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2836)
!2839 = !DILocation(line: 0, scope: !2553, inlinedAt: !2840)
!2840 = distinct !DILocation(line: 143, column: 27, scope: !2837)
!2841 = !DILocation(line: 180, column: 7, scope: !2553, inlinedAt: !2840)
!2842 = !DILocation(line: 0, scope: !2566, inlinedAt: !2843)
!2843 = distinct !DILocation(line: 180, column: 12, scope: !2553, inlinedAt: !2840)
!2844 = !DILocation(line: 0, scope: !2578, inlinedAt: !2845)
!2845 = distinct !DILocation(line: 392, column: 26, scope: !2566, inlinedAt: !2843)
!2846 = !DILocation(line: 372, column: 7, scope: !2586, inlinedAt: !2845)
!2847 = !DILocation(line: 372, column: 6, scope: !2578, inlinedAt: !2845)
!2848 = !DILocation(line: 0, scope: !2367, inlinedAt: !2849)
!2849 = distinct !DILocation(line: 374, column: 22, scope: !2592, inlinedAt: !2845)
!2850 = !DILocation(line: 450, column: 30, scope: !2367, inlinedAt: !2849)
!2851 = !DILocation(line: 0, scope: !2393, inlinedAt: !2852)
!2852 = distinct !DILocation(line: 450, column: 16, scope: !2367, inlinedAt: !2849)
!2853 = !DILocation(line: 49, column: 12, scope: !2407, inlinedAt: !2852)
!2854 = !DILocation(line: 49, column: 11, scope: !2393, inlinedAt: !2852)
!2855 = !DILocation(line: 50, column: 2, scope: !2407, inlinedAt: !2852)
!2856 = !DILocation(line: 0, scope: !2411, inlinedAt: !2857)
!2857 = distinct !DILocation(line: 450, column: 40, scope: !2367, inlinedAt: !2849)
!2858 = !DILocation(line: 882, column: 6, scope: !2422, inlinedAt: !2857)
!2859 = !DILocation(line: 882, column: 6, scope: !2411, inlinedAt: !2857)
!2860 = !DILocation(line: 884, column: 8, scope: !2411, inlinedAt: !2857)
!2861 = !DILocation(line: 885, column: 15, scope: !2411, inlinedAt: !2857)
!2862 = !DILocation(line: 240, column: 7, scope: !2606, inlinedAt: !2863)
!2863 = distinct !DILocation(line: 143, column: 48, scope: !2837)
!2864 = !DILocation(line: 885, column: 2, scope: !2411, inlinedAt: !2857)
!2865 = !DILocation(line: 375, column: 19, scope: !2592, inlinedAt: !2845)
!2866 = !DILocation(line: 376, column: 4, scope: !2592, inlinedAt: !2845)
!2867 = !DILocation(line: 393, column: 2, scope: !2566, inlinedAt: !2843)
!2868 = !DILocation(line: 393, column: 10, scope: !2566, inlinedAt: !2843)
!2869 = !DILocation(line: 0, scope: !2606, inlinedAt: !2863)
!2870 = !DILocation(line: 0, scope: !2624, inlinedAt: !2871)
!2871 = distinct !DILocation(line: 240, column: 12, scope: !2606, inlinedAt: !2863)
!2872 = !DILocation(line: 766, column: 26, scope: !2624, inlinedAt: !2871)
!2873 = !DILocation(line: 767, column: 16, scope: !2624, inlinedAt: !2871)
!2874 = !DILocation(line: 0, scope: !2275, inlinedAt: !2875)
!2875 = distinct !DILocation(line: 143, column: 64, scope: !2837)
!2876 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2875)
!2877 = !DILocation(line: 0, scope: !2275, inlinedAt: !2878)
!2878 = distinct !DILocation(line: 144, column: 13, scope: !2212)
!2879 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2878)
!2880 = !DILocation(line: 0, scope: !2254, inlinedAt: !2881)
!2881 = distinct !DILocation(line: 144, column: 26, scope: !2212)
!2882 = !DILocation(line: 0, scope: !2359, inlinedAt: !2883)
!2883 = distinct !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2881)
!2884 = !DILocation(line: 689, column: 29, scope: !2359, inlinedAt: !2883)
!2885 = !DILocation(line: 0, scope: !2367, inlinedAt: !2886)
!2886 = distinct !DILocation(line: 689, column: 34, scope: !2359, inlinedAt: !2883)
!2887 = !DILocation(line: 450, column: 30, scope: !2367, inlinedAt: !2886)
!2888 = !DILocation(line: 0, scope: !2393, inlinedAt: !2889)
!2889 = distinct !DILocation(line: 450, column: 16, scope: !2367, inlinedAt: !2886)
!2890 = !DILocation(line: 49, column: 12, scope: !2407, inlinedAt: !2889)
!2891 = !DILocation(line: 49, column: 11, scope: !2393, inlinedAt: !2889)
!2892 = !DILocation(line: 50, column: 2, scope: !2407, inlinedAt: !2889)
!2893 = !DILocation(line: 0, scope: !2411, inlinedAt: !2894)
!2894 = distinct !DILocation(line: 450, column: 40, scope: !2367, inlinedAt: !2886)
!2895 = !DILocation(line: 882, column: 6, scope: !2422, inlinedAt: !2894)
!2896 = !DILocation(line: 882, column: 6, scope: !2411, inlinedAt: !2894)
!2897 = !DILocation(line: 883, column: 11, scope: !2422, inlinedAt: !2894)
!2898 = !DILocation(line: 883, column: 4, scope: !2422, inlinedAt: !2894)
!2899 = !DILocation(line: 884, column: 8, scope: !2411, inlinedAt: !2894)
!2900 = !DILocation(line: 885, column: 15, scope: !2411, inlinedAt: !2894)
!2901 = !DILocation(line: 885, column: 2, scope: !2411, inlinedAt: !2894)
!2902 = !DILocation(line: 689, column: 25, scope: !2359, inlinedAt: !2883)
!2903 = !DILocation(line: 0, scope: !2343, inlinedAt: !2904)
!2904 = distinct !DILocation(line: 689, column: 14, scope: !2359, inlinedAt: !2883)
!2905 = !DILocation(line: 711, column: 19, scope: !2343, inlinedAt: !2904)
!2906 = !DILocation(line: 148, column: 25, scope: !2212)
!2907 = !DILocation(line: 148, column: 17, scope: !2212)
!2908 = !DILocation(line: 0, scope: !2240, inlinedAt: !2909)
!2909 = distinct !DILocation(line: 148, column: 3, scope: !2212)
!2910 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !2909)
!2911 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !2909)
!2912 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !2909)
!2913 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !2909)
!2914 = !DILocation(line: 0, scope: !2254, inlinedAt: !2915)
!2915 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !2909)
!2916 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2915)
!2917 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !2909)
!2918 = !DILocation(line: 149, column: 25, scope: !2212)
!2919 = !DILocation(line: 149, column: 17, scope: !2212)
!2920 = !DILocation(line: 0, scope: !2240, inlinedAt: !2921)
!2921 = distinct !DILocation(line: 149, column: 3, scope: !2212)
!2922 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !2921)
!2923 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !2921)
!2924 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !2921)
!2925 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !2921)
!2926 = !DILocation(line: 0, scope: !2254, inlinedAt: !2927)
!2927 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !2921)
!2928 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2927)
!2929 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !2921)
!2930 = !DILocation(line: 150, column: 25, scope: !2212)
!2931 = !DILocation(line: 150, column: 17, scope: !2212)
!2932 = !DILocation(line: 0, scope: !2240, inlinedAt: !2933)
!2933 = distinct !DILocation(line: 150, column: 3, scope: !2212)
!2934 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !2933)
!2935 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !2933)
!2936 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !2933)
!2937 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !2933)
!2938 = !DILocation(line: 0, scope: !2254, inlinedAt: !2939)
!2939 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !2933)
!2940 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2939)
!2941 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !2933)
!2942 = !DILocation(line: 151, column: 3, scope: !2212)
!2943 = !DILocation(line: 151, column: 20, scope: !2212)
!2944 = !DILocation(line: 0, scope: !2275, inlinedAt: !2945)
!2945 = distinct !DILocation(line: 152, column: 13, scope: !2212)
!2946 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2945)
!2947 = !DILocation(line: 0, scope: !2254, inlinedAt: !2948)
!2948 = distinct !DILocation(line: 152, column: 56, scope: !2212)
!2949 = !DILocation(line: 0, scope: !2343, inlinedAt: !2950)
!2950 = distinct !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !2948)
!2951 = !DILocation(line: 711, column: 19, scope: !2343, inlinedAt: !2950)
!2952 = !DILocation(line: 153, column: 1, scope: !2212)
!2953 = !DILocation(line: 138, column: 11, scope: !2954)
!2954 = distinct !DILexicalBlock(scope: !2955, file: !9, line: 138, column: 9)
!2955 = distinct !DILexicalBlock(scope: !2956, file: !9, line: 137, column: 42)
!2956 = distinct !DILexicalBlock(scope: !2234, file: !9, line: 137, column: 3)
!2957 = !DILocation(line: 138, column: 32, scope: !2954)
!2958 = !DILocation(line: 138, column: 9, scope: !2955)
!2959 = !DILocation(line: 0, scope: !2275, inlinedAt: !2960)
!2960 = distinct !DILocation(line: 139, column: 17, scope: !2954)
!2961 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !2960)
!2962 = !DILocation(line: 139, column: 7, scope: !2954)
!2963 = !DILocation(line: 0, scope: !2553, inlinedAt: !2964)
!2964 = distinct !DILocation(line: 140, column: 15, scope: !2955)
!2965 = !DILocation(line: 180, column: 7, scope: !2553, inlinedAt: !2964)
!2966 = !DILocation(line: 0, scope: !2566, inlinedAt: !2967)
!2967 = distinct !DILocation(line: 180, column: 12, scope: !2553, inlinedAt: !2964)
!2968 = !DILocation(line: 0, scope: !2578, inlinedAt: !2969)
!2969 = distinct !DILocation(line: 392, column: 26, scope: !2566, inlinedAt: !2967)
!2970 = !DILocation(line: 372, column: 7, scope: !2586, inlinedAt: !2969)
!2971 = !DILocation(line: 372, column: 6, scope: !2578, inlinedAt: !2969)
!2972 = !DILocation(line: 0, scope: !2367, inlinedAt: !2973)
!2973 = distinct !DILocation(line: 374, column: 22, scope: !2592, inlinedAt: !2969)
!2974 = !DILocation(line: 450, column: 30, scope: !2367, inlinedAt: !2973)
!2975 = !DILocation(line: 0, scope: !2393, inlinedAt: !2976)
!2976 = distinct !DILocation(line: 450, column: 16, scope: !2367, inlinedAt: !2973)
!2977 = !DILocation(line: 49, column: 12, scope: !2407, inlinedAt: !2976)
!2978 = !DILocation(line: 49, column: 11, scope: !2393, inlinedAt: !2976)
!2979 = !DILocation(line: 50, column: 2, scope: !2407, inlinedAt: !2976)
!2980 = !DILocation(line: 0, scope: !2411, inlinedAt: !2981)
!2981 = distinct !DILocation(line: 450, column: 40, scope: !2367, inlinedAt: !2973)
!2982 = !DILocation(line: 882, column: 6, scope: !2422, inlinedAt: !2981)
!2983 = !DILocation(line: 882, column: 6, scope: !2411, inlinedAt: !2981)
!2984 = !DILocation(line: 884, column: 8, scope: !2411, inlinedAt: !2981)
!2985 = !DILocation(line: 885, column: 15, scope: !2411, inlinedAt: !2981)
!2986 = !DILocation(line: 240, column: 7, scope: !2606, inlinedAt: !2987)
!2987 = distinct !DILocation(line: 140, column: 36, scope: !2955)
!2988 = !DILocation(line: 885, column: 2, scope: !2411, inlinedAt: !2981)
!2989 = !DILocation(line: 375, column: 19, scope: !2592, inlinedAt: !2969)
!2990 = !DILocation(line: 376, column: 4, scope: !2592, inlinedAt: !2969)
!2991 = !DILocation(line: 393, column: 2, scope: !2566, inlinedAt: !2967)
!2992 = !DILocation(line: 393, column: 10, scope: !2566, inlinedAt: !2967)
!2993 = !DILocation(line: 0, scope: !2606, inlinedAt: !2987)
!2994 = !DILocation(line: 0, scope: !2624, inlinedAt: !2995)
!2995 = distinct !DILocation(line: 240, column: 12, scope: !2606, inlinedAt: !2987)
!2996 = !DILocation(line: 766, column: 26, scope: !2624, inlinedAt: !2995)
!2997 = !DILocation(line: 767, column: 16, scope: !2624, inlinedAt: !2995)
!2998 = !DILocation(line: 140, column: 55, scope: !2955)
!2999 = !DILocation(line: 0, scope: !2821, inlinedAt: !3000)
!3000 = distinct !DILocation(line: 140, column: 52, scope: !2955)
!3001 = !DILocation(line: 171, column: 16, scope: !2821, inlinedAt: !3000)
!3002 = !DILocation(line: 0, scope: !2275, inlinedAt: !3003)
!3003 = distinct !DILocation(line: 140, column: 65, scope: !2955)
!3004 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !3003)
!3005 = !DILocation(line: 137, column: 37, scope: !2956)
!3006 = !DILocation(line: 137, column: 21, scope: !2956)
!3007 = distinct !{!3007, !2834, !3008, !2715}
!3008 = !DILocation(line: 141, column: 3, scope: !2234)
!3009 = !DILocation(line: 0, scope: !2240)
!3010 = !DILocation(line: 181, column: 15, scope: !2248)
!3011 = !DILocation(line: 181, column: 7, scope: !2240)
!3012 = !DILocation(line: 182, column: 15, scope: !2251)
!3013 = !DILocation(line: 182, column: 34, scope: !2251)
!3014 = !DILocation(line: 0, scope: !2254, inlinedAt: !3015)
!3015 = distinct !DILocation(line: 182, column: 45, scope: !2251)
!3016 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !3015)
!3017 = !DILocation(line: 183, column: 5, scope: !2251)
!3018 = !DILocation(line: 185, column: 1, scope: !2240)
!3019 = !DISubprogram(name: "hipGetDevice", scope: !82, file: !82, line: 1601, type: !3020, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3020 = !DISubroutineType(types: !3021)
!3021 = !{!2243, !495}
!3022 = !DISubprogram(name: "hipMemcpy", scope: !82, file: !82, line: 3620, type: !3023, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3023 = !DISubroutineType(types: !3024)
!3024 = !{!2243, !271, !846, !820, !3025}
!3025 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipMemcpyKind", file: !164, line: 352, baseType: !163)
!3026 = !DISubprogram(name: "__hipPushCallConfiguration", scope: !82, file: !82, line: 5359, type: !3027, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3027 = !DISubroutineType(types: !3028)
!3028 = !{!2243, !182, !182, !820, !3029}
!3029 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipStream_t", file: !82, line: 529, baseType: !3030)
!3030 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3031, size: 64)
!3031 = !DICompositeType(tag: DW_TAG_structure_type, name: "ihipStream_t", file: !82, line: 529, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS12ihipStream_t")
!3032 = !DISubprogram(name: "hipFree", scope: !82, file: !82, line: 3565, type: !3033, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3033 = !DISubroutineType(types: !3034)
!3034 = !{!2243, !271}
!3035 = !DILocation(line: 0, scope: !2108)
!3036 = !DILocation(line: 168, column: 3, scope: !2108)
!3037 = !DILocation(line: 168, column: 19, scope: !2108)
!3038 = !DILocation(line: 169, column: 17, scope: !2108)
!3039 = !DILocation(line: 0, scope: !2240, inlinedAt: !3040)
!3040 = distinct !DILocation(line: 169, column: 3, scope: !2108)
!3041 = !DILocation(line: 181, column: 15, scope: !2248, inlinedAt: !3040)
!3042 = !DILocation(line: 181, column: 7, scope: !2240, inlinedAt: !3040)
!3043 = !DILocation(line: 182, column: 15, scope: !2251, inlinedAt: !3040)
!3044 = !DILocation(line: 182, column: 34, scope: !2251, inlinedAt: !3040)
!3045 = !DILocation(line: 0, scope: !2254, inlinedAt: !3046)
!3046 = distinct !DILocation(line: 182, column: 45, scope: !2251, inlinedAt: !3040)
!3047 = !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !3046)
!3048 = !DILocation(line: 183, column: 5, scope: !2251, inlinedAt: !3040)
!3049 = !DILocation(line: 0, scope: !2275, inlinedAt: !3050)
!3050 = distinct !DILocation(line: 170, column: 8, scope: !2108)
!3051 = !DILocalVariable(name: "__s", arg: 1, scope: !3052, file: !2284, line: 393, type: !2300)
!3052 = distinct !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !2283, file: !2284, line: 393, type: !2303, scopeLine: 394, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !79, declaration: !2302, retainedNodes: !3053)
!3053 = !{!3051}
!3054 = !DILocation(line: 0, scope: !3052, inlinedAt: !3055)
!3055 = distinct !DILocation(line: 621, column: 29, scope: !2339, inlinedAt: !3050)
!3056 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !3050)
!3057 = !DILocation(line: 170, column: 39, scope: !2108)
!3058 = !{!3059, !2211, i64 332}
!3059 = !{!"_ZTS15hipDeviceProp_t", !2208, i64 0, !2386, i64 256, !2386, i64 264, !2211, i64 272, !2211, i64 276, !2211, i64 280, !2208, i64 284, !2208, i64 296, !2211, i64 308, !2211, i64 312, !2211, i64 316, !2386, i64 320, !2211, i64 328, !2211, i64 332, !2211, i64 336, !2211, i64 340, !2211, i64 344, !2211, i64 348, !2211, i64 352, !3060, i64 356, !2211, i64 360, !2211, i64 364, !2211, i64 368, !2211, i64 372, !2386, i64 376, !2211, i64 384, !2211, i64 388, !2211, i64 392, !2208, i64 396, !2211, i64 652, !2211, i64 656, !2211, i64 660, !2211, i64 664, !2211, i64 668, !2208, i64 672, !2208, i64 680, !2207, i64 696, !2207, i64 704, !2386, i64 712, !2386, i64 720, !2386, i64 728, !2211, i64 736, !2211, i64 740, !2211, i64 744, !2211, i64 748, !2211, i64 752, !2211, i64 756, !2211, i64 760, !2211, i64 764, !2211, i64 768, !2211, i64 772, !2211, i64 776, !2211, i64 780, !2211, i64 784, !2211, i64 788}
!3060 = !{!"_ZTS15hipDeviceArch_t", !2211, i64 0, !2211, i64 0, !2211, i64 0, !2211, i64 0, !2211, i64 0, !2211, i64 0, !2211, i64 0, !2211, i64 0, !2211, i64 1, !2211, i64 1, !2211, i64 1, !2211, i64 1, !2211, i64 1, !2211, i64 1, !2211, i64 1, !2211, i64 1, !2211, i64 2}
!3061 = !DILocation(line: 170, column: 28, scope: !2108)
!3062 = !DILocation(line: 0, scope: !2254, inlinedAt: !3063)
!3063 = distinct !DILocation(line: 170, column: 45, scope: !2108)
!3064 = !DILocation(line: 0, scope: !2359, inlinedAt: !3065)
!3065 = distinct !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !3063)
!3066 = !DILocation(line: 689, column: 29, scope: !2359, inlinedAt: !3065)
!3067 = !DILocation(line: 0, scope: !2367, inlinedAt: !3068)
!3068 = distinct !DILocation(line: 689, column: 34, scope: !2359, inlinedAt: !3065)
!3069 = !DILocation(line: 450, column: 30, scope: !2367, inlinedAt: !3068)
!3070 = !DILocation(line: 0, scope: !2393, inlinedAt: !3071)
!3071 = distinct !DILocation(line: 450, column: 16, scope: !2367, inlinedAt: !3068)
!3072 = !DILocation(line: 49, column: 12, scope: !2407, inlinedAt: !3071)
!3073 = !DILocation(line: 49, column: 11, scope: !2393, inlinedAt: !3071)
!3074 = !DILocation(line: 50, column: 2, scope: !2407, inlinedAt: !3071)
!3075 = !DILocation(line: 0, scope: !2411, inlinedAt: !3076)
!3076 = distinct !DILocation(line: 450, column: 40, scope: !2367, inlinedAt: !3068)
!3077 = !DILocation(line: 882, column: 6, scope: !2422, inlinedAt: !3076)
!3078 = !DILocation(line: 882, column: 6, scope: !2411, inlinedAt: !3076)
!3079 = !DILocation(line: 883, column: 11, scope: !2422, inlinedAt: !3076)
!3080 = !DILocation(line: 883, column: 4, scope: !2422, inlinedAt: !3076)
!3081 = !DILocation(line: 884, column: 8, scope: !2411, inlinedAt: !3076)
!3082 = !DILocation(line: 885, column: 15, scope: !2411, inlinedAt: !3076)
!3083 = !DILocation(line: 885, column: 2, scope: !2411, inlinedAt: !3076)
!3084 = !DILocation(line: 689, column: 25, scope: !2359, inlinedAt: !3065)
!3085 = !DILocation(line: 0, scope: !2343, inlinedAt: !3086)
!3086 = distinct !DILocation(line: 689, column: 14, scope: !2359, inlinedAt: !3065)
!3087 = !DILocation(line: 711, column: 19, scope: !2343, inlinedAt: !3086)
!3088 = !DILocation(line: 0, scope: !2275, inlinedAt: !3089)
!3089 = distinct !DILocation(line: 171, column: 8, scope: !2108)
!3090 = !DILocation(line: 0, scope: !3052, inlinedAt: !3091)
!3091 = distinct !DILocation(line: 621, column: 29, scope: !2339, inlinedAt: !3089)
!3092 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !3089)
!3093 = !DILocation(line: 171, column: 39, scope: !2108)
!3094 = !{!3059, !2211, i64 328}
!3095 = !DILocation(line: 171, column: 28, scope: !2108)
!3096 = !DILocation(line: 0, scope: !2254, inlinedAt: !3097)
!3097 = distinct !DILocation(line: 171, column: 45, scope: !2108)
!3098 = !DILocation(line: 0, scope: !2359, inlinedAt: !3099)
!3099 = distinct !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !3097)
!3100 = !DILocation(line: 689, column: 29, scope: !2359, inlinedAt: !3099)
!3101 = !DILocation(line: 0, scope: !2367, inlinedAt: !3102)
!3102 = distinct !DILocation(line: 689, column: 34, scope: !2359, inlinedAt: !3099)
!3103 = !DILocation(line: 450, column: 30, scope: !2367, inlinedAt: !3102)
!3104 = !DILocation(line: 0, scope: !2393, inlinedAt: !3105)
!3105 = distinct !DILocation(line: 450, column: 16, scope: !2367, inlinedAt: !3102)
!3106 = !DILocation(line: 49, column: 12, scope: !2407, inlinedAt: !3105)
!3107 = !DILocation(line: 49, column: 11, scope: !2393, inlinedAt: !3105)
!3108 = !DILocation(line: 50, column: 2, scope: !2407, inlinedAt: !3105)
!3109 = !DILocation(line: 0, scope: !2411, inlinedAt: !3110)
!3110 = distinct !DILocation(line: 450, column: 40, scope: !2367, inlinedAt: !3102)
!3111 = !DILocation(line: 882, column: 6, scope: !2422, inlinedAt: !3110)
!3112 = !DILocation(line: 882, column: 6, scope: !2411, inlinedAt: !3110)
!3113 = !DILocation(line: 883, column: 11, scope: !2422, inlinedAt: !3110)
!3114 = !DILocation(line: 883, column: 4, scope: !2422, inlinedAt: !3110)
!3115 = !DILocation(line: 884, column: 8, scope: !2411, inlinedAt: !3110)
!3116 = !DILocation(line: 885, column: 15, scope: !2411, inlinedAt: !3110)
!3117 = !DILocation(line: 885, column: 2, scope: !2411, inlinedAt: !3110)
!3118 = !DILocation(line: 689, column: 25, scope: !2359, inlinedAt: !3099)
!3119 = !DILocation(line: 0, scope: !2343, inlinedAt: !3120)
!3120 = distinct !DILocation(line: 689, column: 14, scope: !2359, inlinedAt: !3099)
!3121 = !DILocation(line: 711, column: 19, scope: !2343, inlinedAt: !3120)
!3122 = !DILocation(line: 0, scope: !2275, inlinedAt: !3123)
!3123 = distinct !DILocation(line: 172, column: 8, scope: !2108)
!3124 = !DILocation(line: 0, scope: !3052, inlinedAt: !3125)
!3125 = distinct !DILocation(line: 621, column: 29, scope: !2339, inlinedAt: !3123)
!3126 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !3123)
!3127 = !DILocation(line: 0, scope: !2275, inlinedAt: !3128)
!3128 = distinct !DILocation(line: 172, column: 31, scope: !2108)
!3129 = !DILocation(line: 0, scope: !3052, inlinedAt: !3130)
!3130 = distinct !DILocation(line: 621, column: 29, scope: !2339, inlinedAt: !3128)
!3131 = !DILocation(line: 399, column: 9, scope: !3052, inlinedAt: !3130)
!3132 = !DILocation(line: 620, column: 2, scope: !2339, inlinedAt: !3128)
!3133 = !DILocation(line: 0, scope: !2254, inlinedAt: !3134)
!3134 = distinct !DILocation(line: 172, column: 47, scope: !2108)
!3135 = !DILocation(line: 0, scope: !2359, inlinedAt: !3136)
!3136 = distinct !DILocation(line: 113, column: 9, scope: !2254, inlinedAt: !3134)
!3137 = !DILocation(line: 689, column: 29, scope: !2359, inlinedAt: !3136)
!3138 = !DILocation(line: 0, scope: !2367, inlinedAt: !3139)
!3139 = distinct !DILocation(line: 689, column: 34, scope: !2359, inlinedAt: !3136)
!3140 = !DILocation(line: 450, column: 30, scope: !2367, inlinedAt: !3139)
!3141 = !DILocation(line: 0, scope: !2393, inlinedAt: !3142)
!3142 = distinct !DILocation(line: 450, column: 16, scope: !2367, inlinedAt: !3139)
!3143 = !DILocation(line: 49, column: 12, scope: !2407, inlinedAt: !3142)
!3144 = !DILocation(line: 49, column: 11, scope: !2393, inlinedAt: !3142)
!3145 = !DILocation(line: 50, column: 2, scope: !2407, inlinedAt: !3142)
!3146 = !DILocation(line: 0, scope: !2411, inlinedAt: !3147)
!3147 = distinct !DILocation(line: 450, column: 40, scope: !2367, inlinedAt: !3139)
!3148 = !DILocation(line: 882, column: 6, scope: !2422, inlinedAt: !3147)
!3149 = !DILocation(line: 882, column: 6, scope: !2411, inlinedAt: !3147)
!3150 = !DILocation(line: 883, column: 11, scope: !2422, inlinedAt: !3147)
!3151 = !DILocation(line: 883, column: 4, scope: !2422, inlinedAt: !3147)
!3152 = !DILocation(line: 884, column: 8, scope: !2411, inlinedAt: !3147)
!3153 = !DILocation(line: 885, column: 15, scope: !2411, inlinedAt: !3147)
!3154 = !DILocation(line: 885, column: 2, scope: !2411, inlinedAt: !3147)
!3155 = !DILocation(line: 689, column: 25, scope: !2359, inlinedAt: !3136)
!3156 = !DILocation(line: 0, scope: !2343, inlinedAt: !3157)
!3157 = distinct !DILocation(line: 689, column: 14, scope: !2359, inlinedAt: !3136)
!3158 = !DILocation(line: 711, column: 19, scope: !2343, inlinedAt: !3157)
!3159 = !DILocation(line: 174, column: 3, scope: !2108)
!3160 = !DILocation(line: 175, column: 15, scope: !2108)
!3161 = !DILocation(line: 175, column: 3, scope: !2108)
!3162 = !DILocation(line: 177, column: 1, scope: !2108)
!3163 = !DILocation(line: 176, column: 3, scope: !2108)
!3164 = !DISubprogram(name: "hipGetDeviceProperties", scope: !82, file: !82, line: 1695, type: !3165, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3165 = !DISubroutineType(types: !3166)
!3166 = !{!2243, !3167, !172}
!3167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2115, size: 64)
!3168 = !DISubprogram(name: "exit", scope: !458, file: !458, line: 624, type: !860, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3169 = !DISubprogram(name: "__ostream_insert<char, std::char_traits<char> >", linkageName: "_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l", scope: !2, file: !3170, line: 77, type: !3171, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2347, retainedNodes: !290)
!3170 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/ostream_insert.h", directory: "")
!3171 = !DISubroutineType(types: !3172)
!3172 = !{!2278, !2278, !703, !265}
!3173 = !DISubprogram(name: "__builtin_strlen", scope: !3174, file: !3174, line: 122, type: !3175, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3174 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/typeinfo", directory: "")
!3175 = !DISubroutineType(types: !3176)
!3176 = !{!822, !703}
!3177 = !DISubprogram(name: "__throw_bad_cast", linkageName: "_ZSt16__throw_bad_castv", scope: !2, file: !3178, line: 59, type: !814, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3178 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/functexcept.h", directory: "", checksumkind: CSK_MD5, checksum: "a363406ed41198146320f1e077ba3f30")
!3179 = !DISubprogram(name: "hipMallocManaged", scope: !82, file: !82, line: 2903, type: !3180, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3180 = !DISubroutineType(types: !3181)
!3181 = !{!2243, !270, !820, !83}
!3182 = !DISubprogram(name: "hipMalloc", scope: !82, file: !82, line: 2795, type: !3183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3183 = !DISubroutineType(types: !3184)
!3184 = !{!2243, !270, !820}
!3185 = !DISubprogram(name: "nanosleep", scope: !1982, file: !1982, line: 272, type: !3186, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3186 = !DISubroutineType(types: !3187)
!3187 = !{!172, !3188, !2030}
!3188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3189, size: 64)
!3189 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2020)
!3190 = !DISubprogram(name: "__errno_location", scope: !3191, file: !3191, line: 37, type: !3192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !290)
!3191 = !DIFile(filename: "/usr/include/errno.h", directory: "", checksumkind: CSK_MD5, checksum: "01c14bf4ab600a3884f5da68eb763170")
!3192 = !DISubroutineType(types: !3193)
!3193 = !{!495}
!3194 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_managed_clock_test.cpp", scope: !1460, file: !1460, type: !3195, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !290)
!3195 = !DISubroutineType(types: !290)
!3196 = !DILocation(line: 74, column: 25, scope: !3197, inlinedAt: !3199)
!3197 = !DILexicalBlockFile(scope: !3198, file: !3, discriminator: 0)
!3198 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1460, file: !1460, type: !814, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !79, retainedNodes: !290)
!3199 = distinct !DILocation(line: 0, scope: !3194)
!3200 = !DILocation(line: 0, scope: !3198, inlinedAt: !3199)

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
