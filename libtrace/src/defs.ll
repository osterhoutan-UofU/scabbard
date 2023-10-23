
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx1030
; ModuleID = 'defs.cpp'
; source_filename = "defs.cpp"
; target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
; target triple = "amdgcn-amd-amdhsa"

; %"struct.scabbard::trace::DeviceAsyncQueue" = type { [64 x %"struct.scabbard::trace::DeviceAsyncQueue::Lane"] }
; %"struct.scabbard::trace::DeviceAsyncQueue::Lane" = type { i64, [64 x %"struct.scabbard::trace::TraceData"] }
; %"struct.scabbard::trace::TraceData" = type { i64, i16, %"union.scabbard::trace::ThreadId", i8*, %"struct.scabbard::LocationMetadata", i64 }
; %"union.scabbard::trace::ThreadId" = type { %"class.std::thread::id", [8 x i8] }
; %"class.std::thread::id" = type { i64 }
; %"struct.scabbard::LocationMetadata" = type { i64, i32, i32 }

; @_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE = protected addrspace(1) externally_initialized global %"struct.scabbard::trace::DeviceAsyncQueue"* null, align 8, !dbg.def !0
; @llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%"struct.scabbard::trace::DeviceAsyncQueue"* addrspace(1)* @_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; !llvm.dbg.cu = !{!1}
; !llvm.dbg.retainedNodes = !{!1812}
; !llvm.module.flags = !{!1816, !1817, !1818, !1819}
; !opencl.ocl.version = !{!1820}
; !llvm.ident = !{!1821}

; !0 = distinct !DIFragment()
; !1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !31, imports: !141, splitDebugInlining: false, nameTableKind: None)
; !2 = !DIFile(filename: "defs.cpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "d57dcb2a2b8223f388dd4a233afecd74")
; !3 = !{!4}
; !4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "InstrData", scope: !6, file: !5, line: 48, baseType: !7, size: 16, elements: !12, identifier: "_ZTSN8scabbard9InstrDataE")
; !5 = !DIFile(filename: "../../lib/include/scabbard/Enums.hpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "12e708a2d3536bd7e99d885eeea9f1b3")
; !6 = !DINamespace(name: "scabbard", scope: null)
; !7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 25, baseType: !9)
; !8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
; !9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 40, baseType: !11)
; !10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
; !11 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
; !12 = !{!13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30}
; !13 = !DIEnumerator(name: "NEVER", value: 0, isUnsigned: true)
; !14 = !DIEnumerator(name: "NO", value: 0, isUnsigned: true)
; !15 = !DIEnumerator(name: "_RUNTIME_CONDITIONAL", value: 1, isUnsigned: true)
; !16 = !DIEnumerator(name: "ALWAYS", value: 12, isUnsigned: true)
; !17 = !DIEnumerator(name: "ON_DEVICE", value: 4, isUnsigned: true)
; !18 = !DIEnumerator(name: "ON_GPU", value: 4, isUnsigned: true)
; !19 = !DIEnumerator(name: "ON_HOST", value: 8, isUnsigned: true)
; !20 = !DIEnumerator(name: "ON_CPU", value: 8, isUnsigned: true)
; !21 = !DIEnumerator(name: "ALLOCATE", value: 16, isUnsigned: true)
; !22 = !DIEnumerator(name: "READ", value: 32, isUnsigned: true)
; !23 = !DIEnumerator(name: "FREE", value: 64, isUnsigned: true)
; !24 = !DIEnumerator(name: "WRITE", value: 128, isUnsigned: true)
; !25 = !DIEnumerator(name: "ATOMIC_MEM", value: 512, isUnsigned: true)
; !26 = !DIEnumerator(name: "MANAGED_MEM", value: 2048, isUnsigned: true)
; !27 = !DIEnumerator(name: "DEVICE_HEAP", value: 4096, isUnsigned: true)
; !28 = !DIEnumerator(name: "UNKNOWN_HEAP", value: 8192, isUnsigned: true)
; !29 = !DIEnumerator(name: "HOST_HEAP", value: 16384, isUnsigned: true)
; !30 = !DIEnumerator(name: "STEAM_SYNC", value: 32768, isUnsigned: true)
; !31 = !{!32, !79, !109, !111}
; !32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "TraceData", scope: !34, file: !33, line: 131, size: 512, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !35, identifier: "_ZTSN8scabbard5trace9TraceDataE")
; !33 = !DIFile(filename: "../../lib/include/scabbard/TraceData.hpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "7acec8d808c149520980a5f6126409a6")
; !34 = !DINamespace(name: "trace", scope: !6)
; !35 = !{!36, !42, !44, !47, !50, !62, !63, !67, !72, !88, !92, !99, !104, !108}
; !36 = !DIDerivedType(tag: DW_TAG_member, name: "time_stamp", scope: !32, file: !33, line: 134, baseType: !37, size: 64)
; !37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !38)
; !38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !40, file: !39, line: 298, baseType: !41)
; !39 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++config.h", directory: "", checksumkind: CSK_MD5, checksum: "c916ec3a412df0ab93f691620f696028")
; !40 = !DINamespace(name: "std", scope: null)
; !41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
; !42 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !32, file: !33, line: 135, baseType: !43, size: 16, offset: 64)
; !43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
; !44 = !DIDerivedType(tag: DW_TAG_member, name: "threadId", scope: !32, file: !33, line: 136, baseType: !45, size: 128, offset: 128)
; !45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !46)
; !46 = !DICompositeType(tag: DW_TAG_union_type, name: "ThreadId", scope: !34, file: !33, line: 104, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSN8scabbard5trace8ThreadIdE")
; !47 = !DIDerivedType(tag: DW_TAG_member, name: "ptr", scope: !32, file: !33, line: 137, baseType: !48, size: 64, offset: 256)
; !48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
; !49 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
; !50 = !DIDerivedType(tag: DW_TAG_member, name: "metadata", scope: !32, file: !33, line: 138, baseType: !51, size: 128, offset: 320)
; !51 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !52)
; !52 = !DIDerivedType(tag: DW_TAG_typedef, name: "LocMData_t", scope: !32, file: !33, line: 132, baseType: !53)
; !53 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LocationMetadata", scope: !6, file: !54, line: 21, size: 128, flags: DIFlagTypePassByValue, elements: !55, identifier: "_ZTSN8scabbard16LocationMetadataE")
; !54 = !DIFile(filename: "../../lib/include/scabbard/Metadata.hpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "2e390ef03f9efa5e49894078b397b667")
; !55 = !{!56, !57, !61}
; !56 = !DIDerivedType(tag: DW_TAG_member, name: "src_id", scope: !53, file: !54, line: 22, baseType: !38, size: 64)
; !57 = !DIDerivedType(tag: DW_TAG_member, name: "line", scope: !53, file: !54, line: 23, baseType: !58, size: 32, offset: 64)
; !58 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 26, baseType: !59)
; !59 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 42, baseType: !60)
; !60 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
; !61 = !DIDerivedType(tag: DW_TAG_member, name: "col", scope: !53, file: !54, line: 24, baseType: !58, size: 32, offset: 96)
; !62 = !DIDerivedType(tag: DW_TAG_member, name: "_OPT_DATA", scope: !32, file: !33, line: 139, baseType: !37, size: 64, offset: 448)
; !63 = !DISubprogram(name: "TraceData", scope: !32, file: !33, line: 145, type: !64, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !64 = !DISubroutineType(types: !65)
; !65 = !{null, !66}
; !66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
; !67 = !DISubprogram(name: "TraceData", scope: !32, file: !33, line: 149, type: !68, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !68 = !DISubroutineType(types: !69)
; !69 = !{null, !66, !70}
; !70 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !71, size: 64)
; !71 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
; !72 = !DISubprogram(name: "TraceData", scope: !32, file: !33, line: 156, type: !73, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !73 = !DISubroutineType(types: !74)
; !74 = !{null, !66, !37, !4, !75, !76, !48, !37, !58, !58, !37}
; !75 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !76, size: 64)
; !76 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !77)
; !77 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !78, line: 941, baseType: !79)
; !78 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "7560f6d8bd7c5ac736ef5dfcbc59d092")
; !79 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !78, line: 934, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !80, identifier: "_ZTS4dim3")
; !80 = !{!81, !82, !83, !84}
; !81 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !79, file: !78, line: 935, baseType: !58, size: 32)
; !82 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !79, file: !78, line: 936, baseType: !58, size: 32, offset: 32)
; !83 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !79, file: !78, line: 937, baseType: !58, size: 32, offset: 64)
; !84 = !DISubprogram(name: "dim3", scope: !79, file: !78, line: 939, type: !85, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !85 = !DISubroutineType(types: !86)
; !86 = !{null, !87, !58, !58, !58}
; !87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
; !88 = !DISubprogram(name: "TraceData", scope: !32, file: !33, line: 165, type: !89, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !89 = !DISubroutineType(types: !90)
; !90 = !{null, !66, !4, !48, !91, !38}
; !91 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !51, size: 64)
; !92 = !DISubprogram(name: "TraceData", scope: !32, file: !33, line: 171, type: !93, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !93 = !DISubroutineType(types: !94)
; !94 = !{null, !66, !95, !4, !97, !98, !91, !38}
; !95 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !96, line: 46, baseType: !41)
; !96 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
; !97 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !45, size: 64)
; !98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
; !99 = !DISubprogram(name: "empty", linkageName: "_ZNK8scabbard5trace9TraceData5emptyEv", scope: !32, file: !33, line: 179, type: !100, scopeLine: 179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !100 = !DISubroutineType(types: !101)
; !101 = !{!102, !103}
; !102 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
; !103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
; !104 = !DISubprogram(name: "operator=", linkageName: "_ZN8scabbard5trace9TraceDataaSERKS1_", scope: !32, file: !33, line: 184, type: !105, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !105 = !DISubroutineType(types: !106)
; !106 = !{!107, !66, !70}
; !107 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !32, size: 64)
; !108 = !DISubprogram(name: "operator bool", linkageName: "_ZNK8scabbard5trace9TraceDatacvbEv", scope: !32, file: !33, line: 188, type: !100, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !109 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Lane", scope: !111, file: !110, line: 51, size: 32832, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !128, identifier: "_ZTSN8scabbard5trace16DeviceAsyncQueue4LaneE")
; !110 = !DIFile(filename: "../include/scabbard/trace/AsyncQueue.hpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "d6c1a17d8fe734e39a4c3ba4fd5c6da4")
; !111 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "DeviceAsyncQueue", scope: !34, file: !110, line: 50, size: 2101248, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !112, identifier: "_ZTSN8scabbard5trace16DeviceAsyncQueueE")
; !112 = !{!113, !117, !121}
; !113 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !111, file: !110, line: 60, baseType: !114, size: 2101248, flags: DIFlagPrivate)
; !114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !109, size: 2101248, elements: !115)
; !115 = !{!116}
; !116 = !DISubrange(count: 64)
; !117 = !DISubprogram(name: "DeviceAsyncQueue", scope: !111, file: !110, line: 63, type: !118, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !118 = !DISubroutineType(types: !119)
; !119 = !{null, !120}
; !120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
; !121 = !DISubprogram(name: "operator[]", linkageName: "_ZNK8scabbard5trace16DeviceAsyncQueueixEm", scope: !111, file: !110, line: 66, type: !122, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !122 = !DISubroutineType(types: !123)
; !123 = !{!124, !126, !95}
; !124 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !125, size: 64)
; !125 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !109)
; !126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
; !127 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !111)
; !128 = !{!129, !131, !133, !137}
; !129 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !109, file: !110, line: 52, baseType: !130, size: 64)
; !130 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !95)
; !131 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !109, file: !110, line: 53, baseType: !132, size: 32768, offset: 64)
; !132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 32768, elements: !115)
; !133 = !DISubprogram(name: "Lane", scope: !109, file: !110, line: 54, type: !134, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !134 = !DISubroutineType(types: !135)
; !135 = !{null, !136}
; !136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
; !137 = !DISubprogram(name: "operator[]", linkageName: "_ZNK8scabbard5trace16DeviceAsyncQueue4LaneixEm", scope: !109, file: !110, line: 56, type: !138, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !138 = !DISubroutineType(types: !139)
; !139 = !{!70, !140, !95}
; !140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
; !141 = !{!142, !149, !156, !158, !160, !164, !166, !168, !170, !172, !174, !176, !178, !183, !187, !189, !191, !196, !198, !200, !202, !204, !206, !208, !211, !214, !216, !220, !225, !227, !229, !231, !233, !235, !237, !239, !241, !243, !245, !249, !253, !255, !257, !259, !261, !263, !265, !267, !269, !271, !273, !275, !277, !279, !281, !283, !287, !291, !295, !297, !299, !301, !303, !305, !307, !309, !311, !313, !317, !321, !325, !327, !329, !331, !336, !340, !344, !346, !348, !350, !352, !354, !356, !358, !360, !362, !364, !366, !368, !373, !377, !381, !383, !385, !387, !394, !398, !402, !404, !406, !408, !410, !412, !414, !418, !422, !424, !426, !428, !430, !434, !438, !442, !444, !446, !448, !450, !452, !454, !458, !462, !466, !468, !472, !476, !478, !480, !482, !484, !486, !488, !492, !496, !502, !506, !510, !515, !517, !520, !524, !528, !537, !539, !543, !547, !551, !556, !560, !564, !568, !572, !580, !584, !588, !590, !594, !598, !602, !608, !612, !616, !618, !626, !630, !637, !639, !643, !647, !651, !655, !660, !664, !668, !669, !670, !671, !673, !674, !675, !676, !677, !678, !679, !681, !682, !683, !684, !685, !686, !687, !689, !690, !691, !692, !693, !694, !695, !696, !697, !698, !699, !700, !701, !702, !703, !704, !705, !706, !707, !708, !709, !710, !711, !712, !713, !716, !718, !720, !722, !724, !726, !728, !730, !732, !734, !736, !738, !740, !742, !744, !746, !748, !750, !752, !754, !756, !758, !760, !762, !764, !766, !770, !772, !774, !778, !782, !784, !786, !788, !790, !792, !794, !796, !798, !800, !802, !804, !806, !808, !810, !812, !814, !816, !818, !820, !822, !824, !829, !831, !833, !835, !837, !839, !841, !843, !845, !847, !849, !851, !853, !855, !857, !859, !861, !863, !865, !867, !871, !873, !875, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !897, !899, !901, !903, !905, !907, !909, !911, !913, !915, !917, !919, !921, !923, !925, !927, !929, !931, !933, !935, !937, !939, !941, !943, !945, !947, !949, !951, !953, !955, !957, !959, !961, !963, !965, !967, !969, !971, !973, !975, !977, !979, !983, !987, !1004, !1007, !1012, !1069, !1074, !1078, !1082, !1086, !1090, !1092, !1094, !1098, !1104, !1108, !1114, !1120, !1122, !1126, !1130, !1134, !1138, !1146, !1148, !1152, !1156, !1160, !1162, !1166, !1170, !1174, !1176, !1178, !1182, !1190, !1194, !1198, !1202, !1204, !1210, !1212, !1218, !1222, !1226, !1230, !1234, !1238, !1242, !1244, !1246, !1250, !1254, !1258, !1260, !1264, !1268, !1270, !1272, !1276, !1280, !1284, !1288, !1289, !1290, !1291, !1292, !1293, !1294, !1295, !1296, !1297, !1298, !1303, !1307, !1310, !1313, !1316, !1318, !1320, !1322, !1325, !1328, !1331, !1334, !1337, !1339, !1343, !1344, !1345, !1348, !1350, !1352, !1354, !1356, !1359, !1362, !1365, !1368, !1371, !1373, !1377, !1381, !1386, !1390, !1392, !1394, !1396, !1398, !1400, !1402, !1404, !1406, !1408, !1410, !1412, !1414, !1416, !1420, !1426, !1431, !1435, !1437, !1439, !1441, !1443, !1450, !1454, !1458, !1462, !1466, !1470, !1475, !1479, !1481, !1485, !1491, !1495, !1500, !1502, !1505, !1509, !1513, !1515, !1517, !1519, !1521, !1525, !1527, !1529, !1533, !1537, !1541, !1545, !1549, !1553, !1555, !1559, !1563, !1567, !1571, !1573, !1575, !1579, !1583, !1584, !1585, !1586, !1587, !1588, !1594, !1597, !1598, !1600, !1602, !1604, !1606, !1610, !1612, !1614, !1616, !1618, !1620, !1622, !1624, !1626, !1630, !1634, !1636, !1640, !1644, !1649, !1653, !1654, !1659, !1663, !1668, !1673, !1677, !1683, !1687, !1689, !1693, !1700, !1705, !1710, !1716, !1720, !1725, !1727, !1731, !1735, !1737, !1739, !1741, !1745, !1749, !1753, !1757, !1761, !1763, !1765, !1767, !1771, !1775, !1779, !1781, !1783, !1788, !1792, !1796, !1800, !1804, !1808}
; !142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !143, file: !148, line: 52)
; !143 = !DISubprogram(name: "abs", scope: !144, file: !144, line: 848, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !144 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
; !145 = !DISubroutineType(types: !146)
; !146 = !{!147, !147}
; !147 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
; !148 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/std_abs.h", directory: "")
; !149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !150, file: !155, line: 83)
; !150 = !DISubprogram(name: "acos", scope: !151, file: !151, line: 53, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !151 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "8c6e2d0d2bda65bc5ba1ca02b65383b7")
; !152 = !DISubroutineType(types: !153)
; !153 = !{!154, !154}
; !154 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
; !155 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cmath", directory: "")
; !156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !157, file: !155, line: 102)
; !157 = !DISubprogram(name: "asin", scope: !151, file: !151, line: 55, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !159, file: !155, line: 121)
; !159 = !DISubprogram(name: "atan", scope: !151, file: !151, line: 57, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !161, file: !155, line: 140)
; !161 = !DISubprogram(name: "atan2", scope: !151, file: !151, line: 59, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !162 = !DISubroutineType(types: !163)
; !163 = !{!154, !154, !154}
; !164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !165, file: !155, line: 161)
; !165 = !DISubprogram(name: "ceil", scope: !151, file: !151, line: 159, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !167, file: !155, line: 180)
; !167 = !DISubprogram(name: "cos", scope: !151, file: !151, line: 62, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !169, file: !155, line: 199)
; !169 = !DISubprogram(name: "cosh", scope: !151, file: !151, line: 71, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !171, file: !155, line: 218)
; !171 = !DISubprogram(name: "exp", scope: !151, file: !151, line: 95, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !173, file: !155, line: 237)
; !173 = !DISubprogram(name: "fabs", scope: !151, file: !151, line: 162, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !175, file: !155, line: 256)
; !175 = !DISubprogram(name: "floor", scope: !151, file: !151, line: 165, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !177, file: !155, line: 275)
; !177 = !DISubprogram(name: "fmod", scope: !151, file: !151, line: 168, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !179, file: !155, line: 296)
; !179 = !DISubprogram(name: "frexp", scope: !151, file: !151, line: 98, type: !180, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !180 = !DISubroutineType(types: !181)
; !181 = !{!154, !154, !182}
; !182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
; !183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !184, file: !155, line: 315)
; !184 = !DISubprogram(name: "ldexp", scope: !151, file: !151, line: 101, type: !185, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !185 = !DISubroutineType(types: !186)
; !186 = !{!154, !154, !147}
; !187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !188, file: !155, line: 334)
; !188 = !DISubprogram(name: "log", scope: !151, file: !151, line: 104, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !190, file: !155, line: 353)
; !190 = !DISubprogram(name: "log10", scope: !151, file: !151, line: 107, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !192, file: !155, line: 372)
; !192 = !DISubprogram(name: "modf", scope: !151, file: !151, line: 110, type: !193, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !193 = !DISubroutineType(types: !194)
; !194 = !{!154, !154, !195}
; !195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
; !196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !197, file: !155, line: 384)
; !197 = !DISubprogram(name: "pow", scope: !151, file: !151, line: 140, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !199, file: !155, line: 421)
; !199 = !DISubprogram(name: "sin", scope: !151, file: !151, line: 64, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !201, file: !155, line: 440)
; !201 = !DISubprogram(name: "sinh", scope: !151, file: !151, line: 73, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !203, file: !155, line: 459)
; !203 = !DISubprogram(name: "sqrt", scope: !151, file: !151, line: 143, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !205, file: !155, line: 478)
; !205 = !DISubprogram(name: "tan", scope: !151, file: !151, line: 66, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !207, file: !155, line: 497)
; !207 = !DISubprogram(name: "tanh", scope: !151, file: !151, line: 75, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !209, file: !155, line: 1065)
; !209 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !210, line: 164, baseType: !154)
; !210 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "f3450d1d586f704597de1a1b2bed18f3")
; !211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !212, file: !155, line: 1066)
; !212 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !210, line: 163, baseType: !213)
; !213 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
; !214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !215, file: !155, line: 1069)
; !215 = !DISubprogram(name: "acosh", scope: !151, file: !151, line: 85, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !217, file: !155, line: 1070)
; !217 = !DISubprogram(name: "acoshf", scope: !151, file: !151, line: 85, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !218 = !DISubroutineType(types: !219)
; !219 = !{!213, !213}
; !220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !221, file: !155, line: 1071)
; !221 = !DISubprogram(name: "acoshl", scope: !151, file: !151, line: 85, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !222 = !DISubroutineType(types: !223)
; !223 = !{!224, !224}
; !224 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
; !225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !226, file: !155, line: 1073)
; !226 = !DISubprogram(name: "asinh", scope: !151, file: !151, line: 87, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !228, file: !155, line: 1074)
; !228 = !DISubprogram(name: "asinhf", scope: !151, file: !151, line: 87, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !230, file: !155, line: 1075)
; !230 = !DISubprogram(name: "asinhl", scope: !151, file: !151, line: 87, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !232, file: !155, line: 1077)
; !232 = !DISubprogram(name: "atanh", scope: !151, file: !151, line: 89, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !234, file: !155, line: 1078)
; !234 = !DISubprogram(name: "atanhf", scope: !151, file: !151, line: 89, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !236, file: !155, line: 1079)
; !236 = !DISubprogram(name: "atanhl", scope: !151, file: !151, line: 89, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !238, file: !155, line: 1081)
; !238 = !DISubprogram(name: "cbrt", scope: !151, file: !151, line: 152, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !240, file: !155, line: 1082)
; !240 = !DISubprogram(name: "cbrtf", scope: !151, file: !151, line: 152, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !242, file: !155, line: 1083)
; !242 = !DISubprogram(name: "cbrtl", scope: !151, file: !151, line: 152, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !244, file: !155, line: 1085)
; !244 = !DISubprogram(name: "copysign", scope: !151, file: !151, line: 198, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !246, file: !155, line: 1086)
; !246 = !DISubprogram(name: "copysignf", scope: !151, file: !151, line: 198, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !247 = !DISubroutineType(types: !248)
; !248 = !{!213, !213, !213}
; !249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !250, file: !155, line: 1087)
; !250 = !DISubprogram(name: "copysignl", scope: !151, file: !151, line: 198, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !251 = !DISubroutineType(types: !252)
; !252 = !{!224, !224, !224}
; !253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !254, file: !155, line: 1089)
; !254 = !DISubprogram(name: "erf", scope: !151, file: !151, line: 231, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !256, file: !155, line: 1090)
; !256 = !DISubprogram(name: "erff", scope: !151, file: !151, line: 231, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !258, file: !155, line: 1091)
; !258 = !DISubprogram(name: "erfl", scope: !151, file: !151, line: 231, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !260, file: !155, line: 1093)
; !260 = !DISubprogram(name: "erfc", scope: !151, file: !151, line: 232, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !262, file: !155, line: 1094)
; !262 = !DISubprogram(name: "erfcf", scope: !151, file: !151, line: 232, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !264, file: !155, line: 1095)
; !264 = !DISubprogram(name: "erfcl", scope: !151, file: !151, line: 232, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !266, file: !155, line: 1097)
; !266 = !DISubprogram(name: "exp2", scope: !151, file: !151, line: 130, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !268, file: !155, line: 1098)
; !268 = !DISubprogram(name: "exp2f", scope: !151, file: !151, line: 130, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !270, file: !155, line: 1099)
; !270 = !DISubprogram(name: "exp2l", scope: !151, file: !151, line: 130, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !272, file: !155, line: 1101)
; !272 = !DISubprogram(name: "expm1", scope: !151, file: !151, line: 119, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !274, file: !155, line: 1102)
; !274 = !DISubprogram(name: "expm1f", scope: !151, file: !151, line: 119, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !276, file: !155, line: 1103)
; !276 = !DISubprogram(name: "expm1l", scope: !151, file: !151, line: 119, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !278, file: !155, line: 1105)
; !278 = !DISubprogram(name: "fdim", scope: !151, file: !151, line: 329, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !280, file: !155, line: 1106)
; !280 = !DISubprogram(name: "fdimf", scope: !151, file: !151, line: 329, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !282, file: !155, line: 1107)
; !282 = !DISubprogram(name: "fdiml", scope: !151, file: !151, line: 329, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !284, file: !155, line: 1109)
; !284 = !DISubprogram(name: "fma", scope: !151, file: !151, line: 340, type: !285, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !285 = !DISubroutineType(types: !286)
; !286 = !{!154, !154, !154, !154}
; !287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !288, file: !155, line: 1110)
; !288 = !DISubprogram(name: "fmaf", scope: !151, file: !151, line: 340, type: !289, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !289 = !DISubroutineType(types: !290)
; !290 = !{!213, !213, !213, !213}
; !291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !292, file: !155, line: 1111)
; !292 = !DISubprogram(name: "fmal", scope: !151, file: !151, line: 340, type: !293, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !293 = !DISubroutineType(types: !294)
; !294 = !{!224, !224, !224, !224}
; !295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !296, file: !155, line: 1113)
; !296 = !DISubprogram(name: "fmax", scope: !151, file: !151, line: 333, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !298, file: !155, line: 1114)
; !298 = !DISubprogram(name: "fmaxf", scope: !151, file: !151, line: 333, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !300, file: !155, line: 1115)
; !300 = !DISubprogram(name: "fmaxl", scope: !151, file: !151, line: 333, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !302, file: !155, line: 1117)
; !302 = !DISubprogram(name: "fmin", scope: !151, file: !151, line: 336, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !304, file: !155, line: 1118)
; !304 = !DISubprogram(name: "fminf", scope: !151, file: !151, line: 336, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !306, file: !155, line: 1119)
; !306 = !DISubprogram(name: "fminl", scope: !151, file: !151, line: 336, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !308, file: !155, line: 1121)
; !308 = !DISubprogram(name: "hypot", scope: !151, file: !151, line: 147, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !310, file: !155, line: 1122)
; !310 = !DISubprogram(name: "hypotf", scope: !151, file: !151, line: 147, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !312, file: !155, line: 1123)
; !312 = !DISubprogram(name: "hypotl", scope: !151, file: !151, line: 147, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !314, file: !155, line: 1125)
; !314 = !DISubprogram(name: "ilogb", scope: !151, file: !151, line: 283, type: !315, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !315 = !DISubroutineType(types: !316)
; !316 = !{!147, !154}
; !317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !318, file: !155, line: 1126)
; !318 = !DISubprogram(name: "ilogbf", scope: !151, file: !151, line: 283, type: !319, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !319 = !DISubroutineType(types: !320)
; !320 = !{!147, !213}
; !321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !322, file: !155, line: 1127)
; !322 = !DISubprogram(name: "ilogbl", scope: !151, file: !151, line: 283, type: !323, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !323 = !DISubroutineType(types: !324)
; !324 = !{!147, !224}
; !325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !326, file: !155, line: 1129)
; !326 = !DISubprogram(name: "lgamma", scope: !151, file: !151, line: 233, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !328, file: !155, line: 1130)
; !328 = !DISubprogram(name: "lgammaf", scope: !151, file: !151, line: 233, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !330, file: !155, line: 1131)
; !330 = !DISubprogram(name: "lgammal", scope: !151, file: !151, line: 233, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !332, file: !155, line: 1134)
; !332 = !DISubprogram(name: "llrint", scope: !151, file: !151, line: 319, type: !333, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !333 = !DISubroutineType(types: !334)
; !334 = !{!335, !154}
; !335 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
; !336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !337, file: !155, line: 1135)
; !337 = !DISubprogram(name: "llrintf", scope: !151, file: !151, line: 319, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !338 = !DISubroutineType(types: !339)
; !339 = !{!335, !213}
; !340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !341, file: !155, line: 1136)
; !341 = !DISubprogram(name: "llrintl", scope: !151, file: !151, line: 319, type: !342, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !342 = !DISubroutineType(types: !343)
; !343 = !{!335, !224}
; !344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !345, file: !155, line: 1138)
; !345 = !DISubprogram(name: "llround", scope: !151, file: !151, line: 325, type: !333, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !347, file: !155, line: 1139)
; !347 = !DISubprogram(name: "llroundf", scope: !151, file: !151, line: 325, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !349, file: !155, line: 1140)
; !349 = !DISubprogram(name: "llroundl", scope: !151, file: !151, line: 325, type: !342, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !351, file: !155, line: 1143)
; !351 = !DISubprogram(name: "log1p", scope: !151, file: !151, line: 122, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !353, file: !155, line: 1144)
; !353 = !DISubprogram(name: "log1pf", scope: !151, file: !151, line: 122, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !355, file: !155, line: 1145)
; !355 = !DISubprogram(name: "log1pl", scope: !151, file: !151, line: 122, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !357, file: !155, line: 1147)
; !357 = !DISubprogram(name: "log2", scope: !151, file: !151, line: 133, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !359, file: !155, line: 1148)
; !359 = !DISubprogram(name: "log2f", scope: !151, file: !151, line: 133, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !361, file: !155, line: 1149)
; !361 = !DISubprogram(name: "log2l", scope: !151, file: !151, line: 133, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !363, file: !155, line: 1151)
; !363 = !DISubprogram(name: "logb", scope: !151, file: !151, line: 125, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !365, file: !155, line: 1152)
; !365 = !DISubprogram(name: "logbf", scope: !151, file: !151, line: 125, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !367, file: !155, line: 1153)
; !367 = !DISubprogram(name: "logbl", scope: !151, file: !151, line: 125, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !369, file: !155, line: 1155)
; !369 = !DISubprogram(name: "lrint", scope: !151, file: !151, line: 317, type: !370, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !370 = !DISubroutineType(types: !371)
; !371 = !{!372, !154}
; !372 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
; !373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !374, file: !155, line: 1156)
; !374 = !DISubprogram(name: "lrintf", scope: !151, file: !151, line: 317, type: !375, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !375 = !DISubroutineType(types: !376)
; !376 = !{!372, !213}
; !377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !378, file: !155, line: 1157)
; !378 = !DISubprogram(name: "lrintl", scope: !151, file: !151, line: 317, type: !379, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !379 = !DISubroutineType(types: !380)
; !380 = !{!372, !224}
; !381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !382, file: !155, line: 1159)
; !382 = !DISubprogram(name: "lround", scope: !151, file: !151, line: 323, type: !370, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !384, file: !155, line: 1160)
; !384 = !DISubprogram(name: "lroundf", scope: !151, file: !151, line: 323, type: !375, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !386, file: !155, line: 1161)
; !386 = !DISubprogram(name: "lroundl", scope: !151, file: !151, line: 323, type: !379, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !388, file: !155, line: 1163)
; !388 = !DISubprogram(name: "nan", scope: !151, file: !151, line: 203, type: !389, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !389 = !DISubroutineType(types: !390)
; !390 = !{!154, !391}
; !391 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !392, size: 64)
; !392 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !393)
; !393 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
; !394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !395, file: !155, line: 1164)
; !395 = !DISubprogram(name: "nanf", scope: !151, file: !151, line: 203, type: !396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !396 = !DISubroutineType(types: !397)
; !397 = !{!213, !391}
; !398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !399, file: !155, line: 1165)
; !399 = !DISubprogram(name: "nanl", scope: !151, file: !151, line: 203, type: !400, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !400 = !DISubroutineType(types: !401)
; !401 = !{!224, !391}
; !402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !403, file: !155, line: 1167)
; !403 = !DISubprogram(name: "nearbyint", scope: !151, file: !151, line: 297, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !405, file: !155, line: 1168)
; !405 = !DISubprogram(name: "nearbyintf", scope: !151, file: !151, line: 297, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !407, file: !155, line: 1169)
; !407 = !DISubprogram(name: "nearbyintl", scope: !151, file: !151, line: 297, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !409, file: !155, line: 1171)
; !409 = !DISubprogram(name: "nextafter", scope: !151, file: !151, line: 262, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !411, file: !155, line: 1172)
; !411 = !DISubprogram(name: "nextafterf", scope: !151, file: !151, line: 262, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !413, file: !155, line: 1173)
; !413 = !DISubprogram(name: "nextafterl", scope: !151, file: !151, line: 262, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !415, file: !155, line: 1175)
; !415 = !DISubprogram(name: "nexttoward", scope: !151, file: !151, line: 264, type: !416, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !416 = !DISubroutineType(types: !417)
; !417 = !{!154, !154, !224}
; !418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !419, file: !155, line: 1176)
; !419 = !DISubprogram(name: "nexttowardf", scope: !151, file: !151, line: 264, type: !420, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !420 = !DISubroutineType(types: !421)
; !421 = !{!213, !213, !224}
; !422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !423, file: !155, line: 1177)
; !423 = !DISubprogram(name: "nexttowardl", scope: !151, file: !151, line: 264, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !425, file: !155, line: 1179)
; !425 = !DISubprogram(name: "remainder", scope: !151, file: !151, line: 275, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !427, file: !155, line: 1180)
; !427 = !DISubprogram(name: "remainderf", scope: !151, file: !151, line: 275, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !429, file: !155, line: 1181)
; !429 = !DISubprogram(name: "remainderl", scope: !151, file: !151, line: 275, type: !251, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !431, file: !155, line: 1183)
; !431 = !DISubprogram(name: "remquo", scope: !151, file: !151, line: 310, type: !432, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !432 = !DISubroutineType(types: !433)
; !433 = !{!154, !154, !154, !182}
; !434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !435, file: !155, line: 1184)
; !435 = !DISubprogram(name: "remquof", scope: !151, file: !151, line: 310, type: !436, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !436 = !DISubroutineType(types: !437)
; !437 = !{!213, !213, !213, !182}
; !438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !439, file: !155, line: 1185)
; !439 = !DISubprogram(name: "remquol", scope: !151, file: !151, line: 310, type: !440, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !440 = !DISubroutineType(types: !441)
; !441 = !{!224, !224, !224, !182}
; !442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !443, file: !155, line: 1187)
; !443 = !DISubprogram(name: "rint", scope: !151, file: !151, line: 259, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !445, file: !155, line: 1188)
; !445 = !DISubprogram(name: "rintf", scope: !151, file: !151, line: 259, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !447, file: !155, line: 1189)
; !447 = !DISubprogram(name: "rintl", scope: !151, file: !151, line: 259, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !449, file: !155, line: 1191)
; !449 = !DISubprogram(name: "round", scope: !151, file: !151, line: 301, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !451, file: !155, line: 1192)
; !451 = !DISubprogram(name: "roundf", scope: !151, file: !151, line: 301, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !453, file: !155, line: 1193)
; !453 = !DISubprogram(name: "roundl", scope: !151, file: !151, line: 301, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !455, file: !155, line: 1195)
; !455 = !DISubprogram(name: "scalbln", scope: !151, file: !151, line: 293, type: !456, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !456 = !DISubroutineType(types: !457)
; !457 = !{!154, !154, !372}
; !458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !459, file: !155, line: 1196)
; !459 = !DISubprogram(name: "scalblnf", scope: !151, file: !151, line: 293, type: !460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !460 = !DISubroutineType(types: !461)
; !461 = !{!213, !213, !372}
; !462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !463, file: !155, line: 1197)
; !463 = !DISubprogram(name: "scalblnl", scope: !151, file: !151, line: 293, type: !464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !464 = !DISubroutineType(types: !465)
; !465 = !{!224, !224, !372}
; !466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !467, file: !155, line: 1199)
; !467 = !DISubprogram(name: "scalbn", scope: !151, file: !151, line: 279, type: !185, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !469, file: !155, line: 1200)
; !469 = !DISubprogram(name: "scalbnf", scope: !151, file: !151, line: 279, type: !470, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !470 = !DISubroutineType(types: !471)
; !471 = !{!213, !213, !147}
; !472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !473, file: !155, line: 1201)
; !473 = !DISubprogram(name: "scalbnl", scope: !151, file: !151, line: 279, type: !474, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !474 = !DISubroutineType(types: !475)
; !475 = !{!224, !224, !147}
; !476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !477, file: !155, line: 1203)
; !477 = !DISubprogram(name: "tgamma", scope: !151, file: !151, line: 238, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !479, file: !155, line: 1204)
; !479 = !DISubprogram(name: "tgammaf", scope: !151, file: !151, line: 238, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !481, file: !155, line: 1205)
; !481 = !DISubprogram(name: "tgammal", scope: !151, file: !151, line: 238, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !483, file: !155, line: 1207)
; !483 = !DISubprogram(name: "trunc", scope: !151, file: !151, line: 305, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !485, file: !155, line: 1208)
; !485 = !DISubprogram(name: "truncf", scope: !151, file: !151, line: 305, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !487, file: !155, line: 1209)
; !487 = !DISubprogram(name: "truncl", scope: !151, file: !151, line: 305, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !488 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !489, entity: !490, file: !491, line: 58)
; !489 = !DINamespace(name: "__gnu_debug", scope: null)
; !490 = !DINamespace(name: "__debug", scope: !40)
; !491 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "09fce61e0085ea92b4bd81d6cd4dcc16")
; !492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !493, file: !495, line: 127)
; !493 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !144, line: 63, baseType: !494)
; !494 = !DICompositeType(tag: DW_TAG_structure_type, file: !144, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
; !495 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdlib", directory: "")
; !496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !497, file: !495, line: 128)
; !497 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !144, line: 71, baseType: !498)
; !498 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !144, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !499, identifier: "_ZTS6ldiv_t")
; !499 = !{!500, !501}
; !500 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !498, file: !144, line: 69, baseType: !372, size: 64)
; !501 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !498, file: !144, line: 70, baseType: !372, size: 64, offset: 64)
; !502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !503, file: !495, line: 130)
; !503 = !DISubprogram(name: "abort", scope: !144, file: !144, line: 598, type: !504, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
; !504 = !DISubroutineType(types: !505)
; !505 = !{null}
; !506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !507, file: !495, line: 132)
; !507 = !DISubprogram(name: "aligned_alloc", scope: !144, file: !144, line: 592, type: !508, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !508 = !DISubroutineType(types: !509)
; !509 = !{!98, !95, !95}
; !510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !511, file: !495, line: 134)
; !511 = !DISubprogram(name: "atexit", scope: !144, file: !144, line: 602, type: !512, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !512 = !DISubroutineType(types: !513)
; !513 = !{!147, !514}
; !514 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !504, size: 64)
; !515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !516, file: !495, line: 137)
; !516 = !DISubprogram(name: "at_quick_exit", scope: !144, file: !144, line: 607, type: !512, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !518, file: !495, line: 140)
; !518 = !DISubprogram(name: "atof", scope: !519, file: !519, line: 25, type: !389, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !519 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "adfe1626ff4efc68ac58c367ff5f206b")
; !520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !521, file: !495, line: 141)
; !521 = !DISubprogram(name: "atoi", scope: !144, file: !144, line: 362, type: !522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !522 = !DISubroutineType(types: !523)
; !523 = !{!147, !391}
; !524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !525, file: !495, line: 142)
; !525 = !DISubprogram(name: "atol", scope: !144, file: !144, line: 367, type: !526, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !526 = !DISubroutineType(types: !527)
; !527 = !{!372, !391}
; !528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !529, file: !495, line: 143)
; !529 = !DISubprogram(name: "bsearch", scope: !530, file: !530, line: 20, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !530 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "724ededa330cc3e0cbd34c5b4030a6f6")
; !531 = !DISubroutineType(types: !532)
; !532 = !{!98, !48, !48, !95, !95, !533}
; !533 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !144, line: 816, baseType: !534)
; !534 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !535, size: 64)
; !535 = !DISubroutineType(types: !536)
; !536 = !{!147, !48, !48}
; !537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !538, file: !495, line: 144)
; !538 = !DISubprogram(name: "calloc", scope: !144, file: !144, line: 543, type: !508, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !540, file: !495, line: 145)
; !540 = !DISubprogram(name: "div", scope: !144, file: !144, line: 860, type: !541, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !541 = !DISubroutineType(types: !542)
; !542 = !{!493, !147, !147}
; !543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !544, file: !495, line: 146)
; !544 = !DISubprogram(name: "exit", scope: !144, file: !144, line: 624, type: !545, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
; !545 = !DISubroutineType(types: !546)
; !546 = !{null, !147}
; !547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !548, file: !495, line: 147)
; !548 = !DISubprogram(name: "free", scope: !144, file: !144, line: 555, type: !549, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !549 = !DISubroutineType(types: !550)
; !550 = !{null, !98}
; !551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !552, file: !495, line: 148)
; !552 = !DISubprogram(name: "getenv", scope: !144, file: !144, line: 641, type: !553, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !553 = !DISubroutineType(types: !554)
; !554 = !{!555, !391}
; !555 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !393, size: 64)
; !556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !557, file: !495, line: 149)
; !557 = !DISubprogram(name: "labs", scope: !144, file: !144, line: 849, type: !558, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !558 = !DISubroutineType(types: !559)
; !559 = !{!372, !372}
; !560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !561, file: !495, line: 150)
; !561 = !DISubprogram(name: "ldiv", scope: !144, file: !144, line: 862, type: !562, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !562 = !DISubroutineType(types: !563)
; !563 = !{!497, !372, !372}
; !564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !565, file: !495, line: 151)
; !565 = !DISubprogram(name: "malloc", scope: !144, file: !144, line: 540, type: !566, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !566 = !DISubroutineType(types: !567)
; !567 = !{!98, !95}
; !568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !569, file: !495, line: 153)
; !569 = !DISubprogram(name: "mblen", scope: !144, file: !144, line: 930, type: !570, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !570 = !DISubroutineType(types: !571)
; !571 = !{!147, !391, !95}
; !572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !573, file: !495, line: 154)
; !573 = !DISubprogram(name: "mbstowcs", scope: !144, file: !144, line: 941, type: !574, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !574 = !DISubroutineType(types: !575)
; !575 = !{!95, !576, !579, !95}
; !576 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !577)
; !577 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !578, size: 64)
; !578 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
; !579 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !391)
; !580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !581, file: !495, line: 155)
; !581 = !DISubprogram(name: "mbtowc", scope: !144, file: !144, line: 933, type: !582, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !582 = !DISubroutineType(types: !583)
; !583 = !{!147, !576, !579, !95}
; !584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !585, file: !495, line: 157)
; !585 = !DISubprogram(name: "qsort", scope: !144, file: !144, line: 838, type: !586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !586 = !DISubroutineType(types: !587)
; !587 = !{null, !98, !95, !95, !533}
; !588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !589, file: !495, line: 160)
; !589 = !DISubprogram(name: "quick_exit", scope: !144, file: !144, line: 630, type: !545, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
; !590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !591, file: !495, line: 163)
; !591 = !DISubprogram(name: "rand", scope: !144, file: !144, line: 454, type: !592, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !592 = !DISubroutineType(types: !593)
; !593 = !{!147}
; !594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !595, file: !495, line: 164)
; !595 = !DISubprogram(name: "realloc", scope: !144, file: !144, line: 551, type: !596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !596 = !DISubroutineType(types: !597)
; !597 = !{!98, !98, !95}
; !598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !599, file: !495, line: 165)
; !599 = !DISubprogram(name: "srand", scope: !144, file: !144, line: 456, type: !600, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !600 = !DISubroutineType(types: !601)
; !601 = !{null, !60}
; !602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !603, file: !495, line: 166)
; !603 = !DISubprogram(name: "strtod", scope: !144, file: !144, line: 118, type: !604, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !604 = !DISubroutineType(types: !605)
; !605 = !{!154, !579, !606}
; !606 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !607)
; !607 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !555, size: 64)
; !608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !609, file: !495, line: 167)
; !609 = !DISubprogram(name: "strtol", scope: !144, file: !144, line: 177, type: !610, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !610 = !DISubroutineType(types: !611)
; !611 = !{!372, !579, !606, !147}
; !612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !613, file: !495, line: 168)
; !613 = !DISubprogram(name: "strtoul", scope: !144, file: !144, line: 181, type: !614, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !614 = !DISubroutineType(types: !615)
; !615 = !{!41, !579, !606, !147}
; !616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !617, file: !495, line: 169)
; !617 = !DISubprogram(name: "system", scope: !144, file: !144, line: 791, type: !522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !619, file: !495, line: 171)
; !619 = !DISubprogram(name: "wcstombs", scope: !144, file: !144, line: 945, type: !620, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !620 = !DISubroutineType(types: !621)
; !621 = !{!95, !622, !623, !95}
; !622 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !555)
; !623 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !624)
; !624 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !625, size: 64)
; !625 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !578)
; !626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !627, file: !495, line: 172)
; !627 = !DISubprogram(name: "wctomb", scope: !144, file: !144, line: 937, type: !628, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !628 = !DISubroutineType(types: !629)
; !629 = !{!147, !555, !578}
; !630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !632, file: !495, line: 200)
; !631 = !DINamespace(name: "__gnu_cxx", scope: null)
; !632 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !144, line: 81, baseType: !633)
; !633 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !144, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !634, identifier: "_ZTS7lldiv_t")
; !634 = !{!635, !636}
; !635 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !633, file: !144, line: 79, baseType: !335, size: 64)
; !636 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !633, file: !144, line: 80, baseType: !335, size: 64, offset: 64)
; !637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !638, file: !495, line: 206)
; !638 = !DISubprogram(name: "_Exit", scope: !144, file: !144, line: 636, type: !545, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
; !639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !640, file: !495, line: 210)
; !640 = !DISubprogram(name: "llabs", scope: !144, file: !144, line: 852, type: !641, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !641 = !DISubroutineType(types: !642)
; !642 = !{!335, !335}
; !643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !644, file: !495, line: 216)
; !644 = !DISubprogram(name: "lldiv", scope: !144, file: !144, line: 866, type: !645, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !645 = !DISubroutineType(types: !646)
; !646 = !{!632, !335, !335}
; !647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !648, file: !495, line: 227)
; !648 = !DISubprogram(name: "atoll", scope: !144, file: !144, line: 374, type: !649, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !649 = !DISubroutineType(types: !650)
; !650 = !{!335, !391}
; !651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !652, file: !495, line: 228)
; !652 = !DISubprogram(name: "strtoll", scope: !144, file: !144, line: 201, type: !653, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !653 = !DISubroutineType(types: !654)
; !654 = !{!335, !579, !606, !147}
; !655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !656, file: !495, line: 229)
; !656 = !DISubprogram(name: "strtoull", scope: !144, file: !144, line: 206, type: !657, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !657 = !DISubroutineType(types: !658)
; !658 = !{!659, !579, !606, !147}
; !659 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
; !660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !661, file: !495, line: 231)
; !661 = !DISubprogram(name: "strtof", scope: !144, file: !144, line: 124, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !662 = !DISubroutineType(types: !663)
; !663 = !{!213, !579, !606}
; !664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !665, file: !495, line: 232)
; !665 = !DISubprogram(name: "strtold", scope: !144, file: !144, line: 127, type: !666, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !666 = !DISubroutineType(types: !667)
; !667 = !{!224, !579, !606}
; !668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !632, file: !495, line: 240)
; !669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !638, file: !495, line: 242)
; !670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !640, file: !495, line: 244)
; !671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !672, file: !495, line: 245)
; !672 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !631, file: !495, line: 213, type: !645, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !644, file: !495, line: 246)
; !674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !648, file: !495, line: 248)
; !675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !661, file: !495, line: 249)
; !676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !652, file: !495, line: 250)
; !677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !656, file: !495, line: 251)
; !678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !665, file: !495, line: 252)
; !679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !503, file: !680, line: 38)
; !680 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "ce88caced6ed945413de73c65016f4c2")
; !681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !511, file: !680, line: 39)
; !682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !544, file: !680, line: 40)
; !683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !516, file: !680, line: 43)
; !684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !589, file: !680, line: 46)
; !685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !493, file: !680, line: 51)
; !686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !497, file: !680, line: 52)
; !687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !688, file: !680, line: 54)
; !688 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !40, file: !148, line: 79, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !518, file: !680, line: 55)
; !690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !521, file: !680, line: 56)
; !691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !525, file: !680, line: 57)
; !692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !529, file: !680, line: 58)
; !693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !538, file: !680, line: 59)
; !694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !672, file: !680, line: 60)
; !695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !548, file: !680, line: 61)
; !696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !552, file: !680, line: 62)
; !697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !557, file: !680, line: 63)
; !698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !561, file: !680, line: 64)
; !699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !565, file: !680, line: 65)
; !700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !569, file: !680, line: 67)
; !701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !573, file: !680, line: 68)
; !702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !581, file: !680, line: 69)
; !703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !585, file: !680, line: 71)
; !704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !591, file: !680, line: 72)
; !705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !595, file: !680, line: 73)
; !706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !599, file: !680, line: 74)
; !707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !603, file: !680, line: 75)
; !708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !609, file: !680, line: 76)
; !709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !613, file: !680, line: 77)
; !710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !617, file: !680, line: 78)
; !711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !619, file: !680, line: 80)
; !712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !627, file: !680, line: 81)
; !713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !714, file: !715, line: 200)
; !714 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !715, file: !715, line: 28, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !715 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
; !716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !717, file: !715, line: 201)
; !717 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !715, file: !715, line: 32, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !719, file: !715, line: 202)
; !719 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !715, file: !715, line: 34, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !721, file: !715, line: 203)
; !721 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !715, file: !715, line: 36, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !723, file: !715, line: 204)
; !723 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !715, file: !715, line: 38, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !725, file: !715, line: 205)
; !725 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !715, file: !715, line: 42, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !727, file: !715, line: 206)
; !727 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !715, file: !715, line: 40, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !729, file: !715, line: 207)
; !729 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !715, file: !715, line: 44, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !731, file: !715, line: 208)
; !731 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !715, file: !715, line: 46, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !733, file: !715, line: 209)
; !733 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !715, file: !715, line: 48, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !735, file: !715, line: 210)
; !735 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !715, file: !715, line: 50, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !737, file: !715, line: 211)
; !737 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !715, file: !715, line: 52, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !739, file: !715, line: 212)
; !739 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !715, file: !715, line: 54, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !741, file: !715, line: 213)
; !741 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !715, file: !715, line: 58, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !743, file: !715, line: 214)
; !743 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !715, file: !715, line: 56, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !745, file: !715, line: 215)
; !745 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !715, file: !715, line: 62, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !747, file: !715, line: 216)
; !747 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !715, file: !715, line: 60, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !749, file: !715, line: 217)
; !749 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !715, file: !715, line: 64, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !751, file: !715, line: 218)
; !751 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !715, file: !715, line: 66, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !753, file: !715, line: 219)
; !753 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !715, file: !715, line: 68, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !755, file: !715, line: 220)
; !755 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !715, file: !715, line: 70, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !757, file: !715, line: 221)
; !757 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !715, file: !715, line: 72, type: !289, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !759, file: !715, line: 222)
; !759 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !715, file: !715, line: 74, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !761, file: !715, line: 223)
; !761 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !715, file: !715, line: 76, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !763, file: !715, line: 224)
; !763 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !715, file: !715, line: 78, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !765, file: !715, line: 225)
; !765 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !715, file: !715, line: 80, type: !319, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !767, file: !715, line: 226)
; !767 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !715, file: !715, line: 82, type: !768, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !768 = !DISubroutineType(types: !769)
; !769 = !{!213, !213, !182}
; !770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !771, file: !715, line: 227)
; !771 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !715, file: !715, line: 84, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !773, file: !715, line: 228)
; !773 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !715, file: !715, line: 86, type: !319, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !775, file: !715, line: 229)
; !775 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !715, file: !715, line: 91, type: !776, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !776 = !DISubroutineType(types: !777)
; !777 = !{!102, !213}
; !778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !779, file: !715, line: 230)
; !779 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !715, file: !715, line: 95, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !780 = !DISubroutineType(types: !781)
; !781 = !{!102, !213, !213}
; !782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !783, file: !715, line: 231)
; !783 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !715, file: !715, line: 94, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !785, file: !715, line: 232)
; !785 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !715, file: !715, line: 100, type: !776, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !787, file: !715, line: 233)
; !787 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !715, file: !715, line: 104, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !789, file: !715, line: 234)
; !789 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !715, file: !715, line: 103, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !791, file: !715, line: 235)
; !791 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !715, file: !715, line: 106, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !793, file: !715, line: 236)
; !793 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !715, file: !715, line: 111, type: !776, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !795, file: !715, line: 237)
; !795 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !715, file: !715, line: 113, type: !776, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !797, file: !715, line: 238)
; !797 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !715, file: !715, line: 115, type: !780, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !799, file: !715, line: 239)
; !799 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !715, file: !715, line: 116, type: !558, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !801, file: !715, line: 240)
; !801 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !715, file: !715, line: 118, type: !470, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !803, file: !715, line: 241)
; !803 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !715, file: !715, line: 120, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !805, file: !715, line: 242)
; !805 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !715, file: !715, line: 121, type: !641, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !807, file: !715, line: 243)
; !807 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !715, file: !715, line: 123, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !809, file: !715, line: 244)
; !809 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !715, file: !715, line: 133, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !811, file: !715, line: 245)
; !811 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !715, file: !715, line: 125, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !813, file: !715, line: 246)
; !813 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !715, file: !715, line: 127, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !815, file: !715, line: 247)
; !815 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !715, file: !715, line: 129, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !817, file: !715, line: 248)
; !817 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !715, file: !715, line: 131, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !819, file: !715, line: 249)
; !819 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !715, file: !715, line: 135, type: !375, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !821, file: !715, line: 250)
; !821 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !715, file: !715, line: 137, type: !375, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !823, file: !715, line: 251)
; !823 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !715, file: !715, line: 138, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !825, file: !715, line: 252)
; !825 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !715, file: !715, line: 140, type: !826, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !826 = !DISubroutineType(types: !827)
; !827 = !{!213, !213, !828}
; !828 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !213, size: 64)
; !829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !830, file: !715, line: 253)
; !830 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !715, file: !715, line: 141, type: !389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !832, file: !715, line: 254)
; !832 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !715, file: !715, line: 142, type: !396, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !834, file: !715, line: 255)
; !834 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !715, file: !715, line: 144, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !836, file: !715, line: 256)
; !836 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !715, file: !715, line: 146, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !838, file: !715, line: 257)
; !838 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !715, file: !715, line: 150, type: !470, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !840, file: !715, line: 258)
; !840 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !715, file: !715, line: 152, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !842, file: !715, line: 259)
; !842 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !715, file: !715, line: 154, type: !436, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !844, file: !715, line: 260)
; !844 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !715, file: !715, line: 156, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !846, file: !715, line: 261)
; !846 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !715, file: !715, line: 158, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !848, file: !715, line: 262)
; !848 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !715, file: !715, line: 160, type: !460, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !850, file: !715, line: 263)
; !850 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !715, file: !715, line: 162, type: !470, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !852, file: !715, line: 264)
; !852 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !715, file: !715, line: 167, type: !776, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !854, file: !715, line: 265)
; !854 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !715, file: !715, line: 169, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !856, file: !715, line: 266)
; !856 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !715, file: !715, line: 171, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !858, file: !715, line: 267)
; !858 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !715, file: !715, line: 173, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !860, file: !715, line: 268)
; !860 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !715, file: !715, line: 175, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !862, file: !715, line: 269)
; !862 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !715, file: !715, line: 177, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !864, file: !715, line: 270)
; !864 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !715, file: !715, line: 179, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !866, file: !715, line: 271)
; !866 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !715, file: !715, line: 181, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !868, file: !870, line: 729)
; !868 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !869, file: !869, line: 188, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !869 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "77b108a711ff1d970d6aaeeab7921660")
; !870 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "0af09435178b3f6de185f06c3a9cbb63")
; !871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !872, file: !870, line: 730)
; !872 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !869, file: !869, line: 191, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !874, file: !870, line: 731)
; !874 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !869, file: !869, line: 194, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !876, file: !870, line: 732)
; !876 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !869, file: !869, line: 197, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !878, file: !870, line: 733)
; !878 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !869, file: !869, line: 200, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !880, file: !870, line: 734)
; !880 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !869, file: !869, line: 203, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !882, file: !870, line: 735)
; !882 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !869, file: !869, line: 206, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !884, file: !870, line: 736)
; !884 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !869, file: !869, line: 209, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !886, file: !870, line: 737)
; !886 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !869, file: !869, line: 212, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !888, file: !870, line: 738)
; !888 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !869, file: !869, line: 215, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !890, file: !870, line: 739)
; !890 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !869, file: !869, line: 218, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !892, file: !870, line: 740)
; !892 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !869, file: !869, line: 221, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !894, file: !870, line: 741)
; !894 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !869, file: !869, line: 233, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !896, file: !870, line: 742)
; !896 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !869, file: !869, line: 242, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !898, file: !870, line: 743)
; !898 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !869, file: !869, line: 251, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !900, file: !870, line: 744)
; !900 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !869, file: !869, line: 254, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !902, file: !870, line: 745)
; !902 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !869, file: !869, line: 257, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !904, file: !870, line: 746)
; !904 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !869, file: !869, line: 260, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !906, file: !870, line: 747)
; !906 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !869, file: !869, line: 263, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !908, file: !870, line: 748)
; !908 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !869, file: !869, line: 269, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !910, file: !870, line: 749)
; !910 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !869, file: !869, line: 272, type: !289, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !912, file: !870, line: 750)
; !912 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !869, file: !869, line: 277, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !914, file: !870, line: 751)
; !914 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !869, file: !869, line: 280, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !916, file: !870, line: 752)
; !916 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !869, file: !869, line: 283, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !918, file: !870, line: 753)
; !918 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !869, file: !869, line: 286, type: !768, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !920, file: !870, line: 754)
; !920 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !869, file: !869, line: 299, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !922, file: !870, line: 755)
; !922 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !869, file: !869, line: 302, type: !319, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !924, file: !870, line: 756)
; !924 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !869, file: !869, line: 341, type: !470, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !926, file: !870, line: 757)
; !926 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !869, file: !869, line: 344, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !928, file: !870, line: 758)
; !928 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !869, file: !869, line: 347, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !930, file: !870, line: 759)
; !930 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !869, file: !869, line: 350, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !932, file: !870, line: 760)
; !932 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !869, file: !869, line: 353, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !934, file: !870, line: 761)
; !934 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !869, file: !869, line: 356, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !936, file: !870, line: 762)
; !936 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !869, file: !869, line: 359, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !938, file: !870, line: 763)
; !938 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !869, file: !869, line: 365, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !940, file: !870, line: 764)
; !940 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !869, file: !869, line: 368, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !942, file: !870, line: 765)
; !942 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !869, file: !869, line: 371, type: !375, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !944, file: !870, line: 766)
; !944 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !869, file: !869, line: 374, type: !375, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !946, file: !870, line: 767)
; !946 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !869, file: !869, line: 377, type: !826, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !948, file: !870, line: 768)
; !948 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !869, file: !869, line: 413, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !950, file: !870, line: 769)
; !950 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !869, file: !869, line: 416, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !952, file: !870, line: 771)
; !952 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !869, file: !869, line: 449, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !954, file: !870, line: 772)
; !954 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !869, file: !869, line: 474, type: !247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !956, file: !870, line: 773)
; !956 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !869, file: !869, line: 479, type: !436, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !958, file: !870, line: 774)
; !958 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !869, file: !869, line: 495, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !960, file: !870, line: 775)
; !960 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !869, file: !869, line: 520, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !962, file: !870, line: 776)
; !962 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !869, file: !869, line: 526, type: !460, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !964, file: !870, line: 777)
; !964 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !869, file: !869, line: 532, type: !470, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !966, file: !870, line: 778)
; !966 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !869, file: !869, line: 560, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !968, file: !870, line: 779)
; !968 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !869, file: !869, line: 563, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !970, file: !870, line: 780)
; !970 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !869, file: !869, line: 569, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !972, file: !870, line: 781)
; !972 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !869, file: !869, line: 572, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !974, file: !870, line: 782)
; !974 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !869, file: !869, line: 575, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !976, file: !870, line: 783)
; !976 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !869, file: !869, line: 578, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !978, file: !870, line: 784)
; !978 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !869, file: !869, line: 581, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !980, file: !981, line: 68)
; !980 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !982, file: !981, line: 90, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
; !981 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "e8a32dcadc5d06d341e371fb480b7b44")
; !982 = !DINamespace(name: "__exception_ptr", scope: !40)
; !983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !982, entity: !984, file: !981, line: 84)
; !984 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !40, file: !981, line: 80, type: !985, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
; !985 = !DISubroutineType(types: !986)
; !986 = !{null, !980}
; !987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !988, file: !1003, line: 64)
; !988 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !989, line: 6, baseType: !990)
; !989 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
; !990 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !991, line: 21, baseType: !992)
; !991 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
; !992 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !991, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !993, identifier: "_ZTS11__mbstate_t")
; !993 = !{!994, !995}
; !994 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !992, file: !991, line: 15, baseType: !147, size: 32)
; !995 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !992, file: !991, line: 20, baseType: !996, size: 32, offset: 32)
; !996 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !992, file: !991, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !997, identifier: "_ZTSN11__mbstate_tUt_E")
; !997 = !{!998, !999}
; !998 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !996, file: !991, line: 18, baseType: !60, size: 32)
; !999 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !996, file: !991, line: 19, baseType: !1000, size: 32)
; !1000 = !DICompositeType(tag: DW_TAG_array_type, baseType: !393, size: 32, elements: !1001)
; !1001 = !{!1002}
; !1002 = !DISubrange(count: 4)
; !1003 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cwchar", directory: "")
; !1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1005, file: !1003, line: 141)
; !1005 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !1006, line: 20, baseType: !60)
; !1006 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
; !1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1008, file: !1003, line: 143)
; !1008 = !DISubprogram(name: "btowc", scope: !1009, file: !1009, line: 319, type: !1010, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1009 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "484b7adbbc849bb51cdbcb2d985b07a0")
; !1010 = !DISubroutineType(types: !1011)
; !1011 = !{!1005, !147}
; !1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1013, file: !1003, line: 144)
; !1013 = !DISubprogram(name: "fgetwc", scope: !1009, file: !1009, line: 744, type: !1014, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1014 = !DISubroutineType(types: !1015)
; !1015 = !{!1005, !1016}
; !1016 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1017, size: 64)
; !1017 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !1018, line: 5, baseType: !1019)
; !1018 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
; !1019 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !1020, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !1021, identifier: "_ZTS8_IO_FILE")
; !1020 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
; !1021 = !{!1022, !1023, !1024, !1025, !1026, !1027, !1028, !1029, !1030, !1031, !1032, !1033, !1034, !1037, !1039, !1040, !1041, !1043, !1044, !1046, !1050, !1053, !1055, !1058, !1061, !1062, !1063, !1064, !1065}
; !1022 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !1019, file: !1020, line: 51, baseType: !147, size: 32)
; !1023 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !1019, file: !1020, line: 54, baseType: !555, size: 64, offset: 64)
; !1024 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !1019, file: !1020, line: 55, baseType: !555, size: 64, offset: 128)
; !1025 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !1019, file: !1020, line: 56, baseType: !555, size: 64, offset: 192)
; !1026 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !1019, file: !1020, line: 57, baseType: !555, size: 64, offset: 256)
; !1027 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !1019, file: !1020, line: 58, baseType: !555, size: 64, offset: 320)
; !1028 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !1019, file: !1020, line: 59, baseType: !555, size: 64, offset: 384)
; !1029 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !1019, file: !1020, line: 60, baseType: !555, size: 64, offset: 448)
; !1030 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !1019, file: !1020, line: 61, baseType: !555, size: 64, offset: 512)
; !1031 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !1019, file: !1020, line: 64, baseType: !555, size: 64, offset: 576)
; !1032 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !1019, file: !1020, line: 65, baseType: !555, size: 64, offset: 640)
; !1033 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !1019, file: !1020, line: 66, baseType: !555, size: 64, offset: 704)
; !1034 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !1019, file: !1020, line: 68, baseType: !1035, size: 64, offset: 768)
; !1035 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1036, size: 64)
; !1036 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !1020, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
; !1037 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !1019, file: !1020, line: 70, baseType: !1038, size: 64, offset: 832)
; !1038 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1019, size: 64)
; !1039 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !1019, file: !1020, line: 72, baseType: !147, size: 32, offset: 896)
; !1040 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !1019, file: !1020, line: 73, baseType: !147, size: 32, offset: 928)
; !1041 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !1019, file: !1020, line: 74, baseType: !1042, size: 64, offset: 960)
; !1042 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !10, line: 152, baseType: !372)
; !1043 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !1019, file: !1020, line: 77, baseType: !11, size: 16, offset: 1024)
; !1044 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !1019, file: !1020, line: 78, baseType: !1045, size: 8, offset: 1040)
; !1045 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
; !1046 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !1019, file: !1020, line: 79, baseType: !1047, size: 8, offset: 1048)
; !1047 = !DICompositeType(tag: DW_TAG_array_type, baseType: !393, size: 8, elements: !1048)
; !1048 = !{!1049}
; !1049 = !DISubrange(count: 1)
; !1050 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !1019, file: !1020, line: 81, baseType: !1051, size: 64, offset: 1088)
; !1051 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1052, size: 64)
; !1052 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !1020, line: 43, baseType: null)
; !1053 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !1019, file: !1020, line: 89, baseType: !1054, size: 64, offset: 1152)
; !1054 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !10, line: 153, baseType: !372)
; !1055 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !1019, file: !1020, line: 91, baseType: !1056, size: 64, offset: 1216)
; !1056 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1057, size: 64)
; !1057 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !1020, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
; !1058 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !1019, file: !1020, line: 92, baseType: !1059, size: 64, offset: 1280)
; !1059 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1060, size: 64)
; !1060 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !1020, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
; !1061 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !1019, file: !1020, line: 93, baseType: !1038, size: 64, offset: 1344)
; !1062 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !1019, file: !1020, line: 94, baseType: !98, size: 64, offset: 1408)
; !1063 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !1019, file: !1020, line: 95, baseType: !95, size: 64, offset: 1472)
; !1064 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !1019, file: !1020, line: 96, baseType: !147, size: 32, offset: 1536)
; !1065 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !1019, file: !1020, line: 98, baseType: !1066, size: 160, offset: 1568)
; !1066 = !DICompositeType(tag: DW_TAG_array_type, baseType: !393, size: 160, elements: !1067)
; !1067 = !{!1068}
; !1068 = !DISubrange(count: 20)
; !1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1070, file: !1003, line: 145)
; !1070 = !DISubprogram(name: "fgetws", scope: !1009, file: !1009, line: 773, type: !1071, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1071 = !DISubroutineType(types: !1072)
; !1072 = !{!577, !576, !147, !1073}
; !1073 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1016)
; !1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1075, file: !1003, line: 146)
; !1075 = !DISubprogram(name: "fputwc", scope: !1009, file: !1009, line: 758, type: !1076, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1076 = !DISubroutineType(types: !1077)
; !1077 = !{!1005, !578, !1016}
; !1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1079, file: !1003, line: 147)
; !1079 = !DISubprogram(name: "fputws", scope: !1009, file: !1009, line: 780, type: !1080, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1080 = !DISubroutineType(types: !1081)
; !1081 = !{!147, !623, !1073}
; !1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1083, file: !1003, line: 148)
; !1083 = !DISubprogram(name: "fwide", scope: !1009, file: !1009, line: 588, type: !1084, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1084 = !DISubroutineType(types: !1085)
; !1085 = !{!147, !1016, !147}
; !1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1087, file: !1003, line: 149)
; !1087 = !DISubprogram(name: "fwprintf", scope: !1009, file: !1009, line: 595, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1088 = !DISubroutineType(types: !1089)
; !1089 = !{!147, !1073, !623, null}
; !1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1091, file: !1003, line: 150)
; !1091 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !1009, file: !1009, line: 657, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1093, file: !1003, line: 151)
; !1093 = !DISubprogram(name: "getwc", scope: !1009, file: !1009, line: 745, type: !1014, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1094 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1095, file: !1003, line: 152)
; !1095 = !DISubprogram(name: "getwchar", scope: !1009, file: !1009, line: 751, type: !1096, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1096 = !DISubroutineType(types: !1097)
; !1097 = !{!1005}
; !1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1099, file: !1003, line: 153)
; !1099 = !DISubprogram(name: "mbrlen", scope: !1009, file: !1009, line: 330, type: !1100, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1100 = !DISubroutineType(types: !1101)
; !1101 = !{!95, !579, !95, !1102}
; !1102 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1103)
; !1103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !988, size: 64)
; !1104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1105, file: !1003, line: 154)
; !1105 = !DISubprogram(name: "mbrtowc", scope: !1009, file: !1009, line: 297, type: !1106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1106 = !DISubroutineType(types: !1107)
; !1107 = !{!95, !576, !579, !95, !1102}
; !1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1109, file: !1003, line: 155)
; !1109 = !DISubprogram(name: "mbsinit", scope: !1009, file: !1009, line: 293, type: !1110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1110 = !DISubroutineType(types: !1111)
; !1111 = !{!147, !1112}
; !1112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1113, size: 64)
; !1113 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !988)
; !1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1115, file: !1003, line: 156)
; !1115 = !DISubprogram(name: "mbsrtowcs", scope: !1009, file: !1009, line: 338, type: !1116, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1116 = !DISubroutineType(types: !1117)
; !1117 = !{!95, !576, !1118, !95, !1102}
; !1118 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1119)
; !1119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !391, size: 64)
; !1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1121, file: !1003, line: 157)
; !1121 = !DISubprogram(name: "putwc", scope: !1009, file: !1009, line: 759, type: !1076, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1123, file: !1003, line: 158)
; !1123 = !DISubprogram(name: "putwchar", scope: !1009, file: !1009, line: 765, type: !1124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1124 = !DISubroutineType(types: !1125)
; !1125 = !{!1005, !578}
; !1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1127, file: !1003, line: 160)
; !1127 = !DISubprogram(name: "swprintf", scope: !1009, file: !1009, line: 605, type: !1128, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1128 = !DISubroutineType(types: !1129)
; !1129 = !{!147, !576, !95, !623, null}
; !1130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1131, file: !1003, line: 162)
; !1131 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !1009, file: !1009, line: 664, type: !1132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1132 = !DISubroutineType(types: !1133)
; !1133 = !{!147, !623, !623, null}
; !1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1135, file: !1003, line: 163)
; !1135 = !DISubprogram(name: "ungetwc", scope: !1009, file: !1009, line: 788, type: !1136, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1136 = !DISubroutineType(types: !1137)
; !1137 = !{!1005, !1005, !1016}
; !1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1139, file: !1003, line: 164)
; !1139 = !DISubprogram(name: "vfwprintf", scope: !1009, file: !1009, line: 613, type: !1140, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1140 = !DISubroutineType(types: !1141)
; !1141 = !{!147, !1073, !623, !1142}
; !1142 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1143, line: 32, baseType: !1144)
; !1143 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stdarg.h", directory: "", checksumkind: CSK_MD5, checksum: "4de3cbd931b589d291e5c39387aecf82")
; !1144 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1145, baseType: !555)
; !1145 = !DIFile(filename: "defs.cpp", directory: "/home/oster/repos/scabbard/libtrace/src")
; !1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1147, file: !1003, line: 166)
; !1147 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !1009, file: !1009, line: 711, type: !1140, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1149, file: !1003, line: 169)
; !1149 = !DISubprogram(name: "vswprintf", scope: !1009, file: !1009, line: 626, type: !1150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1150 = !DISubroutineType(types: !1151)
; !1151 = !{!147, !576, !95, !623, !1142}
; !1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1153, file: !1003, line: 172)
; !1153 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !1009, file: !1009, line: 718, type: !1154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1154 = !DISubroutineType(types: !1155)
; !1155 = !{!147, !623, !623, !1142}
; !1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1157, file: !1003, line: 174)
; !1157 = !DISubprogram(name: "vwprintf", scope: !1009, file: !1009, line: 621, type: !1158, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1158 = !DISubroutineType(types: !1159)
; !1159 = !{!147, !623, !1142}
; !1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1161, file: !1003, line: 176)
; !1161 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !1009, file: !1009, line: 715, type: !1158, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1163, file: !1003, line: 178)
; !1163 = !DISubprogram(name: "wcrtomb", scope: !1009, file: !1009, line: 302, type: !1164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1164 = !DISubroutineType(types: !1165)
; !1165 = !{!95, !622, !578, !1102}
; !1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1167, file: !1003, line: 179)
; !1167 = !DISubprogram(name: "wcscat", scope: !1009, file: !1009, line: 97, type: !1168, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1168 = !DISubroutineType(types: !1169)
; !1169 = !{!577, !576, !623}
; !1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1171, file: !1003, line: 180)
; !1171 = !DISubprogram(name: "wcscmp", scope: !1009, file: !1009, line: 106, type: !1172, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1172 = !DISubroutineType(types: !1173)
; !1173 = !{!147, !624, !624}
; !1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1175, file: !1003, line: 181)
; !1175 = !DISubprogram(name: "wcscoll", scope: !1009, file: !1009, line: 131, type: !1172, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1177, file: !1003, line: 182)
; !1177 = !DISubprogram(name: "wcscpy", scope: !1009, file: !1009, line: 87, type: !1168, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1179, file: !1003, line: 183)
; !1179 = !DISubprogram(name: "wcscspn", scope: !1009, file: !1009, line: 188, type: !1180, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1180 = !DISubroutineType(types: !1181)
; !1181 = !{!95, !624, !624}
; !1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1183, file: !1003, line: 184)
; !1183 = !DISubprogram(name: "wcsftime", scope: !1009, file: !1009, line: 852, type: !1184, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1184 = !DISubroutineType(types: !1185)
; !1185 = !{!95, !576, !95, !623, !1186}
; !1186 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1187)
; !1187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1188, size: 64)
; !1188 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1189)
; !1189 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1009, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
; !1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1191, file: !1003, line: 185)
; !1191 = !DISubprogram(name: "wcslen", scope: !1009, file: !1009, line: 223, type: !1192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1192 = !DISubroutineType(types: !1193)
; !1193 = !{!95, !624}
; !1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1195, file: !1003, line: 186)
; !1195 = !DISubprogram(name: "wcsncat", scope: !1009, file: !1009, line: 101, type: !1196, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1196 = !DISubroutineType(types: !1197)
; !1197 = !{!577, !576, !623, !95}
; !1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1199, file: !1003, line: 187)
; !1199 = !DISubprogram(name: "wcsncmp", scope: !1009, file: !1009, line: 109, type: !1200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1200 = !DISubroutineType(types: !1201)
; !1201 = !{!147, !624, !624, !95}
; !1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1203, file: !1003, line: 188)
; !1203 = !DISubprogram(name: "wcsncpy", scope: !1009, file: !1009, line: 92, type: !1196, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1205, file: !1003, line: 189)
; !1205 = !DISubprogram(name: "wcsrtombs", scope: !1009, file: !1009, line: 344, type: !1206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1206 = !DISubroutineType(types: !1207)
; !1207 = !{!95, !622, !1208, !95, !1102}
; !1208 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1209)
; !1209 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !624, size: 64)
; !1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1211, file: !1003, line: 190)
; !1211 = !DISubprogram(name: "wcsspn", scope: !1009, file: !1009, line: 192, type: !1180, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1213, file: !1003, line: 191)
; !1213 = !DISubprogram(name: "wcstod", scope: !1009, file: !1009, line: 378, type: !1214, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1214 = !DISubroutineType(types: !1215)
; !1215 = !{!154, !623, !1216}
; !1216 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1217)
; !1217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !577, size: 64)
; !1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1219, file: !1003, line: 193)
; !1219 = !DISubprogram(name: "wcstof", scope: !1009, file: !1009, line: 383, type: !1220, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1220 = !DISubroutineType(types: !1221)
; !1221 = !{!213, !623, !1216}
; !1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1223, file: !1003, line: 195)
; !1223 = !DISubprogram(name: "wcstok", scope: !1009, file: !1009, line: 218, type: !1224, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1224 = !DISubroutineType(types: !1225)
; !1225 = !{!577, !576, !623, !1216}
; !1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1227, file: !1003, line: 196)
; !1227 = !DISubprogram(name: "wcstol", scope: !1009, file: !1009, line: 429, type: !1228, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1228 = !DISubroutineType(types: !1229)
; !1229 = !{!372, !623, !1216, !147}
; !1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1231, file: !1003, line: 197)
; !1231 = !DISubprogram(name: "wcstoul", scope: !1009, file: !1009, line: 434, type: !1232, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1232 = !DISubroutineType(types: !1233)
; !1233 = !{!41, !623, !1216, !147}
; !1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1235, file: !1003, line: 198)
; !1235 = !DISubprogram(name: "wcsxfrm", scope: !1009, file: !1009, line: 135, type: !1236, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1236 = !DISubroutineType(types: !1237)
; !1237 = !{!95, !576, !623, !95}
; !1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1239, file: !1003, line: 199)
; !1239 = !DISubprogram(name: "wctob", scope: !1009, file: !1009, line: 325, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1240 = !DISubroutineType(types: !1241)
; !1241 = !{!147, !1005}
; !1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1243, file: !1003, line: 200)
; !1243 = !DISubprogram(name: "wmemcmp", scope: !1009, file: !1009, line: 259, type: !1200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1245, file: !1003, line: 201)
; !1245 = !DISubprogram(name: "wmemcpy", scope: !1009, file: !1009, line: 263, type: !1196, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1247, file: !1003, line: 202)
; !1247 = !DISubprogram(name: "wmemmove", scope: !1009, file: !1009, line: 268, type: !1248, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1248 = !DISubroutineType(types: !1249)
; !1249 = !{!577, !577, !624, !95}
; !1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1251, file: !1003, line: 203)
; !1251 = !DISubprogram(name: "wmemset", scope: !1009, file: !1009, line: 272, type: !1252, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1252 = !DISubroutineType(types: !1253)
; !1253 = !{!577, !577, !578, !95}
; !1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1255, file: !1003, line: 204)
; !1255 = !DISubprogram(name: "wprintf", scope: !1009, file: !1009, line: 602, type: !1256, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1256 = !DISubroutineType(types: !1257)
; !1257 = !{!147, !623, null}
; !1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1259, file: !1003, line: 205)
; !1259 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !1009, file: !1009, line: 661, type: !1256, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1261, file: !1003, line: 206)
; !1261 = !DISubprogram(name: "wcschr", scope: !1009, file: !1009, line: 165, type: !1262, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1262 = !DISubroutineType(types: !1263)
; !1263 = !{!577, !624, !578}
; !1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1265, file: !1003, line: 207)
; !1265 = !DISubprogram(name: "wcspbrk", scope: !1009, file: !1009, line: 202, type: !1266, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1266 = !DISubroutineType(types: !1267)
; !1267 = !{!577, !624, !624}
; !1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1269, file: !1003, line: 208)
; !1269 = !DISubprogram(name: "wcsrchr", scope: !1009, file: !1009, line: 175, type: !1262, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1271, file: !1003, line: 209)
; !1271 = !DISubprogram(name: "wcsstr", scope: !1009, file: !1009, line: 213, type: !1266, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1273, file: !1003, line: 210)
; !1273 = !DISubprogram(name: "wmemchr", scope: !1009, file: !1009, line: 254, type: !1274, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1274 = !DISubroutineType(types: !1275)
; !1275 = !{!577, !624, !578, !95}
; !1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !1277, file: !1003, line: 251)
; !1277 = !DISubprogram(name: "wcstold", scope: !1009, file: !1009, line: 385, type: !1278, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1278 = !DISubroutineType(types: !1279)
; !1279 = !{!224, !623, !1216}
; !1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !1281, file: !1003, line: 260)
; !1281 = !DISubprogram(name: "wcstoll", scope: !1009, file: !1009, line: 442, type: !1282, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1282 = !DISubroutineType(types: !1283)
; !1283 = !{!335, !623, !1216, !147}
; !1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !1285, file: !1003, line: 261)
; !1285 = !DISubprogram(name: "wcstoull", scope: !1009, file: !1009, line: 449, type: !1286, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1286 = !DISubroutineType(types: !1287)
; !1287 = !{!659, !623, !1216, !147}
; !1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1277, file: !1003, line: 267)
; !1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1281, file: !1003, line: 268)
; !1290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1285, file: !1003, line: 269)
; !1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1219, file: !1003, line: 283)
; !1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1147, file: !1003, line: 286)
; !1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1153, file: !1003, line: 289)
; !1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1161, file: !1003, line: 292)
; !1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1277, file: !1003, line: 296)
; !1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1281, file: !1003, line: 297)
; !1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1285, file: !1003, line: 298)
; !1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1299, file: !1302, line: 47)
; !1299 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1300, line: 24, baseType: !1301)
; !1300 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
; !1301 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !10, line: 37, baseType: !1045)
; !1302 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdint", directory: "")
; !1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1304, file: !1302, line: 48)
; !1304 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1300, line: 25, baseType: !1305)
; !1305 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !10, line: 39, baseType: !1306)
; !1306 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
; !1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1308, file: !1302, line: 49)
; !1308 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1300, line: 26, baseType: !1309)
; !1309 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !10, line: 41, baseType: !147)
; !1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1311, file: !1302, line: 50)
; !1311 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1300, line: 27, baseType: !1312)
; !1312 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 44, baseType: !372)
; !1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1314, file: !1302, line: 52)
; !1314 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1315, line: 58, baseType: !1045)
; !1315 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
; !1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1317, file: !1302, line: 53)
; !1317 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1315, line: 60, baseType: !372)
; !1318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1319, file: !1302, line: 54)
; !1319 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1315, line: 61, baseType: !372)
; !1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1321, file: !1302, line: 55)
; !1321 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1315, line: 62, baseType: !372)
; !1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1323, file: !1302, line: 57)
; !1323 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1315, line: 43, baseType: !1324)
; !1324 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !10, line: 52, baseType: !1301)
; !1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1326, file: !1302, line: 58)
; !1326 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1315, line: 44, baseType: !1327)
; !1327 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !10, line: 54, baseType: !1305)
; !1328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1329, file: !1302, line: 59)
; !1329 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1315, line: 45, baseType: !1330)
; !1330 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !10, line: 56, baseType: !1309)
; !1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1332, file: !1302, line: 60)
; !1332 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1315, line: 46, baseType: !1333)
; !1333 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !10, line: 58, baseType: !1312)
; !1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1335, file: !1302, line: 62)
; !1335 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1315, line: 101, baseType: !1336)
; !1336 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !10, line: 72, baseType: !372)
; !1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1338, file: !1302, line: 63)
; !1338 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1315, line: 87, baseType: !372)
; !1339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1340, file: !1302, line: 65)
; !1340 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !8, line: 24, baseType: !1341)
; !1341 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !10, line: 38, baseType: !1342)
; !1342 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
; !1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !7, file: !1302, line: 66)
; !1344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !58, file: !1302, line: 67)
; !1345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1346, file: !1302, line: 68)
; !1346 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !8, line: 27, baseType: !1347)
; !1347 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !10, line: 45, baseType: !41)
; !1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1349, file: !1302, line: 70)
; !1349 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1315, line: 71, baseType: !1342)
; !1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1351, file: !1302, line: 71)
; !1351 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1315, line: 73, baseType: !41)
; !1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1353, file: !1302, line: 72)
; !1353 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1315, line: 74, baseType: !41)
; !1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1355, file: !1302, line: 73)
; !1355 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1315, line: 75, baseType: !41)
; !1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1357, file: !1302, line: 75)
; !1357 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1315, line: 49, baseType: !1358)
; !1358 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !10, line: 53, baseType: !1341)
; !1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1360, file: !1302, line: 76)
; !1360 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1315, line: 50, baseType: !1361)
; !1361 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !10, line: 55, baseType: !9)
; !1362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1363, file: !1302, line: 77)
; !1363 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1315, line: 51, baseType: !1364)
; !1364 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !10, line: 57, baseType: !59)
; !1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1366, file: !1302, line: 78)
; !1366 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1315, line: 52, baseType: !1367)
; !1367 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !10, line: 59, baseType: !1347)
; !1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1369, file: !1302, line: 80)
; !1369 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1315, line: 102, baseType: !1370)
; !1370 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !10, line: 73, baseType: !41)
; !1371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1372, file: !1302, line: 81)
; !1372 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1315, line: 90, baseType: !41)
; !1373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1374, file: !1376, line: 53)
; !1374 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1375, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
; !1375 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a1d177e0f311dc60a74cb347049d75bc")
; !1376 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/clocale", directory: "")
; !1377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1378, file: !1376, line: 54)
; !1378 = !DISubprogram(name: "setlocale", scope: !1375, file: !1375, line: 122, type: !1379, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1379 = !DISubroutineType(types: !1380)
; !1380 = !{!555, !147, !391}
; !1381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1382, file: !1376, line: 55)
; !1382 = !DISubprogram(name: "localeconv", scope: !1375, file: !1375, line: 125, type: !1383, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1383 = !DISubroutineType(types: !1384)
; !1384 = !{!1385}
; !1385 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1374, size: 64)
; !1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1387, file: !1389, line: 64)
; !1387 = !DISubprogram(name: "isalnum", scope: !1388, file: !1388, line: 108, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1388 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "3ab3dd7fdf2578005732722ee2393e59")
; !1389 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cctype", directory: "")
; !1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1391, file: !1389, line: 65)
; !1391 = !DISubprogram(name: "isalpha", scope: !1388, file: !1388, line: 109, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1393, file: !1389, line: 66)
; !1393 = !DISubprogram(name: "iscntrl", scope: !1388, file: !1388, line: 110, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1395, file: !1389, line: 67)
; !1395 = !DISubprogram(name: "isdigit", scope: !1388, file: !1388, line: 111, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1397, file: !1389, line: 68)
; !1397 = !DISubprogram(name: "isgraph", scope: !1388, file: !1388, line: 113, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1399, file: !1389, line: 69)
; !1399 = !DISubprogram(name: "islower", scope: !1388, file: !1388, line: 112, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1401, file: !1389, line: 70)
; !1401 = !DISubprogram(name: "isprint", scope: !1388, file: !1388, line: 114, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1403, file: !1389, line: 71)
; !1403 = !DISubprogram(name: "ispunct", scope: !1388, file: !1388, line: 115, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1405, file: !1389, line: 72)
; !1405 = !DISubprogram(name: "isspace", scope: !1388, file: !1388, line: 116, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1407, file: !1389, line: 73)
; !1407 = !DISubprogram(name: "isupper", scope: !1388, file: !1388, line: 117, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1409, file: !1389, line: 74)
; !1409 = !DISubprogram(name: "isxdigit", scope: !1388, file: !1388, line: 118, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1411, file: !1389, line: 75)
; !1411 = !DISubprogram(name: "tolower", scope: !1388, file: !1388, line: 122, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1413, file: !1389, line: 76)
; !1413 = !DISubprogram(name: "toupper", scope: !1388, file: !1388, line: 125, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1415, file: !1389, line: 87)
; !1415 = !DISubprogram(name: "isblank", scope: !1388, file: !1388, line: 130, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1417, file: !1419, line: 98)
; !1417 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1418, line: 7, baseType: !1019)
; !1418 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
; !1419 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdio", directory: "")
; !1420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1421, file: !1419, line: 99)
; !1421 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1422, line: 84, baseType: !1423)
; !1422 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
; !1423 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1424, line: 14, baseType: !1425)
; !1424 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
; !1425 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1424, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
; !1426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1427, file: !1419, line: 101)
; !1427 = !DISubprogram(name: "clearerr", scope: !1422, file: !1422, line: 786, type: !1428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1428 = !DISubroutineType(types: !1429)
; !1429 = !{null, !1430}
; !1430 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1417, size: 64)
; !1431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1432, file: !1419, line: 102)
; !1432 = !DISubprogram(name: "fclose", scope: !1422, file: !1422, line: 178, type: !1433, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1433 = !DISubroutineType(types: !1434)
; !1434 = !{!147, !1430}
; !1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1436, file: !1419, line: 103)
; !1436 = !DISubprogram(name: "feof", scope: !1422, file: !1422, line: 788, type: !1433, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1438, file: !1419, line: 104)
; !1438 = !DISubprogram(name: "ferror", scope: !1422, file: !1422, line: 790, type: !1433, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1440, file: !1419, line: 105)
; !1440 = !DISubprogram(name: "fflush", scope: !1422, file: !1422, line: 230, type: !1433, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1442, file: !1419, line: 106)
; !1442 = !DISubprogram(name: "fgetc", scope: !1422, file: !1422, line: 513, type: !1433, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1444, file: !1419, line: 107)
; !1444 = !DISubprogram(name: "fgetpos", scope: !1422, file: !1422, line: 760, type: !1445, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1445 = !DISubroutineType(types: !1446)
; !1446 = !{!147, !1447, !1448}
; !1447 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1430)
; !1448 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1449)
; !1449 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1421, size: 64)
; !1450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1451, file: !1419, line: 108)
; !1451 = !DISubprogram(name: "fgets", scope: !1422, file: !1422, line: 592, type: !1452, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1452 = !DISubroutineType(types: !1453)
; !1453 = !{!555, !622, !147, !1447}
; !1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1455, file: !1419, line: 109)
; !1455 = !DISubprogram(name: "fopen", scope: !1422, file: !1422, line: 258, type: !1456, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1456 = !DISubroutineType(types: !1457)
; !1457 = !{!1430, !579, !579}
; !1458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1459, file: !1419, line: 110)
; !1459 = !DISubprogram(name: "fprintf", scope: !1422, file: !1422, line: 350, type: !1460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1460 = !DISubroutineType(types: !1461)
; !1461 = !{!147, !1447, !579, null}
; !1462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1463, file: !1419, line: 111)
; !1463 = !DISubprogram(name: "fputc", scope: !1422, file: !1422, line: 549, type: !1464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1464 = !DISubroutineType(types: !1465)
; !1465 = !{!147, !147, !1430}
; !1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1467, file: !1419, line: 112)
; !1467 = !DISubprogram(name: "fputs", scope: !1422, file: !1422, line: 655, type: !1468, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1468 = !DISubroutineType(types: !1469)
; !1469 = !{!147, !579, !1447}
; !1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1471, file: !1419, line: 113)
; !1471 = !DISubprogram(name: "fread", scope: !1422, file: !1422, line: 675, type: !1472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1472 = !DISubroutineType(types: !1473)
; !1473 = !{!95, !1474, !95, !95, !1447}
; !1474 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !98)
; !1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1476, file: !1419, line: 114)
; !1476 = !DISubprogram(name: "freopen", scope: !1422, file: !1422, line: 265, type: !1477, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1477 = !DISubroutineType(types: !1478)
; !1478 = !{!1430, !579, !579, !1447}
; !1479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1480, file: !1419, line: 115)
; !1480 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !1422, file: !1422, line: 434, type: !1460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1482, file: !1419, line: 116)
; !1482 = !DISubprogram(name: "fseek", scope: !1422, file: !1422, line: 713, type: !1483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1483 = !DISubroutineType(types: !1484)
; !1484 = !{!147, !1430, !372, !147}
; !1485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1486, file: !1419, line: 117)
; !1486 = !DISubprogram(name: "fsetpos", scope: !1422, file: !1422, line: 765, type: !1487, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1487 = !DISubroutineType(types: !1488)
; !1488 = !{!147, !1430, !1489}
; !1489 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1490, size: 64)
; !1490 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1421)
; !1491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1492, file: !1419, line: 118)
; !1492 = !DISubprogram(name: "ftell", scope: !1422, file: !1422, line: 718, type: !1493, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1493 = !DISubroutineType(types: !1494)
; !1494 = !{!372, !1430}
; !1495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1496, file: !1419, line: 119)
; !1496 = !DISubprogram(name: "fwrite", scope: !1422, file: !1422, line: 681, type: !1497, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1497 = !DISubroutineType(types: !1498)
; !1498 = !{!95, !1499, !95, !95, !1447}
; !1499 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !48)
; !1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1501, file: !1419, line: 120)
; !1501 = !DISubprogram(name: "getc", scope: !1422, file: !1422, line: 514, type: !1433, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1503, file: !1419, line: 121)
; !1503 = !DISubprogram(name: "getchar", scope: !1504, file: !1504, line: 47, type: !592, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1504 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c10e343656e7a2bf1044ef4e4442d902")
; !1505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1506, file: !1419, line: 126)
; !1506 = !DISubprogram(name: "perror", scope: !1422, file: !1422, line: 804, type: !1507, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1507 = !DISubroutineType(types: !1508)
; !1508 = !{null, !391}
; !1509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1510, file: !1419, line: 127)
; !1510 = !DISubprogram(name: "printf", scope: !1422, file: !1422, line: 356, type: !1511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1511 = !DISubroutineType(types: !1512)
; !1512 = !{!147, !579, null}
; !1513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1514, file: !1419, line: 128)
; !1514 = !DISubprogram(name: "putc", scope: !1422, file: !1422, line: 550, type: !1464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1516, file: !1419, line: 129)
; !1516 = !DISubprogram(name: "putchar", scope: !1504, file: !1504, line: 82, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1518, file: !1419, line: 130)
; !1518 = !DISubprogram(name: "puts", scope: !1422, file: !1422, line: 661, type: !522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1520, file: !1419, line: 131)
; !1520 = !DISubprogram(name: "remove", scope: !1422, file: !1422, line: 152, type: !522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1522, file: !1419, line: 132)
; !1522 = !DISubprogram(name: "rename", scope: !1422, file: !1422, line: 154, type: !1523, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1523 = !DISubroutineType(types: !1524)
; !1524 = !{!147, !391, !391}
; !1525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1526, file: !1419, line: 133)
; !1526 = !DISubprogram(name: "rewind", scope: !1422, file: !1422, line: 723, type: !1428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1528, file: !1419, line: 134)
; !1528 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !1422, file: !1422, line: 437, type: !1511, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1530, file: !1419, line: 135)
; !1530 = !DISubprogram(name: "setbuf", scope: !1422, file: !1422, line: 328, type: !1531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1531 = !DISubroutineType(types: !1532)
; !1532 = !{null, !1447, !622}
; !1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1534, file: !1419, line: 136)
; !1534 = !DISubprogram(name: "setvbuf", scope: !1422, file: !1422, line: 332, type: !1535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1535 = !DISubroutineType(types: !1536)
; !1536 = !{!147, !1447, !622, !147, !95}
; !1537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1538, file: !1419, line: 137)
; !1538 = !DISubprogram(name: "sprintf", scope: !1422, file: !1422, line: 358, type: !1539, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1539 = !DISubroutineType(types: !1540)
; !1540 = !{!147, !622, !579, null}
; !1541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1542, file: !1419, line: 138)
; !1542 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !1422, file: !1422, line: 439, type: !1543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1543 = !DISubroutineType(types: !1544)
; !1544 = !{!147, !579, !579, null}
; !1545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1546, file: !1419, line: 139)
; !1546 = !DISubprogram(name: "tmpfile", scope: !1422, file: !1422, line: 188, type: !1547, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1547 = !DISubroutineType(types: !1548)
; !1548 = !{!1430}
; !1549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1550, file: !1419, line: 141)
; !1550 = !DISubprogram(name: "tmpnam", scope: !1422, file: !1422, line: 205, type: !1551, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1551 = !DISubroutineType(types: !1552)
; !1552 = !{!555, !555}
; !1553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1554, file: !1419, line: 143)
; !1554 = !DISubprogram(name: "ungetc", scope: !1422, file: !1422, line: 668, type: !1464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1556, file: !1419, line: 144)
; !1556 = !DISubprogram(name: "vfprintf", scope: !1422, file: !1422, line: 365, type: !1557, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1557 = !DISubroutineType(types: !1558)
; !1558 = !{!147, !1447, !579, !1142}
; !1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1560, file: !1419, line: 145)
; !1560 = !DISubprogram(name: "vprintf", scope: !1504, file: !1504, line: 39, type: !1561, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1561 = !DISubroutineType(types: !1562)
; !1562 = !{!147, !579, !1142}
; !1563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1564, file: !1419, line: 146)
; !1564 = !DISubprogram(name: "vsprintf", scope: !1422, file: !1422, line: 373, type: !1565, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1565 = !DISubroutineType(types: !1566)
; !1566 = !{!147, !622, !579, !1142}
; !1567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !1568, file: !1419, line: 175)
; !1568 = !DISubprogram(name: "snprintf", scope: !1422, file: !1422, line: 378, type: !1569, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1569 = !DISubroutineType(types: !1570)
; !1570 = !{!147, !622, !95, !579, null}
; !1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !1572, file: !1419, line: 176)
; !1572 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !1422, file: !1422, line: 479, type: !1557, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !1574, file: !1419, line: 177)
; !1574 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !1422, file: !1422, line: 484, type: !1561, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !1576, file: !1419, line: 178)
; !1576 = !DISubprogram(name: "vsnprintf", scope: !1422, file: !1422, line: 382, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1577 = !DISubroutineType(types: !1578)
; !1578 = !{!147, !622, !95, !579, !1142}
; !1579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !631, entity: !1580, file: !1419, line: 179)
; !1580 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !1422, file: !1422, line: 487, type: !1581, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1581 = !DISubroutineType(types: !1582)
; !1582 = !{!147, !579, !579, !1142}
; !1583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1568, file: !1419, line: 185)
; !1584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1572, file: !1419, line: 186)
; !1585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1574, file: !1419, line: 187)
; !1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1576, file: !1419, line: 188)
; !1587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1580, file: !1419, line: 189)
; !1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1589, file: !1593, line: 82)
; !1589 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1590, line: 48, baseType: !1591)
; !1590 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "9bcd8e8b8cd2078c8a6c42e262af7d7b")
; !1591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1592, size: 64)
; !1592 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1309)
; !1593 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cwctype", directory: "")
; !1594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1595, file: !1593, line: 83)
; !1595 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1596, line: 38, baseType: !41)
; !1596 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "48fed714a84c77fca0455b433489fc47")
; !1597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1005, file: !1593, line: 84)
; !1598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1599, file: !1593, line: 86)
; !1599 = !DISubprogram(name: "iswalnum", scope: !1596, file: !1596, line: 95, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1601, file: !1593, line: 87)
; !1601 = !DISubprogram(name: "iswalpha", scope: !1596, file: !1596, line: 101, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1603, file: !1593, line: 89)
; !1603 = !DISubprogram(name: "iswblank", scope: !1596, file: !1596, line: 146, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1605, file: !1593, line: 91)
; !1605 = !DISubprogram(name: "iswcntrl", scope: !1596, file: !1596, line: 104, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1607, file: !1593, line: 92)
; !1607 = !DISubprogram(name: "iswctype", scope: !1596, file: !1596, line: 159, type: !1608, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1608 = !DISubroutineType(types: !1609)
; !1609 = !{!147, !1005, !1595}
; !1610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1611, file: !1593, line: 93)
; !1611 = !DISubprogram(name: "iswdigit", scope: !1596, file: !1596, line: 108, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1613, file: !1593, line: 94)
; !1613 = !DISubprogram(name: "iswgraph", scope: !1596, file: !1596, line: 112, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1615, file: !1593, line: 95)
; !1615 = !DISubprogram(name: "iswlower", scope: !1596, file: !1596, line: 117, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1617, file: !1593, line: 96)
; !1617 = !DISubprogram(name: "iswprint", scope: !1596, file: !1596, line: 120, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1619, file: !1593, line: 97)
; !1619 = !DISubprogram(name: "iswpunct", scope: !1596, file: !1596, line: 125, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1621, file: !1593, line: 98)
; !1621 = !DISubprogram(name: "iswspace", scope: !1596, file: !1596, line: 130, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1623, file: !1593, line: 99)
; !1623 = !DISubprogram(name: "iswupper", scope: !1596, file: !1596, line: 135, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1625, file: !1593, line: 100)
; !1625 = !DISubprogram(name: "iswxdigit", scope: !1596, file: !1596, line: 140, type: !1240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1627, file: !1593, line: 101)
; !1627 = !DISubprogram(name: "towctrans", scope: !1590, file: !1590, line: 55, type: !1628, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1628 = !DISubroutineType(types: !1629)
; !1629 = !{!1005, !1005, !1589}
; !1630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1631, file: !1593, line: 102)
; !1631 = !DISubprogram(name: "towlower", scope: !1596, file: !1596, line: 166, type: !1632, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1632 = !DISubroutineType(types: !1633)
; !1633 = !{!1005, !1005}
; !1634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1635, file: !1593, line: 103)
; !1635 = !DISubprogram(name: "towupper", scope: !1596, file: !1596, line: 169, type: !1632, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1637, file: !1593, line: 104)
; !1637 = !DISubprogram(name: "wctrans", scope: !1590, file: !1590, line: 52, type: !1638, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1638 = !DISubroutineType(types: !1639)
; !1639 = !{!1589, !391}
; !1640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1641, file: !1593, line: 105)
; !1641 = !DISubprogram(name: "wctype", scope: !1596, file: !1596, line: 155, type: !1642, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1642 = !DISubroutineType(types: !1643)
; !1643 = !{!1595, !391}
; !1644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1645, file: !1648, line: 60)
; !1645 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1646, line: 7, baseType: !1647)
; !1646 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
; !1647 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !10, line: 156, baseType: !372)
; !1648 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ctime", directory: "")
; !1649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1650, file: !1648, line: 61)
; !1650 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1651, line: 10, baseType: !1652)
; !1651 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
; !1652 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !10, line: 160, baseType: !372)
; !1653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1189, file: !1648, line: 62)
; !1654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1655, file: !1648, line: 64)
; !1655 = !DISubprogram(name: "clock", scope: !1656, file: !1656, line: 72, type: !1657, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1656 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "db37158473a25e1d89b19f8bc6892801")
; !1657 = !DISubroutineType(types: !1658)
; !1658 = !{!1645}
; !1659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1660, file: !1648, line: 65)
; !1660 = !DISubprogram(name: "difftime", scope: !1656, file: !1656, line: 79, type: !1661, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1661 = !DISubroutineType(types: !1662)
; !1662 = !{!154, !1650, !1650}
; !1663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1664, file: !1648, line: 66)
; !1664 = !DISubprogram(name: "mktime", scope: !1656, file: !1656, line: 83, type: !1665, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1665 = !DISubroutineType(types: !1666)
; !1666 = !{!1650, !1667}
; !1667 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1189, size: 64)
; !1668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1669, file: !1648, line: 67)
; !1669 = !DISubprogram(name: "time", scope: !1656, file: !1656, line: 76, type: !1670, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1670 = !DISubroutineType(types: !1671)
; !1671 = !{!1650, !1672}
; !1672 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1650, size: 64)
; !1673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1674, file: !1648, line: 68)
; !1674 = !DISubprogram(name: "asctime", scope: !1656, file: !1656, line: 179, type: !1675, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1675 = !DISubroutineType(types: !1676)
; !1676 = !{!555, !1187}
; !1677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1678, file: !1648, line: 69)
; !1678 = !DISubprogram(name: "ctime", scope: !1656, file: !1656, line: 183, type: !1679, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1679 = !DISubroutineType(types: !1680)
; !1680 = !{!555, !1681}
; !1681 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1682, size: 64)
; !1682 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1650)
; !1683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1684, file: !1648, line: 70)
; !1684 = !DISubprogram(name: "gmtime", scope: !1656, file: !1656, line: 132, type: !1685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1685 = !DISubroutineType(types: !1686)
; !1686 = !{!1667, !1681}
; !1687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1688, file: !1648, line: 71)
; !1688 = !DISubprogram(name: "localtime", scope: !1656, file: !1656, line: 136, type: !1685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1690, file: !1648, line: 72)
; !1690 = !DISubprogram(name: "strftime", scope: !1656, file: !1656, line: 100, type: !1691, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1691 = !DISubroutineType(types: !1692)
; !1692 = !{!95, !622, !95, !579, !1186}
; !1693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1694, file: !1648, line: 79)
; !1694 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1695, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1696, identifier: "_ZTS8timespec")
; !1695 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
; !1696 = !{!1697, !1698}
; !1697 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1694, file: !1695, line: 16, baseType: !1652, size: 64)
; !1698 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1694, file: !1695, line: 21, baseType: !1699, size: 64, offset: 64)
; !1699 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !10, line: 197, baseType: !372)
; !1700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1701, file: !1648, line: 80)
; !1701 = !DISubprogram(name: "timespec_get", scope: !1656, file: !1656, line: 371, type: !1702, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1702 = !DISubroutineType(types: !1703)
; !1703 = !{!147, !1704, !147}
; !1704 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1694, size: 64)
; !1705 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1706, entity: !1707, file: !1709, line: 1321)
; !1706 = !DINamespace(name: "chrono", scope: !40)
; !1707 = !DINamespace(name: "chrono_literals", scope: !1708, exportSymbols: true)
; !1708 = !DINamespace(name: "literals", scope: !40, exportSymbols: true)
; !1709 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/chrono.h", directory: "")
; !1710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1711, file: !1715, line: 77)
; !1711 = !DISubprogram(name: "memchr", scope: !1712, file: !1712, line: 100, type: !1713, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1712 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "f443da8025a0b7c1498fb6c554ec788d")
; !1713 = !DISubroutineType(types: !1714)
; !1714 = !{!48, !48, !147, !95}
; !1715 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstring", directory: "")
; !1716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1717, file: !1715, line: 78)
; !1717 = !DISubprogram(name: "memcmp", scope: !1712, file: !1712, line: 64, type: !1718, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1718 = !DISubroutineType(types: !1719)
; !1719 = !{!147, !48, !48, !95}
; !1720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1721, file: !1715, line: 79)
; !1721 = !DISubprogram(name: "memcpy", linkageName: "_ZL6memcpyPvPKvm", scope: !1722, file: !1722, line: 1084, type: !1723, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !1722 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "59790372eacbad80338513022c6135db")
; !1723 = !DISubroutineType(types: !1724)
; !1724 = !{!98, !98, !48, !95}
; !1725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1726, file: !1715, line: 80)
; !1726 = !DISubprogram(name: "memmove", scope: !1712, file: !1712, line: 47, type: !1723, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1728, file: !1715, line: 81)
; !1728 = !DISubprogram(name: "memset", linkageName: "_ZL6memsetPvim", scope: !1722, file: !1722, line: 1088, type: !1729, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
; !1729 = !DISubroutineType(types: !1730)
; !1730 = !{!98, !98, !147, !95}
; !1731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1732, file: !1715, line: 82)
; !1732 = !DISubprogram(name: "strcat", scope: !1712, file: !1712, line: 149, type: !1733, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1733 = !DISubroutineType(types: !1734)
; !1734 = !{!555, !622, !579}
; !1735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1736, file: !1715, line: 83)
; !1736 = !DISubprogram(name: "strcmp", scope: !1712, file: !1712, line: 156, type: !1523, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1738, file: !1715, line: 84)
; !1738 = !DISubprogram(name: "strcoll", scope: !1712, file: !1712, line: 163, type: !1523, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1740, file: !1715, line: 85)
; !1740 = !DISubprogram(name: "strcpy", scope: !1712, file: !1712, line: 141, type: !1733, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1742, file: !1715, line: 86)
; !1742 = !DISubprogram(name: "strcspn", scope: !1712, file: !1712, line: 293, type: !1743, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1743 = !DISubroutineType(types: !1744)
; !1744 = !{!95, !391, !391}
; !1745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1746, file: !1715, line: 87)
; !1746 = !DISubprogram(name: "strerror", scope: !1712, file: !1712, line: 419, type: !1747, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1747 = !DISubroutineType(types: !1748)
; !1748 = !{!555, !147}
; !1749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1750, file: !1715, line: 88)
; !1750 = !DISubprogram(name: "strlen", scope: !1712, file: !1712, line: 407, type: !1751, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1751 = !DISubroutineType(types: !1752)
; !1752 = !{!95, !391}
; !1753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1754, file: !1715, line: 89)
; !1754 = !DISubprogram(name: "strncat", scope: !1712, file: !1712, line: 152, type: !1755, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1755 = !DISubroutineType(types: !1756)
; !1756 = !{!555, !622, !579, !95}
; !1757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1758, file: !1715, line: 90)
; !1758 = !DISubprogram(name: "strncmp", scope: !1712, file: !1712, line: 159, type: !1759, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1759 = !DISubroutineType(types: !1760)
; !1760 = !{!147, !391, !391, !95}
; !1761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1762, file: !1715, line: 91)
; !1762 = !DISubprogram(name: "strncpy", scope: !1712, file: !1712, line: 144, type: !1755, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1764, file: !1715, line: 92)
; !1764 = !DISubprogram(name: "strspn", scope: !1712, file: !1712, line: 297, type: !1743, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1766, file: !1715, line: 93)
; !1766 = !DISubprogram(name: "strtok", scope: !1712, file: !1712, line: 356, type: !1733, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1768, file: !1715, line: 94)
; !1768 = !DISubprogram(name: "strxfrm", scope: !1712, file: !1712, line: 166, type: !1769, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1769 = !DISubroutineType(types: !1770)
; !1770 = !{!95, !622, !579, !95}
; !1771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1772, file: !1715, line: 95)
; !1772 = !DISubprogram(name: "strchr", scope: !1712, file: !1712, line: 239, type: !1773, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1773 = !DISubroutineType(types: !1774)
; !1774 = !{!391, !391, !147}
; !1775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1776, file: !1715, line: 96)
; !1776 = !DISubprogram(name: "strpbrk", scope: !1712, file: !1712, line: 316, type: !1777, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1777 = !DISubroutineType(types: !1778)
; !1778 = !{!391, !391, !391}
; !1779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1780, file: !1715, line: 97)
; !1780 = !DISubprogram(name: "strrchr", scope: !1712, file: !1712, line: 266, type: !1773, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1782, file: !1715, line: 98)
; !1782 = !DISubprogram(name: "strstr", scope: !1712, file: !1712, line: 343, type: !1777, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1784, file: !1787, line: 58)
; !1784 = !DIDerivedType(tag: DW_TAG_typedef, name: "imaxdiv_t", file: !1785, line: 275, baseType: !1786)
; !1785 = !DIFile(filename: "/usr/include/inttypes.h", directory: "", checksumkind: CSK_MD5, checksum: "e498a0d76716f3e3909f4b6f2cb2f20f")
; !1786 = !DICompositeType(tag: DW_TAG_structure_type, file: !1785, line: 271, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9imaxdiv_t")
; !1787 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cinttypes", directory: "")
; !1788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1789, file: !1787, line: 61)
; !1789 = !DISubprogram(name: "imaxabs", scope: !1785, file: !1785, line: 290, type: !1790, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1790 = !DISubroutineType(types: !1791)
; !1791 = !{!1335, !1335}
; !1792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1793, file: !1787, line: 62)
; !1793 = !DISubprogram(name: "imaxdiv", scope: !1785, file: !1785, line: 293, type: !1794, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1794 = !DISubroutineType(types: !1795)
; !1795 = !{!1784, !1335, !1335}
; !1796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1797, file: !1787, line: 68)
; !1797 = !DISubprogram(name: "strtoimax", scope: !1785, file: !1785, line: 297, type: !1798, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1798 = !DISubroutineType(types: !1799)
; !1799 = !{!1335, !579, !606, !147}
; !1800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1801, file: !1787, line: 69)
; !1801 = !DISubprogram(name: "strtoumax", scope: !1785, file: !1785, line: 301, type: !1802, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1802 = !DISubroutineType(types: !1803)
; !1803 = !{!1369, !579, !606, !147}
; !1804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1805, file: !1787, line: 72)
; !1805 = !DISubprogram(name: "wcstoimax", scope: !1785, file: !1785, line: 305, type: !1806, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1806 = !DISubroutineType(types: !1807)
; !1807 = !{!1335, !623, !1216, !147}
; !1808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1809, file: !1787, line: 73)
; !1809 = !DISubprogram(name: "wcstoumax", scope: !1785, file: !1785, line: 310, type: !1810, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
; !1810 = !DISubroutineType(types: !1811)
; !1811 = !{!1369, !623, !1216, !147}
; !1812 = distinct !DILifetime(object: !1813, location: !DIExpr(DIOpArg(0, %"struct.scabbard::trace::DeviceAsyncQueue"* addrspace(1)*), DIOpDeref(%"struct.scabbard::trace::DeviceAsyncQueue"*)), argObjects: {!0})
; !1813 = distinct !DIGlobalVariable(name: "DEVICE_TRACE_LOGGER", linkageName: "_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE", scope: !34, file: !1814, line: 21, type: !1815, isLocal: false, isDefinition: true)
; !1814 = !DIFile(filename: "../include/scabbard/trace/globals.hpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "c31b92113cb69285c1b1a361eeed62bb")
; !1815 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
; !1816 = !{i32 7, !"Dwarf Version", i32 5}
; !1817 = !{i32 2, !"Debug Info Version", i32 4}
; !1818 = !{i32 1, !"wchar_size", i32 4}
; !1819 = !{i32 7, !"PIC Level", i32 1}
; !1820 = !{i32 2, i32 0}
; !1821 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}

; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa-gfx1030

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = 'defs.cpp'
source_filename = "defs.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.scabbard::trace::DeviceAsyncQueue" = type { [64 x %"struct.scabbard::trace::DeviceAsyncQueue::Lane"] }
%"struct.scabbard::trace::DeviceAsyncQueue::Lane" = type { i64, [64 x %"struct.scabbard::trace::TraceData"] }
%"struct.scabbard::trace::TraceData" = type { i64, i16, %"union.scabbard::trace::ThreadId", i8*, %"struct.scabbard::LocationMetadata", i64 }
%"union.scabbard::trace::ThreadId" = type { %"class.std::thread::id", [8 x i8] }
%"class.std::thread::id" = type { i64 }
%"struct.scabbard::LocationMetadata" = type { i64, i32, i32 }
%"class.std::ios_base::Init" = type { i8 }
%"class.scabbard::trace::AsyncQueue" = type { %"struct.scabbard::trace::DeviceAsyncQueue"*, [64 x i64], %"struct.scabbard::trace::DeviceAsyncQueue", %"class.std::queue", %"class.std::mutex", %"class.scabbard::trace::TraceWriter"*, %"class.std::thread"*, i8, %"struct.std::chrono::duration", %"class.scabbard::trace::MetadataStore" }
%"class.std::queue" = type { %"class.std::deque" }
%"class.std::deque" = type { %"class.std::_Deque_base" }
%"class.std::_Deque_base" = type { %"struct.std::_Deque_base<scabbard::trace::TraceData, std::allocator<scabbard::trace::TraceData>>::_Deque_impl" }
%"struct.std::_Deque_base<scabbard::trace::TraceData, std::allocator<scabbard::trace::TraceData>>::_Deque_impl" = type { %"struct.std::_Deque_base<scabbard::trace::TraceData, std::allocator<scabbard::trace::TraceData>>::_Deque_impl_data" }
%"struct.std::_Deque_base<scabbard::trace::TraceData, std::allocator<scabbard::trace::TraceData>>::_Deque_impl_data" = type { %"struct.scabbard::trace::TraceData"**, i64, %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator" }
%"struct.std::_Deque_iterator" = type { %"struct.scabbard::trace::TraceData"*, %"struct.scabbard::trace::TraceData"*, %"struct.scabbard::trace::TraceData"*, %"struct.scabbard::trace::TraceData"** }
%"class.std::mutex" = type { %"class.std::__mutex_base" }
%"class.std::__mutex_base" = type { %union.pthread_mutex_t }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.scabbard::trace::TraceWriter" = type { %"class.std::basic_ofstream", %"class.std::fpos" }
%"class.std::basic_ofstream" = type { %"class.std::basic_ostream.base", %"class.std::basic_filebuf", %"class.std::basic_ios" }
%"class.std::basic_ostream.base" = type { i32 (...)** }
%"class.std::basic_filebuf" = type { %"class.std::basic_streambuf", %union.pthread_mutex_t, %"class.std::__basic_file", i32, %struct.__mbstate_t, %struct.__mbstate_t, %struct.__mbstate_t, i8*, i64, i8, i8, i8, i8, i8*, i8*, i8, %"class.std::codecvt"*, i8*, i64, i8*, i8* }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::__basic_file" = type <{ %struct._IO_FILE*, i8, [7 x i8] }>
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.__mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }
%"class.std::codecvt" = type { %"class.std::__codecvt_abstract_base.base", %struct.__locale_struct* }
%"class.std::__codecvt_abstract_base.base" = type { %"class.std::locale::facet.base" }
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::fpos" = type { i64, %struct.__mbstate_t }
%"class.std::thread" = type { %"class.std::thread::id" }
%"struct.std::chrono::duration" = type { i64 }
%"class.scabbard::trace::MetadataStore" = type { %"class.std::vector", %"class.std::unordered_map" }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<std::__cxx11::basic_string<char>, std::allocator<std::__cxx11::basic_string<char>>>::_Vector_impl" }
%"struct.std::_Vector_base<std::__cxx11::basic_string<char>, std::allocator<std::__cxx11::basic_string<char>>>::_Vector_impl" = type { %"struct.std::_Vector_base<std::__cxx11::basic_string<char>, std::allocator<std::__cxx11::basic_string<char>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<std::__cxx11::basic_string<char>, std::allocator<std::__cxx11::basic_string<char>>>::_Vector_impl_data" = type { %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"* }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon.6 }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { i8* }
%union.anon.6 = type { i64, [8 x i8] }
%"class.std::unordered_map" = type { %"class.std::_Hashtable" }
%"class.std::_Hashtable" = type { %"struct.std::__detail::_Hash_node_base"**, i64, %"struct.std::__detail::_Hash_node_base", i64, %"struct.std::__detail::_Prime_rehash_policy", %"struct.std::__detail::_Hash_node_base"* }
%"struct.std::__detail::_Hash_node_base" = type { %"struct.std::__detail::_Hash_node_base"* }
%"struct.std::__detail::_Prime_rehash_policy" = type { float, i64 }
%"class.std::allocator.3" = type { i8 }
%"struct.std::forward_iterator_tag" = type { i8 }
%struct.hipPointerAttribute_t = type { i32, i32, i8*, i8*, i32, i32 }

$_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_RKS8_ = comdat any

$_ZN8scabbard5trace16DeviceAsyncQueueC2Ev = comdat any

$__hip_gpubin_handle = comdat any

@_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE = internal global %"struct.scabbard::trace::DeviceAsyncQueue"* undef, align 8, !dbg !0
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !173
@__dso_handle = external hidden global i8
@_ZN8scabbard5trace12TRACE_LOGGERE = dso_local global %"class.scabbard::trace::AsyncQueue" zeroinitializer, align 8, !dbg !179
@.str = private unnamed_addr constant [31 x i8] c"SCABBARD_INSTRUMENTED_EXE_NAME\00", align 1, !dbg !183
@.str.2 = private unnamed_addr constant [12 x i8] c"unknown_exe\00", align 1, !dbg !190
@.str.3 = private unnamed_addr constant [20 x i8] c"SCABBARD_TRACE_FILE\00", align 1, !dbg !195
@.str.4 = private unnamed_addr constant [3 x i8] c"./\00", align 1, !dbg !200
@.str.5 = private unnamed_addr constant [16 x i8] c".scabbard.trace\00", align 1, !dbg !205
@_ZSt4cerr = external dso_local global %"class.std::basic_ostream", align 8
@.str.6 = private unnamed_addr constant [104 x i8] c"\0A[scabbard::trace::init::ERROR] could not allocate space for the device side async queue! [hipError_t: \00", align 1, !dbg !210
@.str.7 = private unnamed_addr constant [3 x i8] c"]\0A\00", align 1, !dbg !215
@.str.8 = private unnamed_addr constant [44 x i8] c"\0A[scabbard::trace::init::INFO] api reports \00", align 1, !dbg !217
@.str.9 = private unnamed_addr constant [36 x i8] c" compatible devices on this system\0A\00", align 1, !dbg !222
@.str.10 = private unnamed_addr constant [94 x i8] c"\0A[scabbard::trace::init::ERROR] could not get the number of compatible devices! [hipError_t: \00", align 1, !dbg !227
@.str.11 = private unnamed_addr constant [115 x i8] c"\0A[scabbard::trace::init::ERROR] failed to copy the initial device side async queue to the device(s)! [hipError_t: \00", align 1, !dbg !232
@.str.12 = private unnamed_addr constant [109 x i8] c"\0A[scabbard::trace::cond::ERROR] could not get the properties of a pointer with `hipPointerGetAttributes()`!\0A\00", align 1, !dbg !237
@.str.14 = private unnamed_addr constant [21 x i8] c"basic_string::append\00", align 1, !dbg !242
@0 = private unnamed_addr constant [41 x i8] c"_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE\00", align 1
@__hip_fatbin = external constant i8, section ".hip_fatbin"
@__hip_fatbin_wrapper = internal constant { i32, i32, i8*, i8* } { i32 1212764230, i32 1, i8* @__hip_fatbin, i8* null }, section ".hipFatBinSegment", align 8
@__hip_gpubin_handle = linkonce hidden local_unnamed_addr global i8** null, comdat, align 8
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_defs.cpp, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @__hip_module_ctor, i8* null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

declare dso_local void @_ZN8scabbard5trace10AsyncQueueC1Ev(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408)) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZN8scabbard5trace10AsyncQueueD1Ev(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408)) unnamed_addr #1

; Function Attrs: uwtable
define dso_local void @scabbard.trace.scabbard_init() local_unnamed_addr #3 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2912 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca %"class.std::__cxx11::basic_string", align 8
  %4 = alloca %"class.std::__cxx11::basic_string", align 8
  %5 = alloca %"class.std::__cxx11::basic_string", align 8
  %6 = alloca %"struct.scabbard::trace::DeviceAsyncQueue"*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %"struct.scabbard::trace::DeviceAsyncQueue", align 8
  %9 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)) #19, !dbg !2927
  call void @llvm.dbg.value(metadata i8* %9, metadata !2914, metadata !DIExpression()), !dbg !2928
  %10 = bitcast %"class.std::__cxx11::basic_string"* %3 to i8*, !dbg !2929
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %10) #19, !dbg !2929
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %3, metadata !2916, metadata !DIExpression()), !dbg !2930
  %11 = icmp eq i8* %9, null, !dbg !2931
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !2932, metadata !DIExpression()), !dbg !2944
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !2932, metadata !DIExpression()), !dbg !2946
  %12 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 2, !dbg !2928
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !2948, metadata !DIExpression()), !dbg !2954
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !2948, metadata !DIExpression()), !dbg !2956
  call void @llvm.dbg.value(metadata %union.anon.6* %12, metadata !2951, metadata !DIExpression()), !dbg !2954
  call void @llvm.dbg.value(metadata %union.anon.6* %12, metadata !2951, metadata !DIExpression()), !dbg !2956
  call void @llvm.dbg.value(metadata %"class.std::allocator.3"* undef, metadata !2952, metadata !DIExpression()), !dbg !2954
  call void @llvm.dbg.value(metadata %"class.std::allocator.3"* undef, metadata !2952, metadata !DIExpression()), !dbg !2956
  %13 = bitcast %"class.std::__cxx11::basic_string"* %3 to %union.anon.6**, !dbg !2928
  store %union.anon.6* %12, %union.anon.6** %13, align 8, !dbg !2928, !tbaa !2958
  %14 = bitcast %union.anon.6* %12 to i8*, !dbg !2928
  br i1 %11, label %29, label %15, !dbg !2931

15:                                               ; preds = %0
  call void @llvm.dbg.value(metadata i8* %9, metadata !2940, metadata !DIExpression()), !dbg !2946
  call void @llvm.dbg.value(metadata %"class.std::allocator.3"* undef, metadata !2941, metadata !DIExpression()), !dbg !2946
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !2963, metadata !DIExpression()), !dbg !2966
  call void @llvm.dbg.value(metadata i8* %9, metadata !2968, metadata !DIExpression()), !dbg !2971
  %16 = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %9) #19, !dbg !2973
  call void @llvm.dbg.value(metadata !DIArgList(i8* %9, i64 %16), metadata !2942, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !2974
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !1228, metadata !DIExpression()), !dbg !2975
  call void @llvm.dbg.value(metadata i8* %9, metadata !1230, metadata !DIExpression()), !dbg !2975
  call void @llvm.dbg.value(metadata !DIArgList(i8* %9, i64 %16), metadata !1231, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !2975
  call void @llvm.dbg.declare(metadata %"struct.std::forward_iterator_tag"* undef, metadata !1232, metadata !DIExpression()), !dbg !2977
  %17 = bitcast i64* %2 to i8*, !dbg !2978
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %17) #19, !dbg !2978
  call void @llvm.dbg.value(metadata i64 %16, metadata !1233, metadata !DIExpression()), !dbg !2975
  store i64 %16, i64* %2, align 8, !dbg !2979, !tbaa !2980
  %18 = icmp ugt i64 %16, 15, !dbg !2982
  br i1 %18, label %19, label %24, !dbg !2984

19:                                               ; preds = %15
  call void @llvm.dbg.value(metadata i64* %2, metadata !1233, metadata !DIExpression(DW_OP_deref)), !dbg !2975
  %20 = call noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %3, i64* noundef nonnull align 8 dereferenceable(8) %2, i64 noundef 0), !dbg !2985
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !2987, metadata !DIExpression()), !dbg !2991
  call void @llvm.dbg.value(metadata i8* %20, metadata !2990, metadata !DIExpression()), !dbg !2991
  %21 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 0, i32 0, !dbg !2993
  store i8* %20, i8** %21, align 8, !dbg !2994, !tbaa !2995
  %22 = load i64, i64* %2, align 8, !dbg !2997, !tbaa !2980
  call void @llvm.dbg.value(metadata i64 %22, metadata !1233, metadata !DIExpression()), !dbg !2975
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !2998, metadata !DIExpression()), !dbg !3002
  call void @llvm.dbg.value(metadata i64 %22, metadata !3001, metadata !DIExpression()), !dbg !3002
  %23 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 2, i32 0, !dbg !3004
  store i64 %22, i64* %23, align 8, !dbg !3005, !tbaa !3006
  br label %24, !dbg !3007

24:                                               ; preds = %19, %15
  %25 = phi i8* [ %20, %19 ], [ %14, %15 ], !dbg !3008
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !1234, metadata !DIExpression()), !dbg !2975
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3011, metadata !DIExpression()), !dbg !3014
  call void @llvm.dbg.value(metadata i8* %25, metadata !3015, metadata !DIExpression()), !dbg !3020
  call void @llvm.dbg.value(metadata i8* %9, metadata !3018, metadata !DIExpression()), !dbg !3020
  call void @llvm.dbg.value(metadata !DIArgList(i8* %9, i64 %16), metadata !3019, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !3020
  call void @llvm.dbg.value(metadata i8* %25, metadata !3022, metadata !DIExpression()), !dbg !3027
  call void @llvm.dbg.value(metadata i8* %9, metadata !3025, metadata !DIExpression()), !dbg !3027
  call void @llvm.dbg.value(metadata i64 %16, metadata !3026, metadata !DIExpression()), !dbg !3027
  switch i64 %16, label %28 [
    i64 1, label %26
    i64 0, label %32
  ], !dbg !3029

26:                                               ; preds = %24
  call void @llvm.dbg.value(metadata i8* %25, metadata !3030, metadata !DIExpression()), !dbg !3034
  call void @llvm.dbg.value(metadata i8* %9, metadata !3033, metadata !DIExpression()), !dbg !3034
  %27 = load i8, i8* %9, align 1, !dbg !3037, !tbaa !3006
  store i8 %27, i8* %25, align 1, !dbg !3038, !tbaa !3006
  br label %32, !dbg !3039

28:                                               ; preds = %24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %25, i8* nonnull align 1 %9, i64 %16, i1 false), !dbg !3040
  br label %32, !dbg !3047

29:                                               ; preds = %0
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), metadata !2940, metadata !DIExpression()), !dbg !2944
  call void @llvm.dbg.value(metadata %"class.std::allocator.3"* undef, metadata !2941, metadata !DIExpression()), !dbg !2944
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !2963, metadata !DIExpression()), !dbg !3048
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), metadata !2968, metadata !DIExpression()), !dbg !3050
  call void @llvm.dbg.value(metadata !DIArgList(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i64 11), metadata !2942, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !3052
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !1228, metadata !DIExpression()), !dbg !3053
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), metadata !1230, metadata !DIExpression()), !dbg !3053
  call void @llvm.dbg.value(metadata !DIArgList(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i64 11), metadata !1231, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !3053
  call void @llvm.dbg.declare(metadata %"struct.std::forward_iterator_tag"* undef, metadata !1232, metadata !DIExpression()), !dbg !3055
  call void @llvm.dbg.value(metadata i64 11, metadata !1233, metadata !DIExpression()), !dbg !3053
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !1234, metadata !DIExpression()), !dbg !3053
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3011, metadata !DIExpression()), !dbg !3056
  call void @llvm.dbg.value(metadata i8* %14, metadata !3015, metadata !DIExpression()), !dbg !3058
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), metadata !3018, metadata !DIExpression()), !dbg !3058
  call void @llvm.dbg.value(metadata !DIArgList(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i64 11), metadata !3019, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !3058
  call void @llvm.dbg.value(metadata i8* %14, metadata !3022, metadata !DIExpression()), !dbg !3060
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), metadata !3025, metadata !DIExpression()), !dbg !3060
  call void @llvm.dbg.value(metadata i64 11, metadata !3026, metadata !DIExpression()), !dbg !3060
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(11) %14, i8* noundef nonnull align 1 dereferenceable(11) getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i64 11, i1 false), !dbg !3062
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* null, metadata !1234, metadata !DIExpression()), !dbg !3053
  call void @llvm.dbg.value(metadata i64 11, metadata !1233, metadata !DIExpression()), !dbg !3053
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3064, metadata !DIExpression()), !dbg !3068
  call void @llvm.dbg.value(metadata i64 11, metadata !3067, metadata !DIExpression()), !dbg !3068
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3070, metadata !DIExpression()), !dbg !3074
  call void @llvm.dbg.value(metadata i64 11, metadata !3073, metadata !DIExpression()), !dbg !3074
  %30 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 1, !dbg !3076
  store i64 11, i64* %30, align 8, !dbg !3077, !tbaa !3078
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3011, metadata !DIExpression()), !dbg !3079
  %31 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 2, i32 1, i64 3, !dbg !3081
  call void @llvm.dbg.value(metadata i8* %31, metadata !3030, metadata !DIExpression()), !dbg !3082
  call void @llvm.dbg.value(metadata i8* undef, metadata !3033, metadata !DIExpression()), !dbg !3082
  store i8 0, i8* %31, align 1, !dbg !3084, !tbaa !3006
  br label %38, !dbg !3085

32:                                               ; preds = %24, %26, %28
  %33 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 0, i32 0, !dbg !3008
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* null, metadata !1234, metadata !DIExpression()), !dbg !2975
  %34 = load i64, i64* %2, align 8, !dbg !3086, !tbaa !2980
  call void @llvm.dbg.value(metadata i64 %34, metadata !1233, metadata !DIExpression()), !dbg !2975
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3064, metadata !DIExpression()), !dbg !3087
  call void @llvm.dbg.value(metadata i64 %34, metadata !3067, metadata !DIExpression()), !dbg !3087
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3070, metadata !DIExpression()), !dbg !3089
  call void @llvm.dbg.value(metadata i64 %34, metadata !3073, metadata !DIExpression()), !dbg !3089
  %35 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 1, !dbg !3091
  store i64 %34, i64* %35, align 8, !dbg !3092, !tbaa !3078
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3011, metadata !DIExpression()), !dbg !3093
  %36 = load i8*, i8** %33, align 8, !dbg !3095, !tbaa !2995
  %37 = getelementptr inbounds i8, i8* %36, i64 %34, !dbg !3096
  call void @llvm.dbg.value(metadata i8* %37, metadata !3030, metadata !DIExpression()), !dbg !3097
  call void @llvm.dbg.value(metadata i8* undef, metadata !3033, metadata !DIExpression()), !dbg !3097
  store i8 0, i8* %37, align 1, !dbg !3099, !tbaa !3006
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %17) #19, !dbg !3100
  br label %38, !dbg !3085

38:                                               ; preds = %29, %32
  %39 = call i8* @getenv(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0)) #19, !dbg !3101
  call void @llvm.dbg.value(metadata i8* %39, metadata !2918, metadata !DIExpression()), !dbg !2928
  %40 = bitcast %"class.std::__cxx11::basic_string"* %4 to i8*, !dbg !3102
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %40) #19, !dbg !3102
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %4, metadata !2919, metadata !DIExpression()), !dbg !3103
  %41 = icmp eq i8* %39, null, !dbg !3104
  br i1 %41, label %60, label %42, !dbg !3104

42:                                               ; preds = %38
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !2932, metadata !DIExpression()), !dbg !3105
  call void @llvm.dbg.value(metadata i8* %39, metadata !2940, metadata !DIExpression()), !dbg !3105
  call void @llvm.dbg.value(metadata %"class.std::allocator.3"* undef, metadata !2941, metadata !DIExpression()), !dbg !3105
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !2963, metadata !DIExpression()), !dbg !3107
  %43 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 2, !dbg !3109
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !2948, metadata !DIExpression()), !dbg !3110
  call void @llvm.dbg.value(metadata %union.anon.6* %43, metadata !2951, metadata !DIExpression()), !dbg !3110
  call void @llvm.dbg.value(metadata %"class.std::allocator.3"* undef, metadata !2952, metadata !DIExpression()), !dbg !3110
  %44 = bitcast %"class.std::__cxx11::basic_string"* %4 to %union.anon.6**, !dbg !3112
  store %union.anon.6* %43, %union.anon.6** %44, align 8, !dbg !3112, !tbaa !2958
  %45 = bitcast %union.anon.6* %43 to i8*, !dbg !3113
  call void @llvm.dbg.value(metadata i8* %39, metadata !2968, metadata !DIExpression()), !dbg !3114
  %46 = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %39) #19, !dbg !3116
  call void @llvm.dbg.value(metadata !DIArgList(i8* %39, i64 %46), metadata !2942, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !3117
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !1228, metadata !DIExpression()), !dbg !3118
  call void @llvm.dbg.value(metadata i8* %39, metadata !1230, metadata !DIExpression()), !dbg !3118
  call void @llvm.dbg.value(metadata !DIArgList(i8* %39, i64 %46), metadata !1231, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !3118
  call void @llvm.dbg.declare(metadata %"struct.std::forward_iterator_tag"* undef, metadata !1232, metadata !DIExpression()), !dbg !3120
  %47 = bitcast i64* %1 to i8*, !dbg !3121
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %47) #19, !dbg !3121
  call void @llvm.dbg.value(metadata i64 %46, metadata !1233, metadata !DIExpression()), !dbg !3118
  store i64 %46, i64* %1, align 8, !dbg !3122, !tbaa !2980
  %48 = icmp ugt i64 %46, 15, !dbg !3123
  br i1 %48, label %49, label %55, !dbg !3124

49:                                               ; preds = %42
  call void @llvm.dbg.value(metadata i64* %1, metadata !1233, metadata !DIExpression(DW_OP_deref)), !dbg !3118
  %50 = invoke noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %4, i64* noundef nonnull align 8 dereferenceable(8) %1, i64 noundef 0)
          to label %51 unwind label %151, !dbg !3125

51:                                               ; preds = %49
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !2987, metadata !DIExpression()), !dbg !3126
  call void @llvm.dbg.value(metadata i8* %50, metadata !2990, metadata !DIExpression()), !dbg !3126
  %52 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 0, i32 0, !dbg !3128
  store i8* %50, i8** %52, align 8, !dbg !3129, !tbaa !2995
  %53 = load i64, i64* %1, align 8, !dbg !3130, !tbaa !2980
  call void @llvm.dbg.value(metadata i64 %53, metadata !1233, metadata !DIExpression()), !dbg !3118
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !2998, metadata !DIExpression()), !dbg !3131
  call void @llvm.dbg.value(metadata i64 %53, metadata !3001, metadata !DIExpression()), !dbg !3131
  %54 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 2, i32 0, !dbg !3133
  store i64 %53, i64* %54, align 8, !dbg !3134, !tbaa !3006
  br label %55, !dbg !3135

55:                                               ; preds = %51, %42
  %56 = phi i8* [ %50, %51 ], [ %45, %42 ], !dbg !3136
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !1234, metadata !DIExpression()), !dbg !3118
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3011, metadata !DIExpression()), !dbg !3138
  call void @llvm.dbg.value(metadata i8* %56, metadata !3015, metadata !DIExpression()), !dbg !3139
  call void @llvm.dbg.value(metadata i8* %39, metadata !3018, metadata !DIExpression()), !dbg !3139
  call void @llvm.dbg.value(metadata !DIArgList(i8* %39, i64 %46), metadata !3019, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !3139
  call void @llvm.dbg.value(metadata i8* %56, metadata !3022, metadata !DIExpression()), !dbg !3141
  call void @llvm.dbg.value(metadata i8* %39, metadata !3025, metadata !DIExpression()), !dbg !3141
  call void @llvm.dbg.value(metadata i64 %46, metadata !3026, metadata !DIExpression()), !dbg !3141
  switch i64 %46, label %59 [
    i64 1, label %57
    i64 0, label %103
  ], !dbg !3143

57:                                               ; preds = %55
  call void @llvm.dbg.value(metadata i8* %56, metadata !3030, metadata !DIExpression()), !dbg !3144
  call void @llvm.dbg.value(metadata i8* %39, metadata !3033, metadata !DIExpression()), !dbg !3144
  %58 = load i8, i8* %39, align 1, !dbg !3146, !tbaa !3006
  store i8 %58, i8* %56, align 1, !dbg !3147, !tbaa !3006
  br label %103, !dbg !3148

59:                                               ; preds = %55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %56, i8* nonnull align 1 %39, i64 %46, i1 false), !dbg !3149
  br label %103, !dbg !3151

60:                                               ; preds = %38
  %61 = bitcast %"class.std::__cxx11::basic_string"* %5 to i8*, !dbg !3152
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %61) #19, !dbg !3152
  invoke void @_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_RKS8_(%"class.std::__cxx11::basic_string"* nonnull sret(%"class.std::__cxx11::basic_string") align 8 %5, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %3)
          to label %62 unwind label %139, !dbg !3153

62:                                               ; preds = %60
  call void @llvm.experimental.noalias.scope.decl(metadata !3154), !dbg !3157
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3158, metadata !DIExpression()), !dbg !3164
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0), metadata !3163, metadata !DIExpression()), !dbg !3164
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3166, metadata !DIExpression()), !dbg !3171
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0), metadata !3169, metadata !DIExpression()), !dbg !3171
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0), metadata !2968, metadata !DIExpression()), !dbg !3173
  call void @llvm.dbg.value(metadata i64 15, metadata !3170, metadata !DIExpression()), !dbg !3171
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3175, metadata !DIExpression()), !dbg !3181
  call void @llvm.dbg.value(metadata i64 0, metadata !3178, metadata !DIExpression()), !dbg !3181
  call void @llvm.dbg.value(metadata i64 15, metadata !3179, metadata !DIExpression()), !dbg !3181
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.14, i64 0, i64 0), metadata !3180, metadata !DIExpression()), !dbg !3181
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3183, metadata !DIExpression()), !dbg !3186
  %63 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %5, i64 0, i32 1, !dbg !3189
  %64 = load i64, i64* %63, align 8, !dbg !3189, !tbaa !3078, !noalias !3154
  %65 = add i64 %64, -4611686018427387889, !dbg !3190
  %66 = icmp ult i64 %65, 15, !dbg !3190
  br i1 %66, label %67, label %69, !dbg !3191

67:                                               ; preds = %62
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.14, i64 0, i64 0)) #20
          to label %68 unwind label %141, !dbg !3192

68:                                               ; preds = %67
  unreachable, !dbg !3192

69:                                               ; preds = %62
  %70 = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %5, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0), i64 noundef 15)
          to label %71 unwind label %141, !dbg !3193

71:                                               ; preds = %69
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3194, metadata !DIExpression()), !dbg !3198
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3197, metadata !DIExpression()), !dbg !3198
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !2963, metadata !DIExpression()), !dbg !3200
  %72 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 2, !dbg !3202
  %73 = bitcast %union.anon.6* %72 to i8*, !dbg !3203
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3204, metadata !DIExpression()), !dbg !3209
  call void @llvm.dbg.value(metadata i8* %73, metadata !3207, metadata !DIExpression()), !dbg !3209
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3208, metadata !DIExpression()), !dbg !3209
  %74 = bitcast %"class.std::__cxx11::basic_string"* %4 to %union.anon.6**, !dbg !3211
  store %union.anon.6* %72, %union.anon.6** %74, align 8, !dbg !3211, !tbaa !2958, !alias.scope !3154
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3212, metadata !DIExpression()), !dbg !3215
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3011, metadata !DIExpression()), !dbg !3219
  %75 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %70, i64 0, i32 0, i32 0, !dbg !3221
  %76 = load i8*, i8** %75, align 8, !dbg !3221, !tbaa !2995
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3222, metadata !DIExpression()), !dbg !3225
  %77 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %70, i64 0, i32 2, !dbg !3227
  %78 = bitcast %union.anon.6* %77 to i8*, !dbg !3228
  %79 = icmp eq i8* %76, %78, !dbg !3229
  br i1 %79, label %80, label %86, !dbg !3230

80:                                               ; preds = %71
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3231, metadata !DIExpression()), !dbg !3234
  %81 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %70, i64 0, i32 1, !dbg !3237
  %82 = load i64, i64* %81, align 8, !dbg !3237, !tbaa !3078
  %83 = add i64 %82, 1, !dbg !3238
  call void @llvm.dbg.value(metadata i8* %73, metadata !3043, metadata !DIExpression()), !dbg !3239
  call void @llvm.dbg.value(metadata i8* %78, metadata !3044, metadata !DIExpression()), !dbg !3239
  call void @llvm.dbg.value(metadata i64 %83, metadata !3045, metadata !DIExpression()), !dbg !3239
  %84 = icmp eq i64 %83, 0, !dbg !3241
  br i1 %84, label %91, label %85, !dbg !3243

85:                                               ; preds = %80
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %73, i8* nonnull align 8 %76, i64 %83, i1 false), !dbg !3244
  br label %91, !dbg !3245

86:                                               ; preds = %71
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3011, metadata !DIExpression()), !dbg !3246
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !2987, metadata !DIExpression()), !dbg !3249
  call void @llvm.dbg.value(metadata i8* %76, metadata !2990, metadata !DIExpression()), !dbg !3249
  %87 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 0, i32 0, !dbg !3251
  store i8* %76, i8** %87, align 8, !dbg !3252, !tbaa !2995, !alias.scope !3154
  %88 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %70, i64 0, i32 2, i32 0, !dbg !3253
  %89 = load i64, i64* %88, align 8, !dbg !3253, !tbaa !3006
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !2998, metadata !DIExpression()), !dbg !3254
  call void @llvm.dbg.value(metadata i64 %89, metadata !3001, metadata !DIExpression()), !dbg !3254
  %90 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 2, i32 0, !dbg !3256
  store i64 %89, i64* %90, align 8, !dbg !3257, !tbaa !3006, !alias.scope !3154
  br label %91

91:                                               ; preds = %86, %85, %80
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3231, metadata !DIExpression()), !dbg !3258
  %92 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %70, i64 0, i32 1, !dbg !3260
  %93 = load i64, i64* %92, align 8, !dbg !3260, !tbaa !3078
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3070, metadata !DIExpression()), !dbg !3261
  call void @llvm.dbg.value(metadata i64 %93, metadata !3073, metadata !DIExpression()), !dbg !3261
  %94 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 1, !dbg !3263
  store i64 %93, i64* %94, align 8, !dbg !3264, !tbaa !3078, !alias.scope !3154
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !2963, metadata !DIExpression()), !dbg !3265
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !2987, metadata !DIExpression()), !dbg !3267
  call void @llvm.dbg.value(metadata i8* %78, metadata !2990, metadata !DIExpression()), !dbg !3267
  %95 = bitcast %"class.std::__cxx11::basic_string"* %70 to %union.anon.6**, !dbg !3269
  store %union.anon.6* %77, %union.anon.6** %95, align 8, !dbg !3269, !tbaa !2995
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3064, metadata !DIExpression()), !dbg !3270
  call void @llvm.dbg.value(metadata i64 0, metadata !3067, metadata !DIExpression()), !dbg !3270
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3070, metadata !DIExpression()), !dbg !3272
  call void @llvm.dbg.value(metadata i64 0, metadata !3073, metadata !DIExpression()), !dbg !3272
  store i64 0, i64* %92, align 8, !dbg !3274, !tbaa !3078
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %70, metadata !3011, metadata !DIExpression()), !dbg !3275
  call void @llvm.dbg.value(metadata i8* %78, metadata !3030, metadata !DIExpression()), !dbg !3277
  call void @llvm.dbg.value(metadata i8* undef, metadata !3033, metadata !DIExpression()), !dbg !3277
  store i8 0, i8* %78, align 8, !dbg !3279, !tbaa !3006
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3280, metadata !DIExpression()), !dbg !3283
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3285, metadata !DIExpression()), !dbg !3288
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3212, metadata !DIExpression()), !dbg !3291
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3011, metadata !DIExpression()), !dbg !3294
  %96 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %5, i64 0, i32 0, i32 0, !dbg !3296
  %97 = load i8*, i8** %96, align 8, !dbg !3296, !tbaa !2995
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3222, metadata !DIExpression()), !dbg !3297
  %98 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %5, i64 0, i32 2, !dbg !3299
  %99 = bitcast %union.anon.6* %98 to i8*, !dbg !3300
  %100 = icmp eq i8* %97, %99, !dbg !3301
  br i1 %100, label %102, label %101, !dbg !3302

101:                                              ; preds = %91
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3303, metadata !DIExpression()), !dbg !3307
  call void @llvm.dbg.value(metadata i64 undef, metadata !3306, metadata !DIExpression()), !dbg !3307
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3011, metadata !DIExpression()), !dbg !3309
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3311, metadata !DIExpression()), !dbg !3316
  call void @llvm.dbg.value(metadata i8* %97, metadata !3314, metadata !DIExpression()), !dbg !3316
  call void @llvm.dbg.value(metadata i64 undef, metadata !3315, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3316
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3318, metadata !DIExpression()), !dbg !3324
  call void @llvm.dbg.value(metadata i8* %97, metadata !3321, metadata !DIExpression()), !dbg !3324
  call void @llvm.dbg.value(metadata i64 undef, metadata !3322, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3324
  call void @_ZdlPv(i8* noundef %97) #21, !dbg !3326
  br label %102, !dbg !3327

102:                                              ; preds = %91, %101
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %61) #19, !dbg !3328
  br label %109, !dbg !3328

103:                                              ; preds = %55, %57, %59
  %104 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 0, i32 0, !dbg !3136
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* null, metadata !1234, metadata !DIExpression()), !dbg !3118
  %105 = load i64, i64* %1, align 8, !dbg !3329, !tbaa !2980
  call void @llvm.dbg.value(metadata i64 %105, metadata !1233, metadata !DIExpression()), !dbg !3118
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3064, metadata !DIExpression()), !dbg !3330
  call void @llvm.dbg.value(metadata i64 %105, metadata !3067, metadata !DIExpression()), !dbg !3330
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3070, metadata !DIExpression()), !dbg !3332
  call void @llvm.dbg.value(metadata i64 %105, metadata !3073, metadata !DIExpression()), !dbg !3332
  %106 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 1, !dbg !3334
  store i64 %105, i64* %106, align 8, !dbg !3335, !tbaa !3078
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3011, metadata !DIExpression()), !dbg !3336
  %107 = load i8*, i8** %104, align 8, !dbg !3338, !tbaa !2995
  %108 = getelementptr inbounds i8, i8* %107, i64 %105, !dbg !3339
  call void @llvm.dbg.value(metadata i8* %108, metadata !3030, metadata !DIExpression()), !dbg !3340
  call void @llvm.dbg.value(metadata i8* undef, metadata !3033, metadata !DIExpression()), !dbg !3340
  store i8 0, i8* %108, align 1, !dbg !3342, !tbaa !3006
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %47) #19, !dbg !3343
  br label %109, !dbg !3328

109:                                              ; preds = %102, %103
  %110 = call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #19, !dbg !3344
  invoke void @_ZN8scabbard5trace10AsyncQueue16set_trace_writerERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES9_l(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408) @_ZN8scabbard5trace12TRACE_LOGGERE, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %4, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %3, i64 noundef %110)
          to label %111 unwind label %153, !dbg !3345

111:                                              ; preds = %109
  %112 = bitcast %"struct.scabbard::trace::DeviceAsyncQueue"** %6 to i8*, !dbg !3346
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %112) #19, !dbg !3346
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue"** %6, metadata !3347, metadata !DIExpression()), !dbg !3356
  call void @llvm.dbg.value(metadata i64 262656, metadata !3353, metadata !DIExpression()), !dbg !3356
  %113 = bitcast %"struct.scabbard::trace::DeviceAsyncQueue"** %6 to i8**, !dbg !3358
  %114 = invoke i32 @hipMalloc(i8** noundef nonnull %113, i64 noundef 262656)
          to label %115 unwind label %155, !dbg !3359

115:                                              ; preds = %111
  call void @llvm.dbg.value(metadata i32 %114, metadata !2920, metadata !DIExpression()), !dbg !2928
  %116 = icmp eq i32 %114, 0, !dbg !3360
  br i1 %116, label %169, label %117, !dbg !3361

117:                                              ; preds = %115
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cerr, metadata !3362, metadata !DIExpression()), !dbg !3373
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([104 x i8], [104 x i8]* @.str.6, i64 0, i64 0), metadata !3371, metadata !DIExpression()), !dbg !3373
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([104 x i8], [104 x i8]* @.str.6, i64 0, i64 0), metadata !2968, metadata !DIExpression()), !dbg !3375
  %118 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef nonnull getelementptr inbounds ([104 x i8], [104 x i8]* @.str.6, i64 0, i64 0), i64 noundef 103)
          to label %119 unwind label %155, !dbg !3378

119:                                              ; preds = %117
  %120 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i32 noundef %114)
          to label %121 unwind label %155, !dbg !3379

121:                                              ; preds = %119
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %120, metadata !3362, metadata !DIExpression()), !dbg !3380
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), metadata !3371, metadata !DIExpression()), !dbg !3380
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), metadata !2968, metadata !DIExpression()), !dbg !3382
  %122 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %120, i8* noundef nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i64 noundef 2)
          to label %123 unwind label %155, !dbg !3384

123:                                              ; preds = %121
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %120, metadata !3385, metadata !DIExpression()), !dbg !3399
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !3397, metadata !DIExpression()), !dbg !3399
  %124 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %120)
          to label %125 unwind label %155, !dbg !3401

125:                                              ; preds = %123
  %126 = bitcast i32* %7 to i8*, !dbg !3402
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %126) #19, !dbg !3402
  call void @llvm.dbg.value(metadata i32 0, metadata !2923, metadata !DIExpression()), !dbg !3403
  store i32 0, i32* %7, align 4, !dbg !3404, !tbaa !3405
  %127 = icmp eq i32 %114, 101, !dbg !3407
  br i1 %127, label %128, label %168, !dbg !3409

128:                                              ; preds = %125
  %129 = invoke i32 @hipGetDeviceCount(i32* noundef nonnull %7)
          to label %130 unwind label %157, !dbg !3410

130:                                              ; preds = %128
  call void @llvm.dbg.value(metadata i32 %129, metadata !2920, metadata !DIExpression()), !dbg !2928
  %131 = icmp eq i32 %129, 0, !dbg !3413
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cerr, metadata !3362, metadata !DIExpression()), !dbg !3414
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cerr, metadata !3362, metadata !DIExpression()), !dbg !3416
  br i1 %131, label %132, label %159, !dbg !3418

132:                                              ; preds = %130
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.8, i64 0, i64 0), metadata !3371, metadata !DIExpression()), !dbg !3414
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.8, i64 0, i64 0), metadata !2968, metadata !DIExpression()), !dbg !3419
  %133 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef nonnull getelementptr inbounds ([44 x i8], [44 x i8]* @.str.8, i64 0, i64 0), i64 noundef 43)
          to label %134 unwind label %157, !dbg !3421

134:                                              ; preds = %132
  %135 = load i32, i32* %7, align 4, !dbg !3422, !tbaa !3405
  call void @llvm.dbg.value(metadata i32 %135, metadata !2923, metadata !DIExpression()), !dbg !3403
  %136 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i32 noundef %135)
          to label %137 unwind label %157, !dbg !3423

137:                                              ; preds = %134
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %136, metadata !3362, metadata !DIExpression()), !dbg !3424
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i64 0, i64 0), metadata !3371, metadata !DIExpression()), !dbg !3424
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i64 0, i64 0), metadata !2968, metadata !DIExpression()), !dbg !3426
  %138 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %136, i8* noundef nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i64 0, i64 0), i64 noundef 35)
          to label %165 unwind label %157, !dbg !3428

139:                                              ; preds = %60
  %140 = landingpad { i8*, i32 }
          cleanup, !dbg !3429
  br label %149, !dbg !3429

141:                                              ; preds = %69, %67
  %142 = landingpad { i8*, i32 }
          cleanup, !dbg !3429
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3280, metadata !DIExpression()), !dbg !3430
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3285, metadata !DIExpression()), !dbg !3432
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3212, metadata !DIExpression()), !dbg !3434
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3011, metadata !DIExpression()), !dbg !3436
  %143 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %5, i64 0, i32 0, i32 0, !dbg !3438
  %144 = load i8*, i8** %143, align 8, !dbg !3438, !tbaa !2995
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3222, metadata !DIExpression()), !dbg !3439
  %145 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %5, i64 0, i32 2, !dbg !3441
  %146 = bitcast %union.anon.6* %145 to i8*, !dbg !3442
  %147 = icmp eq i8* %144, %146, !dbg !3443
  br i1 %147, label %149, label %148, !dbg !3444

148:                                              ; preds = %141
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3303, metadata !DIExpression()), !dbg !3445
  call void @llvm.dbg.value(metadata i64 undef, metadata !3306, metadata !DIExpression()), !dbg !3445
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3011, metadata !DIExpression()), !dbg !3447
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3311, metadata !DIExpression()), !dbg !3449
  call void @llvm.dbg.value(metadata i8* %144, metadata !3314, metadata !DIExpression()), !dbg !3449
  call void @llvm.dbg.value(metadata i64 undef, metadata !3315, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3449
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %5, metadata !3318, metadata !DIExpression()), !dbg !3451
  call void @llvm.dbg.value(metadata i8* %144, metadata !3321, metadata !DIExpression()), !dbg !3451
  call void @llvm.dbg.value(metadata i64 undef, metadata !3322, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3451
  call void @_ZdlPv(i8* noundef %144) #21, !dbg !3453
  br label %149, !dbg !3454

149:                                              ; preds = %139, %141, %148
  %150 = phi { i8*, i32 } [ %140, %139 ], [ %142, %141 ], [ %142, %148 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %61) #19, !dbg !3328
  br label %215, !dbg !3328

151:                                              ; preds = %49
  %152 = landingpad { i8*, i32 }
          cleanup, !dbg !3429
  br label %215, !dbg !3328

153:                                              ; preds = %109
  %154 = landingpad { i8*, i32 }
          cleanup, !dbg !3429
  br label %207, !dbg !3455

155:                                              ; preds = %123, %121, %117, %111, %119
  %156 = landingpad { i8*, i32 }
          cleanup, !dbg !3456
  br label %205, !dbg !3456

157:                                              ; preds = %165, %163, %159, %137, %132, %161, %134, %128
  %158 = landingpad { i8*, i32 }
          cleanup, !dbg !3457
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %126) #19, !dbg !3458
  br label %205, !dbg !3458

159:                                              ; preds = %130
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.10, i64 0, i64 0), metadata !3371, metadata !DIExpression()), !dbg !3416
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.10, i64 0, i64 0), metadata !2968, metadata !DIExpression()), !dbg !3459
  %160 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef nonnull getelementptr inbounds ([94 x i8], [94 x i8]* @.str.10, i64 0, i64 0), i64 noundef 93)
          to label %161 unwind label %157, !dbg !3461

161:                                              ; preds = %159
  %162 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i32 noundef %129)
          to label %163 unwind label %157, !dbg !3462

163:                                              ; preds = %161
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %162, metadata !3362, metadata !DIExpression()), !dbg !3463
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), metadata !3371, metadata !DIExpression()), !dbg !3463
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), metadata !2968, metadata !DIExpression()), !dbg !3465
  %164 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %162, i8* noundef nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i64 noundef 2)
          to label %165 unwind label %157, !dbg !3467

165:                                              ; preds = %137, %163
  %166 = phi %"class.std::basic_ostream"* [ %162, %163 ], [ %136, %137 ]
  %167 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %166)
          to label %168 unwind label %157, !dbg !3468

168:                                              ; preds = %165, %125
  call void @exit(i32 noundef 1) #22, !dbg !3469
  unreachable, !dbg !3469

169:                                              ; preds = %115
  %170 = bitcast %"struct.scabbard::trace::DeviceAsyncQueue"* %8 to i8*, !dbg !3470
  call void @llvm.lifetime.start.p0i8(i64 262656, i8* nonnull %170) #19, !dbg !3470
  call void @llvm.dbg.declare(metadata %"struct.scabbard::trace::DeviceAsyncQueue"* %8, metadata !2926, metadata !DIExpression()), !dbg !3471
  invoke void @_ZN8scabbard5trace16DeviceAsyncQueueC2Ev(%"struct.scabbard::trace::DeviceAsyncQueue"* noundef nonnull align 8 dereferenceable(262656) %8)
          to label %171 unwind label %185, !dbg !3471

171:                                              ; preds = %169
  %172 = load i8*, i8** %113, align 8, !dbg !3472, !tbaa !3474
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue"* undef, metadata !2922, metadata !DIExpression()), !dbg !2928
  %173 = invoke i32 @hipMemcpy(i8* noundef %172, i8* noundef nonnull %170, i64 noundef 262656, i32 noundef 1)
          to label %174 unwind label %185, !dbg !3475

174:                                              ; preds = %171
  %175 = icmp eq i32 %173, 0, !dbg !3476
  br i1 %175, label %187, label %176, !dbg !3477

176:                                              ; preds = %174
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cerr, metadata !3362, metadata !DIExpression()), !dbg !3478
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([115 x i8], [115 x i8]* @.str.11, i64 0, i64 0), metadata !3371, metadata !DIExpression()), !dbg !3478
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([115 x i8], [115 x i8]* @.str.11, i64 0, i64 0), metadata !2968, metadata !DIExpression()), !dbg !3481
  %177 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef nonnull getelementptr inbounds ([115 x i8], [115 x i8]* @.str.11, i64 0, i64 0), i64 noundef 114)
          to label %178 unwind label %185, !dbg !3483

178:                                              ; preds = %176
  %179 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i32 noundef 0)
          to label %180 unwind label %185, !dbg !3484

180:                                              ; preds = %178
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %179, metadata !3362, metadata !DIExpression()), !dbg !3485
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), metadata !3371, metadata !DIExpression()), !dbg !3485
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), metadata !2968, metadata !DIExpression()), !dbg !3487
  %181 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %179, i8* noundef nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i64 noundef 2)
          to label %182 unwind label %185, !dbg !3489

182:                                              ; preds = %180
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %179, metadata !3385, metadata !DIExpression()), !dbg !3490
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !3397, metadata !DIExpression()), !dbg !3490
  %183 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %179)
          to label %184 unwind label %185, !dbg !3492

184:                                              ; preds = %182
  call void @exit(i32 noundef 1) #22, !dbg !3493
  unreachable, !dbg !3493

185:                                              ; preds = %182, %180, %176, %189, %187, %178, %171, %169
  %186 = landingpad { i8*, i32 }
          cleanup, !dbg !3429
  call void @llvm.lifetime.end.p0i8(i64 262656, i8* nonnull %170) #19, !dbg !3429
  br label %205, !dbg !3429

187:                                              ; preds = %174
  %188 = load %"struct.scabbard::trace::DeviceAsyncQueue"*, %"struct.scabbard::trace::DeviceAsyncQueue"** %6, align 8, !dbg !3494, !tbaa !3474
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue"* %188, metadata !2922, metadata !DIExpression()), !dbg !2928
  store %"struct.scabbard::trace::DeviceAsyncQueue"* %188, %"struct.scabbard::trace::DeviceAsyncQueue"** @_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE, align 8, !dbg !3495, !tbaa !3474
  invoke void @_ZN8scabbard5trace10AsyncQueue16set_device_queueEPNS0_16DeviceAsyncQueueE(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408) @_ZN8scabbard5trace12TRACE_LOGGERE, %"struct.scabbard::trace::DeviceAsyncQueue"* noundef %188)
          to label %189 unwind label %185, !dbg !3496

189:                                              ; preds = %187
  invoke void @_ZN8scabbard5trace10AsyncQueue5startEv(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408) @_ZN8scabbard5trace12TRACE_LOGGERE)
          to label %190 unwind label %185, !dbg !3497

190:                                              ; preds = %189
  call void @llvm.lifetime.end.p0i8(i64 262656, i8* nonnull %170) #19, !dbg !3429
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %112) #19, !dbg !3429
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3280, metadata !DIExpression()), !dbg !3498
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3285, metadata !DIExpression()), !dbg !3500
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3212, metadata !DIExpression()), !dbg !3502
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3011, metadata !DIExpression()), !dbg !3504
  %191 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 0, i32 0, !dbg !3506
  %192 = load i8*, i8** %191, align 8, !dbg !3506, !tbaa !2995
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3222, metadata !DIExpression()), !dbg !3507
  %193 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 2, !dbg !3509
  %194 = bitcast %union.anon.6* %193 to i8*, !dbg !3510
  %195 = icmp eq i8* %192, %194, !dbg !3511
  br i1 %195, label %197, label %196, !dbg !3512

196:                                              ; preds = %190
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3303, metadata !DIExpression()), !dbg !3513
  call void @llvm.dbg.value(metadata i64 undef, metadata !3306, metadata !DIExpression()), !dbg !3513
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3011, metadata !DIExpression()), !dbg !3515
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3311, metadata !DIExpression()), !dbg !3517
  call void @llvm.dbg.value(metadata i8* %192, metadata !3314, metadata !DIExpression()), !dbg !3517
  call void @llvm.dbg.value(metadata i64 undef, metadata !3315, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3517
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3318, metadata !DIExpression()), !dbg !3519
  call void @llvm.dbg.value(metadata i8* %192, metadata !3321, metadata !DIExpression()), !dbg !3519
  call void @llvm.dbg.value(metadata i64 undef, metadata !3322, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3519
  call void @_ZdlPv(i8* noundef %192) #21, !dbg !3521
  br label %197, !dbg !3522

197:                                              ; preds = %190, %196
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %40) #19, !dbg !3429
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3280, metadata !DIExpression()), !dbg !3523
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3285, metadata !DIExpression()), !dbg !3525
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3212, metadata !DIExpression()), !dbg !3527
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3011, metadata !DIExpression()), !dbg !3529
  %198 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 0, i32 0, !dbg !3531
  %199 = load i8*, i8** %198, align 8, !dbg !3531, !tbaa !2995
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3222, metadata !DIExpression()), !dbg !3532
  %200 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 2, !dbg !3534
  %201 = bitcast %union.anon.6* %200 to i8*, !dbg !3535
  %202 = icmp eq i8* %199, %201, !dbg !3536
  br i1 %202, label %204, label %203, !dbg !3537

203:                                              ; preds = %197
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3303, metadata !DIExpression()), !dbg !3538
  call void @llvm.dbg.value(metadata i64 undef, metadata !3306, metadata !DIExpression()), !dbg !3538
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3011, metadata !DIExpression()), !dbg !3540
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3311, metadata !DIExpression()), !dbg !3542
  call void @llvm.dbg.value(metadata i8* %199, metadata !3314, metadata !DIExpression()), !dbg !3542
  call void @llvm.dbg.value(metadata i64 undef, metadata !3315, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3542
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3318, metadata !DIExpression()), !dbg !3544
  call void @llvm.dbg.value(metadata i8* %199, metadata !3321, metadata !DIExpression()), !dbg !3544
  call void @llvm.dbg.value(metadata i64 undef, metadata !3322, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3544
  call void @_ZdlPv(i8* noundef %199) #21, !dbg !3546
  br label %204, !dbg !3547

204:                                              ; preds = %197, %203
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %10) #19, !dbg !3429
  ret void, !dbg !3429

205:                                              ; preds = %185, %157, %155
  %206 = phi { i8*, i32 } [ %158, %157 ], [ %156, %155 ], [ %186, %185 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %112) #19, !dbg !3429
  br label %207, !dbg !3429

207:                                              ; preds = %205, %153
  %208 = phi { i8*, i32 } [ %206, %205 ], [ %154, %153 ]
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3280, metadata !DIExpression()), !dbg !3548
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3285, metadata !DIExpression()), !dbg !3550
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3212, metadata !DIExpression()), !dbg !3552
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3011, metadata !DIExpression()), !dbg !3554
  %209 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 0, i32 0, !dbg !3556
  %210 = load i8*, i8** %209, align 8, !dbg !3556, !tbaa !2995
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3222, metadata !DIExpression()), !dbg !3557
  %211 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 2, !dbg !3559
  %212 = bitcast %union.anon.6* %211 to i8*, !dbg !3560
  %213 = icmp eq i8* %210, %212, !dbg !3561
  br i1 %213, label %215, label %214, !dbg !3562

214:                                              ; preds = %207
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3303, metadata !DIExpression()), !dbg !3563
  call void @llvm.dbg.value(metadata i64 undef, metadata !3306, metadata !DIExpression()), !dbg !3563
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3011, metadata !DIExpression()), !dbg !3565
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3311, metadata !DIExpression()), !dbg !3567
  call void @llvm.dbg.value(metadata i8* %210, metadata !3314, metadata !DIExpression()), !dbg !3567
  call void @llvm.dbg.value(metadata i64 undef, metadata !3315, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3567
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %4, metadata !3318, metadata !DIExpression()), !dbg !3569
  call void @llvm.dbg.value(metadata i8* %210, metadata !3321, metadata !DIExpression()), !dbg !3569
  call void @llvm.dbg.value(metadata i64 undef, metadata !3322, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3569
  call void @_ZdlPv(i8* noundef %210) #21, !dbg !3571
  br label %215, !dbg !3572

215:                                              ; preds = %214, %207, %149, %151
  %216 = phi { i8*, i32 } [ %152, %151 ], [ %150, %149 ], [ %208, %207 ], [ %208, %214 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %40) #19, !dbg !3429
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3280, metadata !DIExpression()), !dbg !3573
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3285, metadata !DIExpression()), !dbg !3575
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3212, metadata !DIExpression()), !dbg !3577
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3011, metadata !DIExpression()), !dbg !3579
  %217 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 0, i32 0, !dbg !3581
  %218 = load i8*, i8** %217, align 8, !dbg !3581, !tbaa !2995
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3222, metadata !DIExpression()), !dbg !3582
  %219 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 2, !dbg !3584
  %220 = bitcast %union.anon.6* %219 to i8*, !dbg !3585
  %221 = icmp eq i8* %218, %220, !dbg !3586
  br i1 %221, label %223, label %222, !dbg !3587

222:                                              ; preds = %215
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3303, metadata !DIExpression()), !dbg !3588
  call void @llvm.dbg.value(metadata i64 undef, metadata !3306, metadata !DIExpression()), !dbg !3588
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3011, metadata !DIExpression()), !dbg !3590
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3311, metadata !DIExpression()), !dbg !3592
  call void @llvm.dbg.value(metadata i8* %218, metadata !3314, metadata !DIExpression()), !dbg !3592
  call void @llvm.dbg.value(metadata i64 undef, metadata !3315, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3592
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %3, metadata !3318, metadata !DIExpression()), !dbg !3594
  call void @llvm.dbg.value(metadata i8* %218, metadata !3321, metadata !DIExpression()), !dbg !3594
  call void @llvm.dbg.value(metadata i64 undef, metadata !3322, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3594
  call void @_ZdlPv(i8* noundef %218) #21, !dbg !3596
  br label %223, !dbg !3597

223:                                              ; preds = %222, %215
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %10) #19, !dbg !3429
  resume { i8*, i32 } %216, !dbg !3429
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

; Function Attrs: nofree nounwind readonly
declare !dbg !3598 dso_local noundef i8* @getenv(i8* nocapture noundef) local_unnamed_addr #6

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_RKS8_(%"class.std::__cxx11::basic_string"* noalias sret(%"class.std::__cxx11::basic_string") align 8 %0, i8* noundef %1, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %2) local_unnamed_addr #3 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3599 {
  call void @llvm.dbg.value(metadata i8* undef, metadata !3608, metadata !DIExpression(DW_OP_deref)), !dbg !3610
  call void @llvm.dbg.value(metadata i8* %1, metadata !3603, metadata !DIExpression()), !dbg !3610
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %2, metadata !3604, metadata !DIExpression()), !dbg !3610
  call void @llvm.dbg.value(metadata i8* %1, metadata !2968, metadata !DIExpression()), !dbg !3611
  %4 = tail call i64 @strlen(i8* noundef nonnull dereferenceable(1) %1) #19, !dbg !3613
  call void @llvm.dbg.value(metadata i64 %4, metadata !3605, metadata !DIExpression()), !dbg !3610
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3614, metadata !DIExpression()), !dbg !3618
  call void @llvm.dbg.value(metadata %"class.std::allocator.3"* undef, metadata !3617, metadata !DIExpression()), !dbg !3618
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !2963, metadata !DIExpression()), !dbg !3620
  %5 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %0, i64 0, i32 2, !dbg !3622
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !2948, metadata !DIExpression()), !dbg !3623
  call void @llvm.dbg.value(metadata %union.anon.6* %5, metadata !2951, metadata !DIExpression()), !dbg !3623
  call void @llvm.dbg.value(metadata %"class.std::allocator.3"* undef, metadata !2952, metadata !DIExpression()), !dbg !3623
  %6 = bitcast %"class.std::__cxx11::basic_string"* %0 to %union.anon.6**, !dbg !3625
  store %union.anon.6* %5, %union.anon.6** %6, align 8, !dbg !3625, !tbaa !2958
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !2963, metadata !DIExpression()), !dbg !3626
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3064, metadata !DIExpression()), !dbg !3633
  call void @llvm.dbg.value(metadata i64 0, metadata !3067, metadata !DIExpression()), !dbg !3633
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3070, metadata !DIExpression()), !dbg !3635
  call void @llvm.dbg.value(metadata i64 0, metadata !3073, metadata !DIExpression()), !dbg !3635
  %7 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %0, i64 0, i32 1, !dbg !3637
  store i64 0, i64* %7, align 8, !dbg !3638, !tbaa !3078
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3011, metadata !DIExpression()), !dbg !3639
  %8 = bitcast %union.anon.6* %5 to i8*, !dbg !3641
  call void @llvm.dbg.value(metadata i8* %8, metadata !3030, metadata !DIExpression()), !dbg !3642
  call void @llvm.dbg.value(metadata i8* undef, metadata !3033, metadata !DIExpression()), !dbg !3642
  store i8 0, i8* %8, align 8, !dbg !3644, !tbaa !3006
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %2, metadata !3183, metadata !DIExpression()), !dbg !3645
  %9 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 1, !dbg !3647
  %10 = load i64, i64* %9, align 8, !dbg !3647, !tbaa !3078
  %11 = add i64 %10, %4, !dbg !3648
  invoke void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %11)
          to label %12 unwind label %29, !dbg !3649

12:                                               ; preds = %3
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3650, metadata !DIExpression()), !dbg !3655
  call void @llvm.dbg.value(metadata i8* %1, metadata !3653, metadata !DIExpression()), !dbg !3655
  call void @llvm.dbg.value(metadata i64 %4, metadata !3654, metadata !DIExpression()), !dbg !3655
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3175, metadata !DIExpression()), !dbg !3657
  call void @llvm.dbg.value(metadata i64 0, metadata !3178, metadata !DIExpression()), !dbg !3657
  call void @llvm.dbg.value(metadata i64 %4, metadata !3179, metadata !DIExpression()), !dbg !3657
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.14, i64 0, i64 0), metadata !3180, metadata !DIExpression()), !dbg !3657
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3183, metadata !DIExpression()), !dbg !3659
  %13 = load i64, i64* %7, align 8, !dbg !3661, !tbaa !3078
  %14 = sub i64 4611686018427387903, %13, !dbg !3662
  %15 = icmp ult i64 %14, %4, !dbg !3663
  br i1 %15, label %23, label %16, !dbg !3664

16:                                               ; preds = %12
  %17 = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %0, i8* noundef %1, i64 noundef %4)
          to label %18 unwind label %29, !dbg !3665

18:                                               ; preds = %16
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3666, metadata !DIExpression()), !dbg !3670
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %2, metadata !3669, metadata !DIExpression()), !dbg !3670
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %2, metadata !3011, metadata !DIExpression()), !dbg !3672
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %2, metadata !3183, metadata !DIExpression()), !dbg !3674
  %19 = load i64, i64* %9, align 8, !dbg !3676, !tbaa !3078
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3650, metadata !DIExpression()), !dbg !3677
  call void @llvm.dbg.value(metadata i8* undef, metadata !3653, metadata !DIExpression()), !dbg !3677
  call void @llvm.dbg.value(metadata i64 %19, metadata !3654, metadata !DIExpression()), !dbg !3677
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3175, metadata !DIExpression()), !dbg !3679
  call void @llvm.dbg.value(metadata i64 0, metadata !3178, metadata !DIExpression()), !dbg !3679
  call void @llvm.dbg.value(metadata i64 %19, metadata !3179, metadata !DIExpression()), !dbg !3679
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.14, i64 0, i64 0), metadata !3180, metadata !DIExpression()), !dbg !3679
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3183, metadata !DIExpression()), !dbg !3681
  %20 = load i64, i64* %7, align 8, !dbg !3683, !tbaa !3078
  %21 = sub i64 4611686018427387903, %20, !dbg !3684
  %22 = icmp ult i64 %21, %19, !dbg !3685
  br i1 %22, label %23, label %25, !dbg !3686

23:                                               ; preds = %18, %12
  invoke void @_ZSt20__throw_length_errorPKc(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.14, i64 0, i64 0)) #20
          to label %24 unwind label %29, !dbg !3610

24:                                               ; preds = %23
  unreachable

25:                                               ; preds = %18
  %26 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 0, i32 0, !dbg !3687
  %27 = load i8*, i8** %26, align 8, !dbg !3687, !tbaa !2995
  call void @llvm.dbg.value(metadata i8* %27, metadata !3653, metadata !DIExpression()), !dbg !3677
  %28 = invoke noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %0, i8* noundef %27, i64 noundef %19)
          to label %35 unwind label %29, !dbg !3688

29:                                               ; preds = %23, %25, %16, %3
  %30 = landingpad { i8*, i32 }
          cleanup, !dbg !3689
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3280, metadata !DIExpression()), !dbg !3690
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3285, metadata !DIExpression()), !dbg !3692
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3212, metadata !DIExpression()), !dbg !3694
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3011, metadata !DIExpression()), !dbg !3696
  %31 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %0, i64 0, i32 0, i32 0, !dbg !3698
  %32 = load i8*, i8** %31, align 8, !dbg !3698, !tbaa !2995
  %33 = icmp eq i8* %32, %8, !dbg !3699
  br i1 %33, label %36, label %34, !dbg !3700

34:                                               ; preds = %29
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3303, metadata !DIExpression()), !dbg !3701
  call void @llvm.dbg.value(metadata i64 undef, metadata !3306, metadata !DIExpression()), !dbg !3701
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3011, metadata !DIExpression()), !dbg !3703
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3311, metadata !DIExpression()), !dbg !3705
  call void @llvm.dbg.value(metadata i8* %32, metadata !3314, metadata !DIExpression()), !dbg !3705
  call void @llvm.dbg.value(metadata i64 undef, metadata !3315, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3705
  call void @llvm.dbg.value(metadata %"class.std::__cxx11::basic_string"* %0, metadata !3318, metadata !DIExpression()), !dbg !3707
  call void @llvm.dbg.value(metadata i8* %32, metadata !3321, metadata !DIExpression()), !dbg !3707
  call void @llvm.dbg.value(metadata i64 undef, metadata !3322, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !3707
  tail call void @_ZdlPv(i8* noundef %32) #21, !dbg !3709
  br label %36, !dbg !3710

35:                                               ; preds = %25
  ret void, !dbg !3689

36:                                               ; preds = %34, %29
  resume { i8*, i32 } %30, !dbg !3689
}

declare dso_local void @_ZN8scabbard5trace10AsyncQueue16set_trace_writerERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES9_l(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408), %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32), %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32), i64 noundef) local_unnamed_addr #0

; Function Attrs: nounwind
declare dso_local i64 @_ZNSt6chrono3_V212system_clock3nowEv() local_unnamed_addr #1

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #0

; Function Attrs: inlinehint mustprogress uwtable
declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #7

declare !dbg !3711 dso_local i32 @hipGetDeviceCount(i32* noundef) local_unnamed_addr #0

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #8

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZN8scabbard5trace16DeviceAsyncQueueC2Ev(%"struct.scabbard::trace::DeviceAsyncQueue"* noundef nonnull align 8 dereferenceable(262656) %0) unnamed_addr #3 comdat align 2 !dbg !3714 {
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue"* %0, metadata !3716, metadata !DIExpression()), !dbg !3717
  %2 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %0, i64 0, i32 0, i64 0, !dbg !3718
  %3 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue", %"struct.scabbard::trace::DeviceAsyncQueue"* %0, i64 0, i32 0, i64 64, !dbg !3718
  br label %4, !dbg !3718

4:                                                ; preds = %4, %1
  %5 = phi %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* [ %2, %1 ], [ %135, %4 ], !dbg !3718
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3719, metadata !DIExpression()), !dbg !3723
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)), !dbg !3729
  %6 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 0, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %6, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 72, DW_OP_stack_value)), !dbg !3729
  %7 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 1, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %7, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 136, DW_OP_stack_value)), !dbg !3729
  %8 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 2, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %8, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 200, DW_OP_stack_value)), !dbg !3729
  %9 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 3, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %9, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 264, DW_OP_stack_value)), !dbg !3729
  %10 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 4, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %10, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 328, DW_OP_stack_value)), !dbg !3729
  %11 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 5, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %11, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 392, DW_OP_stack_value)), !dbg !3729
  %12 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 6, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %12, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 456, DW_OP_stack_value)), !dbg !3729
  %13 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 7, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %13, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 520, DW_OP_stack_value)), !dbg !3729
  %14 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 8, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %14, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 584, DW_OP_stack_value)), !dbg !3729
  %15 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 9, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %15, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 648, DW_OP_stack_value)), !dbg !3729
  %16 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 10, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %16, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 712, DW_OP_stack_value)), !dbg !3729
  %17 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 11, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %17, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 776, DW_OP_stack_value)), !dbg !3729
  %18 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 12, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %18, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 840, DW_OP_stack_value)), !dbg !3729
  %19 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 13, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %19, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 904, DW_OP_stack_value)), !dbg !3729
  %20 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 14, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %20, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 968, DW_OP_stack_value)), !dbg !3729
  %21 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 15, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %21, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1032, DW_OP_stack_value)), !dbg !3729
  %22 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 16, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %22, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1096, DW_OP_stack_value)), !dbg !3729
  %23 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 17, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %23, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1160, DW_OP_stack_value)), !dbg !3729
  %24 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 18, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %24, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1224, DW_OP_stack_value)), !dbg !3729
  %25 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 19, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %25, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1288, DW_OP_stack_value)), !dbg !3729
  %26 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 20, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %26, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1352, DW_OP_stack_value)), !dbg !3729
  %27 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 21, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %27, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1416, DW_OP_stack_value)), !dbg !3729
  %28 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 22, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %28, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1480, DW_OP_stack_value)), !dbg !3729
  %29 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 23, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %29, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1544, DW_OP_stack_value)), !dbg !3729
  %30 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 24, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %30, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1608, DW_OP_stack_value)), !dbg !3729
  %31 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 25, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %31, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1672, DW_OP_stack_value)), !dbg !3729
  %32 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 26, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %32, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1736, DW_OP_stack_value)), !dbg !3729
  %33 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 27, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %33, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1800, DW_OP_stack_value)), !dbg !3729
  %34 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 28, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %34, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1864, DW_OP_stack_value)), !dbg !3729
  %35 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 29, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %35, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1928, DW_OP_stack_value)), !dbg !3729
  %36 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 30, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %36, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 1992, DW_OP_stack_value)), !dbg !3729
  %37 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 31, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %37, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2056, DW_OP_stack_value)), !dbg !3729
  %38 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 32, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %38, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2120, DW_OP_stack_value)), !dbg !3729
  %39 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 33, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %39, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2184, DW_OP_stack_value)), !dbg !3729
  %40 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 34, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %40, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2248, DW_OP_stack_value)), !dbg !3729
  %41 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 35, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %41, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2312, DW_OP_stack_value)), !dbg !3729
  %42 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 36, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %42, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2376, DW_OP_stack_value)), !dbg !3729
  %43 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 37, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %43, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2440, DW_OP_stack_value)), !dbg !3729
  %44 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 38, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %44, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2504, DW_OP_stack_value)), !dbg !3729
  %45 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 39, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %45, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2568, DW_OP_stack_value)), !dbg !3729
  %46 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 40, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %46, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2632, DW_OP_stack_value)), !dbg !3729
  %47 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 41, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %47, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2696, DW_OP_stack_value)), !dbg !3729
  %48 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 42, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %48, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2760, DW_OP_stack_value)), !dbg !3729
  %49 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 43, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %49, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2824, DW_OP_stack_value)), !dbg !3729
  %50 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 44, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %50, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2888, DW_OP_stack_value)), !dbg !3729
  %51 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 45, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %51, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 2952, DW_OP_stack_value)), !dbg !3729
  %52 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 46, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %52, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3016, DW_OP_stack_value)), !dbg !3729
  %53 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 47, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %53, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3080, DW_OP_stack_value)), !dbg !3729
  %54 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 48, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %54, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3144, DW_OP_stack_value)), !dbg !3729
  %55 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 49, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %55, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3208, DW_OP_stack_value)), !dbg !3729
  %56 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 50, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %56, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3272, DW_OP_stack_value)), !dbg !3729
  %57 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 51, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %57, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3336, DW_OP_stack_value)), !dbg !3729
  %58 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 52, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %58, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3400, DW_OP_stack_value)), !dbg !3729
  %59 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 53, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %59, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3464, DW_OP_stack_value)), !dbg !3729
  %60 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 54, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %60, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3528, DW_OP_stack_value)), !dbg !3729
  %61 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 55, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %61, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3592, DW_OP_stack_value)), !dbg !3729
  %62 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 56, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %62, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3656, DW_OP_stack_value)), !dbg !3729
  %63 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 57, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %63, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3720, DW_OP_stack_value)), !dbg !3729
  %64 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 58, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %64, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3784, DW_OP_stack_value)), !dbg !3729
  %65 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 59, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %65, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3848, DW_OP_stack_value)), !dbg !3729
  %66 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 60, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %66, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3912, DW_OP_stack_value)), !dbg !3729
  %67 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 61, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %67, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 3976, DW_OP_stack_value)), !dbg !3729
  %68 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 62, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %68, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, metadata !3725, metadata !DIExpression(DW_OP_plus_uconst, 4040, DW_OP_stack_value)), !dbg !3729
  %69 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 0, i32 1, i64 63, i32 2, !dbg !3731
  call void @llvm.dbg.value(metadata %"union.scabbard::trace::ThreadId"* %69, metadata !3732, metadata !DIExpression()), !dbg !3737
  call void @llvm.dbg.value(metadata i8* null, metadata !3735, metadata !DIExpression()), !dbg !3737
  %70 = bitcast %"union.scabbard::trace::ThreadId"* %69 to i8*, !dbg !3739
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(48) %70, i8 0, i64 48, i1 false), !dbg !3740
  %71 = bitcast %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(18) %71, i8 0, i64 18, i1 false), !dbg !3743
  %72 = bitcast %"union.scabbard::trace::ThreadId"* %6 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %72, i8 0, i64 58, i1 false), !dbg !3740
  %73 = bitcast %"union.scabbard::trace::ThreadId"* %7 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %73, i8 0, i64 58, i1 false), !dbg !3740
  %74 = bitcast %"union.scabbard::trace::ThreadId"* %8 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %74, i8 0, i64 58, i1 false), !dbg !3740
  %75 = bitcast %"union.scabbard::trace::ThreadId"* %9 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %75, i8 0, i64 58, i1 false), !dbg !3740
  %76 = bitcast %"union.scabbard::trace::ThreadId"* %10 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %76, i8 0, i64 58, i1 false), !dbg !3740
  %77 = bitcast %"union.scabbard::trace::ThreadId"* %11 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %77, i8 0, i64 58, i1 false), !dbg !3740
  %78 = bitcast %"union.scabbard::trace::ThreadId"* %12 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %78, i8 0, i64 58, i1 false), !dbg !3740
  %79 = bitcast %"union.scabbard::trace::ThreadId"* %13 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %79, i8 0, i64 58, i1 false), !dbg !3740
  %80 = bitcast %"union.scabbard::trace::ThreadId"* %14 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %80, i8 0, i64 58, i1 false), !dbg !3740
  %81 = bitcast %"union.scabbard::trace::ThreadId"* %15 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %81, i8 0, i64 58, i1 false), !dbg !3740
  %82 = bitcast %"union.scabbard::trace::ThreadId"* %16 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %82, i8 0, i64 58, i1 false), !dbg !3740
  %83 = bitcast %"union.scabbard::trace::ThreadId"* %17 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %83, i8 0, i64 58, i1 false), !dbg !3740
  %84 = bitcast %"union.scabbard::trace::ThreadId"* %18 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %84, i8 0, i64 58, i1 false), !dbg !3740
  %85 = bitcast %"union.scabbard::trace::ThreadId"* %19 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %85, i8 0, i64 58, i1 false), !dbg !3740
  %86 = bitcast %"union.scabbard::trace::ThreadId"* %20 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %86, i8 0, i64 58, i1 false), !dbg !3740
  %87 = bitcast %"union.scabbard::trace::ThreadId"* %21 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %87, i8 0, i64 58, i1 false), !dbg !3740
  %88 = bitcast %"union.scabbard::trace::ThreadId"* %22 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %88, i8 0, i64 58, i1 false), !dbg !3740
  %89 = bitcast %"union.scabbard::trace::ThreadId"* %23 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %89, i8 0, i64 58, i1 false), !dbg !3740
  %90 = bitcast %"union.scabbard::trace::ThreadId"* %24 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %90, i8 0, i64 58, i1 false), !dbg !3740
  %91 = bitcast %"union.scabbard::trace::ThreadId"* %25 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %91, i8 0, i64 58, i1 false), !dbg !3740
  %92 = bitcast %"union.scabbard::trace::ThreadId"* %26 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %92, i8 0, i64 58, i1 false), !dbg !3740
  %93 = bitcast %"union.scabbard::trace::ThreadId"* %27 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %93, i8 0, i64 58, i1 false), !dbg !3740
  %94 = bitcast %"union.scabbard::trace::ThreadId"* %28 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %94, i8 0, i64 58, i1 false), !dbg !3740
  %95 = bitcast %"union.scabbard::trace::ThreadId"* %29 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %95, i8 0, i64 58, i1 false), !dbg !3740
  %96 = bitcast %"union.scabbard::trace::ThreadId"* %30 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %96, i8 0, i64 58, i1 false), !dbg !3740
  %97 = bitcast %"union.scabbard::trace::ThreadId"* %31 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %97, i8 0, i64 58, i1 false), !dbg !3740
  %98 = bitcast %"union.scabbard::trace::ThreadId"* %32 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %98, i8 0, i64 58, i1 false), !dbg !3740
  %99 = bitcast %"union.scabbard::trace::ThreadId"* %33 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %99, i8 0, i64 58, i1 false), !dbg !3740
  %100 = bitcast %"union.scabbard::trace::ThreadId"* %34 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %100, i8 0, i64 58, i1 false), !dbg !3740
  %101 = bitcast %"union.scabbard::trace::ThreadId"* %35 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %101, i8 0, i64 58, i1 false), !dbg !3740
  %102 = bitcast %"union.scabbard::trace::ThreadId"* %36 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %102, i8 0, i64 58, i1 false), !dbg !3740
  %103 = bitcast %"union.scabbard::trace::ThreadId"* %37 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %103, i8 0, i64 58, i1 false), !dbg !3740
  %104 = bitcast %"union.scabbard::trace::ThreadId"* %38 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %104, i8 0, i64 58, i1 false), !dbg !3740
  %105 = bitcast %"union.scabbard::trace::ThreadId"* %39 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %105, i8 0, i64 58, i1 false), !dbg !3740
  %106 = bitcast %"union.scabbard::trace::ThreadId"* %40 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %106, i8 0, i64 58, i1 false), !dbg !3740
  %107 = bitcast %"union.scabbard::trace::ThreadId"* %41 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %107, i8 0, i64 58, i1 false), !dbg !3740
  %108 = bitcast %"union.scabbard::trace::ThreadId"* %42 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %108, i8 0, i64 58, i1 false), !dbg !3740
  %109 = bitcast %"union.scabbard::trace::ThreadId"* %43 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %109, i8 0, i64 58, i1 false), !dbg !3740
  %110 = bitcast %"union.scabbard::trace::ThreadId"* %44 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %110, i8 0, i64 58, i1 false), !dbg !3740
  %111 = bitcast %"union.scabbard::trace::ThreadId"* %45 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %111, i8 0, i64 58, i1 false), !dbg !3740
  %112 = bitcast %"union.scabbard::trace::ThreadId"* %46 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %112, i8 0, i64 58, i1 false), !dbg !3740
  %113 = bitcast %"union.scabbard::trace::ThreadId"* %47 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %113, i8 0, i64 58, i1 false), !dbg !3740
  %114 = bitcast %"union.scabbard::trace::ThreadId"* %48 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %114, i8 0, i64 58, i1 false), !dbg !3740
  %115 = bitcast %"union.scabbard::trace::ThreadId"* %49 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %115, i8 0, i64 58, i1 false), !dbg !3740
  %116 = bitcast %"union.scabbard::trace::ThreadId"* %50 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %116, i8 0, i64 58, i1 false), !dbg !3740
  %117 = bitcast %"union.scabbard::trace::ThreadId"* %51 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %117, i8 0, i64 58, i1 false), !dbg !3740
  %118 = bitcast %"union.scabbard::trace::ThreadId"* %52 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %118, i8 0, i64 58, i1 false), !dbg !3740
  %119 = bitcast %"union.scabbard::trace::ThreadId"* %53 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %119, i8 0, i64 58, i1 false), !dbg !3740
  %120 = bitcast %"union.scabbard::trace::ThreadId"* %54 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %120, i8 0, i64 58, i1 false), !dbg !3740
  %121 = bitcast %"union.scabbard::trace::ThreadId"* %55 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %121, i8 0, i64 58, i1 false), !dbg !3740
  %122 = bitcast %"union.scabbard::trace::ThreadId"* %56 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %122, i8 0, i64 58, i1 false), !dbg !3740
  %123 = bitcast %"union.scabbard::trace::ThreadId"* %57 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %123, i8 0, i64 58, i1 false), !dbg !3740
  %124 = bitcast %"union.scabbard::trace::ThreadId"* %58 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %124, i8 0, i64 58, i1 false), !dbg !3740
  %125 = bitcast %"union.scabbard::trace::ThreadId"* %59 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %125, i8 0, i64 58, i1 false), !dbg !3740
  %126 = bitcast %"union.scabbard::trace::ThreadId"* %60 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %126, i8 0, i64 58, i1 false), !dbg !3740
  %127 = bitcast %"union.scabbard::trace::ThreadId"* %61 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %127, i8 0, i64 58, i1 false), !dbg !3740
  %128 = bitcast %"union.scabbard::trace::ThreadId"* %62 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %128, i8 0, i64 58, i1 false), !dbg !3740
  %129 = bitcast %"union.scabbard::trace::ThreadId"* %63 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %129, i8 0, i64 58, i1 false), !dbg !3740
  %130 = bitcast %"union.scabbard::trace::ThreadId"* %64 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %130, i8 0, i64 58, i1 false), !dbg !3740
  %131 = bitcast %"union.scabbard::trace::ThreadId"* %65 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %131, i8 0, i64 58, i1 false), !dbg !3740
  %132 = bitcast %"union.scabbard::trace::ThreadId"* %66 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %132, i8 0, i64 58, i1 false), !dbg !3740
  %133 = bitcast %"union.scabbard::trace::ThreadId"* %67 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %133, i8 0, i64 58, i1 false), !dbg !3740
  %134 = bitcast %"union.scabbard::trace::ThreadId"* %68 to i8*, !dbg !3742
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(58) %134, i8 0, i64 58, i1 false), !dbg !3740
  %135 = getelementptr inbounds %"struct.scabbard::trace::DeviceAsyncQueue::Lane", %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %5, i64 1, !dbg !3718
  %136 = icmp eq %"struct.scabbard::trace::DeviceAsyncQueue::Lane"* %135, %3, !dbg !3718
  br i1 %136, label %137, label %4, !dbg !3718

137:                                              ; preds = %4
  ret void, !dbg !3744
}

declare !dbg !3745 dso_local i32 @hipMemcpy(i8* noundef, i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare dso_local void @_ZN8scabbard5trace10AsyncQueue16set_device_queueEPNS0_16DeviceAsyncQueueE(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408), %"struct.scabbard::trace::DeviceAsyncQueue"* noundef) local_unnamed_addr #0

declare dso_local void @_ZN8scabbard5trace10AsyncQueue5startEv(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408)) local_unnamed_addr #0

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn uwtable
define dso_local void @scabbard.trace.scabbard_close() local_unnamed_addr #9 !dbg !3749 {
  ret void, !dbg !3750
}

; Function Attrs: mustprogress uwtable
define dso_local noundef i64 @"scabbard.trace.metadata_register$src"(i8* noundef %0) local_unnamed_addr #10 !dbg !3751 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !3755, metadata !DIExpression()), !dbg !3756
  %2 = tail call noundef i64 @_ZN8scabbard5trace10AsyncQueue12register_srcEPKc(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408) @_ZN8scabbard5trace12TRACE_LOGGERE, i8* noundef %0), !dbg !3757
  ret i64 %2, !dbg !3758
}

declare dso_local noundef i64 @_ZN8scabbard5trace10AsyncQueue12register_srcEPKc(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408), i8* noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define dso_local void @"scabbard.trace.host.trace_append$mem"(i16 noundef zeroext %0, i8* noundef %1, i64* nocapture noundef readonly %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #3 personality i32 (...)* @__gxx_personality_v0 !dbg !3759 {
  %6 = alloca %"struct.scabbard::trace::TraceData", align 8
  call void @llvm.dbg.value(metadata i16 %0, metadata !3766, metadata !DIExpression()), !dbg !3771
  call void @llvm.dbg.value(metadata i8* %1, metadata !3767, metadata !DIExpression()), !dbg !3771
  call void @llvm.dbg.value(metadata i64* %2, metadata !3768, metadata !DIExpression()), !dbg !3771
  call void @llvm.dbg.value(metadata i32 %3, metadata !3769, metadata !DIExpression()), !dbg !3771
  call void @llvm.dbg.value(metadata i32 %4, metadata !3770, metadata !DIExpression()), !dbg !3771
  %7 = load i64, i64* %2, align 8, !dbg !3772, !tbaa !2980
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::TraceData"* %6, metadata !3773, metadata !DIExpression()), !dbg !3780
  call void @llvm.dbg.value(metadata i16 %0, metadata !3776, metadata !DIExpression()), !dbg !3780
  call void @llvm.dbg.value(metadata i8* %1, metadata !3777, metadata !DIExpression()), !dbg !3780
  call void @llvm.dbg.value(metadata %"struct.scabbard::LocationMetadata"* undef, metadata !3778, metadata !DIExpression()), !dbg !3780
  call void @llvm.dbg.value(metadata i64 0, metadata !3779, metadata !DIExpression()), !dbg !3780
  %8 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 0, !dbg !3782
  %9 = tail call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #19, !dbg !3783
  store i64 %9, i64* %8, align 8, !dbg !3782, !tbaa !3784
  %10 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 1, !dbg !3788
  store i16 %0, i16* %10, align 8, !dbg !3788, !tbaa !3789
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::TraceData"* %6, metadata !3790, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !3793
  %11 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 2, i32 1, i64 0, !dbg !3795
  %12 = bitcast i8* %11 to i64*, !dbg !3795
  store i64 0, i64* %12, align 8, !dbg !3795
  %13 = tail call i64 @pthread_self() #23, !dbg !3797
  %14 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 2, i32 0, i32 0, !dbg !3803
  store i64 %13, i64* %14, align 8, !dbg !3803, !tbaa.struct !3804
  %15 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 3, !dbg !3805
  store i8* %1, i8** %15, align 8, !dbg !3805, !tbaa !3806
  %16 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 4, i32 0, !dbg !3807
  store i64 %7, i64* %16, align 8, !dbg !3807, !tbaa.struct !3808
  %17 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 4, i32 1, !dbg !3807
  store i32 %3, i32* %17, align 8, !dbg !3807, !tbaa.struct !3809
  %18 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 4, i32 2, !dbg !3807
  store i32 %4, i32* %18, align 4, !dbg !3807, !tbaa.struct !3810
  %19 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 5, !dbg !3811
  store i64 0, i64* %19, align 8, !dbg !3811, !tbaa !3812
  call void @_ZN8scabbard5trace10AsyncQueue6appendENS0_9TraceDataE(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408) @_ZN8scabbard5trace12TRACE_LOGGERE, %"struct.scabbard::trace::TraceData"* noundef nonnull %6), !dbg !3813
  ret void, !dbg !3814
}

declare dso_local void @_ZN8scabbard5trace10AsyncQueue6appendENS0_9TraceDataE(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408), %"struct.scabbard::trace::TraceData"* noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define dso_local void @"scabbard.trace.host.trace_append$mem$cond"(i16 noundef zeroext %0, i8* noundef %1, i64* nocapture noundef readonly %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #3 personality i32 (...)* @__gxx_personality_v0 !dbg !3815 {
  %6 = alloca %"struct.scabbard::trace::TraceData", align 8
  call void @llvm.dbg.value(metadata i16 %0, metadata !3817, metadata !DIExpression()), !dbg !3835
  call void @llvm.dbg.value(metadata i8* %1, metadata !3818, metadata !DIExpression()), !dbg !3835
  call void @llvm.dbg.value(metadata i64* %2, metadata !3819, metadata !DIExpression()), !dbg !3835
  call void @llvm.dbg.value(metadata i32 %3, metadata !3820, metadata !DIExpression()), !dbg !3835
  call void @llvm.dbg.value(metadata i32 %4, metadata !3821, metadata !DIExpression()), !dbg !3835
  %7 = tail call i32 @hipPointerGetAttributes(%struct.hipPointerAttribute_t* noundef undef, i8* noundef %1), !dbg !3836
  call void @llvm.dbg.value(metadata i32 %7, metadata !3833, metadata !DIExpression()), !dbg !3835
  %8 = icmp eq i32 %7, 0, !dbg !3837
  br i1 %8, label %9, label %25, !dbg !3839

9:                                                ; preds = %5
  call void @llvm.dbg.value(metadata i16* undef, metadata !3840, metadata !DIExpression()), !dbg !3847
  call void @llvm.dbg.value(metadata i16 2048, metadata !3846, metadata !DIExpression()), !dbg !3847
  %10 = or i16 %0, 2048, !dbg !3852
  call void @llvm.dbg.value(metadata i16 %10, metadata !3817, metadata !DIExpression()), !dbg !3835
  %11 = bitcast %"struct.scabbard::trace::TraceData"* %6 to i8*, !dbg !3853
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %11), !dbg !3853
  call void @llvm.dbg.value(metadata i16 %10, metadata !3766, metadata !DIExpression()), !dbg !3853
  call void @llvm.dbg.value(metadata i8* %1, metadata !3767, metadata !DIExpression()), !dbg !3853
  call void @llvm.dbg.value(metadata i64* %2, metadata !3768, metadata !DIExpression()), !dbg !3853
  call void @llvm.dbg.value(metadata i32 %3, metadata !3769, metadata !DIExpression()), !dbg !3853
  call void @llvm.dbg.value(metadata i32 %4, metadata !3770, metadata !DIExpression()), !dbg !3853
  %12 = load i64, i64* %2, align 8, !dbg !3855, !tbaa !2980
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::TraceData"* %6, metadata !3773, metadata !DIExpression()), !dbg !3856
  call void @llvm.dbg.value(metadata i16 %10, metadata !3776, metadata !DIExpression()), !dbg !3856
  call void @llvm.dbg.value(metadata i8* %1, metadata !3777, metadata !DIExpression()), !dbg !3856
  call void @llvm.dbg.value(metadata %"struct.scabbard::LocationMetadata"* undef, metadata !3778, metadata !DIExpression()), !dbg !3856
  call void @llvm.dbg.value(metadata i64 0, metadata !3779, metadata !DIExpression()), !dbg !3856
  %13 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 0, !dbg !3858
  %14 = tail call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #19, !dbg !3859
  store i64 %14, i64* %13, align 8, !dbg !3858, !tbaa !3784
  %15 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 1, !dbg !3860
  store i16 %10, i16* %15, align 8, !dbg !3860, !tbaa !3789
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::TraceData"* %6, metadata !3790, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !3861
  %16 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 2, i32 1, i64 0, !dbg !3863
  %17 = bitcast i8* %16 to i64*, !dbg !3863
  store i64 0, i64* %17, align 8, !dbg !3863
  %18 = tail call i64 @pthread_self() #23, !dbg !3864
  %19 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 2, i32 0, i32 0, !dbg !3866
  store i64 %18, i64* %19, align 8, !dbg !3866, !tbaa.struct !3804
  %20 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 3, !dbg !3867
  store i8* %1, i8** %20, align 8, !dbg !3867, !tbaa !3806
  %21 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 4, i32 0, !dbg !3868
  store i64 %12, i64* %21, align 8, !dbg !3868, !tbaa.struct !3808
  %22 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 4, i32 1, !dbg !3868
  store i32 %3, i32* %22, align 8, !dbg !3868, !tbaa.struct !3809
  %23 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 4, i32 2, !dbg !3868
  store i32 %4, i32* %23, align 4, !dbg !3868, !tbaa.struct !3810
  %24 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %6, i64 0, i32 5, !dbg !3869
  store i64 0, i64* %24, align 8, !dbg !3869, !tbaa !3812
  call void @_ZN8scabbard5trace10AsyncQueue6appendENS0_9TraceDataE(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408) @_ZN8scabbard5trace12TRACE_LOGGERE, %"struct.scabbard::trace::TraceData"* noundef nonnull %6), !dbg !3870
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %11), !dbg !3871
  br label %54, !dbg !3872

25:                                               ; preds = %5
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cerr, metadata !3362, metadata !DIExpression()), !dbg !3873
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([109 x i8], [109 x i8]* @.str.12, i64 0, i64 0), metadata !3371, metadata !DIExpression()), !dbg !3873
  %26 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8* noundef nonnull getelementptr inbounds ([109 x i8], [109 x i8]* @.str.12, i64 0, i64 0), i64 noundef 108), !dbg !3876
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cerr, metadata !3385, metadata !DIExpression()), !dbg !3877
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, metadata !3397, metadata !DIExpression()), !dbg !3877
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cerr, metadata !3879, metadata !DIExpression()), !dbg !3884
  %27 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cerr to i8**), align 8, !dbg !3886, !tbaa !3887
  %28 = getelementptr i8, i8* %27, i64 -24, !dbg !3886
  %29 = bitcast i8* %28 to i64*, !dbg !3886
  %30 = load i64, i64* %29, align 8, !dbg !3886
  %31 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cerr to i8*), i64 %30, !dbg !3886
  call void @llvm.dbg.value(metadata i8* %31, metadata !3889, metadata !DIExpression()), !dbg !3903
  call void @llvm.dbg.value(metadata i8 10, metadata !3901, metadata !DIExpression()), !dbg !3903
  %32 = getelementptr inbounds i8, i8* %31, i64 240, !dbg !3905
  %33 = bitcast i8* %32 to %"class.std::ctype"**, !dbg !3905
  %34 = load %"class.std::ctype"*, %"class.std::ctype"** %33, align 8, !dbg !3905, !tbaa !3906
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %34, metadata !3914, metadata !DIExpression()), !dbg !3926
  %35 = icmp eq %"class.std::ctype"* %34, null, !dbg !3928
  br i1 %35, label %36, label %37, !dbg !3930

36:                                               ; preds = %25
  tail call void @_ZSt16__throw_bad_castv() #20, !dbg !3931
  unreachable, !dbg !3931

37:                                               ; preds = %25
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %34, metadata !3932, metadata !DIExpression()), !dbg !3941
  call void @llvm.dbg.value(metadata i8 10, metadata !3940, metadata !DIExpression()), !dbg !3941
  %38 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %34, i64 0, i32 8, !dbg !3943
  %39 = load i8, i8* %38, align 8, !dbg !3943, !tbaa !3945
  %40 = icmp eq i8 %39, 0, !dbg !3943
  br i1 %40, label %44, label %41, !dbg !3948

41:                                               ; preds = %37
  %42 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %34, i64 0, i32 9, i64 10, !dbg !3949
  %43 = load i8, i8* %42, align 1, !dbg !3949, !tbaa !3006
  br label %50, !dbg !3950

44:                                               ; preds = %37
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %34), !dbg !3951
  %45 = bitcast %"class.std::ctype"* %34 to i8 (%"class.std::ctype"*, i8)***, !dbg !3952
  %46 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %45, align 8, !dbg !3952, !tbaa !3887
  %47 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %46, i64 6, !dbg !3952
  %48 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %47, align 8, !dbg !3952
  %49 = tail call noundef signext i8 %48(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %34, i8 noundef signext 10), !dbg !3952
  br label %50, !dbg !3953

50:                                               ; preds = %41, %44
  %51 = phi i8 [ %43, %41 ], [ %49, %44 ], !dbg !3941
  %52 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cerr, i8 noundef signext %51), !dbg !3954
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %52, metadata !3955, metadata !DIExpression()), !dbg !3958
  %53 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %52), !dbg !3960
  br label %54

54:                                               ; preds = %50, %9
  ret void, !dbg !3961
}

declare !dbg !3962 dso_local i32 @hipPointerGetAttributes(%struct.hipPointerAttribute_t* noundef, i8* noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define dso_local void @"scabbard.trace.host.trace_append$alloc"(i16 noundef zeroext %0, i8* noundef %1, i64* nocapture noundef readonly %2, i32 noundef %3, i32 noundef %4, i64 noundef %5) local_unnamed_addr #3 personality i32 (...)* @__gxx_personality_v0 !dbg !3965 {
  %7 = alloca %"struct.scabbard::trace::TraceData", align 8
  call void @llvm.dbg.value(metadata i16 %0, metadata !3969, metadata !DIExpression()), !dbg !3975
  call void @llvm.dbg.value(metadata i8* %1, metadata !3970, metadata !DIExpression()), !dbg !3975
  call void @llvm.dbg.value(metadata i64* %2, metadata !3971, metadata !DIExpression()), !dbg !3975
  call void @llvm.dbg.value(metadata i32 %3, metadata !3972, metadata !DIExpression()), !dbg !3975
  call void @llvm.dbg.value(metadata i32 %4, metadata !3973, metadata !DIExpression()), !dbg !3975
  call void @llvm.dbg.value(metadata i64 %5, metadata !3974, metadata !DIExpression()), !dbg !3975
  %8 = load i64, i64* %2, align 8, !dbg !3976, !tbaa !2980
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::TraceData"* %7, metadata !3773, metadata !DIExpression()), !dbg !3977
  call void @llvm.dbg.value(metadata i16 %0, metadata !3776, metadata !DIExpression()), !dbg !3977
  call void @llvm.dbg.value(metadata i8* %1, metadata !3777, metadata !DIExpression()), !dbg !3977
  call void @llvm.dbg.value(metadata %"struct.scabbard::LocationMetadata"* undef, metadata !3778, metadata !DIExpression()), !dbg !3977
  call void @llvm.dbg.value(metadata i64 %5, metadata !3779, metadata !DIExpression()), !dbg !3977
  %9 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %7, i64 0, i32 0, !dbg !3979
  %10 = tail call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #19, !dbg !3980
  store i64 %10, i64* %9, align 8, !dbg !3979, !tbaa !3784
  %11 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %7, i64 0, i32 1, !dbg !3981
  store i16 %0, i16* %11, align 8, !dbg !3981, !tbaa !3789
  call void @llvm.dbg.value(metadata %"struct.scabbard::trace::TraceData"* %7, metadata !3790, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !3982
  %12 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %7, i64 0, i32 2, i32 1, i64 0, !dbg !3984
  %13 = bitcast i8* %12 to i64*, !dbg !3984
  store i64 0, i64* %13, align 8, !dbg !3984
  %14 = tail call i64 @pthread_self() #23, !dbg !3985
  %15 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %7, i64 0, i32 2, i32 0, i32 0, !dbg !3987
  store i64 %14, i64* %15, align 8, !dbg !3987, !tbaa.struct !3804
  %16 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %7, i64 0, i32 3, !dbg !3988
  store i8* %1, i8** %16, align 8, !dbg !3988, !tbaa !3806
  %17 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %7, i64 0, i32 4, i32 0, !dbg !3989
  store i64 %8, i64* %17, align 8, !dbg !3989, !tbaa.struct !3808
  %18 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %7, i64 0, i32 4, i32 1, !dbg !3989
  store i32 %3, i32* %18, align 8, !dbg !3989, !tbaa.struct !3809
  %19 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %7, i64 0, i32 4, i32 2, !dbg !3989
  store i32 %4, i32* %19, align 4, !dbg !3989, !tbaa.struct !3810
  %20 = getelementptr inbounds %"struct.scabbard::trace::TraceData", %"struct.scabbard::trace::TraceData"* %7, i64 0, i32 5, !dbg !3990
  store i64 %5, i64* %20, align 8, !dbg !3990, !tbaa !3812
  call void @_ZN8scabbard5trace10AsyncQueue6appendENS0_9TraceDataE(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408) @_ZN8scabbard5trace12TRACE_LOGGERE, %"struct.scabbard::trace::TraceData"* noundef nonnull %7), !dbg !3991
  ret void, !dbg !3992
}

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #11

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #12

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare !dbg !3993 dso_local i64 @pthread_self() local_unnamed_addr #13

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8* noundef) local_unnamed_addr #14

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @strlen(i8* nocapture noundef) local_unnamed_addr #15

declare dso_local noundef i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32), i64* noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

declare dso_local void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32), i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32), i8* noundef, i64 noundef) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt20__throw_length_errorPKc(i8* noundef) local_unnamed_addr #16

declare !dbg !3997 dso_local i32 @hipMalloc(i8** noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #16

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_defs.cpp() #3 section ".text.startup" !dbg !4000 {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit), !dbg !4002
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #19, !dbg !4006
  tail call void @_ZN8scabbard5trace10AsyncQueueC1Ev(%"class.scabbard::trace::AsyncQueue"* noundef nonnull align 8 dereferenceable(263408) @_ZN8scabbard5trace12TRACE_LOGGERE), !dbg !4007
  %2 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.scabbard::trace::AsyncQueue"*)* @_ZN8scabbard5trace10AsyncQueueD1Ev to void (i8*)*), i8* bitcast (%"class.scabbard::trace::AsyncQueue"* @_ZN8scabbard5trace12TRACE_LOGGERE to i8*), i8* nonnull @__dso_handle) #19, !dbg !4011
  ret void
}

declare dso_local void @__hipRegisterVar(i8**, i8*, i8*, i8*, i32, i64, i32, i32) local_unnamed_addr

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
  tail call void @__hipRegisterVar(i8** %6, i8* bitcast (%"struct.scabbard::trace::DeviceAsyncQueue"** @_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE to i8*), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @0, i64 0, i64 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @0, i64 0, i64 0), i32 0, i64 8, i32 0, i32 0)
  %7 = tail call i32 @atexit(void ()* nonnull @__hip_module_dtor)
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

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #18

attributes #0 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #5 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nofree nounwind readonly "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { inlinehint mustprogress uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree norecurse nosync nounwind readnone willreturn uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { argmemonly mustprogress nocallback nofree nounwind willreturn }
attributes #12 = { argmemonly mustprogress nocallback nofree nounwind willreturn writeonly }
attributes #13 = { mustprogress nofree nosync nounwind readnone willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nobuiltin nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { argmemonly mustprogress nofree nounwind readonly willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { noreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #18 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }
attributes #19 = { nounwind }
attributes #20 = { noreturn }
attributes #21 = { builtin nounwind }
attributes #22 = { noreturn nounwind }
attributes #23 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!248}
!llvm.module.flags = !{!2907, !2908, !2909, !2910}
!llvm.ident = !{!2911}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "DEVICE_TRACE_LOGGER", linkageName: "_ZN8scabbard5trace19DEVICE_TRACE_LOGGERE", scope: !2, file: !4, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "trace", scope: !3)
!3 = !DINamespace(name: "scabbard", scope: null)
!4 = !DIFile(filename: "../include/scabbard/trace/globals.hpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "c31b92113cb69285c1b1a361eeed62bb")
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "DeviceAsyncQueue", scope: !2, file: !7, line: 50, size: 2101248, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !8, identifier: "_ZTSN8scabbard5trace16DeviceAsyncQueueE")
!7 = !DIFile(filename: "../include/scabbard/trace/AsyncQueue.hpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "d6c1a17d8fe734e39a4c3ba4fd5c6da4")
!8 = !{!9, !163, !167}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !6, file: !7, line: 60, baseType: !10, size: 2101248, flags: DIFlagPrivate)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 2101248, elements: !152)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Lane", scope: !6, file: !7, line: 51, size: 32832, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !12, identifier: "_ZTSN8scabbard5trace16DeviceAsyncQueue4LaneE")
!12 = !{!13, !18, !154, !158}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !11, file: !7, line: 52, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !17)
!16 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!17 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !11, file: !7, line: 53, baseType: !19, size: 32768, offset: 64)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 32768, elements: !152)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "TraceData", scope: !2, file: !21, line: 131, size: 512, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !22, identifier: "_ZTSN8scabbard5trace9TraceDataE")
!21 = !DIFile(filename: "../../lib/include/scabbard/TraceData.hpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "7acec8d808c149520980a5f6126409a6")
!22 = !{!23, !28, !56, !109, !112, !121, !122, !126, !131, !134, !138, !142, !147, !151}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "time_stamp", scope: !20, file: !21, line: 134, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !27, file: !26, line: 298, baseType: !17)
!26 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++config.h", directory: "", checksumkind: CSK_MD5, checksum: "c916ec3a412df0ab93f691620f696028")
!27 = !DINamespace(name: "std", scope: null)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !20, file: !21, line: 135, baseType: !29, size: 16, offset: 64)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!30 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "InstrData", scope: !3, file: !31, line: 48, baseType: !32, size: 16, elements: !37, identifier: "_ZTSN8scabbard9InstrDataE")
!31 = !DIFile(filename: "../../lib/include/scabbard/Enums.hpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "12e708a2d3536bd7e99d885eeea9f1b3")
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !33, line: 25, baseType: !34)
!33 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !35, line: 40, baseType: !36)
!35 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!36 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!37 = !{!38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55}
!38 = !DIEnumerator(name: "NEVER", value: 0, isUnsigned: true)
!39 = !DIEnumerator(name: "NO", value: 0, isUnsigned: true)
!40 = !DIEnumerator(name: "_RUNTIME_CONDITIONAL", value: 1, isUnsigned: true)
!41 = !DIEnumerator(name: "ALWAYS", value: 12, isUnsigned: true)
!42 = !DIEnumerator(name: "ON_DEVICE", value: 4, isUnsigned: true)
!43 = !DIEnumerator(name: "ON_GPU", value: 4, isUnsigned: true)
!44 = !DIEnumerator(name: "ON_HOST", value: 8, isUnsigned: true)
!45 = !DIEnumerator(name: "ON_CPU", value: 8, isUnsigned: true)
!46 = !DIEnumerator(name: "ALLOCATE", value: 16, isUnsigned: true)
!47 = !DIEnumerator(name: "READ", value: 32, isUnsigned: true)
!48 = !DIEnumerator(name: "FREE", value: 64, isUnsigned: true)
!49 = !DIEnumerator(name: "WRITE", value: 128, isUnsigned: true)
!50 = !DIEnumerator(name: "ATOMIC_MEM", value: 512, isUnsigned: true)
!51 = !DIEnumerator(name: "MANAGED_MEM", value: 2048, isUnsigned: true)
!52 = !DIEnumerator(name: "DEVICE_HEAP", value: 4096, isUnsigned: true)
!53 = !DIEnumerator(name: "UNKNOWN_HEAP", value: 8192, isUnsigned: true)
!54 = !DIEnumerator(name: "HOST_HEAP", value: 16384, isUnsigned: true)
!55 = !DIEnumerator(name: "STEAM_SYNC", value: 32768, isUnsigned: true)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "threadId", scope: !20, file: !21, line: 136, baseType: !57, size: 128, offset: 128)
!57 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!58 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "ThreadId", scope: !2, file: !21, line: 104, size: 128, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !59, identifier: "_ZTSN8scabbard5trace8ThreadIdE")
!59 = !{!60, !79, !81, !83, !103, !106}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "host", scope: !58, file: !21, line: 105, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "HostThreadId", scope: !2, file: !21, line: 101, baseType: !62)
!62 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "id", scope: !64, file: !63, line: 80, size: 64, flags: DIFlagPublic | DIFlagTypePassByValue | DIFlagNonTrivial, elements: !65, identifier: "_ZTSNSt6thread2idE")
!63 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/std_thread.h", directory: "")
!64 = !DICompositeType(tag: DW_TAG_class_type, name: "thread", scope: !27, file: !63, line: 61, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt6thread")
!65 = !{!66, !72, !76}
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_M_thread", scope: !62, file: !63, line: 82, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "native_handle_type", scope: !64, file: !63, line: 74, baseType: !68)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gthread_t", file: !69, line: 47, baseType: !70)
!69 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/gthr-default.h", directory: "", checksumkind: CSK_MD5, checksum: "2b776226aee81fadf7f1c03e8f650eb7")
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !71, line: 27, baseType: !17)
!71 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!72 = !DISubprogram(name: "id", scope: !62, file: !63, line: 85, type: !73, scopeLine: 85, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!73 = !DISubroutineType(types: !74)
!74 = !{null, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!76 = !DISubprogram(name: "id", scope: !62, file: !63, line: 88, type: !77, scopeLine: 88, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!77 = !DISubroutineType(types: !78)
!78 = !{null, !75, !67}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "device", scope: !58, file: !21, line: 106, baseType: !80, size: 104)
!80 = !DICompositeType(tag: DW_TAG_structure_type, name: "DeviceThreadId", scope: !2, file: !21, line: 73, size: 104, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSN8scabbard5trace14DeviceThreadIdE")
!81 = !DIDerivedType(tag: DW_TAG_member, name: "_NONE_", scope: !58, file: !21, line: 107, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!83 = !DISubprogram(name: "ThreadId", scope: !58, file: !21, line: 109, type: !84, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!84 = !DISubroutineType(types: !85)
!85 = !{null, !86, !87, !87}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!87 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !90, line: 941, baseType: !91)
!90 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "7560f6d8bd7c5ac736ef5dfcbc59d092")
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !90, line: 934, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !92, identifier: "_ZTS4dim3")
!92 = !{!93, !97, !98, !99}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !91, file: !90, line: 935, baseType: !94, size: 32)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !33, line: 26, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !35, line: 42, baseType: !96)
!96 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !91, file: !90, line: 936, baseType: !94, size: 32, offset: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !91, file: !90, line: 937, baseType: !94, size: 32, offset: 64)
!99 = !DISubprogram(name: "dim3", scope: !91, file: !90, line: 939, type: !100, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!100 = !DISubroutineType(types: !101)
!101 = !{null, !102, !94, !94, !94}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!103 = !DISubprogram(name: "ThreadId", scope: !58, file: !21, line: 110, type: !104, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!104 = !DISubroutineType(types: !105)
!105 = !{null, !86}
!106 = !DISubprogram(name: "ThreadId", scope: !58, file: !21, line: 113, type: !107, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!107 = !DISubroutineType(types: !108)
!108 = !{null, !86, !82}
!109 = !DIDerivedType(tag: DW_TAG_member, name: "ptr", scope: !20, file: !21, line: 137, baseType: !110, size: 64, offset: 256)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "metadata", scope: !20, file: !21, line: 138, baseType: !113, size: 128, offset: 320)
!113 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !114)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "LocMData_t", scope: !20, file: !21, line: 132, baseType: !115)
!115 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LocationMetadata", scope: !3, file: !116, line: 21, size: 128, flags: DIFlagTypePassByValue, elements: !117, identifier: "_ZTSN8scabbard16LocationMetadataE")
!116 = !DIFile(filename: "../../lib/include/scabbard/Metadata.hpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "2e390ef03f9efa5e49894078b397b667")
!117 = !{!118, !119, !120}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "src_id", scope: !115, file: !116, line: 22, baseType: !25, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "line", scope: !115, file: !116, line: 23, baseType: !94, size: 32, offset: 64)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "col", scope: !115, file: !116, line: 24, baseType: !94, size: 32, offset: 96)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "_OPT_DATA", scope: !20, file: !21, line: 139, baseType: !24, size: 64, offset: 448)
!122 = !DISubprogram(name: "TraceData", scope: !20, file: !21, line: 145, type: !123, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!123 = !DISubroutineType(types: !124)
!124 = !{null, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!126 = !DISubprogram(name: "TraceData", scope: !20, file: !21, line: 149, type: !127, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!127 = !DISubroutineType(types: !128)
!128 = !{null, !125, !129}
!129 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !130, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!131 = !DISubprogram(name: "TraceData", scope: !20, file: !21, line: 156, type: !132, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!132 = !DISubroutineType(types: !133)
!133 = !{null, !125, !24, !30, !87, !88, !110, !24, !94, !94, !24}
!134 = !DISubprogram(name: "TraceData", scope: !20, file: !21, line: 165, type: !135, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!135 = !DISubroutineType(types: !136)
!136 = !{null, !125, !30, !110, !137, !25}
!137 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !113, size: 64)
!138 = !DISubprogram(name: "TraceData", scope: !20, file: !21, line: 171, type: !139, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!139 = !DISubroutineType(types: !140)
!140 = !{null, !125, !15, !30, !141, !82, !137, !25}
!141 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !57, size: 64)
!142 = !DISubprogram(name: "empty", linkageName: "_ZNK8scabbard5trace9TraceData5emptyEv", scope: !20, file: !21, line: 179, type: !143, scopeLine: 179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!143 = !DISubroutineType(types: !144)
!144 = !{!145, !146}
!145 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!147 = !DISubprogram(name: "operator=", linkageName: "_ZN8scabbard5trace9TraceDataaSERKS1_", scope: !20, file: !21, line: 184, type: !148, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!148 = !DISubroutineType(types: !149)
!149 = !{!150, !125, !129}
!150 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !20, size: 64)
!151 = !DISubprogram(name: "operator bool", linkageName: "_ZNK8scabbard5trace9TraceDatacvbEv", scope: !20, file: !21, line: 188, type: !143, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!152 = !{!153}
!153 = !DISubrange(count: 64)
!154 = !DISubprogram(name: "Lane", scope: !11, file: !7, line: 54, type: !155, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!155 = !DISubroutineType(types: !156)
!156 = !{null, !157}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!158 = !DISubprogram(name: "operator[]", linkageName: "_ZNK8scabbard5trace16DeviceAsyncQueue4LaneixEm", scope: !11, file: !7, line: 56, type: !159, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!159 = !DISubroutineType(types: !160)
!160 = !{!129, !161, !15}
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!162 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!163 = !DISubprogram(name: "DeviceAsyncQueue", scope: !6, file: !7, line: 63, type: !164, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!164 = !DISubroutineType(types: !165)
!165 = !{null, !166}
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!167 = !DISubprogram(name: "operator[]", linkageName: "_ZNK8scabbard5trace16DeviceAsyncQueueixEm", scope: !6, file: !7, line: 66, type: !168, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!168 = !DISubroutineType(types: !169)
!169 = !{!170, !171, !15}
!170 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !162, size: 64)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!172 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!173 = !DIGlobalVariableExpression(var: !174, expr: !DIExpression())
!174 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !27, file: !175, line: 74, type: !176, isLocal: true, isDefinition: true)
!175 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/iostream", directory: "")
!176 = !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !178, file: !177, line: 635, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt8ios_base4InitE")
!177 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/ios_base.h", directory: "")
!178 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !27, file: !177, line: 229, size: 1728, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt8ios_base")
!179 = !DIGlobalVariableExpression(var: !180, expr: !DIExpression())
!180 = distinct !DIGlobalVariable(name: "TRACE_LOGGER", linkageName: "_ZN8scabbard5trace12TRACE_LOGGERE", scope: !2, file: !181, line: 53, type: !182, isLocal: false, isDefinition: true)
!181 = !DIFile(filename: "defs.cpp", directory: "/home/oster/repos/scabbard/libtrace/src", checksumkind: CSK_MD5, checksum: "d57dcb2a2b8223f388dd4a233afecd74")
!182 = !DICompositeType(tag: DW_TAG_class_type, name: "AsyncQueue", scope: !2, file: !7, line: 83, size: 2107264, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSN8scabbard5trace10AsyncQueueE")
!183 = !DIGlobalVariableExpression(var: !184, expr: !DIExpression())
!184 = distinct !DIGlobalVariable(scope: null, file: !181, line: 66, type: !185, isLocal: true, isDefinition: true)
!185 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 248, elements: !188)
!186 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !187)
!187 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!188 = !{!189}
!189 = !DISubrange(count: 31)
!190 = !DIGlobalVariableExpression(var: !191, expr: !DIExpression())
!191 = distinct !DIGlobalVariable(scope: null, file: !181, line: 69, type: !192, isLocal: true, isDefinition: true)
!192 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 96, elements: !193)
!193 = !{!194}
!194 = !DISubrange(count: 12)
!195 = !DIGlobalVariableExpression(var: !196, expr: !DIExpression())
!196 = distinct !DIGlobalVariable(scope: null, file: !181, line: 70, type: !197, isLocal: true, isDefinition: true)
!197 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 160, elements: !198)
!198 = !{!199}
!199 = !DISubrange(count: 20)
!200 = !DIGlobalVariableExpression(var: !201, expr: !DIExpression())
!201 = distinct !DIGlobalVariable(scope: null, file: !181, line: 73, type: !202, isLocal: true, isDefinition: true)
!202 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 24, elements: !203)
!203 = !{!204}
!204 = !DISubrange(count: 3)
!205 = !DIGlobalVariableExpression(var: !206, expr: !DIExpression())
!206 = distinct !DIGlobalVariable(scope: null, file: !181, line: 73, type: !207, isLocal: true, isDefinition: true)
!207 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 128, elements: !208)
!208 = !{!209}
!209 = !DISubrange(count: 16)
!210 = !DIGlobalVariableExpression(var: !211, expr: !DIExpression())
!211 = distinct !DIGlobalVariable(scope: null, file: !181, line: 79, type: !212, isLocal: true, isDefinition: true)
!212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 832, elements: !213)
!213 = !{!214}
!214 = !DISubrange(count: 104)
!215 = !DIGlobalVariableExpression(var: !216, expr: !DIExpression())
!216 = distinct !DIGlobalVariable(scope: null, file: !181, line: 79, type: !202, isLocal: true, isDefinition: true)
!217 = !DIGlobalVariableExpression(var: !218, expr: !DIExpression())
!218 = distinct !DIGlobalVariable(scope: null, file: !181, line: 84, type: !219, isLocal: true, isDefinition: true)
!219 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 352, elements: !220)
!220 = !{!221}
!221 = !DISubrange(count: 44)
!222 = !DIGlobalVariableExpression(var: !223, expr: !DIExpression())
!223 = distinct !DIGlobalVariable(scope: null, file: !181, line: 84, type: !224, isLocal: true, isDefinition: true)
!224 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 288, elements: !225)
!225 = !{!226}
!226 = !DISubrange(count: 36)
!227 = !DIGlobalVariableExpression(var: !228, expr: !DIExpression())
!228 = distinct !DIGlobalVariable(scope: null, file: !181, line: 87, type: !229, isLocal: true, isDefinition: true)
!229 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 752, elements: !230)
!230 = !{!231}
!231 = !DISubrange(count: 94)
!232 = !DIGlobalVariableExpression(var: !233, expr: !DIExpression())
!233 = distinct !DIGlobalVariable(scope: null, file: !181, line: 95, type: !234, isLocal: true, isDefinition: true)
!234 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 920, elements: !235)
!235 = !{!236}
!236 = !DISubrange(count: 115)
!237 = !DIGlobalVariableExpression(var: !238, expr: !DIExpression())
!238 = distinct !DIGlobalVariable(scope: null, file: !181, line: 156, type: !239, isLocal: true, isDefinition: true)
!239 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 872, elements: !240)
!240 = !{!241}
!241 = !DISubrange(count: 109)
!242 = !DIGlobalVariableExpression(var: !243, expr: !DIExpression())
!243 = distinct !DIGlobalVariable(scope: null, file: !244, line: 1421, type: !245, isLocal: true, isDefinition: true)
!244 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/basic_string.h", directory: "")
!245 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 168, elements: !246)
!246 = !{!247}
!247 = !DISubrange(count: 21)
!248 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !181, producer: "AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !249, retainedTypes: !1089, globals: !1244, imports: !1250, splitDebugInlining: false, nameTableKind: None)
!249 = !{!30, !250, !330, !338, !345, !1080}
!250 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipError_t", file: !90, line: 206, baseType: !96, size: 32, elements: !251, identifier: "_ZTS10hipError_t")
!251 = !{!252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !313, !314, !315, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !327, !328, !329}
!252 = !DIEnumerator(name: "hipSuccess", value: 0, isUnsigned: true)
!253 = !DIEnumerator(name: "hipErrorInvalidValue", value: 1, isUnsigned: true)
!254 = !DIEnumerator(name: "hipErrorOutOfMemory", value: 2, isUnsigned: true)
!255 = !DIEnumerator(name: "hipErrorMemoryAllocation", value: 2, isUnsigned: true)
!256 = !DIEnumerator(name: "hipErrorNotInitialized", value: 3, isUnsigned: true)
!257 = !DIEnumerator(name: "hipErrorInitializationError", value: 3, isUnsigned: true)
!258 = !DIEnumerator(name: "hipErrorDeinitialized", value: 4, isUnsigned: true)
!259 = !DIEnumerator(name: "hipErrorProfilerDisabled", value: 5, isUnsigned: true)
!260 = !DIEnumerator(name: "hipErrorProfilerNotInitialized", value: 6, isUnsigned: true)
!261 = !DIEnumerator(name: "hipErrorProfilerAlreadyStarted", value: 7, isUnsigned: true)
!262 = !DIEnumerator(name: "hipErrorProfilerAlreadyStopped", value: 8, isUnsigned: true)
!263 = !DIEnumerator(name: "hipErrorInvalidConfiguration", value: 9, isUnsigned: true)
!264 = !DIEnumerator(name: "hipErrorInvalidPitchValue", value: 12, isUnsigned: true)
!265 = !DIEnumerator(name: "hipErrorInvalidSymbol", value: 13, isUnsigned: true)
!266 = !DIEnumerator(name: "hipErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!267 = !DIEnumerator(name: "hipErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!268 = !DIEnumerator(name: "hipErrorInsufficientDriver", value: 35, isUnsigned: true)
!269 = !DIEnumerator(name: "hipErrorMissingConfiguration", value: 52, isUnsigned: true)
!270 = !DIEnumerator(name: "hipErrorPriorLaunchFailure", value: 53, isUnsigned: true)
!271 = !DIEnumerator(name: "hipErrorInvalidDeviceFunction", value: 98, isUnsigned: true)
!272 = !DIEnumerator(name: "hipErrorNoDevice", value: 100, isUnsigned: true)
!273 = !DIEnumerator(name: "hipErrorInvalidDevice", value: 101, isUnsigned: true)
!274 = !DIEnumerator(name: "hipErrorInvalidImage", value: 200, isUnsigned: true)
!275 = !DIEnumerator(name: "hipErrorInvalidContext", value: 201, isUnsigned: true)
!276 = !DIEnumerator(name: "hipErrorContextAlreadyCurrent", value: 202, isUnsigned: true)
!277 = !DIEnumerator(name: "hipErrorMapFailed", value: 205, isUnsigned: true)
!278 = !DIEnumerator(name: "hipErrorMapBufferObjectFailed", value: 205, isUnsigned: true)
!279 = !DIEnumerator(name: "hipErrorUnmapFailed", value: 206, isUnsigned: true)
!280 = !DIEnumerator(name: "hipErrorArrayIsMapped", value: 207, isUnsigned: true)
!281 = !DIEnumerator(name: "hipErrorAlreadyMapped", value: 208, isUnsigned: true)
!282 = !DIEnumerator(name: "hipErrorNoBinaryForGpu", value: 209, isUnsigned: true)
!283 = !DIEnumerator(name: "hipErrorAlreadyAcquired", value: 210, isUnsigned: true)
!284 = !DIEnumerator(name: "hipErrorNotMapped", value: 211, isUnsigned: true)
!285 = !DIEnumerator(name: "hipErrorNotMappedAsArray", value: 212, isUnsigned: true)
!286 = !DIEnumerator(name: "hipErrorNotMappedAsPointer", value: 213, isUnsigned: true)
!287 = !DIEnumerator(name: "hipErrorECCNotCorrectable", value: 214, isUnsigned: true)
!288 = !DIEnumerator(name: "hipErrorUnsupportedLimit", value: 215, isUnsigned: true)
!289 = !DIEnumerator(name: "hipErrorContextAlreadyInUse", value: 216, isUnsigned: true)
!290 = !DIEnumerator(name: "hipErrorPeerAccessUnsupported", value: 217, isUnsigned: true)
!291 = !DIEnumerator(name: "hipErrorInvalidKernelFile", value: 218, isUnsigned: true)
!292 = !DIEnumerator(name: "hipErrorInvalidGraphicsContext", value: 219, isUnsigned: true)
!293 = !DIEnumerator(name: "hipErrorInvalidSource", value: 300, isUnsigned: true)
!294 = !DIEnumerator(name: "hipErrorFileNotFound", value: 301, isUnsigned: true)
!295 = !DIEnumerator(name: "hipErrorSharedObjectSymbolNotFound", value: 302, isUnsigned: true)
!296 = !DIEnumerator(name: "hipErrorSharedObjectInitFailed", value: 303, isUnsigned: true)
!297 = !DIEnumerator(name: "hipErrorOperatingSystem", value: 304, isUnsigned: true)
!298 = !DIEnumerator(name: "hipErrorInvalidHandle", value: 400, isUnsigned: true)
!299 = !DIEnumerator(name: "hipErrorInvalidResourceHandle", value: 400, isUnsigned: true)
!300 = !DIEnumerator(name: "hipErrorIllegalState", value: 401, isUnsigned: true)
!301 = !DIEnumerator(name: "hipErrorNotFound", value: 500, isUnsigned: true)
!302 = !DIEnumerator(name: "hipErrorNotReady", value: 600, isUnsigned: true)
!303 = !DIEnumerator(name: "hipErrorIllegalAddress", value: 700, isUnsigned: true)
!304 = !DIEnumerator(name: "hipErrorLaunchOutOfResources", value: 701, isUnsigned: true)
!305 = !DIEnumerator(name: "hipErrorLaunchTimeOut", value: 702, isUnsigned: true)
!306 = !DIEnumerator(name: "hipErrorPeerAccessAlreadyEnabled", value: 704, isUnsigned: true)
!307 = !DIEnumerator(name: "hipErrorPeerAccessNotEnabled", value: 705, isUnsigned: true)
!308 = !DIEnumerator(name: "hipErrorSetOnActiveProcess", value: 708, isUnsigned: true)
!309 = !DIEnumerator(name: "hipErrorContextIsDestroyed", value: 709, isUnsigned: true)
!310 = !DIEnumerator(name: "hipErrorAssert", value: 710, isUnsigned: true)
!311 = !DIEnumerator(name: "hipErrorHostMemoryAlreadyRegistered", value: 712, isUnsigned: true)
!312 = !DIEnumerator(name: "hipErrorHostMemoryNotRegistered", value: 713, isUnsigned: true)
!313 = !DIEnumerator(name: "hipErrorLaunchFailure", value: 719, isUnsigned: true)
!314 = !DIEnumerator(name: "hipErrorCooperativeLaunchTooLarge", value: 720, isUnsigned: true)
!315 = !DIEnumerator(name: "hipErrorNotSupported", value: 801, isUnsigned: true)
!316 = !DIEnumerator(name: "hipErrorStreamCaptureUnsupported", value: 900, isUnsigned: true)
!317 = !DIEnumerator(name: "hipErrorStreamCaptureInvalidated", value: 901, isUnsigned: true)
!318 = !DIEnumerator(name: "hipErrorStreamCaptureMerge", value: 902, isUnsigned: true)
!319 = !DIEnumerator(name: "hipErrorStreamCaptureUnmatched", value: 903, isUnsigned: true)
!320 = !DIEnumerator(name: "hipErrorStreamCaptureUnjoined", value: 904, isUnsigned: true)
!321 = !DIEnumerator(name: "hipErrorStreamCaptureIsolation", value: 905, isUnsigned: true)
!322 = !DIEnumerator(name: "hipErrorStreamCaptureImplicit", value: 906, isUnsigned: true)
!323 = !DIEnumerator(name: "hipErrorCapturedEvent", value: 907, isUnsigned: true)
!324 = !DIEnumerator(name: "hipErrorStreamCaptureWrongThread", value: 908, isUnsigned: true)
!325 = !DIEnumerator(name: "hipErrorGraphExecUpdateFailure", value: 910, isUnsigned: true)
!326 = !DIEnumerator(name: "hipErrorUnknown", value: 999, isUnsigned: true)
!327 = !DIEnumerator(name: "hipErrorRuntimeMemory", value: 1052, isUnsigned: true)
!328 = !DIEnumerator(name: "hipErrorRuntimeOther", value: 1053, isUnsigned: true)
!329 = !DIEnumerator(name: "hipErrorTbd", value: 1054, isUnsigned: true)
!330 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipMemcpyKind", file: !331, line: 344, baseType: !96, size: 32, elements: !332, identifier: "_ZTS13hipMemcpyKind")
!331 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/driver_types.h", directory: "", checksumkind: CSK_MD5, checksum: "ac8c80c0e1fdd9c44dee17b35e5c6ced")
!332 = !{!333, !334, !335, !336, !337}
!333 = !DIEnumerator(name: "hipMemcpyHostToHost", value: 0, isUnsigned: true)
!334 = !DIEnumerator(name: "hipMemcpyHostToDevice", value: 1, isUnsigned: true)
!335 = !DIEnumerator(name: "hipMemcpyDeviceToHost", value: 2, isUnsigned: true)
!336 = !DIEnumerator(name: "hipMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!337 = !DIEnumerator(name: "hipMemcpyDefault", value: 4, isUnsigned: true)
!338 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipMemoryType", file: !90, line: 159, baseType: !96, size: 32, elements: !339, identifier: "_ZTS13hipMemoryType")
!339 = !{!340, !341, !342, !343, !344}
!340 = !DIEnumerator(name: "hipMemoryTypeHost", value: 0, isUnsigned: true)
!341 = !DIEnumerator(name: "hipMemoryTypeDevice", value: 1, isUnsigned: true)
!342 = !DIEnumerator(name: "hipMemoryTypeArray", value: 2, isUnsigned: true)
!343 = !DIEnumerator(name: "hipMemoryTypeUnified", value: 3, isUnsigned: true)
!344 = !DIEnumerator(name: "hipMemoryTypeManaged", value: 4, isUnsigned: true)
!345 = !DICompositeType(tag: DW_TAG_enumeration_type, scope: !346, file: !244, line: 214, baseType: !96, size: 32, elements: !1078, identifier: "_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEUt_E")
!346 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char, std::char_traits<char>, std::allocator<char> >", scope: !348, file: !347, line: 1082, size: 256, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !349, templateParams: !1077, identifier: "_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE")
!347 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/basic_string.tcc", directory: "")
!348 = !DINamespace(name: "__cxx11", scope: !27, exportSymbols: true)
!349 = !{!350, !464, !485, !486, !492, !687, !692, !695, !698, !703, !706, !712, !713, !714, !717, !721, !724, !725, !728, !732, !737, !738, !741, !744, !747, !750, !753, !754, !757, !762, !767, !770, !773, !776, !780, !783, !786, !787, !790, !791, !794, !797, !800, !803, !807, !812, !815, !818, !819, !823, !826, !829, !832, !835, !838, !841, !844, !845, !846, !851, !856, !857, !858, !859, !860, !861, !862, !865, !866, !867, !868, !869, !870, !871, !872, !873, !874, !875, !884, !890, !891, !892, !895, !898, !899, !900, !901, !902, !903, !904, !905, !908, !911, !912, !915, !916, !919, !920, !921, !922, !923, !924, !925, !926, !929, !932, !935, !938, !941, !944, !947, !951, !954, !957, !960, !961, !964, !967, !970, !973, !976, !979, !982, !985, !988, !991, !994, !997, !1000, !1003, !1004, !1007, !1008, !1011, !1014, !1017, !1018, !1021, !1024, !1027, !1030, !1033, !1036, !1037, !1038, !1039, !1040, !1041, !1042, !1043, !1044, !1045, !1046, !1047, !1048, !1049, !1050, !1051, !1052, !1053, !1054, !1055, !1056, !1059, !1062, !1065, !1068, !1071, !1074}
!350 = !DIDerivedType(tag: DW_TAG_member, name: "npos", scope: !346, file: !244, line: 140, baseType: !351, flags: DIFlagPublic | DIFlagStaticMember, extraData: i64 -1)
!351 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !352)
!352 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !346, file: !244, line: 127, baseType: !353)
!353 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !355, file: !354, line: 59, baseType: !442)
!354 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ext/alloc_traits.h", directory: "")
!355 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__alloc_traits<std::allocator<char>, char>", scope: !356, file: !354, line: 48, size: 8, flags: DIFlagTypePassByValue, elements: !357, templateParams: !463, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaIcEcEE")
!356 = !DINamespace(name: "__gnu_cxx", scope: null)
!357 = !{!358, !450, !453, !456, !459, !460, !461, !462}
!358 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !355, baseType: !359, extraData: i32 0)
!359 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::allocator<char> >", scope: !27, file: !360, line: 411, size: 8, flags: DIFlagTypePassByValue, elements: !361, templateParams: !448, identifier: "_ZTSSt16allocator_traitsISaIcEE")
!360 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/alloc_traits.h", directory: "", checksumkind: CSK_MD5, checksum: "fd441eaab0a8965f7012f98a3edcbb86")
!361 = !{!362, !432, !436, !439, !445}
!362 = !DISubprogram(name: "allocate", linkageName: "_ZNSt16allocator_traitsISaIcEE8allocateERS0_m", scope: !359, file: !360, line: 463, type: !363, scopeLine: 463, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!363 = !DISubroutineType(types: !364)
!364 = !{!365, !367, !431}
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !359, file: !360, line: 420, baseType: !366)
!366 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64)
!367 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !368, size: 64)
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !359, file: !360, line: 414, baseType: !369)
!369 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char>", scope: !27, file: !370, line: 257, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !371, templateParams: !429, identifier: "_ZTSSaIcE")
!370 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/allocator.h", directory: "", checksumkind: CSK_MD5, checksum: "7001324130e21fb5fd33a1c2cde4c031")
!371 = !{!372, !415, !419, !424, !428}
!372 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !369, baseType: !373, flags: DIFlagPublic, extraData: i32 0)
!373 = !DIDerivedType(tag: DW_TAG_typedef, name: "__allocator_base<char>", scope: !27, file: !374, line: 47, baseType: !375)
!374 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++allocator.h", directory: "", checksumkind: CSK_MD5, checksum: "3c43333b0e1372330d7f702387d162e2")
!375 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__new_allocator<char>", scope: !27, file: !376, line: 56, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !377, templateParams: !413, identifier: "_ZTSSt15__new_allocatorIcE")
!376 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/new_allocator.h", directory: "", checksumkind: CSK_MD5, checksum: "699a8ff30fe671eed491b1757c32544c")
!377 = !{!378, !382, !387, !388, !395, !402, !406, !409, !412}
!378 = !DISubprogram(name: "__new_allocator", scope: !375, file: !376, line: 80, type: !379, scopeLine: 80, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!379 = !DISubroutineType(types: !380)
!380 = !{null, !381}
!381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !375, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!382 = !DISubprogram(name: "__new_allocator", scope: !375, file: !376, line: 83, type: !383, scopeLine: 83, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!383 = !DISubroutineType(types: !384)
!384 = !{null, !381, !385}
!385 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !386, size: 64)
!386 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !375)
!387 = !DISubprogram(name: "~__new_allocator", scope: !375, file: !376, line: 90, type: !379, scopeLine: 90, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!388 = !DISubprogram(name: "address", linkageName: "_ZNKSt15__new_allocatorIcE7addressERc", scope: !375, file: !376, line: 93, type: !389, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!389 = !DISubroutineType(types: !390)
!390 = !{!391, !392, !393}
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !375, file: !376, line: 63, baseType: !366)
!392 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !386, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !375, file: !376, line: 65, baseType: !394)
!394 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !187, size: 64)
!395 = !DISubprogram(name: "address", linkageName: "_ZNKSt15__new_allocatorIcE7addressERKc", scope: !375, file: !376, line: 97, type: !396, scopeLine: 97, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!396 = !DISubroutineType(types: !397)
!397 = !{!398, !392, !400}
!398 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !375, file: !376, line: 64, baseType: !399)
!399 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!400 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !375, file: !376, line: 66, baseType: !401)
!401 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !186, size: 64)
!402 = !DISubprogram(name: "allocate", linkageName: "_ZNSt15__new_allocatorIcE8allocateEmPKv", scope: !375, file: !376, line: 112, type: !403, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!403 = !DISubroutineType(types: !404)
!404 = !{!366, !381, !405, !110}
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !376, line: 60, baseType: !25)
!406 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt15__new_allocatorIcE10deallocateEPcm", scope: !375, file: !376, line: 142, type: !407, scopeLine: 142, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!407 = !DISubroutineType(types: !408)
!408 = !{null, !381, !366, !405}
!409 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt15__new_allocatorIcE8max_sizeEv", scope: !375, file: !376, line: 167, type: !410, scopeLine: 167, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!410 = !DISubroutineType(types: !411)
!411 = !{!405, !392}
!412 = !DISubprogram(name: "_M_max_size", linkageName: "_ZNKSt15__new_allocatorIcE11_M_max_sizeEv", scope: !375, file: !376, line: 210, type: !410, scopeLine: 210, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!413 = !{!414}
!414 = !DITemplateTypeParameter(name: "_Tp", type: !187)
!415 = !DISubprogram(name: "allocator", scope: !369, file: !370, line: 156, type: !416, scopeLine: 156, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!416 = !DISubroutineType(types: !417)
!417 = !{null, !418}
!418 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !369, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!419 = !DISubprogram(name: "allocator", scope: !369, file: !370, line: 159, type: !420, scopeLine: 159, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!420 = !DISubroutineType(types: !421)
!421 = !{null, !418, !422}
!422 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !423, size: 64)
!423 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !369)
!424 = !DISubprogram(name: "operator=", linkageName: "_ZNSaIcEaSERKS_", scope: !369, file: !370, line: 164, type: !425, scopeLine: 164, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!425 = !DISubroutineType(types: !426)
!426 = !{!427, !418, !422}
!427 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !369, size: 64)
!428 = !DISubprogram(name: "~allocator", scope: !369, file: !370, line: 174, type: !416, scopeLine: 174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!429 = !{!430}
!430 = !DITemplateTypeParameter(type: !187)
!431 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !360, line: 435, baseType: !25)
!432 = !DISubprogram(name: "allocate", linkageName: "_ZNSt16allocator_traitsISaIcEE8allocateERS0_mPKv", scope: !359, file: !360, line: 477, type: !433, scopeLine: 477, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!433 = !DISubroutineType(types: !434)
!434 = !{!365, !367, !431, !435}
!435 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_void_pointer", file: !360, line: 429, baseType: !110)
!436 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt16allocator_traitsISaIcEE10deallocateERS0_Pcm", scope: !359, file: !360, line: 495, type: !437, scopeLine: 495, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!437 = !DISubroutineType(types: !438)
!438 = !{null, !367, !365, !431}
!439 = !DISubprogram(name: "max_size", linkageName: "_ZNSt16allocator_traitsISaIcEE8max_sizeERKS0_", scope: !359, file: !360, line: 547, type: !440, scopeLine: 547, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!440 = !DISubroutineType(types: !441)
!441 = !{!442, !443}
!442 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !359, file: !360, line: 435, baseType: !25)
!443 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !444, size: 64)
!444 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !368)
!445 = !DISubprogram(name: "select_on_container_copy_construction", linkageName: "_ZNSt16allocator_traitsISaIcEE37select_on_container_copy_constructionERKS0_", scope: !359, file: !360, line: 562, type: !446, scopeLine: 562, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!446 = !DISubroutineType(types: !447)
!447 = !{!368, !443}
!448 = !{!449}
!449 = !DITemplateTypeParameter(name: "_Alloc", type: !369)
!450 = !DISubprogram(name: "_S_select_on_copy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIcEcE17_S_select_on_copyERKS1_", scope: !355, file: !354, line: 97, type: !451, scopeLine: 97, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!451 = !DISubroutineType(types: !452)
!452 = !{!369, !422}
!453 = !DISubprogram(name: "_S_on_swap", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIcEcE10_S_on_swapERS1_S3_", scope: !355, file: !354, line: 100, type: !454, scopeLine: 100, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!454 = !DISubroutineType(types: !455)
!455 = !{null, !427, !427}
!456 = !DISubprogram(name: "_S_propagate_on_copy_assign", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIcEcE27_S_propagate_on_copy_assignEv", scope: !355, file: !354, line: 103, type: !457, scopeLine: 103, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!457 = !DISubroutineType(types: !458)
!458 = !{!145}
!459 = !DISubprogram(name: "_S_propagate_on_move_assign", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIcEcE27_S_propagate_on_move_assignEv", scope: !355, file: !354, line: 106, type: !457, scopeLine: 106, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!460 = !DISubprogram(name: "_S_propagate_on_swap", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIcEcE20_S_propagate_on_swapEv", scope: !355, file: !354, line: 109, type: !457, scopeLine: 109, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!461 = !DISubprogram(name: "_S_always_equal", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIcEcE15_S_always_equalEv", scope: !355, file: !354, line: 112, type: !457, scopeLine: 112, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!462 = !DISubprogram(name: "_S_nothrow_move", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIcEcE15_S_nothrow_moveEv", scope: !355, file: !354, line: 115, type: !457, scopeLine: 115, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!463 = !{!449, !430}
!464 = !DIDerivedType(tag: DW_TAG_member, name: "_M_dataplus", scope: !346, file: !244, line: 211, baseType: !465, size: 64)
!465 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Alloc_hider", scope: !346, file: !244, line: 193, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !466, identifier: "_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE")
!466 = !{!467, !474, !477, !481}
!467 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !465, baseType: !468, extraData: i32 0)
!468 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !346, file: !244, line: 126, baseType: !469)
!469 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Char_alloc_type", scope: !346, file: !244, line: 89, baseType: !470)
!470 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !471, file: !354, line: 120, baseType: !473)
!471 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<char>", scope: !355, file: !354, line: 119, size: 8, flags: DIFlagTypePassByValue, elements: !472, templateParams: !413, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaIcEcE6rebindIcEE")
!472 = !{}
!473 = !DIDerivedType(tag: DW_TAG_typedef, name: "rebind_alloc<char>", scope: !359, file: !360, line: 450, baseType: !369)
!474 = !DIDerivedType(tag: DW_TAG_member, name: "_M_p", scope: !465, file: !244, line: 208, baseType: !475, size: 64)
!475 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !346, file: !244, line: 131, baseType: !476)
!476 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !355, file: !354, line: 57, baseType: !365)
!477 = !DISubprogram(name: "_Alloc_hider", scope: !465, file: !244, line: 200, type: !478, scopeLine: 200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!478 = !DISubroutineType(types: !479)
!479 = !{null, !480, !475, !422}
!480 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !465, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!481 = !DISubprogram(name: "_Alloc_hider", scope: !465, file: !244, line: 204, type: !482, scopeLine: 204, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!482 = !DISubroutineType(types: !483)
!483 = !{null, !480, !475, !484}
!484 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !369, size: 64)
!485 = !DIDerivedType(tag: DW_TAG_member, name: "_M_string_length", scope: !346, file: !244, line: 212, baseType: !352, size: 64, offset: 64)
!486 = !DIDerivedType(tag: DW_TAG_member, scope: !346, file: !244, line: 216, baseType: !487, size: 128, offset: 128)
!487 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !346, file: !244, line: 216, size: 128, flags: DIFlagExportSymbols | DIFlagTypePassByValue, elements: !488, identifier: "_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEUt0_E")
!488 = !{!489, !491}
!489 = !DIDerivedType(tag: DW_TAG_member, name: "_M_local_buf", scope: !487, file: !244, line: 218, baseType: !490, size: 128)
!490 = !DICompositeType(tag: DW_TAG_array_type, baseType: !187, size: 128, elements: !208)
!491 = !DIDerivedType(tag: DW_TAG_member, name: "_M_allocated_capacity", scope: !487, file: !244, line: 219, baseType: !352, size: 64)
!492 = !DISubprogram(name: "_S_to_string_view", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE17_S_to_string_viewESt17basic_string_viewIcS2_E", scope: !346, file: !244, line: 165, type: !493, scopeLine: 165, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!493 = !DISubroutineType(types: !494)
!494 = !{!495, !495}
!495 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sv_type", scope: !346, file: !244, line: 153, baseType: !496)
!496 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "basic_string_view<char, std::char_traits<char> >", scope: !27, file: !497, line: 100, size: 128, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !498, templateParams: !633, identifier: "_ZTSSt17basic_string_viewIcSt11char_traitsIcEE")
!497 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/string_view", directory: "")
!498 = !{!499, !502, !503, !504, !508, !513, !516, !519, !523, !531, !532, !533, !534, !540, !541, !542, !543, !546, !547, !548, !551, !556, !557, !560, !561, !565, !568, !569, !572, !576, !579, !583, !586, !589, !592, !595, !598, !601, !604, !607, !610, !611, !612, !613, !614, !615, !616, !617, !618, !619, !620, !621, !622, !623, !624, !625, !626, !627, !628, !629, !630}
!499 = !DIDerivedType(tag: DW_TAG_member, name: "npos", scope: !496, file: !497, line: 121, baseType: !500, flags: DIFlagPublic | DIFlagStaticMember)
!500 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !501)
!501 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !497, line: 119, baseType: !25)
!502 = !DIDerivedType(tag: DW_TAG_member, name: "_M_len", scope: !496, file: !497, line: 516, baseType: !25, size: 64)
!503 = !DIDerivedType(tag: DW_TAG_member, name: "_M_str", scope: !496, file: !497, line: 517, baseType: !399, size: 64, offset: 64)
!504 = !DISubprogram(name: "basic_string_view", scope: !496, file: !497, line: 126, type: !505, scopeLine: 126, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!505 = !DISubroutineType(types: !506)
!506 = !{null, !507}
!507 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !496, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!508 = !DISubprogram(name: "basic_string_view", scope: !496, file: !497, line: 130, type: !509, scopeLine: 130, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!509 = !DISubroutineType(types: !510)
!510 = !{null, !507, !511}
!511 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !512, size: 64)
!512 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !496)
!513 = !DISubprogram(name: "basic_string_view", scope: !496, file: !497, line: 133, type: !514, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!514 = !DISubroutineType(types: !515)
!515 = !{null, !507, !399}
!516 = !DISubprogram(name: "basic_string_view", scope: !496, file: !497, line: 139, type: !517, scopeLine: 139, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!517 = !DISubroutineType(types: !518)
!518 = !{null, !507, !399, !501}
!519 = !DISubprogram(name: "operator=", linkageName: "_ZNSt17basic_string_viewIcSt11char_traitsIcEEaSERKS2_", scope: !496, file: !497, line: 177, type: !520, scopeLine: 177, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!520 = !DISubroutineType(types: !521)
!521 = !{!522, !507, !511}
!522 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !496, size: 64)
!523 = !DISubprogram(name: "begin", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE5beginEv", scope: !496, file: !497, line: 182, type: !524, scopeLine: 182, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!524 = !DISubroutineType(types: !525)
!525 = !{!526, !530}
!526 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !496, file: !497, line: 115, baseType: !527)
!527 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !528, size: 64)
!528 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !529)
!529 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !496, file: !497, line: 110, baseType: !187)
!530 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !512, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!531 = !DISubprogram(name: "end", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE3endEv", scope: !496, file: !497, line: 186, type: !524, scopeLine: 186, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!532 = !DISubprogram(name: "cbegin", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE6cbeginEv", scope: !496, file: !497, line: 190, type: !524, scopeLine: 190, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!533 = !DISubprogram(name: "cend", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE4cendEv", scope: !496, file: !497, line: 194, type: !524, scopeLine: 194, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!534 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE6rbeginEv", scope: !496, file: !497, line: 198, type: !535, scopeLine: 198, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!535 = !DISubroutineType(types: !536)
!536 = !{!537, !530}
!537 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !496, file: !497, line: 117, baseType: !538)
!538 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<const char *>", scope: !27, file: !539, line: 132, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16reverse_iteratorIPKcE")
!539 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator.h", directory: "", checksumkind: CSK_MD5, checksum: "bd1df035d57aba40e72f892638f1d7d3")
!540 = !DISubprogram(name: "rend", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE4rendEv", scope: !496, file: !497, line: 202, type: !535, scopeLine: 202, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!541 = !DISubprogram(name: "crbegin", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7crbeginEv", scope: !496, file: !497, line: 206, type: !535, scopeLine: 206, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!542 = !DISubprogram(name: "crend", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE5crendEv", scope: !496, file: !497, line: 210, type: !535, scopeLine: 210, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!543 = !DISubprogram(name: "size", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE4sizeEv", scope: !496, file: !497, line: 216, type: !544, scopeLine: 216, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!544 = !DISubroutineType(types: !545)
!545 = !{!501, !530}
!546 = !DISubprogram(name: "length", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE6lengthEv", scope: !496, file: !497, line: 220, type: !544, scopeLine: 220, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!547 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE8max_sizeEv", scope: !496, file: !497, line: 224, type: !544, scopeLine: 224, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!548 = !DISubprogram(name: "empty", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE5emptyEv", scope: !496, file: !497, line: 231, type: !549, scopeLine: 231, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!549 = !DISubroutineType(types: !550)
!550 = !{!145, !530}
!551 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEEixEm", scope: !496, file: !497, line: 237, type: !552, scopeLine: 237, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!552 = !DISubroutineType(types: !553)
!553 = !{!554, !530, !501}
!554 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !496, file: !497, line: 114, baseType: !555)
!555 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !528, size: 64)
!556 = !DISubprogram(name: "at", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE2atEm", scope: !496, file: !497, line: 244, type: !552, scopeLine: 244, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!557 = !DISubprogram(name: "front", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE5frontEv", scope: !496, file: !497, line: 254, type: !558, scopeLine: 254, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!558 = !DISubroutineType(types: !559)
!559 = !{!554, !530}
!560 = !DISubprogram(name: "back", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE4backEv", scope: !496, file: !497, line: 261, type: !558, scopeLine: 261, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!561 = !DISubprogram(name: "data", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE4dataEv", scope: !496, file: !497, line: 268, type: !562, scopeLine: 268, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!562 = !DISubroutineType(types: !563)
!563 = !{!564, !530}
!564 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !496, file: !497, line: 112, baseType: !527)
!565 = !DISubprogram(name: "remove_prefix", linkageName: "_ZNSt17basic_string_viewIcSt11char_traitsIcEE13remove_prefixEm", scope: !496, file: !497, line: 274, type: !566, scopeLine: 274, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!566 = !DISubroutineType(types: !567)
!567 = !{null, !507, !501}
!568 = !DISubprogram(name: "remove_suffix", linkageName: "_ZNSt17basic_string_viewIcSt11char_traitsIcEE13remove_suffixEm", scope: !496, file: !497, line: 282, type: !566, scopeLine: 282, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!569 = !DISubprogram(name: "swap", linkageName: "_ZNSt17basic_string_viewIcSt11char_traitsIcEE4swapERS2_", scope: !496, file: !497, line: 286, type: !570, scopeLine: 286, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!570 = !DISubroutineType(types: !571)
!571 = !{null, !507, !522}
!572 = !DISubprogram(name: "copy", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE4copyEPcmm", scope: !496, file: !497, line: 297, type: !573, scopeLine: 297, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!573 = !DISubroutineType(types: !574)
!574 = !{!575, !530, !366, !501, !501}
!575 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !496, file: !497, line: 119, baseType: !25)
!576 = !DISubprogram(name: "substr", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE6substrEmm", scope: !496, file: !497, line: 309, type: !577, scopeLine: 309, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!577 = !DISubroutineType(types: !578)
!578 = !{!496, !530, !501, !501}
!579 = !DISubprogram(name: "compare", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareES2_", scope: !496, file: !497, line: 317, type: !580, scopeLine: 317, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!580 = !DISubroutineType(types: !581)
!581 = !{!582, !530, !496}
!582 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!583 = !DISubprogram(name: "compare", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmS2_", scope: !496, file: !497, line: 327, type: !584, scopeLine: 327, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!584 = !DISubroutineType(types: !585)
!585 = !{!582, !530, !501, !501, !496}
!586 = !DISubprogram(name: "compare", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmS2_mm", scope: !496, file: !497, line: 331, type: !587, scopeLine: 331, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!587 = !DISubroutineType(types: !588)
!588 = !{!582, !530, !501, !501, !496, !501, !501}
!589 = !DISubprogram(name: "compare", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEPKc", scope: !496, file: !497, line: 338, type: !590, scopeLine: 338, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!590 = !DISubroutineType(types: !591)
!591 = !{!582, !530, !399}
!592 = !DISubprogram(name: "compare", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmPKc", scope: !496, file: !497, line: 342, type: !593, scopeLine: 342, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!593 = !DISubroutineType(types: !594)
!594 = !{!582, !530, !501, !501, !399}
!595 = !DISubprogram(name: "compare", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmPKcm", scope: !496, file: !497, line: 346, type: !596, scopeLine: 346, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!596 = !DISubroutineType(types: !597)
!597 = !{!582, !530, !501, !501, !399, !501}
!598 = !DISubprogram(name: "find", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE4findES2_m", scope: !496, file: !497, line: 403, type: !599, scopeLine: 403, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!599 = !DISubroutineType(types: !600)
!600 = !{!575, !530, !496, !501}
!601 = !DISubprogram(name: "find", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE4findEcm", scope: !496, file: !497, line: 407, type: !602, scopeLine: 407, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!602 = !DISubroutineType(types: !603)
!603 = !{!575, !530, !187, !501}
!604 = !DISubprogram(name: "find", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE4findEPKcmm", scope: !496, file: !497, line: 410, type: !605, scopeLine: 410, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!605 = !DISubroutineType(types: !606)
!606 = !{!575, !530, !399, !501, !501}
!607 = !DISubprogram(name: "find", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE4findEPKcm", scope: !496, file: !497, line: 413, type: !608, scopeLine: 413, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!608 = !DISubroutineType(types: !609)
!609 = !{!575, !530, !399, !501}
!610 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE5rfindES2_m", scope: !496, file: !497, line: 417, type: !599, scopeLine: 417, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!611 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE5rfindEcm", scope: !496, file: !497, line: 421, type: !602, scopeLine: 421, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!612 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE5rfindEPKcmm", scope: !496, file: !497, line: 424, type: !605, scopeLine: 424, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!613 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE5rfindEPKcm", scope: !496, file: !497, line: 427, type: !608, scopeLine: 427, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!614 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE13find_first_ofES2_m", scope: !496, file: !497, line: 431, type: !599, scopeLine: 431, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!615 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE13find_first_ofEcm", scope: !496, file: !497, line: 435, type: !602, scopeLine: 435, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!616 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE13find_first_ofEPKcmm", scope: !496, file: !497, line: 439, type: !605, scopeLine: 439, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!617 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE13find_first_ofEPKcm", scope: !496, file: !497, line: 443, type: !608, scopeLine: 443, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!618 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE12find_last_ofES2_m", scope: !496, file: !497, line: 447, type: !599, scopeLine: 447, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!619 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE12find_last_ofEcm", scope: !496, file: !497, line: 452, type: !602, scopeLine: 452, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!620 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE12find_last_ofEPKcmm", scope: !496, file: !497, line: 456, type: !605, scopeLine: 456, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!621 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE12find_last_ofEPKcm", scope: !496, file: !497, line: 460, type: !608, scopeLine: 460, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!622 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE17find_first_not_ofES2_m", scope: !496, file: !497, line: 464, type: !599, scopeLine: 464, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!623 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE17find_first_not_ofEcm", scope: !496, file: !497, line: 469, type: !602, scopeLine: 469, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!624 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE17find_first_not_ofEPKcmm", scope: !496, file: !497, line: 472, type: !605, scopeLine: 472, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!625 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE17find_first_not_ofEPKcm", scope: !496, file: !497, line: 476, type: !608, scopeLine: 476, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!626 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE16find_last_not_ofES2_m", scope: !496, file: !497, line: 483, type: !599, scopeLine: 483, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!627 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE16find_last_not_ofEcm", scope: !496, file: !497, line: 488, type: !602, scopeLine: 488, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!628 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE16find_last_not_ofEPKcmm", scope: !496, file: !497, line: 491, type: !605, scopeLine: 491, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!629 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt17basic_string_viewIcSt11char_traitsIcEE16find_last_not_ofEPKcm", scope: !496, file: !497, line: 495, type: !608, scopeLine: 495, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!630 = !DISubprogram(name: "_S_compare", linkageName: "_ZNSt17basic_string_viewIcSt11char_traitsIcEE10_S_compareEmm", scope: !496, file: !497, line: 505, type: !631, scopeLine: 505, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!631 = !DISubroutineType(types: !632)
!632 = !{!582, !501, !501}
!633 = !{!634, !635}
!634 = !DITemplateTypeParameter(name: "_CharT", type: !187)
!635 = !DITemplateTypeParameter(name: "_Traits", type: !636)
!636 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !27, file: !637, line: 335, size: 8, flags: DIFlagTypePassByValue, elements: !638, templateParams: !686, identifier: "_ZTSSt11char_traitsIcE")
!637 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/char_traits.h", directory: "")
!638 = !{!639, !646, !649, !650, !654, !657, !660, !664, !665, !668, !674, !677, !680, !683}
!639 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignERcRKc", scope: !636, file: !637, line: 347, type: !640, scopeLine: 347, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!640 = !DISubroutineType(types: !641)
!641 = !{null, !642, !644}
!642 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !643, size: 64)
!643 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !636, file: !637, line: 337, baseType: !187)
!644 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !645, size: 64)
!645 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !643)
!646 = !DISubprogram(name: "eq", linkageName: "_ZNSt11char_traitsIcE2eqERKcS2_", scope: !636, file: !637, line: 358, type: !647, scopeLine: 358, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!647 = !DISubroutineType(types: !648)
!648 = !{!145, !644, !644}
!649 = !DISubprogram(name: "lt", linkageName: "_ZNSt11char_traitsIcE2ltERKcS2_", scope: !636, file: !637, line: 362, type: !647, scopeLine: 362, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!650 = !DISubprogram(name: "compare", linkageName: "_ZNSt11char_traitsIcE7compareEPKcS2_m", scope: !636, file: !637, line: 370, type: !651, scopeLine: 370, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!651 = !DISubroutineType(types: !652)
!652 = !{!582, !653, !653, !25}
!653 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !645, size: 64)
!654 = !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !636, file: !637, line: 389, type: !655, scopeLine: 389, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!655 = !DISubroutineType(types: !656)
!656 = !{!25, !653}
!657 = !DISubprogram(name: "find", linkageName: "_ZNSt11char_traitsIcE4findEPKcmRS1_", scope: !636, file: !637, line: 399, type: !658, scopeLine: 399, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!658 = !DISubroutineType(types: !659)
!659 = !{!653, !653, !25, !644}
!660 = !DISubprogram(name: "move", linkageName: "_ZNSt11char_traitsIcE4moveEPcPKcm", scope: !636, file: !637, line: 411, type: !661, scopeLine: 411, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!661 = !DISubroutineType(types: !662)
!662 = !{!663, !663, !653, !25}
!663 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !643, size: 64)
!664 = !DISubprogram(name: "copy", linkageName: "_ZNSt11char_traitsIcE4copyEPcPKcm", scope: !636, file: !637, line: 423, type: !661, scopeLine: 423, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!665 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignEPcmc", scope: !636, file: !637, line: 435, type: !666, scopeLine: 435, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!666 = !DISubroutineType(types: !667)
!667 = !{!663, !663, !25, !643}
!668 = !DISubprogram(name: "to_char_type", linkageName: "_ZNSt11char_traitsIcE12to_char_typeERKi", scope: !636, file: !637, line: 447, type: !669, scopeLine: 447, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!669 = !DISubroutineType(types: !670)
!670 = !{!643, !671}
!671 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !672, size: 64)
!672 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !673)
!673 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !636, file: !637, line: 338, baseType: !582)
!674 = !DISubprogram(name: "to_int_type", linkageName: "_ZNSt11char_traitsIcE11to_int_typeERKc", scope: !636, file: !637, line: 453, type: !675, scopeLine: 453, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!675 = !DISubroutineType(types: !676)
!676 = !{!673, !644}
!677 = !DISubprogram(name: "eq_int_type", linkageName: "_ZNSt11char_traitsIcE11eq_int_typeERKiS2_", scope: !636, file: !637, line: 457, type: !678, scopeLine: 457, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!678 = !DISubroutineType(types: !679)
!679 = !{!145, !671, !671}
!680 = !DISubprogram(name: "eof", linkageName: "_ZNSt11char_traitsIcE3eofEv", scope: !636, file: !637, line: 461, type: !681, scopeLine: 461, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!681 = !DISubroutineType(types: !682)
!682 = !{!673}
!683 = !DISubprogram(name: "not_eof", linkageName: "_ZNSt11char_traitsIcE7not_eofERKi", scope: !636, file: !637, line: 465, type: !684, scopeLine: 465, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!684 = !DISubroutineType(types: !685)
!685 = !{!673, !671}
!686 = !{!634}
!687 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 188, type: !688, scopeLine: 188, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!688 = !DISubroutineType(types: !689)
!689 = !{null, !690, !691, !422}
!690 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !346, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!691 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sv_wrapper", scope: !346, file: !244, line: 172, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12__sv_wrapperE")
!692 = !DISubprogram(name: "_M_data", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc", scope: !346, file: !244, line: 224, type: !693, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !690, !475}
!695 = !DISubprogram(name: "_M_length", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_lengthEm", scope: !346, file: !244, line: 229, type: !696, scopeLine: 229, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!696 = !DISubroutineType(types: !697)
!697 = !{null, !690, !352}
!698 = !DISubprogram(name: "_M_data", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv", scope: !346, file: !244, line: 234, type: !699, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!699 = !DISubroutineType(types: !700)
!700 = !{!475, !701}
!701 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !702, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!702 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !346)
!703 = !DISubprogram(name: "_M_local_data", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv", scope: !346, file: !244, line: 239, type: !704, scopeLine: 239, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!704 = !DISubroutineType(types: !705)
!705 = !{!475, !690}
!706 = !DISubprogram(name: "_M_local_data", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv", scope: !346, file: !244, line: 250, type: !707, scopeLine: 250, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!707 = !DISubroutineType(types: !708)
!708 = !{!709, !701}
!709 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !346, file: !244, line: 132, baseType: !710)
!710 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !355, file: !354, line: 58, baseType: !711)
!711 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !359, file: !360, line: 423, baseType: !399)
!712 = !DISubprogram(name: "_M_capacity", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm", scope: !346, file: !244, line: 261, type: !696, scopeLine: 261, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!713 = !DISubprogram(name: "_M_set_length", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm", scope: !346, file: !244, line: 266, type: !696, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!714 = !DISubprogram(name: "_M_is_local", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_is_localEv", scope: !346, file: !244, line: 274, type: !715, scopeLine: 274, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!715 = !DISubroutineType(types: !716)
!716 = !{!145, !701}
!717 = !DISubprogram(name: "_M_create", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm", scope: !346, file: !244, line: 280, type: !718, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!718 = !DISubroutineType(types: !719)
!719 = !{!475, !690, !720, !352}
!720 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !352, size: 64)
!721 = !DISubprogram(name: "_M_dispose", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv", scope: !346, file: !244, line: 284, type: !722, scopeLine: 284, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!722 = !DISubroutineType(types: !723)
!723 = !{null, !690}
!724 = !DISubprogram(name: "_M_destroy", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_destroyEm", scope: !346, file: !244, line: 292, type: !696, scopeLine: 292, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!725 = !DISubprogram(name: "_M_construct", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEmc", scope: !346, file: !244, line: 336, type: !726, scopeLine: 336, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!726 = !DISubroutineType(types: !727)
!727 = !{null, !690, !352, !187}
!728 = !DISubprogram(name: "_M_get_allocator", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_get_allocatorEv", scope: !346, file: !244, line: 340, type: !729, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!729 = !DISubroutineType(types: !730)
!730 = !{!731, !690}
!731 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !468, size: 64)
!732 = !DISubprogram(name: "_M_get_allocator", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_get_allocatorEv", scope: !346, file: !244, line: 345, type: !733, scopeLine: 345, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!733 = !DISubroutineType(types: !734)
!734 = !{!735, !701}
!735 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !736, size: 64)
!736 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !468)
!737 = !DISubprogram(name: "_M_use_local_data", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE17_M_use_local_dataEv", scope: !346, file: !244, line: 352, type: !704, scopeLine: 352, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!738 = !DISubprogram(name: "_M_check", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8_M_checkEmPKc", scope: !346, file: !244, line: 379, type: !739, scopeLine: 379, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!739 = !DISubroutineType(types: !740)
!740 = !{!352, !701, !352, !399}
!741 = !DISubprogram(name: "_M_check_length", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_check_lengthEmmPKc", scope: !346, file: !244, line: 390, type: !742, scopeLine: 390, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!742 = !DISubroutineType(types: !743)
!743 = !{null, !701, !352, !352, !399}
!744 = !DISubprogram(name: "_M_limit", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8_M_limitEmm", scope: !346, file: !244, line: 400, type: !745, scopeLine: 400, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!745 = !DISubroutineType(types: !746)
!746 = !{!352, !701, !352, !352}
!747 = !DISubprogram(name: "_M_disjunct", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_disjunctEPKc", scope: !346, file: !244, line: 408, type: !748, scopeLine: 408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!748 = !DISubroutineType(types: !749)
!749 = !{!145, !701, !399}
!750 = !DISubprogram(name: "_S_copy", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_S_copyEPcPKcm", scope: !346, file: !244, line: 418, type: !751, scopeLine: 418, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!751 = !DISubroutineType(types: !752)
!752 = !{null, !366, !399, !352}
!753 = !DISubprogram(name: "_S_move", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_S_moveEPcPKcm", scope: !346, file: !244, line: 428, type: !751, scopeLine: 428, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!754 = !DISubprogram(name: "_S_assign", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_S_assignEPcmc", scope: !346, file: !244, line: 438, type: !755, scopeLine: 438, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!755 = !DISubroutineType(types: !756)
!756 = !{null, !366, !352, !187}
!757 = !DISubprogram(name: "_S_copy_chars", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcN9__gnu_cxx17__normal_iteratorIS5_S4_EES8_", scope: !346, file: !244, line: 459, type: !758, scopeLine: 459, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!758 = !DISubroutineType(types: !759)
!759 = !{null, !366, !760, !760}
!760 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !346, file: !244, line: 133, baseType: !761)
!761 = !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<char *, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >", scope: !356, file: !539, line: 1043, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE")
!762 = !DISubprogram(name: "_S_copy_chars", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcN9__gnu_cxx17__normal_iteratorIPKcS4_EESA_", scope: !346, file: !244, line: 464, type: !763, scopeLine: 464, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!763 = !DISubroutineType(types: !764)
!764 = !{null, !366, !765, !765}
!765 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !346, file: !244, line: 135, baseType: !766)
!766 = !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<const char *, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >", scope: !356, file: !539, line: 1043, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE")
!767 = !DISubprogram(name: "_S_copy_chars", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcS5_S5_", scope: !346, file: !244, line: 470, type: !768, scopeLine: 470, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!768 = !DISubroutineType(types: !769)
!769 = !{null, !366, !366, !366}
!770 = !DISubprogram(name: "_S_copy_chars", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_", scope: !346, file: !244, line: 475, type: !771, scopeLine: 475, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!771 = !DISubroutineType(types: !772)
!772 = !{null, !366, !399, !399}
!773 = !DISubprogram(name: "_S_compare", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_S_compareEmm", scope: !346, file: !244, line: 481, type: !774, scopeLine: 481, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!774 = !DISubroutineType(types: !775)
!775 = !{!582, !352, !352}
!776 = !DISubprogram(name: "_M_assign", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_", scope: !346, file: !244, line: 495, type: !777, scopeLine: 495, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!777 = !DISubroutineType(types: !778)
!778 = !{null, !690, !779}
!779 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !702, size: 64)
!780 = !DISubprogram(name: "_M_mutate", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm", scope: !346, file: !244, line: 499, type: !781, scopeLine: 499, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!781 = !DISubroutineType(types: !782)
!782 = !{null, !690, !352, !352, !399, !352}
!783 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8_M_eraseEmm", scope: !346, file: !244, line: 504, type: !784, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!784 = !DISubroutineType(types: !785)
!785 = !{null, !690, !352, !352}
!786 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 515, type: !722, scopeLine: 515, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!787 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 528, type: !788, scopeLine: 528, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!788 = !DISubroutineType(types: !789)
!789 = !{null, !690, !422}
!790 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 540, type: !777, scopeLine: 540, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!791 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 557, type: !792, scopeLine: 557, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!792 = !DISubroutineType(types: !793)
!793 = !{null, !690, !779, !352, !422}
!794 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 574, type: !795, scopeLine: 574, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!795 = !DISubroutineType(types: !796)
!796 = !{null, !690, !779, !352, !352}
!797 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 592, type: !798, scopeLine: 592, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!798 = !DISubroutineType(types: !799)
!799 = !{null, !690, !779, !352, !352, !422}
!800 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 612, type: !801, scopeLine: 612, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!801 = !DISubroutineType(types: !802)
!802 = !{null, !690, !399, !352, !422}
!803 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 670, type: !804, scopeLine: 670, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!804 = !DISubroutineType(types: !805)
!805 = !{null, !690, !806}
!806 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !346, size: 64)
!807 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 698, type: !808, scopeLine: 698, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!808 = !DISubroutineType(types: !809)
!809 = !{null, !690, !810, !422}
!810 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char>", scope: !27, file: !811, line: 47, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16initializer_listIcE")
!811 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/initializer_list", directory: "")
!812 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 703, type: !813, scopeLine: 703, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!813 = !DISubroutineType(types: !814)
!814 = !{null, !690, !779, !422}
!815 = !DISubprogram(name: "basic_string", scope: !346, file: !244, line: 708, type: !816, scopeLine: 708, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!816 = !DISubroutineType(types: !817)
!817 = !{null, !690, !806, !422}
!818 = !DISubprogram(name: "~basic_string", scope: !346, file: !244, line: 794, type: !722, scopeLine: 794, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!819 = !DISubprogram(name: "operator=", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSERKS4_", scope: !346, file: !244, line: 803, type: !820, scopeLine: 803, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!820 = !DISubroutineType(types: !821)
!821 = !{!822, !690, !779}
!822 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !346, size: 64)
!823 = !DISubprogram(name: "operator=", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc", scope: !346, file: !244, line: 814, type: !824, scopeLine: 814, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!824 = !DISubroutineType(types: !825)
!825 = !{!822, !690, !399}
!826 = !DISubprogram(name: "operator=", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEc", scope: !346, file: !244, line: 826, type: !827, scopeLine: 826, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!827 = !DISubroutineType(types: !828)
!828 = !{!822, !690, !187}
!829 = !DISubprogram(name: "operator=", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_", scope: !346, file: !244, line: 844, type: !830, scopeLine: 844, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!830 = !DISubroutineType(types: !831)
!831 = !{!822, !690, !806}
!832 = !DISubprogram(name: "operator=", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSESt16initializer_listIcE", scope: !346, file: !244, line: 913, type: !833, scopeLine: 913, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!833 = !DISubroutineType(types: !834)
!834 = !{!822, !690, !810}
!835 = !DISubprogram(name: "operator basic_string_view", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEcvSt17basic_string_viewIcS2_EEv", scope: !346, file: !244, line: 936, type: !836, scopeLine: 936, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!836 = !DISubroutineType(types: !837)
!837 = !{!495, !701}
!838 = !DISubprogram(name: "begin", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5beginEv", scope: !346, file: !244, line: 947, type: !839, scopeLine: 947, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!839 = !DISubroutineType(types: !840)
!840 = !{!760, !690}
!841 = !DISubprogram(name: "begin", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5beginEv", scope: !346, file: !244, line: 956, type: !842, scopeLine: 956, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!842 = !DISubroutineType(types: !843)
!843 = !{!765, !701}
!844 = !DISubprogram(name: "end", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE3endEv", scope: !346, file: !244, line: 965, type: !839, scopeLine: 965, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!845 = !DISubprogram(name: "end", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE3endEv", scope: !346, file: !244, line: 974, type: !842, scopeLine: 974, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!846 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6rbeginEv", scope: !346, file: !244, line: 984, type: !847, scopeLine: 984, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!847 = !DISubroutineType(types: !848)
!848 = !{!849, !690}
!849 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !346, file: !244, line: 137, baseType: !850)
!850 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<char *, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >", scope: !27, file: !539, line: 132, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEE")
!851 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6rbeginEv", scope: !346, file: !244, line: 994, type: !852, scopeLine: 994, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!852 = !DISubroutineType(types: !853)
!853 = !{!854, !701}
!854 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !346, file: !244, line: 136, baseType: !855)
!855 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<const char *, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >", scope: !27, file: !539, line: 132, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEE")
!856 = !DISubprogram(name: "rend", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4rendEv", scope: !346, file: !244, line: 1004, type: !847, scopeLine: 1004, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!857 = !DISubprogram(name: "rend", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4rendEv", scope: !346, file: !244, line: 1014, type: !852, scopeLine: 1014, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!858 = !DISubprogram(name: "cbegin", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6cbeginEv", scope: !346, file: !244, line: 1024, type: !842, scopeLine: 1024, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!859 = !DISubprogram(name: "cend", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4cendEv", scope: !346, file: !244, line: 1033, type: !842, scopeLine: 1033, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!860 = !DISubprogram(name: "crbegin", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7crbeginEv", scope: !346, file: !244, line: 1043, type: !852, scopeLine: 1043, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!861 = !DISubprogram(name: "crend", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5crendEv", scope: !346, file: !244, line: 1053, type: !852, scopeLine: 1053, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!862 = !DISubprogram(name: "size", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv", scope: !346, file: !244, line: 1063, type: !863, scopeLine: 1063, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!863 = !DISubroutineType(types: !864)
!864 = !{!352, !701}
!865 = !DISubprogram(name: "length", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6lengthEv", scope: !346, file: !244, line: 1070, type: !863, scopeLine: 1070, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!866 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8max_sizeEv", scope: !346, file: !244, line: 1076, type: !863, scopeLine: 1076, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!867 = !DISubprogram(name: "resize", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc", scope: !346, file: !244, line: 1091, type: !726, scopeLine: 1091, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!868 = !DISubprogram(name: "resize", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEm", scope: !346, file: !244, line: 1105, type: !696, scopeLine: 1105, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!869 = !DISubprogram(name: "shrink_to_fit", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13shrink_to_fitEv", scope: !346, file: !244, line: 1114, type: !722, scopeLine: 1114, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!870 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv", scope: !346, file: !244, line: 1132, type: !863, scopeLine: 1132, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!871 = !DISubprogram(name: "reserve", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm", scope: !346, file: !244, line: 1157, type: !696, scopeLine: 1157, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!872 = !DISubprogram(name: "reserve", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEv", scope: !346, file: !244, line: 1167, type: !722, scopeLine: 1167, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!873 = !DISubprogram(name: "clear", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5clearEv", scope: !346, file: !244, line: 1174, type: !722, scopeLine: 1174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!874 = !DISubprogram(name: "empty", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv", scope: !346, file: !244, line: 1183, type: !715, scopeLine: 1183, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!875 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEixEm", scope: !346, file: !244, line: 1199, type: !876, scopeLine: 1199, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!876 = !DISubroutineType(types: !877)
!877 = !{!878, !701, !352}
!878 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !346, file: !244, line: 130, baseType: !879)
!879 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !355, file: !354, line: 63, baseType: !880)
!880 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !881, size: 64)
!881 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !882)
!882 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !355, file: !354, line: 56, baseType: !883)
!883 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !359, file: !360, line: 417, baseType: !187)
!884 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEixEm", scope: !346, file: !244, line: 1217, type: !885, scopeLine: 1217, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!885 = !DISubroutineType(types: !886)
!886 = !{!887, !690, !352}
!887 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !346, file: !244, line: 129, baseType: !888)
!888 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !355, file: !354, line: 62, baseType: !889)
!889 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !882, size: 64)
!890 = !DISubprogram(name: "at", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE2atEm", scope: !346, file: !244, line: 1239, type: !876, scopeLine: 1239, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!891 = !DISubprogram(name: "at", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE2atEm", scope: !346, file: !244, line: 1261, type: !885, scopeLine: 1261, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!892 = !DISubprogram(name: "front", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5frontEv", scope: !346, file: !244, line: 1278, type: !893, scopeLine: 1278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!893 = !DISubroutineType(types: !894)
!894 = !{!887, !690}
!895 = !DISubprogram(name: "front", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5frontEv", scope: !346, file: !244, line: 1290, type: !896, scopeLine: 1290, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!896 = !DISubroutineType(types: !897)
!897 = !{!878, !701}
!898 = !DISubprogram(name: "back", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4backEv", scope: !346, file: !244, line: 1302, type: !893, scopeLine: 1302, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!899 = !DISubprogram(name: "back", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4backEv", scope: !346, file: !244, line: 1314, type: !896, scopeLine: 1314, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!900 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLERKS4_", scope: !346, file: !244, line: 1329, type: !820, scopeLine: 1329, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!901 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEPKc", scope: !346, file: !244, line: 1339, type: !824, scopeLine: 1339, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!902 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc", scope: !346, file: !244, line: 1349, type: !827, scopeLine: 1349, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!903 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLESt16initializer_listIcE", scope: !346, file: !244, line: 1363, type: !833, scopeLine: 1363, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!904 = !DISubprogram(name: "append", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendERKS4_", scope: !346, file: !244, line: 1387, type: !820, scopeLine: 1387, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!905 = !DISubprogram(name: "append", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendERKS4_mm", scope: !346, file: !244, line: 1405, type: !906, scopeLine: 1405, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!906 = !DISubroutineType(types: !907)
!907 = !{!822, !690, !779, !352, !352}
!908 = !DISubprogram(name: "append", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm", scope: !346, file: !244, line: 1418, type: !909, scopeLine: 1418, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!909 = !DISubroutineType(types: !910)
!910 = !{!822, !690, !399, !352}
!911 = !DISubprogram(name: "append", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc", scope: !346, file: !244, line: 1432, type: !824, scopeLine: 1432, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!912 = !DISubprogram(name: "append", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEmc", scope: !346, file: !244, line: 1450, type: !913, scopeLine: 1450, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!913 = !DISubroutineType(types: !914)
!914 = !{!822, !690, !352, !187}
!915 = !DISubprogram(name: "append", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendESt16initializer_listIcE", scope: !346, file: !244, line: 1461, type: !833, scopeLine: 1461, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!916 = !DISubprogram(name: "push_back", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9push_backEc", scope: !346, file: !244, line: 1524, type: !917, scopeLine: 1524, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!917 = !DISubroutineType(types: !918)
!918 = !{null, !690, !187}
!919 = !DISubprogram(name: "assign", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignERKS4_", scope: !346, file: !244, line: 1540, type: !820, scopeLine: 1540, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!920 = !DISubprogram(name: "assign", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignEOS4_", scope: !346, file: !244, line: 1586, type: !830, scopeLine: 1586, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!921 = !DISubprogram(name: "assign", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignERKS4_mm", scope: !346, file: !244, line: 1610, type: !906, scopeLine: 1610, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!922 = !DISubprogram(name: "assign", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignEPKcm", scope: !346, file: !244, line: 1627, type: !909, scopeLine: 1627, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!923 = !DISubprogram(name: "assign", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignEPKc", scope: !346, file: !244, line: 1644, type: !824, scopeLine: 1644, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!924 = !DISubprogram(name: "assign", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignEmc", scope: !346, file: !244, line: 1662, type: !913, scopeLine: 1662, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!925 = !DISubprogram(name: "assign", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignESt16initializer_listIcE", scope: !346, file: !244, line: 1692, type: !833, scopeLine: 1692, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!926 = !DISubprogram(name: "insert", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEN9__gnu_cxx17__normal_iteratorIPKcS4_EEmc", scope: !346, file: !244, line: 1749, type: !927, scopeLine: 1749, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!927 = !DISubroutineType(types: !928)
!928 = !{!760, !690, !765, !352, !187}
!929 = !DISubprogram(name: "insert", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEN9__gnu_cxx17__normal_iteratorIPKcS4_EESt16initializer_listIcE", scope: !346, file: !244, line: 1829, type: !930, scopeLine: 1829, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!930 = !DISubroutineType(types: !931)
!931 = !{!760, !690, !765, !810}
!932 = !DISubprogram(name: "insert", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmRKS4_", scope: !346, file: !244, line: 1857, type: !933, scopeLine: 1857, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!933 = !DISubroutineType(types: !934)
!934 = !{!822, !690, !352, !779}
!935 = !DISubprogram(name: "insert", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmRKS4_mm", scope: !346, file: !244, line: 1881, type: !936, scopeLine: 1881, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!936 = !DISubroutineType(types: !937)
!937 = !{!822, !690, !352, !779, !352, !352}
!938 = !DISubprogram(name: "insert", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmPKcm", scope: !346, file: !244, line: 1905, type: !939, scopeLine: 1905, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!939 = !DISubroutineType(types: !940)
!940 = !{!822, !690, !352, !399, !352}
!941 = !DISubprogram(name: "insert", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmPKc", scope: !346, file: !244, line: 1925, type: !942, scopeLine: 1925, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!942 = !DISubroutineType(types: !943)
!943 = !{!822, !690, !352, !399}
!944 = !DISubprogram(name: "insert", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc", scope: !346, file: !244, line: 1950, type: !945, scopeLine: 1950, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!945 = !DISubroutineType(types: !946)
!946 = !{!822, !690, !352, !352, !187}
!947 = !DISubprogram(name: "insert", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEN9__gnu_cxx17__normal_iteratorIPKcS4_EEc", scope: !346, file: !244, line: 1969, type: !948, scopeLine: 1969, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!948 = !DISubroutineType(types: !949)
!949 = !{!760, !690, !950, !187}
!950 = !DIDerivedType(tag: DW_TAG_typedef, name: "__const_iterator", scope: !346, file: !244, line: 147, baseType: !765)
!951 = !DISubprogram(name: "erase", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5eraseEmm", scope: !346, file: !244, line: 2032, type: !952, scopeLine: 2032, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!952 = !DISubroutineType(types: !953)
!953 = !{!822, !690, !352, !352}
!954 = !DISubprogram(name: "erase", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5eraseEN9__gnu_cxx17__normal_iteratorIPKcS4_EE", scope: !346, file: !244, line: 2052, type: !955, scopeLine: 2052, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!955 = !DISubroutineType(types: !956)
!956 = !{!760, !690, !950}
!957 = !DISubprogram(name: "erase", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5eraseEN9__gnu_cxx17__normal_iteratorIPKcS4_EES9_", scope: !346, file: !244, line: 2072, type: !958, scopeLine: 2072, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!958 = !DISubroutineType(types: !959)
!959 = !{!760, !690, !950, !950}
!960 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8pop_backEv", scope: !346, file: !244, line: 2092, type: !722, scopeLine: 2092, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!961 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEmmRKS4_", scope: !346, file: !244, line: 2118, type: !962, scopeLine: 2118, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!962 = !DISubroutineType(types: !963)
!963 = !{!822, !690, !352, !352, !779}
!964 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEmmRKS4_mm", scope: !346, file: !244, line: 2141, type: !965, scopeLine: 2141, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!965 = !DISubroutineType(types: !966)
!966 = !{!822, !690, !352, !352, !779, !352, !352}
!967 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEmmPKcm", scope: !346, file: !244, line: 2167, type: !968, scopeLine: 2167, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!968 = !DISubroutineType(types: !969)
!969 = !{!822, !690, !352, !352, !399, !352}
!970 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEmmPKc", scope: !346, file: !244, line: 2193, type: !971, scopeLine: 2193, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!971 = !DISubroutineType(types: !972)
!972 = !{!822, !690, !352, !352, !399}
!973 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEmmmc", scope: !346, file: !244, line: 2218, type: !974, scopeLine: 2218, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!974 = !DISubroutineType(types: !975)
!975 = !{!822, !690, !352, !352, !352, !187}
!976 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEN9__gnu_cxx17__normal_iteratorIPKcS4_EES9_RKS4_", scope: !346, file: !244, line: 2237, type: !977, scopeLine: 2237, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!977 = !DISubroutineType(types: !978)
!978 = !{!822, !690, !950, !950, !779}
!979 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEN9__gnu_cxx17__normal_iteratorIPKcS4_EES9_S8_m", scope: !346, file: !244, line: 2258, type: !980, scopeLine: 2258, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!980 = !DISubroutineType(types: !981)
!981 = !{!822, !690, !950, !950, !399, !352}
!982 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEN9__gnu_cxx17__normal_iteratorIPKcS4_EES9_S8_", scope: !346, file: !244, line: 2281, type: !983, scopeLine: 2281, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!983 = !DISubroutineType(types: !984)
!984 = !{!822, !690, !950, !950, !399}
!985 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEN9__gnu_cxx17__normal_iteratorIPKcS4_EES9_mc", scope: !346, file: !244, line: 2303, type: !986, scopeLine: 2303, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!986 = !DISubroutineType(types: !987)
!987 = !{!822, !690, !950, !950, !352, !187}
!988 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEN9__gnu_cxx17__normal_iteratorIPKcS4_EES9_PcSA_", scope: !346, file: !244, line: 2362, type: !989, scopeLine: 2362, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!989 = !DISubroutineType(types: !990)
!990 = !{!822, !690, !950, !950, !366, !366}
!991 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEN9__gnu_cxx17__normal_iteratorIPKcS4_EES9_S8_S8_", scope: !346, file: !244, line: 2374, type: !992, scopeLine: 2374, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!992 = !DISubroutineType(types: !993)
!993 = !{!822, !690, !950, !950, !399, !399}
!994 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEN9__gnu_cxx17__normal_iteratorIPKcS4_EES9_NS6_IPcS4_EESB_", scope: !346, file: !244, line: 2386, type: !995, scopeLine: 2386, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!995 = !DISubroutineType(types: !996)
!996 = !{!822, !690, !950, !950, !760, !760}
!997 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEN9__gnu_cxx17__normal_iteratorIPKcS4_EES9_S9_S9_", scope: !346, file: !244, line: 2398, type: !998, scopeLine: 2398, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!998 = !DISubroutineType(types: !999)
!999 = !{!822, !690, !950, !950, !765, !765}
!1000 = !DISubprogram(name: "replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEN9__gnu_cxx17__normal_iteratorIPKcS4_EES9_St16initializer_listIcE", scope: !346, file: !244, line: 2424, type: !1001, scopeLine: 2424, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1001 = !DISubroutineType(types: !1002)
!1002 = !{!822, !690, !765, !765, !810}
!1003 = !DISubprogram(name: "_M_replace_aux", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE14_M_replace_auxEmmmc", scope: !346, file: !244, line: 2504, type: !974, scopeLine: 2504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1004 = !DISubprogram(name: "_M_replace", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm", scope: !346, file: !244, line: 2509, type: !1005, scopeLine: 2509, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1005 = !DISubroutineType(types: !1006)
!1006 = !{!822, !690, !352, !352, !399, !351}
!1007 = !DISubprogram(name: "_M_append", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm", scope: !346, file: !244, line: 2514, type: !909, scopeLine: 2514, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1008 = !DISubprogram(name: "copy", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4copyEPcmm", scope: !346, file: !244, line: 2532, type: !1009, scopeLine: 2532, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1009 = !DISubroutineType(types: !1010)
!1010 = !{!352, !701, !366, !352, !352}
!1011 = !DISubprogram(name: "swap", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4swapERS4_", scope: !346, file: !244, line: 2543, type: !1012, scopeLine: 2543, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{null, !690, !822}
!1014 = !DISubprogram(name: "c_str", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv", scope: !346, file: !244, line: 2554, type: !1015, scopeLine: 2554, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!399, !701}
!1017 = !DISubprogram(name: "data", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4dataEv", scope: !346, file: !244, line: 2567, type: !1015, scopeLine: 2567, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1018 = !DISubprogram(name: "data", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4dataEv", scope: !346, file: !244, line: 2579, type: !1019, scopeLine: 2579, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!366, !690}
!1021 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13get_allocatorEv", scope: !346, file: !244, line: 2588, type: !1022, scopeLine: 2588, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{!468, !701}
!1024 = !DISubprogram(name: "find", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm", scope: !346, file: !244, line: 2605, type: !1025, scopeLine: 2605, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{!352, !701, !399, !352, !352}
!1027 = !DISubprogram(name: "find", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findERKS4_m", scope: !346, file: !244, line: 2620, type: !1028, scopeLine: 2620, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1028 = !DISubroutineType(types: !1029)
!1029 = !{!352, !701, !779, !352}
!1030 = !DISubprogram(name: "find", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcm", scope: !346, file: !244, line: 2654, type: !1031, scopeLine: 2654, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1031 = !DISubroutineType(types: !1032)
!1032 = !{!352, !701, !399, !352}
!1033 = !DISubprogram(name: "find", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEcm", scope: !346, file: !244, line: 2672, type: !1034, scopeLine: 2672, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1034 = !DISubroutineType(types: !1035)
!1035 = !{!352, !701, !187, !352}
!1036 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindERKS4_m", scope: !346, file: !244, line: 2686, type: !1028, scopeLine: 2686, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1037 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEPKcmm", scope: !346, file: !244, line: 2722, type: !1025, scopeLine: 2722, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1038 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEPKcm", scope: !346, file: !244, line: 2737, type: !1031, scopeLine: 2737, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1039 = !DISubprogram(name: "rfind", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEcm", scope: !346, file: !244, line: 2755, type: !1034, scopeLine: 2755, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1040 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13find_first_ofERKS4_m", scope: !346, file: !244, line: 2770, type: !1028, scopeLine: 2770, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1041 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13find_first_ofEPKcmm", scope: !346, file: !244, line: 2807, type: !1025, scopeLine: 2807, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1042 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13find_first_ofEPKcm", scope: !346, file: !244, line: 2822, type: !1031, scopeLine: 2822, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1043 = !DISubprogram(name: "find_first_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13find_first_ofEcm", scope: !346, file: !244, line: 2843, type: !1034, scopeLine: 2843, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1044 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12find_last_ofERKS4_m", scope: !346, file: !244, line: 2859, type: !1028, scopeLine: 2859, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1045 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12find_last_ofEPKcmm", scope: !346, file: !244, line: 2896, type: !1025, scopeLine: 2896, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1046 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12find_last_ofEPKcm", scope: !346, file: !244, line: 2911, type: !1031, scopeLine: 2911, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1047 = !DISubprogram(name: "find_last_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12find_last_ofEcm", scope: !346, file: !244, line: 2932, type: !1034, scopeLine: 2932, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1048 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE17find_first_not_ofERKS4_m", scope: !346, file: !244, line: 2947, type: !1028, scopeLine: 2947, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1049 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE17find_first_not_ofEPKcmm", scope: !346, file: !244, line: 2984, type: !1025, scopeLine: 2984, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1050 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE17find_first_not_ofEPKcm", scope: !346, file: !244, line: 2999, type: !1031, scopeLine: 2999, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1051 = !DISubprogram(name: "find_first_not_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE17find_first_not_ofEcm", scope: !346, file: !244, line: 3018, type: !1034, scopeLine: 3018, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1052 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16find_last_not_ofERKS4_m", scope: !346, file: !244, line: 3034, type: !1028, scopeLine: 3034, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1053 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16find_last_not_ofEPKcmm", scope: !346, file: !244, line: 3071, type: !1025, scopeLine: 3071, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1054 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16find_last_not_ofEPKcm", scope: !346, file: !244, line: 3086, type: !1031, scopeLine: 3086, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1055 = !DISubprogram(name: "find_last_not_of", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16find_last_not_ofEcm", scope: !346, file: !244, line: 3105, type: !1034, scopeLine: 3105, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1056 = !DISubprogram(name: "substr", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm", scope: !346, file: !244, line: 3122, type: !1057, scopeLine: 3122, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1057 = !DISubroutineType(types: !1058)
!1058 = !{!346, !701, !352, !352}
!1059 = !DISubprogram(name: "compare", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareERKS4_", scope: !346, file: !244, line: 3142, type: !1060, scopeLine: 3142, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1060 = !DISubroutineType(types: !1061)
!1061 = !{!582, !701, !779}
!1062 = !DISubprogram(name: "compare", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEmmRKS4_", scope: !346, file: !244, line: 3239, type: !1063, scopeLine: 3239, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1063 = !DISubroutineType(types: !1064)
!1064 = !{!582, !701, !352, !352, !779}
!1065 = !DISubprogram(name: "compare", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEmmRKS4_mm", scope: !346, file: !244, line: 3266, type: !1066, scopeLine: 3266, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1066 = !DISubroutineType(types: !1067)
!1067 = !{!582, !701, !352, !352, !779, !352, !352}
!1068 = !DISubprogram(name: "compare", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc", scope: !346, file: !244, line: 3285, type: !1069, scopeLine: 3285, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!582, !701, !399}
!1071 = !DISubprogram(name: "compare", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEmmPKc", scope: !346, file: !244, line: 3310, type: !1072, scopeLine: 3310, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!582, !701, !352, !352, !399}
!1074 = !DISubprogram(name: "compare", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEmmPKcm", scope: !346, file: !244, line: 3338, type: !1075, scopeLine: 3338, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!582, !701, !352, !352, !399, !352}
!1077 = !{!634, !635, !449}
!1078 = !{!1079}
!1079 = !DIEnumerator(name: "_S_local_capacity", value: 15, isUnsigned: true)
!1080 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Ios_Iostate", scope: !27, file: !177, line: 154, baseType: !582, size: 32, elements: !1081, identifier: "_ZTSSt12_Ios_Iostate")
!1081 = !{!1082, !1083, !1084, !1085, !1086, !1087, !1088}
!1082 = !DIEnumerator(name: "_S_goodbit", value: 0)
!1083 = !DIEnumerator(name: "_S_badbit", value: 1)
!1084 = !DIEnumerator(name: "_S_eofbit", value: 2)
!1085 = !DIEnumerator(name: "_S_failbit", value: 4)
!1086 = !DIEnumerator(name: "_S_ios_iostate_end", value: 65536)
!1087 = !DIEnumerator(name: "_S_ios_iostate_max", value: 2147483647)
!1088 = !DIEnumerator(name: "_S_ios_iostate_min", value: -2147483648)
!1089 = !{!1090, !82, !62, !30, !32, !352, !663, !25, !1092, !1093, !1080, !582, !1097, !20, !91, !11, !6, !1098, !1165, !58, !369, !375, !496, !346, !465, !1215, !178}
!1090 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !27, file: !1091, line: 77, baseType: !346)
!1091 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stringfwd.h", directory: "")
!1092 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!1093 = !DIDerivedType(tag: DW_TAG_typedef, name: "streamsize", scope: !27, file: !1094, line: 68, baseType: !1095)
!1094 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/postypes.h", directory: "")
!1095 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !27, file: !26, line: 299, baseType: !1096)
!1096 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!1097 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1098 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1000000000L> >", scope: !1100, file: !1099, line: 443, size: 64, flags: DIFlagTypePassByValue, elements: !1101, templateParams: !1153, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEE")
!1099 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/chrono.h", directory: "")
!1100 = !DINamespace(name: "chrono", scope: !27)
!1101 = !{!1102, !1104, !1110, !1114, !1119, !1120, !1124, !1128, !1131, !1132, !1135, !1138, !1139, !1140, !1141, !1142, !1147, !1148, !1151, !1152}
!1102 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !1098, file: !1099, line: 619, baseType: !1103, size: 64, flags: DIFlagPrivate)
!1103 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !1098, file: !1099, line: 487, baseType: !1096)
!1104 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE6_S_gcdEll", scope: !1098, file: !1099, line: 450, type: !1105, scopeLine: 450, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1105 = !DISubroutineType(types: !1106)
!1106 = !{!1107, !1107, !1107}
!1107 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1108, line: 101, baseType: !1109)
!1108 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
!1109 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !35, line: 72, baseType: !1096)
!1110 = !DISubprogram(name: "duration", scope: !1098, file: !1099, line: 496, type: !1111, scopeLine: 496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1111 = !DISubroutineType(types: !1112)
!1112 = !{null, !1113}
!1113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1098, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1114 = !DISubprogram(name: "duration", scope: !1098, file: !1099, line: 498, type: !1115, scopeLine: 498, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{null, !1113, !1117}
!1117 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1118, size: 64)
!1118 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1098)
!1119 = !DISubprogram(name: "~duration", scope: !1098, file: !1099, line: 516, type: !1111, scopeLine: 516, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1120 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEaSERKS3_", scope: !1098, file: !1099, line: 517, type: !1121, scopeLine: 517, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!1123, !1113, !1117}
!1123 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1098, size: 64)
!1124 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv", scope: !1098, file: !1099, line: 521, type: !1125, scopeLine: 521, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1125 = !DISubroutineType(types: !1126)
!1126 = !{!1103, !1127}
!1127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1118, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1128 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpsEv", scope: !1098, file: !1099, line: 527, type: !1129, scopeLine: 527, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!1098, !1127}
!1131 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEngEv", scope: !1098, file: !1099, line: 531, type: !1129, scopeLine: 531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1132 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEv", scope: !1098, file: !1099, line: 535, type: !1133, scopeLine: 535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1133 = !DISubroutineType(types: !1134)
!1134 = !{!1123, !1113}
!1135 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEi", scope: !1098, file: !1099, line: 542, type: !1136, scopeLine: 542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!1098, !1113, !582}
!1138 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEv", scope: !1098, file: !1099, line: 546, type: !1133, scopeLine: 546, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1139 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEi", scope: !1098, file: !1099, line: 553, type: !1136, scopeLine: 553, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1140 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpLERKS3_", scope: !1098, file: !1099, line: 557, type: !1121, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1141 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmIERKS3_", scope: !1098, file: !1099, line: 564, type: !1121, scopeLine: 564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1142 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmLERKl", scope: !1098, file: !1099, line: 571, type: !1143, scopeLine: 571, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1143 = !DISubroutineType(types: !1144)
!1144 = !{!1123, !1113, !1145}
!1145 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1146, size: 64)
!1146 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1103)
!1147 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEdVERKl", scope: !1098, file: !1099, line: 578, type: !1143, scopeLine: 578, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1148 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE4zeroEv", scope: !1098, file: !1099, line: 607, type: !1149, scopeLine: 607, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!1098}
!1151 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3minEv", scope: !1098, file: !1099, line: 611, type: !1149, scopeLine: 611, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1152 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3maxEv", scope: !1098, file: !1099, line: 615, type: !1149, scopeLine: 615, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1153 = !{!1154, !1155}
!1154 = !DITemplateTypeParameter(name: "_Rep", type: !1096)
!1155 = !DITemplateTypeParameter(name: "_Period", type: !1156)
!1156 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000000000L>", scope: !27, file: !1157, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !1158, templateParams: !1162, identifier: "_ZTSSt5ratioILl1ELl1000000000EE")
!1157 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ratio", directory: "")
!1158 = !{!1159, !1161}
!1159 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !1156, file: !1157, line: 273, baseType: !1160, flags: DIFlagStaticMember, extraData: i64 1)
!1160 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1107)
!1161 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !1156, file: !1157, line: 276, baseType: !1160, flags: DIFlagStaticMember, extraData: i64 1000000000)
!1162 = !{!1163, !1164}
!1163 = !DITemplateValueParameter(name: "_Num", type: !1096, value: i64 1)
!1164 = !DITemplateValueParameter(name: "_Den", type: !1096, value: i64 1000000000)
!1165 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "time_point<std::chrono::_V2::system_clock, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !1100, file: !1099, line: 856, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !1166, templateParams: !1192, identifier: "_ZTSNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEEE")
!1166 = !{!1167, !1169, !1173, !1178, !1183, !1187, !1188, !1191}
!1167 = !DIDerivedType(tag: DW_TAG_member, name: "__d", scope: !1165, file: !1099, line: 934, baseType: !1168, size: 64, flags: DIFlagPrivate)
!1168 = !DIDerivedType(tag: DW_TAG_typedef, name: "duration", scope: !1165, file: !1099, line: 862, baseType: !1098)
!1169 = !DISubprogram(name: "time_point", scope: !1165, file: !1099, line: 866, type: !1170, scopeLine: 866, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1170 = !DISubroutineType(types: !1171)
!1171 = !{null, !1172}
!1172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1165, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1173 = !DISubprogram(name: "time_point", scope: !1165, file: !1099, line: 869, type: !1174, scopeLine: 869, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1174 = !DISubroutineType(types: !1175)
!1175 = !{null, !1172, !1176}
!1176 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1177, size: 64)
!1177 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1168)
!1178 = !DISubprogram(name: "time_since_epoch", linkageName: "_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv", scope: !1165, file: !1099, line: 882, type: !1179, scopeLine: 882, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1179 = !DISubroutineType(types: !1180)
!1180 = !{!1168, !1181}
!1181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1182, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1182 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1165)
!1183 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEEpLERKS6_", scope: !1165, file: !1099, line: 911, type: !1184, scopeLine: 911, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1184 = !DISubroutineType(types: !1185)
!1185 = !{!1186, !1172, !1176}
!1186 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1165, size: 64)
!1187 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEEmIERKS6_", scope: !1165, file: !1099, line: 918, type: !1184, scopeLine: 918, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1188 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE3minEv", scope: !1165, file: !1099, line: 926, type: !1189, scopeLine: 926, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1189 = !DISubroutineType(types: !1190)
!1190 = !{!1165}
!1191 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE3maxEv", scope: !1165, file: !1099, line: 930, type: !1189, scopeLine: 930, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1192 = !{!1193, !1214}
!1193 = !DITemplateTypeParameter(name: "_Clock", type: !1194)
!1194 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "system_clock", scope: !1195, file: !1099, line: 1110, size: 8, flags: DIFlagTypePassByValue, elements: !1196, identifier: "_ZTSNSt6chrono3_V212system_clockE")
!1195 = !DINamespace(name: "_V2", scope: !1100, exportSymbols: true)
!1196 = !{!1197, !1199, !1203, !1211}
!1197 = !DIDerivedType(tag: DW_TAG_member, name: "is_steady", scope: !1194, file: !1099, line: 1121, baseType: !1198, flags: DIFlagStaticMember, extraData: i1 false)
!1198 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !145)
!1199 = !DISubprogram(name: "now", linkageName: "_ZNSt6chrono3_V212system_clock3nowEv", scope: !1194, file: !1099, line: 1124, type: !1200, scopeLine: 1124, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1200 = !DISubroutineType(types: !1201)
!1201 = !{!1202}
!1202 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_point", scope: !1194, file: !1099, line: 1115, baseType: !1165)
!1203 = !DISubprogram(name: "to_time_t", linkageName: "_ZNSt6chrono3_V212system_clock9to_time_tERKNS_10time_pointIS1_NS_8durationIlSt5ratioILl1ELl1000000000EEEEEE", scope: !1194, file: !1099, line: 1128, type: !1204, scopeLine: 1128, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1204 = !DISubroutineType(types: !1205)
!1205 = !{!1206, !1209}
!1206 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1207, line: 10, baseType: !1208)
!1207 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!1208 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !35, line: 160, baseType: !1096)
!1209 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1210, size: 64)
!1210 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1202)
!1211 = !DISubprogram(name: "from_time_t", linkageName: "_ZNSt6chrono3_V212system_clock11from_time_tEl", scope: !1194, file: !1099, line: 1135, type: !1212, scopeLine: 1135, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1212 = !DISubroutineType(types: !1213)
!1213 = !{!1202, !1206}
!1214 = !DITemplateTypeParameter(name: "_Dur", type: !1098)
!1215 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Guard", scope: !1216, file: !347, line: 232, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1235, identifier: "_ZTSZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagE6_Guard")
!1216 = distinct !DISubprogram(name: "_M_construct<const char *>", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag", scope: !346, file: !347, line: 218, type: !1217, scopeLine: 220, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, templateParams: !1225, declaration: !1224, retainedNodes: !1227)
!1217 = !DISubroutineType(types: !1218)
!1218 = !{null, !690, !399, !399, !1219}
!1219 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "forward_iterator_tag", scope: !27, file: !1220, line: 99, size: 8, flags: DIFlagTypePassByValue, elements: !1221, identifier: "_ZTSSt20forward_iterator_tag")
!1220 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_types.h", directory: "")
!1221 = !{!1222}
!1222 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1219, baseType: !1223, extraData: i32 0)
!1223 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "input_iterator_tag", scope: !27, file: !1220, line: 93, size: 8, flags: DIFlagTypePassByValue, elements: !472, identifier: "_ZTSSt18input_iterator_tag")
!1224 = !DISubprogram(name: "_M_construct<const char *>", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag", scope: !346, file: !244, line: 331, type: !1217, scopeLine: 331, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !1225)
!1225 = !{!1226}
!1226 = !DITemplateTypeParameter(name: "_FwdIterator", type: !399)
!1227 = !{!1228, !1230, !1231, !1232, !1233, !1234}
!1228 = !DILocalVariable(name: "this", arg: 1, scope: !1216, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!1229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !346, size: 64)
!1230 = !DILocalVariable(name: "__beg", arg: 2, scope: !1216, file: !244, line: 331, type: !399)
!1231 = !DILocalVariable(name: "__end", arg: 3, scope: !1216, file: !244, line: 331, type: !399)
!1232 = !DILocalVariable(arg: 4, scope: !1216, file: !244, line: 332, type: !1219)
!1233 = !DILocalVariable(name: "__dnew", scope: !1216, file: !347, line: 221, type: !352)
!1234 = !DILocalVariable(name: "__guard", scope: !1216, file: !347, line: 241, type: !1215)
!1235 = !{!1236, !1237, !1241}
!1236 = !DIDerivedType(tag: DW_TAG_member, name: "_M_guarded", scope: !1215, file: !347, line: 240, baseType: !1229, size: 64)
!1237 = !DISubprogram(name: "_Guard", scope: !1215, file: !347, line: 235, type: !1238, scopeLine: 235, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{null, !1240, !1229}
!1240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1215, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1241 = !DISubprogram(name: "~_Guard", scope: !1215, file: !347, line: 238, type: !1242, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1242 = !DISubroutineType(types: !1243)
!1243 = !{null, !1240}
!1244 = !{!0, !173, !179, !183, !190, !195, !200, !205, !210, !215, !217, !222, !227, !232, !237, !1245, !242}
!1245 = !DIGlobalVariableExpression(var: !1246, expr: !DIExpression())
!1246 = distinct !DIGlobalVariable(scope: null, file: !244, line: 639, type: !1247, isLocal: true, isDefinition: true)
!1247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 400, elements: !1248)
!1248 = !{!1249}
!1249 = !DISubrange(count: 50)
!1250 = !{!1251, !1257, !1264, !1266, !1268, !1272, !1274, !1276, !1278, !1280, !1282, !1284, !1286, !1291, !1295, !1297, !1299, !1304, !1306, !1308, !1310, !1312, !1314, !1316, !1319, !1322, !1324, !1328, !1333, !1335, !1337, !1339, !1341, !1343, !1345, !1347, !1349, !1351, !1353, !1357, !1361, !1363, !1365, !1367, !1369, !1371, !1373, !1375, !1377, !1379, !1381, !1383, !1385, !1387, !1389, !1391, !1395, !1399, !1403, !1405, !1407, !1409, !1411, !1413, !1415, !1417, !1419, !1421, !1425, !1429, !1433, !1435, !1437, !1439, !1444, !1448, !1452, !1454, !1456, !1458, !1460, !1462, !1464, !1466, !1468, !1470, !1472, !1474, !1476, !1480, !1484, !1488, !1490, !1492, !1494, !1498, !1502, !1506, !1508, !1510, !1512, !1514, !1516, !1518, !1522, !1526, !1528, !1530, !1532, !1534, !1538, !1542, !1546, !1548, !1550, !1552, !1554, !1556, !1558, !1562, !1566, !1570, !1572, !1576, !1580, !1582, !1584, !1586, !1588, !1590, !1592, !1596, !1600, !1606, !1610, !1614, !1619, !1621, !1624, !1628, !1632, !1641, !1643, !1647, !1651, !1655, !1659, !1663, !1667, !1671, !1675, !1683, !1687, !1691, !1693, !1697, !1701, !1705, !1711, !1715, !1719, !1721, !1729, !1733, !1739, !1741, !1745, !1749, !1753, !1757, !1762, !1766, !1770, !1771, !1772, !1773, !1775, !1776, !1777, !1778, !1779, !1780, !1781, !1783, !1784, !1785, !1786, !1787, !1788, !1789, !1791, !1792, !1793, !1794, !1795, !1796, !1797, !1798, !1799, !1800, !1801, !1802, !1803, !1804, !1805, !1806, !1807, !1808, !1809, !1810, !1811, !1812, !1813, !1814, !1815, !1818, !1820, !1822, !1824, !1826, !1828, !1830, !1832, !1834, !1836, !1838, !1840, !1842, !1844, !1846, !1848, !1850, !1852, !1854, !1856, !1858, !1860, !1862, !1864, !1866, !1868, !1872, !1874, !1876, !1880, !1884, !1886, !1888, !1890, !1892, !1894, !1896, !1898, !1900, !1902, !1904, !1906, !1908, !1910, !1912, !1914, !1916, !1918, !1920, !1922, !1924, !1926, !1931, !1933, !1935, !1937, !1939, !1941, !1943, !1945, !1947, !1949, !1951, !1953, !1955, !1957, !1959, !1961, !1963, !1965, !1967, !1969, !1973, !1975, !1977, !1979, !1981, !1983, !1985, !1987, !1989, !1991, !1993, !1995, !1997, !1999, !2001, !2003, !2005, !2007, !2009, !2011, !2013, !2015, !2017, !2019, !2021, !2023, !2025, !2027, !2029, !2031, !2033, !2035, !2037, !2039, !2041, !2043, !2045, !2047, !2049, !2051, !2053, !2055, !2057, !2059, !2061, !2063, !2065, !2067, !2069, !2071, !2073, !2075, !2077, !2079, !2081, !2085, !2089, !2106, !2109, !2114, !2169, !2174, !2178, !2182, !2186, !2190, !2192, !2194, !2198, !2204, !2208, !2214, !2220, !2222, !2226, !2230, !2234, !2238, !2250, !2252, !2256, !2260, !2264, !2266, !2270, !2274, !2278, !2280, !2282, !2286, !2294, !2298, !2302, !2306, !2308, !2314, !2316, !2322, !2326, !2330, !2334, !2338, !2342, !2346, !2348, !2350, !2354, !2358, !2362, !2364, !2368, !2372, !2374, !2376, !2380, !2384, !2388, !2392, !2393, !2394, !2395, !2396, !2397, !2398, !2399, !2400, !2401, !2402, !2407, !2411, !2414, !2417, !2419, !2421, !2423, !2425, !2428, !2431, !2434, !2437, !2438, !2440, !2443, !2444, !2445, !2448, !2450, !2452, !2454, !2456, !2459, !2462, !2465, !2468, !2471, !2473, !2477, !2481, !2486, !2490, !2492, !2494, !2496, !2498, !2500, !2502, !2504, !2506, !2508, !2510, !2512, !2514, !2516, !2520, !2526, !2531, !2535, !2537, !2539, !2541, !2543, !2550, !2554, !2558, !2562, !2566, !2570, !2575, !2579, !2581, !2585, !2591, !2595, !2600, !2602, !2605, !2609, !2613, !2615, !2617, !2619, !2621, !2625, !2627, !2629, !2633, !2637, !2641, !2645, !2649, !2653, !2655, !2659, !2663, !2667, !2671, !2673, !2675, !2679, !2683, !2684, !2685, !2686, !2687, !2688, !2694, !2697, !2698, !2700, !2702, !2704, !2706, !2710, !2712, !2714, !2716, !2718, !2720, !2722, !2724, !2726, !2730, !2734, !2736, !2740, !2744, !2749, !2750, !2751, !2756, !2760, !2765, !2770, !2774, !2780, !2784, !2786, !2790, !2797, !2802, !2805, !2811, !2815, !2820, !2822, !2826, !2830, !2832, !2834, !2836, !2840, !2844, !2848, !2852, !2856, !2858, !2860, !2862, !2866, !2870, !2874, !2876, !2878, !2883, !2887, !2891, !2895, !2899, !2903}
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1252, file: !1256, line: 52)
!1252 = !DISubprogram(name: "abs", scope: !1253, file: !1253, line: 848, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1253 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!1254 = !DISubroutineType(types: !1255)
!1255 = !{!582, !582}
!1256 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/std_abs.h", directory: "")
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1258, file: !1263, line: 83)
!1258 = !DISubprogram(name: "acos", scope: !1259, file: !1259, line: 53, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1259 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "8c6e2d0d2bda65bc5ba1ca02b65383b7")
!1260 = !DISubroutineType(types: !1261)
!1261 = !{!1262, !1262}
!1262 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!1263 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cmath", directory: "")
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1265, file: !1263, line: 102)
!1265 = !DISubprogram(name: "asin", scope: !1259, file: !1259, line: 55, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1267, file: !1263, line: 121)
!1267 = !DISubprogram(name: "atan", scope: !1259, file: !1259, line: 57, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1269, file: !1263, line: 140)
!1269 = !DISubprogram(name: "atan2", scope: !1259, file: !1259, line: 59, type: !1270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1270 = !DISubroutineType(types: !1271)
!1271 = !{!1262, !1262, !1262}
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1273, file: !1263, line: 161)
!1273 = !DISubprogram(name: "ceil", scope: !1259, file: !1259, line: 159, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1275, file: !1263, line: 180)
!1275 = !DISubprogram(name: "cos", scope: !1259, file: !1259, line: 62, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1277, file: !1263, line: 199)
!1277 = !DISubprogram(name: "cosh", scope: !1259, file: !1259, line: 71, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1279, file: !1263, line: 218)
!1279 = !DISubprogram(name: "exp", scope: !1259, file: !1259, line: 95, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1281, file: !1263, line: 237)
!1281 = !DISubprogram(name: "fabs", scope: !1259, file: !1259, line: 162, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1283, file: !1263, line: 256)
!1283 = !DISubprogram(name: "floor", scope: !1259, file: !1259, line: 165, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1285, file: !1263, line: 275)
!1285 = !DISubprogram(name: "fmod", scope: !1259, file: !1259, line: 168, type: !1270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1287, file: !1263, line: 296)
!1287 = !DISubprogram(name: "frexp", scope: !1259, file: !1259, line: 98, type: !1288, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1288 = !DISubroutineType(types: !1289)
!1289 = !{!1262, !1262, !1290}
!1290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !582, size: 64)
!1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1292, file: !1263, line: 315)
!1292 = !DISubprogram(name: "ldexp", scope: !1259, file: !1259, line: 101, type: !1293, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1293 = !DISubroutineType(types: !1294)
!1294 = !{!1262, !1262, !582}
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1296, file: !1263, line: 334)
!1296 = !DISubprogram(name: "log", scope: !1259, file: !1259, line: 104, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1298, file: !1263, line: 353)
!1298 = !DISubprogram(name: "log10", scope: !1259, file: !1259, line: 107, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1300, file: !1263, line: 372)
!1300 = !DISubprogram(name: "modf", scope: !1259, file: !1259, line: 110, type: !1301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1301 = !DISubroutineType(types: !1302)
!1302 = !{!1262, !1262, !1303}
!1303 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1262, size: 64)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1305, file: !1263, line: 384)
!1305 = !DISubprogram(name: "pow", scope: !1259, file: !1259, line: 140, type: !1270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1307, file: !1263, line: 421)
!1307 = !DISubprogram(name: "sin", scope: !1259, file: !1259, line: 64, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1309, file: !1263, line: 440)
!1309 = !DISubprogram(name: "sinh", scope: !1259, file: !1259, line: 73, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1311, file: !1263, line: 459)
!1311 = !DISubprogram(name: "sqrt", scope: !1259, file: !1259, line: 143, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1313, file: !1263, line: 478)
!1313 = !DISubprogram(name: "tan", scope: !1259, file: !1259, line: 66, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1315, file: !1263, line: 497)
!1315 = !DISubprogram(name: "tanh", scope: !1259, file: !1259, line: 75, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1317, file: !1263, line: 1065)
!1317 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !1318, line: 164, baseType: !1262)
!1318 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "f3450d1d586f704597de1a1b2bed18f3")
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1320, file: !1263, line: 1066)
!1320 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !1318, line: 163, baseType: !1321)
!1321 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1323, file: !1263, line: 1069)
!1323 = !DISubprogram(name: "acosh", scope: !1259, file: !1259, line: 85, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1325, file: !1263, line: 1070)
!1325 = !DISubprogram(name: "acoshf", scope: !1259, file: !1259, line: 85, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1326 = !DISubroutineType(types: !1327)
!1327 = !{!1321, !1321}
!1328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1329, file: !1263, line: 1071)
!1329 = !DISubprogram(name: "acoshl", scope: !1259, file: !1259, line: 85, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1330 = !DISubroutineType(types: !1331)
!1331 = !{!1332, !1332}
!1332 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1334, file: !1263, line: 1073)
!1334 = !DISubprogram(name: "asinh", scope: !1259, file: !1259, line: 87, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1336, file: !1263, line: 1074)
!1336 = !DISubprogram(name: "asinhf", scope: !1259, file: !1259, line: 87, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1338, file: !1263, line: 1075)
!1338 = !DISubprogram(name: "asinhl", scope: !1259, file: !1259, line: 87, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1340, file: !1263, line: 1077)
!1340 = !DISubprogram(name: "atanh", scope: !1259, file: !1259, line: 89, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1342, file: !1263, line: 1078)
!1342 = !DISubprogram(name: "atanhf", scope: !1259, file: !1259, line: 89, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1344, file: !1263, line: 1079)
!1344 = !DISubprogram(name: "atanhl", scope: !1259, file: !1259, line: 89, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1346, file: !1263, line: 1081)
!1346 = !DISubprogram(name: "cbrt", scope: !1259, file: !1259, line: 152, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1348, file: !1263, line: 1082)
!1348 = !DISubprogram(name: "cbrtf", scope: !1259, file: !1259, line: 152, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1350, file: !1263, line: 1083)
!1350 = !DISubprogram(name: "cbrtl", scope: !1259, file: !1259, line: 152, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1352, file: !1263, line: 1085)
!1352 = !DISubprogram(name: "copysign", scope: !1259, file: !1259, line: 198, type: !1270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1354, file: !1263, line: 1086)
!1354 = !DISubprogram(name: "copysignf", scope: !1259, file: !1259, line: 198, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1355 = !DISubroutineType(types: !1356)
!1356 = !{!1321, !1321, !1321}
!1357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1358, file: !1263, line: 1087)
!1358 = !DISubprogram(name: "copysignl", scope: !1259, file: !1259, line: 198, type: !1359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1359 = !DISubroutineType(types: !1360)
!1360 = !{!1332, !1332, !1332}
!1361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1362, file: !1263, line: 1089)
!1362 = !DISubprogram(name: "erf", scope: !1259, file: !1259, line: 231, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1364, file: !1263, line: 1090)
!1364 = !DISubprogram(name: "erff", scope: !1259, file: !1259, line: 231, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1366, file: !1263, line: 1091)
!1366 = !DISubprogram(name: "erfl", scope: !1259, file: !1259, line: 231, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1368, file: !1263, line: 1093)
!1368 = !DISubprogram(name: "erfc", scope: !1259, file: !1259, line: 232, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1370, file: !1263, line: 1094)
!1370 = !DISubprogram(name: "erfcf", scope: !1259, file: !1259, line: 232, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1372, file: !1263, line: 1095)
!1372 = !DISubprogram(name: "erfcl", scope: !1259, file: !1259, line: 232, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1374, file: !1263, line: 1097)
!1374 = !DISubprogram(name: "exp2", scope: !1259, file: !1259, line: 130, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1376, file: !1263, line: 1098)
!1376 = !DISubprogram(name: "exp2f", scope: !1259, file: !1259, line: 130, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1378, file: !1263, line: 1099)
!1378 = !DISubprogram(name: "exp2l", scope: !1259, file: !1259, line: 130, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1380, file: !1263, line: 1101)
!1380 = !DISubprogram(name: "expm1", scope: !1259, file: !1259, line: 119, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1382, file: !1263, line: 1102)
!1382 = !DISubprogram(name: "expm1f", scope: !1259, file: !1259, line: 119, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1384, file: !1263, line: 1103)
!1384 = !DISubprogram(name: "expm1l", scope: !1259, file: !1259, line: 119, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1386, file: !1263, line: 1105)
!1386 = !DISubprogram(name: "fdim", scope: !1259, file: !1259, line: 329, type: !1270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1388, file: !1263, line: 1106)
!1388 = !DISubprogram(name: "fdimf", scope: !1259, file: !1259, line: 329, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1390, file: !1263, line: 1107)
!1390 = !DISubprogram(name: "fdiml", scope: !1259, file: !1259, line: 329, type: !1359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1392, file: !1263, line: 1109)
!1392 = !DISubprogram(name: "fma", scope: !1259, file: !1259, line: 340, type: !1393, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1393 = !DISubroutineType(types: !1394)
!1394 = !{!1262, !1262, !1262, !1262}
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1396, file: !1263, line: 1110)
!1396 = !DISubprogram(name: "fmaf", scope: !1259, file: !1259, line: 340, type: !1397, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1397 = !DISubroutineType(types: !1398)
!1398 = !{!1321, !1321, !1321, !1321}
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1400, file: !1263, line: 1111)
!1400 = !DISubprogram(name: "fmal", scope: !1259, file: !1259, line: 340, type: !1401, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1401 = !DISubroutineType(types: !1402)
!1402 = !{!1332, !1332, !1332, !1332}
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1404, file: !1263, line: 1113)
!1404 = !DISubprogram(name: "fmax", scope: !1259, file: !1259, line: 333, type: !1270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1406, file: !1263, line: 1114)
!1406 = !DISubprogram(name: "fmaxf", scope: !1259, file: !1259, line: 333, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1408, file: !1263, line: 1115)
!1408 = !DISubprogram(name: "fmaxl", scope: !1259, file: !1259, line: 333, type: !1359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1410, file: !1263, line: 1117)
!1410 = !DISubprogram(name: "fmin", scope: !1259, file: !1259, line: 336, type: !1270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1412, file: !1263, line: 1118)
!1412 = !DISubprogram(name: "fminf", scope: !1259, file: !1259, line: 336, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1414, file: !1263, line: 1119)
!1414 = !DISubprogram(name: "fminl", scope: !1259, file: !1259, line: 336, type: !1359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1416, file: !1263, line: 1121)
!1416 = !DISubprogram(name: "hypot", scope: !1259, file: !1259, line: 147, type: !1270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1418, file: !1263, line: 1122)
!1418 = !DISubprogram(name: "hypotf", scope: !1259, file: !1259, line: 147, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1420, file: !1263, line: 1123)
!1420 = !DISubprogram(name: "hypotl", scope: !1259, file: !1259, line: 147, type: !1359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1422, file: !1263, line: 1125)
!1422 = !DISubprogram(name: "ilogb", scope: !1259, file: !1259, line: 283, type: !1423, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1423 = !DISubroutineType(types: !1424)
!1424 = !{!582, !1262}
!1425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1426, file: !1263, line: 1126)
!1426 = !DISubprogram(name: "ilogbf", scope: !1259, file: !1259, line: 283, type: !1427, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1427 = !DISubroutineType(types: !1428)
!1428 = !{!582, !1321}
!1429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1430, file: !1263, line: 1127)
!1430 = !DISubprogram(name: "ilogbl", scope: !1259, file: !1259, line: 283, type: !1431, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1431 = !DISubroutineType(types: !1432)
!1432 = !{!582, !1332}
!1433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1434, file: !1263, line: 1129)
!1434 = !DISubprogram(name: "lgamma", scope: !1259, file: !1259, line: 233, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1436, file: !1263, line: 1130)
!1436 = !DISubprogram(name: "lgammaf", scope: !1259, file: !1259, line: 233, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1438, file: !1263, line: 1131)
!1438 = !DISubprogram(name: "lgammal", scope: !1259, file: !1259, line: 233, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1440, file: !1263, line: 1134)
!1440 = !DISubprogram(name: "llrint", scope: !1259, file: !1259, line: 319, type: !1441, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1441 = !DISubroutineType(types: !1442)
!1442 = !{!1443, !1262}
!1443 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!1444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1445, file: !1263, line: 1135)
!1445 = !DISubprogram(name: "llrintf", scope: !1259, file: !1259, line: 319, type: !1446, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1446 = !DISubroutineType(types: !1447)
!1447 = !{!1443, !1321}
!1448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1449, file: !1263, line: 1136)
!1449 = !DISubprogram(name: "llrintl", scope: !1259, file: !1259, line: 319, type: !1450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1450 = !DISubroutineType(types: !1451)
!1451 = !{!1443, !1332}
!1452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1453, file: !1263, line: 1138)
!1453 = !DISubprogram(name: "llround", scope: !1259, file: !1259, line: 325, type: !1441, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1455, file: !1263, line: 1139)
!1455 = !DISubprogram(name: "llroundf", scope: !1259, file: !1259, line: 325, type: !1446, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1457, file: !1263, line: 1140)
!1457 = !DISubprogram(name: "llroundl", scope: !1259, file: !1259, line: 325, type: !1450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1459, file: !1263, line: 1143)
!1459 = !DISubprogram(name: "log1p", scope: !1259, file: !1259, line: 122, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1461, file: !1263, line: 1144)
!1461 = !DISubprogram(name: "log1pf", scope: !1259, file: !1259, line: 122, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1463, file: !1263, line: 1145)
!1463 = !DISubprogram(name: "log1pl", scope: !1259, file: !1259, line: 122, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1465, file: !1263, line: 1147)
!1465 = !DISubprogram(name: "log2", scope: !1259, file: !1259, line: 133, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1467, file: !1263, line: 1148)
!1467 = !DISubprogram(name: "log2f", scope: !1259, file: !1259, line: 133, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1469, file: !1263, line: 1149)
!1469 = !DISubprogram(name: "log2l", scope: !1259, file: !1259, line: 133, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1471, file: !1263, line: 1151)
!1471 = !DISubprogram(name: "logb", scope: !1259, file: !1259, line: 125, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1473, file: !1263, line: 1152)
!1473 = !DISubprogram(name: "logbf", scope: !1259, file: !1259, line: 125, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1475, file: !1263, line: 1153)
!1475 = !DISubprogram(name: "logbl", scope: !1259, file: !1259, line: 125, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1477, file: !1263, line: 1155)
!1477 = !DISubprogram(name: "lrint", scope: !1259, file: !1259, line: 317, type: !1478, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1478 = !DISubroutineType(types: !1479)
!1479 = !{!1096, !1262}
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1481, file: !1263, line: 1156)
!1481 = !DISubprogram(name: "lrintf", scope: !1259, file: !1259, line: 317, type: !1482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1482 = !DISubroutineType(types: !1483)
!1483 = !{!1096, !1321}
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1485, file: !1263, line: 1157)
!1485 = !DISubprogram(name: "lrintl", scope: !1259, file: !1259, line: 317, type: !1486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1486 = !DISubroutineType(types: !1487)
!1487 = !{!1096, !1332}
!1488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1489, file: !1263, line: 1159)
!1489 = !DISubprogram(name: "lround", scope: !1259, file: !1259, line: 323, type: !1478, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1491, file: !1263, line: 1160)
!1491 = !DISubprogram(name: "lroundf", scope: !1259, file: !1259, line: 323, type: !1482, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1493, file: !1263, line: 1161)
!1493 = !DISubprogram(name: "lroundl", scope: !1259, file: !1259, line: 323, type: !1486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1495, file: !1263, line: 1163)
!1495 = !DISubprogram(name: "nan", scope: !1259, file: !1259, line: 203, type: !1496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1496 = !DISubroutineType(types: !1497)
!1497 = !{!1262, !399}
!1498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1499, file: !1263, line: 1164)
!1499 = !DISubprogram(name: "nanf", scope: !1259, file: !1259, line: 203, type: !1500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1500 = !DISubroutineType(types: !1501)
!1501 = !{!1321, !399}
!1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1503, file: !1263, line: 1165)
!1503 = !DISubprogram(name: "nanl", scope: !1259, file: !1259, line: 203, type: !1504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1504 = !DISubroutineType(types: !1505)
!1505 = !{!1332, !399}
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1507, file: !1263, line: 1167)
!1507 = !DISubprogram(name: "nearbyint", scope: !1259, file: !1259, line: 297, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1509, file: !1263, line: 1168)
!1509 = !DISubprogram(name: "nearbyintf", scope: !1259, file: !1259, line: 297, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1511, file: !1263, line: 1169)
!1511 = !DISubprogram(name: "nearbyintl", scope: !1259, file: !1259, line: 297, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1513, file: !1263, line: 1171)
!1513 = !DISubprogram(name: "nextafter", scope: !1259, file: !1259, line: 262, type: !1270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1515, file: !1263, line: 1172)
!1515 = !DISubprogram(name: "nextafterf", scope: !1259, file: !1259, line: 262, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1517, file: !1263, line: 1173)
!1517 = !DISubprogram(name: "nextafterl", scope: !1259, file: !1259, line: 262, type: !1359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1519, file: !1263, line: 1175)
!1519 = !DISubprogram(name: "nexttoward", scope: !1259, file: !1259, line: 264, type: !1520, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1520 = !DISubroutineType(types: !1521)
!1521 = !{!1262, !1262, !1332}
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1523, file: !1263, line: 1176)
!1523 = !DISubprogram(name: "nexttowardf", scope: !1259, file: !1259, line: 264, type: !1524, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!1321, !1321, !1332}
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1527, file: !1263, line: 1177)
!1527 = !DISubprogram(name: "nexttowardl", scope: !1259, file: !1259, line: 264, type: !1359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1529, file: !1263, line: 1179)
!1529 = !DISubprogram(name: "remainder", scope: !1259, file: !1259, line: 275, type: !1270, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1531, file: !1263, line: 1180)
!1531 = !DISubprogram(name: "remainderf", scope: !1259, file: !1259, line: 275, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1533, file: !1263, line: 1181)
!1533 = !DISubprogram(name: "remainderl", scope: !1259, file: !1259, line: 275, type: !1359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1535, file: !1263, line: 1183)
!1535 = !DISubprogram(name: "remquo", scope: !1259, file: !1259, line: 310, type: !1536, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1536 = !DISubroutineType(types: !1537)
!1537 = !{!1262, !1262, !1262, !1290}
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1539, file: !1263, line: 1184)
!1539 = !DISubprogram(name: "remquof", scope: !1259, file: !1259, line: 310, type: !1540, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1540 = !DISubroutineType(types: !1541)
!1541 = !{!1321, !1321, !1321, !1290}
!1542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1543, file: !1263, line: 1185)
!1543 = !DISubprogram(name: "remquol", scope: !1259, file: !1259, line: 310, type: !1544, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1544 = !DISubroutineType(types: !1545)
!1545 = !{!1332, !1332, !1332, !1290}
!1546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1547, file: !1263, line: 1187)
!1547 = !DISubprogram(name: "rint", scope: !1259, file: !1259, line: 259, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1549, file: !1263, line: 1188)
!1549 = !DISubprogram(name: "rintf", scope: !1259, file: !1259, line: 259, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1551, file: !1263, line: 1189)
!1551 = !DISubprogram(name: "rintl", scope: !1259, file: !1259, line: 259, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1553, file: !1263, line: 1191)
!1553 = !DISubprogram(name: "round", scope: !1259, file: !1259, line: 301, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1555, file: !1263, line: 1192)
!1555 = !DISubprogram(name: "roundf", scope: !1259, file: !1259, line: 301, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1557, file: !1263, line: 1193)
!1557 = !DISubprogram(name: "roundl", scope: !1259, file: !1259, line: 301, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1559, file: !1263, line: 1195)
!1559 = !DISubprogram(name: "scalbln", scope: !1259, file: !1259, line: 293, type: !1560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1560 = !DISubroutineType(types: !1561)
!1561 = !{!1262, !1262, !1096}
!1562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1563, file: !1263, line: 1196)
!1563 = !DISubprogram(name: "scalblnf", scope: !1259, file: !1259, line: 293, type: !1564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1564 = !DISubroutineType(types: !1565)
!1565 = !{!1321, !1321, !1096}
!1566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1567, file: !1263, line: 1197)
!1567 = !DISubprogram(name: "scalblnl", scope: !1259, file: !1259, line: 293, type: !1568, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1568 = !DISubroutineType(types: !1569)
!1569 = !{!1332, !1332, !1096}
!1570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1571, file: !1263, line: 1199)
!1571 = !DISubprogram(name: "scalbn", scope: !1259, file: !1259, line: 279, type: !1293, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1573, file: !1263, line: 1200)
!1573 = !DISubprogram(name: "scalbnf", scope: !1259, file: !1259, line: 279, type: !1574, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1574 = !DISubroutineType(types: !1575)
!1575 = !{!1321, !1321, !582}
!1576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1577, file: !1263, line: 1201)
!1577 = !DISubprogram(name: "scalbnl", scope: !1259, file: !1259, line: 279, type: !1578, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1578 = !DISubroutineType(types: !1579)
!1579 = !{!1332, !1332, !582}
!1580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1581, file: !1263, line: 1203)
!1581 = !DISubprogram(name: "tgamma", scope: !1259, file: !1259, line: 238, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1583, file: !1263, line: 1204)
!1583 = !DISubprogram(name: "tgammaf", scope: !1259, file: !1259, line: 238, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1585, file: !1263, line: 1205)
!1585 = !DISubprogram(name: "tgammal", scope: !1259, file: !1259, line: 238, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1587, file: !1263, line: 1207)
!1587 = !DISubprogram(name: "trunc", scope: !1259, file: !1259, line: 305, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1589, file: !1263, line: 1208)
!1589 = !DISubprogram(name: "truncf", scope: !1259, file: !1259, line: 305, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1591, file: !1263, line: 1209)
!1591 = !DISubprogram(name: "truncl", scope: !1259, file: !1259, line: 305, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1592 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1593, entity: !1594, file: !1595, line: 58)
!1593 = !DINamespace(name: "__gnu_debug", scope: null)
!1594 = !DINamespace(name: "__debug", scope: !27)
!1595 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "09fce61e0085ea92b4bd81d6cd4dcc16")
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1597, file: !1599, line: 127)
!1597 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1253, line: 63, baseType: !1598)
!1598 = !DICompositeType(tag: DW_TAG_structure_type, file: !1253, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!1599 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdlib", directory: "")
!1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1601, file: !1599, line: 128)
!1601 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1253, line: 71, baseType: !1602)
!1602 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1253, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !1603, identifier: "_ZTS6ldiv_t")
!1603 = !{!1604, !1605}
!1604 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1602, file: !1253, line: 69, baseType: !1096, size: 64)
!1605 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1602, file: !1253, line: 70, baseType: !1096, size: 64, offset: 64)
!1606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1607, file: !1599, line: 130)
!1607 = !DISubprogram(name: "abort", scope: !1253, file: !1253, line: 598, type: !1608, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1608 = !DISubroutineType(types: !1609)
!1609 = !{null}
!1610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1611, file: !1599, line: 132)
!1611 = !DISubprogram(name: "aligned_alloc", scope: !1253, file: !1253, line: 592, type: !1612, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1612 = !DISubroutineType(types: !1613)
!1613 = !{!82, !15, !15}
!1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1615, file: !1599, line: 134)
!1615 = !DISubprogram(name: "atexit", scope: !1253, file: !1253, line: 602, type: !1616, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1616 = !DISubroutineType(types: !1617)
!1617 = !{!582, !1618}
!1618 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1608, size: 64)
!1619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1620, file: !1599, line: 137)
!1620 = !DISubprogram(name: "at_quick_exit", scope: !1253, file: !1253, line: 607, type: !1616, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1622, file: !1599, line: 140)
!1622 = !DISubprogram(name: "atof", scope: !1623, file: !1623, line: 25, type: !1496, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1623 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "adfe1626ff4efc68ac58c367ff5f206b")
!1624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1625, file: !1599, line: 141)
!1625 = !DISubprogram(name: "atoi", scope: !1253, file: !1253, line: 362, type: !1626, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1626 = !DISubroutineType(types: !1627)
!1627 = !{!582, !399}
!1628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1629, file: !1599, line: 142)
!1629 = !DISubprogram(name: "atol", scope: !1253, file: !1253, line: 367, type: !1630, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1630 = !DISubroutineType(types: !1631)
!1631 = !{!1096, !399}
!1632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1633, file: !1599, line: 143)
!1633 = !DISubprogram(name: "bsearch", scope: !1634, file: !1634, line: 20, type: !1635, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1634 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "724ededa330cc3e0cbd34c5b4030a6f6")
!1635 = !DISubroutineType(types: !1636)
!1636 = !{!82, !110, !110, !15, !15, !1637}
!1637 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !1253, line: 816, baseType: !1638)
!1638 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1639, size: 64)
!1639 = !DISubroutineType(types: !1640)
!1640 = !{!582, !110, !110}
!1641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1642, file: !1599, line: 144)
!1642 = !DISubprogram(name: "calloc", scope: !1253, file: !1253, line: 543, type: !1612, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1644, file: !1599, line: 145)
!1644 = !DISubprogram(name: "div", scope: !1253, file: !1253, line: 860, type: !1645, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1645 = !DISubroutineType(types: !1646)
!1646 = !{!1597, !582, !582}
!1647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1648, file: !1599, line: 146)
!1648 = !DISubprogram(name: "exit", scope: !1253, file: !1253, line: 624, type: !1649, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1649 = !DISubroutineType(types: !1650)
!1650 = !{null, !582}
!1651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1652, file: !1599, line: 147)
!1652 = !DISubprogram(name: "free", scope: !1253, file: !1253, line: 555, type: !1653, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1653 = !DISubroutineType(types: !1654)
!1654 = !{null, !82}
!1655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1656, file: !1599, line: 148)
!1656 = !DISubprogram(name: "getenv", scope: !1253, file: !1253, line: 641, type: !1657, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1657 = !DISubroutineType(types: !1658)
!1658 = !{!366, !399}
!1659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1660, file: !1599, line: 149)
!1660 = !DISubprogram(name: "labs", scope: !1253, file: !1253, line: 849, type: !1661, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1661 = !DISubroutineType(types: !1662)
!1662 = !{!1096, !1096}
!1663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1664, file: !1599, line: 150)
!1664 = !DISubprogram(name: "ldiv", scope: !1253, file: !1253, line: 862, type: !1665, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1665 = !DISubroutineType(types: !1666)
!1666 = !{!1601, !1096, !1096}
!1667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1668, file: !1599, line: 151)
!1668 = !DISubprogram(name: "malloc", scope: !1253, file: !1253, line: 540, type: !1669, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1669 = !DISubroutineType(types: !1670)
!1670 = !{!82, !15}
!1671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1672, file: !1599, line: 153)
!1672 = !DISubprogram(name: "mblen", scope: !1253, file: !1253, line: 930, type: !1673, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1673 = !DISubroutineType(types: !1674)
!1674 = !{!582, !399, !15}
!1675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1676, file: !1599, line: 154)
!1676 = !DISubprogram(name: "mbstowcs", scope: !1253, file: !1253, line: 941, type: !1677, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1677 = !DISubroutineType(types: !1678)
!1678 = !{!15, !1679, !1682, !15}
!1679 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1680)
!1680 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1681, size: 64)
!1681 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!1682 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !399)
!1683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1684, file: !1599, line: 155)
!1684 = !DISubprogram(name: "mbtowc", scope: !1253, file: !1253, line: 933, type: !1685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1685 = !DISubroutineType(types: !1686)
!1686 = !{!582, !1679, !1682, !15}
!1687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1688, file: !1599, line: 157)
!1688 = !DISubprogram(name: "qsort", scope: !1253, file: !1253, line: 838, type: !1689, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1689 = !DISubroutineType(types: !1690)
!1690 = !{null, !82, !15, !15, !1637}
!1691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1692, file: !1599, line: 160)
!1692 = !DISubprogram(name: "quick_exit", scope: !1253, file: !1253, line: 630, type: !1649, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1694, file: !1599, line: 163)
!1694 = !DISubprogram(name: "rand", scope: !1253, file: !1253, line: 454, type: !1695, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1695 = !DISubroutineType(types: !1696)
!1696 = !{!582}
!1697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1698, file: !1599, line: 164)
!1698 = !DISubprogram(name: "realloc", scope: !1253, file: !1253, line: 551, type: !1699, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1699 = !DISubroutineType(types: !1700)
!1700 = !{!82, !82, !15}
!1701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1702, file: !1599, line: 165)
!1702 = !DISubprogram(name: "srand", scope: !1253, file: !1253, line: 456, type: !1703, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1703 = !DISubroutineType(types: !1704)
!1704 = !{null, !96}
!1705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1706, file: !1599, line: 166)
!1706 = !DISubprogram(name: "strtod", scope: !1253, file: !1253, line: 118, type: !1707, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1707 = !DISubroutineType(types: !1708)
!1708 = !{!1262, !1682, !1709}
!1709 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1710)
!1710 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !366, size: 64)
!1711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1712, file: !1599, line: 167)
!1712 = !DISubprogram(name: "strtol", scope: !1253, file: !1253, line: 177, type: !1713, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1713 = !DISubroutineType(types: !1714)
!1714 = !{!1096, !1682, !1709, !582}
!1715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1716, file: !1599, line: 168)
!1716 = !DISubprogram(name: "strtoul", scope: !1253, file: !1253, line: 181, type: !1717, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1717 = !DISubroutineType(types: !1718)
!1718 = !{!17, !1682, !1709, !582}
!1719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1720, file: !1599, line: 169)
!1720 = !DISubprogram(name: "system", scope: !1253, file: !1253, line: 791, type: !1626, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1722, file: !1599, line: 171)
!1722 = !DISubprogram(name: "wcstombs", scope: !1253, file: !1253, line: 945, type: !1723, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1723 = !DISubroutineType(types: !1724)
!1724 = !{!15, !1725, !1726, !15}
!1725 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !366)
!1726 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1727)
!1727 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1728, size: 64)
!1728 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1681)
!1729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1730, file: !1599, line: 172)
!1730 = !DISubprogram(name: "wctomb", scope: !1253, file: !1253, line: 937, type: !1731, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1731 = !DISubroutineType(types: !1732)
!1732 = !{!582, !366, !1681}
!1733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !1734, file: !1599, line: 200)
!1734 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1253, line: 81, baseType: !1735)
!1735 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1253, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !1736, identifier: "_ZTS7lldiv_t")
!1736 = !{!1737, !1738}
!1737 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1735, file: !1253, line: 79, baseType: !1443, size: 64)
!1738 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1735, file: !1253, line: 80, baseType: !1443, size: 64, offset: 64)
!1739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !1740, file: !1599, line: 206)
!1740 = !DISubprogram(name: "_Exit", scope: !1253, file: !1253, line: 636, type: !1649, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !1742, file: !1599, line: 210)
!1742 = !DISubprogram(name: "llabs", scope: !1253, file: !1253, line: 852, type: !1743, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1743 = !DISubroutineType(types: !1744)
!1744 = !{!1443, !1443}
!1745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !1746, file: !1599, line: 216)
!1746 = !DISubprogram(name: "lldiv", scope: !1253, file: !1253, line: 866, type: !1747, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1747 = !DISubroutineType(types: !1748)
!1748 = !{!1734, !1443, !1443}
!1749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !1750, file: !1599, line: 227)
!1750 = !DISubprogram(name: "atoll", scope: !1253, file: !1253, line: 374, type: !1751, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1751 = !DISubroutineType(types: !1752)
!1752 = !{!1443, !399}
!1753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !1754, file: !1599, line: 228)
!1754 = !DISubprogram(name: "strtoll", scope: !1253, file: !1253, line: 201, type: !1755, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1755 = !DISubroutineType(types: !1756)
!1756 = !{!1443, !1682, !1709, !582}
!1757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !1758, file: !1599, line: 229)
!1758 = !DISubprogram(name: "strtoull", scope: !1253, file: !1253, line: 206, type: !1759, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1759 = !DISubroutineType(types: !1760)
!1760 = !{!1761, !1682, !1709, !582}
!1761 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!1762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !1763, file: !1599, line: 231)
!1763 = !DISubprogram(name: "strtof", scope: !1253, file: !1253, line: 124, type: !1764, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1764 = !DISubroutineType(types: !1765)
!1765 = !{!1321, !1682, !1709}
!1766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !1767, file: !1599, line: 232)
!1767 = !DISubprogram(name: "strtold", scope: !1253, file: !1253, line: 127, type: !1768, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1768 = !DISubroutineType(types: !1769)
!1769 = !{!1332, !1682, !1709}
!1770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1734, file: !1599, line: 240)
!1771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1740, file: !1599, line: 242)
!1772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1742, file: !1599, line: 244)
!1773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1774, file: !1599, line: 245)
!1774 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !356, file: !1599, line: 213, type: !1747, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1746, file: !1599, line: 246)
!1776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1750, file: !1599, line: 248)
!1777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1763, file: !1599, line: 249)
!1778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1754, file: !1599, line: 250)
!1779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1758, file: !1599, line: 251)
!1780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1767, file: !1599, line: 252)
!1781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1607, file: !1782, line: 38)
!1782 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "ce88caced6ed945413de73c65016f4c2")
!1783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1615, file: !1782, line: 39)
!1784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1648, file: !1782, line: 40)
!1785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1620, file: !1782, line: 43)
!1786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1692, file: !1782, line: 46)
!1787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1597, file: !1782, line: 51)
!1788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1601, file: !1782, line: 52)
!1789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1790, file: !1782, line: 54)
!1790 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !27, file: !1256, line: 79, type: !1330, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1622, file: !1782, line: 55)
!1792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1625, file: !1782, line: 56)
!1793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1629, file: !1782, line: 57)
!1794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1633, file: !1782, line: 58)
!1795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1642, file: !1782, line: 59)
!1796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1774, file: !1782, line: 60)
!1797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1652, file: !1782, line: 61)
!1798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1656, file: !1782, line: 62)
!1799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1660, file: !1782, line: 63)
!1800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1664, file: !1782, line: 64)
!1801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1668, file: !1782, line: 65)
!1802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1672, file: !1782, line: 67)
!1803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1676, file: !1782, line: 68)
!1804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1684, file: !1782, line: 69)
!1805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1688, file: !1782, line: 71)
!1806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1694, file: !1782, line: 72)
!1807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1698, file: !1782, line: 73)
!1808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1702, file: !1782, line: 74)
!1809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1706, file: !1782, line: 75)
!1810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1712, file: !1782, line: 76)
!1811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1716, file: !1782, line: 77)
!1812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1720, file: !1782, line: 78)
!1813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1722, file: !1782, line: 80)
!1814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !248, entity: !1730, file: !1782, line: 81)
!1815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1816, file: !1817, line: 200)
!1816 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !1817, file: !1817, line: 28, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1817 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!1818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1819, file: !1817, line: 201)
!1819 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !1817, file: !1817, line: 32, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1821, file: !1817, line: 202)
!1821 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !1817, file: !1817, line: 34, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1823, file: !1817, line: 203)
!1823 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !1817, file: !1817, line: 36, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1825, file: !1817, line: 204)
!1825 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !1817, file: !1817, line: 38, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1827, file: !1817, line: 205)
!1827 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !1817, file: !1817, line: 42, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1829, file: !1817, line: 206)
!1829 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !1817, file: !1817, line: 40, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1831, file: !1817, line: 207)
!1831 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !1817, file: !1817, line: 44, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1833, file: !1817, line: 208)
!1833 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !1817, file: !1817, line: 46, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1835, file: !1817, line: 209)
!1835 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !1817, file: !1817, line: 48, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1837, file: !1817, line: 210)
!1837 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !1817, file: !1817, line: 50, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1839, file: !1817, line: 211)
!1839 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !1817, file: !1817, line: 52, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1841, file: !1817, line: 212)
!1841 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !1817, file: !1817, line: 54, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1843, file: !1817, line: 213)
!1843 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !1817, file: !1817, line: 58, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1845, file: !1817, line: 214)
!1845 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !1817, file: !1817, line: 56, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1847, file: !1817, line: 215)
!1847 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !1817, file: !1817, line: 62, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1849, file: !1817, line: 216)
!1849 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !1817, file: !1817, line: 60, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1851, file: !1817, line: 217)
!1851 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !1817, file: !1817, line: 64, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1853, file: !1817, line: 218)
!1853 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !1817, file: !1817, line: 66, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1855, file: !1817, line: 219)
!1855 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !1817, file: !1817, line: 68, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1857, file: !1817, line: 220)
!1857 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !1817, file: !1817, line: 70, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1859, file: !1817, line: 221)
!1859 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !1817, file: !1817, line: 72, type: !1397, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1861, file: !1817, line: 222)
!1861 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !1817, file: !1817, line: 74, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1863, file: !1817, line: 223)
!1863 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !1817, file: !1817, line: 76, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1865, file: !1817, line: 224)
!1865 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !1817, file: !1817, line: 78, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1867, file: !1817, line: 225)
!1867 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !1817, file: !1817, line: 80, type: !1427, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1869, file: !1817, line: 226)
!1869 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !1817, file: !1817, line: 82, type: !1870, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1870 = !DISubroutineType(types: !1871)
!1871 = !{!1321, !1321, !1290}
!1872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1873, file: !1817, line: 227)
!1873 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !1817, file: !1817, line: 84, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1875, file: !1817, line: 228)
!1875 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !1817, file: !1817, line: 86, type: !1427, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1877, file: !1817, line: 229)
!1877 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !1817, file: !1817, line: 91, type: !1878, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1878 = !DISubroutineType(types: !1879)
!1879 = !{!145, !1321}
!1880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1881, file: !1817, line: 230)
!1881 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !1817, file: !1817, line: 95, type: !1882, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1882 = !DISubroutineType(types: !1883)
!1883 = !{!145, !1321, !1321}
!1884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1885, file: !1817, line: 231)
!1885 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !1817, file: !1817, line: 94, type: !1882, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1887, file: !1817, line: 232)
!1887 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !1817, file: !1817, line: 100, type: !1878, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1889, file: !1817, line: 233)
!1889 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !1817, file: !1817, line: 104, type: !1882, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1891, file: !1817, line: 234)
!1891 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !1817, file: !1817, line: 103, type: !1882, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1893, file: !1817, line: 235)
!1893 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !1817, file: !1817, line: 106, type: !1882, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1895, file: !1817, line: 236)
!1895 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !1817, file: !1817, line: 111, type: !1878, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1897, file: !1817, line: 237)
!1897 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !1817, file: !1817, line: 113, type: !1878, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1899, file: !1817, line: 238)
!1899 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !1817, file: !1817, line: 115, type: !1882, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1901, file: !1817, line: 239)
!1901 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !1817, file: !1817, line: 116, type: !1661, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1903, file: !1817, line: 240)
!1903 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !1817, file: !1817, line: 118, type: !1574, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1905, file: !1817, line: 241)
!1905 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !1817, file: !1817, line: 120, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1907, file: !1817, line: 242)
!1907 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !1817, file: !1817, line: 121, type: !1743, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1909, file: !1817, line: 243)
!1909 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !1817, file: !1817, line: 123, type: !1446, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1911, file: !1817, line: 244)
!1911 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !1817, file: !1817, line: 133, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1913, file: !1817, line: 245)
!1913 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !1817, file: !1817, line: 125, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1915, file: !1817, line: 246)
!1915 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !1817, file: !1817, line: 127, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1917, file: !1817, line: 247)
!1917 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !1817, file: !1817, line: 129, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1919, file: !1817, line: 248)
!1919 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !1817, file: !1817, line: 131, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1921, file: !1817, line: 249)
!1921 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !1817, file: !1817, line: 135, type: !1482, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1923, file: !1817, line: 250)
!1923 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !1817, file: !1817, line: 137, type: !1482, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1925, file: !1817, line: 251)
!1925 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !1817, file: !1817, line: 138, type: !1446, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1927, file: !1817, line: 252)
!1927 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !1817, file: !1817, line: 140, type: !1928, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1928 = !DISubroutineType(types: !1929)
!1929 = !{!1321, !1321, !1930}
!1930 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1321, size: 64)
!1931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1932, file: !1817, line: 253)
!1932 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !1817, file: !1817, line: 141, type: !1496, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1934, file: !1817, line: 254)
!1934 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !1817, file: !1817, line: 142, type: !1500, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1936, file: !1817, line: 255)
!1936 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !1817, file: !1817, line: 144, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1938, file: !1817, line: 256)
!1938 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !1817, file: !1817, line: 146, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1940, file: !1817, line: 257)
!1940 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !1817, file: !1817, line: 150, type: !1574, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1942, file: !1817, line: 258)
!1942 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !1817, file: !1817, line: 152, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1944, file: !1817, line: 259)
!1944 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !1817, file: !1817, line: 154, type: !1540, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1946, file: !1817, line: 260)
!1946 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !1817, file: !1817, line: 156, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1948, file: !1817, line: 261)
!1948 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !1817, file: !1817, line: 158, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1950, file: !1817, line: 262)
!1950 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !1817, file: !1817, line: 160, type: !1564, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1952, file: !1817, line: 263)
!1952 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !1817, file: !1817, line: 162, type: !1574, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1954, file: !1817, line: 264)
!1954 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !1817, file: !1817, line: 167, type: !1878, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1956, file: !1817, line: 265)
!1956 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !1817, file: !1817, line: 169, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1958, file: !1817, line: 266)
!1958 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !1817, file: !1817, line: 171, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1960, file: !1817, line: 267)
!1960 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !1817, file: !1817, line: 173, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1962, file: !1817, line: 268)
!1962 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !1817, file: !1817, line: 175, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1964, file: !1817, line: 269)
!1964 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !1817, file: !1817, line: 177, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1966, file: !1817, line: 270)
!1966 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !1817, file: !1817, line: 179, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1968, file: !1817, line: 271)
!1968 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !1817, file: !1817, line: 181, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1970, file: !1972, line: 729)
!1970 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !1971, file: !1971, line: 188, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1971 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "77b108a711ff1d970d6aaeeab7921660")
!1972 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "0af09435178b3f6de185f06c3a9cbb63")
!1973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1974, file: !1972, line: 730)
!1974 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !1971, file: !1971, line: 191, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1976, file: !1972, line: 731)
!1976 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !1971, file: !1971, line: 194, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1978, file: !1972, line: 732)
!1978 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !1971, file: !1971, line: 197, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1980, file: !1972, line: 733)
!1980 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !1971, file: !1971, line: 200, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1982, file: !1972, line: 734)
!1982 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !1971, file: !1971, line: 203, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1984, file: !1972, line: 735)
!1984 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !1971, file: !1971, line: 206, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1986, file: !1972, line: 736)
!1986 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !1971, file: !1971, line: 209, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1988, file: !1972, line: 737)
!1988 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !1971, file: !1971, line: 212, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1990, file: !1972, line: 738)
!1990 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !1971, file: !1971, line: 215, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1992, file: !1972, line: 739)
!1992 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !1971, file: !1971, line: 218, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1994, file: !1972, line: 740)
!1994 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !1971, file: !1971, line: 221, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1996, file: !1972, line: 741)
!1996 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !1971, file: !1971, line: 233, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1998, file: !1972, line: 742)
!1998 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !1971, file: !1971, line: 242, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2000, file: !1972, line: 743)
!2000 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !1971, file: !1971, line: 251, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2002, file: !1972, line: 744)
!2002 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !1971, file: !1971, line: 254, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2004, file: !1972, line: 745)
!2004 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !1971, file: !1971, line: 257, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2006, file: !1972, line: 746)
!2006 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !1971, file: !1971, line: 260, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2008, file: !1972, line: 747)
!2008 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !1971, file: !1971, line: 263, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2010, file: !1972, line: 748)
!2010 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !1971, file: !1971, line: 269, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2012, file: !1972, line: 749)
!2012 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !1971, file: !1971, line: 272, type: !1397, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2014, file: !1972, line: 750)
!2014 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !1971, file: !1971, line: 277, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2016, file: !1972, line: 751)
!2016 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !1971, file: !1971, line: 280, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2018, file: !1972, line: 752)
!2018 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !1971, file: !1971, line: 283, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2020, file: !1972, line: 753)
!2020 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !1971, file: !1971, line: 286, type: !1870, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2022, file: !1972, line: 754)
!2022 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !1971, file: !1971, line: 299, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2024, file: !1972, line: 755)
!2024 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !1971, file: !1971, line: 302, type: !1427, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2026, file: !1972, line: 756)
!2026 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !1971, file: !1971, line: 341, type: !1574, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2028, file: !1972, line: 757)
!2028 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !1971, file: !1971, line: 344, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2030, file: !1972, line: 758)
!2030 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !1971, file: !1971, line: 347, type: !1446, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2032, file: !1972, line: 759)
!2032 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !1971, file: !1971, line: 350, type: !1446, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2034, file: !1972, line: 760)
!2034 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !1971, file: !1971, line: 353, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2036, file: !1972, line: 761)
!2036 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !1971, file: !1971, line: 356, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2038, file: !1972, line: 762)
!2038 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !1971, file: !1971, line: 359, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2040, file: !1972, line: 763)
!2040 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !1971, file: !1971, line: 365, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2042, file: !1972, line: 764)
!2042 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !1971, file: !1971, line: 368, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2044, file: !1972, line: 765)
!2044 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !1971, file: !1971, line: 371, type: !1482, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2046, file: !1972, line: 766)
!2046 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !1971, file: !1971, line: 374, type: !1482, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2048, file: !1972, line: 767)
!2048 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !1971, file: !1971, line: 377, type: !1928, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2050, file: !1972, line: 768)
!2050 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !1971, file: !1971, line: 413, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2052, file: !1972, line: 769)
!2052 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !1971, file: !1971, line: 416, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2054, file: !1972, line: 771)
!2054 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !1971, file: !1971, line: 449, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2056, file: !1972, line: 772)
!2056 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !1971, file: !1971, line: 474, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2058, file: !1972, line: 773)
!2058 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !1971, file: !1971, line: 479, type: !1540, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2060, file: !1972, line: 774)
!2060 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !1971, file: !1971, line: 495, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2062, file: !1972, line: 775)
!2062 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !1971, file: !1971, line: 520, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2064, file: !1972, line: 776)
!2064 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !1971, file: !1971, line: 526, type: !1564, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2066, file: !1972, line: 777)
!2066 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !1971, file: !1971, line: 532, type: !1574, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2068, file: !1972, line: 778)
!2068 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !1971, file: !1971, line: 560, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2070, file: !1972, line: 779)
!2070 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !1971, file: !1971, line: 563, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2072, file: !1972, line: 780)
!2072 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !1971, file: !1971, line: 569, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2074, file: !1972, line: 781)
!2074 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !1971, file: !1971, line: 572, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2076, file: !1972, line: 782)
!2076 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !1971, file: !1971, line: 575, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2078, file: !1972, line: 783)
!2078 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !1971, file: !1971, line: 578, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2080, file: !1972, line: 784)
!2080 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !1971, file: !1971, line: 581, type: !1326, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2082, file: !2083, line: 68)
!2082 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !2084, file: !2083, line: 90, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!2083 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "e8a32dcadc5d06d341e371fb480b7b44")
!2084 = !DINamespace(name: "__exception_ptr", scope: !27)
!2085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2084, entity: !2086, file: !2083, line: 84)
!2086 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !27, file: !2083, line: 80, type: !2087, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!2087 = !DISubroutineType(types: !2088)
!2088 = !{null, !2082}
!2089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2090, file: !2105, line: 64)
!2090 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !2091, line: 6, baseType: !2092)
!2091 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!2092 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !2093, line: 21, baseType: !2094)
!2093 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!2094 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2093, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !2095, identifier: "_ZTS11__mbstate_t")
!2095 = !{!2096, !2097}
!2096 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !2094, file: !2093, line: 15, baseType: !582, size: 32)
!2097 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !2094, file: !2093, line: 20, baseType: !2098, size: 32, offset: 32)
!2098 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2094, file: !2093, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !2099, identifier: "_ZTSN11__mbstate_tUt_E")
!2099 = !{!2100, !2101}
!2100 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !2098, file: !2093, line: 18, baseType: !96, size: 32)
!2101 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !2098, file: !2093, line: 19, baseType: !2102, size: 32)
!2102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !187, size: 32, elements: !2103)
!2103 = !{!2104}
!2104 = !DISubrange(count: 4)
!2105 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cwchar", directory: "")
!2106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2107, file: !2105, line: 141)
!2107 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !2108, line: 20, baseType: !96)
!2108 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!2109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2110, file: !2105, line: 143)
!2110 = !DISubprogram(name: "btowc", scope: !2111, file: !2111, line: 319, type: !2112, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2111 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "484b7adbbc849bb51cdbcb2d985b07a0")
!2112 = !DISubroutineType(types: !2113)
!2113 = !{!2107, !582}
!2114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2115, file: !2105, line: 144)
!2115 = !DISubprogram(name: "fgetwc", scope: !2111, file: !2111, line: 744, type: !2116, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2116 = !DISubroutineType(types: !2117)
!2117 = !{!2107, !2118}
!2118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2119, size: 64)
!2119 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !2120, line: 5, baseType: !2121)
!2120 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!2121 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !2122, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !2123, identifier: "_ZTS8_IO_FILE")
!2122 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!2123 = !{!2124, !2125, !2126, !2127, !2128, !2129, !2130, !2131, !2132, !2133, !2134, !2135, !2136, !2139, !2141, !2142, !2143, !2145, !2146, !2148, !2152, !2155, !2157, !2160, !2163, !2164, !2165, !2166, !2167}
!2124 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !2121, file: !2122, line: 51, baseType: !582, size: 32)
!2125 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !2121, file: !2122, line: 54, baseType: !366, size: 64, offset: 64)
!2126 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !2121, file: !2122, line: 55, baseType: !366, size: 64, offset: 128)
!2127 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !2121, file: !2122, line: 56, baseType: !366, size: 64, offset: 192)
!2128 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !2121, file: !2122, line: 57, baseType: !366, size: 64, offset: 256)
!2129 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !2121, file: !2122, line: 58, baseType: !366, size: 64, offset: 320)
!2130 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !2121, file: !2122, line: 59, baseType: !366, size: 64, offset: 384)
!2131 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !2121, file: !2122, line: 60, baseType: !366, size: 64, offset: 448)
!2132 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !2121, file: !2122, line: 61, baseType: !366, size: 64, offset: 512)
!2133 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !2121, file: !2122, line: 64, baseType: !366, size: 64, offset: 576)
!2134 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !2121, file: !2122, line: 65, baseType: !366, size: 64, offset: 640)
!2135 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !2121, file: !2122, line: 66, baseType: !366, size: 64, offset: 704)
!2136 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !2121, file: !2122, line: 68, baseType: !2137, size: 64, offset: 768)
!2137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2138, size: 64)
!2138 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !2122, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!2139 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !2121, file: !2122, line: 70, baseType: !2140, size: 64, offset: 832)
!2140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2121, size: 64)
!2141 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !2121, file: !2122, line: 72, baseType: !582, size: 32, offset: 896)
!2142 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !2121, file: !2122, line: 73, baseType: !582, size: 32, offset: 928)
!2143 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !2121, file: !2122, line: 74, baseType: !2144, size: 64, offset: 960)
!2144 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !35, line: 152, baseType: !1096)
!2145 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !2121, file: !2122, line: 77, baseType: !36, size: 16, offset: 1024)
!2146 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !2121, file: !2122, line: 78, baseType: !2147, size: 8, offset: 1040)
!2147 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!2148 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !2121, file: !2122, line: 79, baseType: !2149, size: 8, offset: 1048)
!2149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !187, size: 8, elements: !2150)
!2150 = !{!2151}
!2151 = !DISubrange(count: 1)
!2152 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !2121, file: !2122, line: 81, baseType: !2153, size: 64, offset: 1088)
!2153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2154, size: 64)
!2154 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !2122, line: 43, baseType: null)
!2155 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !2121, file: !2122, line: 89, baseType: !2156, size: 64, offset: 1152)
!2156 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !35, line: 153, baseType: !1096)
!2157 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !2121, file: !2122, line: 91, baseType: !2158, size: 64, offset: 1216)
!2158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2159, size: 64)
!2159 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !2122, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!2160 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !2121, file: !2122, line: 92, baseType: !2161, size: 64, offset: 1280)
!2161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2162, size: 64)
!2162 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !2122, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!2163 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !2121, file: !2122, line: 93, baseType: !2140, size: 64, offset: 1344)
!2164 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !2121, file: !2122, line: 94, baseType: !82, size: 64, offset: 1408)
!2165 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !2121, file: !2122, line: 95, baseType: !15, size: 64, offset: 1472)
!2166 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !2121, file: !2122, line: 96, baseType: !582, size: 32, offset: 1536)
!2167 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !2121, file: !2122, line: 98, baseType: !2168, size: 160, offset: 1568)
!2168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !187, size: 160, elements: !198)
!2169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2170, file: !2105, line: 145)
!2170 = !DISubprogram(name: "fgetws", scope: !2111, file: !2111, line: 773, type: !2171, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2171 = !DISubroutineType(types: !2172)
!2172 = !{!1680, !1679, !582, !2173}
!2173 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2118)
!2174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2175, file: !2105, line: 146)
!2175 = !DISubprogram(name: "fputwc", scope: !2111, file: !2111, line: 758, type: !2176, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2176 = !DISubroutineType(types: !2177)
!2177 = !{!2107, !1681, !2118}
!2178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2179, file: !2105, line: 147)
!2179 = !DISubprogram(name: "fputws", scope: !2111, file: !2111, line: 780, type: !2180, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2180 = !DISubroutineType(types: !2181)
!2181 = !{!582, !1726, !2173}
!2182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2183, file: !2105, line: 148)
!2183 = !DISubprogram(name: "fwide", scope: !2111, file: !2111, line: 588, type: !2184, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2184 = !DISubroutineType(types: !2185)
!2185 = !{!582, !2118, !582}
!2186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2187, file: !2105, line: 149)
!2187 = !DISubprogram(name: "fwprintf", scope: !2111, file: !2111, line: 595, type: !2188, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2188 = !DISubroutineType(types: !2189)
!2189 = !{!582, !2173, !1726, null}
!2190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2191, file: !2105, line: 150)
!2191 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !2111, file: !2111, line: 657, type: !2188, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2193, file: !2105, line: 151)
!2193 = !DISubprogram(name: "getwc", scope: !2111, file: !2111, line: 745, type: !2116, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2195, file: !2105, line: 152)
!2195 = !DISubprogram(name: "getwchar", scope: !2111, file: !2111, line: 751, type: !2196, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2196 = !DISubroutineType(types: !2197)
!2197 = !{!2107}
!2198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2199, file: !2105, line: 153)
!2199 = !DISubprogram(name: "mbrlen", scope: !2111, file: !2111, line: 330, type: !2200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2200 = !DISubroutineType(types: !2201)
!2201 = !{!15, !1682, !15, !2202}
!2202 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2203)
!2203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2090, size: 64)
!2204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2205, file: !2105, line: 154)
!2205 = !DISubprogram(name: "mbrtowc", scope: !2111, file: !2111, line: 297, type: !2206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2206 = !DISubroutineType(types: !2207)
!2207 = !{!15, !1679, !1682, !15, !2202}
!2208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2209, file: !2105, line: 155)
!2209 = !DISubprogram(name: "mbsinit", scope: !2111, file: !2111, line: 293, type: !2210, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2210 = !DISubroutineType(types: !2211)
!2211 = !{!582, !2212}
!2212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2213, size: 64)
!2213 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2090)
!2214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2215, file: !2105, line: 156)
!2215 = !DISubprogram(name: "mbsrtowcs", scope: !2111, file: !2111, line: 338, type: !2216, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2216 = !DISubroutineType(types: !2217)
!2217 = !{!15, !1679, !2218, !15, !2202}
!2218 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2219)
!2219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !399, size: 64)
!2220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2221, file: !2105, line: 157)
!2221 = !DISubprogram(name: "putwc", scope: !2111, file: !2111, line: 759, type: !2176, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2223, file: !2105, line: 158)
!2223 = !DISubprogram(name: "putwchar", scope: !2111, file: !2111, line: 765, type: !2224, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2224 = !DISubroutineType(types: !2225)
!2225 = !{!2107, !1681}
!2226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2227, file: !2105, line: 160)
!2227 = !DISubprogram(name: "swprintf", scope: !2111, file: !2111, line: 605, type: !2228, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2228 = !DISubroutineType(types: !2229)
!2229 = !{!582, !1679, !15, !1726, null}
!2230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2231, file: !2105, line: 162)
!2231 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !2111, file: !2111, line: 664, type: !2232, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2232 = !DISubroutineType(types: !2233)
!2233 = !{!582, !1726, !1726, null}
!2234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2235, file: !2105, line: 163)
!2235 = !DISubprogram(name: "ungetwc", scope: !2111, file: !2111, line: 788, type: !2236, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2236 = !DISubroutineType(types: !2237)
!2237 = !{!2107, !2107, !2118}
!2238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2239, file: !2105, line: 164)
!2239 = !DISubprogram(name: "vfwprintf", scope: !2111, file: !2111, line: 613, type: !2240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2240 = !DISubroutineType(types: !2241)
!2241 = !{!582, !2173, !1726, !2242}
!2242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2243, size: 64)
!2243 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !2244, size: 192, flags: DIFlagTypePassByValue, elements: !2245, identifier: "_ZTS13__va_list_tag")
!2244 = !DIFile(filename: "defs.cpp", directory: "/home/oster/repos/scabbard/libtrace/src")
!2245 = !{!2246, !2247, !2248, !2249}
!2246 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !2243, file: !2244, baseType: !96, size: 32)
!2247 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !2243, file: !2244, baseType: !96, size: 32, offset: 32)
!2248 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !2243, file: !2244, baseType: !82, size: 64, offset: 64)
!2249 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !2243, file: !2244, baseType: !82, size: 64, offset: 128)
!2250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2251, file: !2105, line: 166)
!2251 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !2111, file: !2111, line: 711, type: !2240, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2253, file: !2105, line: 169)
!2253 = !DISubprogram(name: "vswprintf", scope: !2111, file: !2111, line: 626, type: !2254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2254 = !DISubroutineType(types: !2255)
!2255 = !{!582, !1679, !15, !1726, !2242}
!2256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2257, file: !2105, line: 172)
!2257 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !2111, file: !2111, line: 718, type: !2258, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2258 = !DISubroutineType(types: !2259)
!2259 = !{!582, !1726, !1726, !2242}
!2260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2261, file: !2105, line: 174)
!2261 = !DISubprogram(name: "vwprintf", scope: !2111, file: !2111, line: 621, type: !2262, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2262 = !DISubroutineType(types: !2263)
!2263 = !{!582, !1726, !2242}
!2264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2265, file: !2105, line: 176)
!2265 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !2111, file: !2111, line: 715, type: !2262, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2267, file: !2105, line: 178)
!2267 = !DISubprogram(name: "wcrtomb", scope: !2111, file: !2111, line: 302, type: !2268, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2268 = !DISubroutineType(types: !2269)
!2269 = !{!15, !1725, !1681, !2202}
!2270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2271, file: !2105, line: 179)
!2271 = !DISubprogram(name: "wcscat", scope: !2111, file: !2111, line: 97, type: !2272, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2272 = !DISubroutineType(types: !2273)
!2273 = !{!1680, !1679, !1726}
!2274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2275, file: !2105, line: 180)
!2275 = !DISubprogram(name: "wcscmp", scope: !2111, file: !2111, line: 106, type: !2276, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2276 = !DISubroutineType(types: !2277)
!2277 = !{!582, !1727, !1727}
!2278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2279, file: !2105, line: 181)
!2279 = !DISubprogram(name: "wcscoll", scope: !2111, file: !2111, line: 131, type: !2276, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2281, file: !2105, line: 182)
!2281 = !DISubprogram(name: "wcscpy", scope: !2111, file: !2111, line: 87, type: !2272, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2283, file: !2105, line: 183)
!2283 = !DISubprogram(name: "wcscspn", scope: !2111, file: !2111, line: 188, type: !2284, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2284 = !DISubroutineType(types: !2285)
!2285 = !{!15, !1727, !1727}
!2286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2287, file: !2105, line: 184)
!2287 = !DISubprogram(name: "wcsftime", scope: !2111, file: !2111, line: 852, type: !2288, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2288 = !DISubroutineType(types: !2289)
!2289 = !{!15, !1679, !15, !1726, !2290}
!2290 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2291)
!2291 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2292, size: 64)
!2292 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2293)
!2293 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !2111, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!2294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2295, file: !2105, line: 185)
!2295 = !DISubprogram(name: "wcslen", scope: !2111, file: !2111, line: 223, type: !2296, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2296 = !DISubroutineType(types: !2297)
!2297 = !{!15, !1727}
!2298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2299, file: !2105, line: 186)
!2299 = !DISubprogram(name: "wcsncat", scope: !2111, file: !2111, line: 101, type: !2300, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2300 = !DISubroutineType(types: !2301)
!2301 = !{!1680, !1679, !1726, !15}
!2302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2303, file: !2105, line: 187)
!2303 = !DISubprogram(name: "wcsncmp", scope: !2111, file: !2111, line: 109, type: !2304, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2304 = !DISubroutineType(types: !2305)
!2305 = !{!582, !1727, !1727, !15}
!2306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2307, file: !2105, line: 188)
!2307 = !DISubprogram(name: "wcsncpy", scope: !2111, file: !2111, line: 92, type: !2300, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2309, file: !2105, line: 189)
!2309 = !DISubprogram(name: "wcsrtombs", scope: !2111, file: !2111, line: 344, type: !2310, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2310 = !DISubroutineType(types: !2311)
!2311 = !{!15, !1725, !2312, !15, !2202}
!2312 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2313)
!2313 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1727, size: 64)
!2314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2315, file: !2105, line: 190)
!2315 = !DISubprogram(name: "wcsspn", scope: !2111, file: !2111, line: 192, type: !2284, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2317, file: !2105, line: 191)
!2317 = !DISubprogram(name: "wcstod", scope: !2111, file: !2111, line: 378, type: !2318, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2318 = !DISubroutineType(types: !2319)
!2319 = !{!1262, !1726, !2320}
!2320 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2321)
!2321 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1680, size: 64)
!2322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2323, file: !2105, line: 193)
!2323 = !DISubprogram(name: "wcstof", scope: !2111, file: !2111, line: 383, type: !2324, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2324 = !DISubroutineType(types: !2325)
!2325 = !{!1321, !1726, !2320}
!2326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2327, file: !2105, line: 195)
!2327 = !DISubprogram(name: "wcstok", scope: !2111, file: !2111, line: 218, type: !2328, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2328 = !DISubroutineType(types: !2329)
!2329 = !{!1680, !1679, !1726, !2320}
!2330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2331, file: !2105, line: 196)
!2331 = !DISubprogram(name: "wcstol", scope: !2111, file: !2111, line: 429, type: !2332, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2332 = !DISubroutineType(types: !2333)
!2333 = !{!1096, !1726, !2320, !582}
!2334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2335, file: !2105, line: 197)
!2335 = !DISubprogram(name: "wcstoul", scope: !2111, file: !2111, line: 434, type: !2336, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2336 = !DISubroutineType(types: !2337)
!2337 = !{!17, !1726, !2320, !582}
!2338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2339, file: !2105, line: 198)
!2339 = !DISubprogram(name: "wcsxfrm", scope: !2111, file: !2111, line: 135, type: !2340, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2340 = !DISubroutineType(types: !2341)
!2341 = !{!15, !1679, !1726, !15}
!2342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2343, file: !2105, line: 199)
!2343 = !DISubprogram(name: "wctob", scope: !2111, file: !2111, line: 325, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2344 = !DISubroutineType(types: !2345)
!2345 = !{!582, !2107}
!2346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2347, file: !2105, line: 200)
!2347 = !DISubprogram(name: "wmemcmp", scope: !2111, file: !2111, line: 259, type: !2304, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2349, file: !2105, line: 201)
!2349 = !DISubprogram(name: "wmemcpy", scope: !2111, file: !2111, line: 263, type: !2300, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2351, file: !2105, line: 202)
!2351 = !DISubprogram(name: "wmemmove", scope: !2111, file: !2111, line: 268, type: !2352, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2352 = !DISubroutineType(types: !2353)
!2353 = !{!1680, !1680, !1727, !15}
!2354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2355, file: !2105, line: 203)
!2355 = !DISubprogram(name: "wmemset", scope: !2111, file: !2111, line: 272, type: !2356, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2356 = !DISubroutineType(types: !2357)
!2357 = !{!1680, !1680, !1681, !15}
!2358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2359, file: !2105, line: 204)
!2359 = !DISubprogram(name: "wprintf", scope: !2111, file: !2111, line: 602, type: !2360, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2360 = !DISubroutineType(types: !2361)
!2361 = !{!582, !1726, null}
!2362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2363, file: !2105, line: 205)
!2363 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !2111, file: !2111, line: 661, type: !2360, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2365, file: !2105, line: 206)
!2365 = !DISubprogram(name: "wcschr", scope: !2111, file: !2111, line: 165, type: !2366, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2366 = !DISubroutineType(types: !2367)
!2367 = !{!1680, !1727, !1681}
!2368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2369, file: !2105, line: 207)
!2369 = !DISubprogram(name: "wcspbrk", scope: !2111, file: !2111, line: 202, type: !2370, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2370 = !DISubroutineType(types: !2371)
!2371 = !{!1680, !1727, !1727}
!2372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2373, file: !2105, line: 208)
!2373 = !DISubprogram(name: "wcsrchr", scope: !2111, file: !2111, line: 175, type: !2366, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2375, file: !2105, line: 209)
!2375 = !DISubprogram(name: "wcsstr", scope: !2111, file: !2111, line: 213, type: !2370, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2377, file: !2105, line: 210)
!2377 = !DISubprogram(name: "wmemchr", scope: !2111, file: !2111, line: 254, type: !2378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2378 = !DISubroutineType(types: !2379)
!2379 = !{!1680, !1727, !1681, !15}
!2380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !2381, file: !2105, line: 251)
!2381 = !DISubprogram(name: "wcstold", scope: !2111, file: !2111, line: 385, type: !2382, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2382 = !DISubroutineType(types: !2383)
!2383 = !{!1332, !1726, !2320}
!2384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !2385, file: !2105, line: 260)
!2385 = !DISubprogram(name: "wcstoll", scope: !2111, file: !2111, line: 442, type: !2386, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2386 = !DISubroutineType(types: !2387)
!2387 = !{!1443, !1726, !2320, !582}
!2388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !2389, file: !2105, line: 261)
!2389 = !DISubprogram(name: "wcstoull", scope: !2111, file: !2111, line: 449, type: !2390, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2390 = !DISubroutineType(types: !2391)
!2391 = !{!1761, !1726, !2320, !582}
!2392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2381, file: !2105, line: 267)
!2393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2385, file: !2105, line: 268)
!2394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2389, file: !2105, line: 269)
!2395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2323, file: !2105, line: 283)
!2396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2251, file: !2105, line: 286)
!2397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2257, file: !2105, line: 289)
!2398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2265, file: !2105, line: 292)
!2399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2381, file: !2105, line: 296)
!2400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2385, file: !2105, line: 297)
!2401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2389, file: !2105, line: 298)
!2402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2403, file: !2406, line: 47)
!2403 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !2404, line: 24, baseType: !2405)
!2404 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!2405 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !35, line: 37, baseType: !2147)
!2406 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdint", directory: "")
!2407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2408, file: !2406, line: 48)
!2408 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !2404, line: 25, baseType: !2409)
!2409 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !35, line: 39, baseType: !2410)
!2410 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!2411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2412, file: !2406, line: 49)
!2412 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !2404, line: 26, baseType: !2413)
!2413 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !35, line: 41, baseType: !582)
!2414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2415, file: !2406, line: 50)
!2415 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !2404, line: 27, baseType: !2416)
!2416 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !35, line: 44, baseType: !1096)
!2417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2418, file: !2406, line: 52)
!2418 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1108, line: 58, baseType: !2147)
!2419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2420, file: !2406, line: 53)
!2420 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1108, line: 60, baseType: !1096)
!2421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2422, file: !2406, line: 54)
!2422 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1108, line: 61, baseType: !1096)
!2423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2424, file: !2406, line: 55)
!2424 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1108, line: 62, baseType: !1096)
!2425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2426, file: !2406, line: 57)
!2426 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1108, line: 43, baseType: !2427)
!2427 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !35, line: 52, baseType: !2405)
!2428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2429, file: !2406, line: 58)
!2429 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1108, line: 44, baseType: !2430)
!2430 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !35, line: 54, baseType: !2409)
!2431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2432, file: !2406, line: 59)
!2432 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1108, line: 45, baseType: !2433)
!2433 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !35, line: 56, baseType: !2413)
!2434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2435, file: !2406, line: 60)
!2435 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1108, line: 46, baseType: !2436)
!2436 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !35, line: 58, baseType: !2416)
!2437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1107, file: !2406, line: 62)
!2438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2439, file: !2406, line: 63)
!2439 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1108, line: 87, baseType: !1096)
!2440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2441, file: !2406, line: 65)
!2441 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !33, line: 24, baseType: !2442)
!2442 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !35, line: 38, baseType: !1097)
!2443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !32, file: !2406, line: 66)
!2444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !94, file: !2406, line: 67)
!2445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2446, file: !2406, line: 68)
!2446 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !33, line: 27, baseType: !2447)
!2447 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !35, line: 45, baseType: !17)
!2448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2449, file: !2406, line: 70)
!2449 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1108, line: 71, baseType: !1097)
!2450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2451, file: !2406, line: 71)
!2451 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1108, line: 73, baseType: !17)
!2452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2453, file: !2406, line: 72)
!2453 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1108, line: 74, baseType: !17)
!2454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2455, file: !2406, line: 73)
!2455 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1108, line: 75, baseType: !17)
!2456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2457, file: !2406, line: 75)
!2457 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1108, line: 49, baseType: !2458)
!2458 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !35, line: 53, baseType: !2442)
!2459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2460, file: !2406, line: 76)
!2460 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1108, line: 50, baseType: !2461)
!2461 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !35, line: 55, baseType: !34)
!2462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2463, file: !2406, line: 77)
!2463 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1108, line: 51, baseType: !2464)
!2464 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !35, line: 57, baseType: !95)
!2465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2466, file: !2406, line: 78)
!2466 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1108, line: 52, baseType: !2467)
!2467 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !35, line: 59, baseType: !2447)
!2468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2469, file: !2406, line: 80)
!2469 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1108, line: 102, baseType: !2470)
!2470 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !35, line: 73, baseType: !17)
!2471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2472, file: !2406, line: 81)
!2472 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1108, line: 90, baseType: !17)
!2473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2474, file: !2476, line: 53)
!2474 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !2475, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!2475 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a1d177e0f311dc60a74cb347049d75bc")
!2476 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/clocale", directory: "")
!2477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2478, file: !2476, line: 54)
!2478 = !DISubprogram(name: "setlocale", scope: !2475, file: !2475, line: 122, type: !2479, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2479 = !DISubroutineType(types: !2480)
!2480 = !{!366, !582, !399}
!2481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2482, file: !2476, line: 55)
!2482 = !DISubprogram(name: "localeconv", scope: !2475, file: !2475, line: 125, type: !2483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2483 = !DISubroutineType(types: !2484)
!2484 = !{!2485}
!2485 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2474, size: 64)
!2486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2487, file: !2489, line: 64)
!2487 = !DISubprogram(name: "isalnum", scope: !2488, file: !2488, line: 108, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2488 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "3ab3dd7fdf2578005732722ee2393e59")
!2489 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cctype", directory: "")
!2490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2491, file: !2489, line: 65)
!2491 = !DISubprogram(name: "isalpha", scope: !2488, file: !2488, line: 109, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2493, file: !2489, line: 66)
!2493 = !DISubprogram(name: "iscntrl", scope: !2488, file: !2488, line: 110, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2495, file: !2489, line: 67)
!2495 = !DISubprogram(name: "isdigit", scope: !2488, file: !2488, line: 111, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2497, file: !2489, line: 68)
!2497 = !DISubprogram(name: "isgraph", scope: !2488, file: !2488, line: 113, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2499, file: !2489, line: 69)
!2499 = !DISubprogram(name: "islower", scope: !2488, file: !2488, line: 112, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2501, file: !2489, line: 70)
!2501 = !DISubprogram(name: "isprint", scope: !2488, file: !2488, line: 114, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2503, file: !2489, line: 71)
!2503 = !DISubprogram(name: "ispunct", scope: !2488, file: !2488, line: 115, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2505, file: !2489, line: 72)
!2505 = !DISubprogram(name: "isspace", scope: !2488, file: !2488, line: 116, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2507, file: !2489, line: 73)
!2507 = !DISubprogram(name: "isupper", scope: !2488, file: !2488, line: 117, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2509, file: !2489, line: 74)
!2509 = !DISubprogram(name: "isxdigit", scope: !2488, file: !2488, line: 118, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2511, file: !2489, line: 75)
!2511 = !DISubprogram(name: "tolower", scope: !2488, file: !2488, line: 122, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2513, file: !2489, line: 76)
!2513 = !DISubprogram(name: "toupper", scope: !2488, file: !2488, line: 125, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2515, file: !2489, line: 87)
!2515 = !DISubprogram(name: "isblank", scope: !2488, file: !2488, line: 130, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2517, file: !2519, line: 98)
!2517 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !2518, line: 7, baseType: !2121)
!2518 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!2519 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdio", directory: "")
!2520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2521, file: !2519, line: 99)
!2521 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !2522, line: 84, baseType: !2523)
!2522 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!2523 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !2524, line: 14, baseType: !2525)
!2524 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!2525 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !2524, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!2526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2527, file: !2519, line: 101)
!2527 = !DISubprogram(name: "clearerr", scope: !2522, file: !2522, line: 786, type: !2528, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2528 = !DISubroutineType(types: !2529)
!2529 = !{null, !2530}
!2530 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2517, size: 64)
!2531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2532, file: !2519, line: 102)
!2532 = !DISubprogram(name: "fclose", scope: !2522, file: !2522, line: 178, type: !2533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2533 = !DISubroutineType(types: !2534)
!2534 = !{!582, !2530}
!2535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2536, file: !2519, line: 103)
!2536 = !DISubprogram(name: "feof", scope: !2522, file: !2522, line: 788, type: !2533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2538, file: !2519, line: 104)
!2538 = !DISubprogram(name: "ferror", scope: !2522, file: !2522, line: 790, type: !2533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2540, file: !2519, line: 105)
!2540 = !DISubprogram(name: "fflush", scope: !2522, file: !2522, line: 230, type: !2533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2542, file: !2519, line: 106)
!2542 = !DISubprogram(name: "fgetc", scope: !2522, file: !2522, line: 513, type: !2533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2544, file: !2519, line: 107)
!2544 = !DISubprogram(name: "fgetpos", scope: !2522, file: !2522, line: 760, type: !2545, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2545 = !DISubroutineType(types: !2546)
!2546 = !{!582, !2547, !2548}
!2547 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2530)
!2548 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2549)
!2549 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2521, size: 64)
!2550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2551, file: !2519, line: 108)
!2551 = !DISubprogram(name: "fgets", scope: !2522, file: !2522, line: 592, type: !2552, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2552 = !DISubroutineType(types: !2553)
!2553 = !{!366, !1725, !582, !2547}
!2554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2555, file: !2519, line: 109)
!2555 = !DISubprogram(name: "fopen", scope: !2522, file: !2522, line: 258, type: !2556, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2556 = !DISubroutineType(types: !2557)
!2557 = !{!2530, !1682, !1682}
!2558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2559, file: !2519, line: 110)
!2559 = !DISubprogram(name: "fprintf", scope: !2522, file: !2522, line: 350, type: !2560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2560 = !DISubroutineType(types: !2561)
!2561 = !{!582, !2547, !1682, null}
!2562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2563, file: !2519, line: 111)
!2563 = !DISubprogram(name: "fputc", scope: !2522, file: !2522, line: 549, type: !2564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2564 = !DISubroutineType(types: !2565)
!2565 = !{!582, !582, !2530}
!2566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2567, file: !2519, line: 112)
!2567 = !DISubprogram(name: "fputs", scope: !2522, file: !2522, line: 655, type: !2568, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2568 = !DISubroutineType(types: !2569)
!2569 = !{!582, !1682, !2547}
!2570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2571, file: !2519, line: 113)
!2571 = !DISubprogram(name: "fread", scope: !2522, file: !2522, line: 675, type: !2572, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2572 = !DISubroutineType(types: !2573)
!2573 = !{!15, !2574, !15, !15, !2547}
!2574 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !82)
!2575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2576, file: !2519, line: 114)
!2576 = !DISubprogram(name: "freopen", scope: !2522, file: !2522, line: 265, type: !2577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2577 = !DISubroutineType(types: !2578)
!2578 = !{!2530, !1682, !1682, !2547}
!2579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2580, file: !2519, line: 115)
!2580 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !2522, file: !2522, line: 434, type: !2560, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2582, file: !2519, line: 116)
!2582 = !DISubprogram(name: "fseek", scope: !2522, file: !2522, line: 713, type: !2583, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2583 = !DISubroutineType(types: !2584)
!2584 = !{!582, !2530, !1096, !582}
!2585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2586, file: !2519, line: 117)
!2586 = !DISubprogram(name: "fsetpos", scope: !2522, file: !2522, line: 765, type: !2587, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2587 = !DISubroutineType(types: !2588)
!2588 = !{!582, !2530, !2589}
!2589 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2590, size: 64)
!2590 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2521)
!2591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2592, file: !2519, line: 118)
!2592 = !DISubprogram(name: "ftell", scope: !2522, file: !2522, line: 718, type: !2593, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2593 = !DISubroutineType(types: !2594)
!2594 = !{!1096, !2530}
!2595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2596, file: !2519, line: 119)
!2596 = !DISubprogram(name: "fwrite", scope: !2522, file: !2522, line: 681, type: !2597, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2597 = !DISubroutineType(types: !2598)
!2598 = !{!15, !2599, !15, !15, !2547}
!2599 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !110)
!2600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2601, file: !2519, line: 120)
!2601 = !DISubprogram(name: "getc", scope: !2522, file: !2522, line: 514, type: !2533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2603, file: !2519, line: 121)
!2603 = !DISubprogram(name: "getchar", scope: !2604, file: !2604, line: 47, type: !1695, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2604 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c10e343656e7a2bf1044ef4e4442d902")
!2605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2606, file: !2519, line: 126)
!2606 = !DISubprogram(name: "perror", scope: !2522, file: !2522, line: 804, type: !2607, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2607 = !DISubroutineType(types: !2608)
!2608 = !{null, !399}
!2609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2610, file: !2519, line: 127)
!2610 = !DISubprogram(name: "printf", scope: !2522, file: !2522, line: 356, type: !2611, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2611 = !DISubroutineType(types: !2612)
!2612 = !{!582, !1682, null}
!2613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2614, file: !2519, line: 128)
!2614 = !DISubprogram(name: "putc", scope: !2522, file: !2522, line: 550, type: !2564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2616, file: !2519, line: 129)
!2616 = !DISubprogram(name: "putchar", scope: !2604, file: !2604, line: 82, type: !1254, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2618, file: !2519, line: 130)
!2618 = !DISubprogram(name: "puts", scope: !2522, file: !2522, line: 661, type: !1626, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2620, file: !2519, line: 131)
!2620 = !DISubprogram(name: "remove", scope: !2522, file: !2522, line: 152, type: !1626, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2622, file: !2519, line: 132)
!2622 = !DISubprogram(name: "rename", scope: !2522, file: !2522, line: 154, type: !2623, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2623 = !DISubroutineType(types: !2624)
!2624 = !{!582, !399, !399}
!2625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2626, file: !2519, line: 133)
!2626 = !DISubprogram(name: "rewind", scope: !2522, file: !2522, line: 723, type: !2528, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2628, file: !2519, line: 134)
!2628 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !2522, file: !2522, line: 437, type: !2611, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2630, file: !2519, line: 135)
!2630 = !DISubprogram(name: "setbuf", scope: !2522, file: !2522, line: 328, type: !2631, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2631 = !DISubroutineType(types: !2632)
!2632 = !{null, !2547, !1725}
!2633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2634, file: !2519, line: 136)
!2634 = !DISubprogram(name: "setvbuf", scope: !2522, file: !2522, line: 332, type: !2635, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2635 = !DISubroutineType(types: !2636)
!2636 = !{!582, !2547, !1725, !582, !15}
!2637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2638, file: !2519, line: 137)
!2638 = !DISubprogram(name: "sprintf", scope: !2522, file: !2522, line: 358, type: !2639, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2639 = !DISubroutineType(types: !2640)
!2640 = !{!582, !1725, !1682, null}
!2641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2642, file: !2519, line: 138)
!2642 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !2522, file: !2522, line: 439, type: !2643, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2643 = !DISubroutineType(types: !2644)
!2644 = !{!582, !1682, !1682, null}
!2645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2646, file: !2519, line: 139)
!2646 = !DISubprogram(name: "tmpfile", scope: !2522, file: !2522, line: 188, type: !2647, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2647 = !DISubroutineType(types: !2648)
!2648 = !{!2530}
!2649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2650, file: !2519, line: 141)
!2650 = !DISubprogram(name: "tmpnam", scope: !2522, file: !2522, line: 205, type: !2651, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2651 = !DISubroutineType(types: !2652)
!2652 = !{!366, !366}
!2653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2654, file: !2519, line: 143)
!2654 = !DISubprogram(name: "ungetc", scope: !2522, file: !2522, line: 668, type: !2564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2656, file: !2519, line: 144)
!2656 = !DISubprogram(name: "vfprintf", scope: !2522, file: !2522, line: 365, type: !2657, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2657 = !DISubroutineType(types: !2658)
!2658 = !{!582, !2547, !1682, !2242}
!2659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2660, file: !2519, line: 145)
!2660 = !DISubprogram(name: "vprintf", scope: !2604, file: !2604, line: 39, type: !2661, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2661 = !DISubroutineType(types: !2662)
!2662 = !{!582, !1682, !2242}
!2663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2664, file: !2519, line: 146)
!2664 = !DISubprogram(name: "vsprintf", scope: !2522, file: !2522, line: 373, type: !2665, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2665 = !DISubroutineType(types: !2666)
!2666 = !{!582, !1725, !1682, !2242}
!2667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !2668, file: !2519, line: 175)
!2668 = !DISubprogram(name: "snprintf", scope: !2522, file: !2522, line: 378, type: !2669, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2669 = !DISubroutineType(types: !2670)
!2670 = !{!582, !1725, !15, !1682, null}
!2671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !2672, file: !2519, line: 176)
!2672 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !2522, file: !2522, line: 479, type: !2657, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !2674, file: !2519, line: 177)
!2674 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !2522, file: !2522, line: 484, type: !2661, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !2676, file: !2519, line: 178)
!2676 = !DISubprogram(name: "vsnprintf", scope: !2522, file: !2522, line: 382, type: !2677, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2677 = !DISubroutineType(types: !2678)
!2678 = !{!582, !1725, !15, !1682, !2242}
!2679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !356, entity: !2680, file: !2519, line: 179)
!2680 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !2522, file: !2522, line: 487, type: !2681, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2681 = !DISubroutineType(types: !2682)
!2682 = !{!582, !1682, !1682, !2242}
!2683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2668, file: !2519, line: 185)
!2684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2672, file: !2519, line: 186)
!2685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2674, file: !2519, line: 187)
!2686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2676, file: !2519, line: 188)
!2687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2680, file: !2519, line: 189)
!2688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2689, file: !2693, line: 82)
!2689 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !2690, line: 48, baseType: !2691)
!2690 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "9bcd8e8b8cd2078c8a6c42e262af7d7b")
!2691 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2692, size: 64)
!2692 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2413)
!2693 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cwctype", directory: "")
!2694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2695, file: !2693, line: 83)
!2695 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !2696, line: 38, baseType: !17)
!2696 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "48fed714a84c77fca0455b433489fc47")
!2697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2107, file: !2693, line: 84)
!2698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2699, file: !2693, line: 86)
!2699 = !DISubprogram(name: "iswalnum", scope: !2696, file: !2696, line: 95, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2701, file: !2693, line: 87)
!2701 = !DISubprogram(name: "iswalpha", scope: !2696, file: !2696, line: 101, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2703, file: !2693, line: 89)
!2703 = !DISubprogram(name: "iswblank", scope: !2696, file: !2696, line: 146, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2705, file: !2693, line: 91)
!2705 = !DISubprogram(name: "iswcntrl", scope: !2696, file: !2696, line: 104, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2707, file: !2693, line: 92)
!2707 = !DISubprogram(name: "iswctype", scope: !2696, file: !2696, line: 159, type: !2708, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2708 = !DISubroutineType(types: !2709)
!2709 = !{!582, !2107, !2695}
!2710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2711, file: !2693, line: 93)
!2711 = !DISubprogram(name: "iswdigit", scope: !2696, file: !2696, line: 108, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2713, file: !2693, line: 94)
!2713 = !DISubprogram(name: "iswgraph", scope: !2696, file: !2696, line: 112, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2715, file: !2693, line: 95)
!2715 = !DISubprogram(name: "iswlower", scope: !2696, file: !2696, line: 117, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2717, file: !2693, line: 96)
!2717 = !DISubprogram(name: "iswprint", scope: !2696, file: !2696, line: 120, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2719, file: !2693, line: 97)
!2719 = !DISubprogram(name: "iswpunct", scope: !2696, file: !2696, line: 125, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2721, file: !2693, line: 98)
!2721 = !DISubprogram(name: "iswspace", scope: !2696, file: !2696, line: 130, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2723, file: !2693, line: 99)
!2723 = !DISubprogram(name: "iswupper", scope: !2696, file: !2696, line: 135, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2725, file: !2693, line: 100)
!2725 = !DISubprogram(name: "iswxdigit", scope: !2696, file: !2696, line: 140, type: !2344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2727, file: !2693, line: 101)
!2727 = !DISubprogram(name: "towctrans", scope: !2690, file: !2690, line: 55, type: !2728, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2728 = !DISubroutineType(types: !2729)
!2729 = !{!2107, !2107, !2689}
!2730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2731, file: !2693, line: 102)
!2731 = !DISubprogram(name: "towlower", scope: !2696, file: !2696, line: 166, type: !2732, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2732 = !DISubroutineType(types: !2733)
!2733 = !{!2107, !2107}
!2734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2735, file: !2693, line: 103)
!2735 = !DISubprogram(name: "towupper", scope: !2696, file: !2696, line: 169, type: !2732, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2737, file: !2693, line: 104)
!2737 = !DISubprogram(name: "wctrans", scope: !2690, file: !2690, line: 52, type: !2738, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2738 = !DISubroutineType(types: !2739)
!2739 = !{!2689, !399}
!2740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2741, file: !2693, line: 105)
!2741 = !DISubprogram(name: "wctype", scope: !2696, file: !2696, line: 155, type: !2742, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2742 = !DISubroutineType(types: !2743)
!2743 = !{!2695, !399}
!2744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2745, file: !2748, line: 60)
!2745 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !2746, line: 7, baseType: !2747)
!2746 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!2747 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !35, line: 156, baseType: !1096)
!2748 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ctime", directory: "")
!2749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !1206, file: !2748, line: 61)
!2750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2293, file: !2748, line: 62)
!2751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2752, file: !2748, line: 64)
!2752 = !DISubprogram(name: "clock", scope: !2753, file: !2753, line: 72, type: !2754, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2753 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "db37158473a25e1d89b19f8bc6892801")
!2754 = !DISubroutineType(types: !2755)
!2755 = !{!2745}
!2756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2757, file: !2748, line: 65)
!2757 = !DISubprogram(name: "difftime", scope: !2753, file: !2753, line: 79, type: !2758, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2758 = !DISubroutineType(types: !2759)
!2759 = !{!1262, !1206, !1206}
!2760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2761, file: !2748, line: 66)
!2761 = !DISubprogram(name: "mktime", scope: !2753, file: !2753, line: 83, type: !2762, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2762 = !DISubroutineType(types: !2763)
!2763 = !{!1206, !2764}
!2764 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2293, size: 64)
!2765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2766, file: !2748, line: 67)
!2766 = !DISubprogram(name: "time", scope: !2753, file: !2753, line: 76, type: !2767, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2767 = !DISubroutineType(types: !2768)
!2768 = !{!1206, !2769}
!2769 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1206, size: 64)
!2770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2771, file: !2748, line: 68)
!2771 = !DISubprogram(name: "asctime", scope: !2753, file: !2753, line: 179, type: !2772, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2772 = !DISubroutineType(types: !2773)
!2773 = !{!366, !2291}
!2774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2775, file: !2748, line: 69)
!2775 = !DISubprogram(name: "ctime", scope: !2753, file: !2753, line: 183, type: !2776, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2776 = !DISubroutineType(types: !2777)
!2777 = !{!366, !2778}
!2778 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2779, size: 64)
!2779 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1206)
!2780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2781, file: !2748, line: 70)
!2781 = !DISubprogram(name: "gmtime", scope: !2753, file: !2753, line: 132, type: !2782, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2782 = !DISubroutineType(types: !2783)
!2783 = !{!2764, !2778}
!2784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2785, file: !2748, line: 71)
!2785 = !DISubprogram(name: "localtime", scope: !2753, file: !2753, line: 136, type: !2782, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2787, file: !2748, line: 72)
!2787 = !DISubprogram(name: "strftime", scope: !2753, file: !2753, line: 100, type: !2788, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2788 = !DISubroutineType(types: !2789)
!2789 = !{!15, !1725, !15, !1682, !2290}
!2790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2791, file: !2748, line: 79)
!2791 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !2792, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !2793, identifier: "_ZTS8timespec")
!2792 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!2793 = !{!2794, !2795}
!2794 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !2791, file: !2792, line: 16, baseType: !1208, size: 64)
!2795 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !2791, file: !2792, line: 21, baseType: !2796, size: 64, offset: 64)
!2796 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !35, line: 197, baseType: !1096)
!2797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2798, file: !2748, line: 80)
!2798 = !DISubprogram(name: "timespec_get", scope: !2753, file: !2753, line: 371, type: !2799, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2799 = !DISubroutineType(types: !2800)
!2800 = !{!582, !2801, !582}
!2801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2791, size: 64)
!2802 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1100, entity: !2803, file: !1099, line: 1321)
!2803 = !DINamespace(name: "chrono_literals", scope: !2804, exportSymbols: true)
!2804 = !DINamespace(name: "literals", scope: !27, exportSymbols: true)
!2805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2806, file: !2810, line: 77)
!2806 = !DISubprogram(name: "memchr", scope: !2807, file: !2807, line: 100, type: !2808, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2807 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "f443da8025a0b7c1498fb6c554ec788d")
!2808 = !DISubroutineType(types: !2809)
!2809 = !{!110, !110, !582, !15}
!2810 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstring", directory: "")
!2811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2812, file: !2810, line: 78)
!2812 = !DISubprogram(name: "memcmp", scope: !2807, file: !2807, line: 64, type: !2813, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2813 = !DISubroutineType(types: !2814)
!2814 = !{!582, !110, !110, !15}
!2815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2816, file: !2810, line: 79)
!2816 = !DISubprogram(name: "memcpy", linkageName: "_ZL6memcpyPvPKvm", scope: !2817, file: !2817, line: 1084, type: !2818, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2817 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "59790372eacbad80338513022c6135db")
!2818 = !DISubroutineType(types: !2819)
!2819 = !{!82, !82, !110, !15}
!2820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2821, file: !2810, line: 80)
!2821 = !DISubprogram(name: "memmove", scope: !2807, file: !2807, line: 47, type: !2818, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2823, file: !2810, line: 81)
!2823 = !DISubprogram(name: "memset", linkageName: "_ZL6memsetPvim", scope: !2817, file: !2817, line: 1088, type: !2824, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!2824 = !DISubroutineType(types: !2825)
!2825 = !{!82, !82, !582, !15}
!2826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2827, file: !2810, line: 82)
!2827 = !DISubprogram(name: "strcat", scope: !2807, file: !2807, line: 149, type: !2828, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2828 = !DISubroutineType(types: !2829)
!2829 = !{!366, !1725, !1682}
!2830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2831, file: !2810, line: 83)
!2831 = !DISubprogram(name: "strcmp", scope: !2807, file: !2807, line: 156, type: !2623, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2833, file: !2810, line: 84)
!2833 = !DISubprogram(name: "strcoll", scope: !2807, file: !2807, line: 163, type: !2623, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2835, file: !2810, line: 85)
!2835 = !DISubprogram(name: "strcpy", scope: !2807, file: !2807, line: 141, type: !2828, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2837, file: !2810, line: 86)
!2837 = !DISubprogram(name: "strcspn", scope: !2807, file: !2807, line: 293, type: !2838, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2838 = !DISubroutineType(types: !2839)
!2839 = !{!15, !399, !399}
!2840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2841, file: !2810, line: 87)
!2841 = !DISubprogram(name: "strerror", scope: !2807, file: !2807, line: 419, type: !2842, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2842 = !DISubroutineType(types: !2843)
!2843 = !{!366, !582}
!2844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2845, file: !2810, line: 88)
!2845 = !DISubprogram(name: "strlen", scope: !2807, file: !2807, line: 407, type: !2846, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2846 = !DISubroutineType(types: !2847)
!2847 = !{!15, !399}
!2848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2849, file: !2810, line: 89)
!2849 = !DISubprogram(name: "strncat", scope: !2807, file: !2807, line: 152, type: !2850, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2850 = !DISubroutineType(types: !2851)
!2851 = !{!366, !1725, !1682, !15}
!2852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2853, file: !2810, line: 90)
!2853 = !DISubprogram(name: "strncmp", scope: !2807, file: !2807, line: 159, type: !2854, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2854 = !DISubroutineType(types: !2855)
!2855 = !{!582, !399, !399, !15}
!2856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2857, file: !2810, line: 91)
!2857 = !DISubprogram(name: "strncpy", scope: !2807, file: !2807, line: 144, type: !2850, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2859, file: !2810, line: 92)
!2859 = !DISubprogram(name: "strspn", scope: !2807, file: !2807, line: 297, type: !2838, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2861, file: !2810, line: 93)
!2861 = !DISubprogram(name: "strtok", scope: !2807, file: !2807, line: 356, type: !2828, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2863, file: !2810, line: 94)
!2863 = !DISubprogram(name: "strxfrm", scope: !2807, file: !2807, line: 166, type: !2864, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2864 = !DISubroutineType(types: !2865)
!2865 = !{!15, !1725, !1682, !15}
!2866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2867, file: !2810, line: 95)
!2867 = !DISubprogram(name: "strchr", scope: !2807, file: !2807, line: 239, type: !2868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2868 = !DISubroutineType(types: !2869)
!2869 = !{!399, !399, !582}
!2870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2871, file: !2810, line: 96)
!2871 = !DISubprogram(name: "strpbrk", scope: !2807, file: !2807, line: 316, type: !2872, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2872 = !DISubroutineType(types: !2873)
!2873 = !{!399, !399, !399}
!2874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2875, file: !2810, line: 97)
!2875 = !DISubprogram(name: "strrchr", scope: !2807, file: !2807, line: 266, type: !2868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2877, file: !2810, line: 98)
!2877 = !DISubprogram(name: "strstr", scope: !2807, file: !2807, line: 343, type: !2872, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2879, file: !2882, line: 58)
!2879 = !DIDerivedType(tag: DW_TAG_typedef, name: "imaxdiv_t", file: !2880, line: 275, baseType: !2881)
!2880 = !DIFile(filename: "/usr/include/inttypes.h", directory: "", checksumkind: CSK_MD5, checksum: "e498a0d76716f3e3909f4b6f2cb2f20f")
!2881 = !DICompositeType(tag: DW_TAG_structure_type, file: !2880, line: 271, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9imaxdiv_t")
!2882 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cinttypes", directory: "")
!2883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2884, file: !2882, line: 61)
!2884 = !DISubprogram(name: "imaxabs", scope: !2880, file: !2880, line: 290, type: !2885, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2885 = !DISubroutineType(types: !2886)
!2886 = !{!1107, !1107}
!2887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2888, file: !2882, line: 62)
!2888 = !DISubprogram(name: "imaxdiv", scope: !2880, file: !2880, line: 293, type: !2889, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2889 = !DISubroutineType(types: !2890)
!2890 = !{!2879, !1107, !1107}
!2891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2892, file: !2882, line: 68)
!2892 = !DISubprogram(name: "strtoimax", scope: !2880, file: !2880, line: 297, type: !2893, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2893 = !DISubroutineType(types: !2894)
!2894 = !{!1107, !1682, !1709, !582}
!2895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2896, file: !2882, line: 69)
!2896 = !DISubprogram(name: "strtoumax", scope: !2880, file: !2880, line: 301, type: !2897, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2897 = !DISubroutineType(types: !2898)
!2898 = !{!2469, !1682, !1709, !582}
!2899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2900, file: !2882, line: 72)
!2900 = !DISubprogram(name: "wcstoimax", scope: !2880, file: !2880, line: 305, type: !2901, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2901 = !DISubroutineType(types: !2902)
!2902 = !{!1107, !1726, !2320, !582}
!2903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !27, entity: !2904, file: !2882, line: 73)
!2904 = !DISubprogram(name: "wcstoumax", scope: !2880, file: !2880, line: 310, type: !2905, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2905 = !DISubroutineType(types: !2906)
!2906 = !{!2469, !1726, !2320, !582}
!2907 = !{i32 7, !"Dwarf Version", i32 5}
!2908 = !{i32 2, !"Debug Info Version", i32 3}
!2909 = !{i32 1, !"wchar_size", i32 4}
!2910 = !{i32 7, !"uwtable", i32 2}
!2911 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}
!2912 = distinct !DISubprogram(name: "scabbard_init", linkageName: "scabbard.trace.scabbard_init", scope: !2, file: !181, line: 64, type: !1608, scopeLine: 65, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !2913)
!2913 = !{!2914, !2916, !2918, !2919, !2920, !2922, !2923, !2926}
!2914 = !DILocalVariable(name: "_EXE_NAME", scope: !2912, file: !181, line: 66, type: !2915)
!2915 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !366)
!2916 = !DILocalVariable(name: "EXE_NAME", scope: !2912, file: !181, line: 67, type: !2917)
!2917 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1090)
!2918 = !DILocalVariable(name: "_TRACE_FILE", scope: !2912, file: !181, line: 70, type: !2915)
!2919 = !DILocalVariable(name: "TRACE_FILE", scope: !2912, file: !181, line: 71, type: !2917)
!2920 = !DILocalVariable(name: "hipRes", scope: !2912, file: !181, line: 76, type: !2921)
!2921 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipError_t", file: !90, line: 320, baseType: !250)
!2922 = !DILocalVariable(name: "tmp1", scope: !2912, file: !181, line: 77, type: !5)
!2923 = !DILocalVariable(name: "device_count", scope: !2924, file: !181, line: 81, type: !582)
!2924 = distinct !DILexicalBlock(scope: !2925, file: !181, line: 78, column: 80)
!2925 = distinct !DILexicalBlock(scope: !2912, file: !181, line: 78, column: 11)
!2926 = !DILocalVariable(name: "tmp2", scope: !2912, file: !181, line: 92, type: !6)
!2927 = !DILocation(line: 66, column: 30, scope: !2912)
!2928 = !DILocation(line: 0, scope: !2912)
!2929 = !DILocation(line: 67, column: 7, scope: !2912)
!2930 = !DILocation(line: 67, column: 25, scope: !2912)
!2931 = !DILocation(line: 67, column: 37, scope: !2912)
!2932 = !DILocalVariable(name: "this", arg: 1, scope: !2933, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!2933 = distinct !DISubprogram(name: "basic_string<std::allocator<char> >", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_", scope: !346, file: !244, line: 634, type: !2934, scopeLine: 636, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, templateParams: !2937, declaration: !2936, retainedNodes: !2939)
!2934 = !DISubroutineType(types: !2935)
!2935 = !{null, !690, !399, !422}
!2936 = !DISubprogram(name: "basic_string<std::allocator<char> >", scope: !346, file: !244, line: 634, type: !2934, scopeLine: 634, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2937)
!2937 = !{!2938}
!2938 = !DITemplateTypeParameter(type: !369)
!2939 = !{!2932, !2940, !2941, !2942}
!2940 = !DILocalVariable(name: "__s", arg: 2, scope: !2933, file: !244, line: 634, type: !399)
!2941 = !DILocalVariable(name: "__a", arg: 3, scope: !2933, file: !244, line: 634, type: !422)
!2942 = !DILocalVariable(name: "__end", scope: !2943, file: !244, line: 641, type: !399)
!2943 = distinct !DILexicalBlock(scope: !2933, file: !244, line: 636, column: 7)
!2944 = !DILocation(line: 0, scope: !2933, inlinedAt: !2945)
!2945 = distinct !DILocation(line: 69, column: 39, scope: !2912)
!2946 = !DILocation(line: 0, scope: !2933, inlinedAt: !2947)
!2947 = distinct !DILocation(line: 68, column: 39, scope: !2912)
!2948 = !DILocalVariable(name: "this", arg: 1, scope: !2949, type: !2953, flags: DIFlagArtificial | DIFlagObjectPointer)
!2949 = distinct !DISubprogram(name: "_Alloc_hider", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC2EPcRKS3_", scope: !465, file: !244, line: 200, type: !478, scopeLine: 201, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !477, retainedNodes: !2950)
!2950 = !{!2948, !2951, !2952}
!2951 = !DILocalVariable(name: "__dat", arg: 2, scope: !2949, file: !244, line: 200, type: !475)
!2952 = !DILocalVariable(name: "__a", arg: 3, scope: !2949, file: !244, line: 200, type: !422)
!2953 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !465, size: 64)
!2954 = !DILocation(line: 0, scope: !2949, inlinedAt: !2955)
!2955 = distinct !DILocation(line: 635, column: 9, scope: !2933, inlinedAt: !2945)
!2956 = !DILocation(line: 0, scope: !2949, inlinedAt: !2957)
!2957 = distinct !DILocation(line: 635, column: 9, scope: !2933, inlinedAt: !2947)
!2958 = !{!2959, !2960, i64 0}
!2959 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !2960, i64 0}
!2960 = !{!"any pointer", !2961, i64 0}
!2961 = !{!"omnipotent char", !2962, i64 0}
!2962 = !{!"Simple C++ TBAA"}
!2963 = !DILocalVariable(name: "this", arg: 1, scope: !2964, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!2964 = distinct !DISubprogram(name: "_M_local_data", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv", scope: !346, file: !244, line: 239, type: !704, scopeLine: 240, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !703, retainedNodes: !2965)
!2965 = !{!2963}
!2966 = !DILocation(line: 0, scope: !2964, inlinedAt: !2967)
!2967 = distinct !DILocation(line: 635, column: 21, scope: !2933, inlinedAt: !2947)
!2968 = !DILocalVariable(name: "__s", arg: 1, scope: !2969, file: !637, line: 389, type: !653)
!2969 = distinct !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !636, file: !637, line: 389, type: !655, scopeLine: 390, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !654, retainedNodes: !2970)
!2970 = !{!2968}
!2971 = !DILocation(line: 0, scope: !2969, inlinedAt: !2972)
!2972 = distinct !DILocation(line: 641, column: 30, scope: !2943, inlinedAt: !2947)
!2973 = !DILocation(line: 395, column: 9, scope: !2969, inlinedAt: !2972)
!2974 = !DILocation(line: 0, scope: !2943, inlinedAt: !2947)
!2975 = !DILocation(line: 0, scope: !1216, inlinedAt: !2976)
!2976 = distinct !DILocation(line: 642, column: 2, scope: !2943, inlinedAt: !2947)
!2977 = !DILocation(line: 332, column: 33, scope: !1216, inlinedAt: !2976)
!2978 = !DILocation(line: 221, column: 2, scope: !1216, inlinedAt: !2976)
!2979 = !DILocation(line: 221, column: 12, scope: !1216, inlinedAt: !2976)
!2980 = !{!2981, !2981, i64 0}
!2981 = !{!"long", !2961, i64 0}
!2982 = !DILocation(line: 223, column: 13, scope: !2983, inlinedAt: !2976)
!2983 = distinct !DILexicalBlock(scope: !1216, file: !347, line: 223, column: 6)
!2984 = !DILocation(line: 223, column: 6, scope: !1216, inlinedAt: !2976)
!2985 = !DILocation(line: 225, column: 14, scope: !2986, inlinedAt: !2976)
!2986 = distinct !DILexicalBlock(scope: !2983, file: !347, line: 224, column: 4)
!2987 = !DILocalVariable(name: "this", arg: 1, scope: !2988, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!2988 = distinct !DISubprogram(name: "_M_data", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc", scope: !346, file: !244, line: 224, type: !693, scopeLine: 225, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !692, retainedNodes: !2989)
!2989 = !{!2987, !2990}
!2990 = !DILocalVariable(name: "__p", arg: 2, scope: !2988, file: !244, line: 224, type: !475)
!2991 = !DILocation(line: 0, scope: !2988, inlinedAt: !2992)
!2992 = distinct !DILocation(line: 225, column: 6, scope: !2986, inlinedAt: !2976)
!2993 = !DILocation(line: 225, column: 21, scope: !2988, inlinedAt: !2992)
!2994 = !DILocation(line: 225, column: 26, scope: !2988, inlinedAt: !2992)
!2995 = !{!2996, !2960, i64 0}
!2996 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !2959, i64 0, !2981, i64 8, !2961, i64 16}
!2997 = !DILocation(line: 226, column: 18, scope: !2986, inlinedAt: !2976)
!2998 = !DILocalVariable(name: "this", arg: 1, scope: !2999, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!2999 = distinct !DISubprogram(name: "_M_capacity", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm", scope: !346, file: !244, line: 261, type: !696, scopeLine: 262, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !712, retainedNodes: !3000)
!3000 = !{!2998, !3001}
!3001 = !DILocalVariable(name: "__capacity", arg: 2, scope: !2999, file: !244, line: 261, type: !352)
!3002 = !DILocation(line: 0, scope: !2999, inlinedAt: !3003)
!3003 = distinct !DILocation(line: 226, column: 6, scope: !2986, inlinedAt: !2976)
!3004 = !DILocation(line: 262, column: 9, scope: !2999, inlinedAt: !3003)
!3005 = !DILocation(line: 262, column: 31, scope: !2999, inlinedAt: !3003)
!3006 = !{!2961, !2961, i64 0}
!3007 = !DILocation(line: 227, column: 4, scope: !2986, inlinedAt: !2976)
!3008 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3013)
!3009 = distinct !DISubprogram(name: "_M_data", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv", scope: !346, file: !244, line: 234, type: !699, scopeLine: 235, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !698, retainedNodes: !3010)
!3010 = !{!3011}
!3011 = !DILocalVariable(name: "this", arg: 1, scope: !3009, type: !3012, flags: DIFlagArtificial | DIFlagObjectPointer)
!3012 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !702, size: 64)
!3013 = distinct !DILocation(line: 243, column: 22, scope: !1216, inlinedAt: !2976)
!3014 = !DILocation(line: 0, scope: !3009, inlinedAt: !3013)
!3015 = !DILocalVariable(name: "__p", arg: 1, scope: !3016, file: !244, line: 475, type: !366)
!3016 = distinct !DISubprogram(name: "_S_copy_chars", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_", scope: !346, file: !244, line: 475, type: !771, scopeLine: 477, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !770, retainedNodes: !3017)
!3017 = !{!3015, !3018, !3019}
!3018 = !DILocalVariable(name: "__k1", arg: 2, scope: !3016, file: !244, line: 475, type: !399)
!3019 = !DILocalVariable(name: "__k2", arg: 3, scope: !3016, file: !244, line: 475, type: !399)
!3020 = !DILocation(line: 0, scope: !3016, inlinedAt: !3021)
!3021 = distinct !DILocation(line: 243, column: 2, scope: !1216, inlinedAt: !2976)
!3022 = !DILocalVariable(name: "__d", arg: 1, scope: !3023, file: !244, line: 418, type: !366)
!3023 = distinct !DISubprogram(name: "_S_copy", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_S_copyEPcPKcm", scope: !346, file: !244, line: 418, type: !751, scopeLine: 419, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !750, retainedNodes: !3024)
!3024 = !{!3022, !3025, !3026}
!3025 = !DILocalVariable(name: "__s", arg: 2, scope: !3023, file: !244, line: 418, type: !399)
!3026 = !DILocalVariable(name: "__n", arg: 3, scope: !3023, file: !244, line: 418, type: !352)
!3027 = !DILocation(line: 0, scope: !3023, inlinedAt: !3028)
!3028 = distinct !DILocation(line: 477, column: 9, scope: !3016, inlinedAt: !3021)
!3029 = !DILocation(line: 420, column: 6, scope: !3023, inlinedAt: !3028)
!3030 = !DILocalVariable(name: "__c1", arg: 1, scope: !3031, file: !637, line: 347, type: !642)
!3031 = distinct !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignERcRKc", scope: !636, file: !637, line: 347, type: !640, scopeLine: 348, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !639, retainedNodes: !3032)
!3032 = !{!3030, !3033}
!3033 = !DILocalVariable(name: "__c2", arg: 2, scope: !3031, file: !637, line: 347, type: !644)
!3034 = !DILocation(line: 0, scope: !3031, inlinedAt: !3035)
!3035 = distinct !DILocation(line: 421, column: 4, scope: !3036, inlinedAt: !3028)
!3036 = distinct !DILexicalBlock(scope: !3023, file: !244, line: 420, column: 6)
!3037 = !DILocation(line: 354, column: 9, scope: !3031, inlinedAt: !3035)
!3038 = !DILocation(line: 354, column: 7, scope: !3031, inlinedAt: !3035)
!3039 = !DILocation(line: 421, column: 4, scope: !3036, inlinedAt: !3028)
!3040 = !DILocation(line: 431, column: 33, scope: !3041, inlinedAt: !3046)
!3041 = distinct !DISubprogram(name: "copy", linkageName: "_ZNSt11char_traitsIcE4copyEPcPKcm", scope: !636, file: !637, line: 423, type: !661, scopeLine: 424, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !664, retainedNodes: !3042)
!3042 = !{!3043, !3044, !3045}
!3043 = !DILocalVariable(name: "__s1", arg: 1, scope: !3041, file: !637, line: 423, type: !663)
!3044 = !DILocalVariable(name: "__s2", arg: 2, scope: !3041, file: !637, line: 423, type: !653)
!3045 = !DILocalVariable(name: "__n", arg: 3, scope: !3041, file: !637, line: 423, type: !25)
!3046 = distinct !DILocation(line: 423, column: 4, scope: !3036, inlinedAt: !3028)
!3047 = !DILocation(line: 431, column: 2, scope: !3041, inlinedAt: !3046)
!3048 = !DILocation(line: 0, scope: !2964, inlinedAt: !3049)
!3049 = distinct !DILocation(line: 635, column: 21, scope: !2933, inlinedAt: !2945)
!3050 = !DILocation(line: 0, scope: !2969, inlinedAt: !3051)
!3051 = distinct !DILocation(line: 641, column: 30, scope: !2943, inlinedAt: !2945)
!3052 = !DILocation(line: 0, scope: !2943, inlinedAt: !2945)
!3053 = !DILocation(line: 0, scope: !1216, inlinedAt: !3054)
!3054 = distinct !DILocation(line: 642, column: 2, scope: !2943, inlinedAt: !2945)
!3055 = !DILocation(line: 332, column: 33, scope: !1216, inlinedAt: !3054)
!3056 = !DILocation(line: 0, scope: !3009, inlinedAt: !3057)
!3057 = distinct !DILocation(line: 243, column: 22, scope: !1216, inlinedAt: !3054)
!3058 = !DILocation(line: 0, scope: !3016, inlinedAt: !3059)
!3059 = distinct !DILocation(line: 243, column: 2, scope: !1216, inlinedAt: !3054)
!3060 = !DILocation(line: 0, scope: !3023, inlinedAt: !3061)
!3061 = distinct !DILocation(line: 477, column: 9, scope: !3016, inlinedAt: !3059)
!3062 = !DILocation(line: 431, column: 33, scope: !3041, inlinedAt: !3063)
!3063 = distinct !DILocation(line: 423, column: 4, scope: !3036, inlinedAt: !3061)
!3064 = !DILocalVariable(name: "this", arg: 1, scope: !3065, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3065 = distinct !DISubprogram(name: "_M_set_length", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm", scope: !346, file: !244, line: 266, type: !696, scopeLine: 267, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !713, retainedNodes: !3066)
!3066 = !{!3064, !3067}
!3067 = !DILocalVariable(name: "__n", arg: 2, scope: !3065, file: !244, line: 266, type: !352)
!3068 = !DILocation(line: 0, scope: !3065, inlinedAt: !3069)
!3069 = distinct !DILocation(line: 247, column: 2, scope: !1216, inlinedAt: !3054)
!3070 = !DILocalVariable(name: "this", arg: 1, scope: !3071, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3071 = distinct !DISubprogram(name: "_M_length", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_lengthEm", scope: !346, file: !244, line: 229, type: !696, scopeLine: 230, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !695, retainedNodes: !3072)
!3072 = !{!3070, !3073}
!3073 = !DILocalVariable(name: "__length", arg: 2, scope: !3071, file: !244, line: 229, type: !352)
!3074 = !DILocation(line: 0, scope: !3071, inlinedAt: !3075)
!3075 = distinct !DILocation(line: 268, column: 2, scope: !3065, inlinedAt: !3069)
!3076 = !DILocation(line: 230, column: 9, scope: !3071, inlinedAt: !3075)
!3077 = !DILocation(line: 230, column: 26, scope: !3071, inlinedAt: !3075)
!3078 = !{!2996, !2981, i64 8}
!3079 = !DILocation(line: 0, scope: !3009, inlinedAt: !3080)
!3080 = distinct !DILocation(line: 269, column: 22, scope: !3065, inlinedAt: !3069)
!3081 = !DILocation(line: 269, column: 22, scope: !3065, inlinedAt: !3069)
!3082 = !DILocation(line: 0, scope: !3031, inlinedAt: !3083)
!3083 = distinct !DILocation(line: 269, column: 2, scope: !3065, inlinedAt: !3069)
!3084 = !DILocation(line: 354, column: 7, scope: !3031, inlinedAt: !3083)
!3085 = !DILocation(line: 67, column: 36, scope: !2912)
!3086 = !DILocation(line: 247, column: 16, scope: !1216, inlinedAt: !2976)
!3087 = !DILocation(line: 0, scope: !3065, inlinedAt: !3088)
!3088 = distinct !DILocation(line: 247, column: 2, scope: !1216, inlinedAt: !2976)
!3089 = !DILocation(line: 0, scope: !3071, inlinedAt: !3090)
!3090 = distinct !DILocation(line: 268, column: 2, scope: !3065, inlinedAt: !3088)
!3091 = !DILocation(line: 230, column: 9, scope: !3071, inlinedAt: !3090)
!3092 = !DILocation(line: 230, column: 26, scope: !3071, inlinedAt: !3090)
!3093 = !DILocation(line: 0, scope: !3009, inlinedAt: !3094)
!3094 = distinct !DILocation(line: 269, column: 22, scope: !3065, inlinedAt: !3088)
!3095 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3094)
!3096 = !DILocation(line: 269, column: 22, scope: !3065, inlinedAt: !3088)
!3097 = !DILocation(line: 0, scope: !3031, inlinedAt: !3098)
!3098 = distinct !DILocation(line: 269, column: 2, scope: !3065, inlinedAt: !3088)
!3099 = !DILocation(line: 354, column: 7, scope: !3031, inlinedAt: !3098)
!3100 = !DILocation(line: 248, column: 7, scope: !1216, inlinedAt: !2976)
!3101 = !DILocation(line: 70, column: 32, scope: !2912)
!3102 = !DILocation(line: 71, column: 7, scope: !2912)
!3103 = !DILocation(line: 71, column: 25, scope: !2912)
!3104 = !DILocation(line: 71, column: 39, scope: !2912)
!3105 = !DILocation(line: 0, scope: !2933, inlinedAt: !3106)
!3106 = distinct !DILocation(line: 72, column: 41, scope: !2912)
!3107 = !DILocation(line: 0, scope: !2964, inlinedAt: !3108)
!3108 = distinct !DILocation(line: 635, column: 21, scope: !2933, inlinedAt: !3106)
!3109 = !DILocation(line: 242, column: 51, scope: !2964, inlinedAt: !3108)
!3110 = !DILocation(line: 0, scope: !2949, inlinedAt: !3111)
!3111 = distinct !DILocation(line: 635, column: 9, scope: !2933, inlinedAt: !3106)
!3112 = !DILocation(line: 201, column: 25, scope: !2949, inlinedAt: !3111)
!3113 = !DILocation(line: 638, column: 6, scope: !2943, inlinedAt: !3106)
!3114 = !DILocation(line: 0, scope: !2969, inlinedAt: !3115)
!3115 = distinct !DILocation(line: 641, column: 30, scope: !2943, inlinedAt: !3106)
!3116 = !DILocation(line: 395, column: 9, scope: !2969, inlinedAt: !3115)
!3117 = !DILocation(line: 0, scope: !2943, inlinedAt: !3106)
!3118 = !DILocation(line: 0, scope: !1216, inlinedAt: !3119)
!3119 = distinct !DILocation(line: 642, column: 2, scope: !2943, inlinedAt: !3106)
!3120 = !DILocation(line: 332, column: 33, scope: !1216, inlinedAt: !3119)
!3121 = !DILocation(line: 221, column: 2, scope: !1216, inlinedAt: !3119)
!3122 = !DILocation(line: 221, column: 12, scope: !1216, inlinedAt: !3119)
!3123 = !DILocation(line: 223, column: 13, scope: !2983, inlinedAt: !3119)
!3124 = !DILocation(line: 223, column: 6, scope: !1216, inlinedAt: !3119)
!3125 = !DILocation(line: 225, column: 14, scope: !2986, inlinedAt: !3119)
!3126 = !DILocation(line: 0, scope: !2988, inlinedAt: !3127)
!3127 = distinct !DILocation(line: 225, column: 6, scope: !2986, inlinedAt: !3119)
!3128 = !DILocation(line: 225, column: 21, scope: !2988, inlinedAt: !3127)
!3129 = !DILocation(line: 225, column: 26, scope: !2988, inlinedAt: !3127)
!3130 = !DILocation(line: 226, column: 18, scope: !2986, inlinedAt: !3119)
!3131 = !DILocation(line: 0, scope: !2999, inlinedAt: !3132)
!3132 = distinct !DILocation(line: 226, column: 6, scope: !2986, inlinedAt: !3119)
!3133 = !DILocation(line: 262, column: 9, scope: !2999, inlinedAt: !3132)
!3134 = !DILocation(line: 262, column: 31, scope: !2999, inlinedAt: !3132)
!3135 = !DILocation(line: 227, column: 4, scope: !2986, inlinedAt: !3119)
!3136 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3137)
!3137 = distinct !DILocation(line: 243, column: 22, scope: !1216, inlinedAt: !3119)
!3138 = !DILocation(line: 0, scope: !3009, inlinedAt: !3137)
!3139 = !DILocation(line: 0, scope: !3016, inlinedAt: !3140)
!3140 = distinct !DILocation(line: 243, column: 2, scope: !1216, inlinedAt: !3119)
!3141 = !DILocation(line: 0, scope: !3023, inlinedAt: !3142)
!3142 = distinct !DILocation(line: 477, column: 9, scope: !3016, inlinedAt: !3140)
!3143 = !DILocation(line: 420, column: 6, scope: !3023, inlinedAt: !3142)
!3144 = !DILocation(line: 0, scope: !3031, inlinedAt: !3145)
!3145 = distinct !DILocation(line: 421, column: 4, scope: !3036, inlinedAt: !3142)
!3146 = !DILocation(line: 354, column: 9, scope: !3031, inlinedAt: !3145)
!3147 = !DILocation(line: 354, column: 7, scope: !3031, inlinedAt: !3145)
!3148 = !DILocation(line: 421, column: 4, scope: !3036, inlinedAt: !3142)
!3149 = !DILocation(line: 431, column: 33, scope: !3041, inlinedAt: !3150)
!3150 = distinct !DILocation(line: 423, column: 4, scope: !3036, inlinedAt: !3142)
!3151 = !DILocation(line: 431, column: 2, scope: !3041, inlinedAt: !3150)
!3152 = !DILocation(line: 73, column: 41, scope: !2912)
!3153 = !DILocation(line: 73, column: 46, scope: !2912)
!3154 = !{!3155}
!3155 = distinct !{!3155, !3156, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_: argument 0"}
!3156 = distinct !{!3156, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_"}
!3157 = !DILocation(line: 73, column: 57, scope: !2912)
!3158 = !DILocalVariable(name: "__lhs", arg: 1, scope: !3159, file: !244, line: 3553, type: !806)
!3159 = distinct !DISubprogram(name: "operator+<char, std::char_traits<char>, std::allocator<char> >", linkageName: "_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_", scope: !27, file: !244, line: 3553, type: !3160, scopeLine: 3555, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, templateParams: !1077, retainedNodes: !3162)
!3160 = !DISubroutineType(types: !3161)
!3161 = !{!346, !806, !399}
!3162 = !{!3158, !3163}
!3163 = !DILocalVariable(name: "__rhs", arg: 2, scope: !3159, file: !244, line: 3554, type: !399)
!3164 = !DILocation(line: 0, scope: !3159, inlinedAt: !3165)
!3165 = distinct !DILocation(line: 73, column: 57, scope: !2912)
!3166 = !DILocalVariable(name: "this", arg: 1, scope: !3167, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3167 = distinct !DISubprogram(name: "append", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc", scope: !346, file: !244, line: 1432, type: !824, scopeLine: 1433, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !911, retainedNodes: !3168)
!3168 = !{!3166, !3169, !3170}
!3169 = !DILocalVariable(name: "__s", arg: 2, scope: !3167, file: !244, line: 1432, type: !399)
!3170 = !DILocalVariable(name: "__n", scope: !3167, file: !244, line: 1435, type: !351)
!3171 = !DILocation(line: 0, scope: !3167, inlinedAt: !3172)
!3172 = distinct !DILocation(line: 3555, column: 30, scope: !3159, inlinedAt: !3165)
!3173 = !DILocation(line: 0, scope: !2969, inlinedAt: !3174)
!3174 = distinct !DILocation(line: 1435, column: 24, scope: !3167, inlinedAt: !3172)
!3175 = !DILocalVariable(name: "this", arg: 1, scope: !3176, type: !3012, flags: DIFlagArtificial | DIFlagObjectPointer)
!3176 = distinct !DISubprogram(name: "_M_check_length", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_check_lengthEmmPKc", scope: !346, file: !244, line: 390, type: !742, scopeLine: 391, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !741, retainedNodes: !3177)
!3177 = !{!3175, !3178, !3179, !3180}
!3178 = !DILocalVariable(name: "__n1", arg: 2, scope: !3176, file: !244, line: 390, type: !352)
!3179 = !DILocalVariable(name: "__n2", arg: 3, scope: !3176, file: !244, line: 390, type: !352)
!3180 = !DILocalVariable(name: "__s", arg: 4, scope: !3176, file: !244, line: 390, type: !399)
!3181 = !DILocation(line: 0, scope: !3176, inlinedAt: !3182)
!3182 = distinct !DILocation(line: 1436, column: 2, scope: !3167, inlinedAt: !3172)
!3183 = !DILocalVariable(name: "this", arg: 1, scope: !3184, type: !3012, flags: DIFlagArtificial | DIFlagObjectPointer)
!3184 = distinct !DISubprogram(name: "size", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv", scope: !346, file: !244, line: 1063, type: !863, scopeLine: 1064, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !862, retainedNodes: !3185)
!3185 = !{!3183}
!3186 = !DILocation(line: 0, scope: !3184, inlinedAt: !3187)
!3187 = distinct !DILocation(line: 392, column: 32, scope: !3188, inlinedAt: !3182)
!3188 = distinct !DILexicalBlock(scope: !3176, file: !244, line: 392, column: 6)
!3189 = !DILocation(line: 1064, column: 16, scope: !3184, inlinedAt: !3187)
!3190 = !DILocation(line: 392, column: 47, scope: !3188, inlinedAt: !3182)
!3191 = !DILocation(line: 392, column: 6, scope: !3176, inlinedAt: !3182)
!3192 = !DILocation(line: 393, column: 4, scope: !3188, inlinedAt: !3182)
!3193 = !DILocation(line: 1437, column: 9, scope: !3167, inlinedAt: !3172)
!3194 = !DILocalVariable(name: "this", arg: 1, scope: !3195, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3195 = distinct !DISubprogram(name: "basic_string", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EOS4_", scope: !346, file: !244, line: 670, type: !804, scopeLine: 672, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !803, retainedNodes: !3196)
!3196 = !{!3194, !3197}
!3197 = !DILocalVariable(name: "__str", arg: 2, scope: !3195, file: !244, line: 670, type: !806)
!3198 = !DILocation(line: 0, scope: !3195, inlinedAt: !3199)
!3199 = distinct !DILocation(line: 3555, column: 14, scope: !3159, inlinedAt: !3165)
!3200 = !DILocation(line: 0, scope: !2964, inlinedAt: !3201)
!3201 = distinct !DILocation(line: 671, column: 21, scope: !3195, inlinedAt: !3199)
!3202 = !DILocation(line: 242, column: 51, scope: !2964, inlinedAt: !3201)
!3203 = !DILocation(line: 242, column: 50, scope: !2964, inlinedAt: !3201)
!3204 = !DILocalVariable(name: "this", arg: 1, scope: !3205, type: !2953, flags: DIFlagArtificial | DIFlagObjectPointer)
!3205 = distinct !DISubprogram(name: "_Alloc_hider", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC2EPcOS3_", scope: !465, file: !244, line: 204, type: !482, scopeLine: 205, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !481, retainedNodes: !3206)
!3206 = !{!3204, !3207, !3208}
!3207 = !DILocalVariable(name: "__dat", arg: 2, scope: !3205, file: !244, line: 204, type: !475)
!3208 = !DILocalVariable(name: "__a", arg: 3, scope: !3205, file: !244, line: 204, type: !484)
!3209 = !DILocation(line: 0, scope: !3205, inlinedAt: !3210)
!3210 = distinct !DILocation(line: 671, column: 9, scope: !3195, inlinedAt: !3199)
!3211 = !DILocation(line: 205, column: 36, scope: !3205, inlinedAt: !3210)
!3212 = !DILocalVariable(name: "this", arg: 1, scope: !3213, type: !3012, flags: DIFlagArtificial | DIFlagObjectPointer)
!3213 = distinct !DISubprogram(name: "_M_is_local", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_is_localEv", scope: !346, file: !244, line: 274, type: !715, scopeLine: 275, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !714, retainedNodes: !3214)
!3214 = !{!3212}
!3215 = !DILocation(line: 0, scope: !3213, inlinedAt: !3216)
!3216 = distinct !DILocation(line: 673, column: 12, scope: !3217, inlinedAt: !3199)
!3217 = distinct !DILexicalBlock(scope: !3218, file: !244, line: 673, column: 6)
!3218 = distinct !DILexicalBlock(scope: !3195, file: !244, line: 672, column: 7)
!3219 = !DILocation(line: 0, scope: !3009, inlinedAt: !3220)
!3220 = distinct !DILocation(line: 275, column: 16, scope: !3213, inlinedAt: !3216)
!3221 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3220)
!3222 = !DILocalVariable(name: "this", arg: 1, scope: !3223, type: !3012, flags: DIFlagArtificial | DIFlagObjectPointer)
!3223 = distinct !DISubprogram(name: "_M_local_data", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv", scope: !346, file: !244, line: 250, type: !707, scopeLine: 251, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !706, retainedNodes: !3224)
!3224 = !{!3222}
!3225 = !DILocation(line: 0, scope: !3223, inlinedAt: !3226)
!3226 = distinct !DILocation(line: 275, column: 29, scope: !3213, inlinedAt: !3216)
!3227 = !DILocation(line: 253, column: 57, scope: !3223, inlinedAt: !3226)
!3228 = !DILocation(line: 253, column: 56, scope: !3223, inlinedAt: !3226)
!3229 = !DILocation(line: 275, column: 26, scope: !3213, inlinedAt: !3216)
!3230 = !DILocation(line: 673, column: 6, scope: !3218, inlinedAt: !3199)
!3231 = !DILocalVariable(name: "this", arg: 1, scope: !3232, type: !3012, flags: DIFlagArtificial | DIFlagObjectPointer)
!3232 = distinct !DISubprogram(name: "length", linkageName: "_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6lengthEv", scope: !346, file: !244, line: 1070, type: !863, scopeLine: 1071, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !865, retainedNodes: !3233)
!3233 = !{!3231}
!3234 = !DILocation(line: 0, scope: !3232, inlinedAt: !3235)
!3235 = distinct !DILocation(line: 676, column: 16, scope: !3236, inlinedAt: !3199)
!3236 = distinct !DILexicalBlock(scope: !3217, file: !244, line: 674, column: 4)
!3237 = !DILocation(line: 1071, column: 16, scope: !3232, inlinedAt: !3235)
!3238 = !DILocation(line: 676, column: 25, scope: !3236, inlinedAt: !3199)
!3239 = !DILocation(line: 0, scope: !3041, inlinedAt: !3240)
!3240 = distinct !DILocation(line: 675, column: 6, scope: !3236, inlinedAt: !3199)
!3241 = !DILocation(line: 425, column: 10, scope: !3242, inlinedAt: !3240)
!3242 = distinct !DILexicalBlock(scope: !3041, file: !637, line: 425, column: 6)
!3243 = !DILocation(line: 425, column: 6, scope: !3041, inlinedAt: !3240)
!3244 = !DILocation(line: 431, column: 33, scope: !3041, inlinedAt: !3240)
!3245 = !DILocation(line: 431, column: 2, scope: !3041, inlinedAt: !3240)
!3246 = !DILocation(line: 0, scope: !3009, inlinedAt: !3247)
!3247 = distinct !DILocation(line: 680, column: 20, scope: !3248, inlinedAt: !3199)
!3248 = distinct !DILexicalBlock(scope: !3217, file: !244, line: 679, column: 4)
!3249 = !DILocation(line: 0, scope: !2988, inlinedAt: !3250)
!3250 = distinct !DILocation(line: 680, column: 6, scope: !3248, inlinedAt: !3199)
!3251 = !DILocation(line: 225, column: 21, scope: !2988, inlinedAt: !3250)
!3252 = !DILocation(line: 225, column: 26, scope: !2988, inlinedAt: !3250)
!3253 = !DILocation(line: 681, column: 24, scope: !3248, inlinedAt: !3199)
!3254 = !DILocation(line: 0, scope: !2999, inlinedAt: !3255)
!3255 = distinct !DILocation(line: 681, column: 6, scope: !3248, inlinedAt: !3199)
!3256 = !DILocation(line: 262, column: 9, scope: !2999, inlinedAt: !3255)
!3257 = !DILocation(line: 262, column: 31, scope: !2999, inlinedAt: !3255)
!3258 = !DILocation(line: 0, scope: !3232, inlinedAt: !3259)
!3259 = distinct !DILocation(line: 687, column: 18, scope: !3218, inlinedAt: !3199)
!3260 = !DILocation(line: 1071, column: 16, scope: !3232, inlinedAt: !3259)
!3261 = !DILocation(line: 0, scope: !3071, inlinedAt: !3262)
!3262 = distinct !DILocation(line: 687, column: 2, scope: !3218, inlinedAt: !3199)
!3263 = !DILocation(line: 230, column: 9, scope: !3071, inlinedAt: !3262)
!3264 = !DILocation(line: 230, column: 26, scope: !3071, inlinedAt: !3262)
!3265 = !DILocation(line: 0, scope: !2964, inlinedAt: !3266)
!3266 = distinct !DILocation(line: 688, column: 22, scope: !3218, inlinedAt: !3199)
!3267 = !DILocation(line: 0, scope: !2988, inlinedAt: !3268)
!3268 = distinct !DILocation(line: 688, column: 8, scope: !3218, inlinedAt: !3199)
!3269 = !DILocation(line: 225, column: 26, scope: !2988, inlinedAt: !3268)
!3270 = !DILocation(line: 0, scope: !3065, inlinedAt: !3271)
!3271 = distinct !DILocation(line: 689, column: 8, scope: !3218, inlinedAt: !3199)
!3272 = !DILocation(line: 0, scope: !3071, inlinedAt: !3273)
!3273 = distinct !DILocation(line: 268, column: 2, scope: !3065, inlinedAt: !3271)
!3274 = !DILocation(line: 230, column: 26, scope: !3071, inlinedAt: !3273)
!3275 = !DILocation(line: 0, scope: !3009, inlinedAt: !3276)
!3276 = distinct !DILocation(line: 269, column: 22, scope: !3065, inlinedAt: !3271)
!3277 = !DILocation(line: 0, scope: !3031, inlinedAt: !3278)
!3278 = distinct !DILocation(line: 269, column: 2, scope: !3065, inlinedAt: !3271)
!3279 = !DILocation(line: 354, column: 7, scope: !3031, inlinedAt: !3278)
!3280 = !DILocalVariable(name: "this", arg: 1, scope: !3281, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3281 = distinct !DISubprogram(name: "~basic_string", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev", scope: !346, file: !244, line: 794, type: !722, scopeLine: 795, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !818, retainedNodes: !3282)
!3282 = !{!3280}
!3283 = !DILocation(line: 0, scope: !3281, inlinedAt: !3284)
!3284 = distinct !DILocation(line: 71, column: 38, scope: !2912)
!3285 = !DILocalVariable(name: "this", arg: 1, scope: !3286, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3286 = distinct !DISubprogram(name: "_M_dispose", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv", scope: !346, file: !244, line: 284, type: !722, scopeLine: 285, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !721, retainedNodes: !3287)
!3287 = !{!3285}
!3288 = !DILocation(line: 0, scope: !3286, inlinedAt: !3289)
!3289 = distinct !DILocation(line: 795, column: 9, scope: !3290, inlinedAt: !3284)
!3290 = distinct !DILexicalBlock(scope: !3281, file: !244, line: 795, column: 7)
!3291 = !DILocation(line: 0, scope: !3213, inlinedAt: !3292)
!3292 = distinct !DILocation(line: 286, column: 7, scope: !3293, inlinedAt: !3289)
!3293 = distinct !DILexicalBlock(scope: !3286, file: !244, line: 286, column: 6)
!3294 = !DILocation(line: 0, scope: !3009, inlinedAt: !3295)
!3295 = distinct !DILocation(line: 275, column: 16, scope: !3213, inlinedAt: !3292)
!3296 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3295)
!3297 = !DILocation(line: 0, scope: !3223, inlinedAt: !3298)
!3298 = distinct !DILocation(line: 275, column: 29, scope: !3213, inlinedAt: !3292)
!3299 = !DILocation(line: 253, column: 57, scope: !3223, inlinedAt: !3298)
!3300 = !DILocation(line: 253, column: 56, scope: !3223, inlinedAt: !3298)
!3301 = !DILocation(line: 275, column: 26, scope: !3213, inlinedAt: !3292)
!3302 = !DILocation(line: 286, column: 6, scope: !3286, inlinedAt: !3289)
!3303 = !DILocalVariable(name: "this", arg: 1, scope: !3304, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3304 = distinct !DISubprogram(name: "_M_destroy", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_destroyEm", scope: !346, file: !244, line: 292, type: !696, scopeLine: 293, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !724, retainedNodes: !3305)
!3305 = !{!3303, !3306}
!3306 = !DILocalVariable(name: "__size", arg: 2, scope: !3304, file: !244, line: 292, type: !352)
!3307 = !DILocation(line: 0, scope: !3304, inlinedAt: !3308)
!3308 = distinct !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3289)
!3309 = !DILocation(line: 0, scope: !3009, inlinedAt: !3310)
!3310 = distinct !DILocation(line: 293, column: 55, scope: !3304, inlinedAt: !3308)
!3311 = !DILocalVariable(name: "__a", arg: 1, scope: !3312, file: !360, line: 495, type: !367)
!3312 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZNSt16allocator_traitsISaIcEE10deallocateERS0_Pcm", scope: !359, file: !360, line: 495, type: !437, scopeLine: 496, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !436, retainedNodes: !3313)
!3313 = !{!3311, !3314, !3315}
!3314 = !DILocalVariable(name: "__p", arg: 2, scope: !3312, file: !360, line: 495, type: !365)
!3315 = !DILocalVariable(name: "__n", arg: 3, scope: !3312, file: !360, line: 495, type: !431)
!3316 = !DILocation(line: 0, scope: !3312, inlinedAt: !3317)
!3317 = distinct !DILocation(line: 293, column: 9, scope: !3304, inlinedAt: !3308)
!3318 = !DILocalVariable(name: "this", arg: 1, scope: !3319, type: !3323, flags: DIFlagArtificial | DIFlagObjectPointer)
!3319 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZNSt15__new_allocatorIcE10deallocateEPcm", scope: !375, file: !376, line: 142, type: !407, scopeLine: 143, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !406, retainedNodes: !3320)
!3320 = !{!3318, !3321, !3322}
!3321 = !DILocalVariable(name: "__p", arg: 2, scope: !3319, file: !376, line: 142, type: !366)
!3322 = !DILocalVariable(name: "__n", arg: 3, scope: !3319, file: !376, line: 142, type: !405)
!3323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !375, size: 64)
!3324 = !DILocation(line: 0, scope: !3319, inlinedAt: !3325)
!3325 = distinct !DILocation(line: 496, column: 13, scope: !3312, inlinedAt: !3317)
!3326 = !DILocation(line: 158, column: 2, scope: !3319, inlinedAt: !3325)
!3327 = !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3289)
!3328 = !DILocation(line: 71, column: 38, scope: !2912)
!3329 = !DILocation(line: 247, column: 16, scope: !1216, inlinedAt: !3119)
!3330 = !DILocation(line: 0, scope: !3065, inlinedAt: !3331)
!3331 = distinct !DILocation(line: 247, column: 2, scope: !1216, inlinedAt: !3119)
!3332 = !DILocation(line: 0, scope: !3071, inlinedAt: !3333)
!3333 = distinct !DILocation(line: 268, column: 2, scope: !3065, inlinedAt: !3331)
!3334 = !DILocation(line: 230, column: 9, scope: !3071, inlinedAt: !3333)
!3335 = !DILocation(line: 230, column: 26, scope: !3071, inlinedAt: !3333)
!3336 = !DILocation(line: 0, scope: !3009, inlinedAt: !3337)
!3337 = distinct !DILocation(line: 269, column: 22, scope: !3065, inlinedAt: !3331)
!3338 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3337)
!3339 = !DILocation(line: 269, column: 22, scope: !3065, inlinedAt: !3331)
!3340 = !DILocation(line: 0, scope: !3031, inlinedAt: !3341)
!3341 = distinct !DILocation(line: 269, column: 2, scope: !3065, inlinedAt: !3331)
!3342 = !DILocation(line: 354, column: 7, scope: !3031, inlinedAt: !3341)
!3343 = !DILocation(line: 248, column: 7, scope: !1216, inlinedAt: !3119)
!3344 = !DILocation(line: 75, column: 37, scope: !2912)
!3345 = !DILocation(line: 74, column: 20, scope: !2912)
!3346 = !DILocation(line: 77, column: 7, scope: !2912)
!3347 = !DILocalVariable(name: "devPtr", arg: 1, scope: !3348, file: !90, line: 6944, type: !3351)
!3348 = distinct !DISubprogram(name: "hipMalloc<scabbard::trace::DeviceAsyncQueue>", linkageName: "_ZL9hipMallocIN8scabbard5trace16DeviceAsyncQueueEE10hipError_tPPT_m", scope: !90, file: !90, line: 6944, type: !3349, scopeLine: 6944, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !248, templateParams: !3354, retainedNodes: !3352)
!3349 = !DISubroutineType(cc: DW_CC_nocall, types: !3350)
!3350 = !{!2921, !3351, !15}
!3351 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!3352 = !{!3347, !3353}
!3353 = !DILocalVariable(name: "size", arg: 2, scope: !3348, file: !90, line: 6944, type: !15)
!3354 = !{!3355}
!3355 = !DITemplateTypeParameter(name: "T", type: !6)
!3356 = !DILocation(line: 0, scope: !3348, inlinedAt: !3357)
!3357 = distinct !DILocation(line: 78, column: 21, scope: !2925)
!3358 = !DILocation(line: 6945, column: 22, scope: !3348, inlinedAt: !3357)
!3359 = !DILocation(line: 6945, column: 12, scope: !3348, inlinedAt: !3357)
!3360 = !DILocation(line: 78, column: 65, scope: !2925)
!3361 = !DILocation(line: 78, column: 11, scope: !2912)
!3362 = !DILocalVariable(name: "__out", arg: 1, scope: !3363, file: !3364, line: 615, type: !3367)
!3363 = distinct !DISubprogram(name: "operator<<<std::char_traits<char> >", linkageName: "_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc", scope: !27, file: !3364, line: 615, type: !3365, scopeLine: 616, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, templateParams: !3372, retainedNodes: !3370)
!3364 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ostream", directory: "")
!3365 = !DISubroutineType(types: !3366)
!3366 = !{!3367, !3367, !399}
!3367 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !3368, size: 64)
!3368 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ostream<char, std::char_traits<char> >", scope: !27, file: !3369, line: 340, size: 2176, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!3369 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/ostream.tcc", directory: "")
!3370 = !{!3362, !3371}
!3371 = !DILocalVariable(name: "__s", arg: 2, scope: !3363, file: !3364, line: 615, type: !399)
!3372 = !{!635}
!3373 = !DILocation(line: 0, scope: !3363, inlinedAt: !3374)
!3374 = distinct !DILocation(line: 79, column: 19, scope: !2924)
!3375 = !DILocation(line: 0, scope: !2969, inlinedAt: !3376)
!3376 = distinct !DILocation(line: 621, column: 29, scope: !3377, inlinedAt: !3374)
!3377 = distinct !DILexicalBlock(scope: !3363, file: !3364, line: 617, column: 11)
!3378 = !DILocation(line: 620, column: 2, scope: !3377, inlinedAt: !3374)
!3379 = !DILocation(line: 79, column: 129, scope: !2924)
!3380 = !DILocation(line: 0, scope: !3363, inlinedAt: !3381)
!3381 = distinct !DILocation(line: 79, column: 139, scope: !2924)
!3382 = !DILocation(line: 0, scope: !2969, inlinedAt: !3383)
!3383 = distinct !DILocation(line: 621, column: 29, scope: !3377, inlinedAt: !3381)
!3384 = !DILocation(line: 620, column: 2, scope: !3377, inlinedAt: !3381)
!3385 = !DILocalVariable(name: "this", arg: 1, scope: !3386, type: !3398, flags: DIFlagArtificial | DIFlagObjectPointer)
!3386 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !3368, file: !3364, line: 108, type: !3387, scopeLine: 109, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !3395, retainedNodes: !3396)
!3387 = !DISubroutineType(types: !3388)
!3388 = !{!3389, !3391, !3392}
!3389 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !3390, size: 64)
!3390 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ostream_type", scope: !3368, file: !3364, line: 71, baseType: !3368)
!3391 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3368, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!3392 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3393, size: 64)
!3393 = !DISubroutineType(types: !3394)
!3394 = !{!3389, !3389}
!3395 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !3368, file: !3364, line: 108, type: !3387, scopeLine: 108, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!3396 = !{!3385, !3397}
!3397 = !DILocalVariable(name: "__pf", arg: 2, scope: !3386, file: !3364, line: 108, type: !3392)
!3398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3368, size: 64)
!3399 = !DILocation(line: 0, scope: !3386, inlinedAt: !3400)
!3400 = distinct !DILocation(line: 80, column: 19, scope: !2924)
!3401 = !DILocation(line: 113, column: 9, scope: !3386, inlinedAt: !3400)
!3402 = !DILocation(line: 81, column: 9, scope: !2924)
!3403 = !DILocation(line: 0, scope: !2924)
!3404 = !DILocation(line: 81, column: 13, scope: !2924)
!3405 = !{!3406, !3406, i64 0}
!3406 = !{!"int", !2961, i64 0}
!3407 = !DILocation(line: 82, column: 20, scope: !3408)
!3408 = distinct !DILexicalBlock(scope: !2924, file: !181, line: 82, column: 13)
!3409 = !DILocation(line: 82, column: 13, scope: !2924)
!3410 = !DILocation(line: 83, column: 25, scope: !3411)
!3411 = distinct !DILexicalBlock(scope: !3412, file: !181, line: 83, column: 15)
!3412 = distinct !DILexicalBlock(scope: !3408, file: !181, line: 82, column: 46)
!3413 = !DILocation(line: 83, column: 59, scope: !3411)
!3414 = !DILocation(line: 0, scope: !3363, inlinedAt: !3415)
!3415 = distinct !DILocation(line: 84, column: 23, scope: !3411)
!3416 = !DILocation(line: 0, scope: !3363, inlinedAt: !3417)
!3417 = distinct !DILocation(line: 87, column: 23, scope: !3411)
!3418 = !DILocation(line: 83, column: 15, scope: !3412)
!3419 = !DILocation(line: 0, scope: !2969, inlinedAt: !3420)
!3420 = distinct !DILocation(line: 621, column: 29, scope: !3377, inlinedAt: !3415)
!3421 = !DILocation(line: 620, column: 2, scope: !3377, inlinedAt: !3415)
!3422 = !DILocation(line: 84, column: 76, scope: !3411)
!3423 = !DILocation(line: 84, column: 73, scope: !3411)
!3424 = !DILocation(line: 0, scope: !3363, inlinedAt: !3425)
!3425 = distinct !DILocation(line: 84, column: 89, scope: !3411)
!3426 = !DILocation(line: 0, scope: !2969, inlinedAt: !3427)
!3427 = distinct !DILocation(line: 621, column: 29, scope: !3377, inlinedAt: !3425)
!3428 = !DILocation(line: 620, column: 2, scope: !3377, inlinedAt: !3425)
!3429 = !DILocation(line: 103, column: 5, scope: !2912)
!3430 = !DILocation(line: 0, scope: !3281, inlinedAt: !3431)
!3431 = distinct !DILocation(line: 71, column: 38, scope: !2912)
!3432 = !DILocation(line: 0, scope: !3286, inlinedAt: !3433)
!3433 = distinct !DILocation(line: 795, column: 9, scope: !3290, inlinedAt: !3431)
!3434 = !DILocation(line: 0, scope: !3213, inlinedAt: !3435)
!3435 = distinct !DILocation(line: 286, column: 7, scope: !3293, inlinedAt: !3433)
!3436 = !DILocation(line: 0, scope: !3009, inlinedAt: !3437)
!3437 = distinct !DILocation(line: 275, column: 16, scope: !3213, inlinedAt: !3435)
!3438 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3437)
!3439 = !DILocation(line: 0, scope: !3223, inlinedAt: !3440)
!3440 = distinct !DILocation(line: 275, column: 29, scope: !3213, inlinedAt: !3435)
!3441 = !DILocation(line: 253, column: 57, scope: !3223, inlinedAt: !3440)
!3442 = !DILocation(line: 253, column: 56, scope: !3223, inlinedAt: !3440)
!3443 = !DILocation(line: 275, column: 26, scope: !3213, inlinedAt: !3435)
!3444 = !DILocation(line: 286, column: 6, scope: !3286, inlinedAt: !3433)
!3445 = !DILocation(line: 0, scope: !3304, inlinedAt: !3446)
!3446 = distinct !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3433)
!3447 = !DILocation(line: 0, scope: !3009, inlinedAt: !3448)
!3448 = distinct !DILocation(line: 293, column: 55, scope: !3304, inlinedAt: !3446)
!3449 = !DILocation(line: 0, scope: !3312, inlinedAt: !3450)
!3450 = distinct !DILocation(line: 293, column: 9, scope: !3304, inlinedAt: !3446)
!3451 = !DILocation(line: 0, scope: !3319, inlinedAt: !3452)
!3452 = distinct !DILocation(line: 496, column: 13, scope: !3312, inlinedAt: !3450)
!3453 = !DILocation(line: 158, column: 2, scope: !3319, inlinedAt: !3452)
!3454 = !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3433)
!3455 = !DILocation(line: 74, column: 7, scope: !2912)
!3456 = !DILocation(line: 103, column: 5, scope: !2925)
!3457 = !DILocation(line: 103, column: 5, scope: !3411)
!3458 = !DILocation(line: 91, column: 7, scope: !2925)
!3459 = !DILocation(line: 0, scope: !2969, inlinedAt: !3460)
!3460 = distinct !DILocation(line: 621, column: 29, scope: !3377, inlinedAt: !3417)
!3461 = !DILocation(line: 620, column: 2, scope: !3377, inlinedAt: !3417)
!3462 = !DILocation(line: 87, column: 123, scope: !3411)
!3463 = !DILocation(line: 0, scope: !3363, inlinedAt: !3464)
!3464 = distinct !DILocation(line: 87, column: 133, scope: !3411)
!3465 = !DILocation(line: 0, scope: !2969, inlinedAt: !3466)
!3466 = distinct !DILocation(line: 621, column: 29, scope: !3377, inlinedAt: !3464)
!3467 = !DILocation(line: 620, column: 2, scope: !3377, inlinedAt: !3464)
!3468 = !DILocation(line: 0, scope: !3411)
!3469 = !DILocation(line: 90, column: 9, scope: !2924)
!3470 = !DILocation(line: 92, column: 7, scope: !2912)
!3471 = !DILocation(line: 92, column: 24, scope: !2912)
!3472 = !DILocation(line: 93, column: 21, scope: !3473)
!3473 = distinct !DILexicalBlock(scope: !2912, file: !181, line: 93, column: 11)
!3474 = !{!2960, !2960, i64 0}
!3475 = !DILocation(line: 93, column: 11, scope: !3473)
!3476 = !DILocation(line: 94, column: 13, scope: !3473)
!3477 = !DILocation(line: 93, column: 11, scope: !2912)
!3478 = !DILocation(line: 0, scope: !3363, inlinedAt: !3479)
!3479 = distinct !DILocation(line: 95, column: 19, scope: !3480)
!3480 = distinct !DILexicalBlock(scope: !3473, file: !181, line: 94, column: 28)
!3481 = !DILocation(line: 0, scope: !2969, inlinedAt: !3482)
!3482 = distinct !DILocation(line: 621, column: 29, scope: !3377, inlinedAt: !3479)
!3483 = !DILocation(line: 620, column: 2, scope: !3377, inlinedAt: !3479)
!3484 = !DILocation(line: 95, column: 140, scope: !3480)
!3485 = !DILocation(line: 0, scope: !3363, inlinedAt: !3486)
!3486 = distinct !DILocation(line: 95, column: 150, scope: !3480)
!3487 = !DILocation(line: 0, scope: !2969, inlinedAt: !3488)
!3488 = distinct !DILocation(line: 621, column: 29, scope: !3377, inlinedAt: !3486)
!3489 = !DILocation(line: 620, column: 2, scope: !3377, inlinedAt: !3486)
!3490 = !DILocation(line: 0, scope: !3386, inlinedAt: !3491)
!3491 = distinct !DILocation(line: 96, column: 19, scope: !3480)
!3492 = !DILocation(line: 113, column: 9, scope: !3386, inlinedAt: !3491)
!3493 = !DILocation(line: 97, column: 9, scope: !3480)
!3494 = !DILocation(line: 99, column: 29, scope: !2912)
!3495 = !DILocation(line: 99, column: 27, scope: !2912)
!3496 = !DILocation(line: 100, column: 20, scope: !2912)
!3497 = !DILocation(line: 102, column: 20, scope: !2912)
!3498 = !DILocation(line: 0, scope: !3281, inlinedAt: !3499)
!3499 = distinct !DILocation(line: 103, column: 5, scope: !2912)
!3500 = !DILocation(line: 0, scope: !3286, inlinedAt: !3501)
!3501 = distinct !DILocation(line: 795, column: 9, scope: !3290, inlinedAt: !3499)
!3502 = !DILocation(line: 0, scope: !3213, inlinedAt: !3503)
!3503 = distinct !DILocation(line: 286, column: 7, scope: !3293, inlinedAt: !3501)
!3504 = !DILocation(line: 0, scope: !3009, inlinedAt: !3505)
!3505 = distinct !DILocation(line: 275, column: 16, scope: !3213, inlinedAt: !3503)
!3506 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3505)
!3507 = !DILocation(line: 0, scope: !3223, inlinedAt: !3508)
!3508 = distinct !DILocation(line: 275, column: 29, scope: !3213, inlinedAt: !3503)
!3509 = !DILocation(line: 253, column: 57, scope: !3223, inlinedAt: !3508)
!3510 = !DILocation(line: 253, column: 56, scope: !3223, inlinedAt: !3508)
!3511 = !DILocation(line: 275, column: 26, scope: !3213, inlinedAt: !3503)
!3512 = !DILocation(line: 286, column: 6, scope: !3286, inlinedAt: !3501)
!3513 = !DILocation(line: 0, scope: !3304, inlinedAt: !3514)
!3514 = distinct !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3501)
!3515 = !DILocation(line: 0, scope: !3009, inlinedAt: !3516)
!3516 = distinct !DILocation(line: 293, column: 55, scope: !3304, inlinedAt: !3514)
!3517 = !DILocation(line: 0, scope: !3312, inlinedAt: !3518)
!3518 = distinct !DILocation(line: 293, column: 9, scope: !3304, inlinedAt: !3514)
!3519 = !DILocation(line: 0, scope: !3319, inlinedAt: !3520)
!3520 = distinct !DILocation(line: 496, column: 13, scope: !3312, inlinedAt: !3518)
!3521 = !DILocation(line: 158, column: 2, scope: !3319, inlinedAt: !3520)
!3522 = !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3501)
!3523 = !DILocation(line: 0, scope: !3281, inlinedAt: !3524)
!3524 = distinct !DILocation(line: 103, column: 5, scope: !2912)
!3525 = !DILocation(line: 0, scope: !3286, inlinedAt: !3526)
!3526 = distinct !DILocation(line: 795, column: 9, scope: !3290, inlinedAt: !3524)
!3527 = !DILocation(line: 0, scope: !3213, inlinedAt: !3528)
!3528 = distinct !DILocation(line: 286, column: 7, scope: !3293, inlinedAt: !3526)
!3529 = !DILocation(line: 0, scope: !3009, inlinedAt: !3530)
!3530 = distinct !DILocation(line: 275, column: 16, scope: !3213, inlinedAt: !3528)
!3531 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3530)
!3532 = !DILocation(line: 0, scope: !3223, inlinedAt: !3533)
!3533 = distinct !DILocation(line: 275, column: 29, scope: !3213, inlinedAt: !3528)
!3534 = !DILocation(line: 253, column: 57, scope: !3223, inlinedAt: !3533)
!3535 = !DILocation(line: 253, column: 56, scope: !3223, inlinedAt: !3533)
!3536 = !DILocation(line: 275, column: 26, scope: !3213, inlinedAt: !3528)
!3537 = !DILocation(line: 286, column: 6, scope: !3286, inlinedAt: !3526)
!3538 = !DILocation(line: 0, scope: !3304, inlinedAt: !3539)
!3539 = distinct !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3526)
!3540 = !DILocation(line: 0, scope: !3009, inlinedAt: !3541)
!3541 = distinct !DILocation(line: 293, column: 55, scope: !3304, inlinedAt: !3539)
!3542 = !DILocation(line: 0, scope: !3312, inlinedAt: !3543)
!3543 = distinct !DILocation(line: 293, column: 9, scope: !3304, inlinedAt: !3539)
!3544 = !DILocation(line: 0, scope: !3319, inlinedAt: !3545)
!3545 = distinct !DILocation(line: 496, column: 13, scope: !3312, inlinedAt: !3543)
!3546 = !DILocation(line: 158, column: 2, scope: !3319, inlinedAt: !3545)
!3547 = !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3526)
!3548 = !DILocation(line: 0, scope: !3281, inlinedAt: !3549)
!3549 = distinct !DILocation(line: 103, column: 5, scope: !2912)
!3550 = !DILocation(line: 0, scope: !3286, inlinedAt: !3551)
!3551 = distinct !DILocation(line: 795, column: 9, scope: !3290, inlinedAt: !3549)
!3552 = !DILocation(line: 0, scope: !3213, inlinedAt: !3553)
!3553 = distinct !DILocation(line: 286, column: 7, scope: !3293, inlinedAt: !3551)
!3554 = !DILocation(line: 0, scope: !3009, inlinedAt: !3555)
!3555 = distinct !DILocation(line: 275, column: 16, scope: !3213, inlinedAt: !3553)
!3556 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3555)
!3557 = !DILocation(line: 0, scope: !3223, inlinedAt: !3558)
!3558 = distinct !DILocation(line: 275, column: 29, scope: !3213, inlinedAt: !3553)
!3559 = !DILocation(line: 253, column: 57, scope: !3223, inlinedAt: !3558)
!3560 = !DILocation(line: 253, column: 56, scope: !3223, inlinedAt: !3558)
!3561 = !DILocation(line: 275, column: 26, scope: !3213, inlinedAt: !3553)
!3562 = !DILocation(line: 286, column: 6, scope: !3286, inlinedAt: !3551)
!3563 = !DILocation(line: 0, scope: !3304, inlinedAt: !3564)
!3564 = distinct !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3551)
!3565 = !DILocation(line: 0, scope: !3009, inlinedAt: !3566)
!3566 = distinct !DILocation(line: 293, column: 55, scope: !3304, inlinedAt: !3564)
!3567 = !DILocation(line: 0, scope: !3312, inlinedAt: !3568)
!3568 = distinct !DILocation(line: 293, column: 9, scope: !3304, inlinedAt: !3564)
!3569 = !DILocation(line: 0, scope: !3319, inlinedAt: !3570)
!3570 = distinct !DILocation(line: 496, column: 13, scope: !3312, inlinedAt: !3568)
!3571 = !DILocation(line: 158, column: 2, scope: !3319, inlinedAt: !3570)
!3572 = !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3551)
!3573 = !DILocation(line: 0, scope: !3281, inlinedAt: !3574)
!3574 = distinct !DILocation(line: 103, column: 5, scope: !2912)
!3575 = !DILocation(line: 0, scope: !3286, inlinedAt: !3576)
!3576 = distinct !DILocation(line: 795, column: 9, scope: !3290, inlinedAt: !3574)
!3577 = !DILocation(line: 0, scope: !3213, inlinedAt: !3578)
!3578 = distinct !DILocation(line: 286, column: 7, scope: !3293, inlinedAt: !3576)
!3579 = !DILocation(line: 0, scope: !3009, inlinedAt: !3580)
!3580 = distinct !DILocation(line: 275, column: 16, scope: !3213, inlinedAt: !3578)
!3581 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3580)
!3582 = !DILocation(line: 0, scope: !3223, inlinedAt: !3583)
!3583 = distinct !DILocation(line: 275, column: 29, scope: !3213, inlinedAt: !3578)
!3584 = !DILocation(line: 253, column: 57, scope: !3223, inlinedAt: !3583)
!3585 = !DILocation(line: 253, column: 56, scope: !3223, inlinedAt: !3583)
!3586 = !DILocation(line: 275, column: 26, scope: !3213, inlinedAt: !3578)
!3587 = !DILocation(line: 286, column: 6, scope: !3286, inlinedAt: !3576)
!3588 = !DILocation(line: 0, scope: !3304, inlinedAt: !3589)
!3589 = distinct !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3576)
!3590 = !DILocation(line: 0, scope: !3009, inlinedAt: !3591)
!3591 = distinct !DILocation(line: 293, column: 55, scope: !3304, inlinedAt: !3589)
!3592 = !DILocation(line: 0, scope: !3312, inlinedAt: !3593)
!3593 = distinct !DILocation(line: 293, column: 9, scope: !3304, inlinedAt: !3589)
!3594 = !DILocation(line: 0, scope: !3319, inlinedAt: !3595)
!3595 = distinct !DILocation(line: 496, column: 13, scope: !3312, inlinedAt: !3593)
!3596 = !DILocation(line: 158, column: 2, scope: !3319, inlinedAt: !3595)
!3597 = !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3576)
!3598 = !DISubprogram(name: "getenv", scope: !1253, file: !1253, line: 641, type: !1657, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !472)
!3599 = distinct !DISubprogram(name: "operator+<char, std::char_traits<char>, std::allocator<char> >", linkageName: "_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_RKS8_", scope: !27, file: !347, line: 606, type: !3600, scopeLine: 608, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, templateParams: !1077, retainedNodes: !3602)
!3600 = !DISubroutineType(types: !3601)
!3601 = !{!346, !399, !779}
!3602 = !{!3603, !3604, !3605, !3608}
!3603 = !DILocalVariable(name: "__lhs", arg: 1, scope: !3599, file: !347, line: 606, type: !399)
!3604 = !DILocalVariable(name: "__rhs", arg: 2, scope: !3599, file: !347, line: 607, type: !779)
!3605 = !DILocalVariable(name: "__len", scope: !3599, file: !347, line: 615, type: !3606)
!3606 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3607)
!3607 = !DIDerivedType(tag: DW_TAG_typedef, name: "__size_type", scope: !3599, file: !347, line: 611, baseType: !352)
!3608 = !DILocalVariable(name: "__str", scope: !3599, file: !347, line: 616, type: !3609)
!3609 = !DIDerivedType(tag: DW_TAG_typedef, name: "__string_type", scope: !3599, file: !347, line: 610, baseType: !346)
!3610 = !DILocation(line: 0, scope: !3599)
!3611 = !DILocation(line: 0, scope: !2969, inlinedAt: !3612)
!3612 = distinct !DILocation(line: 615, column: 33, scope: !3599)
!3613 = !DILocation(line: 395, column: 9, scope: !2969, inlinedAt: !3612)
!3614 = !DILocalVariable(name: "this", arg: 1, scope: !3615, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3615 = distinct !DISubprogram(name: "basic_string", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS3_", scope: !346, file: !244, line: 528, type: !788, scopeLine: 530, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !787, retainedNodes: !3616)
!3616 = !{!3614, !3617}
!3617 = !DILocalVariable(name: "__a", arg: 2, scope: !3615, file: !244, line: 528, type: !422)
!3618 = !DILocation(line: 0, scope: !3615, inlinedAt: !3619)
!3619 = distinct !DILocation(line: 616, column: 21, scope: !3599)
!3620 = !DILocation(line: 0, scope: !2964, inlinedAt: !3621)
!3621 = distinct !DILocation(line: 529, column: 21, scope: !3615, inlinedAt: !3619)
!3622 = !DILocation(line: 242, column: 51, scope: !2964, inlinedAt: !3621)
!3623 = !DILocation(line: 0, scope: !2949, inlinedAt: !3624)
!3624 = distinct !DILocation(line: 529, column: 9, scope: !3615, inlinedAt: !3619)
!3625 = !DILocation(line: 201, column: 25, scope: !2949, inlinedAt: !3624)
!3626 = !DILocation(line: 0, scope: !2964, inlinedAt: !3627)
!3627 = distinct !DILocation(line: 358, column: 9, scope: !3628, inlinedAt: !3631)
!3628 = distinct !DISubprogram(name: "_M_use_local_data", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE17_M_use_local_dataEv", scope: !346, file: !244, line: 352, type: !704, scopeLine: 353, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !737, retainedNodes: !3629)
!3629 = !{!3630}
!3630 = !DILocalVariable(name: "this", arg: 1, scope: !3628, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3631 = distinct !DILocation(line: 531, column: 2, scope: !3632, inlinedAt: !3619)
!3632 = distinct !DILexicalBlock(scope: !3615, file: !244, line: 530, column: 7)
!3633 = !DILocation(line: 0, scope: !3065, inlinedAt: !3634)
!3634 = distinct !DILocation(line: 532, column: 2, scope: !3632, inlinedAt: !3619)
!3635 = !DILocation(line: 0, scope: !3071, inlinedAt: !3636)
!3636 = distinct !DILocation(line: 268, column: 2, scope: !3065, inlinedAt: !3634)
!3637 = !DILocation(line: 230, column: 9, scope: !3071, inlinedAt: !3636)
!3638 = !DILocation(line: 230, column: 26, scope: !3071, inlinedAt: !3636)
!3639 = !DILocation(line: 0, scope: !3009, inlinedAt: !3640)
!3640 = distinct !DILocation(line: 269, column: 22, scope: !3065, inlinedAt: !3634)
!3641 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3640)
!3642 = !DILocation(line: 0, scope: !3031, inlinedAt: !3643)
!3643 = distinct !DILocation(line: 269, column: 2, scope: !3065, inlinedAt: !3634)
!3644 = !DILocation(line: 354, column: 7, scope: !3031, inlinedAt: !3643)
!3645 = !DILocation(line: 0, scope: !3184, inlinedAt: !3646)
!3646 = distinct !DILocation(line: 618, column: 35, scope: !3599)
!3647 = !DILocation(line: 1064, column: 16, scope: !3184, inlinedAt: !3646)
!3648 = !DILocation(line: 618, column: 27, scope: !3599)
!3649 = !DILocation(line: 618, column: 13, scope: !3599)
!3650 = !DILocalVariable(name: "this", arg: 1, scope: !3651, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3651 = distinct !DISubprogram(name: "append", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm", scope: !346, file: !244, line: 1418, type: !909, scopeLine: 1419, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !908, retainedNodes: !3652)
!3652 = !{!3650, !3653, !3654}
!3653 = !DILocalVariable(name: "__s", arg: 2, scope: !3651, file: !244, line: 1418, type: !399)
!3654 = !DILocalVariable(name: "__n", arg: 3, scope: !3651, file: !244, line: 1418, type: !352)
!3655 = !DILocation(line: 0, scope: !3651, inlinedAt: !3656)
!3656 = distinct !DILocation(line: 619, column: 13, scope: !3599)
!3657 = !DILocation(line: 0, scope: !3176, inlinedAt: !3658)
!3658 = distinct !DILocation(line: 1421, column: 2, scope: !3651, inlinedAt: !3656)
!3659 = !DILocation(line: 0, scope: !3184, inlinedAt: !3660)
!3660 = distinct !DILocation(line: 392, column: 32, scope: !3188, inlinedAt: !3658)
!3661 = !DILocation(line: 1064, column: 16, scope: !3184, inlinedAt: !3660)
!3662 = !DILocation(line: 392, column: 23, scope: !3188, inlinedAt: !3658)
!3663 = !DILocation(line: 392, column: 47, scope: !3188, inlinedAt: !3658)
!3664 = !DILocation(line: 392, column: 6, scope: !3176, inlinedAt: !3658)
!3665 = !DILocation(line: 1422, column: 9, scope: !3651, inlinedAt: !3656)
!3666 = !DILocalVariable(name: "this", arg: 1, scope: !3667, type: !1229, flags: DIFlagArtificial | DIFlagObjectPointer)
!3667 = distinct !DISubprogram(name: "append", linkageName: "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendERKS4_", scope: !346, file: !244, line: 1387, type: !820, scopeLine: 1388, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !904, retainedNodes: !3668)
!3668 = !{!3666, !3669}
!3669 = !DILocalVariable(name: "__str", arg: 2, scope: !3667, file: !244, line: 1387, type: !779)
!3670 = !DILocation(line: 0, scope: !3667, inlinedAt: !3671)
!3671 = distinct !DILocation(line: 620, column: 13, scope: !3599)
!3672 = !DILocation(line: 0, scope: !3009, inlinedAt: !3673)
!3673 = distinct !DILocation(line: 1388, column: 35, scope: !3667, inlinedAt: !3671)
!3674 = !DILocation(line: 0, scope: !3184, inlinedAt: !3675)
!3675 = distinct !DILocation(line: 1388, column: 52, scope: !3667, inlinedAt: !3671)
!3676 = !DILocation(line: 1064, column: 16, scope: !3184, inlinedAt: !3675)
!3677 = !DILocation(line: 0, scope: !3651, inlinedAt: !3678)
!3678 = distinct !DILocation(line: 1388, column: 22, scope: !3667, inlinedAt: !3671)
!3679 = !DILocation(line: 0, scope: !3176, inlinedAt: !3680)
!3680 = distinct !DILocation(line: 1421, column: 2, scope: !3651, inlinedAt: !3678)
!3681 = !DILocation(line: 0, scope: !3184, inlinedAt: !3682)
!3682 = distinct !DILocation(line: 392, column: 32, scope: !3188, inlinedAt: !3680)
!3683 = !DILocation(line: 1064, column: 16, scope: !3184, inlinedAt: !3682)
!3684 = !DILocation(line: 392, column: 23, scope: !3188, inlinedAt: !3680)
!3685 = !DILocation(line: 392, column: 47, scope: !3188, inlinedAt: !3680)
!3686 = !DILocation(line: 392, column: 6, scope: !3176, inlinedAt: !3680)
!3687 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3673)
!3688 = !DILocation(line: 1422, column: 9, scope: !3651, inlinedAt: !3678)
!3689 = !DILocation(line: 622, column: 5, scope: !3599)
!3690 = !DILocation(line: 0, scope: !3281, inlinedAt: !3691)
!3691 = distinct !DILocation(line: 622, column: 5, scope: !3599)
!3692 = !DILocation(line: 0, scope: !3286, inlinedAt: !3693)
!3693 = distinct !DILocation(line: 795, column: 9, scope: !3290, inlinedAt: !3691)
!3694 = !DILocation(line: 0, scope: !3213, inlinedAt: !3695)
!3695 = distinct !DILocation(line: 286, column: 7, scope: !3293, inlinedAt: !3693)
!3696 = !DILocation(line: 0, scope: !3009, inlinedAt: !3697)
!3697 = distinct !DILocation(line: 275, column: 16, scope: !3213, inlinedAt: !3695)
!3698 = !DILocation(line: 235, column: 28, scope: !3009, inlinedAt: !3697)
!3699 = !DILocation(line: 275, column: 26, scope: !3213, inlinedAt: !3695)
!3700 = !DILocation(line: 286, column: 6, scope: !3286, inlinedAt: !3693)
!3701 = !DILocation(line: 0, scope: !3304, inlinedAt: !3702)
!3702 = distinct !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3693)
!3703 = !DILocation(line: 0, scope: !3009, inlinedAt: !3704)
!3704 = distinct !DILocation(line: 293, column: 55, scope: !3304, inlinedAt: !3702)
!3705 = !DILocation(line: 0, scope: !3312, inlinedAt: !3706)
!3706 = distinct !DILocation(line: 293, column: 9, scope: !3304, inlinedAt: !3702)
!3707 = !DILocation(line: 0, scope: !3319, inlinedAt: !3708)
!3708 = distinct !DILocation(line: 496, column: 13, scope: !3312, inlinedAt: !3706)
!3709 = !DILocation(line: 158, column: 2, scope: !3319, inlinedAt: !3708)
!3710 = !DILocation(line: 287, column: 4, scope: !3293, inlinedAt: !3693)
!3711 = !DISubprogram(name: "hipGetDeviceCount", scope: !90, file: !90, line: 1536, type: !3712, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !472)
!3712 = !DISubroutineType(types: !3713)
!3713 = !{!2921, !1290}
!3714 = distinct !DISubprogram(name: "DeviceAsyncQueue", linkageName: "_ZN8scabbard5trace16DeviceAsyncQueueC2Ev", scope: !6, file: !7, line: 63, type: !164, scopeLine: 63, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !163, retainedNodes: !3715)
!3715 = !{!3716}
!3716 = !DILocalVariable(name: "this", arg: 1, scope: !3714, type: !5, flags: DIFlagArtificial | DIFlagObjectPointer)
!3717 = !DILocation(line: 0, scope: !3714)
!3718 = !DILocation(line: 63, column: 27, scope: !3714)
!3719 = !DILocalVariable(name: "this", arg: 1, scope: !3720, type: !3722, flags: DIFlagArtificial | DIFlagObjectPointer)
!3720 = distinct !DISubprogram(name: "Lane", linkageName: "_ZN8scabbard5trace16DeviceAsyncQueue4LaneC2Ev", scope: !11, file: !7, line: 54, type: !155, scopeLine: 54, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !154, retainedNodes: !3721)
!3721 = !{!3719}
!3722 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!3723 = !DILocation(line: 0, scope: !3720, inlinedAt: !3724)
!3724 = distinct !DILocation(line: 63, column: 27, scope: !3714)
!3725 = !DILocalVariable(name: "this", arg: 1, scope: !3726, type: !3728, flags: DIFlagArtificial | DIFlagObjectPointer)
!3726 = distinct !DISubprogram(name: "TraceData", linkageName: "_ZN8scabbard5trace9TraceDataC2Ev", scope: !20, file: !21, line: 145, type: !123, scopeLine: 145, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !122, retainedNodes: !3727)
!3727 = !{!3725}
!3728 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!3729 = !DILocation(line: 0, scope: !3726, inlinedAt: !3730)
!3730 = distinct !DILocation(line: 54, column: 29, scope: !3720, inlinedAt: !3724)
!3731 = !DILocation(line: 136, column: 23, scope: !3726, inlinedAt: !3730)
!3732 = !DILocalVariable(name: "this", arg: 1, scope: !3733, type: !3736, flags: DIFlagArtificial | DIFlagObjectPointer)
!3733 = distinct !DISubprogram(name: "ThreadId", linkageName: "_ZN8scabbard5trace8ThreadIdC2EPv", scope: !58, file: !21, line: 113, type: !107, scopeLine: 113, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !106, retainedNodes: !3734)
!3734 = !{!3732, !3735}
!3735 = !DILocalVariable(name: "_", arg: 2, scope: !3733, file: !21, line: 113, type: !82)
!3736 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!3737 = !DILocation(line: 0, scope: !3733, inlinedAt: !3738)
!3738 = distinct !DILocation(line: 136, column: 37, scope: !3726, inlinedAt: !3730)
!3739 = !DILocation(line: 145, column: 23, scope: !3726, inlinedAt: !3730)
!3740 = !DILocation(line: 113, column: 23, scope: !3741, inlinedAt: !3738)
!3741 = distinct !DILexicalBlock(scope: !3733, file: !21, line: 113, column: 21)
!3742 = !DILocation(line: 54, column: 44, scope: !3720, inlinedAt: !3724)
!3743 = !DILocation(line: 134, column: 23, scope: !3726, inlinedAt: !3730)
!3744 = !DILocation(line: 63, column: 54, scope: !3714)
!3745 = !DISubprogram(name: "hipMemcpy", scope: !90, file: !90, line: 3408, type: !3746, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !472)
!3746 = !DISubroutineType(types: !3747)
!3747 = !{!2921, !82, !110, !15, !3748}
!3748 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipMemcpyKind", file: !331, line: 351, baseType: !330)
!3749 = distinct !DISubprogram(name: "scabbard_close", linkageName: "scabbard.trace.scabbard_close", scope: !2, file: !181, line: 106, type: !1608, scopeLine: 107, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !472)
!3750 = !DILocation(line: 109, column: 5, scope: !3749)
!3751 = distinct !DISubprogram(name: "metadata_register$src", linkageName: "scabbard.trace.metadata_register$src", scope: !2, file: !181, line: 113, type: !3752, scopeLine: 114, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !3754)
!3752 = !DISubroutineType(types: !3753)
!3753 = !{!2446, !399}
!3754 = !{!3755}
!3755 = !DILocalVariable(name: "src_file", arg: 1, scope: !3751, file: !181, line: 113, type: !399)
!3756 = !DILocation(line: 0, scope: !3751)
!3757 = !DILocation(line: 115, column: 27, scope: !3751)
!3758 = !DILocation(line: 115, column: 7, scope: !3751)
!3759 = distinct !DISubprogram(name: "trace_append$mem", linkageName: "scabbard.trace.host.trace_append$mem", scope: !3760, file: !181, line: 136, type: !3761, scopeLine: 137, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !3765)
!3760 = !DINamespace(name: "host", scope: !2)
!3761 = !DISubroutineType(types: !3762)
!3762 = !{null, !30, !110, !3763, !94, !94}
!3763 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3764, size: 64)
!3764 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2446)
!3765 = !{!3766, !3767, !3768, !3769, !3770}
!3766 = !DILocalVariable(name: "data", arg: 1, scope: !3759, file: !181, line: 136, type: !30)
!3767 = !DILocalVariable(name: "PTR", arg: 2, scope: !3759, file: !181, line: 136, type: !110)
!3768 = !DILocalVariable(name: "src_id", arg: 3, scope: !3759, file: !181, line: 136, type: !3763)
!3769 = !DILocalVariable(name: "line", arg: 4, scope: !3759, file: !181, line: 136, type: !94)
!3770 = !DILocalVariable(name: "col", arg: 5, scope: !3759, file: !181, line: 136, type: !94)
!3771 = !DILocation(line: 0, scope: !3759)
!3772 = !DILocation(line: 138, column: 51, scope: !3759)
!3773 = !DILocalVariable(name: "this", arg: 1, scope: !3774, type: !3728, flags: DIFlagArtificial | DIFlagObjectPointer)
!3774 = distinct !DISubprogram(name: "TraceData", linkageName: "_ZN8scabbard5trace9TraceDataC2ENS_9InstrDataEPKvRKNS_16LocationMetadataEm", scope: !20, file: !21, line: 165, type: !135, scopeLine: 168, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !134, retainedNodes: !3775)
!3775 = !{!3773, !3776, !3777, !3778, !3779}
!3776 = !DILocalVariable(name: "data_", arg: 2, scope: !3774, file: !21, line: 165, type: !30)
!3777 = !DILocalVariable(name: "ptr_", arg: 3, scope: !3774, file: !21, line: 165, type: !110)
!3778 = !DILocalVariable(name: "metadata_", arg: 4, scope: !3774, file: !21, line: 165, type: !137)
!3779 = !DILocalVariable(name: "opt_data", arg: 5, scope: !3774, file: !21, line: 165, type: !25)
!3780 = !DILocation(line: 0, scope: !3774, inlinedAt: !3781)
!3781 = distinct !DILocation(line: 138, column: 29, scope: !3759)
!3782 = !DILocation(line: 166, column: 7, scope: !3774, inlinedAt: !3781)
!3783 = !DILocation(line: 166, column: 18, scope: !3774, inlinedAt: !3781)
!3784 = !{!3785, !2981, i64 0}
!3785 = !{!"_ZTSN8scabbard5trace9TraceDataE", !2981, i64 0, !3786, i64 8, !2961, i64 16, !2960, i64 32, !3787, i64 40, !2981, i64 56}
!3786 = !{!"_ZTSN8scabbard9InstrDataE", !2961, i64 0}
!3787 = !{!"_ZTSN8scabbard16LocationMetadataE", !2981, i64 0, !3406, i64 8, !3406, i64 12}
!3788 = !DILocation(line: 167, column: 7, scope: !3774, inlinedAt: !3781)
!3789 = !{!3785, !3786, i64 8}
!3790 = !DILocalVariable(name: "this", arg: 1, scope: !3791, type: !3736, flags: DIFlagArtificial | DIFlagObjectPointer)
!3791 = distinct !DISubprogram(name: "ThreadId", linkageName: "_ZN8scabbard5trace8ThreadIdC2Ev", scope: !58, file: !21, line: 110, type: !104, scopeLine: 110, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !103, retainedNodes: !3792)
!3792 = !{!3790}
!3793 = !DILocation(line: 0, scope: !3791, inlinedAt: !3794)
!3794 = distinct !DILocation(line: 167, column: 20, scope: !3774, inlinedAt: !3781)
!3795 = !DILocation(line: 110, column: 25, scope: !3796, inlinedAt: !3794)
!3796 = distinct !DILexicalBlock(scope: !3791, file: !21, line: 110, column: 23)
!3797 = !DILocation(line: 311, column: 25, scope: !3798, inlinedAt: !3802)
!3798 = distinct !DISubprogram(name: "get_id", linkageName: "_ZNSt11this_thread6get_idEv", scope: !3799, file: !63, line: 306, type: !3800, scopeLine: 307, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !472)
!3799 = !DINamespace(name: "this_thread", scope: !27)
!3800 = !DISubroutineType(types: !3801)
!3801 = !{!62}
!3802 = distinct !DILocation(line: 110, column: 76, scope: !3796, inlinedAt: !3794)
!3803 = !DILocation(line: 110, column: 74, scope: !3796, inlinedAt: !3794)
!3804 = !{i64 0, i64 8, !2980}
!3805 = !DILocation(line: 167, column: 32, scope: !3774, inlinedAt: !3781)
!3806 = !{!3785, !2960, i64 32}
!3807 = !DILocation(line: 167, column: 43, scope: !3774, inlinedAt: !3781)
!3808 = !{i64 0, i64 8, !2980, i64 8, i64 4, !3405, i64 12, i64 4, !3405}
!3809 = !{i64 0, i64 4, !3405, i64 4, i64 4, !3405}
!3810 = !{i64 0, i64 4, !3405}
!3811 = !DILocation(line: 167, column: 64, scope: !3774, inlinedAt: !3781)
!3812 = !{!3785, !2981, i64 56}
!3813 = !DILocation(line: 138, column: 22, scope: !3759)
!3814 = !DILocation(line: 139, column: 7, scope: !3759)
!3815 = distinct !DISubprogram(name: "trace_append$mem$cond", linkageName: "scabbard.trace.host.trace_append$mem$cond", scope: !3760, file: !181, line: 142, type: !3761, scopeLine: 143, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !3816)
!3816 = !{!3817, !3818, !3819, !3820, !3821, !3822, !3833}
!3817 = !DILocalVariable(name: "data", arg: 1, scope: !3815, file: !181, line: 142, type: !30)
!3818 = !DILocalVariable(name: "PTR", arg: 2, scope: !3815, file: !181, line: 142, type: !110)
!3819 = !DILocalVariable(name: "src_id", arg: 3, scope: !3815, file: !181, line: 142, type: !3763)
!3820 = !DILocalVariable(name: "line", arg: 4, scope: !3815, file: !181, line: 142, type: !94)
!3821 = !DILocalVariable(name: "col", arg: 5, scope: !3815, file: !181, line: 142, type: !94)
!3822 = !DILocalVariable(name: "attrs", scope: !3815, file: !181, line: 144, type: !3823)
!3823 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3824, size: 64)
!3824 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipPointerAttribute_t", file: !90, line: 180, baseType: !3825)
!3825 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hipPointerAttribute_t", file: !90, line: 172, size: 256, flags: DIFlagTypePassByValue, elements: !3826, identifier: "_ZTS21hipPointerAttribute_t")
!3826 = !{!3827, !3828, !3829, !3830, !3831, !3832}
!3827 = !DIDerivedType(tag: DW_TAG_member, name: "memoryType", scope: !3825, file: !90, line: 173, baseType: !338, size: 32)
!3828 = !DIDerivedType(tag: DW_TAG_member, name: "device", scope: !3825, file: !90, line: 174, baseType: !582, size: 32, offset: 32)
!3829 = !DIDerivedType(tag: DW_TAG_member, name: "devicePointer", scope: !3825, file: !90, line: 175, baseType: !82, size: 64, offset: 64)
!3830 = !DIDerivedType(tag: DW_TAG_member, name: "hostPointer", scope: !3825, file: !90, line: 176, baseType: !82, size: 64, offset: 128)
!3831 = !DIDerivedType(tag: DW_TAG_member, name: "isManaged", scope: !3825, file: !90, line: 177, baseType: !582, size: 32, offset: 192)
!3832 = !DIDerivedType(tag: DW_TAG_member, name: "allocationFlags", scope: !3825, file: !90, line: 178, baseType: !96, size: 32, offset: 224)
!3833 = !DILocalVariable(name: "status", scope: !3815, file: !181, line: 145, type: !3834)
!3834 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2921)
!3835 = !DILocation(line: 0, scope: !3815)
!3836 = !DILocation(line: 145, column: 29, scope: !3815)
!3837 = !DILocation(line: 146, column: 20, scope: !3838)
!3838 = distinct !DILexicalBlock(scope: !3815, file: !181, line: 146, column: 13)
!3839 = !DILocation(line: 146, column: 13, scope: !3815)
!3840 = !DILocalVariable(name: "l", arg: 1, scope: !3841, file: !31, line: 88, type: !3844)
!3841 = distinct !DISubprogram(name: "operator|=", linkageName: "_ZN8scabbardoRERNS_9InstrDataES0_", scope: !3, file: !31, line: 88, type: !3842, scopeLine: 89, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !3845)
!3842 = !DISubroutineType(types: !3843)
!3843 = !{!3844, !3844, !30}
!3844 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !30, size: 64)
!3845 = !{!3840, !3846}
!3846 = !DILocalVariable(name: "r", arg: 2, scope: !3841, file: !31, line: 88, type: !30)
!3847 = !DILocation(line: 0, scope: !3841, inlinedAt: !3848)
!3848 = distinct !DILocation(line: 148, column: 18, scope: !3849)
!3849 = distinct !DILexicalBlock(scope: !3850, file: !181, line: 147, column: 33)
!3850 = distinct !DILexicalBlock(scope: !3851, file: !181, line: 147, column: 15)
!3851 = distinct !DILexicalBlock(scope: !3838, file: !181, line: 146, column: 35)
!3852 = !DILocation(line: 90, column: 59, scope: !3841, inlinedAt: !3848)
!3853 = !DILocation(line: 0, scope: !3759, inlinedAt: !3854)
!3854 = distinct !DILocation(line: 154, column: 11, scope: !3851)
!3855 = !DILocation(line: 138, column: 51, scope: !3759, inlinedAt: !3854)
!3856 = !DILocation(line: 0, scope: !3774, inlinedAt: !3857)
!3857 = distinct !DILocation(line: 138, column: 29, scope: !3759, inlinedAt: !3854)
!3858 = !DILocation(line: 166, column: 7, scope: !3774, inlinedAt: !3857)
!3859 = !DILocation(line: 166, column: 18, scope: !3774, inlinedAt: !3857)
!3860 = !DILocation(line: 167, column: 7, scope: !3774, inlinedAt: !3857)
!3861 = !DILocation(line: 0, scope: !3791, inlinedAt: !3862)
!3862 = distinct !DILocation(line: 167, column: 20, scope: !3774, inlinedAt: !3857)
!3863 = !DILocation(line: 110, column: 25, scope: !3796, inlinedAt: !3862)
!3864 = !DILocation(line: 311, column: 25, scope: !3798, inlinedAt: !3865)
!3865 = distinct !DILocation(line: 110, column: 76, scope: !3796, inlinedAt: !3862)
!3866 = !DILocation(line: 110, column: 74, scope: !3796, inlinedAt: !3862)
!3867 = !DILocation(line: 167, column: 32, scope: !3774, inlinedAt: !3857)
!3868 = !DILocation(line: 167, column: 43, scope: !3774, inlinedAt: !3857)
!3869 = !DILocation(line: 167, column: 64, scope: !3774, inlinedAt: !3857)
!3870 = !DILocation(line: 138, column: 22, scope: !3759, inlinedAt: !3854)
!3871 = !DILocation(line: 139, column: 7, scope: !3759, inlinedAt: !3854)
!3872 = !DILocation(line: 155, column: 9, scope: !3851)
!3873 = !DILocation(line: 0, scope: !3363, inlinedAt: !3874)
!3874 = distinct !DILocation(line: 156, column: 21, scope: !3875)
!3875 = distinct !DILexicalBlock(scope: !3838, file: !181, line: 155, column: 16)
!3876 = !DILocation(line: 620, column: 2, scope: !3377, inlinedAt: !3874)
!3877 = !DILocation(line: 0, scope: !3386, inlinedAt: !3878)
!3878 = distinct !DILocation(line: 157, column: 21, scope: !3875)
!3879 = !DILocalVariable(name: "__os", arg: 1, scope: !3880, file: !3364, line: 688, type: !3367)
!3880 = distinct !DISubprogram(name: "endl<char, std::char_traits<char> >", linkageName: "_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !27, file: !3364, line: 688, type: !3881, scopeLine: 689, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, templateParams: !633, retainedNodes: !3883)
!3881 = !DISubroutineType(types: !3882)
!3882 = !{!3367, !3367}
!3883 = !{!3879}
!3884 = !DILocation(line: 0, scope: !3880, inlinedAt: !3885)
!3885 = distinct !DILocation(line: 113, column: 9, scope: !3386, inlinedAt: !3878)
!3886 = !DILocation(line: 689, column: 29, scope: !3880, inlinedAt: !3885)
!3887 = !{!3888, !3888, i64 0}
!3888 = !{!"vtable pointer", !2962, i64 0}
!3889 = !DILocalVariable(name: "this", arg: 1, scope: !3890, type: !3902, flags: DIFlagArtificial | DIFlagObjectPointer)
!3890 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !3892, file: !3891, line: 449, type: !3894, scopeLine: 450, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !3899, retainedNodes: !3900)
!3891 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/basic_ios.h", directory: "")
!3892 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ios<char, std::char_traits<char> >", scope: !27, file: !3893, line: 178, size: 2112, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!3893 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/basic_ios.tcc", directory: "")
!3894 = !DISubroutineType(types: !3895)
!3895 = !{!3896, !3897, !187}
!3896 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !3892, file: !3891, line: 76, baseType: !187)
!3897 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3898, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!3898 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3892)
!3899 = !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !3892, file: !3891, line: 449, type: !3894, scopeLine: 449, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!3900 = !{!3889, !3901}
!3901 = !DILocalVariable(name: "__c", arg: 2, scope: !3890, file: !3891, line: 449, type: !187)
!3902 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3898, size: 64)
!3903 = !DILocation(line: 0, scope: !3890, inlinedAt: !3904)
!3904 = distinct !DILocation(line: 689, column: 34, scope: !3880, inlinedAt: !3885)
!3905 = !DILocation(line: 450, column: 30, scope: !3890, inlinedAt: !3904)
!3906 = !{!3907, !2960, i64 240}
!3907 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !3908, i64 0, !2960, i64 216, !2961, i64 224, !3913, i64 225, !2960, i64 232, !2960, i64 240, !2960, i64 248, !2960, i64 256}
!3908 = !{!"_ZTSSt8ios_base", !2981, i64 8, !2981, i64 16, !3909, i64 24, !3910, i64 28, !3910, i64 32, !2960, i64 40, !3911, i64 48, !2961, i64 64, !3406, i64 192, !2960, i64 200, !3912, i64 208}
!3909 = !{!"_ZTSSt13_Ios_Fmtflags", !2961, i64 0}
!3910 = !{!"_ZTSSt12_Ios_Iostate", !2961, i64 0}
!3911 = !{!"_ZTSNSt8ios_base6_WordsE", !2960, i64 0, !2981, i64 8}
!3912 = !{!"_ZTSSt6locale", !2960, i64 0}
!3913 = !{!"bool", !2961, i64 0}
!3914 = !DILocalVariable(name: "__f", arg: 1, scope: !3915, file: !3891, line: 47, type: !3922)
!3915 = distinct !DISubprogram(name: "__check_facet<std::ctype<char> >", linkageName: "_ZSt13__check_facetISt5ctypeIcEERKT_PS3_", scope: !27, file: !3891, line: 47, type: !3916, scopeLine: 48, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, templateParams: !3924, retainedNodes: !3923)
!3916 = !DISubroutineType(types: !3917)
!3917 = !{!3918, !3922}
!3918 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !3919, size: 64)
!3919 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3920)
!3920 = !DICompositeType(tag: DW_TAG_class_type, name: "ctype<char>", scope: !27, file: !3921, line: 689, size: 4608, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt5ctypeIcE")
!3921 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/locale_facets.h", directory: "")
!3922 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3919, size: 64)
!3923 = !{!3914}
!3924 = !{!3925}
!3925 = !DITemplateTypeParameter(name: "_Facet", type: !3920)
!3926 = !DILocation(line: 0, scope: !3915, inlinedAt: !3927)
!3927 = distinct !DILocation(line: 450, column: 16, scope: !3890, inlinedAt: !3904)
!3928 = !DILocation(line: 49, column: 12, scope: !3929, inlinedAt: !3927)
!3929 = distinct !DILexicalBlock(scope: !3915, file: !3891, line: 49, column: 11)
!3930 = !DILocation(line: 49, column: 11, scope: !3915, inlinedAt: !3927)
!3931 = !DILocation(line: 50, column: 2, scope: !3929, inlinedAt: !3927)
!3932 = !DILocalVariable(name: "this", arg: 1, scope: !3933, type: !3922, flags: DIFlagArtificial | DIFlagObjectPointer)
!3933 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !3920, file: !3921, line: 880, type: !3934, scopeLine: 881, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, declaration: !3938, retainedNodes: !3939)
!3934 = !DISubroutineType(types: !3935)
!3935 = !{!3936, !3937, !187}
!3936 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !3920, file: !3921, line: 694, baseType: !187)
!3937 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3919, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!3938 = !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !3920, file: !3921, line: 880, type: !3934, scopeLine: 880, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!3939 = !{!3932, !3940}
!3940 = !DILocalVariable(name: "__c", arg: 2, scope: !3933, file: !3921, line: 880, type: !187)
!3941 = !DILocation(line: 0, scope: !3933, inlinedAt: !3942)
!3942 = distinct !DILocation(line: 450, column: 40, scope: !3890, inlinedAt: !3904)
!3943 = !DILocation(line: 882, column: 6, scope: !3944, inlinedAt: !3942)
!3944 = distinct !DILexicalBlock(scope: !3933, file: !3921, line: 882, column: 6)
!3945 = !{!3946, !2961, i64 56}
!3946 = !{!"_ZTSSt5ctypeIcE", !3947, i64 0, !2960, i64 16, !3913, i64 24, !2960, i64 32, !2960, i64 40, !2960, i64 48, !2961, i64 56, !2961, i64 57, !2961, i64 313, !2961, i64 569}
!3947 = !{!"_ZTSNSt6locale5facetE", !3406, i64 8}
!3948 = !DILocation(line: 882, column: 6, scope: !3933, inlinedAt: !3942)
!3949 = !DILocation(line: 883, column: 11, scope: !3944, inlinedAt: !3942)
!3950 = !DILocation(line: 883, column: 4, scope: !3944, inlinedAt: !3942)
!3951 = !DILocation(line: 884, column: 8, scope: !3933, inlinedAt: !3942)
!3952 = !DILocation(line: 885, column: 15, scope: !3933, inlinedAt: !3942)
!3953 = !DILocation(line: 885, column: 2, scope: !3933, inlinedAt: !3942)
!3954 = !DILocation(line: 689, column: 25, scope: !3880, inlinedAt: !3885)
!3955 = !DILocalVariable(name: "__os", arg: 1, scope: !3956, file: !3364, line: 710, type: !3367)
!3956 = distinct !DISubprogram(name: "flush<char, std::char_traits<char> >", linkageName: "_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !27, file: !3364, line: 710, type: !3881, scopeLine: 711, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, templateParams: !633, retainedNodes: !3957)
!3957 = !{!3955}
!3958 = !DILocation(line: 0, scope: !3956, inlinedAt: !3959)
!3959 = distinct !DILocation(line: 689, column: 14, scope: !3880, inlinedAt: !3885)
!3960 = !DILocation(line: 711, column: 19, scope: !3956, inlinedAt: !3959)
!3961 = !DILocation(line: 162, column: 7, scope: !3815)
!3962 = !DISubprogram(name: "hipPointerGetAttributes", scope: !90, file: !90, line: 2520, type: !3963, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !472)
!3963 = !DISubroutineType(types: !3964)
!3964 = !{!2921, !3823, !110}
!3965 = distinct !DISubprogram(name: "trace_append$alloc", linkageName: "scabbard.trace.host.trace_append$alloc", scope: !3760, file: !181, line: 165, type: !3966, scopeLine: 166, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !3968)
!3966 = !DISubroutineType(types: !3967)
!3967 = !{null, !30, !110, !3763, !94, !94, !25}
!3968 = !{!3969, !3970, !3971, !3972, !3973, !3974}
!3969 = !DILocalVariable(name: "data", arg: 1, scope: !3965, file: !181, line: 165, type: !30)
!3970 = !DILocalVariable(name: "PTR", arg: 2, scope: !3965, file: !181, line: 165, type: !110)
!3971 = !DILocalVariable(name: "src_id", arg: 3, scope: !3965, file: !181, line: 165, type: !3763)
!3972 = !DILocalVariable(name: "line", arg: 4, scope: !3965, file: !181, line: 165, type: !94)
!3973 = !DILocalVariable(name: "col", arg: 5, scope: !3965, file: !181, line: 165, type: !94)
!3974 = !DILocalVariable(name: "size", arg: 6, scope: !3965, file: !181, line: 165, type: !25)
!3975 = !DILocation(line: 0, scope: !3965)
!3976 = !DILocation(line: 167, column: 67, scope: !3965)
!3977 = !DILocation(line: 0, scope: !3774, inlinedAt: !3978)
!3978 = distinct !DILocation(line: 167, column: 29, scope: !3965)
!3979 = !DILocation(line: 166, column: 7, scope: !3774, inlinedAt: !3978)
!3980 = !DILocation(line: 166, column: 18, scope: !3774, inlinedAt: !3978)
!3981 = !DILocation(line: 167, column: 7, scope: !3774, inlinedAt: !3978)
!3982 = !DILocation(line: 0, scope: !3791, inlinedAt: !3983)
!3983 = distinct !DILocation(line: 167, column: 20, scope: !3774, inlinedAt: !3978)
!3984 = !DILocation(line: 110, column: 25, scope: !3796, inlinedAt: !3983)
!3985 = !DILocation(line: 311, column: 25, scope: !3798, inlinedAt: !3986)
!3986 = distinct !DILocation(line: 110, column: 76, scope: !3796, inlinedAt: !3983)
!3987 = !DILocation(line: 110, column: 74, scope: !3796, inlinedAt: !3983)
!3988 = !DILocation(line: 167, column: 32, scope: !3774, inlinedAt: !3978)
!3989 = !DILocation(line: 167, column: 43, scope: !3774, inlinedAt: !3978)
!3990 = !DILocation(line: 167, column: 64, scope: !3774, inlinedAt: !3978)
!3991 = !DILocation(line: 167, column: 22, scope: !3965)
!3992 = !DILocation(line: 168, column: 7, scope: !3965)
!3993 = !DISubprogram(name: "pthread_self", scope: !3994, file: !3994, line: 273, type: !3995, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !472)
!3994 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!3995 = !DISubroutineType(types: !3996)
!3996 = !{!70}
!3997 = !DISubprogram(name: "hipMalloc", scope: !90, file: !90, line: 2654, type: !3998, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !472)
!3998 = !DISubroutineType(types: !3999)
!3999 = !{!2921, !1092, !15}
!4000 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_defs.cpp", scope: !2244, file: !2244, type: !4001, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !472)
!4001 = !DISubroutineType(types: !472)
!4002 = !DILocation(line: 74, column: 25, scope: !4003, inlinedAt: !4005)
!4003 = !DILexicalBlockFile(scope: !4004, file: !175, discriminator: 0)
!4004 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !2244, file: !2244, type: !1608, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !472)
!4005 = distinct !DILocation(line: 0, scope: !4000)
!4006 = !DILocation(line: 0, scope: !4004, inlinedAt: !4005)
!4007 = !DILocation(line: 53, column: 16, scope: !4008, inlinedAt: !4010)
!4008 = !DILexicalBlockFile(scope: !4009, file: !181, discriminator: 0)
!4009 = distinct !DISubprogram(name: "__cxx_global_var_init.1", scope: !2244, file: !2244, type: !1608, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !248, retainedNodes: !472)
!4010 = distinct !DILocation(line: 0, scope: !4000)
!4011 = !DILocation(line: 0, scope: !4009, inlinedAt: !4010)

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
