
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx90a
; ModuleID = 'test/clock_test.cpp'
source_filename = "test/clock_test.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13__d_incrementPiPl(i32 addrspace(1)* nocapture %0, i64 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 !dbg !1809 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !dbg !1818, !range !1833
  %4 = icmp eq i32 %3, 0, !dbg !1834
  br i1 %4, label %5, label %11, !dbg !1835

5:                                                ; preds = %2
  %6 = tail call i64 @llvm.amdgcn.s.memtime(), !dbg !1836
  store i64 %6, i64 addrspace(1)* %1, align 8, !dbg !1848, !tbaa !1849
  %7 = tail call i64 @llvm.amdgcn.s.memtime(), !dbg !1853
  %8 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 1, !dbg !1857
  store i64 %7, i64 addrspace(1)* %8, align 8, !dbg !1858, !tbaa !1849
  %9 = tail call i64 @llvm.amdgcn.s.memrealtime(), !dbg !1859
  %10 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 2, !dbg !1862
  store i64 %9, i64 addrspace(1)* %10, align 8, !dbg !1863, !tbaa !1849
  br label %17, !dbg !1864

11:                                               ; preds = %2
  %12 = add nsw i32 %3, -1, !dbg !1865
  %13 = zext i32 %12 to i64, !dbg !1867
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %13, !dbg !1867
  %15 = load i32, i32 addrspace(1)* %14, align 4, !dbg !1867, !tbaa !1868, !amdgpu.noclobber !1841
  %16 = add i32 %15, 1
  br label %17

17:                                               ; preds = %11, %5
  %18 = phi i32 [ 1, %5 ], [ %16, %11 ]
  fence syncscope("workgroup") release, !dbg !1870
  tail call void @llvm.amdgcn.s.barrier(), !dbg !1888
  fence syncscope("workgroup") acquire, !dbg !1889
  %19 = zext i32 %3 to i64, !dbg !1890
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19, !dbg !1890
  store i32 %18, i32 addrspace(1)* %20, align 4, !dbg !1891, !tbaa !1868
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr(), !dbg !1892
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4, !dbg !1892
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*, !dbg !1892
  %24 = load i16, i16 addrspace(4)* %23, align 4, !dbg !1892, !range !1907, !invariant.load !1841
  %25 = zext i16 %24 to i32, !dbg !1892
  %26 = add nsw i32 %25, -1, !dbg !1908
  %27 = icmp eq i32 %3, %26, !dbg !1909
  br i1 %27, label %28, label %35, !dbg !1910

28:                                               ; preds = %17
  %29 = tail call i64 @llvm.amdgcn.s.memtime(), !dbg !1911
  %30 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 3, !dbg !1916
  store i64 %29, i64 addrspace(1)* %30, align 8, !dbg !1917, !tbaa !1849
  %31 = tail call i64 @llvm.amdgcn.s.memtime(), !dbg !1918
  %32 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 4, !dbg !1921
  store i64 %31, i64 addrspace(1)* %32, align 8, !dbg !1922, !tbaa !1849
  %33 = tail call i64 @llvm.amdgcn.s.memrealtime(), !dbg !1923
  %34 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 5, !dbg !1925
  store i64 %33, i64 addrspace(1)* %34, align 8, !dbg !1926, !tbaa !1849
  br label %35, !dbg !1927

35:                                               ; preds = %28, %17
  ret void, !dbg !1928
}

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memtime() #1

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memrealtime() #1

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nounwind willreturn }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.dbg.retainedNodes = !{!1700, !1742, !1800}
!llvm.module.flags = !{!1803, !1804, !1805, !1806}
!opencl.ocl.version = !{!1807}
!llvm.ident = !{!1808}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !26, imports: !43, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test/clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard", checksumkind: CSK_MD5, checksum: "b1cad702fd286fb852884abf6f61d7c4")
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
!26 = !{!27, !28, !29}
!27 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cl_mem_fence_flags", file: !12, line: 129, baseType: !6)
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !30, line: 934, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !31, identifier: "_ZTS4dim3")
!30 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "7560f6d8bd7c5ac736ef5dfcbc59d092")
!31 = !{!32, !37, !38, !39}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !29, file: !30, line: 935, baseType: !33, size: 32)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !34, line: 26, baseType: !35)
!34 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "9754ebe022edbe8d7928fa709e442f0d")
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !36, line: 41, baseType: !6)
!36 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "eac2c46b20ddc2be81186b6ffebfd845")
!37 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !29, file: !30, line: 936, baseType: !33, size: 32, offset: 32)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !29, file: !30, line: 937, baseType: !33, size: 32, offset: 64)
!39 = !DISubprogram(name: "dim3", scope: !29, file: !30, line: 939, type: !40, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42, !33, !33, !33}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!43 = !{!44, !52, !59, !61, !63, !67, !69, !71, !73, !75, !77, !79, !81, !86, !90, !92, !94, !99, !101, !103, !105, !107, !109, !111, !114, !117, !119, !123, !128, !130, !132, !134, !136, !138, !140, !142, !144, !146, !148, !152, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !176, !178, !180, !182, !184, !186, !190, !194, !198, !200, !202, !204, !206, !208, !210, !212, !214, !216, !220, !224, !228, !230, !232, !234, !238, !242, !246, !248, !250, !252, !254, !256, !258, !260, !262, !264, !266, !268, !270, !275, !279, !283, !285, !287, !289, !296, !300, !304, !306, !308, !310, !312, !314, !316, !320, !324, !326, !328, !330, !332, !336, !340, !344, !346, !348, !350, !352, !354, !356, !360, !364, !368, !370, !374, !378, !380, !382, !384, !386, !388, !390, !394, !398, !404, !408, !416, !421, !423, !426, !430, !434, !445, !447, !451, !455, !459, !464, !468, !472, !476, !480, !488, !492, !496, !498, !502, !506, !510, !516, !520, !524, !526, !534, !538, !544, !546, !550, !554, !558, !562, !567, !571, !575, !576, !577, !578, !580, !581, !582, !583, !584, !585, !586, !588, !589, !590, !591, !592, !593, !594, !596, !597, !598, !599, !600, !601, !602, !603, !604, !605, !606, !607, !608, !609, !610, !611, !612, !613, !614, !615, !616, !617, !618, !619, !620, !624, !628, !631, !633, !635, !637, !639, !641, !643, !645, !647, !649, !651, !653, !655, !657, !659, !661, !663, !665, !667, !669, !671, !673, !675, !677, !679, !681, !685, !687, !689, !694, !698, !700, !702, !704, !706, !708, !710, !712, !714, !716, !718, !720, !722, !724, !726, !728, !730, !732, !734, !736, !738, !740, !745, !747, !749, !751, !753, !755, !757, !759, !761, !763, !765, !767, !769, !771, !773, !775, !777, !779, !781, !783, !787, !789, !791, !793, !795, !797, !799, !801, !803, !805, !807, !809, !811, !813, !815, !817, !819, !821, !823, !825, !827, !829, !831, !833, !835, !837, !839, !841, !843, !845, !847, !849, !851, !853, !855, !857, !859, !861, !863, !865, !867, !869, !871, !873, !875, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !912, !915, !920, !978, !983, !987, !991, !995, !999, !1001, !1003, !1007, !1013, !1017, !1023, !1029, !1031, !1035, !1039, !1043, !1047, !1055, !1057, !1061, !1065, !1069, !1071, !1075, !1079, !1083, !1085, !1087, !1091, !1099, !1103, !1107, !1111, !1113, !1119, !1121, !1127, !1131, !1135, !1139, !1143, !1147, !1151, !1153, !1155, !1159, !1163, !1167, !1169, !1173, !1177, !1179, !1181, !1185, !1189, !1193, !1197, !1198, !1199, !1200, !1201, !1202, !1203, !1204, !1205, !1206, !1207, !1212, !1216, !1219, !1222, !1225, !1227, !1229, !1231, !1234, !1237, !1240, !1243, !1246, !1248, !1252, !1255, !1256, !1259, !1261, !1263, !1265, !1267, !1270, !1273, !1276, !1279, !1282, !1284, !1288, !1292, !1297, !1301, !1303, !1305, !1307, !1309, !1311, !1313, !1315, !1317, !1319, !1321, !1323, !1325, !1327, !1331, !1337, !1342, !1346, !1348, !1350, !1352, !1354, !1361, !1365, !1369, !1373, !1377, !1381, !1386, !1390, !1392, !1396, !1402, !1406, !1411, !1413, !1416, !1420, !1424, !1426, !1428, !1430, !1432, !1436, !1438, !1440, !1444, !1448, !1452, !1456, !1460, !1464, !1466, !1470, !1474, !1478, !1482, !1484, !1486, !1490, !1494, !1495, !1496, !1497, !1498, !1499, !1505, !1508, !1509, !1511, !1513, !1515, !1517, !1521, !1523, !1525, !1527, !1529, !1531, !1533, !1535, !1537, !1541, !1545, !1547, !1551, !1555, !1560, !1564, !1565, !1570, !1574, !1579, !1584, !1588, !1594, !1598, !1600, !1604, !1611, !1616, !1621, !1627, !1631, !1635, !1639, !1643, !1647, !1649, !1651, !1653, !1657, !1661, !1665, !1669, !1673, !1675, !1677, !1679, !1683, !1687, !1691, !1693, !1695, !1697}
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !46, file: !51, line: 52)
!45 = !DINamespace(name: "std", scope: null)
!46 = !DISubprogram(name: "abs", scope: !47, file: !47, line: 837, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!47 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "d0b67d4c866748c04ac2b355c26c1c70")
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/std_abs.h", directory: "")
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !53, file: !58, line: 83)
!53 = !DISubprogram(name: "acos", scope: !54, file: !54, line: 53, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!54 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "d6f9ed6e7af49b30a088f9f753a7a51b")
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57}
!57 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!58 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cmath", directory: "")
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !60, file: !58, line: 102)
!60 = !DISubprogram(name: "asin", scope: !54, file: !54, line: 55, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !62, file: !58, line: 121)
!62 = !DISubprogram(name: "atan", scope: !54, file: !54, line: 57, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !64, file: !58, line: 140)
!64 = !DISubprogram(name: "atan2", scope: !54, file: !54, line: 59, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!65 = !DISubroutineType(types: !66)
!66 = !{!57, !57, !57}
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !68, file: !58, line: 161)
!68 = !DISubprogram(name: "ceil", scope: !54, file: !54, line: 159, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !70, file: !58, line: 180)
!70 = !DISubprogram(name: "cos", scope: !54, file: !54, line: 62, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !72, file: !58, line: 199)
!72 = !DISubprogram(name: "cosh", scope: !54, file: !54, line: 71, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !74, file: !58, line: 218)
!74 = !DISubprogram(name: "exp", scope: !54, file: !54, line: 95, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !76, file: !58, line: 237)
!76 = !DISubprogram(name: "fabs", scope: !54, file: !54, line: 162, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !78, file: !58, line: 256)
!78 = !DISubprogram(name: "floor", scope: !54, file: !54, line: 165, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !80, file: !58, line: 275)
!80 = !DISubprogram(name: "fmod", scope: !54, file: !54, line: 168, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !82, file: !58, line: 296)
!82 = !DISubprogram(name: "frexp", scope: !54, file: !54, line: 98, type: !83, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!83 = !DISubroutineType(types: !84)
!84 = !{!57, !57, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !87, file: !58, line: 315)
!87 = !DISubprogram(name: "ldexp", scope: !54, file: !54, line: 101, type: !88, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!88 = !DISubroutineType(types: !89)
!89 = !{!57, !57, !50}
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !91, file: !58, line: 334)
!91 = !DISubprogram(name: "log", scope: !54, file: !54, line: 104, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !93, file: !58, line: 353)
!93 = !DISubprogram(name: "log10", scope: !54, file: !54, line: 107, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !95, file: !58, line: 372)
!95 = !DISubprogram(name: "modf", scope: !54, file: !54, line: 110, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!96 = !DISubroutineType(types: !97)
!97 = !{!57, !57, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !100, file: !58, line: 384)
!100 = !DISubprogram(name: "pow", scope: !54, file: !54, line: 140, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !102, file: !58, line: 421)
!102 = !DISubprogram(name: "sin", scope: !54, file: !54, line: 64, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !104, file: !58, line: 440)
!104 = !DISubprogram(name: "sinh", scope: !54, file: !54, line: 73, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !106, file: !58, line: 459)
!106 = !DISubprogram(name: "sqrt", scope: !54, file: !54, line: 143, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !108, file: !58, line: 478)
!108 = !DISubprogram(name: "tan", scope: !54, file: !54, line: 66, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !110, file: !58, line: 497)
!110 = !DISubprogram(name: "tanh", scope: !54, file: !54, line: 75, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !112, file: !58, line: 1065)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !113, line: 150, baseType: !57)
!113 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "c5a5a367b9358fd8d34408e944614c4d")
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !115, file: !58, line: 1066)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !113, line: 149, baseType: !116)
!116 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !118, file: !58, line: 1069)
!118 = !DISubprogram(name: "acosh", scope: !54, file: !54, line: 85, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !120, file: !58, line: 1070)
!120 = !DISubprogram(name: "acoshf", scope: !54, file: !54, line: 85, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!121 = !DISubroutineType(types: !122)
!122 = !{!116, !116}
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !124, file: !58, line: 1071)
!124 = !DISubprogram(name: "acoshl", scope: !54, file: !54, line: 85, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!125 = !DISubroutineType(types: !126)
!126 = !{!127, !127}
!127 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !129, file: !58, line: 1073)
!129 = !DISubprogram(name: "asinh", scope: !54, file: !54, line: 87, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !131, file: !58, line: 1074)
!131 = !DISubprogram(name: "asinhf", scope: !54, file: !54, line: 87, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !133, file: !58, line: 1075)
!133 = !DISubprogram(name: "asinhl", scope: !54, file: !54, line: 87, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !135, file: !58, line: 1077)
!135 = !DISubprogram(name: "atanh", scope: !54, file: !54, line: 89, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !137, file: !58, line: 1078)
!137 = !DISubprogram(name: "atanhf", scope: !54, file: !54, line: 89, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !139, file: !58, line: 1079)
!139 = !DISubprogram(name: "atanhl", scope: !54, file: !54, line: 89, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !141, file: !58, line: 1081)
!141 = !DISubprogram(name: "cbrt", scope: !54, file: !54, line: 152, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !143, file: !58, line: 1082)
!143 = !DISubprogram(name: "cbrtf", scope: !54, file: !54, line: 152, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !145, file: !58, line: 1083)
!145 = !DISubprogram(name: "cbrtl", scope: !54, file: !54, line: 152, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !147, file: !58, line: 1085)
!147 = !DISubprogram(name: "copysign", scope: !54, file: !54, line: 196, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !149, file: !58, line: 1086)
!149 = !DISubprogram(name: "copysignf", scope: !54, file: !54, line: 196, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!150 = !DISubroutineType(types: !151)
!151 = !{!116, !116, !116}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !153, file: !58, line: 1087)
!153 = !DISubprogram(name: "copysignl", scope: !54, file: !54, line: 196, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!154 = !DISubroutineType(types: !155)
!155 = !{!127, !127, !127}
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !157, file: !58, line: 1089)
!157 = !DISubprogram(name: "erf", scope: !54, file: !54, line: 228, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !159, file: !58, line: 1090)
!159 = !DISubprogram(name: "erff", scope: !54, file: !54, line: 228, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !161, file: !58, line: 1091)
!161 = !DISubprogram(name: "erfl", scope: !54, file: !54, line: 228, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !163, file: !58, line: 1093)
!163 = !DISubprogram(name: "erfc", scope: !54, file: !54, line: 229, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !165, file: !58, line: 1094)
!165 = !DISubprogram(name: "erfcf", scope: !54, file: !54, line: 229, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !167, file: !58, line: 1095)
!167 = !DISubprogram(name: "erfcl", scope: !54, file: !54, line: 229, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !169, file: !58, line: 1097)
!169 = !DISubprogram(name: "exp2", scope: !54, file: !54, line: 130, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !171, file: !58, line: 1098)
!171 = !DISubprogram(name: "exp2f", scope: !54, file: !54, line: 130, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !173, file: !58, line: 1099)
!173 = !DISubprogram(name: "exp2l", scope: !54, file: !54, line: 130, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !175, file: !58, line: 1101)
!175 = !DISubprogram(name: "expm1", scope: !54, file: !54, line: 119, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !177, file: !58, line: 1102)
!177 = !DISubprogram(name: "expm1f", scope: !54, file: !54, line: 119, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !179, file: !58, line: 1103)
!179 = !DISubprogram(name: "expm1l", scope: !54, file: !54, line: 119, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !181, file: !58, line: 1105)
!181 = !DISubprogram(name: "fdim", scope: !54, file: !54, line: 326, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !183, file: !58, line: 1106)
!183 = !DISubprogram(name: "fdimf", scope: !54, file: !54, line: 326, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !185, file: !58, line: 1107)
!185 = !DISubprogram(name: "fdiml", scope: !54, file: !54, line: 326, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !187, file: !58, line: 1109)
!187 = !DISubprogram(name: "fma", scope: !54, file: !54, line: 335, type: !188, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!188 = !DISubroutineType(types: !189)
!189 = !{!57, !57, !57, !57}
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !191, file: !58, line: 1110)
!191 = !DISubprogram(name: "fmaf", scope: !54, file: !54, line: 335, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!192 = !DISubroutineType(types: !193)
!193 = !{!116, !116, !116, !116}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !195, file: !58, line: 1111)
!195 = !DISubprogram(name: "fmal", scope: !54, file: !54, line: 335, type: !196, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!196 = !DISubroutineType(types: !197)
!197 = !{!127, !127, !127, !127}
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !199, file: !58, line: 1113)
!199 = !DISubprogram(name: "fmax", scope: !54, file: !54, line: 329, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !201, file: !58, line: 1114)
!201 = !DISubprogram(name: "fmaxf", scope: !54, file: !54, line: 329, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !203, file: !58, line: 1115)
!203 = !DISubprogram(name: "fmaxl", scope: !54, file: !54, line: 329, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !205, file: !58, line: 1117)
!205 = !DISubprogram(name: "fmin", scope: !54, file: !54, line: 332, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !207, file: !58, line: 1118)
!207 = !DISubprogram(name: "fminf", scope: !54, file: !54, line: 332, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !209, file: !58, line: 1119)
!209 = !DISubprogram(name: "fminl", scope: !54, file: !54, line: 332, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !211, file: !58, line: 1121)
!211 = !DISubprogram(name: "hypot", scope: !54, file: !54, line: 147, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !213, file: !58, line: 1122)
!213 = !DISubprogram(name: "hypotf", scope: !54, file: !54, line: 147, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !215, file: !58, line: 1123)
!215 = !DISubprogram(name: "hypotl", scope: !54, file: !54, line: 147, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !217, file: !58, line: 1125)
!217 = !DISubprogram(name: "ilogb", scope: !54, file: !54, line: 280, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!218 = !DISubroutineType(types: !219)
!219 = !{!50, !57}
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !221, file: !58, line: 1126)
!221 = !DISubprogram(name: "ilogbf", scope: !54, file: !54, line: 280, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!222 = !DISubroutineType(types: !223)
!223 = !{!50, !116}
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !225, file: !58, line: 1127)
!225 = !DISubprogram(name: "ilogbl", scope: !54, file: !54, line: 280, type: !226, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!226 = !DISubroutineType(types: !227)
!227 = !{!50, !127}
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !229, file: !58, line: 1129)
!229 = !DISubprogram(name: "lgamma", scope: !54, file: !54, line: 230, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !231, file: !58, line: 1130)
!231 = !DISubprogram(name: "lgammaf", scope: !54, file: !54, line: 230, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !233, file: !58, line: 1131)
!233 = !DISubprogram(name: "lgammal", scope: !54, file: !54, line: 230, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !235, file: !58, line: 1134)
!235 = !DISubprogram(name: "llrint", scope: !54, file: !54, line: 316, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!236 = !DISubroutineType(types: !237)
!237 = !{!27, !57}
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !239, file: !58, line: 1135)
!239 = !DISubprogram(name: "llrintf", scope: !54, file: !54, line: 316, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!240 = !DISubroutineType(types: !241)
!241 = !{!27, !116}
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !243, file: !58, line: 1136)
!243 = !DISubprogram(name: "llrintl", scope: !54, file: !54, line: 316, type: !244, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!244 = !DISubroutineType(types: !245)
!245 = !{!27, !127}
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !247, file: !58, line: 1138)
!247 = !DISubprogram(name: "llround", scope: !54, file: !54, line: 322, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !249, file: !58, line: 1139)
!249 = !DISubprogram(name: "llroundf", scope: !54, file: !54, line: 322, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !251, file: !58, line: 1140)
!251 = !DISubprogram(name: "llroundl", scope: !54, file: !54, line: 322, type: !244, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !253, file: !58, line: 1143)
!253 = !DISubprogram(name: "log1p", scope: !54, file: !54, line: 122, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !255, file: !58, line: 1144)
!255 = !DISubprogram(name: "log1pf", scope: !54, file: !54, line: 122, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !257, file: !58, line: 1145)
!257 = !DISubprogram(name: "log1pl", scope: !54, file: !54, line: 122, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !259, file: !58, line: 1147)
!259 = !DISubprogram(name: "log2", scope: !54, file: !54, line: 133, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !261, file: !58, line: 1148)
!261 = !DISubprogram(name: "log2f", scope: !54, file: !54, line: 133, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !263, file: !58, line: 1149)
!263 = !DISubprogram(name: "log2l", scope: !54, file: !54, line: 133, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !265, file: !58, line: 1151)
!265 = !DISubprogram(name: "logb", scope: !54, file: !54, line: 125, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !267, file: !58, line: 1152)
!267 = !DISubprogram(name: "logbf", scope: !54, file: !54, line: 125, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !269, file: !58, line: 1153)
!269 = !DISubprogram(name: "logbl", scope: !54, file: !54, line: 125, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !271, file: !58, line: 1155)
!271 = !DISubprogram(name: "lrint", scope: !54, file: !54, line: 314, type: !272, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!272 = !DISubroutineType(types: !273)
!273 = !{!274, !57}
!274 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !276, file: !58, line: 1156)
!276 = !DISubprogram(name: "lrintf", scope: !54, file: !54, line: 314, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!277 = !DISubroutineType(types: !278)
!278 = !{!274, !116}
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !280, file: !58, line: 1157)
!280 = !DISubprogram(name: "lrintl", scope: !54, file: !54, line: 314, type: !281, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!281 = !DISubroutineType(types: !282)
!282 = !{!274, !127}
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !284, file: !58, line: 1159)
!284 = !DISubprogram(name: "lround", scope: !54, file: !54, line: 320, type: !272, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !286, file: !58, line: 1160)
!286 = !DISubprogram(name: "lroundf", scope: !54, file: !54, line: 320, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !288, file: !58, line: 1161)
!288 = !DISubprogram(name: "lroundl", scope: !54, file: !54, line: 320, type: !281, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !290, file: !58, line: 1163)
!290 = !DISubprogram(name: "nan", scope: !54, file: !54, line: 201, type: !291, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!291 = !DISubroutineType(types: !292)
!292 = !{!57, !293}
!293 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !294, size: 64)
!294 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !295)
!295 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !297, file: !58, line: 1164)
!297 = !DISubprogram(name: "nanf", scope: !54, file: !54, line: 201, type: !298, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!298 = !DISubroutineType(types: !299)
!299 = !{!116, !293}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !301, file: !58, line: 1165)
!301 = !DISubprogram(name: "nanl", scope: !54, file: !54, line: 201, type: !302, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!302 = !DISubroutineType(types: !303)
!303 = !{!127, !293}
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !305, file: !58, line: 1167)
!305 = !DISubprogram(name: "nearbyint", scope: !54, file: !54, line: 294, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !307, file: !58, line: 1168)
!307 = !DISubprogram(name: "nearbyintf", scope: !54, file: !54, line: 294, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !309, file: !58, line: 1169)
!309 = !DISubprogram(name: "nearbyintl", scope: !54, file: !54, line: 294, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !311, file: !58, line: 1171)
!311 = !DISubprogram(name: "nextafter", scope: !54, file: !54, line: 259, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !313, file: !58, line: 1172)
!313 = !DISubprogram(name: "nextafterf", scope: !54, file: !54, line: 259, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !315, file: !58, line: 1173)
!315 = !DISubprogram(name: "nextafterl", scope: !54, file: !54, line: 259, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !317, file: !58, line: 1175)
!317 = !DISubprogram(name: "nexttoward", scope: !54, file: !54, line: 261, type: !318, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!318 = !DISubroutineType(types: !319)
!319 = !{!57, !57, !127}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !321, file: !58, line: 1176)
!321 = !DISubprogram(name: "nexttowardf", scope: !54, file: !54, line: 261, type: !322, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!322 = !DISubroutineType(types: !323)
!323 = !{!116, !116, !127}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !325, file: !58, line: 1177)
!325 = !DISubprogram(name: "nexttowardl", scope: !54, file: !54, line: 261, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !327, file: !58, line: 1179)
!327 = !DISubprogram(name: "remainder", scope: !54, file: !54, line: 272, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !329, file: !58, line: 1180)
!329 = !DISubprogram(name: "remainderf", scope: !54, file: !54, line: 272, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !331, file: !58, line: 1181)
!331 = !DISubprogram(name: "remainderl", scope: !54, file: !54, line: 272, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !333, file: !58, line: 1183)
!333 = !DISubprogram(name: "remquo", scope: !54, file: !54, line: 307, type: !334, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!334 = !DISubroutineType(types: !335)
!335 = !{!57, !57, !57, !85}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !337, file: !58, line: 1184)
!337 = !DISubprogram(name: "remquof", scope: !54, file: !54, line: 307, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!338 = !DISubroutineType(types: !339)
!339 = !{!116, !116, !116, !85}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !341, file: !58, line: 1185)
!341 = !DISubprogram(name: "remquol", scope: !54, file: !54, line: 307, type: !342, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!342 = !DISubroutineType(types: !343)
!343 = !{!127, !127, !127, !85}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !345, file: !58, line: 1187)
!345 = !DISubprogram(name: "rint", scope: !54, file: !54, line: 256, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !347, file: !58, line: 1188)
!347 = !DISubprogram(name: "rintf", scope: !54, file: !54, line: 256, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !349, file: !58, line: 1189)
!349 = !DISubprogram(name: "rintl", scope: !54, file: !54, line: 256, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !351, file: !58, line: 1191)
!351 = !DISubprogram(name: "round", scope: !54, file: !54, line: 298, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !353, file: !58, line: 1192)
!353 = !DISubprogram(name: "roundf", scope: !54, file: !54, line: 298, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !355, file: !58, line: 1193)
!355 = !DISubprogram(name: "roundl", scope: !54, file: !54, line: 298, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !357, file: !58, line: 1195)
!357 = !DISubprogram(name: "scalbln", scope: !54, file: !54, line: 290, type: !358, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!358 = !DISubroutineType(types: !359)
!359 = !{!57, !57, !274}
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !361, file: !58, line: 1196)
!361 = !DISubprogram(name: "scalblnf", scope: !54, file: !54, line: 290, type: !362, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!362 = !DISubroutineType(types: !363)
!363 = !{!116, !116, !274}
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !365, file: !58, line: 1197)
!365 = !DISubprogram(name: "scalblnl", scope: !54, file: !54, line: 290, type: !366, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!366 = !DISubroutineType(types: !367)
!367 = !{!127, !127, !274}
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !369, file: !58, line: 1199)
!369 = !DISubprogram(name: "scalbn", scope: !54, file: !54, line: 276, type: !88, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !371, file: !58, line: 1200)
!371 = !DISubprogram(name: "scalbnf", scope: !54, file: !54, line: 276, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!372 = !DISubroutineType(types: !373)
!373 = !{!116, !116, !50}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !375, file: !58, line: 1201)
!375 = !DISubprogram(name: "scalbnl", scope: !54, file: !54, line: 276, type: !376, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!376 = !DISubroutineType(types: !377)
!377 = !{!127, !127, !50}
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !379, file: !58, line: 1203)
!379 = !DISubprogram(name: "tgamma", scope: !54, file: !54, line: 235, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !381, file: !58, line: 1204)
!381 = !DISubprogram(name: "tgammaf", scope: !54, file: !54, line: 235, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !383, file: !58, line: 1205)
!383 = !DISubprogram(name: "tgammal", scope: !54, file: !54, line: 235, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !385, file: !58, line: 1207)
!385 = !DISubprogram(name: "trunc", scope: !54, file: !54, line: 302, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !387, file: !58, line: 1208)
!387 = !DISubprogram(name: "truncf", scope: !54, file: !54, line: 302, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !389, file: !58, line: 1209)
!389 = !DISubprogram(name: "truncl", scope: !54, file: !54, line: 302, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!390 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !391, entity: !392, file: !393, line: 58)
!391 = !DINamespace(name: "__gnu_debug", scope: null)
!392 = !DINamespace(name: "__debug", scope: !45)
!393 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "c69f68f2d2cbac034a41bb7ce5c36465")
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !395, file: !397, line: 127)
!395 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !47, line: 62, baseType: !396)
!396 = !DICompositeType(tag: DW_TAG_structure_type, file: !47, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!397 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdlib", directory: "")
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !399, file: !397, line: 128)
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !47, line: 70, baseType: !400)
!400 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !47, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !401, identifier: "_ZTS6ldiv_t")
!401 = !{!402, !403}
!402 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !400, file: !47, line: 68, baseType: !274, size: 64)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !400, file: !47, line: 69, baseType: !274, size: 64, offset: 64)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !405, file: !397, line: 130)
!405 = !DISubprogram(name: "abort", scope: !47, file: !47, line: 588, type: !406, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!406 = !DISubroutineType(types: !407)
!407 = !{null}
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !409, file: !397, line: 132)
!409 = !DISubprogram(name: "aligned_alloc", scope: !47, file: !47, line: 583, type: !410, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!410 = !DISubroutineType(types: !411)
!411 = !{!412, !413, !413}
!412 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!413 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !414, line: 46, baseType: !415)
!414 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!415 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !417, file: !397, line: 134)
!417 = !DISubprogram(name: "atexit", scope: !47, file: !47, line: 592, type: !418, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!418 = !DISubroutineType(types: !419)
!419 = !{!50, !420}
!420 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !406, size: 64)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !422, file: !397, line: 137)
!422 = !DISubprogram(name: "at_quick_exit", scope: !47, file: !47, line: 597, type: !418, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !424, file: !397, line: 140)
!424 = !DISubprogram(name: "atof", scope: !425, file: !425, line: 25, type: !291, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!425 = !DIFile(filename: "/usr/include/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "ce60958b260b171e83db3307f1d644f0")
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !427, file: !397, line: 141)
!427 = !DISubprogram(name: "atoi", scope: !47, file: !47, line: 361, type: !428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!428 = !DISubroutineType(types: !429)
!429 = !{!50, !293}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !431, file: !397, line: 142)
!431 = !DISubprogram(name: "atol", scope: !47, file: !47, line: 366, type: !432, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!432 = !DISubroutineType(types: !433)
!433 = !{!274, !293}
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !435, file: !397, line: 143)
!435 = !DISubprogram(name: "bsearch", scope: !436, file: !436, line: 20, type: !437, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!436 = !DIFile(filename: "/usr/include/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "1a798a38b25adee7bb680abce9ef568a")
!437 = !DISubroutineType(types: !438)
!438 = !{!412, !439, !439, !413, !413, !441}
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !440, size: 64)
!440 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!441 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !47, line: 805, baseType: !442)
!442 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !443, size: 64)
!443 = !DISubroutineType(types: !444)
!444 = !{!50, !439, !439}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !446, file: !397, line: 144)
!446 = !DISubprogram(name: "calloc", scope: !47, file: !47, line: 541, type: !410, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !448, file: !397, line: 145)
!448 = !DISubprogram(name: "div", scope: !47, file: !47, line: 849, type: !449, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!449 = !DISubroutineType(types: !450)
!450 = !{!395, !50, !50}
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !452, file: !397, line: 146)
!452 = !DISubprogram(name: "exit", scope: !47, file: !47, line: 614, type: !453, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!453 = !DISubroutineType(types: !454)
!454 = !{null, !50}
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !456, file: !397, line: 147)
!456 = !DISubprogram(name: "free", scope: !47, file: !47, line: 563, type: !457, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!457 = !DISubroutineType(types: !458)
!458 = !{null, !412}
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !460, file: !397, line: 148)
!460 = !DISubprogram(name: "getenv", scope: !47, file: !47, line: 631, type: !461, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!461 = !DISubroutineType(types: !462)
!462 = !{!463, !293}
!463 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !295, size: 64)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !465, file: !397, line: 149)
!465 = !DISubprogram(name: "labs", scope: !47, file: !47, line: 838, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!466 = !DISubroutineType(types: !467)
!467 = !{!274, !274}
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !469, file: !397, line: 150)
!469 = !DISubprogram(name: "ldiv", scope: !47, file: !47, line: 851, type: !470, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!470 = !DISubroutineType(types: !471)
!471 = !{!399, !274, !274}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !473, file: !397, line: 151)
!473 = !DISubprogram(name: "malloc", scope: !47, file: !47, line: 539, type: !474, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!474 = !DISubroutineType(types: !475)
!475 = !{!412, !413}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !477, file: !397, line: 153)
!477 = !DISubprogram(name: "mblen", scope: !47, file: !47, line: 919, type: !478, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!478 = !DISubroutineType(types: !479)
!479 = !{!50, !293, !413}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !481, file: !397, line: 154)
!481 = !DISubprogram(name: "mbstowcs", scope: !47, file: !47, line: 930, type: !482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!482 = !DISubroutineType(types: !483)
!483 = !{!413, !484, !487, !413}
!484 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !485)
!485 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !486, size: 64)
!486 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!487 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !293)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !489, file: !397, line: 155)
!489 = !DISubprogram(name: "mbtowc", scope: !47, file: !47, line: 922, type: !490, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!490 = !DISubroutineType(types: !491)
!491 = !{!50, !484, !487, !413}
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !493, file: !397, line: 157)
!493 = !DISubprogram(name: "qsort", scope: !47, file: !47, line: 827, type: !494, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!494 = !DISubroutineType(types: !495)
!495 = !{null, !412, !413, !413, !441}
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !497, file: !397, line: 160)
!497 = !DISubprogram(name: "quick_exit", scope: !47, file: !47, line: 620, type: !453, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !499, file: !397, line: 163)
!499 = !DISubprogram(name: "rand", scope: !47, file: !47, line: 453, type: !500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!500 = !DISubroutineType(types: !501)
!501 = !{!50}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !503, file: !397, line: 164)
!503 = !DISubprogram(name: "realloc", scope: !47, file: !47, line: 549, type: !504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!504 = !DISubroutineType(types: !505)
!505 = !{!412, !412, !413}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !507, file: !397, line: 165)
!507 = !DISubprogram(name: "srand", scope: !47, file: !47, line: 455, type: !508, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!508 = !DISubroutineType(types: !509)
!509 = !{null, !6}
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !511, file: !397, line: 166)
!511 = !DISubprogram(name: "strtod", scope: !47, file: !47, line: 117, type: !512, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!512 = !DISubroutineType(types: !513)
!513 = !{!57, !487, !514}
!514 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !515)
!515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !463, size: 64)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !517, file: !397, line: 167)
!517 = !DISubprogram(name: "strtol", scope: !47, file: !47, line: 176, type: !518, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!518 = !DISubroutineType(types: !519)
!519 = !{!274, !487, !514, !50}
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !521, file: !397, line: 168)
!521 = !DISubprogram(name: "strtoul", scope: !47, file: !47, line: 180, type: !522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!522 = !DISubroutineType(types: !523)
!523 = !{!415, !487, !514, !50}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !525, file: !397, line: 169)
!525 = !DISubprogram(name: "system", scope: !47, file: !47, line: 781, type: !428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !527, file: !397, line: 171)
!527 = !DISubprogram(name: "wcstombs", scope: !47, file: !47, line: 933, type: !528, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!528 = !DISubroutineType(types: !529)
!529 = !{!413, !530, !531, !413}
!530 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !463)
!531 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !532)
!532 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !533, size: 64)
!533 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !486)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !535, file: !397, line: 172)
!535 = !DISubprogram(name: "wctomb", scope: !47, file: !47, line: 926, type: !536, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!536 = !DISubroutineType(types: !537)
!537 = !{!50, !463, !486}
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !539, file: !397, line: 200)
!539 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !47, line: 80, baseType: !540)
!540 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !47, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !541, identifier: "_ZTS7lldiv_t")
!541 = !{!542, !543}
!542 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !540, file: !47, line: 78, baseType: !27, size: 64)
!543 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !540, file: !47, line: 79, baseType: !27, size: 64, offset: 64)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !545, file: !397, line: 206)
!545 = !DISubprogram(name: "_Exit", scope: !47, file: !47, line: 626, type: !453, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !547, file: !397, line: 210)
!547 = !DISubprogram(name: "llabs", scope: !47, file: !47, line: 841, type: !548, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!548 = !DISubroutineType(types: !549)
!549 = !{!27, !27}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !551, file: !397, line: 216)
!551 = !DISubprogram(name: "lldiv", scope: !47, file: !47, line: 855, type: !552, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!552 = !DISubroutineType(types: !553)
!553 = !{!539, !27, !27}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !555, file: !397, line: 227)
!555 = !DISubprogram(name: "atoll", scope: !47, file: !47, line: 373, type: !556, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!556 = !DISubroutineType(types: !557)
!557 = !{!27, !293}
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !559, file: !397, line: 228)
!559 = !DISubprogram(name: "strtoll", scope: !47, file: !47, line: 200, type: !560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!560 = !DISubroutineType(types: !561)
!561 = !{!27, !487, !514, !50}
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !563, file: !397, line: 229)
!563 = !DISubprogram(name: "strtoull", scope: !47, file: !47, line: 205, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!564 = !DISubroutineType(types: !565)
!565 = !{!566, !487, !514, !50}
!566 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !568, file: !397, line: 231)
!568 = !DISubprogram(name: "strtof", scope: !47, file: !47, line: 123, type: !569, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!569 = !DISubroutineType(types: !570)
!570 = !{!116, !487, !514}
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !572, file: !397, line: 232)
!572 = !DISubprogram(name: "strtold", scope: !47, file: !47, line: 126, type: !573, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!573 = !DISubroutineType(types: !574)
!574 = !{!127, !487, !514}
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !539, file: !397, line: 240)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !545, file: !397, line: 242)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !547, file: !397, line: 244)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !579, file: !397, line: 245)
!579 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !5, file: !397, line: 213, type: !552, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !551, file: !397, line: 246)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !555, file: !397, line: 248)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !568, file: !397, line: 249)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !559, file: !397, line: 250)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !563, file: !397, line: 251)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !572, file: !397, line: 252)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !405, file: !587, line: 38)
!587 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "74812296ae1ebf65f0c19983efc04bc1")
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !417, file: !587, line: 39)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !452, file: !587, line: 40)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !422, file: !587, line: 43)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !497, file: !587, line: 46)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !395, file: !587, line: 51)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !399, file: !587, line: 52)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !595, file: !587, line: 54)
!595 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !45, file: !51, line: 79, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
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
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !621, file: !622, line: 58)
!621 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !623, file: !622, line: 80, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!622 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "9bda7d21a11cfdb902745e8f6fa7810a")
!623 = !DINamespace(name: "__exception_ptr", scope: !45)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !623, entity: !625, file: !622, line: 74)
!625 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !45, file: !622, line: 70, type: !626, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!626 = !DISubroutineType(types: !627)
!627 = !{null, !621}
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !629, file: !630, line: 200)
!629 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !630, file: !630, line: 28, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!630 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !632, file: !630, line: 201)
!632 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !630, file: !630, line: 32, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !634, file: !630, line: 202)
!634 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !630, file: !630, line: 34, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !636, file: !630, line: 203)
!636 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !630, file: !630, line: 36, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !638, file: !630, line: 204)
!638 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !630, file: !630, line: 38, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !640, file: !630, line: 205)
!640 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !630, file: !630, line: 42, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !642, file: !630, line: 206)
!642 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !630, file: !630, line: 40, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !644, file: !630, line: 207)
!644 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !630, file: !630, line: 44, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !646, file: !630, line: 208)
!646 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !630, file: !630, line: 46, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !648, file: !630, line: 209)
!648 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !630, file: !630, line: 48, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !650, file: !630, line: 210)
!650 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !630, file: !630, line: 50, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !652, file: !630, line: 211)
!652 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !630, file: !630, line: 52, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !654, file: !630, line: 212)
!654 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !630, file: !630, line: 54, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !656, file: !630, line: 213)
!656 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !630, file: !630, line: 58, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !658, file: !630, line: 214)
!658 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !630, file: !630, line: 56, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !660, file: !630, line: 215)
!660 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !630, file: !630, line: 62, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !662, file: !630, line: 216)
!662 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !630, file: !630, line: 60, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !664, file: !630, line: 217)
!664 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !630, file: !630, line: 64, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !666, file: !630, line: 218)
!666 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !630, file: !630, line: 66, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !668, file: !630, line: 219)
!668 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !630, file: !630, line: 68, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !670, file: !630, line: 220)
!670 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !630, file: !630, line: 70, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !672, file: !630, line: 221)
!672 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !630, file: !630, line: 72, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !674, file: !630, line: 222)
!674 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !630, file: !630, line: 74, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !676, file: !630, line: 223)
!676 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !630, file: !630, line: 76, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !678, file: !630, line: 224)
!678 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !630, file: !630, line: 78, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !680, file: !630, line: 225)
!680 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !630, file: !630, line: 80, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !682, file: !630, line: 226)
!682 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !630, file: !630, line: 82, type: !683, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!683 = !DISubroutineType(types: !684)
!684 = !{!116, !116, !85}
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !686, file: !630, line: 227)
!686 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !630, file: !630, line: 84, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !688, file: !630, line: 228)
!688 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !630, file: !630, line: 86, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !690, file: !630, line: 229)
!690 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !630, file: !630, line: 91, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!691 = !DISubroutineType(types: !692)
!692 = !{!693, !116}
!693 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !695, file: !630, line: 230)
!695 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !630, file: !630, line: 95, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!696 = !DISubroutineType(types: !697)
!697 = !{!693, !116, !116}
!698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !699, file: !630, line: 231)
!699 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !630, file: !630, line: 94, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !701, file: !630, line: 232)
!701 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !630, file: !630, line: 100, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !703, file: !630, line: 233)
!703 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !630, file: !630, line: 104, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !705, file: !630, line: 234)
!705 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !630, file: !630, line: 103, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !707, file: !630, line: 235)
!707 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !630, file: !630, line: 106, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !709, file: !630, line: 236)
!709 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !630, file: !630, line: 111, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !711, file: !630, line: 237)
!711 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !630, file: !630, line: 113, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !713, file: !630, line: 238)
!713 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !630, file: !630, line: 115, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !715, file: !630, line: 239)
!715 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !630, file: !630, line: 116, type: !466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !717, file: !630, line: 240)
!717 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !630, file: !630, line: 118, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !719, file: !630, line: 241)
!719 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !630, file: !630, line: 120, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !721, file: !630, line: 242)
!721 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !630, file: !630, line: 121, type: !548, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !723, file: !630, line: 243)
!723 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !630, file: !630, line: 123, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !725, file: !630, line: 244)
!725 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !630, file: !630, line: 133, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !727, file: !630, line: 245)
!727 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !630, file: !630, line: 125, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !729, file: !630, line: 246)
!729 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !630, file: !630, line: 127, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !731, file: !630, line: 247)
!731 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !630, file: !630, line: 129, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !733, file: !630, line: 248)
!733 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !630, file: !630, line: 131, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !735, file: !630, line: 249)
!735 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !630, file: !630, line: 135, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !737, file: !630, line: 250)
!737 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !630, file: !630, line: 137, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !739, file: !630, line: 251)
!739 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !630, file: !630, line: 138, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !741, file: !630, line: 252)
!741 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !630, file: !630, line: 140, type: !742, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!742 = !DISubroutineType(types: !743)
!743 = !{!116, !116, !744}
!744 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !746, file: !630, line: 253)
!746 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !630, file: !630, line: 141, type: !291, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !748, file: !630, line: 254)
!748 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !630, file: !630, line: 142, type: !298, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !750, file: !630, line: 255)
!750 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !630, file: !630, line: 144, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !752, file: !630, line: 256)
!752 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !630, file: !630, line: 146, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !754, file: !630, line: 257)
!754 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !630, file: !630, line: 150, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !756, file: !630, line: 258)
!756 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !630, file: !630, line: 152, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !758, file: !630, line: 259)
!758 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !630, file: !630, line: 154, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !760, file: !630, line: 260)
!760 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !630, file: !630, line: 156, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !762, file: !630, line: 261)
!762 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !630, file: !630, line: 158, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !764, file: !630, line: 262)
!764 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !630, file: !630, line: 160, type: !362, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !766, file: !630, line: 263)
!766 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !630, file: !630, line: 162, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !768, file: !630, line: 264)
!768 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !630, file: !630, line: 167, type: !691, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !770, file: !630, line: 265)
!770 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !630, file: !630, line: 169, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !772, file: !630, line: 266)
!772 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !630, file: !630, line: 171, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !774, file: !630, line: 267)
!774 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !630, file: !630, line: 173, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !776, file: !630, line: 268)
!776 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !630, file: !630, line: 175, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !778, file: !630, line: 269)
!778 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !630, file: !630, line: 177, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !780, file: !630, line: 270)
!780 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !630, file: !630, line: 179, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !782, file: !630, line: 271)
!782 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !630, file: !630, line: 181, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !784, file: !786, line: 729)
!784 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !785, file: !785, line: 188, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!785 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "77b108a711ff1d970d6aaeeab7921660")
!786 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "0af09435178b3f6de185f06c3a9cbb63")
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !788, file: !786, line: 730)
!788 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !785, file: !785, line: 191, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !790, file: !786, line: 731)
!790 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !785, file: !785, line: 194, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !792, file: !786, line: 732)
!792 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !785, file: !785, line: 197, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !794, file: !786, line: 733)
!794 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !785, file: !785, line: 200, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !796, file: !786, line: 734)
!796 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !785, file: !785, line: 203, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !798, file: !786, line: 735)
!798 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !785, file: !785, line: 206, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !800, file: !786, line: 736)
!800 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !785, file: !785, line: 209, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !802, file: !786, line: 737)
!802 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !785, file: !785, line: 212, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !804, file: !786, line: 738)
!804 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !785, file: !785, line: 215, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !806, file: !786, line: 739)
!806 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !785, file: !785, line: 218, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !808, file: !786, line: 740)
!808 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !785, file: !785, line: 221, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !810, file: !786, line: 741)
!810 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !785, file: !785, line: 233, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !812, file: !786, line: 742)
!812 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !785, file: !785, line: 242, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !814, file: !786, line: 743)
!814 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !785, file: !785, line: 251, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !816, file: !786, line: 744)
!816 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !785, file: !785, line: 254, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !818, file: !786, line: 745)
!818 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !785, file: !785, line: 257, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !820, file: !786, line: 746)
!820 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !785, file: !785, line: 260, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !822, file: !786, line: 747)
!822 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !785, file: !785, line: 263, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !824, file: !786, line: 748)
!824 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !785, file: !785, line: 269, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !826, file: !786, line: 749)
!826 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !785, file: !785, line: 272, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !828, file: !786, line: 750)
!828 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !785, file: !785, line: 277, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !830, file: !786, line: 751)
!830 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !785, file: !785, line: 280, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !832, file: !786, line: 752)
!832 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !785, file: !785, line: 283, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !834, file: !786, line: 753)
!834 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !785, file: !785, line: 286, type: !683, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !836, file: !786, line: 754)
!836 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !785, file: !785, line: 299, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !838, file: !786, line: 755)
!838 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !785, file: !785, line: 302, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !840, file: !786, line: 756)
!840 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !785, file: !785, line: 341, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !842, file: !786, line: 757)
!842 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !785, file: !785, line: 344, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !844, file: !786, line: 758)
!844 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !785, file: !785, line: 347, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !846, file: !786, line: 759)
!846 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !785, file: !785, line: 350, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !848, file: !786, line: 760)
!848 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !785, file: !785, line: 353, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !850, file: !786, line: 761)
!850 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !785, file: !785, line: 356, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !852, file: !786, line: 762)
!852 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !785, file: !785, line: 359, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !854, file: !786, line: 763)
!854 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !785, file: !785, line: 365, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !856, file: !786, line: 764)
!856 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !785, file: !785, line: 368, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !858, file: !786, line: 765)
!858 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !785, file: !785, line: 371, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !860, file: !786, line: 766)
!860 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !785, file: !785, line: 374, type: !277, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !862, file: !786, line: 767)
!862 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !785, file: !785, line: 377, type: !742, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !864, file: !786, line: 768)
!864 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !785, file: !785, line: 413, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !866, file: !786, line: 769)
!866 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !785, file: !785, line: 416, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !868, file: !786, line: 771)
!868 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !785, file: !785, line: 449, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !870, file: !786, line: 772)
!870 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !785, file: !785, line: 474, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !872, file: !786, line: 773)
!872 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !785, file: !785, line: 479, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !874, file: !786, line: 774)
!874 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !785, file: !785, line: 495, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !876, file: !786, line: 775)
!876 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !785, file: !785, line: 520, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !878, file: !786, line: 776)
!878 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !785, file: !785, line: 526, type: !362, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !880, file: !786, line: 777)
!880 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !785, file: !785, line: 532, type: !372, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !882, file: !786, line: 778)
!882 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !785, file: !785, line: 560, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !884, file: !786, line: 779)
!884 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !785, file: !785, line: 563, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !886, file: !786, line: 780)
!886 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !785, file: !785, line: 569, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !888, file: !786, line: 781)
!888 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !785, file: !785, line: 572, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !890, file: !786, line: 782)
!890 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !785, file: !785, line: 575, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !892, file: !786, line: 783)
!892 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !785, file: !785, line: 578, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !894, file: !786, line: 784)
!894 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !785, file: !785, line: 581, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !896, file: !911, line: 64)
!896 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !897, line: 6, baseType: !898)
!897 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!898 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !899, line: 21, baseType: !900)
!899 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!900 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !899, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !901, identifier: "_ZTS11__mbstate_t")
!901 = !{!902, !903}
!902 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !900, file: !899, line: 15, baseType: !50, size: 32)
!903 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !900, file: !899, line: 20, baseType: !904, size: 32, offset: 32)
!904 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !900, file: !899, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !905, identifier: "_ZTSN11__mbstate_tUt_E")
!905 = !{!906, !907}
!906 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !904, file: !899, line: 18, baseType: !6, size: 32)
!907 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !904, file: !899, line: 19, baseType: !908, size: 32)
!908 = !DICompositeType(tag: DW_TAG_array_type, baseType: !295, size: 32, elements: !909)
!909 = !{!910}
!910 = !DISubrange(count: 4)
!911 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cwchar", directory: "")
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !913, file: !911, line: 141)
!913 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !914, line: 20, baseType: !6)
!914 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !916, file: !911, line: 143)
!916 = !DISubprogram(name: "btowc", scope: !917, file: !917, line: 318, type: !918, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!917 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "5c0512b032e303d7adfb2a47454ecb1c")
!918 = !DISubroutineType(types: !919)
!919 = !{!913, !50}
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !921, file: !911, line: 144)
!921 = !DISubprogram(name: "fgetwc", scope: !917, file: !917, line: 727, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!922 = !DISubroutineType(types: !923)
!923 = !{!913, !924}
!924 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !925, size: 64)
!925 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !926, line: 5, baseType: !927)
!926 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!927 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !928, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !929, identifier: "_ZTS8_IO_FILE")
!928 = !DIFile(filename: "/usr/include/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "58de959587374b9ee900baa441e1355b")
!929 = !{!930, !931, !932, !933, !934, !935, !936, !937, !938, !939, !940, !941, !942, !945, !947, !948, !949, !951, !953, !955, !959, !962, !964, !967, !970, !971, !972, !973, !974}
!930 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !927, file: !928, line: 51, baseType: !50, size: 32)
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
!947 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !927, file: !928, line: 72, baseType: !50, size: 32, offset: 896)
!948 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !927, file: !928, line: 73, baseType: !50, size: 32, offset: 928)
!949 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !927, file: !928, line: 74, baseType: !950, size: 64, offset: 960)
!950 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !36, line: 150, baseType: !274)
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
!963 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !36, line: 151, baseType: !274)
!964 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !927, file: !928, line: 91, baseType: !965, size: 64, offset: 1216)
!965 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !966, size: 64)
!966 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !928, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!967 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !927, file: !928, line: 92, baseType: !968, size: 64, offset: 1280)
!968 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !969, size: 64)
!969 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !928, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!970 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !927, file: !928, line: 93, baseType: !946, size: 64, offset: 1344)
!971 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !927, file: !928, line: 94, baseType: !412, size: 64, offset: 1408)
!972 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !927, file: !928, line: 95, baseType: !413, size: 64, offset: 1472)
!973 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !927, file: !928, line: 96, baseType: !50, size: 32, offset: 1536)
!974 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !927, file: !928, line: 98, baseType: !975, size: 160, offset: 1568)
!975 = !DICompositeType(tag: DW_TAG_array_type, baseType: !295, size: 160, elements: !976)
!976 = !{!977}
!977 = !DISubrange(count: 20)
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !979, file: !911, line: 145)
!979 = !DISubprogram(name: "fgetws", scope: !917, file: !917, line: 756, type: !980, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!980 = !DISubroutineType(types: !981)
!981 = !{!485, !484, !50, !982}
!982 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !924)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !984, file: !911, line: 146)
!984 = !DISubprogram(name: "fputwc", scope: !917, file: !917, line: 741, type: !985, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!985 = !DISubroutineType(types: !986)
!986 = !{!913, !486, !924}
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !988, file: !911, line: 147)
!988 = !DISubprogram(name: "fputws", scope: !917, file: !917, line: 763, type: !989, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!989 = !DISubroutineType(types: !990)
!990 = !{!50, !531, !982}
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !992, file: !911, line: 148)
!992 = !DISubprogram(name: "fwide", scope: !917, file: !917, line: 573, type: !993, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!993 = !DISubroutineType(types: !994)
!994 = !{!50, !924, !50}
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !996, file: !911, line: 149)
!996 = !DISubprogram(name: "fwprintf", scope: !917, file: !917, line: 580, type: !997, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!997 = !DISubroutineType(types: !998)
!998 = !{!50, !982, !531, null}
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1000, file: !911, line: 150)
!1000 = !DISubprogram(name: "fwscanf", scope: !917, file: !917, line: 621, type: !997, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1002, file: !911, line: 151)
!1002 = !DISubprogram(name: "getwc", scope: !917, file: !917, line: 728, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1004, file: !911, line: 152)
!1004 = !DISubprogram(name: "getwchar", scope: !917, file: !917, line: 734, type: !1005, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1005 = !DISubroutineType(types: !1006)
!1006 = !{!913}
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1008, file: !911, line: 153)
!1008 = !DISubprogram(name: "mbrlen", scope: !917, file: !917, line: 329, type: !1009, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1009 = !DISubroutineType(types: !1010)
!1010 = !{!413, !487, !413, !1011}
!1011 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1012)
!1012 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !896, size: 64)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1014, file: !911, line: 154)
!1014 = !DISubprogram(name: "mbrtowc", scope: !917, file: !917, line: 296, type: !1015, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!413, !484, !487, !413, !1011}
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1018, file: !911, line: 155)
!1018 = !DISubprogram(name: "mbsinit", scope: !917, file: !917, line: 292, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!50, !1021}
!1021 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1022, size: 64)
!1022 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !896)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1024, file: !911, line: 156)
!1024 = !DISubprogram(name: "mbsrtowcs", scope: !917, file: !917, line: 337, type: !1025, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{!413, !484, !1027, !413, !1011}
!1027 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1028)
!1028 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !293, size: 64)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1030, file: !911, line: 157)
!1030 = !DISubprogram(name: "putwc", scope: !917, file: !917, line: 742, type: !985, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1032, file: !911, line: 158)
!1032 = !DISubprogram(name: "putwchar", scope: !917, file: !917, line: 748, type: !1033, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{!913, !486}
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1036, file: !911, line: 160)
!1036 = !DISubprogram(name: "swprintf", scope: !917, file: !917, line: 590, type: !1037, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1037 = !DISubroutineType(types: !1038)
!1038 = !{!50, !484, !413, !531, null}
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1040, file: !911, line: 162)
!1040 = !DISubprogram(name: "swscanf", scope: !917, file: !917, line: 631, type: !1041, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{!50, !531, !531, null}
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1044, file: !911, line: 163)
!1044 = !DISubprogram(name: "ungetwc", scope: !917, file: !917, line: 771, type: !1045, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!913, !913, !924}
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1048, file: !911, line: 164)
!1048 = !DISubprogram(name: "vfwprintf", scope: !917, file: !917, line: 598, type: !1049, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!50, !982, !531, !1051}
!1051 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1052, line: 32, baseType: !1053)
!1052 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stdarg.h", directory: "", checksumkind: CSK_MD5, checksum: "4de3cbd931b589d291e5c39387aecf82")
!1053 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1054, baseType: !463)
!1054 = !DIFile(filename: "test/clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard")
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1056, file: !911, line: 166)
!1056 = !DISubprogram(name: "vfwscanf", scope: !917, file: !917, line: 673, type: !1049, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1058, file: !911, line: 169)
!1058 = !DISubprogram(name: "vswprintf", scope: !917, file: !917, line: 611, type: !1059, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1059 = !DISubroutineType(types: !1060)
!1060 = !{!50, !484, !413, !531, !1051}
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1062, file: !911, line: 172)
!1062 = !DISubprogram(name: "vswscanf", scope: !917, file: !917, line: 685, type: !1063, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1063 = !DISubroutineType(types: !1064)
!1064 = !{!50, !531, !531, !1051}
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1066, file: !911, line: 174)
!1066 = !DISubprogram(name: "vwprintf", scope: !917, file: !917, line: 606, type: !1067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!50, !531, !1051}
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1070, file: !911, line: 176)
!1070 = !DISubprogram(name: "vwscanf", scope: !917, file: !917, line: 681, type: !1067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1072, file: !911, line: 178)
!1072 = !DISubprogram(name: "wcrtomb", scope: !917, file: !917, line: 301, type: !1073, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1073 = !DISubroutineType(types: !1074)
!1074 = !{!413, !530, !486, !1011}
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1076, file: !911, line: 179)
!1076 = !DISubprogram(name: "wcscat", scope: !917, file: !917, line: 97, type: !1077, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1077 = !DISubroutineType(types: !1078)
!1078 = !{!485, !484, !531}
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1080, file: !911, line: 180)
!1080 = !DISubprogram(name: "wcscmp", scope: !917, file: !917, line: 106, type: !1081, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1081 = !DISubroutineType(types: !1082)
!1082 = !{!50, !532, !532}
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1084, file: !911, line: 181)
!1084 = !DISubprogram(name: "wcscoll", scope: !917, file: !917, line: 131, type: !1081, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1086, file: !911, line: 182)
!1086 = !DISubprogram(name: "wcscpy", scope: !917, file: !917, line: 87, type: !1077, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1088, file: !911, line: 183)
!1088 = !DISubprogram(name: "wcscspn", scope: !917, file: !917, line: 187, type: !1089, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1089 = !DISubroutineType(types: !1090)
!1090 = !{!413, !532, !532}
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1092, file: !911, line: 184)
!1092 = !DISubprogram(name: "wcsftime", scope: !917, file: !917, line: 835, type: !1093, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1093 = !DISubroutineType(types: !1094)
!1094 = !{!413, !484, !413, !531, !1095}
!1095 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1096)
!1096 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1097, size: 64)
!1097 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1098)
!1098 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !917, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1100, file: !911, line: 185)
!1100 = !DISubprogram(name: "wcslen", scope: !917, file: !917, line: 222, type: !1101, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1101 = !DISubroutineType(types: !1102)
!1102 = !{!413, !532}
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1104, file: !911, line: 186)
!1104 = !DISubprogram(name: "wcsncat", scope: !917, file: !917, line: 101, type: !1105, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1105 = !DISubroutineType(types: !1106)
!1106 = !{!485, !484, !531, !413}
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1108, file: !911, line: 187)
!1108 = !DISubprogram(name: "wcsncmp", scope: !917, file: !917, line: 109, type: !1109, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1109 = !DISubroutineType(types: !1110)
!1110 = !{!50, !532, !532, !413}
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1112, file: !911, line: 188)
!1112 = !DISubprogram(name: "wcsncpy", scope: !917, file: !917, line: 92, type: !1105, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1114, file: !911, line: 189)
!1114 = !DISubprogram(name: "wcsrtombs", scope: !917, file: !917, line: 343, type: !1115, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{!413, !530, !1117, !413, !1011}
!1117 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1118)
!1118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !532, size: 64)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1120, file: !911, line: 190)
!1120 = !DISubprogram(name: "wcsspn", scope: !917, file: !917, line: 191, type: !1089, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1122, file: !911, line: 191)
!1122 = !DISubprogram(name: "wcstod", scope: !917, file: !917, line: 377, type: !1123, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{!57, !531, !1125}
!1125 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1126)
!1126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !485, size: 64)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1128, file: !911, line: 193)
!1128 = !DISubprogram(name: "wcstof", scope: !917, file: !917, line: 382, type: !1129, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!116, !531, !1125}
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1132, file: !911, line: 195)
!1132 = !DISubprogram(name: "wcstok", scope: !917, file: !917, line: 217, type: !1133, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1133 = !DISubroutineType(types: !1134)
!1134 = !{!485, !484, !531, !1125}
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1136, file: !911, line: 196)
!1136 = !DISubprogram(name: "wcstol", scope: !917, file: !917, line: 428, type: !1137, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{!274, !531, !1125, !50}
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1140, file: !911, line: 197)
!1140 = !DISubprogram(name: "wcstoul", scope: !917, file: !917, line: 433, type: !1141, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!415, !531, !1125, !50}
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1144, file: !911, line: 198)
!1144 = !DISubprogram(name: "wcsxfrm", scope: !917, file: !917, line: 135, type: !1145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1145 = !DISubroutineType(types: !1146)
!1146 = !{!413, !484, !531, !413}
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1148, file: !911, line: 199)
!1148 = !DISubprogram(name: "wctob", scope: !917, file: !917, line: 324, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!50, !913}
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1152, file: !911, line: 200)
!1152 = !DISubprogram(name: "wmemcmp", scope: !917, file: !917, line: 258, type: !1109, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1154, file: !911, line: 201)
!1154 = !DISubprogram(name: "wmemcpy", scope: !917, file: !917, line: 262, type: !1105, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1156, file: !911, line: 202)
!1156 = !DISubprogram(name: "wmemmove", scope: !917, file: !917, line: 267, type: !1157, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1157 = !DISubroutineType(types: !1158)
!1158 = !{!485, !485, !532, !413}
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1160, file: !911, line: 203)
!1160 = !DISubprogram(name: "wmemset", scope: !917, file: !917, line: 271, type: !1161, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1161 = !DISubroutineType(types: !1162)
!1162 = !{!485, !485, !486, !413}
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1164, file: !911, line: 204)
!1164 = !DISubprogram(name: "wprintf", scope: !917, file: !917, line: 587, type: !1165, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1165 = !DISubroutineType(types: !1166)
!1166 = !{!50, !531, null}
!1167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1168, file: !911, line: 205)
!1168 = !DISubprogram(name: "wscanf", scope: !917, file: !917, line: 628, type: !1165, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1170, file: !911, line: 206)
!1170 = !DISubprogram(name: "wcschr", scope: !917, file: !917, line: 164, type: !1171, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1171 = !DISubroutineType(types: !1172)
!1172 = !{!485, !532, !486}
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1174, file: !911, line: 207)
!1174 = !DISubprogram(name: "wcspbrk", scope: !917, file: !917, line: 201, type: !1175, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1175 = !DISubroutineType(types: !1176)
!1176 = !{!485, !532, !532}
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1178, file: !911, line: 208)
!1178 = !DISubprogram(name: "wcsrchr", scope: !917, file: !917, line: 174, type: !1171, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1180, file: !911, line: 209)
!1180 = !DISubprogram(name: "wcsstr", scope: !917, file: !917, line: 212, type: !1175, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1182, file: !911, line: 210)
!1182 = !DISubprogram(name: "wmemchr", scope: !917, file: !917, line: 253, type: !1183, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1183 = !DISubroutineType(types: !1184)
!1184 = !{!485, !532, !486, !413}
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1186, file: !911, line: 251)
!1186 = !DISubprogram(name: "wcstold", scope: !917, file: !917, line: 384, type: !1187, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1187 = !DISubroutineType(types: !1188)
!1188 = !{!127, !531, !1125}
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1190, file: !911, line: 260)
!1190 = !DISubprogram(name: "wcstoll", scope: !917, file: !917, line: 441, type: !1191, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{!27, !531, !1125, !50}
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1194, file: !911, line: 261)
!1194 = !DISubprogram(name: "wcstoull", scope: !917, file: !917, line: 448, type: !1195, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1195 = !DISubroutineType(types: !1196)
!1196 = !{!566, !531, !1125, !50}
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1186, file: !911, line: 267)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1190, file: !911, line: 268)
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1194, file: !911, line: 269)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1128, file: !911, line: 283)
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1056, file: !911, line: 286)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1062, file: !911, line: 289)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1070, file: !911, line: 292)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1186, file: !911, line: 296)
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1190, file: !911, line: 297)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1194, file: !911, line: 298)
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1208, file: !1211, line: 47)
!1208 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1209, line: 24, baseType: !1210)
!1209 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "457547631e07cd24d9a14c8410e28e57")
!1210 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !36, line: 36, baseType: !954)
!1211 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdint", directory: "")
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1213, file: !1211, line: 48)
!1213 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1209, line: 25, baseType: !1214)
!1214 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !36, line: 38, baseType: !1215)
!1215 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1217, file: !1211, line: 49)
!1217 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1209, line: 26, baseType: !1218)
!1218 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !36, line: 40, baseType: !50)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1220, file: !1211, line: 50)
!1220 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1209, line: 27, baseType: !1221)
!1221 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !36, line: 43, baseType: !274)
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1223, file: !1211, line: 52)
!1223 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1224, line: 58, baseType: !954)
!1224 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "5faa52c8a2d48b1d936594c77c73ce42")
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1226, file: !1211, line: 53)
!1226 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1224, line: 60, baseType: !274)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1228, file: !1211, line: 54)
!1228 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1224, line: 61, baseType: !274)
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1230, file: !1211, line: 55)
!1230 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1224, line: 62, baseType: !274)
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1232, file: !1211, line: 57)
!1232 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1224, line: 43, baseType: !1233)
!1233 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !36, line: 51, baseType: !1210)
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1235, file: !1211, line: 58)
!1235 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1224, line: 44, baseType: !1236)
!1236 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !36, line: 53, baseType: !1214)
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1238, file: !1211, line: 59)
!1238 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1224, line: 45, baseType: !1239)
!1239 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !36, line: 55, baseType: !1218)
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1241, file: !1211, line: 60)
!1241 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1224, line: 46, baseType: !1242)
!1242 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !36, line: 57, baseType: !1221)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1244, file: !1211, line: 62)
!1244 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1224, line: 101, baseType: !1245)
!1245 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !36, line: 71, baseType: !274)
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1247, file: !1211, line: 63)
!1247 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1224, line: 87, baseType: !274)
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1249, file: !1211, line: 65)
!1249 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !34, line: 24, baseType: !1250)
!1250 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !36, line: 37, baseType: !1251)
!1251 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1253, file: !1211, line: 66)
!1253 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !34, line: 25, baseType: !1254)
!1254 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !36, line: 39, baseType: !952)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !33, file: !1211, line: 67)
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1257, file: !1211, line: 68)
!1257 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !34, line: 27, baseType: !1258)
!1258 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !36, line: 44, baseType: !415)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1260, file: !1211, line: 70)
!1260 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1224, line: 71, baseType: !1251)
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1262, file: !1211, line: 71)
!1262 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1224, line: 73, baseType: !415)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1264, file: !1211, line: 72)
!1264 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1224, line: 74, baseType: !415)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1266, file: !1211, line: 73)
!1266 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1224, line: 75, baseType: !415)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1268, file: !1211, line: 75)
!1268 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1224, line: 49, baseType: !1269)
!1269 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !36, line: 52, baseType: !1250)
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1271, file: !1211, line: 76)
!1271 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1224, line: 50, baseType: !1272)
!1272 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !36, line: 54, baseType: !1254)
!1273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1274, file: !1211, line: 77)
!1274 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1224, line: 51, baseType: !1275)
!1275 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !36, line: 56, baseType: !35)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1277, file: !1211, line: 78)
!1277 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1224, line: 52, baseType: !1278)
!1278 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !36, line: 58, baseType: !1258)
!1279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1280, file: !1211, line: 80)
!1280 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1224, line: 102, baseType: !1281)
!1281 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !36, line: 72, baseType: !415)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1283, file: !1211, line: 81)
!1283 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1224, line: 90, baseType: !415)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1285, file: !1287, line: 53)
!1285 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1286, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1286 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "0595275e3f5b502d28f7cd61a0dff888")
!1287 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/clocale", directory: "")
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1289, file: !1287, line: 54)
!1289 = !DISubprogram(name: "setlocale", scope: !1286, file: !1286, line: 122, type: !1290, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!463, !50, !293}
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1293, file: !1287, line: 55)
!1293 = !DISubprogram(name: "localeconv", scope: !1286, file: !1286, line: 125, type: !1294, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1294 = !DISubroutineType(types: !1295)
!1295 = !{!1296}
!1296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1285, size: 64)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1298, file: !1300, line: 64)
!1298 = !DISubprogram(name: "isalnum", scope: !1299, file: !1299, line: 108, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1299 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "c67c809b09ef8ea9c273687bc20a7fd3")
!1300 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cctype", directory: "")
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1302, file: !1300, line: 65)
!1302 = !DISubprogram(name: "isalpha", scope: !1299, file: !1299, line: 109, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1304, file: !1300, line: 66)
!1304 = !DISubprogram(name: "iscntrl", scope: !1299, file: !1299, line: 110, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1306, file: !1300, line: 67)
!1306 = !DISubprogram(name: "isdigit", scope: !1299, file: !1299, line: 111, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1308, file: !1300, line: 68)
!1308 = !DISubprogram(name: "isgraph", scope: !1299, file: !1299, line: 113, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1310, file: !1300, line: 69)
!1310 = !DISubprogram(name: "islower", scope: !1299, file: !1299, line: 112, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1312, file: !1300, line: 70)
!1312 = !DISubprogram(name: "isprint", scope: !1299, file: !1299, line: 114, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1314, file: !1300, line: 71)
!1314 = !DISubprogram(name: "ispunct", scope: !1299, file: !1299, line: 115, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1316, file: !1300, line: 72)
!1316 = !DISubprogram(name: "isspace", scope: !1299, file: !1299, line: 116, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1318, file: !1300, line: 73)
!1318 = !DISubprogram(name: "isupper", scope: !1299, file: !1299, line: 117, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1320, file: !1300, line: 74)
!1320 = !DISubprogram(name: "isxdigit", scope: !1299, file: !1299, line: 118, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1322, file: !1300, line: 75)
!1322 = !DISubprogram(name: "tolower", scope: !1299, file: !1299, line: 122, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1324, file: !1300, line: 76)
!1324 = !DISubprogram(name: "toupper", scope: !1299, file: !1299, line: 125, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1326, file: !1300, line: 87)
!1326 = !DISubprogram(name: "isblank", scope: !1299, file: !1299, line: 130, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1328, file: !1330, line: 98)
!1328 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1329, line: 7, baseType: !927)
!1329 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1330 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdio", directory: "")
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1332, file: !1330, line: 99)
!1332 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1333, line: 84, baseType: !1334)
!1333 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "75d393d9743f4e6c39653f794c599a10")
!1334 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1335, line: 14, baseType: !1336)
!1335 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1336 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1335, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1338, file: !1330, line: 101)
!1338 = !DISubprogram(name: "clearerr", scope: !1333, file: !1333, line: 763, type: !1339, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1339 = !DISubroutineType(types: !1340)
!1340 = !{null, !1341}
!1341 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1328, size: 64)
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1343, file: !1330, line: 102)
!1343 = !DISubprogram(name: "fclose", scope: !1333, file: !1333, line: 213, type: !1344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1344 = !DISubroutineType(types: !1345)
!1345 = !{!50, !1341}
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1347, file: !1330, line: 103)
!1347 = !DISubprogram(name: "feof", scope: !1333, file: !1333, line: 765, type: !1344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1349, file: !1330, line: 104)
!1349 = !DISubprogram(name: "ferror", scope: !1333, file: !1333, line: 767, type: !1344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1351, file: !1330, line: 105)
!1351 = !DISubprogram(name: "fflush", scope: !1333, file: !1333, line: 218, type: !1344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1353, file: !1330, line: 106)
!1353 = !DISubprogram(name: "fgetc", scope: !1333, file: !1333, line: 491, type: !1344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1355, file: !1330, line: 107)
!1355 = !DISubprogram(name: "fgetpos", scope: !1333, file: !1333, line: 737, type: !1356, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1356 = !DISubroutineType(types: !1357)
!1357 = !{!50, !1358, !1359}
!1358 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1341)
!1359 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1360)
!1360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1332, size: 64)
!1361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1362, file: !1330, line: 108)
!1362 = !DISubprogram(name: "fgets", scope: !1333, file: !1333, line: 570, type: !1363, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1363 = !DISubroutineType(types: !1364)
!1364 = !{!463, !530, !50, !1358}
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1366, file: !1330, line: 109)
!1366 = !DISubprogram(name: "fopen", scope: !1333, file: !1333, line: 246, type: !1367, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1367 = !DISubroutineType(types: !1368)
!1368 = !{!1341, !487, !487}
!1369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1370, file: !1330, line: 110)
!1370 = !DISubprogram(name: "fprintf", scope: !1333, file: !1333, line: 326, type: !1371, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1371 = !DISubroutineType(types: !1372)
!1372 = !{!50, !1358, !487, null}
!1373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1374, file: !1330, line: 111)
!1374 = !DISubprogram(name: "fputc", scope: !1333, file: !1333, line: 527, type: !1375, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1375 = !DISubroutineType(types: !1376)
!1376 = !{!50, !50, !1341}
!1377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1378, file: !1330, line: 112)
!1378 = !DISubprogram(name: "fputs", scope: !1333, file: !1333, line: 632, type: !1379, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1379 = !DISubroutineType(types: !1380)
!1380 = !{!50, !487, !1358}
!1381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1382, file: !1330, line: 113)
!1382 = !DISubprogram(name: "fread", scope: !1333, file: !1333, line: 652, type: !1383, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1383 = !DISubroutineType(types: !1384)
!1384 = !{!413, !1385, !413, !413, !1358}
!1385 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !412)
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1387, file: !1330, line: 114)
!1387 = !DISubprogram(name: "freopen", scope: !1333, file: !1333, line: 252, type: !1388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1388 = !DISubroutineType(types: !1389)
!1389 = !{!1341, !487, !487, !1358}
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1391, file: !1330, line: 115)
!1391 = !DISubprogram(name: "fscanf", scope: !1333, file: !1333, line: 391, type: !1371, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1393, file: !1330, line: 116)
!1393 = !DISubprogram(name: "fseek", scope: !1333, file: !1333, line: 690, type: !1394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1394 = !DISubroutineType(types: !1395)
!1395 = !{!50, !1341, !274, !50}
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1397, file: !1330, line: 117)
!1397 = !DISubprogram(name: "fsetpos", scope: !1333, file: !1333, line: 742, type: !1398, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1398 = !DISubroutineType(types: !1399)
!1399 = !{!50, !1341, !1400}
!1400 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1401, size: 64)
!1401 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1332)
!1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1403, file: !1330, line: 118)
!1403 = !DISubprogram(name: "ftell", scope: !1333, file: !1333, line: 695, type: !1404, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1404 = !DISubroutineType(types: !1405)
!1405 = !{!274, !1341}
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1407, file: !1330, line: 119)
!1407 = !DISubprogram(name: "fwrite", scope: !1333, file: !1333, line: 658, type: !1408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1408 = !DISubroutineType(types: !1409)
!1409 = !{!413, !1410, !413, !413, !1358}
!1410 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !439)
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1412, file: !1330, line: 120)
!1412 = !DISubprogram(name: "getc", scope: !1333, file: !1333, line: 492, type: !1344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1414, file: !1330, line: 121)
!1414 = !DISubprogram(name: "getchar", scope: !1415, file: !1415, line: 47, type: !500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1415 = !DIFile(filename: "/usr/include/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "81194b3c12a36527b791b06f928a2e25")
!1416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1417, file: !1330, line: 126)
!1417 = !DISubprogram(name: "perror", scope: !1333, file: !1333, line: 781, type: !1418, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1418 = !DISubroutineType(types: !1419)
!1419 = !{null, !293}
!1420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1421, file: !1330, line: 127)
!1421 = !DISubprogram(name: "printf", scope: !1333, file: !1333, line: 332, type: !1422, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1422 = !DISubroutineType(types: !1423)
!1423 = !{!50, !487, null}
!1424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1425, file: !1330, line: 128)
!1425 = !DISubprogram(name: "putc", scope: !1333, file: !1333, line: 528, type: !1375, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1427, file: !1330, line: 129)
!1427 = !DISubprogram(name: "putchar", scope: !1415, file: !1415, line: 82, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1429, file: !1330, line: 130)
!1429 = !DISubprogram(name: "puts", scope: !1333, file: !1333, line: 638, type: !428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1431, file: !1330, line: 131)
!1431 = !DISubprogram(name: "remove", scope: !1333, file: !1333, line: 146, type: !428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1433, file: !1330, line: 132)
!1433 = !DISubprogram(name: "rename", scope: !1333, file: !1333, line: 148, type: !1434, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1434 = !DISubroutineType(types: !1435)
!1435 = !{!50, !293, !293}
!1436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1437, file: !1330, line: 133)
!1437 = !DISubprogram(name: "rewind", scope: !1333, file: !1333, line: 700, type: !1339, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1439, file: !1330, line: 134)
!1439 = !DISubprogram(name: "scanf", scope: !1333, file: !1333, line: 397, type: !1422, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1441, file: !1330, line: 135)
!1441 = !DISubprogram(name: "setbuf", scope: !1333, file: !1333, line: 304, type: !1442, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1442 = !DISubroutineType(types: !1443)
!1443 = !{null, !1358, !530}
!1444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1445, file: !1330, line: 136)
!1445 = !DISubprogram(name: "setvbuf", scope: !1333, file: !1333, line: 308, type: !1446, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1446 = !DISubroutineType(types: !1447)
!1447 = !{!50, !1358, !530, !50, !413}
!1448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1449, file: !1330, line: 137)
!1449 = !DISubprogram(name: "sprintf", scope: !1333, file: !1333, line: 334, type: !1450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1450 = !DISubroutineType(types: !1451)
!1451 = !{!50, !530, !487, null}
!1452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1453, file: !1330, line: 138)
!1453 = !DISubprogram(name: "sscanf", scope: !1333, file: !1333, line: 399, type: !1454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1454 = !DISubroutineType(types: !1455)
!1455 = !{!50, !487, !487, null}
!1456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1457, file: !1330, line: 139)
!1457 = !DISubprogram(name: "tmpfile", scope: !1333, file: !1333, line: 173, type: !1458, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1458 = !DISubroutineType(types: !1459)
!1459 = !{!1341}
!1460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1461, file: !1330, line: 141)
!1461 = !DISubprogram(name: "tmpnam", scope: !1333, file: !1333, line: 187, type: !1462, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1462 = !DISubroutineType(types: !1463)
!1463 = !{!463, !463}
!1464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1465, file: !1330, line: 143)
!1465 = !DISubprogram(name: "ungetc", scope: !1333, file: !1333, line: 645, type: !1375, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1467, file: !1330, line: 144)
!1467 = !DISubprogram(name: "vfprintf", scope: !1333, file: !1333, line: 341, type: !1468, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1468 = !DISubroutineType(types: !1469)
!1469 = !{!50, !1358, !487, !1051}
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1471, file: !1330, line: 145)
!1471 = !DISubprogram(name: "vprintf", scope: !1415, file: !1415, line: 39, type: !1472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1472 = !DISubroutineType(types: !1473)
!1473 = !{!50, !487, !1051}
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1475, file: !1330, line: 146)
!1475 = !DISubprogram(name: "vsprintf", scope: !1333, file: !1333, line: 349, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1476 = !DISubroutineType(types: !1477)
!1477 = !{!50, !530, !487, !1051}
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1479, file: !1330, line: 175)
!1479 = !DISubprogram(name: "snprintf", scope: !1333, file: !1333, line: 354, type: !1480, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1480 = !DISubroutineType(types: !1481)
!1481 = !{!50, !530, !413, !487, null}
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1483, file: !1330, line: 176)
!1483 = !DISubprogram(name: "vfscanf", scope: !1333, file: !1333, line: 434, type: !1468, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1485, file: !1330, line: 177)
!1485 = !DISubprogram(name: "vscanf", scope: !1333, file: !1333, line: 442, type: !1472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1487, file: !1330, line: 178)
!1487 = !DISubprogram(name: "vsnprintf", scope: !1333, file: !1333, line: 358, type: !1488, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{!50, !530, !413, !487, !1051}
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !1491, file: !1330, line: 179)
!1491 = !DISubprogram(name: "vsscanf", scope: !1333, file: !1333, line: 446, type: !1492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1492 = !DISubroutineType(types: !1493)
!1493 = !{!50, !487, !487, !1051}
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1479, file: !1330, line: 185)
!1495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1483, file: !1330, line: 186)
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1485, file: !1330, line: 187)
!1497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1487, file: !1330, line: 188)
!1498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1491, file: !1330, line: 189)
!1499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1500, file: !1504, line: 82)
!1500 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1501, line: 48, baseType: !1502)
!1501 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "760693b7fbeea3d686e1f29058fc2257")
!1502 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1503, size: 64)
!1503 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1218)
!1504 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cwctype", directory: "")
!1505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1506, file: !1504, line: 83)
!1506 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1507, line: 38, baseType: !415)
!1507 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "45eef9c3aa1d99faffa3945ed9be039a")
!1508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !913, file: !1504, line: 84)
!1509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1510, file: !1504, line: 86)
!1510 = !DISubprogram(name: "iswalnum", scope: !1507, file: !1507, line: 95, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1512, file: !1504, line: 87)
!1512 = !DISubprogram(name: "iswalpha", scope: !1507, file: !1507, line: 101, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1514, file: !1504, line: 89)
!1514 = !DISubprogram(name: "iswblank", scope: !1507, file: !1507, line: 146, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1516, file: !1504, line: 91)
!1516 = !DISubprogram(name: "iswcntrl", scope: !1507, file: !1507, line: 104, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1518, file: !1504, line: 92)
!1518 = !DISubprogram(name: "iswctype", scope: !1507, file: !1507, line: 159, type: !1519, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1519 = !DISubroutineType(types: !1520)
!1520 = !{!50, !913, !1506}
!1521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1522, file: !1504, line: 93)
!1522 = !DISubprogram(name: "iswdigit", scope: !1507, file: !1507, line: 108, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1524, file: !1504, line: 94)
!1524 = !DISubprogram(name: "iswgraph", scope: !1507, file: !1507, line: 112, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1526, file: !1504, line: 95)
!1526 = !DISubprogram(name: "iswlower", scope: !1507, file: !1507, line: 117, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1528, file: !1504, line: 96)
!1528 = !DISubprogram(name: "iswprint", scope: !1507, file: !1507, line: 120, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1530, file: !1504, line: 97)
!1530 = !DISubprogram(name: "iswpunct", scope: !1507, file: !1507, line: 125, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1532, file: !1504, line: 98)
!1532 = !DISubprogram(name: "iswspace", scope: !1507, file: !1507, line: 130, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1534, file: !1504, line: 99)
!1534 = !DISubprogram(name: "iswupper", scope: !1507, file: !1507, line: 135, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1536, file: !1504, line: 100)
!1536 = !DISubprogram(name: "iswxdigit", scope: !1507, file: !1507, line: 140, type: !1149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1538, file: !1504, line: 101)
!1538 = !DISubprogram(name: "towctrans", scope: !1501, file: !1501, line: 55, type: !1539, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1539 = !DISubroutineType(types: !1540)
!1540 = !{!913, !913, !1500}
!1541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1542, file: !1504, line: 102)
!1542 = !DISubprogram(name: "towlower", scope: !1507, file: !1507, line: 166, type: !1543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1543 = !DISubroutineType(types: !1544)
!1544 = !{!913, !913}
!1545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1546, file: !1504, line: 103)
!1546 = !DISubprogram(name: "towupper", scope: !1507, file: !1507, line: 169, type: !1543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1548, file: !1504, line: 104)
!1548 = !DISubprogram(name: "wctrans", scope: !1501, file: !1501, line: 52, type: !1549, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1549 = !DISubroutineType(types: !1550)
!1550 = !{!1500, !293}
!1551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1552, file: !1504, line: 105)
!1552 = !DISubprogram(name: "wctype", scope: !1507, file: !1507, line: 155, type: !1553, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1553 = !DISubroutineType(types: !1554)
!1554 = !{!1506, !293}
!1555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1556, file: !1559, line: 60)
!1556 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1557, line: 7, baseType: !1558)
!1557 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1558 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !36, line: 154, baseType: !274)
!1559 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ctime", directory: "")
!1560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1561, file: !1559, line: 61)
!1561 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1562, line: 7, baseType: !1563)
!1562 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "49b4e16ef1215de5afdbb283400ab90c")
!1563 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !36, line: 158, baseType: !274)
!1564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1098, file: !1559, line: 62)
!1565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1566, file: !1559, line: 64)
!1566 = !DISubprogram(name: "clock", scope: !1567, file: !1567, line: 72, type: !1568, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1567 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b21b4c7d8bf3fafdb33a1c7ed8e024a")
!1568 = !DISubroutineType(types: !1569)
!1569 = !{!1556}
!1570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1571, file: !1559, line: 65)
!1571 = !DISubprogram(name: "difftime", scope: !1567, file: !1567, line: 78, type: !1572, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1572 = !DISubroutineType(types: !1573)
!1573 = !{!57, !1561, !1561}
!1574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1575, file: !1559, line: 66)
!1575 = !DISubprogram(name: "mktime", scope: !1567, file: !1567, line: 82, type: !1576, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1576 = !DISubroutineType(types: !1577)
!1577 = !{!1561, !1578}
!1578 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1098, size: 64)
!1579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1580, file: !1559, line: 67)
!1580 = !DISubprogram(name: "time", scope: !1567, file: !1567, line: 75, type: !1581, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1581 = !DISubroutineType(types: !1582)
!1582 = !{!1561, !1583}
!1583 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1561, size: 64)
!1584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1585, file: !1559, line: 68)
!1585 = !DISubprogram(name: "asctime", scope: !1567, file: !1567, line: 139, type: !1586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1586 = !DISubroutineType(types: !1587)
!1587 = !{!463, !1096}
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1589, file: !1559, line: 69)
!1589 = !DISubprogram(name: "ctime", scope: !1567, file: !1567, line: 142, type: !1590, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1590 = !DISubroutineType(types: !1591)
!1591 = !{!463, !1592}
!1592 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1593, size: 64)
!1593 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1561)
!1594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1595, file: !1559, line: 70)
!1595 = !DISubprogram(name: "gmtime", scope: !1567, file: !1567, line: 119, type: !1596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1596 = !DISubroutineType(types: !1597)
!1597 = !{!1578, !1592}
!1598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1599, file: !1559, line: 71)
!1599 = !DISubprogram(name: "localtime", scope: !1567, file: !1567, line: 123, type: !1596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1601, file: !1559, line: 72)
!1601 = !DISubprogram(name: "strftime", scope: !1567, file: !1567, line: 88, type: !1602, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1602 = !DISubroutineType(types: !1603)
!1603 = !{!413, !530, !413, !487, !1095}
!1604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1605, file: !1559, line: 79)
!1605 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1606, line: 9, size: 128, flags: DIFlagTypePassByValue, elements: !1607, identifier: "_ZTS8timespec")
!1606 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "7074babe5447b53c4390dc147eee8679")
!1607 = !{!1608, !1609}
!1608 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1605, file: !1606, line: 11, baseType: !1563, size: 64)
!1609 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1605, file: !1606, line: 12, baseType: !1610, size: 64, offset: 64)
!1610 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !36, line: 194, baseType: !274)
!1611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1612, file: !1559, line: 80)
!1612 = !DISubprogram(name: "timespec_get", scope: !1567, file: !1567, line: 263, type: !1613, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1613 = !DISubroutineType(types: !1614)
!1614 = !{!50, !1615, !50}
!1615 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1605, size: 64)
!1616 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1617, entity: !1618, file: !1620, line: 1250)
!1617 = !DINamespace(name: "chrono", scope: !45)
!1618 = !DINamespace(name: "chrono_literals", scope: !1619, exportSymbols: true)
!1619 = !DINamespace(name: "literals", scope: !45, exportSymbols: true)
!1620 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/chrono", directory: "")
!1621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1622, file: !1626, line: 77)
!1622 = !DISubprogram(name: "memchr", scope: !1623, file: !1623, line: 84, type: !1624, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1623 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "cc7eed1dc136352012a229a96542ae3d")
!1624 = !DISubroutineType(types: !1625)
!1625 = !{!439, !439, !50, !413}
!1626 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstring", directory: "")
!1627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1628, file: !1626, line: 78)
!1628 = !DISubprogram(name: "memcmp", scope: !1623, file: !1623, line: 64, type: !1629, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1629 = !DISubroutineType(types: !1630)
!1630 = !{!50, !439, !439, !413}
!1631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1632, file: !1626, line: 79)
!1632 = !DISubprogram(name: "memcpy", scope: !1623, file: !1623, line: 43, type: !1633, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1633 = !DISubroutineType(types: !1634)
!1634 = !{!412, !1385, !1410, !413}
!1635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1636, file: !1626, line: 80)
!1636 = !DISubprogram(name: "memmove", scope: !1623, file: !1623, line: 47, type: !1637, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1637 = !DISubroutineType(types: !1638)
!1638 = !{!412, !412, !439, !413}
!1639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1640, file: !1626, line: 81)
!1640 = !DISubprogram(name: "memset", scope: !1623, file: !1623, line: 61, type: !1641, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1641 = !DISubroutineType(types: !1642)
!1642 = !{!412, !412, !50, !413}
!1643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1644, file: !1626, line: 82)
!1644 = !DISubprogram(name: "strcat", scope: !1623, file: !1623, line: 130, type: !1645, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1645 = !DISubroutineType(types: !1646)
!1646 = !{!463, !530, !487}
!1647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1648, file: !1626, line: 83)
!1648 = !DISubprogram(name: "strcmp", scope: !1623, file: !1623, line: 137, type: !1434, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1650, file: !1626, line: 84)
!1650 = !DISubprogram(name: "strcoll", scope: !1623, file: !1623, line: 144, type: !1434, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1652, file: !1626, line: 85)
!1652 = !DISubprogram(name: "strcpy", scope: !1623, file: !1623, line: 122, type: !1645, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1654, file: !1626, line: 86)
!1654 = !DISubprogram(name: "strcspn", scope: !1623, file: !1623, line: 273, type: !1655, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1655 = !DISubroutineType(types: !1656)
!1656 = !{!413, !293, !293}
!1657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1658, file: !1626, line: 87)
!1658 = !DISubprogram(name: "strerror", scope: !1623, file: !1623, line: 397, type: !1659, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1659 = !DISubroutineType(types: !1660)
!1660 = !{!463, !50}
!1661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1662, file: !1626, line: 88)
!1662 = !DISubprogram(name: "strlen", scope: !1623, file: !1623, line: 385, type: !1663, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1663 = !DISubroutineType(types: !1664)
!1664 = !{!413, !293}
!1665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1666, file: !1626, line: 89)
!1666 = !DISubprogram(name: "strncat", scope: !1623, file: !1623, line: 133, type: !1667, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1667 = !DISubroutineType(types: !1668)
!1668 = !{!463, !530, !487, !413}
!1669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1670, file: !1626, line: 90)
!1670 = !DISubprogram(name: "strncmp", scope: !1623, file: !1623, line: 140, type: !1671, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1671 = !DISubroutineType(types: !1672)
!1672 = !{!50, !293, !293, !413}
!1673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1674, file: !1626, line: 91)
!1674 = !DISubprogram(name: "strncpy", scope: !1623, file: !1623, line: 125, type: !1667, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1676, file: !1626, line: 92)
!1676 = !DISubprogram(name: "strspn", scope: !1623, file: !1623, line: 277, type: !1655, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1678, file: !1626, line: 93)
!1678 = !DISubprogram(name: "strtok", scope: !1623, file: !1623, line: 336, type: !1645, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1680, file: !1626, line: 94)
!1680 = !DISubprogram(name: "strxfrm", scope: !1623, file: !1623, line: 147, type: !1681, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1681 = !DISubroutineType(types: !1682)
!1682 = !{!413, !530, !487, !413}
!1683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1684, file: !1626, line: 95)
!1684 = !DISubprogram(name: "strchr", scope: !1623, file: !1623, line: 219, type: !1685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1685 = !DISubroutineType(types: !1686)
!1686 = !{!293, !293, !50}
!1687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1688, file: !1626, line: 96)
!1688 = !DISubprogram(name: "strpbrk", scope: !1623, file: !1623, line: 296, type: !1689, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1689 = !DISubroutineType(types: !1690)
!1690 = !{!293, !293, !293}
!1691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1692, file: !1626, line: 97)
!1692 = !DISubprogram(name: "strrchr", scope: !1623, file: !1623, line: 246, type: !1685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1694, file: !1626, line: 98)
!1694 = !DISubprogram(name: "strstr", scope: !1623, file: !1623, line: 323, type: !1689, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !3, file: !1696, line: 89)
!1696 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/shared_ptr_base.h", directory: "", checksumkind: CSK_MD5, checksum: "a9031cc66fad8948937b85efd4835986")
!1697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1698, file: !1696, line: 90)
!1698 = !DIGlobalVariable(name: "__default_lock_policy", linkageName: "_ZN9__gnu_cxxL21__default_lock_policyE", scope: !5, file: !4, line: 53, type: !1699, isLocal: true, isDefinition: false)
!1699 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3)
!1700 = distinct !DILifetime(object: !1701, location: !DIExpr(DIOpArg(0, %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" addrspace(4)*), DIOpDeref(%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X")), argObjects: {!1741})
!1701 = distinct !DIGlobalVariable(name: "x", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE", scope: !0, file: !1702, line: 312, type: !1703, isLocal: false, isDefinition: true, declaration: !1707)
!1702 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "0ac9823654812ba0fd0f0538bfae47a7")
!1703 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1704)
!1704 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__X", scope: !1705, file: !1702, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !1729, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XE")
!1705 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_Coordinates<__HIP_ThreadIdx>", file: !1702, line: 296, size: 8, flags: DIFlagTypePassByValue, elements: !1706, templateParams: !1720, identifier: "_ZTS17__HIP_CoordinatesI15__HIP_ThreadIdxE")
!1706 = !{!1707, !1708, !1711, !1714}
!1707 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1705, file: !1702, line: 312, baseType: !1703, flags: DIFlagStaticMember)
!1708 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1705, file: !1702, line: 313, baseType: !1709, flags: DIFlagStaticMember)
!1709 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1710)
!1710 = !DICompositeType(tag: DW_TAG_structure_type, name: "__Y", scope: !1705, file: !1702, line: 303, size: 8, flags: DIFlagFwdDecl, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YE")
!1711 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1705, file: !1702, line: 314, baseType: !1712, flags: DIFlagStaticMember)
!1712 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1713)
!1713 = !DICompositeType(tag: DW_TAG_structure_type, name: "__Z", scope: !1705, file: !1702, line: 307, size: 8, flags: DIFlagFwdDecl, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZE")
!1714 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxEcv4dim3Ev", scope: !1705, file: !1702, line: 316, type: !1715, scopeLine: 316, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1715 = !DISubroutineType(types: !1716)
!1716 = !{!1717, !1718}
!1717 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !30, line: 941, baseType: !29)
!1718 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1719, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1719 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1705)
!1720 = !{!1721}
!1721 = !DITemplateTypeParameter(name: "F", type: !1722)
!1722 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_ThreadIdx", file: !1702, line: 277, size: 8, flags: DIFlagTypePassByValue, elements: !1723, identifier: "_ZTS15__HIP_ThreadIdx")
!1723 = !{!1724}
!1724 = !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !1722, file: !1702, line: 279, type: !1725, scopeLine: 279, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1725 = !DISubroutineType(types: !1726)
!1726 = !{!33, !1727, !33}
!1727 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1728, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1728 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1722)
!1729 = !{!1730, !1735}
!1730 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !1704, file: !1702, line: 300, type: !1731, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1731 = !DISubroutineType(types: !1732)
!1732 = !{!1733, !1734}
!1733 = !DIDerivedType(tag: DW_TAG_typedef, name: "R", scope: !1705, file: !1702, line: 297, baseType: !33)
!1734 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1703, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1735 = !DISubprogram(name: "operator+=", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XpLERKj", scope: !1704, file: !1702, line: 301, type: !1736, scopeLine: 301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1736 = !DISubroutineType(types: !1737)
!1737 = !{!1733, !1738, !1739}
!1738 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1704, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1739 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1740, size: 64)
!1740 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1733)
!1741 = distinct !DIFragment()
!1742 = distinct !DILifetime(object: !1743, location: !DIExpr(DIOpArg(0, %struct.__HIP_Coordinates.0 addrspace(4)*), DIOpDeref(%struct.__HIP_Coordinates.0)), argObjects: {!1799})
!1743 = distinct !DIGlobalVariable(name: "blockDim", linkageName: "_ZL8blockDim", scope: !0, file: !1702, line: 374, type: !1744, isLocal: true, isDefinition: true)
!1744 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1745)
!1745 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_Coordinates<__HIP_BlockDim>", file: !1702, line: 296, size: 8, flags: DIFlagTypePassByValue, elements: !1746, templateParams: !1790, identifier: "_ZTS17__HIP_CoordinatesI14__HIP_BlockDimE")
!1746 = !{!1747, !1762, !1774, !1786}
!1747 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1745, file: !1702, line: 312, baseType: !1748, flags: DIFlagStaticMember)
!1748 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1749)
!1749 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__X", scope: !1745, file: !1702, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !1750, identifier: "_ZTSN17__HIP_CoordinatesI14__HIP_BlockDimE3__XE")
!1750 = !{!1751, !1756}
!1751 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv", scope: !1749, file: !1702, line: 300, type: !1752, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1752 = !DISubroutineType(types: !1753)
!1753 = !{!1754, !1755}
!1754 = !DIDerivedType(tag: DW_TAG_typedef, name: "R", scope: !1745, file: !1702, line: 297, baseType: !33)
!1755 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1748, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1756 = !DISubprogram(name: "operator+=", linkageName: "_ZN17__HIP_CoordinatesI14__HIP_BlockDimE3__XpLERKj", scope: !1749, file: !1702, line: 301, type: !1757, scopeLine: 301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1757 = !DISubroutineType(types: !1758)
!1758 = !{!1754, !1759, !1760}
!1759 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1749, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1760 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1761, size: 64)
!1761 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1754)
!1762 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1745, file: !1702, line: 313, baseType: !1763, flags: DIFlagStaticMember)
!1763 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1764)
!1764 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__Y", scope: !1745, file: !1702, line: 303, size: 8, flags: DIFlagTypePassByValue, elements: !1765, identifier: "_ZTSN17__HIP_CoordinatesI14__HIP_BlockDimE3__YE")
!1765 = !{!1766, !1770}
!1766 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__YcvjEv", scope: !1764, file: !1702, line: 304, type: !1767, scopeLine: 304, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1767 = !DISubroutineType(types: !1768)
!1768 = !{!1754, !1769}
!1769 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1763, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1770 = !DISubprogram(name: "operator+=", linkageName: "_ZN17__HIP_CoordinatesI14__HIP_BlockDimE3__YpLERKj", scope: !1764, file: !1702, line: 305, type: !1771, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1771 = !DISubroutineType(types: !1772)
!1772 = !{!1754, !1773, !1760}
!1773 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1764, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1774 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1745, file: !1702, line: 314, baseType: !1775, flags: DIFlagStaticMember)
!1775 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1776)
!1776 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__Z", scope: !1745, file: !1702, line: 307, size: 8, flags: DIFlagTypePassByValue, elements: !1777, identifier: "_ZTSN17__HIP_CoordinatesI14__HIP_BlockDimE3__ZE")
!1777 = !{!1778, !1782}
!1778 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__ZcvjEv", scope: !1776, file: !1702, line: 308, type: !1779, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1779 = !DISubroutineType(types: !1780)
!1780 = !{!1754, !1781}
!1781 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1775, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1782 = !DISubprogram(name: "operator+=", linkageName: "_ZN17__HIP_CoordinatesI14__HIP_BlockDimE3__ZpLERKj", scope: !1776, file: !1702, line: 309, type: !1783, scopeLine: 309, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1783 = !DISubroutineType(types: !1784)
!1784 = !{!1754, !1785, !1760}
!1785 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1776, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1786 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK17__HIP_CoordinatesI14__HIP_BlockDimEcv4dim3Ev", scope: !1745, file: !1702, line: 316, type: !1787, scopeLine: 316, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1787 = !DISubroutineType(types: !1788)
!1788 = !{!1717, !1789}
!1789 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1744, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1790 = !{!1791}
!1791 = !DITemplateTypeParameter(name: "F", type: !1792)
!1792 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_BlockDim", file: !1702, line: 265, size: 8, flags: DIFlagTypePassByValue, elements: !1793, identifier: "_ZTS14__HIP_BlockDim")
!1793 = !{!1794}
!1794 = !DISubprogram(name: "operator()", linkageName: "_ZNK14__HIP_BlockDimclEj", scope: !1792, file: !1702, line: 267, type: !1795, scopeLine: 267, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1795 = !DISubroutineType(types: !1796)
!1796 = !{!33, !1797, !33}
!1797 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1798, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1798 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1792)
!1799 = distinct !DIFragment()
!1800 = distinct !DILifetime(object: !1801, location: !DIExpr(DIOpArg(0, %"struct.__HIP_Coordinates<__HIP_BlockDim>::__X" addrspace(4)*), DIOpDeref(%"struct.__HIP_Coordinates<__HIP_BlockDim>::__X")), argObjects: {!1802})
!1801 = distinct !DIGlobalVariable(name: "x", linkageName: "_ZN17__HIP_CoordinatesI14__HIP_BlockDimE1xE", scope: !0, file: !1702, line: 312, type: !1748, isLocal: false, isDefinition: true, declaration: !1747)
!1802 = distinct !DIFragment()
!1803 = !{i32 7, !"Dwarf Version", i32 5}
!1804 = !{i32 2, !"Debug Info Version", i32 4}
!1805 = !{i32 1, !"wchar_size", i32 4}
!1806 = !{i32 7, !"PIC Level", i32 1}
!1807 = !{i32 2, i32 0}
!1808 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}
!1809 = distinct !DISubprogram(name: "__d_increment", linkageName: "_Z13__d_incrementPiPl", scope: !1, file: !1, line: 26, type: !1810, scopeLine: 26, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1813)
!1810 = !DISubroutineType(types: !1811)
!1811 = !{null, !85, !1812}
!1812 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1220, size: 64)
!1813 = !{!1814, !1815, !1816, !1817}
!1814 = !DILocalVariable(name: "d_mem", arg: 1, scope: !1809, file: !1, line: 26, type: !85)
!1815 = !DILocalVariable(name: "d_time", arg: 2, scope: !1809, file: !1, line: 26, type: !1812)
!1816 = !DILocalVariable(name: "Id", scope: !1809, file: !1, line: 27, type: !1705)
!1817 = !DILocalVariable(name: "tmp", scope: !1809, file: !1, line: 28, type: !50)
!1818 = !DILocation(line: 280, column: 12, scope: !1819, inlinedAt: !1825)
!1819 = distinct !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !1722, file: !1702, line: 279, type: !1820, scopeLine: 279, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !1724, retainedNodes: !1821)
!1820 = !DISubroutineType(cc: DW_CC_nocall, types: !1726)
!1821 = !{!1822, !1824}
!1822 = !DILocalVariable(name: "this", arg: 1, scope: !1819, type: !1823, flags: DIFlagArtificial | DIFlagObjectPointer)
!1823 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1728, size: 64)
!1824 = !DILocalVariable(name: "x", arg: 2, scope: !1819, file: !1702, line: 279, type: !33)
!1825 = distinct !DILocation(line: 300, column: 53, scope: !1826, inlinedAt: !1831)
!1826 = distinct !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !1704, file: !1702, line: 300, type: !1827, scopeLine: 300, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !1730, retainedNodes: !1828)
!1827 = !DISubroutineType(cc: DW_CC_nocall, types: !1732)
!1828 = !{!1829}
!1829 = !DILocalVariable(name: "this", arg: 1, scope: !1826, type: !1830, flags: DIFlagArtificial | DIFlagObjectPointer)
!1830 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1703, size: 64)
!1831 = distinct !DILocation(line: 29, column: 9, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1809, file: !1, line: 29, column: 9)
!1833 = !{i32 0, i32 1024}
!1834 = !DILocation(line: 29, column: 14, scope: !1832)
!1835 = !DILocation(line: 29, column: 9, scope: !1809)
!1836 = !DILocation(line: 706, column: 26, scope: !1837, inlinedAt: !1842)
!1837 = distinct !DISubprogram(name: "__clock64", linkageName: "_Z9__clock64v", scope: !1838, file: !1838, line: 703, type: !1839, scopeLine: 703, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1841)
!1838 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "59790372eacbad80338513022c6135db")
!1839 = !DISubroutineType(types: !1840)
!1840 = !{!27}
!1841 = !{}
!1842 = distinct !DILocation(line: 715, column: 35, scope: !1843, inlinedAt: !1844)
!1843 = distinct !DISubprogram(name: "__clock", linkageName: "_Z7__clockv", scope: !1838, file: !1838, line: 715, type: !1839, scopeLine: 715, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1841)
!1844 = distinct !DILocation(line: 736, column: 33, scope: !1845, inlinedAt: !1846)
!1845 = distinct !DISubprogram(name: "clock", linkageName: "_Z5clockv", scope: !1838, file: !1838, line: 736, type: !1839, scopeLine: 736, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1841)
!1846 = distinct !DILocation(line: 30, column: 19, scope: !1847)
!1847 = distinct !DILexicalBlock(scope: !1832, file: !1, line: 29, column: 20)
!1848 = !DILocation(line: 30, column: 17, scope: !1847)
!1849 = !{!1850, !1850, i64 0}
!1850 = !{!"long", !1851, i64 0}
!1851 = !{!"omnipotent char", !1852, i64 0}
!1852 = !{!"Simple C++ TBAA"}
!1853 = !DILocation(line: 706, column: 26, scope: !1837, inlinedAt: !1854)
!1854 = distinct !DILocation(line: 732, column: 34, scope: !1855, inlinedAt: !1856)
!1855 = distinct !DISubprogram(name: "clock64", linkageName: "_Z7clock64v", scope: !1838, file: !1838, line: 732, type: !1839, scopeLine: 732, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1841)
!1856 = distinct !DILocation(line: 31, column: 19, scope: !1847)
!1857 = !DILocation(line: 31, column: 7, scope: !1847)
!1858 = !DILocation(line: 31, column: 17, scope: !1847)
!1859 = !DILocation(line: 724, column: 26, scope: !1860, inlinedAt: !1861)
!1860 = distinct !DISubprogram(name: "wall_clock64", linkageName: "_Z12wall_clock64v", scope: !1838, file: !1838, line: 721, type: !1839, scopeLine: 721, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1841)
!1861 = distinct !DILocation(line: 32, column: 19, scope: !1847)
!1862 = !DILocation(line: 32, column: 7, scope: !1847)
!1863 = !DILocation(line: 32, column: 17, scope: !1847)
!1864 = !DILocation(line: 34, column: 5, scope: !1847)
!1865 = !DILocation(line: 35, column: 23, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1832, file: !1, line: 34, column: 12)
!1867 = !DILocation(line: 35, column: 13, scope: !1866)
!1868 = !{!1869, !1869, i64 0}
!1869 = !{!"int", !1851, i64 0}
!1870 = !DILocation(line: 924, column: 9, scope: !1871, inlinedAt: !1880)
!1871 = distinct !DILexicalBlock(scope: !1872, file: !1838, line: 923, column: 16)
!1872 = distinct !DILexicalBlock(scope: !1873, file: !1838, line: 923, column: 9)
!1873 = distinct !DISubprogram(name: "__work_group_barrier", linkageName: "_ZL20__work_group_barrierj14__memory_scope", scope: !1838, file: !1838, line: 921, type: !1874, scopeLine: 922, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1877)
!1874 = !DISubroutineType(cc: DW_CC_nocall, types: !1875)
!1875 = !{null, !28, !1876}
!1876 = !DIDerivedType(tag: DW_TAG_typedef, name: "__memory_scope", file: !12, line: 137, baseType: !11)
!1877 = !{!1878, !1879}
!1878 = !DILocalVariable(name: "flags", arg: 1, scope: !1873, file: !1838, line: 921, type: !28)
!1879 = !DILocalVariable(name: "scope", arg: 2, scope: !1873, file: !1838, line: 921, type: !1876)
!1880 = distinct !DILocation(line: 936, column: 3, scope: !1881, inlinedAt: !1885)
!1881 = distinct !DISubprogram(name: "__barrier", linkageName: "_ZL9__barrieri", scope: !1838, file: !1838, line: 934, type: !1882, scopeLine: 935, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1883)
!1882 = !DISubroutineType(cc: DW_CC_nocall, types: !454)
!1883 = !{!1884}
!1884 = !DILocalVariable(name: "n", arg: 1, scope: !1881, file: !1838, line: 934, type: !50)
!1885 = distinct !DILocation(line: 944, column: 3, scope: !1886, inlinedAt: !1887)
!1886 = distinct !DISubprogram(name: "__syncthreads", linkageName: "_Z13__syncthreadsv", scope: !1838, file: !1838, line: 942, type: !406, scopeLine: 943, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !1841)
!1887 = distinct !DILocation(line: 37, column: 5, scope: !1809)
!1888 = !DILocation(line: 925, column: 9, scope: !1871, inlinedAt: !1880)
!1889 = !DILocation(line: 926, column: 9, scope: !1871, inlinedAt: !1880)
!1890 = !DILocation(line: 39, column: 5, scope: !1809)
!1891 = !DILocation(line: 39, column: 17, scope: !1809)
!1892 = !DILocation(line: 268, column: 12, scope: !1893, inlinedAt: !1899)
!1893 = distinct !DISubprogram(name: "operator()", linkageName: "_ZNK14__HIP_BlockDimclEj", scope: !1792, file: !1702, line: 267, type: !1894, scopeLine: 267, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !1794, retainedNodes: !1895)
!1894 = !DISubroutineType(cc: DW_CC_nocall, types: !1796)
!1895 = !{!1896, !1898}
!1896 = !DILocalVariable(name: "this", arg: 1, scope: !1893, type: !1897, flags: DIFlagArtificial | DIFlagObjectPointer)
!1897 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1798, size: 64)
!1898 = !DILocalVariable(name: "x", arg: 2, scope: !1893, file: !1702, line: 267, type: !33)
!1899 = distinct !DILocation(line: 300, column: 53, scope: !1900, inlinedAt: !1905)
!1900 = distinct !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI14__HIP_BlockDimE3__XcvjEv", scope: !1749, file: !1702, line: 300, type: !1901, scopeLine: 300, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, declaration: !1751, retainedNodes: !1902)
!1901 = !DISubroutineType(cc: DW_CC_nocall, types: !1753)
!1902 = !{!1903}
!1903 = !DILocalVariable(name: "this", arg: 1, scope: !1900, type: !1904, flags: DIFlagArtificial | DIFlagObjectPointer)
!1904 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1748, size: 64)
!1905 = distinct !DILocation(line: 40, column: 17, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1809, file: !1, line: 40, column: 9)
!1907 = !{i16 1, i16 1025}
!1908 = !DILocation(line: 40, column: 27, scope: !1906)
!1909 = !DILocation(line: 40, column: 14, scope: !1906)
!1910 = !DILocation(line: 40, column: 9, scope: !1809)
!1911 = !DILocation(line: 706, column: 26, scope: !1837, inlinedAt: !1912)
!1912 = distinct !DILocation(line: 715, column: 35, scope: !1843, inlinedAt: !1913)
!1913 = distinct !DILocation(line: 736, column: 33, scope: !1845, inlinedAt: !1914)
!1914 = distinct !DILocation(line: 41, column: 19, scope: !1915)
!1915 = distinct !DILexicalBlock(scope: !1906, file: !1, line: 40, column: 31)
!1916 = !DILocation(line: 41, column: 7, scope: !1915)
!1917 = !DILocation(line: 41, column: 17, scope: !1915)
!1918 = !DILocation(line: 706, column: 26, scope: !1837, inlinedAt: !1919)
!1919 = distinct !DILocation(line: 732, column: 34, scope: !1855, inlinedAt: !1920)
!1920 = distinct !DILocation(line: 42, column: 19, scope: !1915)
!1921 = !DILocation(line: 42, column: 7, scope: !1915)
!1922 = !DILocation(line: 42, column: 17, scope: !1915)
!1923 = !DILocation(line: 724, column: 26, scope: !1860, inlinedAt: !1924)
!1924 = distinct !DILocation(line: 43, column: 19, scope: !1915)
!1925 = !DILocation(line: 43, column: 7, scope: !1915)
!1926 = !DILocation(line: 43, column: 17, scope: !1915)
!1927 = !DILocation(line: 44, column: 5, scope: !1915)
!1928 = !DILocation(line: 45, column: 1, scope: !1809)

; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa-gfx90a

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = 'test/clock_test.cpp'
source_filename = "test/clock_test.cpp"
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
%struct.ClockTimes = type { i64, i64, i64 }
%"struct.std::chrono::time_point" = type { %"struct.std::chrono::duration" }
%"struct.std::chrono::duration" = type { i64 }
%"struct.std::chrono::duration.0" = type { i64 }

$__hip_gpubin_handle = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@_ZSt4cerr = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [13 x i8] c"\0AHIP ERROR: \00", align 1, !dbg !7
@_Z13__d_incrementPiPl = dso_local constant void (i32*, i64*)* @_Z28__device_stub____d_incrementPiPl, align 8
@.str.1 = private unnamed_addr constant [48 x i8] c"\0A\0AERROR: ALL kernel time functions returned 0!\0A\00", align 1, !dbg !15
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str.2 = private unnamed_addr constant [3 x i8] c", \00", align 1, !dbg !20
@.str.3 = private unnamed_addr constant [2 x i8] c"}\00", align 1, !dbg !25
@.str.4 = private unnamed_addr constant [29 x i8] c"\0AHip `wall_clock64()` Rate: \00", align 1, !dbg !30
@.str.5 = private unnamed_addr constant [5 x i8] c"kHz\0A\00", align 1, !dbg !35
@.str.6 = private unnamed_addr constant [35 x i8] c"Increment through an array:\0Asize: \00", align 1, !dbg !40
@.str.7 = private unnamed_addr constant [14 x i8] c"\0Aiterations: \00", align 1, !dbg !45
@.str.8 = private unnamed_addr constant [11 x i8] c"HIP time: \00", align 1, !dbg !50
@.str.9 = private unnamed_addr constant [11 x i8] c" micro sec\00", align 1, !dbg !55
@.str.10 = private unnamed_addr constant [30 x i8] c"HIP Kernel time (`clock()`): \00", align 1, !dbg !57
@.str.11 = private unnamed_addr constant [43 x i8] c" micro sec\0AHIP Kernel time (`clock64()`): \00", align 1, !dbg !62
@.str.12 = private unnamed_addr constant [48 x i8] c" micro sec\0AHIP Kernel time (`wall_clock64()`): \00", align 1, !dbg !67
@.str.13 = private unnamed_addr constant [12 x i8] c" micro sec\0A\00", align 1, !dbg !69
@.str.14 = private unnamed_addr constant [12 x i8] c"NORM time: \00", align 1, !dbg !74
@0 = private unnamed_addr constant [22 x i8] c"_Z13__d_incrementPiPl\00", align 1
@__hip_fatbin = external constant i8, section ".hip_fatbin"
@__hip_fatbin_wrapper = internal constant { i32, i32, i8*, i8* } { i32 1212764230, i32 1, i8* @__hip_fatbin, i8* null }, section ".hipFatBinSegment", align 8
@__hip_gpubin_handle = linkonce hidden local_unnamed_addr global i8** null, comdat, align 8
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_clock_test.cpp, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @__hip_module_ctor, i8* null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13__HIP_CHECK__10hipError_t(i32 noundef %0) local_unnamed_addr #3 !dbg !2224 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !2229, metadata !DIExpression()), !dbg !2230
  %2 = icmp eq i32 %0, 0, !dbg !2231
  br i1 %2, label %7, label %3, !dbg !2233

3:                                                ; preds = %1
  %4 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2234
  %5 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %4, i32 noundef %0), !dbg !2236
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %5, metadata !2237, metadata !DIExpression()), !dbg !2254
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2254
  %6 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %5), !dbg !2256
  tail call void @exit(i32 noundef 1) #16, !dbg !2257
  unreachable, !dbg !2257

7:                                                ; preds = %1
  ret void, !dbg !2258
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #4

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef) local_unnamed_addr #5

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #0

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #6

; Function Attrs: norecurse uwtable
define dso_local void @_Z28__device_stub____d_incrementPiPl(i32* noundef %0, i64* noundef %1) #7 {
  %3 = alloca i32*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca %struct.dim3, align 8
  %6 = alloca %struct.dim3, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  store i32* %0, i32** %3, align 8, !tbaa !2259
  store i64* %1, i64** %4, align 8, !tbaa !2259
  %9 = alloca [2 x i8*], align 16
  %10 = getelementptr inbounds [2 x i8*], [2 x i8*]* %9, i64 0, i64 0
  %11 = bitcast [2 x i8*]* %9 to i32***
  store i32** %3, i32*** %11, align 16
  %12 = getelementptr inbounds [2 x i8*], [2 x i8*]* %9, i64 0, i64 1
  %13 = bitcast i8** %12 to i64***
  store i64** %4, i64*** %13, align 8
  %14 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %5, %struct.dim3* nonnull %6, i64* nonnull %7, i8** nonnull %8)
  %15 = load i64, i64* %7, align 8
  %16 = bitcast i8** %8 to %struct.ihipStream_t**
  %17 = load %struct.ihipStream_t*, %struct.ihipStream_t** %16, align 8
  %18 = bitcast %struct.dim3* %5 to i64*
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %struct.dim3, %struct.dim3* %5, i64 0, i32 2
  %21 = load i32, i32* %20, align 8
  %22 = bitcast %struct.dim3* %6 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds %struct.dim3, %struct.dim3* %6, i64 0, i32 2
  %25 = load i32, i32* %24, align 8
  %26 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void (i32*, i64*)** @_Z13__d_incrementPiPl to i8*), i64 %19, i32 %21, i64 %23, i32 %25, i8** noundef nonnull %10, i64 noundef %15, %struct.ihipStream_t* noundef %17)
  ret void
}

declare dso_local i32 @__hipPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**) local_unnamed_addr

declare dso_local i32 @hipLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.ihipStream_t*) local_unnamed_addr

; Function Attrs: uwtable
define dso_local void @_Z13hip_incrementPiS_m(%struct.ClockTimes* noalias nocapture writeonly sret(%struct.ClockTimes) align 8 %0, i32* noundef %1, i32* noundef %2, i64 noundef %3) local_unnamed_addr #8 !dbg !2263 {
  %5 = alloca i8, align 1
  %6 = alloca i32*, align 8
  %7 = alloca i64*, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca %struct.dim3, align 8
  %10 = alloca i64, align 8
  %11 = alloca i8*, align 8
  %12 = alloca [2 x i8*], align 16
  %13 = alloca i32*, align 8
  %14 = alloca i64*, align 8
  %15 = alloca [6 x i64], align 16
  call void @llvm.dbg.value(metadata i32* %1, metadata !2268, metadata !DIExpression()), !dbg !2279
  call void @llvm.dbg.value(metadata i32* %2, metadata !2269, metadata !DIExpression()), !dbg !2279
  call void @llvm.dbg.value(metadata i64 %3, metadata !2270, metadata !DIExpression()), !dbg !2279
  %16 = shl i64 %3, 2, !dbg !2280
  call void @llvm.dbg.value(metadata i64 %16, metadata !2271, metadata !DIExpression()), !dbg !2279
  %17 = bitcast i32** %13 to i8*, !dbg !2281
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %17) #17, !dbg !2281
  %18 = bitcast i64** %14 to i8*, !dbg !2282
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %18) #17, !dbg !2282
  %19 = bitcast [6 x i64]* %15 to i8*, !dbg !2283
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %19) #17, !dbg !2283
  call void @llvm.dbg.declare(metadata [6 x i64]* %15, metadata !2275, metadata !DIExpression()), !dbg !2284
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(48) %19, i8 0, i64 48, i1 false), !dbg !2284
  %20 = bitcast i32** %13 to i8**, !dbg !2285
  call void @llvm.dbg.value(metadata i32** %13, metadata !2272, metadata !DIExpression(DW_OP_deref)), !dbg !2279
  %21 = call i32 @hipMalloc(i8** noundef nonnull %20, i64 noundef %16), !dbg !2286
  call void @llvm.dbg.value(metadata i32 %21, metadata !2229, metadata !DIExpression()), !dbg !2287
  %22 = icmp eq i32 %21, 0, !dbg !2289
  br i1 %22, label %27, label %23, !dbg !2290

23:                                               ; preds = %4
  %24 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2291
  %25 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %24, i32 noundef %21), !dbg !2292
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %25, metadata !2237, metadata !DIExpression()), !dbg !2293
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2293
  %26 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %25), !dbg !2295
  call void @exit(i32 noundef 1) #16, !dbg !2296
  unreachable, !dbg !2296

27:                                               ; preds = %4
  %28 = bitcast i64** %14 to i8**, !dbg !2297
  call void @llvm.dbg.value(metadata i64** %14, metadata !2273, metadata !DIExpression(DW_OP_deref)), !dbg !2279
  %29 = call i32 @hipMalloc(i8** noundef nonnull %28, i64 noundef 48), !dbg !2298
  call void @llvm.dbg.value(metadata i32 %29, metadata !2229, metadata !DIExpression()), !dbg !2299
  %30 = icmp eq i32 %29, 0, !dbg !2301
  br i1 %30, label %35, label %31, !dbg !2302

31:                                               ; preds = %27
  %32 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2303
  %33 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %32, i32 noundef %29), !dbg !2304
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %33, metadata !2237, metadata !DIExpression()), !dbg !2305
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2305
  %34 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %33), !dbg !2307
  call void @exit(i32 noundef 1) #16, !dbg !2308
  unreachable, !dbg !2308

35:                                               ; preds = %27
  %36 = load i8*, i8** %20, align 8, !dbg !2309, !tbaa !2259
  call void @llvm.dbg.value(metadata i32* undef, metadata !2272, metadata !DIExpression()), !dbg !2279
  %37 = bitcast i32* %2 to i8*, !dbg !2310
  %38 = call i32 @hipMemcpy(i8* noundef %36, i8* noundef %37, i64 noundef %16, i32 noundef 1), !dbg !2311
  call void @llvm.dbg.value(metadata i32 %38, metadata !2229, metadata !DIExpression()), !dbg !2312
  %39 = icmp eq i32 %38, 0, !dbg !2314
  br i1 %39, label %44, label %40, !dbg !2315

40:                                               ; preds = %35
  %41 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2316
  %42 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %41, i32 noundef %38), !dbg !2317
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %42, metadata !2237, metadata !DIExpression()), !dbg !2318
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2318
  %43 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %42), !dbg !2320
  call void @exit(i32 noundef 1) #16, !dbg !2321
  unreachable, !dbg !2321

44:                                               ; preds = %35
  %45 = load i8*, i8** %28, align 8, !dbg !2322, !tbaa !2259
  call void @llvm.dbg.value(metadata i64* undef, metadata !2273, metadata !DIExpression()), !dbg !2279
  %46 = getelementptr inbounds [6 x i64], [6 x i64]* %15, i64 0, i64 0, !dbg !2323
  %47 = call i32 @hipMemcpy(i8* noundef %45, i8* noundef nonnull %19, i64 noundef 48, i32 noundef 1), !dbg !2324
  call void @llvm.dbg.value(metadata i32 %47, metadata !2229, metadata !DIExpression()), !dbg !2325
  %48 = icmp eq i32 %47, 0, !dbg !2327
  br i1 %48, label %53, label %49, !dbg !2328

49:                                               ; preds = %44
  %50 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2329
  %51 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %50, i32 noundef %47), !dbg !2330
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %51, metadata !2237, metadata !DIExpression()), !dbg !2331
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2331
  %52 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %51), !dbg !2333
  call void @exit(i32 noundef 1) #16, !dbg !2334
  unreachable, !dbg !2334

53:                                               ; preds = %44
  %54 = and i64 %3, 4294967295, !dbg !2335
  %55 = or i64 %54, 4294967296, !dbg !2335
  %56 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 %55, i32 1, i64 noundef 0, %struct.ihipStream_t* noundef null), !dbg !2335
  %57 = icmp eq i32 %56, 0, !dbg !2335
  br i1 %57, label %58, label %85, !dbg !2335

58:                                               ; preds = %53
  %59 = load i32*, i32** %13, align 8, !dbg !2335, !tbaa !2259
  call void @llvm.dbg.value(metadata i32* %59, metadata !2272, metadata !DIExpression()), !dbg !2279
  %60 = load i64*, i64** %14, align 8, !dbg !2335, !tbaa !2259
  call void @llvm.dbg.value(metadata i64* %60, metadata !2273, metadata !DIExpression()), !dbg !2279
  %61 = bitcast i32** %6 to i8*, !dbg !2335
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %61), !dbg !2335
  %62 = bitcast i64** %7 to i8*, !dbg !2335
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %62), !dbg !2335
  %63 = bitcast %struct.dim3* %8 to i8*, !dbg !2335
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %63), !dbg !2335
  %64 = bitcast %struct.dim3* %9 to i8*, !dbg !2335
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %64), !dbg !2335
  %65 = bitcast i64* %10 to i8*, !dbg !2335
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %65), !dbg !2335
  %66 = bitcast i8** %11 to i8*, !dbg !2335
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %66), !dbg !2335
  %67 = bitcast [2 x i8*]* %12 to i8*, !dbg !2335
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %67), !dbg !2335
  store i32* %59, i32** %6, align 8, !dbg !2335, !tbaa !2259
  store i64* %60, i64** %7, align 8, !dbg !2335, !tbaa !2259
  %68 = getelementptr inbounds [2 x i8*], [2 x i8*]* %12, i64 0, i64 0, !dbg !2335
  %69 = bitcast [2 x i8*]* %12 to i32***, !dbg !2335
  store i32** %6, i32*** %69, align 16, !dbg !2335
  %70 = getelementptr inbounds [2 x i8*], [2 x i8*]* %12, i64 0, i64 1, !dbg !2335
  %71 = bitcast i8** %70 to i64***, !dbg !2335
  store i64** %7, i64*** %71, align 8, !dbg !2335
  %72 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %8, %struct.dim3* nonnull %9, i64* nonnull %10, i8** nonnull %11), !dbg !2335
  %73 = load i64, i64* %10, align 8, !dbg !2335
  %74 = bitcast i8** %11 to %struct.ihipStream_t**, !dbg !2335
  %75 = load %struct.ihipStream_t*, %struct.ihipStream_t** %74, align 8, !dbg !2335
  %76 = bitcast %struct.dim3* %8 to i64*, !dbg !2335
  %77 = load i64, i64* %76, align 8, !dbg !2335
  %78 = getelementptr inbounds %struct.dim3, %struct.dim3* %8, i64 0, i32 2, !dbg !2335
  %79 = load i32, i32* %78, align 8, !dbg !2335
  %80 = bitcast %struct.dim3* %9 to i64*, !dbg !2335
  %81 = load i64, i64* %80, align 8, !dbg !2335
  %82 = getelementptr inbounds %struct.dim3, %struct.dim3* %9, i64 0, i32 2, !dbg !2335
  %83 = load i32, i32* %82, align 8, !dbg !2335
  %84 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void (i32*, i64*)** @_Z13__d_incrementPiPl to i8*), i64 %77, i32 %79, i64 %81, i32 %83, i8** noundef nonnull %68, i64 noundef %73, %struct.ihipStream_t* noundef %75), !dbg !2335
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %61), !dbg !2335
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %62), !dbg !2335
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %63), !dbg !2335
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %64), !dbg !2335
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %65), !dbg !2335
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %66), !dbg !2335
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %67), !dbg !2335
  br label %85, !dbg !2335

85:                                               ; preds = %58, %53
  %86 = call i32 @hipDeviceSynchronize(), !dbg !2337
  call void @llvm.dbg.value(metadata i32 %86, metadata !2229, metadata !DIExpression()), !dbg !2338
  %87 = icmp eq i32 %86, 0, !dbg !2340
  br i1 %87, label %92, label %88, !dbg !2341

88:                                               ; preds = %85
  %89 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2342
  %90 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %89, i32 noundef %86), !dbg !2343
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %90, metadata !2237, metadata !DIExpression()), !dbg !2344
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2344
  %91 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %90), !dbg !2346
  call void @exit(i32 noundef 1) #16, !dbg !2347
  unreachable, !dbg !2347

92:                                               ; preds = %85
  %93 = bitcast i32* %1 to i8*, !dbg !2348
  %94 = load i8*, i8** %20, align 8, !dbg !2349, !tbaa !2259
  call void @llvm.dbg.value(metadata i32* undef, metadata !2272, metadata !DIExpression()), !dbg !2279
  %95 = call i32 @hipMemcpy(i8* noundef %93, i8* noundef %94, i64 noundef %16, i32 noundef 2), !dbg !2350
  call void @llvm.dbg.value(metadata i32 %95, metadata !2229, metadata !DIExpression()), !dbg !2351
  %96 = icmp eq i32 %95, 0, !dbg !2353
  br i1 %96, label %101, label %97, !dbg !2354

97:                                               ; preds = %92
  %98 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2355
  %99 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %98, i32 noundef %95), !dbg !2356
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %99, metadata !2237, metadata !DIExpression()), !dbg !2357
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2357
  %100 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %99), !dbg !2359
  call void @exit(i32 noundef 1) #16, !dbg !2360
  unreachable, !dbg !2360

101:                                              ; preds = %92
  %102 = load i8*, i8** %28, align 8, !dbg !2361, !tbaa !2259
  call void @llvm.dbg.value(metadata i64* undef, metadata !2273, metadata !DIExpression()), !dbg !2279
  %103 = call i32 @hipMemcpy(i8* noundef nonnull %19, i8* noundef %102, i64 noundef 48, i32 noundef 2), !dbg !2362
  call void @llvm.dbg.value(metadata i32 %103, metadata !2229, metadata !DIExpression()), !dbg !2363
  %104 = icmp eq i32 %103, 0, !dbg !2365
  br i1 %104, label %109, label %105, !dbg !2366

105:                                              ; preds = %101
  %106 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2367
  %107 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %106, i32 noundef %103), !dbg !2368
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %107, metadata !2237, metadata !DIExpression()), !dbg !2369
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2369
  %108 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %107), !dbg !2371
  call void @exit(i32 noundef 1) #16, !dbg !2372
  unreachable, !dbg !2372

109:                                              ; preds = %101
  %110 = load i8*, i8** %20, align 8, !dbg !2373, !tbaa !2259
  call void @llvm.dbg.value(metadata i32* undef, metadata !2272, metadata !DIExpression()), !dbg !2279
  %111 = call i32 @hipFree(i8* noundef %110), !dbg !2374
  call void @llvm.dbg.value(metadata i32 %111, metadata !2229, metadata !DIExpression()), !dbg !2375
  %112 = icmp eq i32 %111, 0, !dbg !2377
  br i1 %112, label %117, label %113, !dbg !2378

113:                                              ; preds = %109
  %114 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2379
  %115 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %114, i32 noundef %111), !dbg !2380
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %115, metadata !2237, metadata !DIExpression()), !dbg !2381
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2381
  %116 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %115), !dbg !2383
  call void @exit(i32 noundef 1) #16, !dbg !2384
  unreachable, !dbg !2384

117:                                              ; preds = %109
  %118 = load i8*, i8** %28, align 8, !dbg !2385, !tbaa !2259
  call void @llvm.dbg.value(metadata i64* undef, metadata !2273, metadata !DIExpression()), !dbg !2279
  %119 = call i32 @hipFree(i8* noundef %118), !dbg !2386
  call void @llvm.dbg.value(metadata i32 %119, metadata !2229, metadata !DIExpression()), !dbg !2387
  %120 = icmp eq i32 %119, 0, !dbg !2389
  br i1 %120, label %125, label %121, !dbg !2390

121:                                              ; preds = %117
  %122 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2391
  %123 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %122, i32 noundef %119), !dbg !2392
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %123, metadata !2237, metadata !DIExpression()), !dbg !2393
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2393
  %124 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %123), !dbg !2395
  call void @exit(i32 noundef 1) #16, !dbg !2396
  unreachable, !dbg !2396

125:                                              ; preds = %117
  %126 = load i64, i64* %46, align 16, !dbg !2397, !tbaa !2399
  %127 = icmp eq i64 %126, 0, !dbg !2401
  %128 = getelementptr inbounds [6 x i64], [6 x i64]* %15, i64 0, i64 1
  %129 = load i64, i64* %128, align 8
  %130 = icmp eq i64 %129, 0
  %131 = select i1 %127, i1 %130, i1 false, !dbg !2402
  %132 = getelementptr inbounds [6 x i64], [6 x i64]* %15, i64 0, i64 2
  %133 = load i64, i64* %132, align 16
  %134 = icmp eq i64 %133, 0
  %135 = select i1 %131, i1 %134, i1 false, !dbg !2402
  %136 = getelementptr inbounds [6 x i64], [6 x i64]* %15, i64 0, i64 3
  %137 = load i64, i64* %136, align 8
  %138 = icmp eq i64 %137, 0
  %139 = select i1 %135, i1 %138, i1 false, !dbg !2402
  %140 = getelementptr inbounds [6 x i64], [6 x i64]* %15, i64 0, i64 4
  %141 = load i64, i64* %140, align 16
  %142 = icmp eq i64 %141, 0
  %143 = select i1 %139, i1 %142, i1 false, !dbg !2402
  %144 = getelementptr inbounds [6 x i64], [6 x i64]* %15, i64 0, i64 5
  %145 = load i64, i64* %144, align 8
  %146 = icmp eq i64 %145, 0
  %147 = select i1 %143, i1 %146, i1 false, !dbg !2402
  br i1 %147, label %148, label %151, !dbg !2402

148:                                              ; preds = %125
  %149 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i64 0, i64 0)), !dbg !2403
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %149, metadata !2237, metadata !DIExpression()), !dbg !2405
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2405
  %150 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %149), !dbg !2407
  call void @exit(i32 noundef 1) #16, !dbg !2408
  unreachable, !dbg !2408

151:                                              ; preds = %125
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %5), !dbg !2409
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2415, metadata !DIExpression()), !dbg !2409
  call void @llvm.dbg.value(metadata i8 123, metadata !2416, metadata !DIExpression()), !dbg !2409
  store i8 123, i8* %5, align 1, !tbaa !2474
  call void @llvm.dbg.value(metadata i8* %5, metadata !2416, metadata !DIExpression(DW_OP_deref)), !dbg !2409
  %152 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull %5, i64 noundef 1), !dbg !2475
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %5), !dbg !2476
  %153 = load i64, i64* %46, align 16, !dbg !2477, !tbaa !2399
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %152, metadata !2478, metadata !DIExpression()), !dbg !2485
  call void @llvm.dbg.value(metadata i64 %153, metadata !2484, metadata !DIExpression()), !dbg !2485
  %154 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %152, i64 noundef %153), !dbg !2487
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %154, metadata !2488, metadata !DIExpression()), !dbg !2494
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2494
  %155 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %154, i8* noundef nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i64 noundef 2), !dbg !2496
  %156 = load i64, i64* %128, align 8, !dbg !2498, !tbaa !2399
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %154, metadata !2478, metadata !DIExpression()), !dbg !2499
  call void @llvm.dbg.value(metadata i64 %156, metadata !2484, metadata !DIExpression()), !dbg !2499
  %157 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %154, i64 noundef %156), !dbg !2501
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %157, metadata !2488, metadata !DIExpression()), !dbg !2502
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2502
  %158 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %157, i8* noundef nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i64 noundef 2), !dbg !2504
  %159 = load i64, i64* %132, align 16, !dbg !2505, !tbaa !2399
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %157, metadata !2478, metadata !DIExpression()), !dbg !2506
  call void @llvm.dbg.value(metadata i64 %159, metadata !2484, metadata !DIExpression()), !dbg !2506
  %160 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %157, i64 noundef %159), !dbg !2508
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %160, metadata !2488, metadata !DIExpression()), !dbg !2509
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2509
  %161 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %160, i8* noundef nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i64 noundef 2), !dbg !2511
  %162 = load i64, i64* %136, align 8, !dbg !2512, !tbaa !2399
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %160, metadata !2478, metadata !DIExpression()), !dbg !2513
  call void @llvm.dbg.value(metadata i64 %162, metadata !2484, metadata !DIExpression()), !dbg !2513
  %163 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %160, i64 noundef %162), !dbg !2515
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %163, metadata !2488, metadata !DIExpression()), !dbg !2516
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2516
  %164 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %163, i8* noundef nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i64 noundef 2), !dbg !2518
  %165 = load i64, i64* %140, align 16, !dbg !2519, !tbaa !2399
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %163, metadata !2478, metadata !DIExpression()), !dbg !2520
  call void @llvm.dbg.value(metadata i64 %165, metadata !2484, metadata !DIExpression()), !dbg !2520
  %166 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %163, i64 noundef %165), !dbg !2522
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %166, metadata !2488, metadata !DIExpression()), !dbg !2523
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2523
  %167 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %166, i8* noundef nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i64 noundef 2), !dbg !2525
  %168 = load i64, i64* %144, align 8, !dbg !2526, !tbaa !2399
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %166, metadata !2478, metadata !DIExpression()), !dbg !2527
  call void @llvm.dbg.value(metadata i64 %168, metadata !2484, metadata !DIExpression()), !dbg !2527
  %169 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %166, i64 noundef %168), !dbg !2529
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %169, metadata !2488, metadata !DIExpression()), !dbg !2530
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2530
  %170 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %169, i8* noundef nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0), i64 noundef 1), !dbg !2532
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %169, metadata !2237, metadata !DIExpression()), !dbg !2533
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2533
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %169, metadata !2535, metadata !DIExpression()), !dbg !2541
  %171 = bitcast %"class.std::basic_ostream"* %169 to i8**, !dbg !2543
  %172 = load i8*, i8** %171, align 8, !dbg !2543, !tbaa !2544
  %173 = getelementptr i8, i8* %172, i64 -24, !dbg !2543
  %174 = bitcast i8* %173 to i64*, !dbg !2543
  %175 = load i64, i64* %174, align 8, !dbg !2543
  %176 = bitcast %"class.std::basic_ostream"* %169 to i8*, !dbg !2543
  %177 = getelementptr inbounds i8, i8* %176, i64 %175, !dbg !2543
  call void @llvm.dbg.value(metadata i8* %177, metadata !2546, metadata !DIExpression()), !dbg !2560
  call void @llvm.dbg.value(metadata i8 10, metadata !2558, metadata !DIExpression()), !dbg !2560
  %178 = getelementptr inbounds i8, i8* %177, i64 240, !dbg !2562
  %179 = bitcast i8* %178 to %"class.std::ctype"**, !dbg !2562
  %180 = load %"class.std::ctype"*, %"class.std::ctype"** %179, align 8, !dbg !2562, !tbaa !2563
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %180, metadata !2572, metadata !DIExpression()), !dbg !2584
  %181 = icmp eq %"class.std::ctype"* %180, null, !dbg !2586
  br i1 %181, label %182, label %183, !dbg !2588

182:                                              ; preds = %151
  call void @_ZSt16__throw_bad_castv() #18, !dbg !2589
  unreachable, !dbg !2589

183:                                              ; preds = %151
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %180, metadata !2590, metadata !DIExpression()), !dbg !2599
  call void @llvm.dbg.value(metadata i8 10, metadata !2598, metadata !DIExpression()), !dbg !2599
  %184 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %180, i64 0, i32 8, !dbg !2601
  %185 = load i8, i8* %184, align 8, !dbg !2601, !tbaa !2603
  %186 = icmp eq i8 %185, 0, !dbg !2601
  br i1 %186, label %190, label %187, !dbg !2606

187:                                              ; preds = %183
  %188 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %180, i64 0, i32 9, i64 10, !dbg !2607
  %189 = load i8, i8* %188, align 1, !dbg !2607, !tbaa !2474
  br label %196, !dbg !2608

190:                                              ; preds = %183
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %180), !dbg !2609
  %191 = bitcast %"class.std::ctype"* %180 to i8 (%"class.std::ctype"*, i8)***, !dbg !2610
  %192 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %191, align 8, !dbg !2610, !tbaa !2544
  %193 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %192, i64 6, !dbg !2610
  %194 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %193, align 8, !dbg !2610
  %195 = call noundef signext i8 %194(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %180, i8 noundef signext 10), !dbg !2610
  br label %196, !dbg !2611

196:                                              ; preds = %187, %190
  %197 = phi i8 [ %189, %187 ], [ %195, %190 ], !dbg !2599
  %198 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %169, i8 noundef signext %197), !dbg !2612
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %198, metadata !2613, metadata !DIExpression()), !dbg !2616
  %199 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %198), !dbg !2618
  %200 = bitcast i64* %136 to <2 x i64>*, !dbg !2619
  %201 = load <2 x i64>, <2 x i64>* %200, align 8, !dbg !2619, !tbaa !2399
  %202 = bitcast [6 x i64]* %15 to <2 x i64>*, !dbg !2620
  %203 = load <2 x i64>, <2 x i64>* %202, align 16, !dbg !2620, !tbaa !2399
  %204 = sub nsw <2 x i64> %201, %203, !dbg !2621
  %205 = bitcast %struct.ClockTimes* %0 to <2 x i64>*, !dbg !2622
  store <2 x i64> %204, <2 x i64>* %205, align 8, !dbg !2622, !tbaa !2399
  %206 = getelementptr inbounds %struct.ClockTimes, %struct.ClockTimes* %0, i64 0, i32 2, !dbg !2622
  %207 = load i64, i64* %144, align 8, !dbg !2623, !tbaa !2399
  %208 = load i64, i64* %132, align 16, !dbg !2624, !tbaa !2399
  %209 = sub nsw i64 %207, %208, !dbg !2625
  store i64 %209, i64* %206, align 8, !dbg !2622, !tbaa !2626
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %19) #17, !dbg !2628
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %18) #17, !dbg !2628
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %17) #17, !dbg !2628
  ret void, !dbg !2628
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #9

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #10

declare !dbg !2629 dso_local i32 @hipMalloc(i8** noundef, i64 noundef) local_unnamed_addr #0

declare !dbg !2632 dso_local i32 @hipMemcpy(i8* noundef, i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare dso_local i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, %struct.ihipStream_t* noundef) local_unnamed_addr #0

declare !dbg !2636 dso_local i32 @hipDeviceSynchronize() local_unnamed_addr #0

declare !dbg !2639 dso_local i32 @hipFree(i8* noundef) local_unnamed_addr #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #9

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z14norm_incrementPiS_m(i32* nocapture noundef writeonly %0, i32* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #11 !dbg !2642 {
  call void @llvm.dbg.value(metadata i32* %0, metadata !2646, metadata !DIExpression()), !dbg !2651
  call void @llvm.dbg.value(metadata i32* %1, metadata !2647, metadata !DIExpression()), !dbg !2651
  call void @llvm.dbg.value(metadata i64 %2, metadata !2648, metadata !DIExpression()), !dbg !2651
  call void @llvm.dbg.value(metadata i64 0, metadata !2649, metadata !DIExpression()), !dbg !2652
  %4 = ptrtoint i32* %1 to i64
  %5 = ptrtoint i32* %0 to i64
  %6 = add i64 %2, -1
  call void @llvm.dbg.value(metadata i64 0, metadata !2649, metadata !DIExpression()), !dbg !2652
  %7 = icmp eq i64 %6, 0, !dbg !2653
  br i1 %7, label %95, label %8, !dbg !2655

8:                                                ; preds = %3
  %9 = icmp ult i64 %6, 8, !dbg !2655
  br i1 %9, label %75, label %10, !dbg !2655

10:                                               ; preds = %8
  %11 = add i64 %5, 4, !dbg !2655
  %12 = sub i64 %11, %4, !dbg !2655
  %13 = icmp ult i64 %12, 32, !dbg !2655
  br i1 %13, label %75, label %14, !dbg !2655

14:                                               ; preds = %10
  %15 = and i64 %6, -8, !dbg !2655
  %16 = add i64 %15, -8, !dbg !2655
  %17 = lshr exact i64 %16, 3, !dbg !2655
  %18 = add nuw nsw i64 %17, 1, !dbg !2655
  %19 = and i64 %18, 1, !dbg !2655
  %20 = icmp eq i64 %16, 0, !dbg !2655
  br i1 %20, label %56, label %21, !dbg !2655

21:                                               ; preds = %14
  %22 = and i64 %18, 4611686018427387902, !dbg !2655
  br label %23, !dbg !2655

23:                                               ; preds = %23, %21
  %24 = phi i64 [ 0, %21 ], [ %53, %23 ], !dbg !2656
  %25 = phi i64 [ 0, %21 ], [ %54, %23 ]
  %26 = getelementptr inbounds i32, i32* %1, i64 %24, !dbg !2657
  %27 = bitcast i32* %26 to <4 x i32>*, !dbg !2657
  %28 = load <4 x i32>, <4 x i32>* %27, align 4, !dbg !2657, !tbaa !2658
  %29 = getelementptr inbounds i32, i32* %26, i64 4, !dbg !2657
  %30 = bitcast i32* %29 to <4 x i32>*, !dbg !2657
  %31 = load <4 x i32>, <4 x i32>* %30, align 4, !dbg !2657, !tbaa !2658
  %32 = add nsw <4 x i32> %28, <i32 1, i32 1, i32 1, i32 1>, !dbg !2659
  %33 = add nsw <4 x i32> %31, <i32 1, i32 1, i32 1, i32 1>, !dbg !2659
  %34 = or i64 %24, 1, !dbg !2656
  %35 = getelementptr inbounds i32, i32* %0, i64 %34, !dbg !2660
  %36 = bitcast i32* %35 to <4 x i32>*, !dbg !2661
  store <4 x i32> %32, <4 x i32>* %36, align 4, !dbg !2661, !tbaa !2658
  %37 = getelementptr inbounds i32, i32* %35, i64 4, !dbg !2661
  %38 = bitcast i32* %37 to <4 x i32>*, !dbg !2661
  store <4 x i32> %33, <4 x i32>* %38, align 4, !dbg !2661, !tbaa !2658
  %39 = or i64 %24, 8, !dbg !2656
  %40 = getelementptr inbounds i32, i32* %1, i64 %39, !dbg !2657
  %41 = bitcast i32* %40 to <4 x i32>*, !dbg !2657
  %42 = load <4 x i32>, <4 x i32>* %41, align 4, !dbg !2657, !tbaa !2658
  %43 = getelementptr inbounds i32, i32* %40, i64 4, !dbg !2657
  %44 = bitcast i32* %43 to <4 x i32>*, !dbg !2657
  %45 = load <4 x i32>, <4 x i32>* %44, align 4, !dbg !2657, !tbaa !2658
  %46 = add nsw <4 x i32> %42, <i32 1, i32 1, i32 1, i32 1>, !dbg !2659
  %47 = add nsw <4 x i32> %45, <i32 1, i32 1, i32 1, i32 1>, !dbg !2659
  %48 = or i64 %24, 9, !dbg !2656
  %49 = getelementptr inbounds i32, i32* %0, i64 %48, !dbg !2660
  %50 = bitcast i32* %49 to <4 x i32>*, !dbg !2661
  store <4 x i32> %46, <4 x i32>* %50, align 4, !dbg !2661, !tbaa !2658
  %51 = getelementptr inbounds i32, i32* %49, i64 4, !dbg !2661
  %52 = bitcast i32* %51 to <4 x i32>*, !dbg !2661
  store <4 x i32> %47, <4 x i32>* %52, align 4, !dbg !2661, !tbaa !2658
  %53 = add nuw i64 %24, 16, !dbg !2656
  %54 = add i64 %25, 2, !dbg !2656
  %55 = icmp eq i64 %54, %22, !dbg !2656
  br i1 %55, label %56, label %23, !dbg !2656, !llvm.loop !2662

56:                                               ; preds = %23, %14
  %57 = phi i64 [ 0, %14 ], [ %53, %23 ]
  %58 = icmp eq i64 %19, 0, !dbg !2656
  br i1 %58, label %73, label %59, !dbg !2656

59:                                               ; preds = %56
  %60 = getelementptr inbounds i32, i32* %1, i64 %57, !dbg !2657
  %61 = bitcast i32* %60 to <4 x i32>*, !dbg !2657
  %62 = load <4 x i32>, <4 x i32>* %61, align 4, !dbg !2657, !tbaa !2658
  %63 = getelementptr inbounds i32, i32* %60, i64 4, !dbg !2657
  %64 = bitcast i32* %63 to <4 x i32>*, !dbg !2657
  %65 = load <4 x i32>, <4 x i32>* %64, align 4, !dbg !2657, !tbaa !2658
  %66 = add nsw <4 x i32> %62, <i32 1, i32 1, i32 1, i32 1>, !dbg !2659
  %67 = add nsw <4 x i32> %65, <i32 1, i32 1, i32 1, i32 1>, !dbg !2659
  %68 = or i64 %57, 1, !dbg !2656
  %69 = getelementptr inbounds i32, i32* %0, i64 %68, !dbg !2660
  %70 = bitcast i32* %69 to <4 x i32>*, !dbg !2661
  store <4 x i32> %66, <4 x i32>* %70, align 4, !dbg !2661, !tbaa !2658
  %71 = getelementptr inbounds i32, i32* %69, i64 4, !dbg !2661
  %72 = bitcast i32* %71 to <4 x i32>*, !dbg !2661
  store <4 x i32> %67, <4 x i32>* %72, align 4, !dbg !2661, !tbaa !2658
  br label %73, !dbg !2655

73:                                               ; preds = %56, %59
  %74 = icmp eq i64 %6, %15, !dbg !2655
  br i1 %74, label %95, label %75, !dbg !2655

75:                                               ; preds = %10, %8, %73
  %76 = phi i64 [ 0, %10 ], [ 0, %8 ], [ %15, %73 ]
  %77 = add i64 %2, 3, !dbg !2655
  %78 = add i64 %2, -2, !dbg !2655
  %79 = sub i64 %78, %76, !dbg !2655
  %80 = and i64 %77, 3, !dbg !2655
  %81 = icmp eq i64 %80, 0, !dbg !2655
  br i1 %81, label %92, label %82, !dbg !2655

82:                                               ; preds = %75, %82
  %83 = phi i64 [ %88, %82 ], [ %76, %75 ]
  %84 = phi i64 [ %90, %82 ], [ 0, %75 ]
  call void @llvm.dbg.value(metadata i64 %83, metadata !2649, metadata !DIExpression()), !dbg !2652
  %85 = getelementptr inbounds i32, i32* %1, i64 %83, !dbg !2657
  %86 = load i32, i32* %85, align 4, !dbg !2657, !tbaa !2658
  %87 = add nsw i32 %86, 1, !dbg !2659
  %88 = add nuw i64 %83, 1, !dbg !2656
  %89 = getelementptr inbounds i32, i32* %0, i64 %88, !dbg !2660
  store i32 %87, i32* %89, align 4, !dbg !2661, !tbaa !2658
  call void @llvm.dbg.value(metadata i64 %88, metadata !2649, metadata !DIExpression()), !dbg !2652
  %90 = add i64 %84, 1, !dbg !2655
  %91 = icmp eq i64 %90, %80, !dbg !2655
  br i1 %91, label %92, label %82, !dbg !2655, !llvm.loop !2666

92:                                               ; preds = %82, %75
  %93 = phi i64 [ %76, %75 ], [ %88, %82 ]
  %94 = icmp ult i64 %79, 3, !dbg !2655
  br i1 %94, label %95, label %96, !dbg !2655

95:                                               ; preds = %92, %96, %73, %3
  ret void, !dbg !2668

96:                                               ; preds = %92, %96
  %97 = phi i64 [ %116, %96 ], [ %93, %92 ]
  call void @llvm.dbg.value(metadata i64 %97, metadata !2649, metadata !DIExpression()), !dbg !2652
  %98 = getelementptr inbounds i32, i32* %1, i64 %97, !dbg !2657
  %99 = load i32, i32* %98, align 4, !dbg !2657, !tbaa !2658
  %100 = add nsw i32 %99, 1, !dbg !2659
  %101 = add nuw i64 %97, 1, !dbg !2656
  %102 = getelementptr inbounds i32, i32* %0, i64 %101, !dbg !2660
  store i32 %100, i32* %102, align 4, !dbg !2661, !tbaa !2658
  call void @llvm.dbg.value(metadata i64 %101, metadata !2649, metadata !DIExpression()), !dbg !2652
  call void @llvm.dbg.value(metadata i64 %101, metadata !2649, metadata !DIExpression()), !dbg !2652
  %103 = getelementptr inbounds i32, i32* %1, i64 %101, !dbg !2657
  %104 = load i32, i32* %103, align 4, !dbg !2657, !tbaa !2658
  %105 = add nsw i32 %104, 1, !dbg !2659
  %106 = add nuw i64 %97, 2, !dbg !2656
  %107 = getelementptr inbounds i32, i32* %0, i64 %106, !dbg !2660
  store i32 %105, i32* %107, align 4, !dbg !2661, !tbaa !2658
  call void @llvm.dbg.value(metadata i64 %106, metadata !2649, metadata !DIExpression()), !dbg !2652
  call void @llvm.dbg.value(metadata i64 %106, metadata !2649, metadata !DIExpression()), !dbg !2652
  %108 = getelementptr inbounds i32, i32* %1, i64 %106, !dbg !2657
  %109 = load i32, i32* %108, align 4, !dbg !2657, !tbaa !2658
  %110 = add nsw i32 %109, 1, !dbg !2659
  %111 = add nuw i64 %97, 3, !dbg !2656
  %112 = getelementptr inbounds i32, i32* %0, i64 %111, !dbg !2660
  store i32 %110, i32* %112, align 4, !dbg !2661, !tbaa !2658
  call void @llvm.dbg.value(metadata i64 %111, metadata !2649, metadata !DIExpression()), !dbg !2652
  call void @llvm.dbg.value(metadata i64 %111, metadata !2649, metadata !DIExpression()), !dbg !2652
  %113 = getelementptr inbounds i32, i32* %1, i64 %111, !dbg !2657
  %114 = load i32, i32* %113, align 4, !dbg !2657, !tbaa !2658
  %115 = add nsw i32 %114, 1, !dbg !2659
  %116 = add nuw i64 %97, 4, !dbg !2656
  %117 = getelementptr inbounds i32, i32* %0, i64 %116, !dbg !2660
  store i32 %115, i32* %117, align 4, !dbg !2661, !tbaa !2658
  call void @llvm.dbg.value(metadata i64 %116, metadata !2649, metadata !DIExpression()), !dbg !2652
  %118 = icmp eq i64 %116, %6, !dbg !2653
  br i1 %118, label %95, label %96, !dbg !2655, !llvm.loop !2669
}

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #7 !dbg !2670 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ClockTimes, align 8
  call void @llvm.dbg.value(metadata i64 4096, metadata !2672, metadata !DIExpression()), !dbg !2690
  call void @llvm.dbg.value(metadata i64 4096, metadata !2673, metadata !DIExpression()), !dbg !2690
  %3 = tail call noalias noundef nonnull dereferenceable(16384) i8* @_Znam(i64 noundef 16384) #19, !dbg !2691, !heapallocsite !291
  %4 = bitcast i8* %3 to i32*, !dbg !2691
  call void @llvm.dbg.value(metadata i32* %4, metadata !2674, metadata !DIExpression()), !dbg !2690
  call void @llvm.dbg.value(metadata i32* poison, metadata !2675, metadata !DIExpression()), !dbg !2690
  %5 = tail call noalias noundef nonnull dereferenceable(16384) i8* @_Znam(i64 noundef 16384) #19, !dbg !2692, !heapallocsite !291
  %6 = bitcast i8* %5 to i32*, !dbg !2692
  call void @llvm.dbg.value(metadata i32* %6, metadata !2676, metadata !DIExpression()), !dbg !2690
  call void @llvm.dbg.value(metadata i64 0, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i64 0, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i64 0, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i32 0, metadata !2678, metadata !DIExpression()), !dbg !2690
  %7 = bitcast i32* %1 to i8*, !dbg !2693
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #17, !dbg !2693
  call void @llvm.dbg.value(metadata i32 0, metadata !2679, metadata !DIExpression()), !dbg !2690
  store i32 0, i32* %1, align 4, !dbg !2694, !tbaa !2658
  call void @llvm.dbg.value(metadata i32* %1, metadata !2679, metadata !DIExpression(DW_OP_deref)), !dbg !2690
  %8 = call i32 @hipDeviceGetAttribute(i32* noundef nonnull %1, i32 noundef 10017, i32 noundef 0), !dbg !2695
  call void @llvm.dbg.value(metadata i32 %8, metadata !2229, metadata !DIExpression()), !dbg !2696
  %9 = icmp eq i32 %8, 0, !dbg !2698
  br i1 %9, label %14, label %10, !dbg !2699

10:                                               ; preds = %0
  %11 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)), !dbg !2700
  %12 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %11, i32 noundef %8), !dbg !2701
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %12, metadata !2237, metadata !DIExpression()), !dbg !2702
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2702
  %13 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %12), !dbg !2704
  call void @exit(i32 noundef 1) #16, !dbg !2705
  unreachable, !dbg !2705

14:                                               ; preds = %0
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2488, metadata !DIExpression()), !dbg !2706
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2706
  %15 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i64 0, i64 0), i64 noundef 28), !dbg !2708
  %16 = load i32, i32* %1, align 4, !dbg !2709, !tbaa !2658
  call void @llvm.dbg.value(metadata i32 %16, metadata !2679, metadata !DIExpression()), !dbg !2690
  %17 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %16), !dbg !2710
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %17, metadata !2488, metadata !DIExpression()), !dbg !2711
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2711
  %18 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %17, i8* noundef nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 noundef 4), !dbg !2713
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %17, metadata !2237, metadata !DIExpression()), !dbg !2714
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2714
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %17, metadata !2535, metadata !DIExpression()), !dbg !2716
  %19 = bitcast %"class.std::basic_ostream"* %17 to i8**, !dbg !2718
  %20 = load i8*, i8** %19, align 8, !dbg !2718, !tbaa !2544
  %21 = getelementptr i8, i8* %20, i64 -24, !dbg !2718
  %22 = bitcast i8* %21 to i64*, !dbg !2718
  %23 = load i64, i64* %22, align 8, !dbg !2718
  %24 = bitcast %"class.std::basic_ostream"* %17 to i8*, !dbg !2718
  %25 = getelementptr inbounds i8, i8* %24, i64 %23, !dbg !2718
  call void @llvm.dbg.value(metadata i8* %25, metadata !2546, metadata !DIExpression()), !dbg !2719
  call void @llvm.dbg.value(metadata i8 10, metadata !2558, metadata !DIExpression()), !dbg !2719
  %26 = getelementptr inbounds i8, i8* %25, i64 240, !dbg !2721
  %27 = bitcast i8* %26 to %"class.std::ctype"**, !dbg !2721
  %28 = load %"class.std::ctype"*, %"class.std::ctype"** %27, align 8, !dbg !2721, !tbaa !2563
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %28, metadata !2572, metadata !DIExpression()), !dbg !2722
  %29 = icmp eq %"class.std::ctype"* %28, null, !dbg !2724
  br i1 %29, label %30, label %31, !dbg !2725

30:                                               ; preds = %14
  call void @_ZSt16__throw_bad_castv() #18, !dbg !2726
  unreachable, !dbg !2726

31:                                               ; preds = %14
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %28, metadata !2590, metadata !DIExpression()), !dbg !2727
  call void @llvm.dbg.value(metadata i8 10, metadata !2598, metadata !DIExpression()), !dbg !2727
  %32 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %28, i64 0, i32 8, !dbg !2729
  %33 = load i8, i8* %32, align 8, !dbg !2729, !tbaa !2603
  %34 = icmp eq i8 %33, 0, !dbg !2729
  br i1 %34, label %38, label %35, !dbg !2730

35:                                               ; preds = %31
  %36 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %28, i64 0, i32 9, i64 10, !dbg !2731
  %37 = load i8, i8* %36, align 1, !dbg !2731, !tbaa !2474
  br label %44, !dbg !2732

38:                                               ; preds = %31
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %28), !dbg !2733
  %39 = bitcast %"class.std::ctype"* %28 to i8 (%"class.std::ctype"*, i8)***, !dbg !2734
  %40 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %39, align 8, !dbg !2734, !tbaa !2544
  %41 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %40, i64 6, !dbg !2734
  %42 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %41, align 8, !dbg !2734
  %43 = call noundef signext i8 %42(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %28, i8 noundef signext 10), !dbg !2734
  br label %44, !dbg !2735

44:                                               ; preds = %35, %38
  %45 = phi i8 [ %37, %35 ], [ %43, %38 ], !dbg !2727
  %46 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %17, i8 noundef signext %45), !dbg !2736
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %46, metadata !2613, metadata !DIExpression()), !dbg !2737
  %47 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %46), !dbg !2739
  call void @llvm.dbg.value(metadata i32 0, metadata !2680, metadata !DIExpression()), !dbg !2740
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16384) %3, i8 0, i64 16384, i1 false), !dbg !2741, !tbaa !2658
  call void @llvm.dbg.value(metadata i32 undef, metadata !2680, metadata !DIExpression()), !dbg !2740
  call void @llvm.dbg.value(metadata i32 undef, metadata !2680, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !2740
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2488, metadata !DIExpression()), !dbg !2743
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.6, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2743
  %48 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @.str.6, i64 0, i64 0), i64 noundef 34), !dbg !2745
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2746, metadata !DIExpression()), !dbg !2753
  call void @llvm.dbg.value(metadata i64 4096, metadata !2752, metadata !DIExpression()), !dbg !2753
  %49 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef 4096), !dbg !2755
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %49, metadata !2488, metadata !DIExpression()), !dbg !2756
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2756
  %50 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %49, i8* noundef nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i64 noundef 13), !dbg !2758
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %49, metadata !2746, metadata !DIExpression()), !dbg !2759
  call void @llvm.dbg.value(metadata i64 4096, metadata !2752, metadata !DIExpression()), !dbg !2759
  %51 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %49, i64 noundef 4096), !dbg !2761
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %51, metadata !2237, metadata !DIExpression()), !dbg !2762
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2762
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %51, metadata !2535, metadata !DIExpression()), !dbg !2764
  %52 = bitcast %"class.std::basic_ostream"* %51 to i8**, !dbg !2766
  %53 = load i8*, i8** %52, align 8, !dbg !2766, !tbaa !2544
  %54 = getelementptr i8, i8* %53, i64 -24, !dbg !2766
  %55 = bitcast i8* %54 to i64*, !dbg !2766
  %56 = load i64, i64* %55, align 8, !dbg !2766
  %57 = bitcast %"class.std::basic_ostream"* %51 to i8*, !dbg !2766
  %58 = getelementptr inbounds i8, i8* %57, i64 %56, !dbg !2766
  call void @llvm.dbg.value(metadata i8* %58, metadata !2546, metadata !DIExpression()), !dbg !2767
  call void @llvm.dbg.value(metadata i8 10, metadata !2558, metadata !DIExpression()), !dbg !2767
  %59 = getelementptr inbounds i8, i8* %58, i64 240, !dbg !2769
  %60 = bitcast i8* %59 to %"class.std::ctype"**, !dbg !2769
  %61 = load %"class.std::ctype"*, %"class.std::ctype"** %60, align 8, !dbg !2769, !tbaa !2563
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %61, metadata !2572, metadata !DIExpression()), !dbg !2770
  %62 = icmp eq %"class.std::ctype"* %61, null, !dbg !2772
  br i1 %62, label %63, label %64, !dbg !2773

63:                                               ; preds = %44
  call void @_ZSt16__throw_bad_castv() #18, !dbg !2774
  unreachable, !dbg !2774

64:                                               ; preds = %44
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %61, metadata !2590, metadata !DIExpression()), !dbg !2775
  call void @llvm.dbg.value(metadata i8 10, metadata !2598, metadata !DIExpression()), !dbg !2775
  %65 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %61, i64 0, i32 8, !dbg !2777
  %66 = load i8, i8* %65, align 8, !dbg !2777, !tbaa !2603
  %67 = icmp eq i8 %66, 0, !dbg !2777
  br i1 %67, label %71, label %68, !dbg !2778

68:                                               ; preds = %64
  %69 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %61, i64 0, i32 9, i64 10, !dbg !2779
  %70 = load i8, i8* %69, align 1, !dbg !2779, !tbaa !2474
  br label %77, !dbg !2780

71:                                               ; preds = %64
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %61), !dbg !2781
  %72 = bitcast %"class.std::ctype"* %61 to i8 (%"class.std::ctype"*, i8)***, !dbg !2782
  %73 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %72, align 8, !dbg !2782, !tbaa !2544
  %74 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %73, i64 6, !dbg !2782
  %75 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %74, align 8, !dbg !2782
  %76 = call noundef signext i8 %75(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %61, i8 noundef signext 10), !dbg !2782
  br label %77, !dbg !2783

77:                                               ; preds = %68, %71
  %78 = phi i8 [ %70, %68 ], [ %76, %71 ], !dbg !2775
  %79 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %51, i8 noundef signext %78), !dbg !2784
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %79, metadata !2613, metadata !DIExpression()), !dbg !2785
  %80 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %79), !dbg !2787
  %81 = call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #17, !dbg !2788
  call void @llvm.dbg.value(metadata i64 %81, metadata !2682, metadata !DIExpression()), !dbg !2690
  call void @llvm.dbg.value(metadata i64 0, metadata !2683, metadata !DIExpression()), !dbg !2789
  %82 = bitcast %struct.ClockTimes* %2 to i8*
  call void @llvm.dbg.value(metadata i64 0, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i64 0, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i64 0, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i64 0, metadata !2683, metadata !DIExpression()), !dbg !2789
  %83 = getelementptr inbounds %struct.ClockTimes, %struct.ClockTimes* %2, i64 0, i32 0
  %84 = getelementptr inbounds %struct.ClockTimes, %struct.ClockTimes* %2, i64 0, i32 1
  %85 = getelementptr inbounds %struct.ClockTimes, %struct.ClockTimes* %2, i64 0, i32 2
  br label %176, !dbg !2790

86:                                               ; preds = %176
  %87 = call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #17, !dbg !2791
  call void @llvm.dbg.value(metadata i64 %87, metadata !2685, metadata !DIExpression()), !dbg !2690
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2488, metadata !DIExpression()), !dbg !2792
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2792
  %88 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i64 0, i64 0), i64 noundef 10), !dbg !2794
  call void @llvm.dbg.value(metadata %"struct.std::chrono::time_point"* undef, metadata !2795, metadata !DIExpression()), !dbg !2805
  call void @llvm.dbg.value(metadata %"struct.std::chrono::time_point"* undef, metadata !2801, metadata !DIExpression()), !dbg !2805
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !508, metadata !DIExpression()), !dbg !2807
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !509, metadata !DIExpression()), !dbg !2807
  %89 = sub nsw i64 %87, %81, !dbg !2809
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !468, metadata !DIExpression()), !dbg !2810
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration.0"* undef, metadata !469, metadata !DIExpression()), !dbg !2810
  %90 = sdiv i64 %89, 1000, !dbg !2812
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2478, metadata !DIExpression()), !dbg !2813
  call void @llvm.dbg.value(metadata i64 %90, metadata !2484, metadata !DIExpression()), !dbg !2813
  %91 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %90), !dbg !2815
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %91, metadata !2488, metadata !DIExpression()), !dbg !2816
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2816
  %92 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %91, i8* noundef nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i64 0, i64 0), i64 noundef 10), !dbg !2818
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %91, metadata !2237, metadata !DIExpression()), !dbg !2819
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2819
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %91, metadata !2535, metadata !DIExpression()), !dbg !2821
  %93 = bitcast %"class.std::basic_ostream"* %91 to i8**, !dbg !2823
  %94 = load i8*, i8** %93, align 8, !dbg !2823, !tbaa !2544
  %95 = getelementptr i8, i8* %94, i64 -24, !dbg !2823
  %96 = bitcast i8* %95 to i64*, !dbg !2823
  %97 = load i64, i64* %96, align 8, !dbg !2823
  %98 = bitcast %"class.std::basic_ostream"* %91 to i8*, !dbg !2823
  %99 = getelementptr inbounds i8, i8* %98, i64 %97, !dbg !2823
  call void @llvm.dbg.value(metadata i8* %99, metadata !2546, metadata !DIExpression()), !dbg !2824
  call void @llvm.dbg.value(metadata i8 10, metadata !2558, metadata !DIExpression()), !dbg !2824
  %100 = getelementptr inbounds i8, i8* %99, i64 240, !dbg !2826
  %101 = bitcast i8* %100 to %"class.std::ctype"**, !dbg !2826
  %102 = load %"class.std::ctype"*, %"class.std::ctype"** %101, align 8, !dbg !2826, !tbaa !2563
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %102, metadata !2572, metadata !DIExpression()), !dbg !2827
  %103 = icmp eq %"class.std::ctype"* %102, null, !dbg !2829
  br i1 %103, label %104, label %105, !dbg !2830

104:                                              ; preds = %86
  call void @_ZSt16__throw_bad_castv() #18, !dbg !2831
  unreachable, !dbg !2831

105:                                              ; preds = %86
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %102, metadata !2590, metadata !DIExpression()), !dbg !2832
  call void @llvm.dbg.value(metadata i8 10, metadata !2598, metadata !DIExpression()), !dbg !2832
  %106 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %102, i64 0, i32 8, !dbg !2834
  %107 = load i8, i8* %106, align 8, !dbg !2834, !tbaa !2603
  %108 = icmp eq i8 %107, 0, !dbg !2834
  br i1 %108, label %112, label %109, !dbg !2835

109:                                              ; preds = %105
  %110 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %102, i64 0, i32 9, i64 10, !dbg !2836
  %111 = load i8, i8* %110, align 1, !dbg !2836, !tbaa !2474
  br label %118, !dbg !2837

112:                                              ; preds = %105
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %102), !dbg !2838
  %113 = bitcast %"class.std::ctype"* %102 to i8 (%"class.std::ctype"*, i8)***, !dbg !2839
  %114 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %113, align 8, !dbg !2839, !tbaa !2544
  %115 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %114, i64 6, !dbg !2839
  %116 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %115, align 8, !dbg !2839
  %117 = call noundef signext i8 %116(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %102, i8 noundef signext 10), !dbg !2839
  br label %118, !dbg !2840

118:                                              ; preds = %109, %112
  %119 = phi i8 [ %111, %109 ], [ %117, %112 ], !dbg !2832
  %120 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %91, i8 noundef signext %119), !dbg !2841
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %120, metadata !2613, metadata !DIExpression()), !dbg !2842
  %121 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %120), !dbg !2844
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2488, metadata !DIExpression()), !dbg !2845
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.10, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2845
  %122 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.10, i64 0, i64 0), i64 noundef 29), !dbg !2847
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2478, metadata !DIExpression()), !dbg !2848
  call void @llvm.dbg.value(metadata i64 %182, metadata !2484, metadata !DIExpression()), !dbg !2848
  %123 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %182), !dbg !2850
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %123, metadata !2488, metadata !DIExpression()), !dbg !2851
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.11, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2851
  %124 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %123, i8* noundef nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.11, i64 0, i64 0), i64 noundef 42), !dbg !2853
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %123, metadata !2478, metadata !DIExpression()), !dbg !2854
  call void @llvm.dbg.value(metadata i64 %184, metadata !2484, metadata !DIExpression()), !dbg !2854
  %125 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %123, i64 noundef %184), !dbg !2856
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %125, metadata !2488, metadata !DIExpression()), !dbg !2857
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.12, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2857
  %126 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %125, i8* noundef nonnull getelementptr inbounds ([48 x i8], [48 x i8]* @.str.12, i64 0, i64 0), i64 noundef 47), !dbg !2859
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %125, metadata !2478, metadata !DIExpression()), !dbg !2860
  call void @llvm.dbg.value(metadata i64 %186, metadata !2484, metadata !DIExpression()), !dbg !2860
  %127 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %125, i64 noundef %186), !dbg !2862
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %127, metadata !2488, metadata !DIExpression()), !dbg !2863
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2863
  %128 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %127, i8* noundef nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13, i64 0, i64 0), i64 noundef 11), !dbg !2865
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %127, metadata !2237, metadata !DIExpression()), !dbg !2866
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2866
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %127, metadata !2535, metadata !DIExpression()), !dbg !2868
  %129 = bitcast %"class.std::basic_ostream"* %127 to i8**, !dbg !2870
  %130 = load i8*, i8** %129, align 8, !dbg !2870, !tbaa !2544
  %131 = getelementptr i8, i8* %130, i64 -24, !dbg !2870
  %132 = bitcast i8* %131 to i64*, !dbg !2870
  %133 = load i64, i64* %132, align 8, !dbg !2870
  %134 = bitcast %"class.std::basic_ostream"* %127 to i8*, !dbg !2870
  %135 = getelementptr inbounds i8, i8* %134, i64 %133, !dbg !2870
  call void @llvm.dbg.value(metadata i8* %135, metadata !2546, metadata !DIExpression()), !dbg !2871
  call void @llvm.dbg.value(metadata i8 10, metadata !2558, metadata !DIExpression()), !dbg !2871
  %136 = getelementptr inbounds i8, i8* %135, i64 240, !dbg !2873
  %137 = bitcast i8* %136 to %"class.std::ctype"**, !dbg !2873
  %138 = load %"class.std::ctype"*, %"class.std::ctype"** %137, align 8, !dbg !2873, !tbaa !2563
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %138, metadata !2572, metadata !DIExpression()), !dbg !2874
  %139 = icmp eq %"class.std::ctype"* %138, null, !dbg !2876
  br i1 %139, label %140, label %141, !dbg !2877

140:                                              ; preds = %118
  call void @_ZSt16__throw_bad_castv() #18, !dbg !2878
  unreachable, !dbg !2878

141:                                              ; preds = %118
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %138, metadata !2590, metadata !DIExpression()), !dbg !2879
  call void @llvm.dbg.value(metadata i8 10, metadata !2598, metadata !DIExpression()), !dbg !2879
  %142 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %138, i64 0, i32 8, !dbg !2881
  %143 = load i8, i8* %142, align 8, !dbg !2881, !tbaa !2603
  %144 = icmp eq i8 %143, 0, !dbg !2881
  br i1 %144, label %148, label %145, !dbg !2882

145:                                              ; preds = %141
  %146 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %138, i64 0, i32 9, i64 10, !dbg !2883
  %147 = load i8, i8* %146, align 1, !dbg !2883, !tbaa !2474
  br label %154, !dbg !2884

148:                                              ; preds = %141
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %138), !dbg !2885
  %149 = bitcast %"class.std::ctype"* %138 to i8 (%"class.std::ctype"*, i8)***, !dbg !2886
  %150 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %149, align 8, !dbg !2886, !tbaa !2544
  %151 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %150, i64 6, !dbg !2886
  %152 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %151, align 8, !dbg !2886
  %153 = call noundef signext i8 %152(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %138, i8 noundef signext 10), !dbg !2886
  br label %154, !dbg !2887

154:                                              ; preds = %145, %148
  %155 = phi i8 [ %147, %145 ], [ %153, %148 ], !dbg !2879
  %156 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %127, i8 noundef signext %155), !dbg !2888
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %156, metadata !2613, metadata !DIExpression()), !dbg !2889
  %157 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %156), !dbg !2891
  %158 = call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #17, !dbg !2892
  call void @llvm.dbg.value(metadata i64 %158, metadata !2686, metadata !DIExpression()), !dbg !2690
  %159 = call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #17, !dbg !2893
  call void @llvm.dbg.value(metadata i64 %159, metadata !2689, metadata !DIExpression()), !dbg !2690
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2488, metadata !DIExpression()), !dbg !2894
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.14, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2894
  %160 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.14, i64 0, i64 0), i64 noundef 11), !dbg !2896
  call void @llvm.dbg.value(metadata %"struct.std::chrono::time_point"* undef, metadata !2795, metadata !DIExpression()), !dbg !2897
  call void @llvm.dbg.value(metadata %"struct.std::chrono::time_point"* undef, metadata !2801, metadata !DIExpression()), !dbg !2897
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !508, metadata !DIExpression()), !dbg !2899
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !509, metadata !DIExpression()), !dbg !2899
  %161 = sub nsw i64 %159, %158, !dbg !2901
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !468, metadata !DIExpression()), !dbg !2902
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration.0"* undef, metadata !469, metadata !DIExpression()), !dbg !2902
  %162 = sdiv i64 %161, 1000, !dbg !2904
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2478, metadata !DIExpression()), !dbg !2905
  call void @llvm.dbg.value(metadata i64 %162, metadata !2484, metadata !DIExpression()), !dbg !2905
  %163 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %162), !dbg !2907
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %163, metadata !2488, metadata !DIExpression()), !dbg !2908
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i64 0, i64 0), metadata !2493, metadata !DIExpression()), !dbg !2908
  %164 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %163, i8* noundef nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i64 0, i64 0), i64 noundef 10), !dbg !2910
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %163, metadata !2237, metadata !DIExpression()), !dbg !2911
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !2252, metadata !DIExpression()), !dbg !2911
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %163, metadata !2535, metadata !DIExpression()), !dbg !2913
  %165 = bitcast %"class.std::basic_ostream"* %163 to i8**, !dbg !2915
  %166 = load i8*, i8** %165, align 8, !dbg !2915, !tbaa !2544
  %167 = getelementptr i8, i8* %166, i64 -24, !dbg !2915
  %168 = bitcast i8* %167 to i64*, !dbg !2915
  %169 = load i64, i64* %168, align 8, !dbg !2915
  %170 = bitcast %"class.std::basic_ostream"* %163 to i8*, !dbg !2915
  %171 = getelementptr inbounds i8, i8* %170, i64 %169, !dbg !2915
  call void @llvm.dbg.value(metadata i8* %171, metadata !2546, metadata !DIExpression()), !dbg !2916
  call void @llvm.dbg.value(metadata i8 10, metadata !2558, metadata !DIExpression()), !dbg !2916
  %172 = getelementptr inbounds i8, i8* %171, i64 240, !dbg !2918
  %173 = bitcast i8* %172 to %"class.std::ctype"**, !dbg !2918
  %174 = load %"class.std::ctype"*, %"class.std::ctype"** %173, align 8, !dbg !2918, !tbaa !2563
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %174, metadata !2572, metadata !DIExpression()), !dbg !2919
  %175 = icmp eq %"class.std::ctype"* %174, null, !dbg !2921
  br i1 %175, label %189, label %190, !dbg !2922

176:                                              ; preds = %77, %176
  %177 = phi i64 [ 0, %77 ], [ %187, %176 ]
  %178 = phi i64 [ 0, %77 ], [ %182, %176 ]
  %179 = phi i64 [ 0, %77 ], [ %184, %176 ]
  %180 = phi i64 [ 0, %77 ], [ %186, %176 ]
  call void @llvm.dbg.value(metadata i64 %177, metadata !2683, metadata !DIExpression()), !dbg !2789
  call void @llvm.dbg.value(metadata i64 %178, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i64 %179, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i64 %180, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !2690
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %82) #17, !dbg !2923
  call void @_Z13hip_incrementPiS_m(%struct.ClockTimes* nonnull sret(%struct.ClockTimes) align 8 %2, i32* noundef nonnull %6, i32* noundef nonnull %4, i64 noundef 4096), !dbg !2923
  call void @llvm.dbg.value(metadata %struct.ClockTimes* undef, metadata !2925, metadata !DIExpression()), !dbg !2930
  call void @llvm.dbg.value(metadata %struct.ClockTimes* %2, metadata !2928, metadata !DIExpression()), !dbg !2930
  %181 = load i64, i64* %83, align 8, !dbg !2932, !tbaa !2933
  %182 = add nsw i64 %181, %178, !dbg !2934
  call void @llvm.dbg.value(metadata i64 %182, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !2690
  %183 = load i64, i64* %84, align 8, !dbg !2935, !tbaa !2936
  %184 = add nsw i64 %183, %179, !dbg !2937
  call void @llvm.dbg.value(metadata i64 %184, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !2690
  %185 = load i64, i64* %85, align 8, !dbg !2938, !tbaa !2626
  %186 = add nsw i64 %185, %180, !dbg !2939
  call void @llvm.dbg.value(metadata i64 %186, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !2690
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %82) #17, !dbg !2940
  %187 = add nuw nsw i64 %177, 1, !dbg !2941
  call void @llvm.dbg.value(metadata i64 %182, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i64 %184, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i64 %186, metadata !2677, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !2690
  call void @llvm.dbg.value(metadata i64 %187, metadata !2683, metadata !DIExpression()), !dbg !2789
  %188 = icmp eq i64 %187, 4096, !dbg !2942
  br i1 %188, label %86, label %176, !dbg !2790, !llvm.loop !2943

189:                                              ; preds = %154
  call void @_ZSt16__throw_bad_castv() #18, !dbg !2945
  unreachable, !dbg !2945

190:                                              ; preds = %154
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %174, metadata !2590, metadata !DIExpression()), !dbg !2946
  call void @llvm.dbg.value(metadata i8 10, metadata !2598, metadata !DIExpression()), !dbg !2946
  %191 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %174, i64 0, i32 8, !dbg !2948
  %192 = load i8, i8* %191, align 8, !dbg !2948, !tbaa !2603
  %193 = icmp eq i8 %192, 0, !dbg !2948
  br i1 %193, label %197, label %194, !dbg !2949

194:                                              ; preds = %190
  %195 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %174, i64 0, i32 9, i64 10, !dbg !2950
  %196 = load i8, i8* %195, align 1, !dbg !2950, !tbaa !2474
  br label %203, !dbg !2951

197:                                              ; preds = %190
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %174), !dbg !2952
  %198 = bitcast %"class.std::ctype"* %174 to i8 (%"class.std::ctype"*, i8)***, !dbg !2953
  %199 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %198, align 8, !dbg !2953, !tbaa !2544
  %200 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %199, i64 6, !dbg !2953
  %201 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %200, align 8, !dbg !2953
  %202 = call noundef signext i8 %201(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %174, i8 noundef signext 10), !dbg !2953
  br label %203, !dbg !2954

203:                                              ; preds = %194, %197
  %204 = phi i8 [ %196, %194 ], [ %202, %197 ], !dbg !2946
  %205 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %163, i8 noundef signext %204), !dbg !2955
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %205, metadata !2613, metadata !DIExpression()), !dbg !2956
  %206 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %205), !dbg !2958
  call void @_ZdaPv(i8* noundef nonnull %3) #20, !dbg !2959
  call void @_ZdaPv(i8* noundef nonnull %5) #20, !dbg !2960
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #17, !dbg !2961
  ret i32 0, !dbg !2962
}

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull i8* @_Znam(i64 noundef) local_unnamed_addr #12

declare !dbg !2963 dso_local i32 @hipDeviceGetAttribute(i32* noundef, i32 noundef, i32 noundef) local_unnamed_addr #0

; Function Attrs: nounwind
declare dso_local i64 @_ZNSt6chrono3_V212system_clock3nowEv() local_unnamed_addr #1

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdaPv(i8* noundef) local_unnamed_addr #13

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #14

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_clock_test.cpp() #8 section ".text.startup" !dbg !2967 {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit), !dbg !2969
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #17, !dbg !2973
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
  %7 = tail call i32 @__hipRegisterFunction(i8** %6, i8* bitcast (void (i32*, i64*)** @_Z13__d_incrementPiPl to i8*), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i64 0, i64 0), i32 -1, i8* null, i8* null, i8* null, i8* null, i32* null)
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #15

attributes #0 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { mustprogress uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { inlinehint mustprogress uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #10 = { argmemonly mustprogress nocallback nofree nounwind willreturn writeonly }
attributes #11 = { argmemonly mustprogress nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nobuiltin allocsize(0) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nobuiltin nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { noreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #16 = { noreturn nounwind }
attributes #17 = { nounwind }
attributes #18 = { noreturn }
attributes #19 = { builtin allocsize(0) }
attributes #20 = { builtin nounwind }

!llvm.dbg.cu = !{!76}
!llvm.module.flags = !{!2219, !2220, !2221, !2222}
!llvm.ident = !{!2223}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/iostream", directory: "")
!4 = !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 626, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/ios_base.h", directory: "")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt8ios_base")
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !9, line: 20, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "test/clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard", checksumkind: CSK_MD5, checksum: "b1cad702fd286fb852884abf6f61d7c4")
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 104, elements: !13)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{!14}
!14 = !DISubrange(count: 13)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(scope: null, file: !9, line: 95, type: !17, isLocal: true, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 384, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 48)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(scope: null, file: !9, line: 99, type: !22, isLocal: true, isDefinition: true)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 24, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 3)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(scope: null, file: !9, line: 101, type: !27, isLocal: true, isDefinition: true)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 16, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 2)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(scope: null, file: !9, line: 125, type: !32, isLocal: true, isDefinition: true)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 232, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 29)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(scope: null, file: !9, line: 125, type: !37, isLocal: true, isDefinition: true)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 40, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 5)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(scope: null, file: !9, line: 130, type: !42, isLocal: true, isDefinition: true)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 280, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 35)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(scope: null, file: !9, line: 131, type: !47, isLocal: true, isDefinition: true)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 112, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 14)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(scope: null, file: !9, line: 142, type: !52, isLocal: true, isDefinition: true)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 88, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 11)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(scope: null, file: !9, line: 142, type: !52, isLocal: true, isDefinition: true)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(scope: null, file: !9, line: 143, type: !59, isLocal: true, isDefinition: true)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 240, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 30)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(scope: null, file: !9, line: 143, type: !64, isLocal: true, isDefinition: true)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 344, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 43)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(scope: null, file: !9, line: 144, type: !17, isLocal: true, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(scope: null, file: !9, line: 145, type: !71, isLocal: true, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 96, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 12)
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(scope: null, file: !9, line: 159, type: !71, isLocal: true, isDefinition: true)
!76 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !9, producer: "AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !77, retainedTypes: !300, globals: !575, imports: !576, splitDebugInlining: false, nameTableKind: None)
!77 = !{!78, !86, !167, !175, !290}
!78 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Lock_policy", scope: !80, file: !79, line: 49, baseType: !81, size: 32, elements: !82, identifier: "_ZTSN9__gnu_cxx12_Lock_policyE")
!79 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ext/concurrence.h", directory: "")
!80 = !DINamespace(name: "__gnu_cxx", scope: null)
!81 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!82 = !{!83, !84, !85}
!83 = !DIEnumerator(name: "_S_single", value: 0, isUnsigned: true)
!84 = !DIEnumerator(name: "_S_mutex", value: 1, isUnsigned: true)
!85 = !DIEnumerator(name: "_S_atomic", value: 2, isUnsigned: true)
!86 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipError_t", file: !87, line: 206, baseType: !81, size: 32, elements: !88, identifier: "_ZTS10hipError_t")
!87 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "7560f6d8bd7c5ac736ef5dfcbc59d092")
!88 = !{!89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!89 = !DIEnumerator(name: "hipSuccess", value: 0, isUnsigned: true)
!90 = !DIEnumerator(name: "hipErrorInvalidValue", value: 1, isUnsigned: true)
!91 = !DIEnumerator(name: "hipErrorOutOfMemory", value: 2, isUnsigned: true)
!92 = !DIEnumerator(name: "hipErrorMemoryAllocation", value: 2, isUnsigned: true)
!93 = !DIEnumerator(name: "hipErrorNotInitialized", value: 3, isUnsigned: true)
!94 = !DIEnumerator(name: "hipErrorInitializationError", value: 3, isUnsigned: true)
!95 = !DIEnumerator(name: "hipErrorDeinitialized", value: 4, isUnsigned: true)
!96 = !DIEnumerator(name: "hipErrorProfilerDisabled", value: 5, isUnsigned: true)
!97 = !DIEnumerator(name: "hipErrorProfilerNotInitialized", value: 6, isUnsigned: true)
!98 = !DIEnumerator(name: "hipErrorProfilerAlreadyStarted", value: 7, isUnsigned: true)
!99 = !DIEnumerator(name: "hipErrorProfilerAlreadyStopped", value: 8, isUnsigned: true)
!100 = !DIEnumerator(name: "hipErrorInvalidConfiguration", value: 9, isUnsigned: true)
!101 = !DIEnumerator(name: "hipErrorInvalidPitchValue", value: 12, isUnsigned: true)
!102 = !DIEnumerator(name: "hipErrorInvalidSymbol", value: 13, isUnsigned: true)
!103 = !DIEnumerator(name: "hipErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!104 = !DIEnumerator(name: "hipErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!105 = !DIEnumerator(name: "hipErrorInsufficientDriver", value: 35, isUnsigned: true)
!106 = !DIEnumerator(name: "hipErrorMissingConfiguration", value: 52, isUnsigned: true)
!107 = !DIEnumerator(name: "hipErrorPriorLaunchFailure", value: 53, isUnsigned: true)
!108 = !DIEnumerator(name: "hipErrorInvalidDeviceFunction", value: 98, isUnsigned: true)
!109 = !DIEnumerator(name: "hipErrorNoDevice", value: 100, isUnsigned: true)
!110 = !DIEnumerator(name: "hipErrorInvalidDevice", value: 101, isUnsigned: true)
!111 = !DIEnumerator(name: "hipErrorInvalidImage", value: 200, isUnsigned: true)
!112 = !DIEnumerator(name: "hipErrorInvalidContext", value: 201, isUnsigned: true)
!113 = !DIEnumerator(name: "hipErrorContextAlreadyCurrent", value: 202, isUnsigned: true)
!114 = !DIEnumerator(name: "hipErrorMapFailed", value: 205, isUnsigned: true)
!115 = !DIEnumerator(name: "hipErrorMapBufferObjectFailed", value: 205, isUnsigned: true)
!116 = !DIEnumerator(name: "hipErrorUnmapFailed", value: 206, isUnsigned: true)
!117 = !DIEnumerator(name: "hipErrorArrayIsMapped", value: 207, isUnsigned: true)
!118 = !DIEnumerator(name: "hipErrorAlreadyMapped", value: 208, isUnsigned: true)
!119 = !DIEnumerator(name: "hipErrorNoBinaryForGpu", value: 209, isUnsigned: true)
!120 = !DIEnumerator(name: "hipErrorAlreadyAcquired", value: 210, isUnsigned: true)
!121 = !DIEnumerator(name: "hipErrorNotMapped", value: 211, isUnsigned: true)
!122 = !DIEnumerator(name: "hipErrorNotMappedAsArray", value: 212, isUnsigned: true)
!123 = !DIEnumerator(name: "hipErrorNotMappedAsPointer", value: 213, isUnsigned: true)
!124 = !DIEnumerator(name: "hipErrorECCNotCorrectable", value: 214, isUnsigned: true)
!125 = !DIEnumerator(name: "hipErrorUnsupportedLimit", value: 215, isUnsigned: true)
!126 = !DIEnumerator(name: "hipErrorContextAlreadyInUse", value: 216, isUnsigned: true)
!127 = !DIEnumerator(name: "hipErrorPeerAccessUnsupported", value: 217, isUnsigned: true)
!128 = !DIEnumerator(name: "hipErrorInvalidKernelFile", value: 218, isUnsigned: true)
!129 = !DIEnumerator(name: "hipErrorInvalidGraphicsContext", value: 219, isUnsigned: true)
!130 = !DIEnumerator(name: "hipErrorInvalidSource", value: 300, isUnsigned: true)
!131 = !DIEnumerator(name: "hipErrorFileNotFound", value: 301, isUnsigned: true)
!132 = !DIEnumerator(name: "hipErrorSharedObjectSymbolNotFound", value: 302, isUnsigned: true)
!133 = !DIEnumerator(name: "hipErrorSharedObjectInitFailed", value: 303, isUnsigned: true)
!134 = !DIEnumerator(name: "hipErrorOperatingSystem", value: 304, isUnsigned: true)
!135 = !DIEnumerator(name: "hipErrorInvalidHandle", value: 400, isUnsigned: true)
!136 = !DIEnumerator(name: "hipErrorInvalidResourceHandle", value: 400, isUnsigned: true)
!137 = !DIEnumerator(name: "hipErrorIllegalState", value: 401, isUnsigned: true)
!138 = !DIEnumerator(name: "hipErrorNotFound", value: 500, isUnsigned: true)
!139 = !DIEnumerator(name: "hipErrorNotReady", value: 600, isUnsigned: true)
!140 = !DIEnumerator(name: "hipErrorIllegalAddress", value: 700, isUnsigned: true)
!141 = !DIEnumerator(name: "hipErrorLaunchOutOfResources", value: 701, isUnsigned: true)
!142 = !DIEnumerator(name: "hipErrorLaunchTimeOut", value: 702, isUnsigned: true)
!143 = !DIEnumerator(name: "hipErrorPeerAccessAlreadyEnabled", value: 704, isUnsigned: true)
!144 = !DIEnumerator(name: "hipErrorPeerAccessNotEnabled", value: 705, isUnsigned: true)
!145 = !DIEnumerator(name: "hipErrorSetOnActiveProcess", value: 708, isUnsigned: true)
!146 = !DIEnumerator(name: "hipErrorContextIsDestroyed", value: 709, isUnsigned: true)
!147 = !DIEnumerator(name: "hipErrorAssert", value: 710, isUnsigned: true)
!148 = !DIEnumerator(name: "hipErrorHostMemoryAlreadyRegistered", value: 712, isUnsigned: true)
!149 = !DIEnumerator(name: "hipErrorHostMemoryNotRegistered", value: 713, isUnsigned: true)
!150 = !DIEnumerator(name: "hipErrorLaunchFailure", value: 719, isUnsigned: true)
!151 = !DIEnumerator(name: "hipErrorCooperativeLaunchTooLarge", value: 720, isUnsigned: true)
!152 = !DIEnumerator(name: "hipErrorNotSupported", value: 801, isUnsigned: true)
!153 = !DIEnumerator(name: "hipErrorStreamCaptureUnsupported", value: 900, isUnsigned: true)
!154 = !DIEnumerator(name: "hipErrorStreamCaptureInvalidated", value: 901, isUnsigned: true)
!155 = !DIEnumerator(name: "hipErrorStreamCaptureMerge", value: 902, isUnsigned: true)
!156 = !DIEnumerator(name: "hipErrorStreamCaptureUnmatched", value: 903, isUnsigned: true)
!157 = !DIEnumerator(name: "hipErrorStreamCaptureUnjoined", value: 904, isUnsigned: true)
!158 = !DIEnumerator(name: "hipErrorStreamCaptureIsolation", value: 905, isUnsigned: true)
!159 = !DIEnumerator(name: "hipErrorStreamCaptureImplicit", value: 906, isUnsigned: true)
!160 = !DIEnumerator(name: "hipErrorCapturedEvent", value: 907, isUnsigned: true)
!161 = !DIEnumerator(name: "hipErrorStreamCaptureWrongThread", value: 908, isUnsigned: true)
!162 = !DIEnumerator(name: "hipErrorGraphExecUpdateFailure", value: 910, isUnsigned: true)
!163 = !DIEnumerator(name: "hipErrorUnknown", value: 999, isUnsigned: true)
!164 = !DIEnumerator(name: "hipErrorRuntimeMemory", value: 1052, isUnsigned: true)
!165 = !DIEnumerator(name: "hipErrorRuntimeOther", value: 1053, isUnsigned: true)
!166 = !DIEnumerator(name: "hipErrorTbd", value: 1054, isUnsigned: true)
!167 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipMemcpyKind", file: !168, line: 344, baseType: !81, size: 32, elements: !169, identifier: "_ZTS13hipMemcpyKind")
!168 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/driver_types.h", directory: "", checksumkind: CSK_MD5, checksum: "ac8c80c0e1fdd9c44dee17b35e5c6ced")
!169 = !{!170, !171, !172, !173, !174}
!170 = !DIEnumerator(name: "hipMemcpyHostToHost", value: 0, isUnsigned: true)
!171 = !DIEnumerator(name: "hipMemcpyHostToDevice", value: 1, isUnsigned: true)
!172 = !DIEnumerator(name: "hipMemcpyDeviceToHost", value: 2, isUnsigned: true)
!173 = !DIEnumerator(name: "hipMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!174 = !DIEnumerator(name: "hipMemcpyDefault", value: 4, isUnsigned: true)
!175 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipDeviceAttribute_t", file: !87, line: 329, baseType: !81, size: 32, elements: !176, identifier: "_ZTS20hipDeviceAttribute_t")
!176 = !{!177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289}
!177 = !DIEnumerator(name: "hipDeviceAttributeCudaCompatibleBegin", value: 0, isUnsigned: true)
!178 = !DIEnumerator(name: "hipDeviceAttributeEccEnabled", value: 0, isUnsigned: true)
!179 = !DIEnumerator(name: "hipDeviceAttributeAccessPolicyMaxWindowSize", value: 1, isUnsigned: true)
!180 = !DIEnumerator(name: "hipDeviceAttributeAsyncEngineCount", value: 2, isUnsigned: true)
!181 = !DIEnumerator(name: "hipDeviceAttributeCanMapHostMemory", value: 3, isUnsigned: true)
!182 = !DIEnumerator(name: "hipDeviceAttributeCanUseHostPointerForRegisteredMem", value: 4, isUnsigned: true)
!183 = !DIEnumerator(name: "hipDeviceAttributeClockRate", value: 5, isUnsigned: true)
!184 = !DIEnumerator(name: "hipDeviceAttributeComputeMode", value: 6, isUnsigned: true)
!185 = !DIEnumerator(name: "hipDeviceAttributeComputePreemptionSupported", value: 7, isUnsigned: true)
!186 = !DIEnumerator(name: "hipDeviceAttributeConcurrentKernels", value: 8, isUnsigned: true)
!187 = !DIEnumerator(name: "hipDeviceAttributeConcurrentManagedAccess", value: 9, isUnsigned: true)
!188 = !DIEnumerator(name: "hipDeviceAttributeCooperativeLaunch", value: 10, isUnsigned: true)
!189 = !DIEnumerator(name: "hipDeviceAttributeCooperativeMultiDeviceLaunch", value: 11, isUnsigned: true)
!190 = !DIEnumerator(name: "hipDeviceAttributeDeviceOverlap", value: 12, isUnsigned: true)
!191 = !DIEnumerator(name: "hipDeviceAttributeDirectManagedMemAccessFromHost", value: 13, isUnsigned: true)
!192 = !DIEnumerator(name: "hipDeviceAttributeGlobalL1CacheSupported", value: 14, isUnsigned: true)
!193 = !DIEnumerator(name: "hipDeviceAttributeHostNativeAtomicSupported", value: 15, isUnsigned: true)
!194 = !DIEnumerator(name: "hipDeviceAttributeIntegrated", value: 16, isUnsigned: true)
!195 = !DIEnumerator(name: "hipDeviceAttributeIsMultiGpuBoard", value: 17, isUnsigned: true)
!196 = !DIEnumerator(name: "hipDeviceAttributeKernelExecTimeout", value: 18, isUnsigned: true)
!197 = !DIEnumerator(name: "hipDeviceAttributeL2CacheSize", value: 19, isUnsigned: true)
!198 = !DIEnumerator(name: "hipDeviceAttributeLocalL1CacheSupported", value: 20, isUnsigned: true)
!199 = !DIEnumerator(name: "hipDeviceAttributeLuid", value: 21, isUnsigned: true)
!200 = !DIEnumerator(name: "hipDeviceAttributeLuidDeviceNodeMask", value: 22, isUnsigned: true)
!201 = !DIEnumerator(name: "hipDeviceAttributeComputeCapabilityMajor", value: 23, isUnsigned: true)
!202 = !DIEnumerator(name: "hipDeviceAttributeManagedMemory", value: 24, isUnsigned: true)
!203 = !DIEnumerator(name: "hipDeviceAttributeMaxBlocksPerMultiProcessor", value: 25, isUnsigned: true)
!204 = !DIEnumerator(name: "hipDeviceAttributeMaxBlockDimX", value: 26, isUnsigned: true)
!205 = !DIEnumerator(name: "hipDeviceAttributeMaxBlockDimY", value: 27, isUnsigned: true)
!206 = !DIEnumerator(name: "hipDeviceAttributeMaxBlockDimZ", value: 28, isUnsigned: true)
!207 = !DIEnumerator(name: "hipDeviceAttributeMaxGridDimX", value: 29, isUnsigned: true)
!208 = !DIEnumerator(name: "hipDeviceAttributeMaxGridDimY", value: 30, isUnsigned: true)
!209 = !DIEnumerator(name: "hipDeviceAttributeMaxGridDimZ", value: 31, isUnsigned: true)
!210 = !DIEnumerator(name: "hipDeviceAttributeMaxSurface1D", value: 32, isUnsigned: true)
!211 = !DIEnumerator(name: "hipDeviceAttributeMaxSurface1DLayered", value: 33, isUnsigned: true)
!212 = !DIEnumerator(name: "hipDeviceAttributeMaxSurface2D", value: 34, isUnsigned: true)
!213 = !DIEnumerator(name: "hipDeviceAttributeMaxSurface2DLayered", value: 35, isUnsigned: true)
!214 = !DIEnumerator(name: "hipDeviceAttributeMaxSurface3D", value: 36, isUnsigned: true)
!215 = !DIEnumerator(name: "hipDeviceAttributeMaxSurfaceCubemap", value: 37, isUnsigned: true)
!216 = !DIEnumerator(name: "hipDeviceAttributeMaxSurfaceCubemapLayered", value: 38, isUnsigned: true)
!217 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture1DWidth", value: 39, isUnsigned: true)
!218 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture1DLayered", value: 40, isUnsigned: true)
!219 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture1DLinear", value: 41, isUnsigned: true)
!220 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture1DMipmap", value: 42, isUnsigned: true)
!221 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture2DWidth", value: 43, isUnsigned: true)
!222 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture2DHeight", value: 44, isUnsigned: true)
!223 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture2DGather", value: 45, isUnsigned: true)
!224 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture2DLayered", value: 46, isUnsigned: true)
!225 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture2DLinear", value: 47, isUnsigned: true)
!226 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture2DMipmap", value: 48, isUnsigned: true)
!227 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture3DWidth", value: 49, isUnsigned: true)
!228 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture3DHeight", value: 50, isUnsigned: true)
!229 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture3DDepth", value: 51, isUnsigned: true)
!230 = !DIEnumerator(name: "hipDeviceAttributeMaxTexture3DAlt", value: 52, isUnsigned: true)
!231 = !DIEnumerator(name: "hipDeviceAttributeMaxTextureCubemap", value: 53, isUnsigned: true)
!232 = !DIEnumerator(name: "hipDeviceAttributeMaxTextureCubemapLayered", value: 54, isUnsigned: true)
!233 = !DIEnumerator(name: "hipDeviceAttributeMaxThreadsDim", value: 55, isUnsigned: true)
!234 = !DIEnumerator(name: "hipDeviceAttributeMaxThreadsPerBlock", value: 56, isUnsigned: true)
!235 = !DIEnumerator(name: "hipDeviceAttributeMaxThreadsPerMultiProcessor", value: 57, isUnsigned: true)
!236 = !DIEnumerator(name: "hipDeviceAttributeMaxPitch", value: 58, isUnsigned: true)
!237 = !DIEnumerator(name: "hipDeviceAttributeMemoryBusWidth", value: 59, isUnsigned: true)
!238 = !DIEnumerator(name: "hipDeviceAttributeMemoryClockRate", value: 60, isUnsigned: true)
!239 = !DIEnumerator(name: "hipDeviceAttributeComputeCapabilityMinor", value: 61, isUnsigned: true)
!240 = !DIEnumerator(name: "hipDeviceAttributeMultiGpuBoardGroupID", value: 62, isUnsigned: true)
!241 = !DIEnumerator(name: "hipDeviceAttributeMultiprocessorCount", value: 63, isUnsigned: true)
!242 = !DIEnumerator(name: "hipDeviceAttributeName", value: 64, isUnsigned: true)
!243 = !DIEnumerator(name: "hipDeviceAttributePageableMemoryAccess", value: 65, isUnsigned: true)
!244 = !DIEnumerator(name: "hipDeviceAttributePageableMemoryAccessUsesHostPageTables", value: 66, isUnsigned: true)
!245 = !DIEnumerator(name: "hipDeviceAttributePciBusId", value: 67, isUnsigned: true)
!246 = !DIEnumerator(name: "hipDeviceAttributePciDeviceId", value: 68, isUnsigned: true)
!247 = !DIEnumerator(name: "hipDeviceAttributePciDomainID", value: 69, isUnsigned: true)
!248 = !DIEnumerator(name: "hipDeviceAttributePersistingL2CacheMaxSize", value: 70, isUnsigned: true)
!249 = !DIEnumerator(name: "hipDeviceAttributeMaxRegistersPerBlock", value: 71, isUnsigned: true)
!250 = !DIEnumerator(name: "hipDeviceAttributeMaxRegistersPerMultiprocessor", value: 72, isUnsigned: true)
!251 = !DIEnumerator(name: "hipDeviceAttributeReservedSharedMemPerBlock", value: 73, isUnsigned: true)
!252 = !DIEnumerator(name: "hipDeviceAttributeMaxSharedMemoryPerBlock", value: 74, isUnsigned: true)
!253 = !DIEnumerator(name: "hipDeviceAttributeSharedMemPerBlockOptin", value: 75, isUnsigned: true)
!254 = !DIEnumerator(name: "hipDeviceAttributeSharedMemPerMultiprocessor", value: 76, isUnsigned: true)
!255 = !DIEnumerator(name: "hipDeviceAttributeSingleToDoublePrecisionPerfRatio", value: 77, isUnsigned: true)
!256 = !DIEnumerator(name: "hipDeviceAttributeStreamPrioritiesSupported", value: 78, isUnsigned: true)
!257 = !DIEnumerator(name: "hipDeviceAttributeSurfaceAlignment", value: 79, isUnsigned: true)
!258 = !DIEnumerator(name: "hipDeviceAttributeTccDriver", value: 80, isUnsigned: true)
!259 = !DIEnumerator(name: "hipDeviceAttributeTextureAlignment", value: 81, isUnsigned: true)
!260 = !DIEnumerator(name: "hipDeviceAttributeTexturePitchAlignment", value: 82, isUnsigned: true)
!261 = !DIEnumerator(name: "hipDeviceAttributeTotalConstantMemory", value: 83, isUnsigned: true)
!262 = !DIEnumerator(name: "hipDeviceAttributeTotalGlobalMem", value: 84, isUnsigned: true)
!263 = !DIEnumerator(name: "hipDeviceAttributeUnifiedAddressing", value: 85, isUnsigned: true)
!264 = !DIEnumerator(name: "hipDeviceAttributeUuid", value: 86, isUnsigned: true)
!265 = !DIEnumerator(name: "hipDeviceAttributeWarpSize", value: 87, isUnsigned: true)
!266 = !DIEnumerator(name: "hipDeviceAttributeMemoryPoolsSupported", value: 88, isUnsigned: true)
!267 = !DIEnumerator(name: "hipDeviceAttributeVirtualMemoryManagementSupported", value: 89, isUnsigned: true)
!268 = !DIEnumerator(name: "hipDeviceAttributeCudaCompatibleEnd", value: 9999, isUnsigned: true)
!269 = !DIEnumerator(name: "hipDeviceAttributeAmdSpecificBegin", value: 10000, isUnsigned: true)
!270 = !DIEnumerator(name: "hipDeviceAttributeClockInstructionRate", value: 10000, isUnsigned: true)
!271 = !DIEnumerator(name: "hipDeviceAttributeArch", value: 10001, isUnsigned: true)
!272 = !DIEnumerator(name: "hipDeviceAttributeMaxSharedMemoryPerMultiprocessor", value: 10002, isUnsigned: true)
!273 = !DIEnumerator(name: "hipDeviceAttributeGcnArch", value: 10003, isUnsigned: true)
!274 = !DIEnumerator(name: "hipDeviceAttributeGcnArchName", value: 10004, isUnsigned: true)
!275 = !DIEnumerator(name: "hipDeviceAttributeHdpMemFlushCntl", value: 10005, isUnsigned: true)
!276 = !DIEnumerator(name: "hipDeviceAttributeHdpRegFlushCntl", value: 10006, isUnsigned: true)
!277 = !DIEnumerator(name: "hipDeviceAttributeCooperativeMultiDeviceUnmatchedFunc", value: 10007, isUnsigned: true)
!278 = !DIEnumerator(name: "hipDeviceAttributeCooperativeMultiDeviceUnmatchedGridDim", value: 10008, isUnsigned: true)
!279 = !DIEnumerator(name: "hipDeviceAttributeCooperativeMultiDeviceUnmatchedBlockDim", value: 10009, isUnsigned: true)
!280 = !DIEnumerator(name: "hipDeviceAttributeCooperativeMultiDeviceUnmatchedSharedMem", value: 10010, isUnsigned: true)
!281 = !DIEnumerator(name: "hipDeviceAttributeIsLargeBar", value: 10011, isUnsigned: true)
!282 = !DIEnumerator(name: "hipDeviceAttributeAsicRevision", value: 10012, isUnsigned: true)
!283 = !DIEnumerator(name: "hipDeviceAttributeCanUseStreamWaitValue", value: 10013, isUnsigned: true)
!284 = !DIEnumerator(name: "hipDeviceAttributeImageSupport", value: 10014, isUnsigned: true)
!285 = !DIEnumerator(name: "hipDeviceAttributePhysicalMultiProcessorCount", value: 10015, isUnsigned: true)
!286 = !DIEnumerator(name: "hipDeviceAttributeFineGrainSupport", value: 10016, isUnsigned: true)
!287 = !DIEnumerator(name: "hipDeviceAttributeWallClockRate", value: 10017, isUnsigned: true)
!288 = !DIEnumerator(name: "hipDeviceAttributeAmdSpecificEnd", value: 19999, isUnsigned: true)
!289 = !DIEnumerator(name: "hipDeviceAttributeVendorSpecificBegin", value: 20000, isUnsigned: true)
!290 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Ios_Iostate", scope: !2, file: !5, line: 153, baseType: !291, size: 32, elements: !292, identifier: "_ZTSSt12_Ios_Iostate")
!291 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!292 = !{!293, !294, !295, !296, !297, !298, !299}
!293 = !DIEnumerator(name: "_S_goodbit", value: 0)
!294 = !DIEnumerator(name: "_S_badbit", value: 1)
!295 = !DIEnumerator(name: "_S_eofbit", value: 2)
!296 = !DIEnumerator(name: "_S_failbit", value: 4)
!297 = !DIEnumerator(name: "_S_ios_iostate_end", value: 65536)
!298 = !DIEnumerator(name: "_S_ios_iostate_max", value: 2147483647)
!299 = !DIEnumerator(name: "_S_ios_iostate_min", value: -2147483648)
!300 = !{!301, !303, !317, !333, !401, !413, !323, !416, !497, !339, !512, !290, !291, !516, !304, !517, !336, !568, !6}
!301 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !302, size: 64)
!302 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!303 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !87, line: 941, baseType: !304)
!304 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !87, line: 934, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !305, identifier: "_ZTS4dim3")
!305 = !{!306, !311, !312, !313}
!306 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !304, file: !87, line: 935, baseType: !307, size: 32)
!307 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !308, line: 26, baseType: !309)
!308 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "9754ebe022edbe8d7928fa709e442f0d")
!309 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !310, line: 41, baseType: !81)
!310 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "eac2c46b20ddc2be81186b6ffebfd845")
!311 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !304, file: !87, line: 936, baseType: !307, size: 32, offset: 32)
!312 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !304, file: !87, line: 937, baseType: !307, size: 32, offset: 64)
!313 = !DISubprogram(name: "dim3", scope: !304, file: !87, line: 939, type: !314, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!314 = !DISubroutineType(types: !315)
!315 = !{null, !316, !307, !307, !307}
!316 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !304, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!317 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ClockTimes", file: !9, line: 47, size: 192, flags: DIFlagTypePassByValue, elements: !318, identifier: "_ZTS10ClockTimes")
!318 = !{!319, !324, !325, !326}
!319 = !DIDerivedType(tag: DW_TAG_member, name: "clock_time", scope: !317, file: !9, line: 48, baseType: !320, size: 64)
!320 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !321, line: 27, baseType: !322)
!321 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "457547631e07cd24d9a14c8410e28e57")
!322 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !310, line: 43, baseType: !323)
!323 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "clock64_time", scope: !317, file: !9, line: 49, baseType: !320, size: 64, offset: 64)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "wall_clock64_time", scope: !317, file: !9, line: 50, baseType: !320, size: 64, offset: 128)
!326 = !DISubprogram(name: "operator+=", linkageName: "_ZN10ClockTimespLERKS_", scope: !317, file: !9, line: 52, type: !327, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!327 = !DISubroutineType(types: !328)
!328 = !{!329, !330, !331}
!329 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !317, size: 64)
!330 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !317, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!331 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !332, size: 64)
!332 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !317)
!333 = !DIDerivedType(tag: DW_TAG_typedef, name: "microseconds", scope: !335, file: !334, line: 780, baseType: !336)
!334 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/chrono", directory: "")
!335 = !DINamespace(name: "chrono", scope: !2)
!336 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1000000L> >", scope: !335, file: !334, line: 421, size: 64, flags: DIFlagTypePassByValue, elements: !337, templateParams: !389, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEE")
!337 = !{!338, !340, !346, !350, !355, !356, !360, !364, !367, !368, !371, !374, !375, !376, !377, !378, !383, !384, !387, !388}
!338 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !336, file: !334, line: 584, baseType: !339, size: 64, flags: DIFlagPrivate)
!339 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !336, file: !334, line: 452, baseType: !323)
!340 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEE6_S_gcdEll", scope: !336, file: !334, line: 428, type: !341, scopeLine: 428, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!341 = !DISubroutineType(types: !342)
!342 = !{!343, !343, !343}
!343 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !344, line: 101, baseType: !345)
!344 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "5faa52c8a2d48b1d936594c77c73ce42")
!345 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !310, line: 71, baseType: !323)
!346 = !DISubprogram(name: "duration", scope: !336, file: !334, line: 461, type: !347, scopeLine: 461, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!347 = !DISubroutineType(types: !348)
!348 = !{null, !349}
!349 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !336, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!350 = !DISubprogram(name: "duration", scope: !336, file: !334, line: 463, type: !351, scopeLine: 463, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!351 = !DISubroutineType(types: !352)
!352 = !{null, !349, !353}
!353 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !354, size: 64)
!354 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !336)
!355 = !DISubprogram(name: "~duration", scope: !336, file: !334, line: 481, type: !347, scopeLine: 481, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!356 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEaSERKS3_", scope: !336, file: !334, line: 482, type: !357, scopeLine: 482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!357 = !DISubroutineType(types: !358)
!358 = !{!359, !349, !353}
!359 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !336, size: 64)
!360 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000EEE5countEv", scope: !336, file: !334, line: 486, type: !361, scopeLine: 486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!361 = !DISubroutineType(types: !362)
!362 = !{!339, !363}
!363 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !354, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!364 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000EEEpsEv", scope: !336, file: !334, line: 492, type: !365, scopeLine: 492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!365 = !DISubroutineType(types: !366)
!366 = !{!336, !363}
!367 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000EEEngEv", scope: !336, file: !334, line: 496, type: !365, scopeLine: 496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!368 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEppEv", scope: !336, file: !334, line: 500, type: !369, scopeLine: 500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!369 = !DISubroutineType(types: !370)
!370 = !{!359, !349}
!371 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEppEi", scope: !336, file: !334, line: 507, type: !372, scopeLine: 507, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!372 = !DISubroutineType(types: !373)
!373 = !{!336, !349, !291}
!374 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEmmEv", scope: !336, file: !334, line: 511, type: !369, scopeLine: 511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!375 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEmmEi", scope: !336, file: !334, line: 518, type: !372, scopeLine: 518, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!376 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEpLERKS3_", scope: !336, file: !334, line: 522, type: !357, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!377 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEmIERKS3_", scope: !336, file: !334, line: 529, type: !357, scopeLine: 529, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!378 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEmLERKl", scope: !336, file: !334, line: 536, type: !379, scopeLine: 536, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!379 = !DISubroutineType(types: !380)
!380 = !{!359, !349, !381}
!381 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !382, size: 64)
!382 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !339)
!383 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEdVERKl", scope: !336, file: !334, line: 543, type: !379, scopeLine: 543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!384 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEE4zeroEv", scope: !336, file: !334, line: 572, type: !385, scopeLine: 572, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!385 = !DISubroutineType(types: !386)
!386 = !{!336}
!387 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEE3minEv", scope: !336, file: !334, line: 576, type: !385, scopeLine: 576, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!388 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEE3maxEv", scope: !336, file: !334, line: 580, type: !385, scopeLine: 580, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!389 = !{!390, !391}
!390 = !DITemplateTypeParameter(name: "_Rep", type: !323)
!391 = !DITemplateTypeParameter(name: "_Period", type: !392)
!392 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000000L>", scope: !2, file: !393, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !394, templateParams: !398, identifier: "_ZTSSt5ratioILl1ELl1000000EE")
!393 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ratio", directory: "")
!394 = !{!395, !397}
!395 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !392, file: !393, line: 273, baseType: !396, flags: DIFlagStaticMember, extraData: i64 1)
!396 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !343)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !392, file: !393, line: 276, baseType: !396, flags: DIFlagStaticMember, extraData: i64 1000000)
!398 = !{!399, !400}
!399 = !DITemplateValueParameter(name: "_Num", type: !323, value: i64 1)
!400 = !DITemplateValueParameter(name: "_Den", type: !323, value: i64 1000000)
!401 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cd", scope: !402, file: !334, line: 668, baseType: !475)
!402 = distinct !DISubprogram(name: "operator/<long, std::ratio<1L, 1000000000L>, long, std::ratio<1L, 1000000L> >", linkageName: "_ZNSt6chronodvIlSt5ratioILl1ELl1000000000EElS1_ILl1ELl1000000EEEENSt11common_typeIJT_T1_EE4typeERKNS_8durationIS5_T0_EERKNS9_IS6_T2_EE", scope: !335, file: !334, line: 663, type: !403, scopeLine: 665, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, templateParams: !470, retainedNodes: !467)
!403 = !DISubroutineType(types: !404)
!404 = !{!405, !411, !353}
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !407, file: !406, line: 221, baseType: !323)
!406 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/type_traits", directory: "")
!407 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__success_type<long>", scope: !2, file: !406, line: 220, size: 8, flags: DIFlagTypePassByValue, elements: !408, templateParams: !409, identifier: "_ZTSSt14__success_typeIlE")
!408 = !{}
!409 = !{!410}
!410 = !DITemplateTypeParameter(name: "_Tp", type: !323)
!411 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !412, size: 64)
!412 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !413)
!413 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1000000000L> >", scope: !335, file: !334, line: 421, size: 64, flags: DIFlagTypePassByValue, elements: !414, templateParams: !459, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEE")
!414 = !{!415, !417, !418, !422, !425, !426, !430, !434, !437, !438, !441, !444, !445, !446, !447, !448, !453, !454, !457, !458}
!415 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !413, file: !334, line: 584, baseType: !416, size: 64, flags: DIFlagPrivate)
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !413, file: !334, line: 452, baseType: !323)
!417 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE6_S_gcdEll", scope: !413, file: !334, line: 428, type: !341, scopeLine: 428, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!418 = !DISubprogram(name: "duration", scope: !413, file: !334, line: 461, type: !419, scopeLine: 461, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!419 = !DISubroutineType(types: !420)
!420 = !{null, !421}
!421 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !413, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!422 = !DISubprogram(name: "duration", scope: !413, file: !334, line: 463, type: !423, scopeLine: 463, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!423 = !DISubroutineType(types: !424)
!424 = !{null, !421, !411}
!425 = !DISubprogram(name: "~duration", scope: !413, file: !334, line: 481, type: !419, scopeLine: 481, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!426 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEaSERKS3_", scope: !413, file: !334, line: 482, type: !427, scopeLine: 482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!427 = !DISubroutineType(types: !428)
!428 = !{!429, !421, !411}
!429 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !413, size: 64)
!430 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv", scope: !413, file: !334, line: 486, type: !431, scopeLine: 486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!431 = !DISubroutineType(types: !432)
!432 = !{!416, !433}
!433 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !412, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!434 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpsEv", scope: !413, file: !334, line: 492, type: !435, scopeLine: 492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!435 = !DISubroutineType(types: !436)
!436 = !{!413, !433}
!437 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEngEv", scope: !413, file: !334, line: 496, type: !435, scopeLine: 496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!438 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEv", scope: !413, file: !334, line: 500, type: !439, scopeLine: 500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!439 = !DISubroutineType(types: !440)
!440 = !{!429, !421}
!441 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEi", scope: !413, file: !334, line: 507, type: !442, scopeLine: 507, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!442 = !DISubroutineType(types: !443)
!443 = !{!413, !421, !291}
!444 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEv", scope: !413, file: !334, line: 511, type: !439, scopeLine: 511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!445 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEi", scope: !413, file: !334, line: 518, type: !442, scopeLine: 518, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!446 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpLERKS3_", scope: !413, file: !334, line: 522, type: !427, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!447 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmIERKS3_", scope: !413, file: !334, line: 529, type: !427, scopeLine: 529, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!448 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmLERKl", scope: !413, file: !334, line: 536, type: !449, scopeLine: 536, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!449 = !DISubroutineType(types: !450)
!450 = !{!429, !421, !451}
!451 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !452, size: 64)
!452 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !416)
!453 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEdVERKl", scope: !413, file: !334, line: 543, type: !449, scopeLine: 543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!454 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE4zeroEv", scope: !413, file: !334, line: 572, type: !455, scopeLine: 572, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!455 = !DISubroutineType(types: !456)
!456 = !{!413}
!457 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3minEv", scope: !413, file: !334, line: 576, type: !455, scopeLine: 576, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!458 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3maxEv", scope: !413, file: !334, line: 580, type: !455, scopeLine: 580, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!459 = !{!390, !460}
!460 = !DITemplateTypeParameter(name: "_Period", type: !461)
!461 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000000000L>", scope: !2, file: !393, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !462, templateParams: !465, identifier: "_ZTSSt5ratioILl1ELl1000000000EE")
!462 = !{!463, !464}
!463 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !461, file: !393, line: 273, baseType: !396, flags: DIFlagStaticMember, extraData: i64 1)
!464 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !461, file: !393, line: 276, baseType: !396, flags: DIFlagStaticMember, extraData: i64 1000000000)
!465 = !{!399, !466}
!466 = !DITemplateValueParameter(name: "_Den", type: !323, value: i64 1000000000)
!467 = !{!468, !469}
!468 = !DILocalVariable(name: "__lhs", arg: 1, scope: !402, file: !334, line: 663, type: !411)
!469 = !DILocalVariable(name: "__rhs", arg: 2, scope: !402, file: !334, line: 664, type: !353)
!470 = !{!471, !472, !473, !474}
!471 = !DITemplateTypeParameter(name: "_Rep1", type: !323)
!472 = !DITemplateTypeParameter(name: "_Period1", type: !461)
!473 = !DITemplateTypeParameter(name: "_Rep2", type: !323)
!474 = !DITemplateTypeParameter(name: "_Period2", type: !392)
!475 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !476, file: !334, line: 97, baseType: !413)
!476 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__duration_common_type<std::common_type<long, long>, std::ratio<1L, 1000000000L>, std::ratio<1L, 1000000L>, void>", scope: !2, file: !334, line: 86, size: 8, flags: DIFlagTypePassByValue, elements: !408, templateParams: !477, identifier: "_ZTSSt22__duration_common_typeISt11common_typeIJllEESt5ratioILl1ELl1000000000EES2_ILl1ELl1000000EEvE")
!477 = !{!478, !472, !474, !496}
!478 = !DITemplateTypeParameter(name: "_CT", type: !479)
!479 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "common_type<long, long>", scope: !2, file: !406, line: 2280, size: 8, flags: DIFlagTypePassByValue, elements: !480, templateParams: !492, identifier: "_ZTSSt11common_typeIJllEE")
!480 = !{!481}
!481 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !479, baseType: !482, extraData: i32 0)
!482 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !483, file: !406, line: 2275, baseType: !407)
!483 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__common_type_impl<long, long, long, long>", scope: !2, file: !406, line: 2270, size: 8, flags: DIFlagTypePassByValue, elements: !484, templateParams: !487, identifier: "_ZTSSt18__common_type_implIllllE")
!484 = !{!485}
!485 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !483, baseType: !486, flags: DIFlagPrivate, extraData: i32 0)
!486 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__do_common_type_impl", scope: !2, file: !406, line: 2219, size: 8, flags: DIFlagTypePassByValue, elements: !408, identifier: "_ZTSSt21__do_common_type_impl")
!487 = !{!488, !489, !490, !491}
!488 = !DITemplateTypeParameter(name: "_Tp1", type: !323)
!489 = !DITemplateTypeParameter(name: "_Tp2", type: !323)
!490 = !DITemplateTypeParameter(name: "_Dp1", type: !323)
!491 = !DITemplateTypeParameter(name: "_Dp2", type: !323)
!492 = !{!493}
!493 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tp", value: !494)
!494 = !{!495, !495}
!495 = !DITemplateTypeParameter(type: !323)
!496 = !DITemplateTypeParameter(type: null, defaulted: true)
!497 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cd", scope: !498, file: !334, line: 613, baseType: !501)
!498 = distinct !DISubprogram(name: "operator-<long, std::ratio<1L, 1000000000L>, long, std::ratio<1L, 1000000000L> >", linkageName: "_ZNSt6chronomiIlSt5ratioILl1ELl1000000000EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_", scope: !335, file: !334, line: 608, type: !499, scopeLine: 610, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, templateParams: !510, retainedNodes: !507)
!499 = !DISubroutineType(types: !500)
!500 = !{!501, !411, !411}
!501 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !502, file: !334, line: 118, baseType: !413)
!502 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "common_type<std::chrono::duration<long, std::ratio<1L, 1000000000L> >, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !2, file: !334, line: 115, size: 8, flags: DIFlagTypePassByValue, elements: !408, templateParams: !503, identifier: "_ZTSSt11common_typeIJNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEES4_EE")
!503 = !{!504}
!504 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tp", value: !505)
!505 = !{!506, !506}
!506 = !DITemplateTypeParameter(type: !413)
!507 = !{!508, !509}
!508 = !DILocalVariable(name: "__lhs", arg: 1, scope: !498, file: !334, line: 608, type: !411)
!509 = !DILocalVariable(name: "__rhs", arg: 2, scope: !498, file: !334, line: 609, type: !411)
!510 = !{!471, !472, !473, !511}
!511 = !DITemplateTypeParameter(name: "_Period2", type: !461)
!512 = !DIDerivedType(tag: DW_TAG_typedef, name: "streamsize", scope: !2, file: !513, line: 98, baseType: !514)
!513 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/postypes.h", directory: "")
!514 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !2, file: !515, line: 2307, baseType: !323)
!515 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/x86_64-redhat-linux/bits/c++config.h", directory: "", checksumkind: CSK_MD5, checksum: "44fa36db46df6a33f85b9dfb5466d720")
!516 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!517 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "time_point<std::chrono::_V2::system_clock, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !335, file: !334, line: 812, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !518, templateParams: !544, identifier: "_ZTSNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEEE")
!518 = !{!519, !521, !525, !530, !535, !539, !540, !543}
!519 = !DIDerivedType(tag: DW_TAG_member, name: "__d", scope: !517, file: !334, line: 866, baseType: !520, size: 64, flags: DIFlagPrivate)
!520 = !DIDerivedType(tag: DW_TAG_typedef, name: "duration", scope: !517, file: !334, line: 818, baseType: !413)
!521 = !DISubprogram(name: "time_point", scope: !517, file: !334, line: 822, type: !522, scopeLine: 822, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!522 = !DISubroutineType(types: !523)
!523 = !{null, !524}
!524 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !517, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!525 = !DISubprogram(name: "time_point", scope: !517, file: !334, line: 825, type: !526, scopeLine: 825, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!526 = !DISubroutineType(types: !527)
!527 = !{null, !524, !528}
!528 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !529, size: 64)
!529 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !520)
!530 = !DISubprogram(name: "time_since_epoch", linkageName: "_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv", scope: !517, file: !334, line: 838, type: !531, scopeLine: 838, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!531 = !DISubroutineType(types: !532)
!532 = !{!520, !533}
!533 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !534, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!534 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !517)
!535 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEEpLERKS6_", scope: !517, file: !334, line: 843, type: !536, scopeLine: 843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!536 = !DISubroutineType(types: !537)
!537 = !{!538, !524, !528}
!538 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !517, size: 64)
!539 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEEmIERKS6_", scope: !517, file: !334, line: 850, type: !536, scopeLine: 850, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!540 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE3minEv", scope: !517, file: !334, line: 858, type: !541, scopeLine: 858, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!541 = !DISubroutineType(types: !542)
!542 = !{!517}
!543 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE3maxEv", scope: !517, file: !334, line: 862, type: !541, scopeLine: 862, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!544 = !{!545, !567}
!545 = !DITemplateTypeParameter(name: "_Clock", type: !546)
!546 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "system_clock", scope: !547, file: !334, line: 1038, size: 8, flags: DIFlagTypePassByValue, elements: !548, identifier: "_ZTSNSt6chrono3_V212system_clockE")
!547 = !DINamespace(name: "_V2", scope: !335, exportSymbols: true)
!548 = !{!549, !552, !556, !564}
!549 = !DIDerivedType(tag: DW_TAG_member, name: "is_steady", scope: !546, file: !334, line: 1049, baseType: !550, flags: DIFlagStaticMember, extraData: i1 false)
!550 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !551)
!551 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!552 = !DISubprogram(name: "now", linkageName: "_ZNSt6chrono3_V212system_clock3nowEv", scope: !546, file: !334, line: 1052, type: !553, scopeLine: 1052, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!553 = !DISubroutineType(types: !554)
!554 = !{!555}
!555 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_point", scope: !546, file: !334, line: 1043, baseType: !517)
!556 = !DISubprogram(name: "to_time_t", linkageName: "_ZNSt6chrono3_V212system_clock9to_time_tERKNS_10time_pointIS1_NS_8durationIlSt5ratioILl1ELl1000000000EEEEEE", scope: !546, file: !334, line: 1056, type: !557, scopeLine: 1056, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!557 = !DISubroutineType(types: !558)
!558 = !{!559, !562}
!559 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !560, line: 7, baseType: !561)
!560 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "49b4e16ef1215de5afdbb283400ab90c")
!561 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !310, line: 158, baseType: !323)
!562 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !563, size: 64)
!563 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !555)
!564 = !DISubprogram(name: "from_time_t", linkageName: "_ZNSt6chrono3_V212system_clock11from_time_tEl", scope: !546, file: !334, line: 1063, type: !565, scopeLine: 1063, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!565 = !DISubroutineType(types: !566)
!566 = !{!555, !559}
!567 = !DITemplateTypeParameter(name: "_Dur", type: !413)
!568 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1000L, 1L>", scope: !2, file: !393, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !569, templateParams: !572, identifier: "_ZTSSt5ratioILl1000ELl1EE")
!569 = !{!570, !571}
!570 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !568, file: !393, line: 273, baseType: !396, flags: DIFlagStaticMember, extraData: i64 1000)
!571 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !568, file: !393, line: 276, baseType: !396, flags: DIFlagStaticMember, extraData: i64 1)
!572 = !{!573, !574}
!573 = !DITemplateValueParameter(name: "_Num", type: !323, value: i64 1000)
!574 = !DITemplateValueParameter(name: "_Den", type: !323, defaulted: true, value: i64 1)
!575 = !{!0, !7, !15, !20, !25, !30, !35, !40, !45, !50, !55, !57, !62, !67, !69, !74}
!576 = !{!577, !583, !590, !592, !594, !598, !600, !602, !604, !606, !608, !610, !612, !617, !621, !623, !625, !630, !632, !634, !636, !638, !640, !642, !645, !648, !650, !654, !659, !661, !663, !665, !667, !669, !671, !673, !675, !677, !679, !683, !687, !689, !691, !693, !695, !697, !699, !701, !703, !705, !707, !709, !711, !713, !715, !717, !721, !725, !729, !731, !733, !735, !737, !739, !741, !743, !745, !747, !751, !755, !759, !761, !763, !765, !770, !774, !778, !780, !782, !784, !786, !788, !790, !792, !794, !796, !798, !800, !802, !806, !810, !814, !816, !818, !820, !825, !829, !833, !835, !837, !839, !841, !843, !845, !849, !853, !855, !857, !859, !861, !865, !869, !873, !875, !877, !879, !881, !883, !885, !889, !893, !897, !899, !903, !907, !909, !911, !913, !915, !917, !919, !923, !927, !933, !937, !944, !949, !951, !954, !958, !962, !973, !975, !979, !983, !987, !992, !996, !1000, !1004, !1008, !1016, !1020, !1024, !1026, !1030, !1034, !1038, !1044, !1048, !1052, !1054, !1062, !1066, !1072, !1074, !1078, !1082, !1086, !1090, !1095, !1099, !1103, !1104, !1105, !1106, !1108, !1109, !1110, !1111, !1112, !1113, !1114, !1116, !1117, !1118, !1119, !1120, !1121, !1122, !1124, !1125, !1126, !1127, !1128, !1129, !1130, !1131, !1132, !1133, !1134, !1135, !1136, !1137, !1138, !1139, !1140, !1141, !1142, !1143, !1144, !1145, !1146, !1147, !1148, !1152, !1156, !1159, !1161, !1163, !1165, !1167, !1169, !1171, !1173, !1175, !1177, !1179, !1181, !1183, !1185, !1187, !1189, !1191, !1193, !1195, !1197, !1199, !1201, !1203, !1205, !1207, !1209, !1213, !1215, !1217, !1221, !1225, !1227, !1229, !1231, !1233, !1235, !1237, !1239, !1241, !1243, !1245, !1247, !1249, !1251, !1253, !1255, !1257, !1259, !1261, !1263, !1265, !1267, !1272, !1274, !1276, !1278, !1280, !1282, !1284, !1286, !1288, !1290, !1292, !1294, !1296, !1298, !1300, !1302, !1304, !1306, !1308, !1310, !1314, !1316, !1318, !1320, !1322, !1324, !1326, !1328, !1330, !1332, !1334, !1336, !1338, !1340, !1342, !1344, !1346, !1348, !1350, !1352, !1354, !1356, !1358, !1360, !1362, !1364, !1366, !1368, !1370, !1372, !1374, !1376, !1378, !1380, !1382, !1384, !1386, !1388, !1390, !1392, !1394, !1396, !1398, !1400, !1402, !1404, !1406, !1408, !1410, !1412, !1414, !1416, !1418, !1420, !1422, !1439, !1442, !1447, !1505, !1510, !1514, !1518, !1522, !1526, !1528, !1530, !1534, !1540, !1544, !1550, !1556, !1558, !1562, !1566, !1570, !1574, !1586, !1588, !1592, !1596, !1600, !1602, !1606, !1610, !1614, !1616, !1618, !1622, !1630, !1634, !1638, !1642, !1644, !1650, !1652, !1658, !1662, !1666, !1670, !1674, !1678, !1682, !1684, !1686, !1690, !1694, !1698, !1700, !1704, !1708, !1710, !1712, !1716, !1720, !1724, !1728, !1729, !1730, !1731, !1732, !1733, !1734, !1735, !1736, !1737, !1738, !1742, !1746, !1749, !1750, !1752, !1754, !1756, !1758, !1761, !1764, !1767, !1770, !1771, !1773, !1776, !1779, !1780, !1783, !1785, !1787, !1789, !1791, !1794, !1797, !1800, !1803, !1806, !1808, !1812, !1816, !1821, !1825, !1827, !1829, !1831, !1833, !1835, !1837, !1839, !1841, !1843, !1845, !1847, !1849, !1851, !1855, !1861, !1866, !1870, !1872, !1874, !1876, !1878, !1885, !1889, !1893, !1897, !1901, !1905, !1910, !1914, !1916, !1920, !1926, !1930, !1935, !1937, !1940, !1944, !1948, !1950, !1952, !1954, !1956, !1960, !1962, !1964, !1968, !1972, !1976, !1980, !1984, !1988, !1990, !1994, !1998, !2002, !2006, !2008, !2010, !2014, !2018, !2019, !2020, !2021, !2022, !2023, !2029, !2032, !2033, !2035, !2037, !2039, !2041, !2045, !2047, !2049, !2051, !2053, !2055, !2057, !2059, !2061, !2065, !2069, !2071, !2075, !2079, !2084, !2085, !2086, !2091, !2095, !2100, !2105, !2109, !2115, !2119, !2121, !2125, !2132, !2137, !2140, !2146, !2150, !2154, !2158, !2162, !2166, !2168, !2170, !2172, !2176, !2180, !2184, !2188, !2192, !2194, !2196, !2198, !2202, !2206, !2210, !2212, !2214, !2216}
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !578, file: !582, line: 52)
!578 = !DISubprogram(name: "abs", scope: !579, file: !579, line: 837, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!579 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "d0b67d4c866748c04ac2b355c26c1c70")
!580 = !DISubroutineType(types: !581)
!581 = !{!291, !291}
!582 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/std_abs.h", directory: "")
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !584, file: !589, line: 83)
!584 = !DISubprogram(name: "acos", scope: !585, file: !585, line: 53, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!585 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "d6f9ed6e7af49b30a088f9f753a7a51b")
!586 = !DISubroutineType(types: !587)
!587 = !{!588, !588}
!588 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!589 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cmath", directory: "")
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !591, file: !589, line: 102)
!591 = !DISubprogram(name: "asin", scope: !585, file: !585, line: 55, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !593, file: !589, line: 121)
!593 = !DISubprogram(name: "atan", scope: !585, file: !585, line: 57, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !595, file: !589, line: 140)
!595 = !DISubprogram(name: "atan2", scope: !585, file: !585, line: 59, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!596 = !DISubroutineType(types: !597)
!597 = !{!588, !588, !588}
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !599, file: !589, line: 161)
!599 = !DISubprogram(name: "ceil", scope: !585, file: !585, line: 159, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !601, file: !589, line: 180)
!601 = !DISubprogram(name: "cos", scope: !585, file: !585, line: 62, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !603, file: !589, line: 199)
!603 = !DISubprogram(name: "cosh", scope: !585, file: !585, line: 71, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !605, file: !589, line: 218)
!605 = !DISubprogram(name: "exp", scope: !585, file: !585, line: 95, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !607, file: !589, line: 237)
!607 = !DISubprogram(name: "fabs", scope: !585, file: !585, line: 162, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !609, file: !589, line: 256)
!609 = !DISubprogram(name: "floor", scope: !585, file: !585, line: 165, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !611, file: !589, line: 275)
!611 = !DISubprogram(name: "fmod", scope: !585, file: !585, line: 168, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !613, file: !589, line: 296)
!613 = !DISubprogram(name: "frexp", scope: !585, file: !585, line: 98, type: !614, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!614 = !DISubroutineType(types: !615)
!615 = !{!588, !588, !616}
!616 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !291, size: 64)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !618, file: !589, line: 315)
!618 = !DISubprogram(name: "ldexp", scope: !585, file: !585, line: 101, type: !619, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!619 = !DISubroutineType(types: !620)
!620 = !{!588, !588, !291}
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !622, file: !589, line: 334)
!622 = !DISubprogram(name: "log", scope: !585, file: !585, line: 104, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !624, file: !589, line: 353)
!624 = !DISubprogram(name: "log10", scope: !585, file: !585, line: 107, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !626, file: !589, line: 372)
!626 = !DISubprogram(name: "modf", scope: !585, file: !585, line: 110, type: !627, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!627 = !DISubroutineType(types: !628)
!628 = !{!588, !588, !629}
!629 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !588, size: 64)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !631, file: !589, line: 384)
!631 = !DISubprogram(name: "pow", scope: !585, file: !585, line: 140, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !633, file: !589, line: 421)
!633 = !DISubprogram(name: "sin", scope: !585, file: !585, line: 64, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !635, file: !589, line: 440)
!635 = !DISubprogram(name: "sinh", scope: !585, file: !585, line: 73, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !637, file: !589, line: 459)
!637 = !DISubprogram(name: "sqrt", scope: !585, file: !585, line: 143, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !639, file: !589, line: 478)
!639 = !DISubprogram(name: "tan", scope: !585, file: !585, line: 66, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !641, file: !589, line: 497)
!641 = !DISubprogram(name: "tanh", scope: !585, file: !585, line: 75, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !643, file: !589, line: 1065)
!643 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !644, line: 150, baseType: !588)
!644 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "c5a5a367b9358fd8d34408e944614c4d")
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !646, file: !589, line: 1066)
!646 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !644, line: 149, baseType: !647)
!647 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !649, file: !589, line: 1069)
!649 = !DISubprogram(name: "acosh", scope: !585, file: !585, line: 85, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !651, file: !589, line: 1070)
!651 = !DISubprogram(name: "acoshf", scope: !585, file: !585, line: 85, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!652 = !DISubroutineType(types: !653)
!653 = !{!647, !647}
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !655, file: !589, line: 1071)
!655 = !DISubprogram(name: "acoshl", scope: !585, file: !585, line: 85, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!656 = !DISubroutineType(types: !657)
!657 = !{!658, !658}
!658 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !660, file: !589, line: 1073)
!660 = !DISubprogram(name: "asinh", scope: !585, file: !585, line: 87, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !662, file: !589, line: 1074)
!662 = !DISubprogram(name: "asinhf", scope: !585, file: !585, line: 87, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !664, file: !589, line: 1075)
!664 = !DISubprogram(name: "asinhl", scope: !585, file: !585, line: 87, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !666, file: !589, line: 1077)
!666 = !DISubprogram(name: "atanh", scope: !585, file: !585, line: 89, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !668, file: !589, line: 1078)
!668 = !DISubprogram(name: "atanhf", scope: !585, file: !585, line: 89, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !670, file: !589, line: 1079)
!670 = !DISubprogram(name: "atanhl", scope: !585, file: !585, line: 89, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !672, file: !589, line: 1081)
!672 = !DISubprogram(name: "cbrt", scope: !585, file: !585, line: 152, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !674, file: !589, line: 1082)
!674 = !DISubprogram(name: "cbrtf", scope: !585, file: !585, line: 152, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !676, file: !589, line: 1083)
!676 = !DISubprogram(name: "cbrtl", scope: !585, file: !585, line: 152, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !678, file: !589, line: 1085)
!678 = !DISubprogram(name: "copysign", scope: !585, file: !585, line: 196, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !680, file: !589, line: 1086)
!680 = !DISubprogram(name: "copysignf", scope: !585, file: !585, line: 196, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!681 = !DISubroutineType(types: !682)
!682 = !{!647, !647, !647}
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !684, file: !589, line: 1087)
!684 = !DISubprogram(name: "copysignl", scope: !585, file: !585, line: 196, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!685 = !DISubroutineType(types: !686)
!686 = !{!658, !658, !658}
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !688, file: !589, line: 1089)
!688 = !DISubprogram(name: "erf", scope: !585, file: !585, line: 228, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !690, file: !589, line: 1090)
!690 = !DISubprogram(name: "erff", scope: !585, file: !585, line: 228, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !692, file: !589, line: 1091)
!692 = !DISubprogram(name: "erfl", scope: !585, file: !585, line: 228, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !694, file: !589, line: 1093)
!694 = !DISubprogram(name: "erfc", scope: !585, file: !585, line: 229, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !696, file: !589, line: 1094)
!696 = !DISubprogram(name: "erfcf", scope: !585, file: !585, line: 229, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !698, file: !589, line: 1095)
!698 = !DISubprogram(name: "erfcl", scope: !585, file: !585, line: 229, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !700, file: !589, line: 1097)
!700 = !DISubprogram(name: "exp2", scope: !585, file: !585, line: 130, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !702, file: !589, line: 1098)
!702 = !DISubprogram(name: "exp2f", scope: !585, file: !585, line: 130, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !704, file: !589, line: 1099)
!704 = !DISubprogram(name: "exp2l", scope: !585, file: !585, line: 130, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !706, file: !589, line: 1101)
!706 = !DISubprogram(name: "expm1", scope: !585, file: !585, line: 119, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !708, file: !589, line: 1102)
!708 = !DISubprogram(name: "expm1f", scope: !585, file: !585, line: 119, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !710, file: !589, line: 1103)
!710 = !DISubprogram(name: "expm1l", scope: !585, file: !585, line: 119, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !712, file: !589, line: 1105)
!712 = !DISubprogram(name: "fdim", scope: !585, file: !585, line: 326, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !714, file: !589, line: 1106)
!714 = !DISubprogram(name: "fdimf", scope: !585, file: !585, line: 326, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !716, file: !589, line: 1107)
!716 = !DISubprogram(name: "fdiml", scope: !585, file: !585, line: 326, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !718, file: !589, line: 1109)
!718 = !DISubprogram(name: "fma", scope: !585, file: !585, line: 335, type: !719, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!719 = !DISubroutineType(types: !720)
!720 = !{!588, !588, !588, !588}
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !722, file: !589, line: 1110)
!722 = !DISubprogram(name: "fmaf", scope: !585, file: !585, line: 335, type: !723, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!723 = !DISubroutineType(types: !724)
!724 = !{!647, !647, !647, !647}
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !726, file: !589, line: 1111)
!726 = !DISubprogram(name: "fmal", scope: !585, file: !585, line: 335, type: !727, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!727 = !DISubroutineType(types: !728)
!728 = !{!658, !658, !658, !658}
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !730, file: !589, line: 1113)
!730 = !DISubprogram(name: "fmax", scope: !585, file: !585, line: 329, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !732, file: !589, line: 1114)
!732 = !DISubprogram(name: "fmaxf", scope: !585, file: !585, line: 329, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !734, file: !589, line: 1115)
!734 = !DISubprogram(name: "fmaxl", scope: !585, file: !585, line: 329, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !736, file: !589, line: 1117)
!736 = !DISubprogram(name: "fmin", scope: !585, file: !585, line: 332, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !738, file: !589, line: 1118)
!738 = !DISubprogram(name: "fminf", scope: !585, file: !585, line: 332, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !740, file: !589, line: 1119)
!740 = !DISubprogram(name: "fminl", scope: !585, file: !585, line: 332, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !742, file: !589, line: 1121)
!742 = !DISubprogram(name: "hypot", scope: !585, file: !585, line: 147, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !744, file: !589, line: 1122)
!744 = !DISubprogram(name: "hypotf", scope: !585, file: !585, line: 147, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !746, file: !589, line: 1123)
!746 = !DISubprogram(name: "hypotl", scope: !585, file: !585, line: 147, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !748, file: !589, line: 1125)
!748 = !DISubprogram(name: "ilogb", scope: !585, file: !585, line: 280, type: !749, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!749 = !DISubroutineType(types: !750)
!750 = !{!291, !588}
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !752, file: !589, line: 1126)
!752 = !DISubprogram(name: "ilogbf", scope: !585, file: !585, line: 280, type: !753, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!753 = !DISubroutineType(types: !754)
!754 = !{!291, !647}
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !756, file: !589, line: 1127)
!756 = !DISubprogram(name: "ilogbl", scope: !585, file: !585, line: 280, type: !757, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!757 = !DISubroutineType(types: !758)
!758 = !{!291, !658}
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !760, file: !589, line: 1129)
!760 = !DISubprogram(name: "lgamma", scope: !585, file: !585, line: 230, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !762, file: !589, line: 1130)
!762 = !DISubprogram(name: "lgammaf", scope: !585, file: !585, line: 230, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !764, file: !589, line: 1131)
!764 = !DISubprogram(name: "lgammal", scope: !585, file: !585, line: 230, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !766, file: !589, line: 1134)
!766 = !DISubprogram(name: "llrint", scope: !585, file: !585, line: 316, type: !767, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!767 = !DISubroutineType(types: !768)
!768 = !{!769, !588}
!769 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !771, file: !589, line: 1135)
!771 = !DISubprogram(name: "llrintf", scope: !585, file: !585, line: 316, type: !772, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!772 = !DISubroutineType(types: !773)
!773 = !{!769, !647}
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !775, file: !589, line: 1136)
!775 = !DISubprogram(name: "llrintl", scope: !585, file: !585, line: 316, type: !776, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!776 = !DISubroutineType(types: !777)
!777 = !{!769, !658}
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !779, file: !589, line: 1138)
!779 = !DISubprogram(name: "llround", scope: !585, file: !585, line: 322, type: !767, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !781, file: !589, line: 1139)
!781 = !DISubprogram(name: "llroundf", scope: !585, file: !585, line: 322, type: !772, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !783, file: !589, line: 1140)
!783 = !DISubprogram(name: "llroundl", scope: !585, file: !585, line: 322, type: !776, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !785, file: !589, line: 1143)
!785 = !DISubprogram(name: "log1p", scope: !585, file: !585, line: 122, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !787, file: !589, line: 1144)
!787 = !DISubprogram(name: "log1pf", scope: !585, file: !585, line: 122, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !789, file: !589, line: 1145)
!789 = !DISubprogram(name: "log1pl", scope: !585, file: !585, line: 122, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !791, file: !589, line: 1147)
!791 = !DISubprogram(name: "log2", scope: !585, file: !585, line: 133, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !793, file: !589, line: 1148)
!793 = !DISubprogram(name: "log2f", scope: !585, file: !585, line: 133, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !795, file: !589, line: 1149)
!795 = !DISubprogram(name: "log2l", scope: !585, file: !585, line: 133, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !797, file: !589, line: 1151)
!797 = !DISubprogram(name: "logb", scope: !585, file: !585, line: 125, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !799, file: !589, line: 1152)
!799 = !DISubprogram(name: "logbf", scope: !585, file: !585, line: 125, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !801, file: !589, line: 1153)
!801 = !DISubprogram(name: "logbl", scope: !585, file: !585, line: 125, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !803, file: !589, line: 1155)
!803 = !DISubprogram(name: "lrint", scope: !585, file: !585, line: 314, type: !804, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!804 = !DISubroutineType(types: !805)
!805 = !{!323, !588}
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !807, file: !589, line: 1156)
!807 = !DISubprogram(name: "lrintf", scope: !585, file: !585, line: 314, type: !808, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!808 = !DISubroutineType(types: !809)
!809 = !{!323, !647}
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !811, file: !589, line: 1157)
!811 = !DISubprogram(name: "lrintl", scope: !585, file: !585, line: 314, type: !812, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!812 = !DISubroutineType(types: !813)
!813 = !{!323, !658}
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !815, file: !589, line: 1159)
!815 = !DISubprogram(name: "lround", scope: !585, file: !585, line: 320, type: !804, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !817, file: !589, line: 1160)
!817 = !DISubprogram(name: "lroundf", scope: !585, file: !585, line: 320, type: !808, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !819, file: !589, line: 1161)
!819 = !DISubprogram(name: "lroundl", scope: !585, file: !585, line: 320, type: !812, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !821, file: !589, line: 1163)
!821 = !DISubprogram(name: "nan", scope: !585, file: !585, line: 201, type: !822, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!822 = !DISubroutineType(types: !823)
!823 = !{!588, !824}
!824 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !826, file: !589, line: 1164)
!826 = !DISubprogram(name: "nanf", scope: !585, file: !585, line: 201, type: !827, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!827 = !DISubroutineType(types: !828)
!828 = !{!647, !824}
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !830, file: !589, line: 1165)
!830 = !DISubprogram(name: "nanl", scope: !585, file: !585, line: 201, type: !831, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!831 = !DISubroutineType(types: !832)
!832 = !{!658, !824}
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !834, file: !589, line: 1167)
!834 = !DISubprogram(name: "nearbyint", scope: !585, file: !585, line: 294, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !836, file: !589, line: 1168)
!836 = !DISubprogram(name: "nearbyintf", scope: !585, file: !585, line: 294, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !838, file: !589, line: 1169)
!838 = !DISubprogram(name: "nearbyintl", scope: !585, file: !585, line: 294, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !840, file: !589, line: 1171)
!840 = !DISubprogram(name: "nextafter", scope: !585, file: !585, line: 259, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !842, file: !589, line: 1172)
!842 = !DISubprogram(name: "nextafterf", scope: !585, file: !585, line: 259, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !844, file: !589, line: 1173)
!844 = !DISubprogram(name: "nextafterl", scope: !585, file: !585, line: 259, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !846, file: !589, line: 1175)
!846 = !DISubprogram(name: "nexttoward", scope: !585, file: !585, line: 261, type: !847, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!847 = !DISubroutineType(types: !848)
!848 = !{!588, !588, !658}
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !850, file: !589, line: 1176)
!850 = !DISubprogram(name: "nexttowardf", scope: !585, file: !585, line: 261, type: !851, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!851 = !DISubroutineType(types: !852)
!852 = !{!647, !647, !658}
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !854, file: !589, line: 1177)
!854 = !DISubprogram(name: "nexttowardl", scope: !585, file: !585, line: 261, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !856, file: !589, line: 1179)
!856 = !DISubprogram(name: "remainder", scope: !585, file: !585, line: 272, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !858, file: !589, line: 1180)
!858 = !DISubprogram(name: "remainderf", scope: !585, file: !585, line: 272, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !860, file: !589, line: 1181)
!860 = !DISubprogram(name: "remainderl", scope: !585, file: !585, line: 272, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !862, file: !589, line: 1183)
!862 = !DISubprogram(name: "remquo", scope: !585, file: !585, line: 307, type: !863, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!863 = !DISubroutineType(types: !864)
!864 = !{!588, !588, !588, !616}
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !866, file: !589, line: 1184)
!866 = !DISubprogram(name: "remquof", scope: !585, file: !585, line: 307, type: !867, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!867 = !DISubroutineType(types: !868)
!868 = !{!647, !647, !647, !616}
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !870, file: !589, line: 1185)
!870 = !DISubprogram(name: "remquol", scope: !585, file: !585, line: 307, type: !871, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!871 = !DISubroutineType(types: !872)
!872 = !{!658, !658, !658, !616}
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !874, file: !589, line: 1187)
!874 = !DISubprogram(name: "rint", scope: !585, file: !585, line: 256, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !876, file: !589, line: 1188)
!876 = !DISubprogram(name: "rintf", scope: !585, file: !585, line: 256, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !878, file: !589, line: 1189)
!878 = !DISubprogram(name: "rintl", scope: !585, file: !585, line: 256, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !880, file: !589, line: 1191)
!880 = !DISubprogram(name: "round", scope: !585, file: !585, line: 298, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !882, file: !589, line: 1192)
!882 = !DISubprogram(name: "roundf", scope: !585, file: !585, line: 298, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !884, file: !589, line: 1193)
!884 = !DISubprogram(name: "roundl", scope: !585, file: !585, line: 298, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !886, file: !589, line: 1195)
!886 = !DISubprogram(name: "scalbln", scope: !585, file: !585, line: 290, type: !887, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!887 = !DISubroutineType(types: !888)
!888 = !{!588, !588, !323}
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !890, file: !589, line: 1196)
!890 = !DISubprogram(name: "scalblnf", scope: !585, file: !585, line: 290, type: !891, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!891 = !DISubroutineType(types: !892)
!892 = !{!647, !647, !323}
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !894, file: !589, line: 1197)
!894 = !DISubprogram(name: "scalblnl", scope: !585, file: !585, line: 290, type: !895, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!895 = !DISubroutineType(types: !896)
!896 = !{!658, !658, !323}
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !898, file: !589, line: 1199)
!898 = !DISubprogram(name: "scalbn", scope: !585, file: !585, line: 276, type: !619, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !900, file: !589, line: 1200)
!900 = !DISubprogram(name: "scalbnf", scope: !585, file: !585, line: 276, type: !901, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!901 = !DISubroutineType(types: !902)
!902 = !{!647, !647, !291}
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !904, file: !589, line: 1201)
!904 = !DISubprogram(name: "scalbnl", scope: !585, file: !585, line: 276, type: !905, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!905 = !DISubroutineType(types: !906)
!906 = !{!658, !658, !291}
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !908, file: !589, line: 1203)
!908 = !DISubprogram(name: "tgamma", scope: !585, file: !585, line: 235, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !910, file: !589, line: 1204)
!910 = !DISubprogram(name: "tgammaf", scope: !585, file: !585, line: 235, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !912, file: !589, line: 1205)
!912 = !DISubprogram(name: "tgammal", scope: !585, file: !585, line: 235, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !914, file: !589, line: 1207)
!914 = !DISubprogram(name: "trunc", scope: !585, file: !585, line: 302, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !916, file: !589, line: 1208)
!916 = !DISubprogram(name: "truncf", scope: !585, file: !585, line: 302, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !918, file: !589, line: 1209)
!918 = !DISubprogram(name: "truncl", scope: !585, file: !585, line: 302, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!919 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !920, entity: !921, file: !922, line: 58)
!920 = !DINamespace(name: "__gnu_debug", scope: null)
!921 = !DINamespace(name: "__debug", scope: !2)
!922 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "c69f68f2d2cbac034a41bb7ce5c36465")
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !924, file: !926, line: 127)
!924 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !579, line: 62, baseType: !925)
!925 = !DICompositeType(tag: DW_TAG_structure_type, file: !579, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!926 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdlib", directory: "")
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !928, file: !926, line: 128)
!928 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !579, line: 70, baseType: !929)
!929 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !579, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !930, identifier: "_ZTS6ldiv_t")
!930 = !{!931, !932}
!931 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !929, file: !579, line: 68, baseType: !323, size: 64)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !929, file: !579, line: 69, baseType: !323, size: 64, offset: 64)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !934, file: !926, line: 130)
!934 = !DISubprogram(name: "abort", scope: !579, file: !579, line: 588, type: !935, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!935 = !DISubroutineType(types: !936)
!936 = !{null}
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !938, file: !926, line: 132)
!938 = !DISubprogram(name: "aligned_alloc", scope: !579, file: !579, line: 583, type: !939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!939 = !DISubroutineType(types: !940)
!940 = !{!302, !941, !941}
!941 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !942, line: 46, baseType: !943)
!942 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!943 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !945, file: !926, line: 134)
!945 = !DISubprogram(name: "atexit", scope: !579, file: !579, line: 592, type: !946, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!946 = !DISubroutineType(types: !947)
!947 = !{!291, !948}
!948 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !935, size: 64)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !950, file: !926, line: 137)
!950 = !DISubprogram(name: "at_quick_exit", scope: !579, file: !579, line: 597, type: !946, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !952, file: !926, line: 140)
!952 = !DISubprogram(name: "atof", scope: !953, file: !953, line: 25, type: !822, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!953 = !DIFile(filename: "/usr/include/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "ce60958b260b171e83db3307f1d644f0")
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !955, file: !926, line: 141)
!955 = !DISubprogram(name: "atoi", scope: !579, file: !579, line: 361, type: !956, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!956 = !DISubroutineType(types: !957)
!957 = !{!291, !824}
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !959, file: !926, line: 142)
!959 = !DISubprogram(name: "atol", scope: !579, file: !579, line: 366, type: !960, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!960 = !DISubroutineType(types: !961)
!961 = !{!323, !824}
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !963, file: !926, line: 143)
!963 = !DISubprogram(name: "bsearch", scope: !964, file: !964, line: 20, type: !965, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!964 = !DIFile(filename: "/usr/include/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "1a798a38b25adee7bb680abce9ef568a")
!965 = !DISubroutineType(types: !966)
!966 = !{!302, !967, !967, !941, !941, !969}
!967 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !968, size: 64)
!968 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!969 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !579, line: 805, baseType: !970)
!970 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !971, size: 64)
!971 = !DISubroutineType(types: !972)
!972 = !{!291, !967, !967}
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !974, file: !926, line: 144)
!974 = !DISubprogram(name: "calloc", scope: !579, file: !579, line: 541, type: !939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !976, file: !926, line: 145)
!976 = !DISubprogram(name: "div", scope: !579, file: !579, line: 849, type: !977, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!977 = !DISubroutineType(types: !978)
!978 = !{!924, !291, !291}
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !980, file: !926, line: 146)
!980 = !DISubprogram(name: "exit", scope: !579, file: !579, line: 614, type: !981, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!981 = !DISubroutineType(types: !982)
!982 = !{null, !291}
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !984, file: !926, line: 147)
!984 = !DISubprogram(name: "free", scope: !579, file: !579, line: 563, type: !985, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!985 = !DISubroutineType(types: !986)
!986 = !{null, !302}
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !988, file: !926, line: 148)
!988 = !DISubprogram(name: "getenv", scope: !579, file: !579, line: 631, type: !989, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!989 = !DISubroutineType(types: !990)
!990 = !{!991, !824}
!991 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !993, file: !926, line: 149)
!993 = !DISubprogram(name: "labs", scope: !579, file: !579, line: 838, type: !994, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!994 = !DISubroutineType(types: !995)
!995 = !{!323, !323}
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !997, file: !926, line: 150)
!997 = !DISubprogram(name: "ldiv", scope: !579, file: !579, line: 851, type: !998, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!998 = !DISubroutineType(types: !999)
!999 = !{!928, !323, !323}
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1001, file: !926, line: 151)
!1001 = !DISubprogram(name: "malloc", scope: !579, file: !579, line: 539, type: !1002, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1002 = !DISubroutineType(types: !1003)
!1003 = !{!302, !941}
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1005, file: !926, line: 153)
!1005 = !DISubprogram(name: "mblen", scope: !579, file: !579, line: 919, type: !1006, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1006 = !DISubroutineType(types: !1007)
!1007 = !{!291, !824, !941}
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1009, file: !926, line: 154)
!1009 = !DISubprogram(name: "mbstowcs", scope: !579, file: !579, line: 930, type: !1010, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1010 = !DISubroutineType(types: !1011)
!1011 = !{!941, !1012, !1015, !941}
!1012 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1013)
!1013 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1014, size: 64)
!1014 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!1015 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !824)
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1017, file: !926, line: 155)
!1017 = !DISubprogram(name: "mbtowc", scope: !579, file: !579, line: 922, type: !1018, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{!291, !1012, !1015, !941}
!1020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1021, file: !926, line: 157)
!1021 = !DISubprogram(name: "qsort", scope: !579, file: !579, line: 827, type: !1022, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{null, !302, !941, !941, !969}
!1024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1025, file: !926, line: 160)
!1025 = !DISubprogram(name: "quick_exit", scope: !579, file: !579, line: 620, type: !981, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1027, file: !926, line: 163)
!1027 = !DISubprogram(name: "rand", scope: !579, file: !579, line: 453, type: !1028, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1028 = !DISubroutineType(types: !1029)
!1029 = !{!291}
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1031, file: !926, line: 164)
!1031 = !DISubprogram(name: "realloc", scope: !579, file: !579, line: 549, type: !1032, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{!302, !302, !941}
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1035, file: !926, line: 165)
!1035 = !DISubprogram(name: "srand", scope: !579, file: !579, line: 455, type: !1036, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{null, !81}
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1039, file: !926, line: 166)
!1039 = !DISubprogram(name: "strtod", scope: !579, file: !579, line: 117, type: !1040, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!588, !1015, !1042}
!1042 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1043)
!1043 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !991, size: 64)
!1044 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1045, file: !926, line: 167)
!1045 = !DISubprogram(name: "strtol", scope: !579, file: !579, line: 176, type: !1046, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1046 = !DISubroutineType(types: !1047)
!1047 = !{!323, !1015, !1042, !291}
!1048 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1049, file: !926, line: 168)
!1049 = !DISubprogram(name: "strtoul", scope: !579, file: !579, line: 180, type: !1050, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1050 = !DISubroutineType(types: !1051)
!1051 = !{!943, !1015, !1042, !291}
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1053, file: !926, line: 169)
!1053 = !DISubprogram(name: "system", scope: !579, file: !579, line: 781, type: !956, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1055, file: !926, line: 171)
!1055 = !DISubprogram(name: "wcstombs", scope: !579, file: !579, line: 933, type: !1056, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1056 = !DISubroutineType(types: !1057)
!1057 = !{!941, !1058, !1059, !941}
!1058 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !991)
!1059 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1060)
!1060 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1061, size: 64)
!1061 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1014)
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1063, file: !926, line: 172)
!1063 = !DISubprogram(name: "wctomb", scope: !579, file: !579, line: 926, type: !1064, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1064 = !DISubroutineType(types: !1065)
!1065 = !{!291, !991, !1014}
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1067, file: !926, line: 200)
!1067 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !579, line: 80, baseType: !1068)
!1068 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !579, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !1069, identifier: "_ZTS7lldiv_t")
!1069 = !{!1070, !1071}
!1070 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1068, file: !579, line: 78, baseType: !769, size: 64)
!1071 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1068, file: !579, line: 79, baseType: !769, size: 64, offset: 64)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1073, file: !926, line: 206)
!1073 = !DISubprogram(name: "_Exit", scope: !579, file: !579, line: 626, type: !981, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1075, file: !926, line: 210)
!1075 = !DISubprogram(name: "llabs", scope: !579, file: !579, line: 841, type: !1076, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1076 = !DISubroutineType(types: !1077)
!1077 = !{!769, !769}
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1079, file: !926, line: 216)
!1079 = !DISubprogram(name: "lldiv", scope: !579, file: !579, line: 855, type: !1080, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!1067, !769, !769}
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1083, file: !926, line: 227)
!1083 = !DISubprogram(name: "atoll", scope: !579, file: !579, line: 373, type: !1084, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!769, !824}
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1087, file: !926, line: 228)
!1087 = !DISubprogram(name: "strtoll", scope: !579, file: !579, line: 200, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!769, !1015, !1042, !291}
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1091, file: !926, line: 229)
!1091 = !DISubprogram(name: "strtoull", scope: !579, file: !579, line: 205, type: !1092, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1092 = !DISubroutineType(types: !1093)
!1093 = !{!1094, !1015, !1042, !291}
!1094 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1096, file: !926, line: 231)
!1096 = !DISubprogram(name: "strtof", scope: !579, file: !579, line: 123, type: !1097, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1097 = !DISubroutineType(types: !1098)
!1098 = !{!647, !1015, !1042}
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1100, file: !926, line: 232)
!1100 = !DISubprogram(name: "strtold", scope: !579, file: !579, line: 126, type: !1101, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1101 = !DISubroutineType(types: !1102)
!1102 = !{!658, !1015, !1042}
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1067, file: !926, line: 240)
!1104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1073, file: !926, line: 242)
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1075, file: !926, line: 244)
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1107, file: !926, line: 245)
!1107 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !80, file: !926, line: 213, type: !1080, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1079, file: !926, line: 246)
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1083, file: !926, line: 248)
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1096, file: !926, line: 249)
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1087, file: !926, line: 250)
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1091, file: !926, line: 251)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1100, file: !926, line: 252)
!1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !934, file: !1115, line: 38)
!1115 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "74812296ae1ebf65f0c19983efc04bc1")
!1116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !945, file: !1115, line: 39)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !980, file: !1115, line: 40)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !950, file: !1115, line: 43)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1025, file: !1115, line: 46)
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !924, file: !1115, line: 51)
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !928, file: !1115, line: 52)
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1123, file: !1115, line: 54)
!1123 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !2, file: !582, line: 79, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !952, file: !1115, line: 55)
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !955, file: !1115, line: 56)
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !959, file: !1115, line: 57)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !963, file: !1115, line: 58)
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !974, file: !1115, line: 59)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1107, file: !1115, line: 60)
!1130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !984, file: !1115, line: 61)
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !988, file: !1115, line: 62)
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !993, file: !1115, line: 63)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !997, file: !1115, line: 64)
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1001, file: !1115, line: 65)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1005, file: !1115, line: 67)
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1009, file: !1115, line: 68)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1017, file: !1115, line: 69)
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1021, file: !1115, line: 71)
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1027, file: !1115, line: 72)
!1140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1031, file: !1115, line: 73)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1035, file: !1115, line: 74)
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1039, file: !1115, line: 75)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1045, file: !1115, line: 76)
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1049, file: !1115, line: 77)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1053, file: !1115, line: 78)
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1055, file: !1115, line: 80)
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !76, entity: !1063, file: !1115, line: 81)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1149, file: !1150, line: 58)
!1149 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !1151, file: !1150, line: 80, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!1150 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "9bda7d21a11cfdb902745e8f6fa7810a")
!1151 = !DINamespace(name: "__exception_ptr", scope: !2)
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1151, entity: !1153, file: !1150, line: 74)
!1153 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !1150, line: 70, type: !1154, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1154 = !DISubroutineType(types: !1155)
!1155 = !{null, !1149}
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1157, file: !1158, line: 200)
!1157 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !1158, file: !1158, line: 28, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1158 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1160, file: !1158, line: 201)
!1160 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !1158, file: !1158, line: 32, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1162, file: !1158, line: 202)
!1162 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !1158, file: !1158, line: 34, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1164, file: !1158, line: 203)
!1164 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !1158, file: !1158, line: 36, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1166, file: !1158, line: 204)
!1166 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !1158, file: !1158, line: 38, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1168, file: !1158, line: 205)
!1168 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !1158, file: !1158, line: 42, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1170, file: !1158, line: 206)
!1170 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !1158, file: !1158, line: 40, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1172, file: !1158, line: 207)
!1172 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !1158, file: !1158, line: 44, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1174, file: !1158, line: 208)
!1174 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !1158, file: !1158, line: 46, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1176, file: !1158, line: 209)
!1176 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !1158, file: !1158, line: 48, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1178, file: !1158, line: 210)
!1178 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !1158, file: !1158, line: 50, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1180, file: !1158, line: 211)
!1180 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !1158, file: !1158, line: 52, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1182, file: !1158, line: 212)
!1182 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !1158, file: !1158, line: 54, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1184, file: !1158, line: 213)
!1184 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !1158, file: !1158, line: 58, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1186, file: !1158, line: 214)
!1186 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !1158, file: !1158, line: 56, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1188, file: !1158, line: 215)
!1188 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !1158, file: !1158, line: 62, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1190, file: !1158, line: 216)
!1190 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !1158, file: !1158, line: 60, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1192, file: !1158, line: 217)
!1192 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !1158, file: !1158, line: 64, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1194, file: !1158, line: 218)
!1194 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !1158, file: !1158, line: 66, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1196, file: !1158, line: 219)
!1196 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !1158, file: !1158, line: 68, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1198, file: !1158, line: 220)
!1198 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !1158, file: !1158, line: 70, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1200, file: !1158, line: 221)
!1200 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !1158, file: !1158, line: 72, type: !723, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1202, file: !1158, line: 222)
!1202 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !1158, file: !1158, line: 74, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1204, file: !1158, line: 223)
!1204 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !1158, file: !1158, line: 76, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1206, file: !1158, line: 224)
!1206 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !1158, file: !1158, line: 78, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1208, file: !1158, line: 225)
!1208 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !1158, file: !1158, line: 80, type: !753, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1210, file: !1158, line: 226)
!1210 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !1158, file: !1158, line: 82, type: !1211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1211 = !DISubroutineType(types: !1212)
!1212 = !{!647, !647, !616}
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1214, file: !1158, line: 227)
!1214 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !1158, file: !1158, line: 84, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1216, file: !1158, line: 228)
!1216 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !1158, file: !1158, line: 86, type: !753, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1218, file: !1158, line: 229)
!1218 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !1158, file: !1158, line: 91, type: !1219, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1219 = !DISubroutineType(types: !1220)
!1220 = !{!551, !647}
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1222, file: !1158, line: 230)
!1222 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !1158, file: !1158, line: 95, type: !1223, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1223 = !DISubroutineType(types: !1224)
!1224 = !{!551, !647, !647}
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1226, file: !1158, line: 231)
!1226 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !1158, file: !1158, line: 94, type: !1223, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1228, file: !1158, line: 232)
!1228 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !1158, file: !1158, line: 100, type: !1219, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1230, file: !1158, line: 233)
!1230 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !1158, file: !1158, line: 104, type: !1223, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1232, file: !1158, line: 234)
!1232 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !1158, file: !1158, line: 103, type: !1223, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1234, file: !1158, line: 235)
!1234 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !1158, file: !1158, line: 106, type: !1223, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1236, file: !1158, line: 236)
!1236 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !1158, file: !1158, line: 111, type: !1219, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1238, file: !1158, line: 237)
!1238 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !1158, file: !1158, line: 113, type: !1219, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1240, file: !1158, line: 238)
!1240 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !1158, file: !1158, line: 115, type: !1223, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1242, file: !1158, line: 239)
!1242 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !1158, file: !1158, line: 116, type: !994, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1244, file: !1158, line: 240)
!1244 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !1158, file: !1158, line: 118, type: !901, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1246, file: !1158, line: 241)
!1246 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !1158, file: !1158, line: 120, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1248, file: !1158, line: 242)
!1248 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !1158, file: !1158, line: 121, type: !1076, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1250, file: !1158, line: 243)
!1250 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !1158, file: !1158, line: 123, type: !772, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1252, file: !1158, line: 244)
!1252 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !1158, file: !1158, line: 133, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1254, file: !1158, line: 245)
!1254 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !1158, file: !1158, line: 125, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1256, file: !1158, line: 246)
!1256 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !1158, file: !1158, line: 127, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1258, file: !1158, line: 247)
!1258 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !1158, file: !1158, line: 129, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1260, file: !1158, line: 248)
!1260 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !1158, file: !1158, line: 131, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1262, file: !1158, line: 249)
!1262 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !1158, file: !1158, line: 135, type: !808, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1264, file: !1158, line: 250)
!1264 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !1158, file: !1158, line: 137, type: !808, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1266, file: !1158, line: 251)
!1266 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !1158, file: !1158, line: 138, type: !772, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1268, file: !1158, line: 252)
!1268 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !1158, file: !1158, line: 140, type: !1269, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1269 = !DISubroutineType(types: !1270)
!1270 = !{!647, !647, !1271}
!1271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !647, size: 64)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1273, file: !1158, line: 253)
!1273 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !1158, file: !1158, line: 141, type: !822, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1275, file: !1158, line: 254)
!1275 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !1158, file: !1158, line: 142, type: !827, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1277, file: !1158, line: 255)
!1277 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !1158, file: !1158, line: 144, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1279, file: !1158, line: 256)
!1279 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !1158, file: !1158, line: 146, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1281, file: !1158, line: 257)
!1281 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !1158, file: !1158, line: 150, type: !901, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1283, file: !1158, line: 258)
!1283 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !1158, file: !1158, line: 152, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1285, file: !1158, line: 259)
!1285 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !1158, file: !1158, line: 154, type: !867, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1287, file: !1158, line: 260)
!1287 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !1158, file: !1158, line: 156, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1289, file: !1158, line: 261)
!1289 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !1158, file: !1158, line: 158, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1291, file: !1158, line: 262)
!1291 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !1158, file: !1158, line: 160, type: !891, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1293, file: !1158, line: 263)
!1293 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !1158, file: !1158, line: 162, type: !901, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1295, file: !1158, line: 264)
!1295 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !1158, file: !1158, line: 167, type: !1219, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1297, file: !1158, line: 265)
!1297 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !1158, file: !1158, line: 169, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1299, file: !1158, line: 266)
!1299 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !1158, file: !1158, line: 171, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1301, file: !1158, line: 267)
!1301 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !1158, file: !1158, line: 173, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1303, file: !1158, line: 268)
!1303 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !1158, file: !1158, line: 175, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1305, file: !1158, line: 269)
!1305 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !1158, file: !1158, line: 177, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1307, file: !1158, line: 270)
!1307 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !1158, file: !1158, line: 179, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1309, file: !1158, line: 271)
!1309 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !1158, file: !1158, line: 181, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1311, file: !1313, line: 729)
!1311 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !1312, file: !1312, line: 188, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1312 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "77b108a711ff1d970d6aaeeab7921660")
!1313 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "0af09435178b3f6de185f06c3a9cbb63")
!1314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1315, file: !1313, line: 730)
!1315 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !1312, file: !1312, line: 191, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1317, file: !1313, line: 731)
!1317 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !1312, file: !1312, line: 194, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1319, file: !1313, line: 732)
!1319 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !1312, file: !1312, line: 197, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1321, file: !1313, line: 733)
!1321 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !1312, file: !1312, line: 200, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1323, file: !1313, line: 734)
!1323 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !1312, file: !1312, line: 203, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1325, file: !1313, line: 735)
!1325 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !1312, file: !1312, line: 206, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1327, file: !1313, line: 736)
!1327 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !1312, file: !1312, line: 209, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1329, file: !1313, line: 737)
!1329 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !1312, file: !1312, line: 212, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1331, file: !1313, line: 738)
!1331 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !1312, file: !1312, line: 215, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1333, file: !1313, line: 739)
!1333 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !1312, file: !1312, line: 218, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1335, file: !1313, line: 740)
!1335 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !1312, file: !1312, line: 221, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1337, file: !1313, line: 741)
!1337 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !1312, file: !1312, line: 233, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1339, file: !1313, line: 742)
!1339 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !1312, file: !1312, line: 242, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1341, file: !1313, line: 743)
!1341 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !1312, file: !1312, line: 251, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1343, file: !1313, line: 744)
!1343 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !1312, file: !1312, line: 254, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1345, file: !1313, line: 745)
!1345 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !1312, file: !1312, line: 257, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1347, file: !1313, line: 746)
!1347 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !1312, file: !1312, line: 260, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1349, file: !1313, line: 747)
!1349 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !1312, file: !1312, line: 263, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1351, file: !1313, line: 748)
!1351 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !1312, file: !1312, line: 269, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1353, file: !1313, line: 749)
!1353 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !1312, file: !1312, line: 272, type: !723, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1355, file: !1313, line: 750)
!1355 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !1312, file: !1312, line: 277, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1357, file: !1313, line: 751)
!1357 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !1312, file: !1312, line: 280, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1359, file: !1313, line: 752)
!1359 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !1312, file: !1312, line: 283, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1361, file: !1313, line: 753)
!1361 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !1312, file: !1312, line: 286, type: !1211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1363, file: !1313, line: 754)
!1363 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !1312, file: !1312, line: 299, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1365, file: !1313, line: 755)
!1365 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !1312, file: !1312, line: 302, type: !753, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1367, file: !1313, line: 756)
!1367 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !1312, file: !1312, line: 341, type: !901, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1369, file: !1313, line: 757)
!1369 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !1312, file: !1312, line: 344, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1371, file: !1313, line: 758)
!1371 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !1312, file: !1312, line: 347, type: !772, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1373, file: !1313, line: 759)
!1373 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !1312, file: !1312, line: 350, type: !772, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1375, file: !1313, line: 760)
!1375 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !1312, file: !1312, line: 353, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1377, file: !1313, line: 761)
!1377 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !1312, file: !1312, line: 356, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1379, file: !1313, line: 762)
!1379 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !1312, file: !1312, line: 359, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1381, file: !1313, line: 763)
!1381 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !1312, file: !1312, line: 365, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1383, file: !1313, line: 764)
!1383 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !1312, file: !1312, line: 368, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1385, file: !1313, line: 765)
!1385 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !1312, file: !1312, line: 371, type: !808, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1387, file: !1313, line: 766)
!1387 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !1312, file: !1312, line: 374, type: !808, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1389, file: !1313, line: 767)
!1389 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !1312, file: !1312, line: 377, type: !1269, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1391, file: !1313, line: 768)
!1391 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !1312, file: !1312, line: 413, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1393, file: !1313, line: 769)
!1393 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !1312, file: !1312, line: 416, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1395, file: !1313, line: 771)
!1395 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !1312, file: !1312, line: 449, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1397, file: !1313, line: 772)
!1397 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !1312, file: !1312, line: 474, type: !681, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1399, file: !1313, line: 773)
!1399 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !1312, file: !1312, line: 479, type: !867, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1401, file: !1313, line: 774)
!1401 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !1312, file: !1312, line: 495, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1403, file: !1313, line: 775)
!1403 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !1312, file: !1312, line: 520, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1405, file: !1313, line: 776)
!1405 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !1312, file: !1312, line: 526, type: !891, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1407, file: !1313, line: 777)
!1407 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !1312, file: !1312, line: 532, type: !901, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1409, file: !1313, line: 778)
!1409 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !1312, file: !1312, line: 560, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1411, file: !1313, line: 779)
!1411 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !1312, file: !1312, line: 563, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1413, file: !1313, line: 780)
!1413 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !1312, file: !1312, line: 569, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1415, file: !1313, line: 781)
!1415 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !1312, file: !1312, line: 572, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1417, file: !1313, line: 782)
!1417 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !1312, file: !1312, line: 575, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1419, file: !1313, line: 783)
!1419 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !1312, file: !1312, line: 578, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1421, file: !1313, line: 784)
!1421 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !1312, file: !1312, line: 581, type: !652, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1423, file: !1438, line: 64)
!1423 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !1424, line: 6, baseType: !1425)
!1424 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!1425 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !1426, line: 21, baseType: !1427)
!1426 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!1427 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1426, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !1428, identifier: "_ZTS11__mbstate_t")
!1428 = !{!1429, !1430}
!1429 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !1427, file: !1426, line: 15, baseType: !291, size: 32)
!1430 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !1427, file: !1426, line: 20, baseType: !1431, size: 32, offset: 32)
!1431 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1427, file: !1426, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !1432, identifier: "_ZTSN11__mbstate_tUt_E")
!1432 = !{!1433, !1434}
!1433 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !1431, file: !1426, line: 18, baseType: !81, size: 32)
!1434 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !1431, file: !1426, line: 19, baseType: !1435, size: 32)
!1435 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 32, elements: !1436)
!1436 = !{!1437}
!1437 = !DISubrange(count: 4)
!1438 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cwchar", directory: "")
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1440, file: !1438, line: 141)
!1440 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !1441, line: 20, baseType: !81)
!1441 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!1442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1443, file: !1438, line: 143)
!1443 = !DISubprogram(name: "btowc", scope: !1444, file: !1444, line: 318, type: !1445, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1444 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "5c0512b032e303d7adfb2a47454ecb1c")
!1445 = !DISubroutineType(types: !1446)
!1446 = !{!1440, !291}
!1447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1448, file: !1438, line: 144)
!1448 = !DISubprogram(name: "fgetwc", scope: !1444, file: !1444, line: 727, type: !1449, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1449 = !DISubroutineType(types: !1450)
!1450 = !{!1440, !1451}
!1451 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1452, size: 64)
!1452 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !1453, line: 5, baseType: !1454)
!1453 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!1454 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !1455, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !1456, identifier: "_ZTS8_IO_FILE")
!1455 = !DIFile(filename: "/usr/include/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "58de959587374b9ee900baa441e1355b")
!1456 = !{!1457, !1458, !1459, !1460, !1461, !1462, !1463, !1464, !1465, !1466, !1467, !1468, !1469, !1472, !1474, !1475, !1476, !1478, !1480, !1482, !1486, !1489, !1491, !1494, !1497, !1498, !1499, !1500, !1501}
!1457 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !1454, file: !1455, line: 51, baseType: !291, size: 32)
!1458 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !1454, file: !1455, line: 54, baseType: !991, size: 64, offset: 64)
!1459 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !1454, file: !1455, line: 55, baseType: !991, size: 64, offset: 128)
!1460 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !1454, file: !1455, line: 56, baseType: !991, size: 64, offset: 192)
!1461 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !1454, file: !1455, line: 57, baseType: !991, size: 64, offset: 256)
!1462 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !1454, file: !1455, line: 58, baseType: !991, size: 64, offset: 320)
!1463 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !1454, file: !1455, line: 59, baseType: !991, size: 64, offset: 384)
!1464 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !1454, file: !1455, line: 60, baseType: !991, size: 64, offset: 448)
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !1454, file: !1455, line: 61, baseType: !991, size: 64, offset: 512)
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !1454, file: !1455, line: 64, baseType: !991, size: 64, offset: 576)
!1467 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !1454, file: !1455, line: 65, baseType: !991, size: 64, offset: 640)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !1454, file: !1455, line: 66, baseType: !991, size: 64, offset: 704)
!1469 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !1454, file: !1455, line: 68, baseType: !1470, size: 64, offset: 768)
!1470 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1471, size: 64)
!1471 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !1455, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!1472 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !1454, file: !1455, line: 70, baseType: !1473, size: 64, offset: 832)
!1473 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1454, size: 64)
!1474 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !1454, file: !1455, line: 72, baseType: !291, size: 32, offset: 896)
!1475 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !1454, file: !1455, line: 73, baseType: !291, size: 32, offset: 928)
!1476 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !1454, file: !1455, line: 74, baseType: !1477, size: 64, offset: 960)
!1477 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !310, line: 150, baseType: !323)
!1478 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !1454, file: !1455, line: 77, baseType: !1479, size: 16, offset: 1024)
!1479 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1480 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !1454, file: !1455, line: 78, baseType: !1481, size: 8, offset: 1040)
!1481 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1482 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !1454, file: !1455, line: 79, baseType: !1483, size: 8, offset: 1048)
!1483 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 8, elements: !1484)
!1484 = !{!1485}
!1485 = !DISubrange(count: 1)
!1486 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !1454, file: !1455, line: 81, baseType: !1487, size: 64, offset: 1088)
!1487 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1488, size: 64)
!1488 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !1455, line: 43, baseType: null)
!1489 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !1454, file: !1455, line: 89, baseType: !1490, size: 64, offset: 1152)
!1490 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !310, line: 151, baseType: !323)
!1491 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !1454, file: !1455, line: 91, baseType: !1492, size: 64, offset: 1216)
!1492 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1493, size: 64)
!1493 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !1455, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!1494 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !1454, file: !1455, line: 92, baseType: !1495, size: 64, offset: 1280)
!1495 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1496, size: 64)
!1496 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !1455, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!1497 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !1454, file: !1455, line: 93, baseType: !1473, size: 64, offset: 1344)
!1498 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !1454, file: !1455, line: 94, baseType: !302, size: 64, offset: 1408)
!1499 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !1454, file: !1455, line: 95, baseType: !941, size: 64, offset: 1472)
!1500 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !1454, file: !1455, line: 96, baseType: !291, size: 32, offset: 1536)
!1501 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !1454, file: !1455, line: 98, baseType: !1502, size: 160, offset: 1568)
!1502 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, elements: !1503)
!1503 = !{!1504}
!1504 = !DISubrange(count: 20)
!1505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1506, file: !1438, line: 145)
!1506 = !DISubprogram(name: "fgetws", scope: !1444, file: !1444, line: 756, type: !1507, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1507 = !DISubroutineType(types: !1508)
!1508 = !{!1013, !1012, !291, !1509}
!1509 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1451)
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1511, file: !1438, line: 146)
!1511 = !DISubprogram(name: "fputwc", scope: !1444, file: !1444, line: 741, type: !1512, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1512 = !DISubroutineType(types: !1513)
!1513 = !{!1440, !1014, !1451}
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1515, file: !1438, line: 147)
!1515 = !DISubprogram(name: "fputws", scope: !1444, file: !1444, line: 763, type: !1516, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1516 = !DISubroutineType(types: !1517)
!1517 = !{!291, !1059, !1509}
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1519, file: !1438, line: 148)
!1519 = !DISubprogram(name: "fwide", scope: !1444, file: !1444, line: 573, type: !1520, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1520 = !DISubroutineType(types: !1521)
!1521 = !{!291, !1451, !291}
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1523, file: !1438, line: 149)
!1523 = !DISubprogram(name: "fwprintf", scope: !1444, file: !1444, line: 580, type: !1524, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!291, !1509, !1059, null}
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1527, file: !1438, line: 150)
!1527 = !DISubprogram(name: "fwscanf", scope: !1444, file: !1444, line: 621, type: !1524, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1529, file: !1438, line: 151)
!1529 = !DISubprogram(name: "getwc", scope: !1444, file: !1444, line: 728, type: !1449, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1531, file: !1438, line: 152)
!1531 = !DISubprogram(name: "getwchar", scope: !1444, file: !1444, line: 734, type: !1532, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1532 = !DISubroutineType(types: !1533)
!1533 = !{!1440}
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1535, file: !1438, line: 153)
!1535 = !DISubprogram(name: "mbrlen", scope: !1444, file: !1444, line: 329, type: !1536, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1536 = !DISubroutineType(types: !1537)
!1537 = !{!941, !1015, !941, !1538}
!1538 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1539)
!1539 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1423, size: 64)
!1540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1541, file: !1438, line: 154)
!1541 = !DISubprogram(name: "mbrtowc", scope: !1444, file: !1444, line: 296, type: !1542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1542 = !DISubroutineType(types: !1543)
!1543 = !{!941, !1012, !1015, !941, !1538}
!1544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1545, file: !1438, line: 155)
!1545 = !DISubprogram(name: "mbsinit", scope: !1444, file: !1444, line: 292, type: !1546, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1546 = !DISubroutineType(types: !1547)
!1547 = !{!291, !1548}
!1548 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1549, size: 64)
!1549 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1423)
!1550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1551, file: !1438, line: 156)
!1551 = !DISubprogram(name: "mbsrtowcs", scope: !1444, file: !1444, line: 337, type: !1552, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1552 = !DISubroutineType(types: !1553)
!1553 = !{!941, !1012, !1554, !941, !1538}
!1554 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1555)
!1555 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !824, size: 64)
!1556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1557, file: !1438, line: 157)
!1557 = !DISubprogram(name: "putwc", scope: !1444, file: !1444, line: 742, type: !1512, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1559, file: !1438, line: 158)
!1559 = !DISubprogram(name: "putwchar", scope: !1444, file: !1444, line: 748, type: !1560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1560 = !DISubroutineType(types: !1561)
!1561 = !{!1440, !1014}
!1562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1563, file: !1438, line: 160)
!1563 = !DISubprogram(name: "swprintf", scope: !1444, file: !1444, line: 590, type: !1564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1564 = !DISubroutineType(types: !1565)
!1565 = !{!291, !1012, !941, !1059, null}
!1566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1567, file: !1438, line: 162)
!1567 = !DISubprogram(name: "swscanf", scope: !1444, file: !1444, line: 631, type: !1568, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1568 = !DISubroutineType(types: !1569)
!1569 = !{!291, !1059, !1059, null}
!1570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1571, file: !1438, line: 163)
!1571 = !DISubprogram(name: "ungetwc", scope: !1444, file: !1444, line: 771, type: !1572, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1572 = !DISubroutineType(types: !1573)
!1573 = !{!1440, !1440, !1451}
!1574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1575, file: !1438, line: 164)
!1575 = !DISubprogram(name: "vfwprintf", scope: !1444, file: !1444, line: 598, type: !1576, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1576 = !DISubroutineType(types: !1577)
!1577 = !{!291, !1509, !1059, !1578}
!1578 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1579, size: 64)
!1579 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !1580, size: 192, flags: DIFlagTypePassByValue, elements: !1581, identifier: "_ZTS13__va_list_tag")
!1580 = !DIFile(filename: "test/clock_test.cpp", directory: "/g/g11/osterhou/repos/scabbard")
!1581 = !{!1582, !1583, !1584, !1585}
!1582 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !1579, file: !1580, baseType: !81, size: 32)
!1583 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !1579, file: !1580, baseType: !81, size: 32, offset: 32)
!1584 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !1579, file: !1580, baseType: !302, size: 64, offset: 64)
!1585 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !1579, file: !1580, baseType: !302, size: 64, offset: 128)
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1587, file: !1438, line: 166)
!1587 = !DISubprogram(name: "vfwscanf", scope: !1444, file: !1444, line: 673, type: !1576, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1589, file: !1438, line: 169)
!1589 = !DISubprogram(name: "vswprintf", scope: !1444, file: !1444, line: 611, type: !1590, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1590 = !DISubroutineType(types: !1591)
!1591 = !{!291, !1012, !941, !1059, !1578}
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1593, file: !1438, line: 172)
!1593 = !DISubprogram(name: "vswscanf", scope: !1444, file: !1444, line: 685, type: !1594, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1594 = !DISubroutineType(types: !1595)
!1595 = !{!291, !1059, !1059, !1578}
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1597, file: !1438, line: 174)
!1597 = !DISubprogram(name: "vwprintf", scope: !1444, file: !1444, line: 606, type: !1598, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1598 = !DISubroutineType(types: !1599)
!1599 = !{!291, !1059, !1578}
!1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1601, file: !1438, line: 176)
!1601 = !DISubprogram(name: "vwscanf", scope: !1444, file: !1444, line: 681, type: !1598, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1603, file: !1438, line: 178)
!1603 = !DISubprogram(name: "wcrtomb", scope: !1444, file: !1444, line: 301, type: !1604, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1604 = !DISubroutineType(types: !1605)
!1605 = !{!941, !1058, !1014, !1538}
!1606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1607, file: !1438, line: 179)
!1607 = !DISubprogram(name: "wcscat", scope: !1444, file: !1444, line: 97, type: !1608, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1608 = !DISubroutineType(types: !1609)
!1609 = !{!1013, !1012, !1059}
!1610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1611, file: !1438, line: 180)
!1611 = !DISubprogram(name: "wcscmp", scope: !1444, file: !1444, line: 106, type: !1612, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1612 = !DISubroutineType(types: !1613)
!1613 = !{!291, !1060, !1060}
!1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1615, file: !1438, line: 181)
!1615 = !DISubprogram(name: "wcscoll", scope: !1444, file: !1444, line: 131, type: !1612, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1617, file: !1438, line: 182)
!1617 = !DISubprogram(name: "wcscpy", scope: !1444, file: !1444, line: 87, type: !1608, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1619, file: !1438, line: 183)
!1619 = !DISubprogram(name: "wcscspn", scope: !1444, file: !1444, line: 187, type: !1620, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1620 = !DISubroutineType(types: !1621)
!1621 = !{!941, !1060, !1060}
!1622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1623, file: !1438, line: 184)
!1623 = !DISubprogram(name: "wcsftime", scope: !1444, file: !1444, line: 835, type: !1624, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1624 = !DISubroutineType(types: !1625)
!1625 = !{!941, !1012, !941, !1059, !1626}
!1626 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1627)
!1627 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1628, size: 64)
!1628 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1629)
!1629 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1444, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1631, file: !1438, line: 185)
!1631 = !DISubprogram(name: "wcslen", scope: !1444, file: !1444, line: 222, type: !1632, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1632 = !DISubroutineType(types: !1633)
!1633 = !{!941, !1060}
!1634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1635, file: !1438, line: 186)
!1635 = !DISubprogram(name: "wcsncat", scope: !1444, file: !1444, line: 101, type: !1636, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1636 = !DISubroutineType(types: !1637)
!1637 = !{!1013, !1012, !1059, !941}
!1638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1639, file: !1438, line: 187)
!1639 = !DISubprogram(name: "wcsncmp", scope: !1444, file: !1444, line: 109, type: !1640, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1640 = !DISubroutineType(types: !1641)
!1641 = !{!291, !1060, !1060, !941}
!1642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1643, file: !1438, line: 188)
!1643 = !DISubprogram(name: "wcsncpy", scope: !1444, file: !1444, line: 92, type: !1636, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1645, file: !1438, line: 189)
!1645 = !DISubprogram(name: "wcsrtombs", scope: !1444, file: !1444, line: 343, type: !1646, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1646 = !DISubroutineType(types: !1647)
!1647 = !{!941, !1058, !1648, !941, !1538}
!1648 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1649)
!1649 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1060, size: 64)
!1650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1651, file: !1438, line: 190)
!1651 = !DISubprogram(name: "wcsspn", scope: !1444, file: !1444, line: 191, type: !1620, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1653, file: !1438, line: 191)
!1653 = !DISubprogram(name: "wcstod", scope: !1444, file: !1444, line: 377, type: !1654, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1654 = !DISubroutineType(types: !1655)
!1655 = !{!588, !1059, !1656}
!1656 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1657)
!1657 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1013, size: 64)
!1658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1659, file: !1438, line: 193)
!1659 = !DISubprogram(name: "wcstof", scope: !1444, file: !1444, line: 382, type: !1660, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1660 = !DISubroutineType(types: !1661)
!1661 = !{!647, !1059, !1656}
!1662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1663, file: !1438, line: 195)
!1663 = !DISubprogram(name: "wcstok", scope: !1444, file: !1444, line: 217, type: !1664, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1664 = !DISubroutineType(types: !1665)
!1665 = !{!1013, !1012, !1059, !1656}
!1666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1667, file: !1438, line: 196)
!1667 = !DISubprogram(name: "wcstol", scope: !1444, file: !1444, line: 428, type: !1668, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1668 = !DISubroutineType(types: !1669)
!1669 = !{!323, !1059, !1656, !291}
!1670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1671, file: !1438, line: 197)
!1671 = !DISubprogram(name: "wcstoul", scope: !1444, file: !1444, line: 433, type: !1672, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1672 = !DISubroutineType(types: !1673)
!1673 = !{!943, !1059, !1656, !291}
!1674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1675, file: !1438, line: 198)
!1675 = !DISubprogram(name: "wcsxfrm", scope: !1444, file: !1444, line: 135, type: !1676, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1676 = !DISubroutineType(types: !1677)
!1677 = !{!941, !1012, !1059, !941}
!1678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1679, file: !1438, line: 199)
!1679 = !DISubprogram(name: "wctob", scope: !1444, file: !1444, line: 324, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1680 = !DISubroutineType(types: !1681)
!1681 = !{!291, !1440}
!1682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1683, file: !1438, line: 200)
!1683 = !DISubprogram(name: "wmemcmp", scope: !1444, file: !1444, line: 258, type: !1640, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1685, file: !1438, line: 201)
!1685 = !DISubprogram(name: "wmemcpy", scope: !1444, file: !1444, line: 262, type: !1636, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1687, file: !1438, line: 202)
!1687 = !DISubprogram(name: "wmemmove", scope: !1444, file: !1444, line: 267, type: !1688, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1688 = !DISubroutineType(types: !1689)
!1689 = !{!1013, !1013, !1060, !941}
!1690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1691, file: !1438, line: 203)
!1691 = !DISubprogram(name: "wmemset", scope: !1444, file: !1444, line: 271, type: !1692, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1692 = !DISubroutineType(types: !1693)
!1693 = !{!1013, !1013, !1014, !941}
!1694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1695, file: !1438, line: 204)
!1695 = !DISubprogram(name: "wprintf", scope: !1444, file: !1444, line: 587, type: !1696, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1696 = !DISubroutineType(types: !1697)
!1697 = !{!291, !1059, null}
!1698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1699, file: !1438, line: 205)
!1699 = !DISubprogram(name: "wscanf", scope: !1444, file: !1444, line: 628, type: !1696, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1701, file: !1438, line: 206)
!1701 = !DISubprogram(name: "wcschr", scope: !1444, file: !1444, line: 164, type: !1702, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1702 = !DISubroutineType(types: !1703)
!1703 = !{!1013, !1060, !1014}
!1704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1705, file: !1438, line: 207)
!1705 = !DISubprogram(name: "wcspbrk", scope: !1444, file: !1444, line: 201, type: !1706, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1706 = !DISubroutineType(types: !1707)
!1707 = !{!1013, !1060, !1060}
!1708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1709, file: !1438, line: 208)
!1709 = !DISubprogram(name: "wcsrchr", scope: !1444, file: !1444, line: 174, type: !1702, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1711, file: !1438, line: 209)
!1711 = !DISubprogram(name: "wcsstr", scope: !1444, file: !1444, line: 212, type: !1706, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1713, file: !1438, line: 210)
!1713 = !DISubprogram(name: "wmemchr", scope: !1444, file: !1444, line: 253, type: !1714, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1714 = !DISubroutineType(types: !1715)
!1715 = !{!1013, !1060, !1014, !941}
!1716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1717, file: !1438, line: 251)
!1717 = !DISubprogram(name: "wcstold", scope: !1444, file: !1444, line: 384, type: !1718, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1718 = !DISubroutineType(types: !1719)
!1719 = !{!658, !1059, !1656}
!1720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1721, file: !1438, line: 260)
!1721 = !DISubprogram(name: "wcstoll", scope: !1444, file: !1444, line: 441, type: !1722, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1722 = !DISubroutineType(types: !1723)
!1723 = !{!769, !1059, !1656, !291}
!1724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !1725, file: !1438, line: 261)
!1725 = !DISubprogram(name: "wcstoull", scope: !1444, file: !1444, line: 448, type: !1726, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1726 = !DISubroutineType(types: !1727)
!1727 = !{!1094, !1059, !1656, !291}
!1728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1717, file: !1438, line: 267)
!1729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1721, file: !1438, line: 268)
!1730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1725, file: !1438, line: 269)
!1731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1659, file: !1438, line: 283)
!1732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1587, file: !1438, line: 286)
!1733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1593, file: !1438, line: 289)
!1734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1601, file: !1438, line: 292)
!1735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1717, file: !1438, line: 296)
!1736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1721, file: !1438, line: 297)
!1737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1725, file: !1438, line: 298)
!1738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1739, file: !1741, line: 47)
!1739 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !321, line: 24, baseType: !1740)
!1740 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !310, line: 36, baseType: !1481)
!1741 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdint", directory: "")
!1742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1743, file: !1741, line: 48)
!1743 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !321, line: 25, baseType: !1744)
!1744 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !310, line: 38, baseType: !1745)
!1745 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1747, file: !1741, line: 49)
!1747 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !321, line: 26, baseType: !1748)
!1748 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !310, line: 40, baseType: !291)
!1749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !320, file: !1741, line: 50)
!1750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1751, file: !1741, line: 52)
!1751 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !344, line: 58, baseType: !1481)
!1752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1753, file: !1741, line: 53)
!1753 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !344, line: 60, baseType: !323)
!1754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1755, file: !1741, line: 54)
!1755 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !344, line: 61, baseType: !323)
!1756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1757, file: !1741, line: 55)
!1757 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !344, line: 62, baseType: !323)
!1758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1759, file: !1741, line: 57)
!1759 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !344, line: 43, baseType: !1760)
!1760 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !310, line: 51, baseType: !1740)
!1761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1762, file: !1741, line: 58)
!1762 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !344, line: 44, baseType: !1763)
!1763 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !310, line: 53, baseType: !1744)
!1764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1765, file: !1741, line: 59)
!1765 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !344, line: 45, baseType: !1766)
!1766 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !310, line: 55, baseType: !1748)
!1767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1768, file: !1741, line: 60)
!1768 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !344, line: 46, baseType: !1769)
!1769 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !310, line: 57, baseType: !322)
!1770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !343, file: !1741, line: 62)
!1771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1772, file: !1741, line: 63)
!1772 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !344, line: 87, baseType: !323)
!1773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1774, file: !1741, line: 65)
!1774 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !308, line: 24, baseType: !1775)
!1775 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !310, line: 37, baseType: !516)
!1776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1777, file: !1741, line: 66)
!1777 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !308, line: 25, baseType: !1778)
!1778 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !310, line: 39, baseType: !1479)
!1779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !307, file: !1741, line: 67)
!1780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1781, file: !1741, line: 68)
!1781 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !308, line: 27, baseType: !1782)
!1782 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !310, line: 44, baseType: !943)
!1783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1784, file: !1741, line: 70)
!1784 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !344, line: 71, baseType: !516)
!1785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1786, file: !1741, line: 71)
!1786 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !344, line: 73, baseType: !943)
!1787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1788, file: !1741, line: 72)
!1788 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !344, line: 74, baseType: !943)
!1789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1790, file: !1741, line: 73)
!1790 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !344, line: 75, baseType: !943)
!1791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1792, file: !1741, line: 75)
!1792 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !344, line: 49, baseType: !1793)
!1793 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !310, line: 52, baseType: !1775)
!1794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1795, file: !1741, line: 76)
!1795 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !344, line: 50, baseType: !1796)
!1796 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !310, line: 54, baseType: !1778)
!1797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1798, file: !1741, line: 77)
!1798 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !344, line: 51, baseType: !1799)
!1799 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !310, line: 56, baseType: !309)
!1800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1801, file: !1741, line: 78)
!1801 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !344, line: 52, baseType: !1802)
!1802 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !310, line: 58, baseType: !1782)
!1803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1804, file: !1741, line: 80)
!1804 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !344, line: 102, baseType: !1805)
!1805 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !310, line: 72, baseType: !943)
!1806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1807, file: !1741, line: 81)
!1807 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !344, line: 90, baseType: !943)
!1808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1809, file: !1811, line: 53)
!1809 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1810, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1810 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "0595275e3f5b502d28f7cd61a0dff888")
!1811 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/clocale", directory: "")
!1812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1813, file: !1811, line: 54)
!1813 = !DISubprogram(name: "setlocale", scope: !1810, file: !1810, line: 122, type: !1814, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1814 = !DISubroutineType(types: !1815)
!1815 = !{!991, !291, !824}
!1816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1817, file: !1811, line: 55)
!1817 = !DISubprogram(name: "localeconv", scope: !1810, file: !1810, line: 125, type: !1818, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1818 = !DISubroutineType(types: !1819)
!1819 = !{!1820}
!1820 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1809, size: 64)
!1821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1822, file: !1824, line: 64)
!1822 = !DISubprogram(name: "isalnum", scope: !1823, file: !1823, line: 108, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1823 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "c67c809b09ef8ea9c273687bc20a7fd3")
!1824 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cctype", directory: "")
!1825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1826, file: !1824, line: 65)
!1826 = !DISubprogram(name: "isalpha", scope: !1823, file: !1823, line: 109, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1828, file: !1824, line: 66)
!1828 = !DISubprogram(name: "iscntrl", scope: !1823, file: !1823, line: 110, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1830, file: !1824, line: 67)
!1830 = !DISubprogram(name: "isdigit", scope: !1823, file: !1823, line: 111, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1832, file: !1824, line: 68)
!1832 = !DISubprogram(name: "isgraph", scope: !1823, file: !1823, line: 113, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1834, file: !1824, line: 69)
!1834 = !DISubprogram(name: "islower", scope: !1823, file: !1823, line: 112, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1836, file: !1824, line: 70)
!1836 = !DISubprogram(name: "isprint", scope: !1823, file: !1823, line: 114, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1838, file: !1824, line: 71)
!1838 = !DISubprogram(name: "ispunct", scope: !1823, file: !1823, line: 115, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1840, file: !1824, line: 72)
!1840 = !DISubprogram(name: "isspace", scope: !1823, file: !1823, line: 116, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1842, file: !1824, line: 73)
!1842 = !DISubprogram(name: "isupper", scope: !1823, file: !1823, line: 117, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1844, file: !1824, line: 74)
!1844 = !DISubprogram(name: "isxdigit", scope: !1823, file: !1823, line: 118, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1846, file: !1824, line: 75)
!1846 = !DISubprogram(name: "tolower", scope: !1823, file: !1823, line: 122, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1848, file: !1824, line: 76)
!1848 = !DISubprogram(name: "toupper", scope: !1823, file: !1823, line: 125, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1850, file: !1824, line: 87)
!1850 = !DISubprogram(name: "isblank", scope: !1823, file: !1823, line: 130, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1852, file: !1854, line: 98)
!1852 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1853, line: 7, baseType: !1454)
!1853 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1854 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstdio", directory: "")
!1855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1856, file: !1854, line: 99)
!1856 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1857, line: 84, baseType: !1858)
!1857 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "75d393d9743f4e6c39653f794c599a10")
!1858 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1859, line: 14, baseType: !1860)
!1859 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1860 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1859, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1862, file: !1854, line: 101)
!1862 = !DISubprogram(name: "clearerr", scope: !1857, file: !1857, line: 763, type: !1863, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1863 = !DISubroutineType(types: !1864)
!1864 = !{null, !1865}
!1865 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1852, size: 64)
!1866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1867, file: !1854, line: 102)
!1867 = !DISubprogram(name: "fclose", scope: !1857, file: !1857, line: 213, type: !1868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1868 = !DISubroutineType(types: !1869)
!1869 = !{!291, !1865}
!1870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1871, file: !1854, line: 103)
!1871 = !DISubprogram(name: "feof", scope: !1857, file: !1857, line: 765, type: !1868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1873, file: !1854, line: 104)
!1873 = !DISubprogram(name: "ferror", scope: !1857, file: !1857, line: 767, type: !1868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1875, file: !1854, line: 105)
!1875 = !DISubprogram(name: "fflush", scope: !1857, file: !1857, line: 218, type: !1868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1877, file: !1854, line: 106)
!1877 = !DISubprogram(name: "fgetc", scope: !1857, file: !1857, line: 491, type: !1868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1879, file: !1854, line: 107)
!1879 = !DISubprogram(name: "fgetpos", scope: !1857, file: !1857, line: 737, type: !1880, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1880 = !DISubroutineType(types: !1881)
!1881 = !{!291, !1882, !1883}
!1882 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1865)
!1883 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1884)
!1884 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1856, size: 64)
!1885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1886, file: !1854, line: 108)
!1886 = !DISubprogram(name: "fgets", scope: !1857, file: !1857, line: 570, type: !1887, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1887 = !DISubroutineType(types: !1888)
!1888 = !{!991, !1058, !291, !1882}
!1889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1890, file: !1854, line: 109)
!1890 = !DISubprogram(name: "fopen", scope: !1857, file: !1857, line: 246, type: !1891, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1891 = !DISubroutineType(types: !1892)
!1892 = !{!1865, !1015, !1015}
!1893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1894, file: !1854, line: 110)
!1894 = !DISubprogram(name: "fprintf", scope: !1857, file: !1857, line: 326, type: !1895, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1895 = !DISubroutineType(types: !1896)
!1896 = !{!291, !1882, !1015, null}
!1897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1898, file: !1854, line: 111)
!1898 = !DISubprogram(name: "fputc", scope: !1857, file: !1857, line: 527, type: !1899, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1899 = !DISubroutineType(types: !1900)
!1900 = !{!291, !291, !1865}
!1901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1902, file: !1854, line: 112)
!1902 = !DISubprogram(name: "fputs", scope: !1857, file: !1857, line: 632, type: !1903, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1903 = !DISubroutineType(types: !1904)
!1904 = !{!291, !1015, !1882}
!1905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1906, file: !1854, line: 113)
!1906 = !DISubprogram(name: "fread", scope: !1857, file: !1857, line: 652, type: !1907, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1907 = !DISubroutineType(types: !1908)
!1908 = !{!941, !1909, !941, !941, !1882}
!1909 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !302)
!1910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1911, file: !1854, line: 114)
!1911 = !DISubprogram(name: "freopen", scope: !1857, file: !1857, line: 252, type: !1912, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1912 = !DISubroutineType(types: !1913)
!1913 = !{!1865, !1015, !1015, !1882}
!1914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1915, file: !1854, line: 115)
!1915 = !DISubprogram(name: "fscanf", scope: !1857, file: !1857, line: 391, type: !1895, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1917, file: !1854, line: 116)
!1917 = !DISubprogram(name: "fseek", scope: !1857, file: !1857, line: 690, type: !1918, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1918 = !DISubroutineType(types: !1919)
!1919 = !{!291, !1865, !323, !291}
!1920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1921, file: !1854, line: 117)
!1921 = !DISubprogram(name: "fsetpos", scope: !1857, file: !1857, line: 742, type: !1922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1922 = !DISubroutineType(types: !1923)
!1923 = !{!291, !1865, !1924}
!1924 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1925, size: 64)
!1925 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1856)
!1926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1927, file: !1854, line: 118)
!1927 = !DISubprogram(name: "ftell", scope: !1857, file: !1857, line: 695, type: !1928, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1928 = !DISubroutineType(types: !1929)
!1929 = !{!323, !1865}
!1930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1931, file: !1854, line: 119)
!1931 = !DISubprogram(name: "fwrite", scope: !1857, file: !1857, line: 658, type: !1932, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1932 = !DISubroutineType(types: !1933)
!1933 = !{!941, !1934, !941, !941, !1882}
!1934 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !967)
!1935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1936, file: !1854, line: 120)
!1936 = !DISubprogram(name: "getc", scope: !1857, file: !1857, line: 492, type: !1868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1938, file: !1854, line: 121)
!1938 = !DISubprogram(name: "getchar", scope: !1939, file: !1939, line: 47, type: !1028, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1939 = !DIFile(filename: "/usr/include/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "81194b3c12a36527b791b06f928a2e25")
!1940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1941, file: !1854, line: 126)
!1941 = !DISubprogram(name: "perror", scope: !1857, file: !1857, line: 781, type: !1942, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1942 = !DISubroutineType(types: !1943)
!1943 = !{null, !824}
!1944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1945, file: !1854, line: 127)
!1945 = !DISubprogram(name: "printf", scope: !1857, file: !1857, line: 332, type: !1946, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1946 = !DISubroutineType(types: !1947)
!1947 = !{!291, !1015, null}
!1948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1949, file: !1854, line: 128)
!1949 = !DISubprogram(name: "putc", scope: !1857, file: !1857, line: 528, type: !1899, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1951, file: !1854, line: 129)
!1951 = !DISubprogram(name: "putchar", scope: !1939, file: !1939, line: 82, type: !580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1953, file: !1854, line: 130)
!1953 = !DISubprogram(name: "puts", scope: !1857, file: !1857, line: 638, type: !956, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1955, file: !1854, line: 131)
!1955 = !DISubprogram(name: "remove", scope: !1857, file: !1857, line: 146, type: !956, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1957, file: !1854, line: 132)
!1957 = !DISubprogram(name: "rename", scope: !1857, file: !1857, line: 148, type: !1958, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1958 = !DISubroutineType(types: !1959)
!1959 = !{!291, !824, !824}
!1960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1961, file: !1854, line: 133)
!1961 = !DISubprogram(name: "rewind", scope: !1857, file: !1857, line: 700, type: !1863, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1963, file: !1854, line: 134)
!1963 = !DISubprogram(name: "scanf", scope: !1857, file: !1857, line: 397, type: !1946, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1964 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1965, file: !1854, line: 135)
!1965 = !DISubprogram(name: "setbuf", scope: !1857, file: !1857, line: 304, type: !1966, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1966 = !DISubroutineType(types: !1967)
!1967 = !{null, !1882, !1058}
!1968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1969, file: !1854, line: 136)
!1969 = !DISubprogram(name: "setvbuf", scope: !1857, file: !1857, line: 308, type: !1970, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1970 = !DISubroutineType(types: !1971)
!1971 = !{!291, !1882, !1058, !291, !941}
!1972 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1973, file: !1854, line: 137)
!1973 = !DISubprogram(name: "sprintf", scope: !1857, file: !1857, line: 334, type: !1974, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1974 = !DISubroutineType(types: !1975)
!1975 = !{!291, !1058, !1015, null}
!1976 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1977, file: !1854, line: 138)
!1977 = !DISubprogram(name: "sscanf", scope: !1857, file: !1857, line: 399, type: !1978, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1978 = !DISubroutineType(types: !1979)
!1979 = !{!291, !1015, !1015, null}
!1980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1981, file: !1854, line: 139)
!1981 = !DISubprogram(name: "tmpfile", scope: !1857, file: !1857, line: 173, type: !1982, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1982 = !DISubroutineType(types: !1983)
!1983 = !{!1865}
!1984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1985, file: !1854, line: 141)
!1985 = !DISubprogram(name: "tmpnam", scope: !1857, file: !1857, line: 187, type: !1986, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1986 = !DISubroutineType(types: !1987)
!1987 = !{!991, !991}
!1988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1989, file: !1854, line: 143)
!1989 = !DISubprogram(name: "ungetc", scope: !1857, file: !1857, line: 645, type: !1899, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1991, file: !1854, line: 144)
!1991 = !DISubprogram(name: "vfprintf", scope: !1857, file: !1857, line: 341, type: !1992, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1992 = !DISubroutineType(types: !1993)
!1993 = !{!291, !1882, !1015, !1578}
!1994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1995, file: !1854, line: 145)
!1995 = !DISubprogram(name: "vprintf", scope: !1939, file: !1939, line: 39, type: !1996, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1996 = !DISubroutineType(types: !1997)
!1997 = !{!291, !1015, !1578}
!1998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1999, file: !1854, line: 146)
!1999 = !DISubprogram(name: "vsprintf", scope: !1857, file: !1857, line: 349, type: !2000, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2000 = !DISubroutineType(types: !2001)
!2001 = !{!291, !1058, !1015, !1578}
!2002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !2003, file: !1854, line: 175)
!2003 = !DISubprogram(name: "snprintf", scope: !1857, file: !1857, line: 354, type: !2004, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2004 = !DISubroutineType(types: !2005)
!2005 = !{!291, !1058, !941, !1015, null}
!2006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !2007, file: !1854, line: 176)
!2007 = !DISubprogram(name: "vfscanf", scope: !1857, file: !1857, line: 434, type: !1992, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !2009, file: !1854, line: 177)
!2009 = !DISubprogram(name: "vscanf", scope: !1857, file: !1857, line: 442, type: !1996, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !2011, file: !1854, line: 178)
!2011 = !DISubprogram(name: "vsnprintf", scope: !1857, file: !1857, line: 358, type: !2012, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2012 = !DISubroutineType(types: !2013)
!2013 = !{!291, !1058, !941, !1015, !1578}
!2014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !80, entity: !2015, file: !1854, line: 179)
!2015 = !DISubprogram(name: "vsscanf", scope: !1857, file: !1857, line: 446, type: !2016, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2016 = !DISubroutineType(types: !2017)
!2017 = !{!291, !1015, !1015, !1578}
!2018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2003, file: !1854, line: 185)
!2019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2007, file: !1854, line: 186)
!2020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2009, file: !1854, line: 187)
!2021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2011, file: !1854, line: 188)
!2022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2015, file: !1854, line: 189)
!2023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2024, file: !2028, line: 82)
!2024 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !2025, line: 48, baseType: !2026)
!2025 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "760693b7fbeea3d686e1f29058fc2257")
!2026 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2027, size: 64)
!2027 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1748)
!2028 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cwctype", directory: "")
!2029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2030, file: !2028, line: 83)
!2030 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !2031, line: 38, baseType: !943)
!2031 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "45eef9c3aa1d99faffa3945ed9be039a")
!2032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1440, file: !2028, line: 84)
!2033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2034, file: !2028, line: 86)
!2034 = !DISubprogram(name: "iswalnum", scope: !2031, file: !2031, line: 95, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2036, file: !2028, line: 87)
!2036 = !DISubprogram(name: "iswalpha", scope: !2031, file: !2031, line: 101, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2038, file: !2028, line: 89)
!2038 = !DISubprogram(name: "iswblank", scope: !2031, file: !2031, line: 146, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2040, file: !2028, line: 91)
!2040 = !DISubprogram(name: "iswcntrl", scope: !2031, file: !2031, line: 104, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2042, file: !2028, line: 92)
!2042 = !DISubprogram(name: "iswctype", scope: !2031, file: !2031, line: 159, type: !2043, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2043 = !DISubroutineType(types: !2044)
!2044 = !{!291, !1440, !2030}
!2045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2046, file: !2028, line: 93)
!2046 = !DISubprogram(name: "iswdigit", scope: !2031, file: !2031, line: 108, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2048, file: !2028, line: 94)
!2048 = !DISubprogram(name: "iswgraph", scope: !2031, file: !2031, line: 112, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2050, file: !2028, line: 95)
!2050 = !DISubprogram(name: "iswlower", scope: !2031, file: !2031, line: 117, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2052, file: !2028, line: 96)
!2052 = !DISubprogram(name: "iswprint", scope: !2031, file: !2031, line: 120, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2054, file: !2028, line: 97)
!2054 = !DISubprogram(name: "iswpunct", scope: !2031, file: !2031, line: 125, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2056, file: !2028, line: 98)
!2056 = !DISubprogram(name: "iswspace", scope: !2031, file: !2031, line: 130, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2058, file: !2028, line: 99)
!2058 = !DISubprogram(name: "iswupper", scope: !2031, file: !2031, line: 135, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2060, file: !2028, line: 100)
!2060 = !DISubprogram(name: "iswxdigit", scope: !2031, file: !2031, line: 140, type: !1680, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2062, file: !2028, line: 101)
!2062 = !DISubprogram(name: "towctrans", scope: !2025, file: !2025, line: 55, type: !2063, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2063 = !DISubroutineType(types: !2064)
!2064 = !{!1440, !1440, !2024}
!2065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2066, file: !2028, line: 102)
!2066 = !DISubprogram(name: "towlower", scope: !2031, file: !2031, line: 166, type: !2067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2067 = !DISubroutineType(types: !2068)
!2068 = !{!1440, !1440}
!2069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2070, file: !2028, line: 103)
!2070 = !DISubprogram(name: "towupper", scope: !2031, file: !2031, line: 169, type: !2067, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2072, file: !2028, line: 104)
!2072 = !DISubprogram(name: "wctrans", scope: !2025, file: !2025, line: 52, type: !2073, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2073 = !DISubroutineType(types: !2074)
!2074 = !{!2024, !824}
!2075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2076, file: !2028, line: 105)
!2076 = !DISubprogram(name: "wctype", scope: !2031, file: !2031, line: 155, type: !2077, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2077 = !DISubroutineType(types: !2078)
!2078 = !{!2030, !824}
!2079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2080, file: !2083, line: 60)
!2080 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !2081, line: 7, baseType: !2082)
!2081 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!2082 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !310, line: 154, baseType: !323)
!2083 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ctime", directory: "")
!2084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !559, file: !2083, line: 61)
!2085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1629, file: !2083, line: 62)
!2086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2087, file: !2083, line: 64)
!2087 = !DISubprogram(name: "clock", scope: !2088, file: !2088, line: 72, type: !2089, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2088 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b21b4c7d8bf3fafdb33a1c7ed8e024a")
!2089 = !DISubroutineType(types: !2090)
!2090 = !{!2080}
!2091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2092, file: !2083, line: 65)
!2092 = !DISubprogram(name: "difftime", scope: !2088, file: !2088, line: 78, type: !2093, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2093 = !DISubroutineType(types: !2094)
!2094 = !{!588, !559, !559}
!2095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2096, file: !2083, line: 66)
!2096 = !DISubprogram(name: "mktime", scope: !2088, file: !2088, line: 82, type: !2097, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2097 = !DISubroutineType(types: !2098)
!2098 = !{!559, !2099}
!2099 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1629, size: 64)
!2100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2101, file: !2083, line: 67)
!2101 = !DISubprogram(name: "time", scope: !2088, file: !2088, line: 75, type: !2102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2102 = !DISubroutineType(types: !2103)
!2103 = !{!559, !2104}
!2104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !559, size: 64)
!2105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2106, file: !2083, line: 68)
!2106 = !DISubprogram(name: "asctime", scope: !2088, file: !2088, line: 139, type: !2107, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2107 = !DISubroutineType(types: !2108)
!2108 = !{!991, !1627}
!2109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2110, file: !2083, line: 69)
!2110 = !DISubprogram(name: "ctime", scope: !2088, file: !2088, line: 142, type: !2111, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2111 = !DISubroutineType(types: !2112)
!2112 = !{!991, !2113}
!2113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2114, size: 64)
!2114 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !559)
!2115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2116, file: !2083, line: 70)
!2116 = !DISubprogram(name: "gmtime", scope: !2088, file: !2088, line: 119, type: !2117, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2117 = !DISubroutineType(types: !2118)
!2118 = !{!2099, !2113}
!2119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2120, file: !2083, line: 71)
!2120 = !DISubprogram(name: "localtime", scope: !2088, file: !2088, line: 123, type: !2117, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2122, file: !2083, line: 72)
!2122 = !DISubprogram(name: "strftime", scope: !2088, file: !2088, line: 88, type: !2123, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2123 = !DISubroutineType(types: !2124)
!2124 = !{!941, !1058, !941, !1015, !1626}
!2125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2126, file: !2083, line: 79)
!2126 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !2127, line: 9, size: 128, flags: DIFlagTypePassByValue, elements: !2128, identifier: "_ZTS8timespec")
!2127 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "7074babe5447b53c4390dc147eee8679")
!2128 = !{!2129, !2130}
!2129 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !2126, file: !2127, line: 11, baseType: !561, size: 64)
!2130 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !2126, file: !2127, line: 12, baseType: !2131, size: 64, offset: 64)
!2131 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !310, line: 194, baseType: !323)
!2132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2133, file: !2083, line: 80)
!2133 = !DISubprogram(name: "timespec_get", scope: !2088, file: !2088, line: 263, type: !2134, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2134 = !DISubroutineType(types: !2135)
!2135 = !{!291, !2136, !291}
!2136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2126, size: 64)
!2137 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !335, entity: !2138, file: !334, line: 1250)
!2138 = !DINamespace(name: "chrono_literals", scope: !2139, exportSymbols: true)
!2139 = !DINamespace(name: "literals", scope: !2, exportSymbols: true)
!2140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2141, file: !2145, line: 77)
!2141 = !DISubprogram(name: "memchr", scope: !2142, file: !2142, line: 84, type: !2143, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2142 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "cc7eed1dc136352012a229a96542ae3d")
!2143 = !DISubroutineType(types: !2144)
!2144 = !{!967, !967, !291, !941}
!2145 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/cstring", directory: "")
!2146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2147, file: !2145, line: 78)
!2147 = !DISubprogram(name: "memcmp", scope: !2142, file: !2142, line: 64, type: !2148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2148 = !DISubroutineType(types: !2149)
!2149 = !{!291, !967, !967, !941}
!2150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2151, file: !2145, line: 79)
!2151 = !DISubprogram(name: "memcpy", scope: !2142, file: !2142, line: 43, type: !2152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2152 = !DISubroutineType(types: !2153)
!2153 = !{!302, !1909, !1934, !941}
!2154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2155, file: !2145, line: 80)
!2155 = !DISubprogram(name: "memmove", scope: !2142, file: !2142, line: 47, type: !2156, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2156 = !DISubroutineType(types: !2157)
!2157 = !{!302, !302, !967, !941}
!2158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2159, file: !2145, line: 81)
!2159 = !DISubprogram(name: "memset", scope: !2142, file: !2142, line: 61, type: !2160, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2160 = !DISubroutineType(types: !2161)
!2161 = !{!302, !302, !291, !941}
!2162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2163, file: !2145, line: 82)
!2163 = !DISubprogram(name: "strcat", scope: !2142, file: !2142, line: 130, type: !2164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2164 = !DISubroutineType(types: !2165)
!2165 = !{!991, !1058, !1015}
!2166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2167, file: !2145, line: 83)
!2167 = !DISubprogram(name: "strcmp", scope: !2142, file: !2142, line: 137, type: !1958, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2169, file: !2145, line: 84)
!2169 = !DISubprogram(name: "strcoll", scope: !2142, file: !2142, line: 144, type: !1958, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2171, file: !2145, line: 85)
!2171 = !DISubprogram(name: "strcpy", scope: !2142, file: !2142, line: 122, type: !2164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2173, file: !2145, line: 86)
!2173 = !DISubprogram(name: "strcspn", scope: !2142, file: !2142, line: 273, type: !2174, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2174 = !DISubroutineType(types: !2175)
!2175 = !{!941, !824, !824}
!2176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2177, file: !2145, line: 87)
!2177 = !DISubprogram(name: "strerror", scope: !2142, file: !2142, line: 397, type: !2178, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2178 = !DISubroutineType(types: !2179)
!2179 = !{!991, !291}
!2180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2181, file: !2145, line: 88)
!2181 = !DISubprogram(name: "strlen", scope: !2142, file: !2142, line: 385, type: !2182, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2182 = !DISubroutineType(types: !2183)
!2183 = !{!941, !824}
!2184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2185, file: !2145, line: 89)
!2185 = !DISubprogram(name: "strncat", scope: !2142, file: !2142, line: 133, type: !2186, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2186 = !DISubroutineType(types: !2187)
!2187 = !{!991, !1058, !1015, !941}
!2188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2189, file: !2145, line: 90)
!2189 = !DISubprogram(name: "strncmp", scope: !2142, file: !2142, line: 140, type: !2190, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2190 = !DISubroutineType(types: !2191)
!2191 = !{!291, !824, !824, !941}
!2192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2193, file: !2145, line: 91)
!2193 = !DISubprogram(name: "strncpy", scope: !2142, file: !2142, line: 125, type: !2186, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2195, file: !2145, line: 92)
!2195 = !DISubprogram(name: "strspn", scope: !2142, file: !2142, line: 277, type: !2174, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2197, file: !2145, line: 93)
!2197 = !DISubprogram(name: "strtok", scope: !2142, file: !2142, line: 336, type: !2164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2199, file: !2145, line: 94)
!2199 = !DISubprogram(name: "strxfrm", scope: !2142, file: !2142, line: 147, type: !2200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2200 = !DISubroutineType(types: !2201)
!2201 = !{!941, !1058, !1015, !941}
!2202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2203, file: !2145, line: 95)
!2203 = !DISubprogram(name: "strchr", scope: !2142, file: !2142, line: 219, type: !2204, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2204 = !DISubroutineType(types: !2205)
!2205 = !{!824, !824, !291}
!2206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2207, file: !2145, line: 96)
!2207 = !DISubprogram(name: "strpbrk", scope: !2142, file: !2142, line: 296, type: !2208, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2208 = !DISubroutineType(types: !2209)
!2209 = !{!824, !824, !824}
!2210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2211, file: !2145, line: 97)
!2211 = !DISubprogram(name: "strrchr", scope: !2142, file: !2142, line: 246, type: !2204, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2213, file: !2145, line: 98)
!2213 = !DISubprogram(name: "strstr", scope: !2142, file: !2142, line: 323, type: !2208, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !78, file: !2215, line: 89)
!2215 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/shared_ptr_base.h", directory: "", checksumkind: CSK_MD5, checksum: "a9031cc66fad8948937b85efd4835986")
!2216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2217, file: !2215, line: 90)
!2217 = !DIGlobalVariable(name: "__default_lock_policy", linkageName: "_ZN9__gnu_cxxL21__default_lock_policyE", scope: !80, file: !79, line: 53, type: !2218, isLocal: true, isDefinition: false)
!2218 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !78)
!2219 = !{i32 7, !"Dwarf Version", i32 5}
!2220 = !{i32 2, !"Debug Info Version", i32 3}
!2221 = !{i32 1, !"wchar_size", i32 4}
!2222 = !{i32 7, !"uwtable", i32 2}
!2223 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}
!2224 = distinct !DISubprogram(name: "__HIP_CHECK__", linkageName: "_Z13__HIP_CHECK__10hipError_t", scope: !9, file: !9, line: 18, type: !2225, scopeLine: 18, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, retainedNodes: !2228)
!2225 = !DISubroutineType(types: !2226)
!2226 = !{null, !2227}
!2227 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipError_t", file: !87, line: 320, baseType: !86)
!2228 = !{!2229}
!2229 = !DILocalVariable(name: "resCode", arg: 1, scope: !2224, file: !9, line: 18, type: !2227)
!2230 = !DILocation(line: 0, scope: !2224)
!2231 = !DILocation(line: 19, column: 15, scope: !2232)
!2232 = distinct !DILexicalBlock(scope: !2224, file: !9, line: 19, column: 7)
!2233 = !DILocation(line: 19, column: 7, scope: !2224)
!2234 = !DILocation(line: 20, column: 15, scope: !2235)
!2235 = distinct !DILexicalBlock(scope: !2232, file: !9, line: 19, column: 30)
!2236 = !DILocation(line: 20, column: 34, scope: !2235)
!2237 = !DILocalVariable(name: "this", arg: 1, scope: !2238, type: !2253, flags: DIFlagArtificial | DIFlagObjectPointer)
!2238 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !2240, file: !2239, line: 108, type: !2242, scopeLine: 109, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, declaration: !2250, retainedNodes: !2251)
!2239 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/ostream", directory: "")
!2240 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ostream<char, std::char_traits<char> >", scope: !2, file: !2241, line: 359, size: 2176, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!2241 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/ostream.tcc", directory: "")
!2242 = !DISubroutineType(types: !2243)
!2243 = !{!2244, !2246, !2247}
!2244 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2245, size: 64)
!2245 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ostream_type", scope: !2240, file: !2239, line: 71, baseType: !2240)
!2246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2240, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2248, size: 64)
!2248 = !DISubroutineType(types: !2249)
!2249 = !{!2244, !2244}
!2250 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !2240, file: !2239, line: 108, type: !2242, scopeLine: 108, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2251 = !{!2237, !2252}
!2252 = !DILocalVariable(name: "__pf", arg: 2, scope: !2238, file: !2239, line: 108, type: !2247)
!2253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2240, size: 64)
!2254 = !DILocation(line: 0, scope: !2238, inlinedAt: !2255)
!2255 = distinct !DILocation(line: 20, column: 45, scope: !2235)
!2256 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2255)
!2257 = !DILocation(line: 21, column: 5, scope: !2235)
!2258 = !DILocation(line: 23, column: 1, scope: !2224)
!2259 = !{!2260, !2260, i64 0}
!2260 = !{!"any pointer", !2261, i64 0}
!2261 = !{!"omnipotent char", !2262, i64 0}
!2262 = !{!"Simple C++ TBAA"}
!2263 = distinct !DISubprogram(name: "hip_increment", linkageName: "_Z13hip_incrementPiS_m", scope: !9, file: !9, line: 61, type: !2264, scopeLine: 62, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, retainedNodes: !2267)
!2264 = !DISubroutineType(types: !2265)
!2265 = !{!317, !616, !616, !2266}
!2266 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !941)
!2267 = !{!2268, !2269, !2270, !2271, !2272, !2273, !2275}
!2268 = !DILocalVariable(name: "h_out", arg: 1, scope: !2263, file: !9, line: 61, type: !616)
!2269 = !DILocalVariable(name: "h_in", arg: 2, scope: !2263, file: !9, line: 61, type: !616)
!2270 = !DILocalVariable(name: "ARRAY_SIZE", arg: 3, scope: !2263, file: !9, line: 61, type: !2266)
!2271 = !DILocalVariable(name: "ARRAY_BYTES", scope: !2263, file: !9, line: 75, type: !2266)
!2272 = !DILocalVariable(name: "d_mem", scope: !2263, file: !9, line: 76, type: !616)
!2273 = !DILocalVariable(name: "d_times", scope: !2263, file: !9, line: 77, type: !2274)
!2274 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!2275 = !DILocalVariable(name: "kts", scope: !2263, file: !9, line: 78, type: !2276)
!2276 = !DICompositeType(tag: DW_TAG_array_type, baseType: !320, size: 384, elements: !2277)
!2277 = !{!2278}
!2278 = !DISubrange(count: 6)
!2279 = !DILocation(line: 0, scope: !2263)
!2280 = !DILocation(line: 75, column: 43, scope: !2263)
!2281 = !DILocation(line: 76, column: 5, scope: !2263)
!2282 = !DILocation(line: 77, column: 5, scope: !2263)
!2283 = !DILocation(line: 78, column: 5, scope: !2263)
!2284 = !DILocation(line: 78, column: 13, scope: !2263)
!2285 = !DILocation(line: 79, column: 29, scope: !2263)
!2286 = !DILocation(line: 79, column: 19, scope: !2263)
!2287 = !DILocation(line: 0, scope: !2224, inlinedAt: !2288)
!2288 = distinct !DILocation(line: 79, column: 5, scope: !2263)
!2289 = !DILocation(line: 19, column: 15, scope: !2232, inlinedAt: !2288)
!2290 = !DILocation(line: 19, column: 7, scope: !2224, inlinedAt: !2288)
!2291 = !DILocation(line: 20, column: 15, scope: !2235, inlinedAt: !2288)
!2292 = !DILocation(line: 20, column: 34, scope: !2235, inlinedAt: !2288)
!2293 = !DILocation(line: 0, scope: !2238, inlinedAt: !2294)
!2294 = distinct !DILocation(line: 20, column: 45, scope: !2235, inlinedAt: !2288)
!2295 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2294)
!2296 = !DILocation(line: 21, column: 5, scope: !2235, inlinedAt: !2288)
!2297 = !DILocation(line: 80, column: 29, scope: !2263)
!2298 = !DILocation(line: 80, column: 19, scope: !2263)
!2299 = !DILocation(line: 0, scope: !2224, inlinedAt: !2300)
!2300 = distinct !DILocation(line: 80, column: 5, scope: !2263)
!2301 = !DILocation(line: 19, column: 15, scope: !2232, inlinedAt: !2300)
!2302 = !DILocation(line: 19, column: 7, scope: !2224, inlinedAt: !2300)
!2303 = !DILocation(line: 20, column: 15, scope: !2235, inlinedAt: !2300)
!2304 = !DILocation(line: 20, column: 34, scope: !2235, inlinedAt: !2300)
!2305 = !DILocation(line: 0, scope: !2238, inlinedAt: !2306)
!2306 = distinct !DILocation(line: 20, column: 45, scope: !2235, inlinedAt: !2300)
!2307 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2306)
!2308 = !DILocation(line: 21, column: 5, scope: !2235, inlinedAt: !2300)
!2309 = !DILocation(line: 82, column: 29, scope: !2263)
!2310 = !DILocation(line: 82, column: 36, scope: !2263)
!2311 = !DILocation(line: 82, column: 19, scope: !2263)
!2312 = !DILocation(line: 0, scope: !2224, inlinedAt: !2313)
!2313 = distinct !DILocation(line: 82, column: 5, scope: !2263)
!2314 = !DILocation(line: 19, column: 15, scope: !2232, inlinedAt: !2313)
!2315 = !DILocation(line: 19, column: 7, scope: !2224, inlinedAt: !2313)
!2316 = !DILocation(line: 20, column: 15, scope: !2235, inlinedAt: !2313)
!2317 = !DILocation(line: 20, column: 34, scope: !2235, inlinedAt: !2313)
!2318 = !DILocation(line: 0, scope: !2238, inlinedAt: !2319)
!2319 = distinct !DILocation(line: 20, column: 45, scope: !2235, inlinedAt: !2313)
!2320 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2319)
!2321 = !DILocation(line: 21, column: 5, scope: !2235, inlinedAt: !2313)
!2322 = !DILocation(line: 83, column: 29, scope: !2263)
!2323 = !DILocation(line: 83, column: 38, scope: !2263)
!2324 = !DILocation(line: 83, column: 19, scope: !2263)
!2325 = !DILocation(line: 0, scope: !2224, inlinedAt: !2326)
!2326 = distinct !DILocation(line: 83, column: 5, scope: !2263)
!2327 = !DILocation(line: 19, column: 15, scope: !2232, inlinedAt: !2326)
!2328 = !DILocation(line: 19, column: 7, scope: !2224, inlinedAt: !2326)
!2329 = !DILocation(line: 20, column: 15, scope: !2235, inlinedAt: !2326)
!2330 = !DILocation(line: 20, column: 34, scope: !2235, inlinedAt: !2326)
!2331 = !DILocation(line: 0, scope: !2238, inlinedAt: !2332)
!2332 = distinct !DILocation(line: 20, column: 45, scope: !2235, inlinedAt: !2326)
!2333 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2332)
!2334 = !DILocation(line: 21, column: 5, scope: !2235, inlinedAt: !2326)
!2335 = !DILocation(line: 85, column: 5, scope: !2336)
!2336 = distinct !DILexicalBlock(scope: !2263, file: !9, line: 85, column: 5)
!2337 = !DILocation(line: 86, column: 19, scope: !2263)
!2338 = !DILocation(line: 0, scope: !2224, inlinedAt: !2339)
!2339 = distinct !DILocation(line: 86, column: 5, scope: !2263)
!2340 = !DILocation(line: 19, column: 15, scope: !2232, inlinedAt: !2339)
!2341 = !DILocation(line: 19, column: 7, scope: !2224, inlinedAt: !2339)
!2342 = !DILocation(line: 20, column: 15, scope: !2235, inlinedAt: !2339)
!2343 = !DILocation(line: 20, column: 34, scope: !2235, inlinedAt: !2339)
!2344 = !DILocation(line: 0, scope: !2238, inlinedAt: !2345)
!2345 = distinct !DILocation(line: 20, column: 45, scope: !2235, inlinedAt: !2339)
!2346 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2345)
!2347 = !DILocation(line: 21, column: 5, scope: !2235, inlinedAt: !2339)
!2348 = !DILocation(line: 88, column: 29, scope: !2263)
!2349 = !DILocation(line: 88, column: 36, scope: !2263)
!2350 = !DILocation(line: 88, column: 19, scope: !2263)
!2351 = !DILocation(line: 0, scope: !2224, inlinedAt: !2352)
!2352 = distinct !DILocation(line: 88, column: 5, scope: !2263)
!2353 = !DILocation(line: 19, column: 15, scope: !2232, inlinedAt: !2352)
!2354 = !DILocation(line: 19, column: 7, scope: !2224, inlinedAt: !2352)
!2355 = !DILocation(line: 20, column: 15, scope: !2235, inlinedAt: !2352)
!2356 = !DILocation(line: 20, column: 34, scope: !2235, inlinedAt: !2352)
!2357 = !DILocation(line: 0, scope: !2238, inlinedAt: !2358)
!2358 = distinct !DILocation(line: 20, column: 45, scope: !2235, inlinedAt: !2352)
!2359 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2358)
!2360 = !DILocation(line: 21, column: 5, scope: !2235, inlinedAt: !2352)
!2361 = !DILocation(line: 89, column: 34, scope: !2263)
!2362 = !DILocation(line: 89, column: 19, scope: !2263)
!2363 = !DILocation(line: 0, scope: !2224, inlinedAt: !2364)
!2364 = distinct !DILocation(line: 89, column: 5, scope: !2263)
!2365 = !DILocation(line: 19, column: 15, scope: !2232, inlinedAt: !2364)
!2366 = !DILocation(line: 19, column: 7, scope: !2224, inlinedAt: !2364)
!2367 = !DILocation(line: 20, column: 15, scope: !2235, inlinedAt: !2364)
!2368 = !DILocation(line: 20, column: 34, scope: !2235, inlinedAt: !2364)
!2369 = !DILocation(line: 0, scope: !2238, inlinedAt: !2370)
!2370 = distinct !DILocation(line: 20, column: 45, scope: !2235, inlinedAt: !2364)
!2371 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2370)
!2372 = !DILocation(line: 21, column: 5, scope: !2235, inlinedAt: !2364)
!2373 = !DILocation(line: 90, column: 27, scope: !2263)
!2374 = !DILocation(line: 90, column: 19, scope: !2263)
!2375 = !DILocation(line: 0, scope: !2224, inlinedAt: !2376)
!2376 = distinct !DILocation(line: 90, column: 5, scope: !2263)
!2377 = !DILocation(line: 19, column: 15, scope: !2232, inlinedAt: !2376)
!2378 = !DILocation(line: 19, column: 7, scope: !2224, inlinedAt: !2376)
!2379 = !DILocation(line: 20, column: 15, scope: !2235, inlinedAt: !2376)
!2380 = !DILocation(line: 20, column: 34, scope: !2235, inlinedAt: !2376)
!2381 = !DILocation(line: 0, scope: !2238, inlinedAt: !2382)
!2382 = distinct !DILocation(line: 20, column: 45, scope: !2235, inlinedAt: !2376)
!2383 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2382)
!2384 = !DILocation(line: 21, column: 5, scope: !2235, inlinedAt: !2376)
!2385 = !DILocation(line: 91, column: 27, scope: !2263)
!2386 = !DILocation(line: 91, column: 19, scope: !2263)
!2387 = !DILocation(line: 0, scope: !2224, inlinedAt: !2388)
!2388 = distinct !DILocation(line: 91, column: 5, scope: !2263)
!2389 = !DILocation(line: 19, column: 15, scope: !2232, inlinedAt: !2388)
!2390 = !DILocation(line: 19, column: 7, scope: !2224, inlinedAt: !2388)
!2391 = !DILocation(line: 20, column: 15, scope: !2235, inlinedAt: !2388)
!2392 = !DILocation(line: 20, column: 34, scope: !2235, inlinedAt: !2388)
!2393 = !DILocation(line: 0, scope: !2238, inlinedAt: !2394)
!2394 = distinct !DILocation(line: 20, column: 45, scope: !2235, inlinedAt: !2388)
!2395 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2394)
!2396 = !DILocation(line: 21, column: 5, scope: !2235, inlinedAt: !2388)
!2397 = !DILocation(line: 92, column: 12, scope: !2398)
!2398 = distinct !DILexicalBlock(scope: !2263, file: !9, line: 92, column: 12)
!2399 = !{!2400, !2400, i64 0}
!2400 = !{!"long", !2261, i64 0}
!2401 = !DILocation(line: 92, column: 18, scope: !2398)
!2402 = !DILocation(line: 92, column: 22, scope: !2398)
!2403 = !DILocation(line: 95, column: 17, scope: !2404)
!2404 = distinct !DILexicalBlock(scope: !2398, file: !9, line: 94, column: 37)
!2405 = !DILocation(line: 0, scope: !2238, inlinedAt: !2406)
!2406 = distinct !DILocation(line: 95, column: 73, scope: !2404)
!2407 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2406)
!2408 = !DILocation(line: 96, column: 7, scope: !2404)
!2409 = !DILocation(line: 0, scope: !2410, inlinedAt: !2472)
!2410 = distinct !DISubprogram(name: "operator<<<std::char_traits<char> >", linkageName: "_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c", scope: !2, file: !2239, line: 517, type: !2411, scopeLine: 518, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, templateParams: !2417, retainedNodes: !2414)
!2411 = !DISubroutineType(types: !2412)
!2412 = !{!2413, !2413, !12}
!2413 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2240, size: 64)
!2414 = !{!2415, !2416}
!2415 = !DILocalVariable(name: "__out", arg: 1, scope: !2410, file: !2239, line: 517, type: !2413)
!2416 = !DILocalVariable(name: "__c", arg: 2, scope: !2410, file: !2239, line: 517, type: !12)
!2417 = !{!2418}
!2418 = !DITemplateTypeParameter(name: "_Traits", type: !2419)
!2419 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !2, file: !2420, line: 316, size: 8, flags: DIFlagTypePassByValue, elements: !2421, templateParams: !2470, identifier: "_ZTSSt11char_traitsIcE")
!2420 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/char_traits.h", directory: "")
!2421 = !{!2422, !2429, !2432, !2433, !2438, !2441, !2444, !2448, !2449, !2452, !2458, !2461, !2464, !2467}
!2422 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignERcRKc", scope: !2419, file: !2420, line: 328, type: !2423, scopeLine: 328, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2423 = !DISubroutineType(types: !2424)
!2424 = !{null, !2425, !2427}
!2425 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2426, size: 64)
!2426 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2419, file: !2420, line: 318, baseType: !12)
!2427 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2428, size: 64)
!2428 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2426)
!2429 = !DISubprogram(name: "eq", linkageName: "_ZNSt11char_traitsIcE2eqERKcS2_", scope: !2419, file: !2420, line: 332, type: !2430, scopeLine: 332, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2430 = !DISubroutineType(types: !2431)
!2431 = !{!551, !2427, !2427}
!2432 = !DISubprogram(name: "lt", linkageName: "_ZNSt11char_traitsIcE2ltERKcS2_", scope: !2419, file: !2420, line: 336, type: !2430, scopeLine: 336, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2433 = !DISubprogram(name: "compare", linkageName: "_ZNSt11char_traitsIcE7compareEPKcS2_m", scope: !2419, file: !2420, line: 344, type: !2434, scopeLine: 344, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2434 = !DISubroutineType(types: !2435)
!2435 = !{!291, !2436, !2436, !2437}
!2436 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2428, size: 64)
!2437 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !2, file: !515, line: 2306, baseType: !943)
!2438 = !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !2419, file: !2420, line: 365, type: !2439, scopeLine: 365, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2439 = !DISubroutineType(types: !2440)
!2440 = !{!2437, !2436}
!2441 = !DISubprogram(name: "find", linkageName: "_ZNSt11char_traitsIcE4findEPKcmRS1_", scope: !2419, file: !2420, line: 375, type: !2442, scopeLine: 375, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2442 = !DISubroutineType(types: !2443)
!2443 = !{!2436, !2436, !2437, !2427}
!2444 = !DISubprogram(name: "move", linkageName: "_ZNSt11char_traitsIcE4moveEPcPKcm", scope: !2419, file: !2420, line: 389, type: !2445, scopeLine: 389, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2445 = !DISubroutineType(types: !2446)
!2446 = !{!2447, !2447, !2436, !2437}
!2447 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2426, size: 64)
!2448 = !DISubprogram(name: "copy", linkageName: "_ZNSt11char_traitsIcE4copyEPcPKcm", scope: !2419, file: !2420, line: 401, type: !2445, scopeLine: 401, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2449 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignEPcmc", scope: !2419, file: !2420, line: 413, type: !2450, scopeLine: 413, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2450 = !DISubroutineType(types: !2451)
!2451 = !{!2447, !2447, !2437, !2426}
!2452 = !DISubprogram(name: "to_char_type", linkageName: "_ZNSt11char_traitsIcE12to_char_typeERKi", scope: !2419, file: !2420, line: 425, type: !2453, scopeLine: 425, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2453 = !DISubroutineType(types: !2454)
!2454 = !{!2426, !2455}
!2455 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2456, size: 64)
!2456 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2457)
!2457 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !2419, file: !2420, line: 319, baseType: !291)
!2458 = !DISubprogram(name: "to_int_type", linkageName: "_ZNSt11char_traitsIcE11to_int_typeERKc", scope: !2419, file: !2420, line: 431, type: !2459, scopeLine: 431, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2459 = !DISubroutineType(types: !2460)
!2460 = !{!2457, !2427}
!2461 = !DISubprogram(name: "eq_int_type", linkageName: "_ZNSt11char_traitsIcE11eq_int_typeERKiS2_", scope: !2419, file: !2420, line: 435, type: !2462, scopeLine: 435, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2462 = !DISubroutineType(types: !2463)
!2463 = !{!551, !2455, !2455}
!2464 = !DISubprogram(name: "eof", linkageName: "_ZNSt11char_traitsIcE3eofEv", scope: !2419, file: !2420, line: 439, type: !2465, scopeLine: 439, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2465 = !DISubroutineType(types: !2466)
!2466 = !{!2457}
!2467 = !DISubprogram(name: "not_eof", linkageName: "_ZNSt11char_traitsIcE7not_eofERKi", scope: !2419, file: !2420, line: 443, type: !2468, scopeLine: 443, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2468 = !DISubroutineType(types: !2469)
!2469 = !{!2457, !2455}
!2470 = !{!2471}
!2471 = !DITemplateTypeParameter(name: "_CharT", type: !12)
!2472 = distinct !DILocation(line: 99, column: 17, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2398, file: !9, line: 98, column: 10)
!2474 = !{!2261, !2261, i64 0}
!2475 = !DILocation(line: 518, column: 14, scope: !2410, inlinedAt: !2472)
!2476 = !DILocation(line: 518, column: 7, scope: !2410, inlinedAt: !2472)
!2477 = !DILocation(line: 99, column: 27, scope: !2473)
!2478 = !DILocalVariable(name: "this", arg: 1, scope: !2479, type: !2253, flags: DIFlagArtificial | DIFlagObjectPointer)
!2479 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEl", scope: !2240, file: !2239, line: 166, type: !2480, scopeLine: 167, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, declaration: !2482, retainedNodes: !2483)
!2480 = !DISubroutineType(types: !2481)
!2481 = !{!2244, !2246, !323}
!2482 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEl", scope: !2240, file: !2239, line: 166, type: !2480, scopeLine: 166, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2483 = !{!2478, !2484}
!2484 = !DILocalVariable(name: "__n", arg: 2, scope: !2479, file: !2239, line: 166, type: !323)
!2485 = !DILocation(line: 0, scope: !2479, inlinedAt: !2486)
!2486 = distinct !DILocation(line: 99, column: 24, scope: !2473)
!2487 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2486)
!2488 = !DILocalVariable(name: "__out", arg: 1, scope: !2489, file: !2239, line: 606, type: !2413)
!2489 = distinct !DISubprogram(name: "operator<<<std::char_traits<char> >", linkageName: "_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc", scope: !2, file: !2239, line: 606, type: !2490, scopeLine: 607, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, templateParams: !2417, retainedNodes: !2492)
!2490 = !DISubroutineType(types: !2491)
!2491 = !{!2413, !2413, !824}
!2492 = !{!2488, !2493}
!2493 = !DILocalVariable(name: "__s", arg: 2, scope: !2489, file: !2239, line: 606, type: !824)
!2494 = !DILocation(line: 0, scope: !2489, inlinedAt: !2495)
!2495 = distinct !DILocation(line: 99, column: 34, scope: !2473)
!2496 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2495)
!2497 = distinct !DILexicalBlock(scope: !2489, file: !2239, line: 608, column: 11)
!2498 = !DILocation(line: 99, column: 45, scope: !2473)
!2499 = !DILocation(line: 0, scope: !2479, inlinedAt: !2500)
!2500 = distinct !DILocation(line: 99, column: 42, scope: !2473)
!2501 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2500)
!2502 = !DILocation(line: 0, scope: !2489, inlinedAt: !2503)
!2503 = distinct !DILocation(line: 99, column: 52, scope: !2473)
!2504 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2503)
!2505 = !DILocation(line: 100, column: 27, scope: !2473)
!2506 = !DILocation(line: 0, scope: !2479, inlinedAt: !2507)
!2507 = distinct !DILocation(line: 100, column: 24, scope: !2473)
!2508 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2507)
!2509 = !DILocation(line: 0, scope: !2489, inlinedAt: !2510)
!2510 = distinct !DILocation(line: 100, column: 34, scope: !2473)
!2511 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2510)
!2512 = !DILocation(line: 100, column: 45, scope: !2473)
!2513 = !DILocation(line: 0, scope: !2479, inlinedAt: !2514)
!2514 = distinct !DILocation(line: 100, column: 42, scope: !2473)
!2515 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2514)
!2516 = !DILocation(line: 0, scope: !2489, inlinedAt: !2517)
!2517 = distinct !DILocation(line: 100, column: 52, scope: !2473)
!2518 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2517)
!2519 = !DILocation(line: 101, column: 27, scope: !2473)
!2520 = !DILocation(line: 0, scope: !2479, inlinedAt: !2521)
!2521 = distinct !DILocation(line: 101, column: 24, scope: !2473)
!2522 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2521)
!2523 = !DILocation(line: 0, scope: !2489, inlinedAt: !2524)
!2524 = distinct !DILocation(line: 101, column: 34, scope: !2473)
!2525 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2524)
!2526 = !DILocation(line: 101, column: 45, scope: !2473)
!2527 = !DILocation(line: 0, scope: !2479, inlinedAt: !2528)
!2528 = distinct !DILocation(line: 101, column: 42, scope: !2473)
!2529 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2528)
!2530 = !DILocation(line: 0, scope: !2489, inlinedAt: !2531)
!2531 = distinct !DILocation(line: 101, column: 52, scope: !2473)
!2532 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2531)
!2533 = !DILocation(line: 0, scope: !2238, inlinedAt: !2534)
!2534 = distinct !DILocation(line: 101, column: 59, scope: !2473)
!2535 = !DILocalVariable(name: "__os", arg: 1, scope: !2536, file: !2239, line: 681, type: !2413)
!2536 = distinct !DISubprogram(name: "endl<char, std::char_traits<char> >", linkageName: "_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !2, file: !2239, line: 681, type: !2537, scopeLine: 682, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, templateParams: !2540, retainedNodes: !2539)
!2537 = !DISubroutineType(types: !2538)
!2538 = !{!2413, !2413}
!2539 = !{!2535}
!2540 = !{!2471, !2418}
!2541 = !DILocation(line: 0, scope: !2536, inlinedAt: !2542)
!2542 = distinct !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2534)
!2543 = !DILocation(line: 682, column: 29, scope: !2536, inlinedAt: !2542)
!2544 = !{!2545, !2545, i64 0}
!2545 = !{!"vtable pointer", !2262, i64 0}
!2546 = !DILocalVariable(name: "this", arg: 1, scope: !2547, type: !2559, flags: DIFlagArtificial | DIFlagObjectPointer)
!2547 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !2549, file: !2548, line: 449, type: !2551, scopeLine: 450, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, declaration: !2556, retainedNodes: !2557)
!2548 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/basic_ios.h", directory: "")
!2549 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ios<char, std::char_traits<char> >", scope: !2, file: !2550, line: 178, size: 2112, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!2550 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/basic_ios.tcc", directory: "")
!2551 = !DISubroutineType(types: !2552)
!2552 = !{!2553, !2554, !12}
!2553 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2549, file: !2548, line: 76, baseType: !12)
!2554 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2555, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2555 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2549)
!2556 = !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !2549, file: !2548, line: 449, type: !2551, scopeLine: 449, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2557 = !{!2546, !2558}
!2558 = !DILocalVariable(name: "__c", arg: 2, scope: !2547, file: !2548, line: 449, type: !12)
!2559 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2555, size: 64)
!2560 = !DILocation(line: 0, scope: !2547, inlinedAt: !2561)
!2561 = distinct !DILocation(line: 682, column: 34, scope: !2536, inlinedAt: !2542)
!2562 = !DILocation(line: 450, column: 30, scope: !2547, inlinedAt: !2561)
!2563 = !{!2564, !2260, i64 240}
!2564 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !2565, i64 0, !2260, i64 216, !2261, i64 224, !2571, i64 225, !2260, i64 232, !2260, i64 240, !2260, i64 248, !2260, i64 256}
!2565 = !{!"_ZTSSt8ios_base", !2400, i64 8, !2400, i64 16, !2566, i64 24, !2567, i64 28, !2567, i64 32, !2260, i64 40, !2568, i64 48, !2261, i64 64, !2569, i64 192, !2260, i64 200, !2570, i64 208}
!2566 = !{!"_ZTSSt13_Ios_Fmtflags", !2261, i64 0}
!2567 = !{!"_ZTSSt12_Ios_Iostate", !2261, i64 0}
!2568 = !{!"_ZTSNSt8ios_base6_WordsE", !2260, i64 0, !2400, i64 8}
!2569 = !{!"int", !2261, i64 0}
!2570 = !{!"_ZTSSt6locale", !2260, i64 0}
!2571 = !{!"bool", !2261, i64 0}
!2572 = !DILocalVariable(name: "__f", arg: 1, scope: !2573, file: !2548, line: 47, type: !2580)
!2573 = distinct !DISubprogram(name: "__check_facet<std::ctype<char> >", linkageName: "_ZSt13__check_facetISt5ctypeIcEERKT_PS3_", scope: !2, file: !2548, line: 47, type: !2574, scopeLine: 48, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, templateParams: !2582, retainedNodes: !2581)
!2574 = !DISubroutineType(types: !2575)
!2575 = !{!2576, !2580}
!2576 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2577, size: 64)
!2577 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2578)
!2578 = !DICompositeType(tag: DW_TAG_class_type, name: "ctype<char>", scope: !2, file: !2579, line: 681, size: 4608, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt5ctypeIcE")
!2579 = !DIFile(filename: "/opt/rh/gcc-toolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits/locale_facets.h", directory: "")
!2580 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2577, size: 64)
!2581 = !{!2572}
!2582 = !{!2583}
!2583 = !DITemplateTypeParameter(name: "_Facet", type: !2578)
!2584 = !DILocation(line: 0, scope: !2573, inlinedAt: !2585)
!2585 = distinct !DILocation(line: 450, column: 16, scope: !2547, inlinedAt: !2561)
!2586 = !DILocation(line: 49, column: 12, scope: !2587, inlinedAt: !2585)
!2587 = distinct !DILexicalBlock(scope: !2573, file: !2548, line: 49, column: 11)
!2588 = !DILocation(line: 49, column: 11, scope: !2573, inlinedAt: !2585)
!2589 = !DILocation(line: 50, column: 2, scope: !2587, inlinedAt: !2585)
!2590 = !DILocalVariable(name: "this", arg: 1, scope: !2591, type: !2580, flags: DIFlagArtificial | DIFlagObjectPointer)
!2591 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !2578, file: !2579, line: 872, type: !2592, scopeLine: 873, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, declaration: !2596, retainedNodes: !2597)
!2592 = !DISubroutineType(types: !2593)
!2593 = !{!2594, !2595, !12}
!2594 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2578, file: !2579, line: 686, baseType: !12)
!2595 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2577, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2596 = !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !2578, file: !2579, line: 872, type: !2592, scopeLine: 872, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2597 = !{!2590, !2598}
!2598 = !DILocalVariable(name: "__c", arg: 2, scope: !2591, file: !2579, line: 872, type: !12)
!2599 = !DILocation(line: 0, scope: !2591, inlinedAt: !2600)
!2600 = distinct !DILocation(line: 450, column: 40, scope: !2547, inlinedAt: !2561)
!2601 = !DILocation(line: 874, column: 6, scope: !2602, inlinedAt: !2600)
!2602 = distinct !DILexicalBlock(scope: !2591, file: !2579, line: 874, column: 6)
!2603 = !{!2604, !2261, i64 56}
!2604 = !{!"_ZTSSt5ctypeIcE", !2605, i64 0, !2260, i64 16, !2571, i64 24, !2260, i64 32, !2260, i64 40, !2260, i64 48, !2261, i64 56, !2261, i64 57, !2261, i64 313, !2261, i64 569}
!2605 = !{!"_ZTSNSt6locale5facetE", !2569, i64 8}
!2606 = !DILocation(line: 874, column: 6, scope: !2591, inlinedAt: !2600)
!2607 = !DILocation(line: 875, column: 11, scope: !2602, inlinedAt: !2600)
!2608 = !DILocation(line: 875, column: 4, scope: !2602, inlinedAt: !2600)
!2609 = !DILocation(line: 876, column: 8, scope: !2591, inlinedAt: !2600)
!2610 = !DILocation(line: 877, column: 15, scope: !2591, inlinedAt: !2600)
!2611 = !DILocation(line: 877, column: 2, scope: !2591, inlinedAt: !2600)
!2612 = !DILocation(line: 682, column: 25, scope: !2536, inlinedAt: !2542)
!2613 = !DILocalVariable(name: "__os", arg: 1, scope: !2614, file: !2239, line: 703, type: !2413)
!2614 = distinct !DISubprogram(name: "flush<char, std::char_traits<char> >", linkageName: "_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !2, file: !2239, line: 703, type: !2537, scopeLine: 704, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, templateParams: !2540, retainedNodes: !2615)
!2615 = !{!2613}
!2616 = !DILocation(line: 0, scope: !2614, inlinedAt: !2617)
!2617 = distinct !DILocation(line: 682, column: 14, scope: !2536, inlinedAt: !2542)
!2618 = !DILocation(line: 704, column: 19, scope: !2614, inlinedAt: !2617)
!2619 = !DILocation(line: 103, column: 23, scope: !2263)
!2620 = !DILocation(line: 103, column: 30, scope: !2263)
!2621 = !DILocation(line: 103, column: 29, scope: !2263)
!2622 = !DILocation(line: 103, column: 22, scope: !2263)
!2623 = !DILocation(line: 103, column: 53, scope: !2263)
!2624 = !DILocation(line: 103, column: 60, scope: !2263)
!2625 = !DILocation(line: 103, column: 59, scope: !2263)
!2626 = !{!2627, !2400, i64 16}
!2627 = !{!"_ZTS10ClockTimes", !2400, i64 0, !2400, i64 8, !2400, i64 16}
!2628 = !DILocation(line: 104, column: 1, scope: !2263)
!2629 = !DISubprogram(name: "hipMalloc", scope: !87, file: !87, line: 2654, type: !2630, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !408)
!2630 = !DISubroutineType(types: !2631)
!2631 = !{!2227, !301, !941}
!2632 = !DISubprogram(name: "hipMemcpy", scope: !87, file: !87, line: 3408, type: !2633, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !408)
!2633 = !DISubroutineType(types: !2634)
!2634 = !{!2227, !302, !967, !941, !2635}
!2635 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipMemcpyKind", file: !168, line: 351, baseType: !167)
!2636 = !DISubprogram(name: "hipDeviceSynchronize", scope: !87, file: !87, line: 1465, type: !2637, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !408)
!2637 = !DISubroutineType(types: !2638)
!2638 = !{!2227}
!2639 = !DISubprogram(name: "hipFree", scope: !87, file: !87, line: 3353, type: !2640, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !408)
!2640 = !DISubroutineType(types: !2641)
!2641 = !{!2227, !302}
!2642 = distinct !DISubprogram(name: "norm_increment", linkageName: "_Z14norm_incrementPiS_m", scope: !9, file: !9, line: 107, type: !2643, scopeLine: 108, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, retainedNodes: !2645)
!2643 = !DISubroutineType(types: !2644)
!2644 = !{null, !616, !616, !2266}
!2645 = !{!2646, !2647, !2648, !2649}
!2646 = !DILocalVariable(name: "h_out", arg: 1, scope: !2642, file: !9, line: 107, type: !616)
!2647 = !DILocalVariable(name: "h_in", arg: 2, scope: !2642, file: !9, line: 107, type: !616)
!2648 = !DILocalVariable(name: "ARRAY_SIZE", arg: 3, scope: !2642, file: !9, line: 107, type: !2266)
!2649 = !DILocalVariable(name: "i", scope: !2650, file: !9, line: 109, type: !941)
!2650 = distinct !DILexicalBlock(scope: !2642, file: !9, line: 109, column: 3)
!2651 = !DILocation(line: 0, scope: !2642)
!2652 = !DILocation(line: 0, scope: !2650)
!2653 = !DILocation(line: 109, column: 21, scope: !2654)
!2654 = distinct !DILexicalBlock(scope: !2650, file: !9, line: 109, column: 3)
!2655 = !DILocation(line: 109, column: 3, scope: !2650)
!2656 = !DILocation(line: 110, column: 12, scope: !2654)
!2657 = !DILocation(line: 110, column: 18, scope: !2654)
!2658 = !{!2569, !2569, i64 0}
!2659 = !DILocation(line: 110, column: 26, scope: !2654)
!2660 = !DILocation(line: 110, column: 5, scope: !2654)
!2661 = !DILocation(line: 110, column: 16, scope: !2654)
!2662 = distinct !{!2662, !2655, !2663, !2664, !2665}
!2663 = !DILocation(line: 110, column: 28, scope: !2650)
!2664 = !{!"llvm.loop.mustprogress"}
!2665 = !{!"llvm.loop.isvectorized", i32 1}
!2666 = distinct !{!2666, !2667}
!2667 = !{!"llvm.loop.unroll.disable"}
!2668 = !DILocation(line: 111, column: 1, scope: !2642)
!2669 = distinct !{!2669, !2655, !2663, !2664, !2665}
!2670 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 114, type: !1028, scopeLine: 115, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, retainedNodes: !2671)
!2671 = !{!2672, !2673, !2674, !2675, !2676, !2677, !2678, !2679, !2680, !2682, !2683, !2685, !2686, !2687, !2689}
!2672 = !DILocalVariable(name: "ARRAY_SIZE", scope: !2670, file: !9, line: 116, type: !2266)
!2673 = !DILocalVariable(name: "ITERATIONS", scope: !2670, file: !9, line: 117, type: !2266)
!2674 = !DILocalVariable(name: "in", scope: !2670, file: !9, line: 118, type: !616)
!2675 = !DILocalVariable(name: "norm_out", scope: !2670, file: !9, line: 119, type: !616)
!2676 = !DILocalVariable(name: "hip_out", scope: !2670, file: !9, line: 120, type: !616)
!2677 = !DILocalVariable(name: "kernel_time", scope: !2670, file: !9, line: 121, type: !317)
!2678 = !DILocalVariable(name: "deviceId", scope: !2670, file: !9, line: 122, type: !291)
!2679 = !DILocalVariable(name: "wallClkRate", scope: !2670, file: !9, line: 123, type: !291)
!2680 = !DILocalVariable(name: "i", scope: !2681, file: !9, line: 127, type: !291)
!2681 = distinct !DILexicalBlock(scope: !2670, file: !9, line: 127, column: 5)
!2682 = !DILocalVariable(name: "hip_start_time", scope: !2670, file: !9, line: 133, type: !555)
!2683 = !DILocalVariable(name: "i", scope: !2684, file: !9, line: 136, type: !941)
!2684 = distinct !DILexicalBlock(scope: !2670, file: !9, line: 136, column: 5)
!2685 = !DILocalVariable(name: "hip_end_time", scope: !2670, file: !9, line: 140, type: !555)
!2686 = !DILocalVariable(name: "norm_start_time", scope: !2670, file: !9, line: 149, type: !555)
!2687 = !DILocalVariable(name: "i", scope: !2688, file: !9, line: 151, type: !941)
!2688 = distinct !DILexicalBlock(scope: !2670, file: !9, line: 151, column: 5)
!2689 = !DILocalVariable(name: "norm_end_time", scope: !2670, file: !9, line: 157, type: !555)
!2690 = !DILocation(line: 0, scope: !2670)
!2691 = !DILocation(line: 118, column: 15, scope: !2670)
!2692 = !DILocation(line: 120, column: 20, scope: !2670)
!2693 = !DILocation(line: 123, column: 5, scope: !2670)
!2694 = !DILocation(line: 123, column: 9, scope: !2670)
!2695 = !DILocation(line: 124, column: 19, scope: !2670)
!2696 = !DILocation(line: 0, scope: !2224, inlinedAt: !2697)
!2697 = distinct !DILocation(line: 124, column: 5, scope: !2670)
!2698 = !DILocation(line: 19, column: 15, scope: !2232, inlinedAt: !2697)
!2699 = !DILocation(line: 19, column: 7, scope: !2224, inlinedAt: !2697)
!2700 = !DILocation(line: 20, column: 15, scope: !2235, inlinedAt: !2697)
!2701 = !DILocation(line: 20, column: 34, scope: !2235, inlinedAt: !2697)
!2702 = !DILocation(line: 0, scope: !2238, inlinedAt: !2703)
!2703 = distinct !DILocation(line: 20, column: 45, scope: !2235, inlinedAt: !2697)
!2704 = !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2703)
!2705 = !DILocation(line: 21, column: 5, scope: !2235, inlinedAt: !2697)
!2706 = !DILocation(line: 0, scope: !2489, inlinedAt: !2707)
!2707 = distinct !DILocation(line: 125, column: 15, scope: !2670)
!2708 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2707)
!2709 = !DILocation(line: 125, column: 53, scope: !2670)
!2710 = !DILocation(line: 125, column: 50, scope: !2670)
!2711 = !DILocation(line: 0, scope: !2489, inlinedAt: !2712)
!2712 = distinct !DILocation(line: 125, column: 65, scope: !2670)
!2713 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2712)
!2714 = !DILocation(line: 0, scope: !2238, inlinedAt: !2715)
!2715 = distinct !DILocation(line: 125, column: 76, scope: !2670)
!2716 = !DILocation(line: 0, scope: !2536, inlinedAt: !2717)
!2717 = distinct !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2715)
!2718 = !DILocation(line: 682, column: 29, scope: !2536, inlinedAt: !2717)
!2719 = !DILocation(line: 0, scope: !2547, inlinedAt: !2720)
!2720 = distinct !DILocation(line: 682, column: 34, scope: !2536, inlinedAt: !2717)
!2721 = !DILocation(line: 450, column: 30, scope: !2547, inlinedAt: !2720)
!2722 = !DILocation(line: 0, scope: !2573, inlinedAt: !2723)
!2723 = distinct !DILocation(line: 450, column: 16, scope: !2547, inlinedAt: !2720)
!2724 = !DILocation(line: 49, column: 12, scope: !2587, inlinedAt: !2723)
!2725 = !DILocation(line: 49, column: 11, scope: !2573, inlinedAt: !2723)
!2726 = !DILocation(line: 50, column: 2, scope: !2587, inlinedAt: !2723)
!2727 = !DILocation(line: 0, scope: !2591, inlinedAt: !2728)
!2728 = distinct !DILocation(line: 450, column: 40, scope: !2547, inlinedAt: !2720)
!2729 = !DILocation(line: 874, column: 6, scope: !2602, inlinedAt: !2728)
!2730 = !DILocation(line: 874, column: 6, scope: !2591, inlinedAt: !2728)
!2731 = !DILocation(line: 875, column: 11, scope: !2602, inlinedAt: !2728)
!2732 = !DILocation(line: 875, column: 4, scope: !2602, inlinedAt: !2728)
!2733 = !DILocation(line: 876, column: 8, scope: !2591, inlinedAt: !2728)
!2734 = !DILocation(line: 877, column: 15, scope: !2591, inlinedAt: !2728)
!2735 = !DILocation(line: 877, column: 2, scope: !2591, inlinedAt: !2728)
!2736 = !DILocation(line: 682, column: 25, scope: !2536, inlinedAt: !2717)
!2737 = !DILocation(line: 0, scope: !2614, inlinedAt: !2738)
!2738 = distinct !DILocation(line: 682, column: 14, scope: !2536, inlinedAt: !2717)
!2739 = !DILocation(line: 704, column: 19, scope: !2614, inlinedAt: !2738)
!2740 = !DILocation(line: 0, scope: !2681)
!2741 = !DILocation(line: 128, column: 15, scope: !2742)
!2742 = distinct !DILexicalBlock(scope: !2681, file: !9, line: 127, column: 5)
!2743 = !DILocation(line: 0, scope: !2489, inlinedAt: !2744)
!2744 = distinct !DILocation(line: 130, column: 15, scope: !2670)
!2745 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2744)
!2746 = !DILocalVariable(name: "this", arg: 1, scope: !2747, type: !2253, flags: DIFlagArtificial | DIFlagObjectPointer)
!2747 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !2240, file: !2239, line: 170, type: !2748, scopeLine: 171, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, declaration: !2750, retainedNodes: !2751)
!2748 = !DISubroutineType(types: !2749)
!2749 = !{!2244, !2246, !943}
!2750 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !2240, file: !2239, line: 170, type: !2748, scopeLine: 170, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2751 = !{!2746, !2752}
!2752 = !DILocalVariable(name: "__n", arg: 2, scope: !2747, file: !2239, line: 170, type: !943)
!2753 = !DILocation(line: 0, scope: !2747, inlinedAt: !2754)
!2754 = distinct !DILocation(line: 130, column: 56, scope: !2670)
!2755 = !DILocation(line: 171, column: 16, scope: !2747, inlinedAt: !2754)
!2756 = !DILocation(line: 0, scope: !2489, inlinedAt: !2757)
!2757 = distinct !DILocation(line: 131, column: 15, scope: !2670)
!2758 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2757)
!2759 = !DILocation(line: 0, scope: !2747, inlinedAt: !2760)
!2760 = distinct !DILocation(line: 131, column: 35, scope: !2670)
!2761 = !DILocation(line: 171, column: 16, scope: !2747, inlinedAt: !2760)
!2762 = !DILocation(line: 0, scope: !2238, inlinedAt: !2763)
!2763 = distinct !DILocation(line: 131, column: 49, scope: !2670)
!2764 = !DILocation(line: 0, scope: !2536, inlinedAt: !2765)
!2765 = distinct !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2763)
!2766 = !DILocation(line: 682, column: 29, scope: !2536, inlinedAt: !2765)
!2767 = !DILocation(line: 0, scope: !2547, inlinedAt: !2768)
!2768 = distinct !DILocation(line: 682, column: 34, scope: !2536, inlinedAt: !2765)
!2769 = !DILocation(line: 450, column: 30, scope: !2547, inlinedAt: !2768)
!2770 = !DILocation(line: 0, scope: !2573, inlinedAt: !2771)
!2771 = distinct !DILocation(line: 450, column: 16, scope: !2547, inlinedAt: !2768)
!2772 = !DILocation(line: 49, column: 12, scope: !2587, inlinedAt: !2771)
!2773 = !DILocation(line: 49, column: 11, scope: !2573, inlinedAt: !2771)
!2774 = !DILocation(line: 50, column: 2, scope: !2587, inlinedAt: !2771)
!2775 = !DILocation(line: 0, scope: !2591, inlinedAt: !2776)
!2776 = distinct !DILocation(line: 450, column: 40, scope: !2547, inlinedAt: !2768)
!2777 = !DILocation(line: 874, column: 6, scope: !2602, inlinedAt: !2776)
!2778 = !DILocation(line: 874, column: 6, scope: !2591, inlinedAt: !2776)
!2779 = !DILocation(line: 875, column: 11, scope: !2602, inlinedAt: !2776)
!2780 = !DILocation(line: 875, column: 4, scope: !2602, inlinedAt: !2776)
!2781 = !DILocation(line: 876, column: 8, scope: !2591, inlinedAt: !2776)
!2782 = !DILocation(line: 877, column: 15, scope: !2591, inlinedAt: !2776)
!2783 = !DILocation(line: 877, column: 2, scope: !2591, inlinedAt: !2776)
!2784 = !DILocation(line: 682, column: 25, scope: !2536, inlinedAt: !2765)
!2785 = !DILocation(line: 0, scope: !2614, inlinedAt: !2786)
!2786 = distinct !DILocation(line: 682, column: 14, scope: !2536, inlinedAt: !2765)
!2787 = !DILocation(line: 704, column: 19, scope: !2614, inlinedAt: !2786)
!2788 = !DILocation(line: 133, column: 27, scope: !2670)
!2789 = !DILocation(line: 0, scope: !2684)
!2790 = !DILocation(line: 136, column: 5, scope: !2684)
!2791 = !DILocation(line: 140, column: 25, scope: !2670)
!2792 = !DILocation(line: 0, scope: !2489, inlinedAt: !2793)
!2793 = distinct !DILocation(line: 142, column: 15, scope: !2670)
!2794 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2793)
!2795 = !DILocalVariable(name: "__lhs", arg: 1, scope: !2796, file: !334, line: 961, type: !2799)
!2796 = distinct !DISubprogram(name: "operator-<std::chrono::_V2::system_clock, std::chrono::duration<long, std::ratio<1L, 1000000000L> >, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", linkageName: "_ZNSt6chronomiINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE", scope: !335, file: !334, line: 961, type: !2797, scopeLine: 963, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, templateParams: !2802, retainedNodes: !2800)
!2797 = !DISubroutineType(types: !2798)
!2798 = !{!501, !2799, !2799}
!2799 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !534, size: 64)
!2800 = !{!2795, !2801}
!2801 = !DILocalVariable(name: "__rhs", arg: 2, scope: !2796, file: !334, line: 962, type: !2799)
!2802 = !{!545, !2803, !2804}
!2803 = !DITemplateTypeParameter(name: "_Dur1", type: !413)
!2804 = !DITemplateTypeParameter(name: "_Dur2", type: !413)
!2805 = !DILocation(line: 0, scope: !2796, inlinedAt: !2806)
!2806 = distinct !DILocation(line: 142, column: 49, scope: !2670)
!2807 = !DILocation(line: 0, scope: !498, inlinedAt: !2808)
!2808 = distinct !DILocation(line: 963, column: 41, scope: !2796, inlinedAt: !2806)
!2809 = !DILocation(line: 614, column: 34, scope: !498, inlinedAt: !2808)
!2810 = !DILocation(line: 0, scope: !402, inlinedAt: !2811)
!2811 = distinct !DILocation(line: 142, column: 66, scope: !2670)
!2812 = !DILocation(line: 669, column: 29, scope: !402, inlinedAt: !2811)
!2813 = !DILocation(line: 0, scope: !2479, inlinedAt: !2814)
!2814 = distinct !DILocation(line: 142, column: 31, scope: !2670)
!2815 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2814)
!2816 = !DILocation(line: 0, scope: !2489, inlinedAt: !2817)
!2817 = distinct !DILocation(line: 142, column: 97, scope: !2670)
!2818 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2817)
!2819 = !DILocation(line: 0, scope: !2238, inlinedAt: !2820)
!2820 = distinct !DILocation(line: 142, column: 113, scope: !2670)
!2821 = !DILocation(line: 0, scope: !2536, inlinedAt: !2822)
!2822 = distinct !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2820)
!2823 = !DILocation(line: 682, column: 29, scope: !2536, inlinedAt: !2822)
!2824 = !DILocation(line: 0, scope: !2547, inlinedAt: !2825)
!2825 = distinct !DILocation(line: 682, column: 34, scope: !2536, inlinedAt: !2822)
!2826 = !DILocation(line: 450, column: 30, scope: !2547, inlinedAt: !2825)
!2827 = !DILocation(line: 0, scope: !2573, inlinedAt: !2828)
!2828 = distinct !DILocation(line: 450, column: 16, scope: !2547, inlinedAt: !2825)
!2829 = !DILocation(line: 49, column: 12, scope: !2587, inlinedAt: !2828)
!2830 = !DILocation(line: 49, column: 11, scope: !2573, inlinedAt: !2828)
!2831 = !DILocation(line: 50, column: 2, scope: !2587, inlinedAt: !2828)
!2832 = !DILocation(line: 0, scope: !2591, inlinedAt: !2833)
!2833 = distinct !DILocation(line: 450, column: 40, scope: !2547, inlinedAt: !2825)
!2834 = !DILocation(line: 874, column: 6, scope: !2602, inlinedAt: !2833)
!2835 = !DILocation(line: 874, column: 6, scope: !2591, inlinedAt: !2833)
!2836 = !DILocation(line: 875, column: 11, scope: !2602, inlinedAt: !2833)
!2837 = !DILocation(line: 875, column: 4, scope: !2602, inlinedAt: !2833)
!2838 = !DILocation(line: 876, column: 8, scope: !2591, inlinedAt: !2833)
!2839 = !DILocation(line: 877, column: 15, scope: !2591, inlinedAt: !2833)
!2840 = !DILocation(line: 877, column: 2, scope: !2591, inlinedAt: !2833)
!2841 = !DILocation(line: 682, column: 25, scope: !2536, inlinedAt: !2822)
!2842 = !DILocation(line: 0, scope: !2614, inlinedAt: !2843)
!2843 = distinct !DILocation(line: 682, column: 14, scope: !2536, inlinedAt: !2822)
!2844 = !DILocation(line: 704, column: 19, scope: !2614, inlinedAt: !2843)
!2845 = !DILocation(line: 0, scope: !2489, inlinedAt: !2846)
!2846 = distinct !DILocation(line: 143, column: 15, scope: !2670)
!2847 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2846)
!2848 = !DILocation(line: 0, scope: !2479, inlinedAt: !2849)
!2849 = distinct !DILocation(line: 143, column: 50, scope: !2670)
!2850 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2849)
!2851 = !DILocation(line: 0, scope: !2489, inlinedAt: !2852)
!2852 = distinct !DILocation(line: 143, column: 76, scope: !2670)
!2853 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2852)
!2854 = !DILocation(line: 0, scope: !2479, inlinedAt: !2855)
!2855 = distinct !DILocation(line: 144, column: 52, scope: !2670)
!2856 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2855)
!2857 = !DILocation(line: 0, scope: !2489, inlinedAt: !2858)
!2858 = distinct !DILocation(line: 144, column: 80, scope: !2670)
!2859 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2858)
!2860 = !DILocation(line: 0, scope: !2479, inlinedAt: !2861)
!2861 = distinct !DILocation(line: 145, column: 57, scope: !2670)
!2862 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2861)
!2863 = !DILocation(line: 0, scope: !2489, inlinedAt: !2864)
!2864 = distinct !DILocation(line: 145, column: 90, scope: !2670)
!2865 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2864)
!2866 = !DILocation(line: 0, scope: !2238, inlinedAt: !2867)
!2867 = distinct !DILocation(line: 146, column: 15, scope: !2670)
!2868 = !DILocation(line: 0, scope: !2536, inlinedAt: !2869)
!2869 = distinct !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2867)
!2870 = !DILocation(line: 682, column: 29, scope: !2536, inlinedAt: !2869)
!2871 = !DILocation(line: 0, scope: !2547, inlinedAt: !2872)
!2872 = distinct !DILocation(line: 682, column: 34, scope: !2536, inlinedAt: !2869)
!2873 = !DILocation(line: 450, column: 30, scope: !2547, inlinedAt: !2872)
!2874 = !DILocation(line: 0, scope: !2573, inlinedAt: !2875)
!2875 = distinct !DILocation(line: 450, column: 16, scope: !2547, inlinedAt: !2872)
!2876 = !DILocation(line: 49, column: 12, scope: !2587, inlinedAt: !2875)
!2877 = !DILocation(line: 49, column: 11, scope: !2573, inlinedAt: !2875)
!2878 = !DILocation(line: 50, column: 2, scope: !2587, inlinedAt: !2875)
!2879 = !DILocation(line: 0, scope: !2591, inlinedAt: !2880)
!2880 = distinct !DILocation(line: 450, column: 40, scope: !2547, inlinedAt: !2872)
!2881 = !DILocation(line: 874, column: 6, scope: !2602, inlinedAt: !2880)
!2882 = !DILocation(line: 874, column: 6, scope: !2591, inlinedAt: !2880)
!2883 = !DILocation(line: 875, column: 11, scope: !2602, inlinedAt: !2880)
!2884 = !DILocation(line: 875, column: 4, scope: !2602, inlinedAt: !2880)
!2885 = !DILocation(line: 876, column: 8, scope: !2591, inlinedAt: !2880)
!2886 = !DILocation(line: 877, column: 15, scope: !2591, inlinedAt: !2880)
!2887 = !DILocation(line: 877, column: 2, scope: !2591, inlinedAt: !2880)
!2888 = !DILocation(line: 682, column: 25, scope: !2536, inlinedAt: !2869)
!2889 = !DILocation(line: 0, scope: !2614, inlinedAt: !2890)
!2890 = distinct !DILocation(line: 682, column: 14, scope: !2536, inlinedAt: !2869)
!2891 = !DILocation(line: 704, column: 19, scope: !2614, inlinedAt: !2890)
!2892 = !DILocation(line: 149, column: 28, scope: !2670)
!2893 = !DILocation(line: 157, column: 26, scope: !2670)
!2894 = !DILocation(line: 0, scope: !2489, inlinedAt: !2895)
!2895 = distinct !DILocation(line: 159, column: 15, scope: !2670)
!2896 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2895)
!2897 = !DILocation(line: 0, scope: !2796, inlinedAt: !2898)
!2898 = distinct !DILocation(line: 159, column: 51, scope: !2670)
!2899 = !DILocation(line: 0, scope: !498, inlinedAt: !2900)
!2900 = distinct !DILocation(line: 963, column: 41, scope: !2796, inlinedAt: !2898)
!2901 = !DILocation(line: 614, column: 34, scope: !498, inlinedAt: !2900)
!2902 = !DILocation(line: 0, scope: !402, inlinedAt: !2903)
!2903 = distinct !DILocation(line: 159, column: 69, scope: !2670)
!2904 = !DILocation(line: 669, column: 29, scope: !402, inlinedAt: !2903)
!2905 = !DILocation(line: 0, scope: !2479, inlinedAt: !2906)
!2906 = distinct !DILocation(line: 159, column: 32, scope: !2670)
!2907 = !DILocation(line: 167, column: 16, scope: !2479, inlinedAt: !2906)
!2908 = !DILocation(line: 0, scope: !2489, inlinedAt: !2909)
!2909 = distinct !DILocation(line: 159, column: 100, scope: !2670)
!2910 = !DILocation(line: 611, column: 2, scope: !2497, inlinedAt: !2909)
!2911 = !DILocation(line: 0, scope: !2238, inlinedAt: !2912)
!2912 = distinct !DILocation(line: 159, column: 116, scope: !2670)
!2913 = !DILocation(line: 0, scope: !2536, inlinedAt: !2914)
!2914 = distinct !DILocation(line: 113, column: 9, scope: !2238, inlinedAt: !2912)
!2915 = !DILocation(line: 682, column: 29, scope: !2536, inlinedAt: !2914)
!2916 = !DILocation(line: 0, scope: !2547, inlinedAt: !2917)
!2917 = distinct !DILocation(line: 682, column: 34, scope: !2536, inlinedAt: !2914)
!2918 = !DILocation(line: 450, column: 30, scope: !2547, inlinedAt: !2917)
!2919 = !DILocation(line: 0, scope: !2573, inlinedAt: !2920)
!2920 = distinct !DILocation(line: 450, column: 16, scope: !2547, inlinedAt: !2917)
!2921 = !DILocation(line: 49, column: 12, scope: !2587, inlinedAt: !2920)
!2922 = !DILocation(line: 49, column: 11, scope: !2573, inlinedAt: !2920)
!2923 = !DILocation(line: 137, column: 22, scope: !2924)
!2924 = distinct !DILexicalBlock(scope: !2684, file: !9, line: 136, column: 5)
!2925 = !DILocalVariable(name: "this", arg: 1, scope: !2926, type: !2929, flags: DIFlagArtificial | DIFlagObjectPointer)
!2926 = distinct !DISubprogram(name: "operator+=", linkageName: "_ZN10ClockTimespLERKS_", scope: !317, file: !9, line: 52, type: !327, scopeLine: 52, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !76, declaration: !326, retainedNodes: !2927)
!2927 = !{!2925, !2928}
!2928 = !DILocalVariable(name: "other", arg: 2, scope: !2926, file: !9, line: 52, type: !331)
!2929 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !317, size: 64)
!2930 = !DILocation(line: 0, scope: !2926, inlinedAt: !2931)
!2931 = distinct !DILocation(line: 137, column: 19, scope: !2924)
!2932 = !DILocation(line: 53, column: 31, scope: !2926, inlinedAt: !2931)
!2933 = !{!2627, !2400, i64 0}
!2934 = !DILocation(line: 53, column: 22, scope: !2926, inlinedAt: !2931)
!2935 = !DILocation(line: 54, column: 33, scope: !2926, inlinedAt: !2931)
!2936 = !{!2627, !2400, i64 8}
!2937 = !DILocation(line: 54, column: 24, scope: !2926, inlinedAt: !2931)
!2938 = !DILocation(line: 55, column: 38, scope: !2926, inlinedAt: !2931)
!2939 = !DILocation(line: 55, column: 29, scope: !2926, inlinedAt: !2931)
!2940 = !DILocation(line: 137, column: 7, scope: !2924)
!2941 = !DILocation(line: 136, column: 37, scope: !2924)
!2942 = !DILocation(line: 136, column: 23, scope: !2924)
!2943 = distinct !{!2943, !2790, !2944, !2664}
!2944 = !DILocation(line: 137, column: 59, scope: !2684)
!2945 = !DILocation(line: 50, column: 2, scope: !2587, inlinedAt: !2920)
!2946 = !DILocation(line: 0, scope: !2591, inlinedAt: !2947)
!2947 = distinct !DILocation(line: 450, column: 40, scope: !2547, inlinedAt: !2917)
!2948 = !DILocation(line: 874, column: 6, scope: !2602, inlinedAt: !2947)
!2949 = !DILocation(line: 874, column: 6, scope: !2591, inlinedAt: !2947)
!2950 = !DILocation(line: 875, column: 11, scope: !2602, inlinedAt: !2947)
!2951 = !DILocation(line: 875, column: 4, scope: !2602, inlinedAt: !2947)
!2952 = !DILocation(line: 876, column: 8, scope: !2591, inlinedAt: !2947)
!2953 = !DILocation(line: 877, column: 15, scope: !2591, inlinedAt: !2947)
!2954 = !DILocation(line: 877, column: 2, scope: !2591, inlinedAt: !2947)
!2955 = !DILocation(line: 682, column: 25, scope: !2536, inlinedAt: !2914)
!2956 = !DILocation(line: 0, scope: !2614, inlinedAt: !2957)
!2957 = distinct !DILocation(line: 682, column: 14, scope: !2536, inlinedAt: !2914)
!2958 = !DILocation(line: 704, column: 19, scope: !2614, inlinedAt: !2957)
!2959 = !DILocation(line: 166, column: 5, scope: !2670)
!2960 = !DILocation(line: 168, column: 5, scope: !2670)
!2961 = !DILocation(line: 170, column: 1, scope: !2670)
!2962 = !DILocation(line: 169, column: 5, scope: !2670)
!2963 = !DISubprogram(name: "hipDeviceGetAttribute", scope: !87, file: !87, line: 1546, type: !2964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !408)
!2964 = !DISubroutineType(types: !2965)
!2965 = !{!2227, !616, !2966, !291}
!2966 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipDeviceAttribute_t", file: !87, line: 460, baseType: !175)
!2967 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_clock_test.cpp", scope: !1580, file: !1580, type: !2968, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !76, retainedNodes: !408)
!2968 = !DISubroutineType(types: !408)
!2969 = !DILocation(line: 74, column: 25, scope: !2970, inlinedAt: !2972)
!2970 = !DILexicalBlockFile(scope: !2971, file: !3, discriminator: 0)
!2971 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1580, file: !1580, type: !935, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !76, retainedNodes: !408)
!2972 = distinct !DILocation(line: 0, scope: !2967)
!2973 = !DILocation(line: 0, scope: !2971, inlinedAt: !2972)

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
