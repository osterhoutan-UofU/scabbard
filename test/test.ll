
; __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx803
; ModuleID = 'test.C'
source_filename = "test.C"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { %1 addrspace(1)*, %2 addrspace(1)*, %3, i64, i64, i64 }
%1 = type { i64, i64, i32, i32 }
%2 = type { [64 x [8 x i64]] }
%3 = type { i64 }
%4 = type { i64, %3, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { %6 addrspace(1)* }
%6 = type { %7, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %3, [14 x i32] }
%7 = type { i32, i32, i8 addrspace(1)*, %3, i32, i32, i64 }
%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" = type { i8 }

$_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE = weak protected addrspace(4) externally_initialized constant %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" undef, comdat, align 1, !dbg.def !0
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds (%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X", %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" addrspace(4)* @_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE, i32 0, i32 0) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress noreturn nounwind
define weak void @__cxa_pure_virtual() local_unnamed_addr #0 !dbg !1761 {
  tail call void @llvm.trap(), !dbg !1764
  unreachable, !dbg !1765
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #1

; Function Attrs: mustprogress noreturn nounwind
define weak void @__cxa_deleted_virtual() local_unnamed_addr #0 !dbg !1766 {
  tail call void @llvm.trap(), !dbg !1767
  unreachable, !dbg !1768
}

; Function Attrs: convergent noinline nounwind
define weak hidden void @__assert_fail(i8* %0, i8* %1, i32 %2, i8* %3) local_unnamed_addr #2 !dbg !1769 {
  %5 = alloca [47 x i8], align 16, addrspace(5)
  %6 = getelementptr inbounds [47 x i8], [47 x i8] addrspace(5)* %5, i32 0, i32 0, !dbg !1792
  call void @llvm.lifetime.start.p5i8(i64 47, i8 addrspace(5)* %6) #11, !dbg !1792
  call void @llvm.memcpy.p5i8.p4i8.i64(i8 addrspace(5)* noundef align 16 dereferenceable(47) %6, i8 addrspace(4)* noundef align 16 dereferenceable(47) getelementptr inbounds ([47 x i8], [47 x i8] addrspace(4)* @__const.__assert_fail.fmt, i64 0, i64 0), i64 47, i1 false), !dbg !1793
  %7 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr(), !dbg !1794
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 24, !dbg !1794
  %9 = bitcast i8 addrspace(4)* %8 to i64 addrspace(4)*, !dbg !1794
  %10 = load i64, i64 addrspace(4)* %9, align 8, !dbg !1794, !tbaa !1795
  %11 = inttoptr i64 %10 to i8 addrspace(1)*, !dbg !1794
  %12 = addrspacecast i8 addrspace(1)* %11 to i8*, !dbg !1794
  %13 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef 33, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #16, !dbg !1794
  %14 = extractelement <2 x i64> %13, i64 0, !dbg !1794
  br label %15, !dbg !1799

15:                                               ; preds = %15, %4
  %16 = phi i8 addrspace(5)* [ %6, %4 ], [ %17, %15 ]
  %17 = getelementptr inbounds i8, i8 addrspace(5)* %16, i32 1
  %18 = load i8, i8 addrspace(5)* %16, align 1, !dbg !1799, !tbaa !1800
  %19 = icmp eq i8 %18, 0, !dbg !1799
  br i1 %19, label %20, label %15, !dbg !1799, !llvm.loop !1803

20:                                               ; preds = %15
  %21 = icmp eq [47 x i8] addrspace(5)* %5, addrspacecast ([47 x i8]* null to [47 x i8] addrspace(5)*), !dbg !1805
  br i1 %21, label %22, label %26, !dbg !1805

22:                                               ; preds = %20
  %23 = and i64 %14, -225, !dbg !1805
  %24 = or i64 %23, 32, !dbg !1805
  %25 = call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %24, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #16, !dbg !1805
  br label %467, !dbg !1805

26:                                               ; preds = %20
  %27 = addrspacecast i8 addrspace(5)* %6 to i8*, !dbg !1799
  %28 = addrspacecast i8 addrspace(5)* %17 to i8*
  %29 = ptrtoint i8* %28 to i64, !dbg !1799
  %30 = ptrtoint i8* %27 to i64, !dbg !1799
  %31 = sub i64 %29, %30, !dbg !1799
  %32 = shl i64 %31, 32, !dbg !1806
  %33 = ashr exact i64 %32, 32, !dbg !1806
  %34 = and i64 %14, 2, !dbg !1805
  %35 = and i64 %14, -3, !dbg !1805
  %36 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %35, i64 0, !dbg !1805
  br label %37, !dbg !1805

37:                                               ; preds = %456, %26
  %38 = phi i64 [ %33, %26 ], [ %464, %456 ], !dbg !1805
  %39 = phi i8 addrspace(5)* [ %6, %26 ], [ %465, %456 ]
  %40 = phi <2 x i64> [ %36, %26 ], [ %463, %456 ], !dbg !1805
  %41 = icmp ugt i64 %38, 56, !dbg !1805
  %42 = extractelement <2 x i64> %40, i64 0, !dbg !1805
  %43 = or i64 %42, %34, !dbg !1805
  %44 = insertelement <2 x i64> poison, i64 %43, i64 0, !dbg !1805
  %45 = select i1 %41, <2 x i64> %40, <2 x i64> %44, !dbg !1805
  %46 = call i64 @llvm.umin.i64(i64 %38, i64 56), !dbg !1805
  %47 = trunc i64 %46 to i32, !dbg !1805
  %48 = extractelement <2 x i64> %45, i64 0, !dbg !1805
  %49 = icmp ugt i32 %47, 7, !dbg !1805
  br i1 %49, label %52, label %50, !dbg !1805

50:                                               ; preds = %37
  %51 = icmp eq i32 %47, 0, !dbg !1805
  br i1 %51, label %104, label %92, !dbg !1805

52:                                               ; preds = %37
  %53 = load i8, i8 addrspace(5)* %39, align 1, !dbg !1805, !tbaa !1807
  %54 = zext i8 %53 to i64, !dbg !1805
  %55 = getelementptr inbounds i8, i8 addrspace(5)* %39, i32 1
  %56 = load i8, i8 addrspace(5)* %55, align 1, !dbg !1805, !tbaa !1807
  %57 = zext i8 %56 to i64, !dbg !1805
  %58 = shl nuw nsw i64 %57, 8, !dbg !1805
  %59 = or i64 %58, %54, !dbg !1805
  %60 = getelementptr inbounds i8, i8 addrspace(5)* %39, i32 2
  %61 = load i8, i8 addrspace(5)* %60, align 1, !dbg !1805, !tbaa !1807
  %62 = zext i8 %61 to i64, !dbg !1805
  %63 = shl nuw nsw i64 %62, 16, !dbg !1805
  %64 = or i64 %59, %63, !dbg !1805
  %65 = getelementptr inbounds i8, i8 addrspace(5)* %39, i32 3
  %66 = load i8, i8 addrspace(5)* %65, align 1, !dbg !1805, !tbaa !1807
  %67 = zext i8 %66 to i64, !dbg !1805
  %68 = shl nuw nsw i64 %67, 24, !dbg !1805
  %69 = or i64 %64, %68, !dbg !1805
  %70 = getelementptr inbounds i8, i8 addrspace(5)* %39, i32 4
  %71 = load i8, i8 addrspace(5)* %70, align 1, !dbg !1805, !tbaa !1807
  %72 = zext i8 %71 to i64, !dbg !1805
  %73 = shl nuw nsw i64 %72, 32, !dbg !1805
  %74 = or i64 %69, %73, !dbg !1805
  %75 = getelementptr inbounds i8, i8 addrspace(5)* %39, i32 5
  %76 = load i8, i8 addrspace(5)* %75, align 1, !dbg !1805, !tbaa !1807
  %77 = zext i8 %76 to i64, !dbg !1805
  %78 = shl nuw nsw i64 %77, 40, !dbg !1805
  %79 = or i64 %74, %78, !dbg !1805
  %80 = getelementptr inbounds i8, i8 addrspace(5)* %39, i32 6
  %81 = load i8, i8 addrspace(5)* %80, align 1, !dbg !1805, !tbaa !1807
  %82 = zext i8 %81 to i64, !dbg !1805
  %83 = shl nuw nsw i64 %82, 48, !dbg !1805
  %84 = or i64 %79, %83, !dbg !1805
  %85 = getelementptr inbounds i8, i8 addrspace(5)* %39, i32 7
  %86 = load i8, i8 addrspace(5)* %85, align 1, !dbg !1805, !tbaa !1807
  %87 = zext i8 %86 to i64, !dbg !1805
  %88 = shl nuw i64 %87, 56, !dbg !1805
  %89 = or i64 %84, %88, !dbg !1805
  %90 = add nsw i32 %47, -8, !dbg !1805
  %91 = getelementptr inbounds i8, i8 addrspace(5)* %39, i32 8
  br label %104, !dbg !1805

92:                                               ; preds = %50, %92
  %93 = phi i32 [ %102, %92 ], [ 0, %50 ], !dbg !1805
  %94 = phi i64 [ %101, %92 ], [ 0, %50 ], !dbg !1805
  %95 = getelementptr inbounds i8, i8 addrspace(5)* %39, i32 %93
  %96 = load i8, i8 addrspace(5)* %95, align 1, !dbg !1805, !tbaa !1807
  %97 = zext i8 %96 to i64, !dbg !1805
  %98 = shl i32 %93, 3, !dbg !1805
  %99 = zext i32 %98 to i64, !dbg !1805
  %100 = shl nuw i64 %97, %99, !dbg !1805
  %101 = or i64 %100, %94, !dbg !1805
  %102 = add nuw nsw i32 %93, 1, !dbg !1805
  %103 = icmp eq i32 %102, %47, !dbg !1805
  br i1 %103, label %104, label %92, !dbg !1805

104:                                              ; preds = %92, %52, %50
  %105 = phi i8 addrspace(5)* [ %91, %52 ], [ %39, %50 ], [ %39, %92 ]
  %106 = phi i32 [ %90, %52 ], [ 0, %50 ], [ 0, %92 ], !dbg !1805
  %107 = phi i64 [ %89, %52 ], [ 0, %50 ], [ %101, %92 ], !dbg !1805
  %108 = icmp ugt i32 %106, 7, !dbg !1805
  br i1 %108, label %111, label %109, !dbg !1805

109:                                              ; preds = %104
  %110 = icmp eq i32 %106, 0, !dbg !1805
  br i1 %110, label %163, label %151, !dbg !1805

111:                                              ; preds = %104
  %112 = load i8, i8 addrspace(5)* %105, align 1, !dbg !1805, !tbaa !1807
  %113 = zext i8 %112 to i64, !dbg !1805
  %114 = getelementptr inbounds i8, i8 addrspace(5)* %105, i32 1
  %115 = load i8, i8 addrspace(5)* %114, align 1, !dbg !1805, !tbaa !1807
  %116 = zext i8 %115 to i64, !dbg !1805
  %117 = shl nuw nsw i64 %116, 8, !dbg !1805
  %118 = or i64 %117, %113, !dbg !1805
  %119 = getelementptr inbounds i8, i8 addrspace(5)* %105, i32 2
  %120 = load i8, i8 addrspace(5)* %119, align 1, !dbg !1805, !tbaa !1807
  %121 = zext i8 %120 to i64, !dbg !1805
  %122 = shl nuw nsw i64 %121, 16, !dbg !1805
  %123 = or i64 %118, %122, !dbg !1805
  %124 = getelementptr inbounds i8, i8 addrspace(5)* %105, i32 3
  %125 = load i8, i8 addrspace(5)* %124, align 1, !dbg !1805, !tbaa !1807
  %126 = zext i8 %125 to i64, !dbg !1805
  %127 = shl nuw nsw i64 %126, 24, !dbg !1805
  %128 = or i64 %123, %127, !dbg !1805
  %129 = getelementptr inbounds i8, i8 addrspace(5)* %105, i32 4
  %130 = load i8, i8 addrspace(5)* %129, align 1, !dbg !1805, !tbaa !1807
  %131 = zext i8 %130 to i64, !dbg !1805
  %132 = shl nuw nsw i64 %131, 32, !dbg !1805
  %133 = or i64 %128, %132, !dbg !1805
  %134 = getelementptr inbounds i8, i8 addrspace(5)* %105, i32 5
  %135 = load i8, i8 addrspace(5)* %134, align 1, !dbg !1805, !tbaa !1807
  %136 = zext i8 %135 to i64, !dbg !1805
  %137 = shl nuw nsw i64 %136, 40, !dbg !1805
  %138 = or i64 %133, %137, !dbg !1805
  %139 = getelementptr inbounds i8, i8 addrspace(5)* %105, i32 6
  %140 = load i8, i8 addrspace(5)* %139, align 1, !dbg !1805, !tbaa !1807
  %141 = zext i8 %140 to i64, !dbg !1805
  %142 = shl nuw nsw i64 %141, 48, !dbg !1805
  %143 = or i64 %138, %142, !dbg !1805
  %144 = getelementptr inbounds i8, i8 addrspace(5)* %105, i32 7
  %145 = load i8, i8 addrspace(5)* %144, align 1, !dbg !1805, !tbaa !1807
  %146 = zext i8 %145 to i64, !dbg !1805
  %147 = shl nuw i64 %146, 56, !dbg !1805
  %148 = or i64 %143, %147, !dbg !1805
  %149 = add nsw i32 %106, -8, !dbg !1805
  %150 = getelementptr inbounds i8, i8 addrspace(5)* %105, i32 8
  br label %163, !dbg !1805

151:                                              ; preds = %109, %151
  %152 = phi i32 [ %161, %151 ], [ 0, %109 ], !dbg !1805
  %153 = phi i64 [ %160, %151 ], [ 0, %109 ], !dbg !1805
  %154 = getelementptr inbounds i8, i8 addrspace(5)* %105, i32 %152
  %155 = load i8, i8 addrspace(5)* %154, align 1, !dbg !1805, !tbaa !1807
  %156 = zext i8 %155 to i64, !dbg !1805
  %157 = shl i32 %152, 3, !dbg !1805
  %158 = zext i32 %157 to i64, !dbg !1805
  %159 = shl nuw i64 %156, %158, !dbg !1805
  %160 = or i64 %159, %153, !dbg !1805
  %161 = add nuw nsw i32 %152, 1, !dbg !1805
  %162 = icmp eq i32 %161, %106, !dbg !1805
  br i1 %162, label %163, label %151, !dbg !1805

163:                                              ; preds = %151, %111, %109
  %164 = phi i8 addrspace(5)* [ %150, %111 ], [ %105, %109 ], [ %105, %151 ]
  %165 = phi i32 [ %149, %111 ], [ 0, %109 ], [ 0, %151 ], !dbg !1805
  %166 = phi i64 [ %148, %111 ], [ 0, %109 ], [ %160, %151 ], !dbg !1805
  %167 = icmp ugt i32 %165, 7, !dbg !1805
  br i1 %167, label %170, label %168, !dbg !1805

168:                                              ; preds = %163
  %169 = icmp eq i32 %165, 0, !dbg !1805
  br i1 %169, label %222, label %210, !dbg !1805

170:                                              ; preds = %163
  %171 = load i8, i8 addrspace(5)* %164, align 1, !dbg !1805, !tbaa !1807
  %172 = zext i8 %171 to i64, !dbg !1805
  %173 = getelementptr inbounds i8, i8 addrspace(5)* %164, i32 1
  %174 = load i8, i8 addrspace(5)* %173, align 1, !dbg !1805, !tbaa !1807
  %175 = zext i8 %174 to i64, !dbg !1805
  %176 = shl nuw nsw i64 %175, 8, !dbg !1805
  %177 = or i64 %176, %172, !dbg !1805
  %178 = getelementptr inbounds i8, i8 addrspace(5)* %164, i32 2
  %179 = load i8, i8 addrspace(5)* %178, align 1, !dbg !1805, !tbaa !1807
  %180 = zext i8 %179 to i64, !dbg !1805
  %181 = shl nuw nsw i64 %180, 16, !dbg !1805
  %182 = or i64 %177, %181, !dbg !1805
  %183 = getelementptr inbounds i8, i8 addrspace(5)* %164, i32 3
  %184 = load i8, i8 addrspace(5)* %183, align 1, !dbg !1805, !tbaa !1807
  %185 = zext i8 %184 to i64, !dbg !1805
  %186 = shl nuw nsw i64 %185, 24, !dbg !1805
  %187 = or i64 %182, %186, !dbg !1805
  %188 = getelementptr inbounds i8, i8 addrspace(5)* %164, i32 4
  %189 = load i8, i8 addrspace(5)* %188, align 1, !dbg !1805, !tbaa !1807
  %190 = zext i8 %189 to i64, !dbg !1805
  %191 = shl nuw nsw i64 %190, 32, !dbg !1805
  %192 = or i64 %187, %191, !dbg !1805
  %193 = getelementptr inbounds i8, i8 addrspace(5)* %164, i32 5
  %194 = load i8, i8 addrspace(5)* %193, align 1, !dbg !1805, !tbaa !1807
  %195 = zext i8 %194 to i64, !dbg !1805
  %196 = shl nuw nsw i64 %195, 40, !dbg !1805
  %197 = or i64 %192, %196, !dbg !1805
  %198 = getelementptr inbounds i8, i8 addrspace(5)* %164, i32 6
  %199 = load i8, i8 addrspace(5)* %198, align 1, !dbg !1805, !tbaa !1807
  %200 = zext i8 %199 to i64, !dbg !1805
  %201 = shl nuw nsw i64 %200, 48, !dbg !1805
  %202 = or i64 %197, %201, !dbg !1805
  %203 = getelementptr inbounds i8, i8 addrspace(5)* %164, i32 7
  %204 = load i8, i8 addrspace(5)* %203, align 1, !dbg !1805, !tbaa !1807
  %205 = zext i8 %204 to i64, !dbg !1805
  %206 = shl nuw i64 %205, 56, !dbg !1805
  %207 = or i64 %202, %206, !dbg !1805
  %208 = add nsw i32 %165, -8, !dbg !1805
  %209 = getelementptr inbounds i8, i8 addrspace(5)* %164, i32 8
  br label %222, !dbg !1805

210:                                              ; preds = %168, %210
  %211 = phi i32 [ %220, %210 ], [ 0, %168 ], !dbg !1805
  %212 = phi i64 [ %219, %210 ], [ 0, %168 ], !dbg !1805
  %213 = getelementptr inbounds i8, i8 addrspace(5)* %164, i32 %211
  %214 = load i8, i8 addrspace(5)* %213, align 1, !dbg !1805, !tbaa !1807
  %215 = zext i8 %214 to i64, !dbg !1805
  %216 = shl i32 %211, 3, !dbg !1805
  %217 = zext i32 %216 to i64, !dbg !1805
  %218 = shl nuw i64 %215, %217, !dbg !1805
  %219 = or i64 %218, %212, !dbg !1805
  %220 = add nuw nsw i32 %211, 1, !dbg !1805
  %221 = icmp eq i32 %220, %165, !dbg !1805
  br i1 %221, label %222, label %210, !dbg !1805

222:                                              ; preds = %210, %170, %168
  %223 = phi i8 addrspace(5)* [ %209, %170 ], [ %164, %168 ], [ %164, %210 ]
  %224 = phi i32 [ %208, %170 ], [ 0, %168 ], [ 0, %210 ], !dbg !1805
  %225 = phi i64 [ %207, %170 ], [ 0, %168 ], [ %219, %210 ], !dbg !1805
  %226 = icmp ugt i32 %224, 7, !dbg !1805
  br i1 %226, label %229, label %227, !dbg !1805

227:                                              ; preds = %222
  %228 = icmp eq i32 %224, 0, !dbg !1805
  br i1 %228, label %281, label %269, !dbg !1805

229:                                              ; preds = %222
  %230 = load i8, i8 addrspace(5)* %223, align 1, !dbg !1805, !tbaa !1807
  %231 = zext i8 %230 to i64, !dbg !1805
  %232 = getelementptr inbounds i8, i8 addrspace(5)* %223, i32 1
  %233 = load i8, i8 addrspace(5)* %232, align 1, !dbg !1805, !tbaa !1807
  %234 = zext i8 %233 to i64, !dbg !1805
  %235 = shl nuw nsw i64 %234, 8, !dbg !1805
  %236 = or i64 %235, %231, !dbg !1805
  %237 = getelementptr inbounds i8, i8 addrspace(5)* %223, i32 2
  %238 = load i8, i8 addrspace(5)* %237, align 1, !dbg !1805, !tbaa !1807
  %239 = zext i8 %238 to i64, !dbg !1805
  %240 = shl nuw nsw i64 %239, 16, !dbg !1805
  %241 = or i64 %236, %240, !dbg !1805
  %242 = getelementptr inbounds i8, i8 addrspace(5)* %223, i32 3
  %243 = load i8, i8 addrspace(5)* %242, align 1, !dbg !1805, !tbaa !1807
  %244 = zext i8 %243 to i64, !dbg !1805
  %245 = shl nuw nsw i64 %244, 24, !dbg !1805
  %246 = or i64 %241, %245, !dbg !1805
  %247 = getelementptr inbounds i8, i8 addrspace(5)* %223, i32 4
  %248 = load i8, i8 addrspace(5)* %247, align 1, !dbg !1805, !tbaa !1807
  %249 = zext i8 %248 to i64, !dbg !1805
  %250 = shl nuw nsw i64 %249, 32, !dbg !1805
  %251 = or i64 %246, %250, !dbg !1805
  %252 = getelementptr inbounds i8, i8 addrspace(5)* %223, i32 5
  %253 = load i8, i8 addrspace(5)* %252, align 1, !dbg !1805, !tbaa !1807
  %254 = zext i8 %253 to i64, !dbg !1805
  %255 = shl nuw nsw i64 %254, 40, !dbg !1805
  %256 = or i64 %251, %255, !dbg !1805
  %257 = getelementptr inbounds i8, i8 addrspace(5)* %223, i32 6
  %258 = load i8, i8 addrspace(5)* %257, align 1, !dbg !1805, !tbaa !1807
  %259 = zext i8 %258 to i64, !dbg !1805
  %260 = shl nuw nsw i64 %259, 48, !dbg !1805
  %261 = or i64 %256, %260, !dbg !1805
  %262 = getelementptr inbounds i8, i8 addrspace(5)* %223, i32 7
  %263 = load i8, i8 addrspace(5)* %262, align 1, !dbg !1805, !tbaa !1807
  %264 = zext i8 %263 to i64, !dbg !1805
  %265 = shl nuw i64 %264, 56, !dbg !1805
  %266 = or i64 %261, %265, !dbg !1805
  %267 = add nsw i32 %224, -8, !dbg !1805
  %268 = getelementptr inbounds i8, i8 addrspace(5)* %223, i32 8
  br label %281, !dbg !1805

269:                                              ; preds = %227, %269
  %270 = phi i32 [ %279, %269 ], [ 0, %227 ], !dbg !1805
  %271 = phi i64 [ %278, %269 ], [ 0, %227 ], !dbg !1805
  %272 = getelementptr inbounds i8, i8 addrspace(5)* %223, i32 %270
  %273 = load i8, i8 addrspace(5)* %272, align 1, !dbg !1805, !tbaa !1807
  %274 = zext i8 %273 to i64, !dbg !1805
  %275 = shl i32 %270, 3, !dbg !1805
  %276 = zext i32 %275 to i64, !dbg !1805
  %277 = shl nuw i64 %274, %276, !dbg !1805
  %278 = or i64 %277, %271, !dbg !1805
  %279 = add nuw nsw i32 %270, 1, !dbg !1805
  %280 = icmp eq i32 %279, %224, !dbg !1805
  br i1 %280, label %281, label %269, !dbg !1805

281:                                              ; preds = %269, %229, %227
  %282 = phi i8 addrspace(5)* [ %268, %229 ], [ %223, %227 ], [ %223, %269 ]
  %283 = phi i32 [ %267, %229 ], [ 0, %227 ], [ 0, %269 ], !dbg !1805
  %284 = phi i64 [ %266, %229 ], [ 0, %227 ], [ %278, %269 ], !dbg !1805
  %285 = icmp ugt i32 %283, 7, !dbg !1805
  br i1 %285, label %288, label %286, !dbg !1805

286:                                              ; preds = %281
  %287 = icmp eq i32 %283, 0, !dbg !1805
  br i1 %287, label %340, label %328, !dbg !1805

288:                                              ; preds = %281
  %289 = load i8, i8 addrspace(5)* %282, align 1, !dbg !1805, !tbaa !1807
  %290 = zext i8 %289 to i64, !dbg !1805
  %291 = getelementptr inbounds i8, i8 addrspace(5)* %282, i32 1
  %292 = load i8, i8 addrspace(5)* %291, align 1, !dbg !1805, !tbaa !1807
  %293 = zext i8 %292 to i64, !dbg !1805
  %294 = shl nuw nsw i64 %293, 8, !dbg !1805
  %295 = or i64 %294, %290, !dbg !1805
  %296 = getelementptr inbounds i8, i8 addrspace(5)* %282, i32 2
  %297 = load i8, i8 addrspace(5)* %296, align 1, !dbg !1805, !tbaa !1807
  %298 = zext i8 %297 to i64, !dbg !1805
  %299 = shl nuw nsw i64 %298, 16, !dbg !1805
  %300 = or i64 %295, %299, !dbg !1805
  %301 = getelementptr inbounds i8, i8 addrspace(5)* %282, i32 3
  %302 = load i8, i8 addrspace(5)* %301, align 1, !dbg !1805, !tbaa !1807
  %303 = zext i8 %302 to i64, !dbg !1805
  %304 = shl nuw nsw i64 %303, 24, !dbg !1805
  %305 = or i64 %300, %304, !dbg !1805
  %306 = getelementptr inbounds i8, i8 addrspace(5)* %282, i32 4
  %307 = load i8, i8 addrspace(5)* %306, align 1, !dbg !1805, !tbaa !1807
  %308 = zext i8 %307 to i64, !dbg !1805
  %309 = shl nuw nsw i64 %308, 32, !dbg !1805
  %310 = or i64 %305, %309, !dbg !1805
  %311 = getelementptr inbounds i8, i8 addrspace(5)* %282, i32 5
  %312 = load i8, i8 addrspace(5)* %311, align 1, !dbg !1805, !tbaa !1807
  %313 = zext i8 %312 to i64, !dbg !1805
  %314 = shl nuw nsw i64 %313, 40, !dbg !1805
  %315 = or i64 %310, %314, !dbg !1805
  %316 = getelementptr inbounds i8, i8 addrspace(5)* %282, i32 6
  %317 = load i8, i8 addrspace(5)* %316, align 1, !dbg !1805, !tbaa !1807
  %318 = zext i8 %317 to i64, !dbg !1805
  %319 = shl nuw nsw i64 %318, 48, !dbg !1805
  %320 = or i64 %315, %319, !dbg !1805
  %321 = getelementptr inbounds i8, i8 addrspace(5)* %282, i32 7
  %322 = load i8, i8 addrspace(5)* %321, align 1, !dbg !1805, !tbaa !1807
  %323 = zext i8 %322 to i64, !dbg !1805
  %324 = shl nuw i64 %323, 56, !dbg !1805
  %325 = or i64 %320, %324, !dbg !1805
  %326 = add nsw i32 %283, -8, !dbg !1805
  %327 = getelementptr inbounds i8, i8 addrspace(5)* %282, i32 8
  br label %340, !dbg !1805

328:                                              ; preds = %286, %328
  %329 = phi i32 [ %338, %328 ], [ 0, %286 ], !dbg !1805
  %330 = phi i64 [ %337, %328 ], [ 0, %286 ], !dbg !1805
  %331 = getelementptr inbounds i8, i8 addrspace(5)* %282, i32 %329
  %332 = load i8, i8 addrspace(5)* %331, align 1, !dbg !1805, !tbaa !1807
  %333 = zext i8 %332 to i64, !dbg !1805
  %334 = shl i32 %329, 3, !dbg !1805
  %335 = zext i32 %334 to i64, !dbg !1805
  %336 = shl nuw i64 %333, %335, !dbg !1805
  %337 = or i64 %336, %330, !dbg !1805
  %338 = add nuw nsw i32 %329, 1, !dbg !1805
  %339 = icmp eq i32 %338, %283, !dbg !1805
  br i1 %339, label %340, label %328, !dbg !1805

340:                                              ; preds = %328, %288, %286
  %341 = phi i8 addrspace(5)* [ %327, %288 ], [ %282, %286 ], [ %282, %328 ]
  %342 = phi i32 [ %326, %288 ], [ 0, %286 ], [ 0, %328 ], !dbg !1805
  %343 = phi i64 [ %325, %288 ], [ 0, %286 ], [ %337, %328 ], !dbg !1805
  %344 = icmp ugt i32 %342, 7, !dbg !1805
  br i1 %344, label %347, label %345, !dbg !1805

345:                                              ; preds = %340
  %346 = icmp eq i32 %342, 0, !dbg !1805
  br i1 %346, label %399, label %387, !dbg !1805

347:                                              ; preds = %340
  %348 = load i8, i8 addrspace(5)* %341, align 1, !dbg !1805, !tbaa !1807
  %349 = zext i8 %348 to i64, !dbg !1805
  %350 = getelementptr inbounds i8, i8 addrspace(5)* %341, i32 1
  %351 = load i8, i8 addrspace(5)* %350, align 1, !dbg !1805, !tbaa !1807
  %352 = zext i8 %351 to i64, !dbg !1805
  %353 = shl nuw nsw i64 %352, 8, !dbg !1805
  %354 = or i64 %353, %349, !dbg !1805
  %355 = getelementptr inbounds i8, i8 addrspace(5)* %341, i32 2
  %356 = load i8, i8 addrspace(5)* %355, align 1, !dbg !1805, !tbaa !1807
  %357 = zext i8 %356 to i64, !dbg !1805
  %358 = shl nuw nsw i64 %357, 16, !dbg !1805
  %359 = or i64 %354, %358, !dbg !1805
  %360 = getelementptr inbounds i8, i8 addrspace(5)* %341, i32 3
  %361 = load i8, i8 addrspace(5)* %360, align 1, !dbg !1805, !tbaa !1807
  %362 = zext i8 %361 to i64, !dbg !1805
  %363 = shl nuw nsw i64 %362, 24, !dbg !1805
  %364 = or i64 %359, %363, !dbg !1805
  %365 = getelementptr inbounds i8, i8 addrspace(5)* %341, i32 4
  %366 = load i8, i8 addrspace(5)* %365, align 1, !dbg !1805, !tbaa !1807
  %367 = zext i8 %366 to i64, !dbg !1805
  %368 = shl nuw nsw i64 %367, 32, !dbg !1805
  %369 = or i64 %364, %368, !dbg !1805
  %370 = getelementptr inbounds i8, i8 addrspace(5)* %341, i32 5
  %371 = load i8, i8 addrspace(5)* %370, align 1, !dbg !1805, !tbaa !1807
  %372 = zext i8 %371 to i64, !dbg !1805
  %373 = shl nuw nsw i64 %372, 40, !dbg !1805
  %374 = or i64 %369, %373, !dbg !1805
  %375 = getelementptr inbounds i8, i8 addrspace(5)* %341, i32 6
  %376 = load i8, i8 addrspace(5)* %375, align 1, !dbg !1805, !tbaa !1807
  %377 = zext i8 %376 to i64, !dbg !1805
  %378 = shl nuw nsw i64 %377, 48, !dbg !1805
  %379 = or i64 %374, %378, !dbg !1805
  %380 = getelementptr inbounds i8, i8 addrspace(5)* %341, i32 7
  %381 = load i8, i8 addrspace(5)* %380, align 1, !dbg !1805, !tbaa !1807
  %382 = zext i8 %381 to i64, !dbg !1805
  %383 = shl nuw i64 %382, 56, !dbg !1805
  %384 = or i64 %379, %383, !dbg !1805
  %385 = add nsw i32 %342, -8, !dbg !1805
  %386 = getelementptr inbounds i8, i8 addrspace(5)* %341, i32 8
  br label %399, !dbg !1805

387:                                              ; preds = %345, %387
  %388 = phi i32 [ %397, %387 ], [ 0, %345 ], !dbg !1805
  %389 = phi i64 [ %396, %387 ], [ 0, %345 ], !dbg !1805
  %390 = getelementptr inbounds i8, i8 addrspace(5)* %341, i32 %388
  %391 = load i8, i8 addrspace(5)* %390, align 1, !dbg !1805, !tbaa !1807
  %392 = zext i8 %391 to i64, !dbg !1805
  %393 = shl i32 %388, 3, !dbg !1805
  %394 = zext i32 %393 to i64, !dbg !1805
  %395 = shl nuw i64 %392, %394, !dbg !1805
  %396 = or i64 %395, %389, !dbg !1805
  %397 = add nuw nsw i32 %388, 1, !dbg !1805
  %398 = icmp eq i32 %397, %342, !dbg !1805
  br i1 %398, label %399, label %387, !dbg !1805

399:                                              ; preds = %387, %347, %345
  %400 = phi i8 addrspace(5)* [ %386, %347 ], [ %341, %345 ], [ %341, %387 ]
  %401 = phi i32 [ %385, %347 ], [ 0, %345 ], [ 0, %387 ], !dbg !1805
  %402 = phi i64 [ %384, %347 ], [ 0, %345 ], [ %396, %387 ], !dbg !1805
  %403 = icmp ugt i32 %401, 7, !dbg !1805
  br i1 %403, label %406, label %404, !dbg !1805

404:                                              ; preds = %399
  %405 = icmp eq i32 %401, 0, !dbg !1805
  br i1 %405, label %456, label %444, !dbg !1805

406:                                              ; preds = %399
  %407 = load i8, i8 addrspace(5)* %400, align 1, !dbg !1805, !tbaa !1807
  %408 = zext i8 %407 to i64, !dbg !1805
  %409 = getelementptr inbounds i8, i8 addrspace(5)* %400, i32 1
  %410 = load i8, i8 addrspace(5)* %409, align 1, !dbg !1805, !tbaa !1807
  %411 = zext i8 %410 to i64, !dbg !1805
  %412 = shl nuw nsw i64 %411, 8, !dbg !1805
  %413 = or i64 %412, %408, !dbg !1805
  %414 = getelementptr inbounds i8, i8 addrspace(5)* %400, i32 2
  %415 = load i8, i8 addrspace(5)* %414, align 1, !dbg !1805, !tbaa !1807
  %416 = zext i8 %415 to i64, !dbg !1805
  %417 = shl nuw nsw i64 %416, 16, !dbg !1805
  %418 = or i64 %413, %417, !dbg !1805
  %419 = getelementptr inbounds i8, i8 addrspace(5)* %400, i32 3
  %420 = load i8, i8 addrspace(5)* %419, align 1, !dbg !1805, !tbaa !1807
  %421 = zext i8 %420 to i64, !dbg !1805
  %422 = shl nuw nsw i64 %421, 24, !dbg !1805
  %423 = or i64 %418, %422, !dbg !1805
  %424 = getelementptr inbounds i8, i8 addrspace(5)* %400, i32 4
  %425 = load i8, i8 addrspace(5)* %424, align 1, !dbg !1805, !tbaa !1807
  %426 = zext i8 %425 to i64, !dbg !1805
  %427 = shl nuw nsw i64 %426, 32, !dbg !1805
  %428 = or i64 %423, %427, !dbg !1805
  %429 = getelementptr inbounds i8, i8 addrspace(5)* %400, i32 5
  %430 = load i8, i8 addrspace(5)* %429, align 1, !dbg !1805, !tbaa !1807
  %431 = zext i8 %430 to i64, !dbg !1805
  %432 = shl nuw nsw i64 %431, 40, !dbg !1805
  %433 = or i64 %428, %432, !dbg !1805
  %434 = getelementptr inbounds i8, i8 addrspace(5)* %400, i32 6
  %435 = load i8, i8 addrspace(5)* %434, align 1, !dbg !1805, !tbaa !1807
  %436 = zext i8 %435 to i64, !dbg !1805
  %437 = shl nuw nsw i64 %436, 48, !dbg !1805
  %438 = or i64 %433, %437, !dbg !1805
  %439 = getelementptr inbounds i8, i8 addrspace(5)* %400, i32 7
  %440 = load i8, i8 addrspace(5)* %439, align 1, !dbg !1805, !tbaa !1807
  %441 = zext i8 %440 to i64, !dbg !1805
  %442 = shl nuw i64 %441, 56, !dbg !1805
  %443 = or i64 %438, %442, !dbg !1805
  br label %456, !dbg !1805

444:                                              ; preds = %404, %444
  %445 = phi i32 [ %454, %444 ], [ 0, %404 ], !dbg !1805
  %446 = phi i64 [ %453, %444 ], [ 0, %404 ], !dbg !1805
  %447 = getelementptr inbounds i8, i8 addrspace(5)* %400, i32 %445
  %448 = load i8, i8 addrspace(5)* %447, align 1, !dbg !1805, !tbaa !1807
  %449 = zext i8 %448 to i64, !dbg !1805
  %450 = shl i32 %445, 3, !dbg !1805
  %451 = zext i32 %450 to i64, !dbg !1805
  %452 = shl nuw i64 %449, %451, !dbg !1805
  %453 = or i64 %452, %446, !dbg !1805
  %454 = add nuw nsw i32 %445, 1, !dbg !1805
  %455 = icmp eq i32 %454, %401, !dbg !1805
  br i1 %455, label %456, label %444, !dbg !1805

456:                                              ; preds = %444, %406, %404
  %457 = phi i64 [ %443, %406 ], [ 0, %404 ], [ %453, %444 ], !dbg !1805
  %458 = shl nuw nsw i64 %46, 2, !dbg !1805
  %459 = add nuw nsw i64 %458, 28, !dbg !1805
  %460 = and i64 %459, 480, !dbg !1805
  %461 = and i64 %48, -225, !dbg !1805
  %462 = or i64 %461, %460, !dbg !1805
  %463 = call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %462, i64 noundef %107, i64 noundef %166, i64 noundef %225, i64 noundef %284, i64 noundef %343, i64 noundef %402, i64 noundef %457) #16, !dbg !1805
  %464 = sub i64 %38, %46, !dbg !1805
  %465 = getelementptr inbounds i8, i8 addrspace(5)* %39, i32 %47
  %466 = icmp eq i64 %464, 0, !dbg !1805
  br i1 %466, label %467, label %37, !dbg !1805

467:                                              ; preds = %456, %22
  %468 = phi <2 x i64> [ %25, %22 ], [ %463, %456 ], !dbg !1805
  br label %469, !dbg !1808

469:                                              ; preds = %469, %467
  %470 = phi i8* [ %1, %467 ], [ %471, %469 ], !dbg !1808
  %471 = getelementptr inbounds i8, i8* %470, i64 1, !dbg !1808
  %472 = load i8, i8* %470, align 1, !dbg !1808, !tbaa !1800
  %473 = icmp eq i8 %472, 0, !dbg !1808
  br i1 %473, label %474, label %469, !dbg !1808, !llvm.loop !1809

474:                                              ; preds = %469
  %475 = extractelement <2 x i64> %468, i64 0, !dbg !1805
  %476 = icmp eq i8* %1, null, !dbg !1810
  br i1 %476, label %477, label %481, !dbg !1810

477:                                              ; preds = %474
  %478 = and i64 %475, -225, !dbg !1810
  %479 = or i64 %478, 32, !dbg !1810
  %480 = call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %479, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #16, !dbg !1810
  br label %927, !dbg !1810

481:                                              ; preds = %474
  %482 = ptrtoint i8* %471 to i64, !dbg !1808
  %483 = ptrtoint i8* %1 to i64, !dbg !1808
  %484 = sub i64 %482, %483, !dbg !1808
  %485 = shl i64 %484, 32, !dbg !1811
  %486 = ashr exact i64 %485, 32, !dbg !1811
  %487 = and i64 %475, 2, !dbg !1810
  %488 = and i64 %475, -3, !dbg !1810
  %489 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %488, i64 0, !dbg !1810
  br label %490, !dbg !1810

490:                                              ; preds = %916, %481
  %491 = phi i64 [ %486, %481 ], [ %924, %916 ], !dbg !1810
  %492 = phi i8* [ %1, %481 ], [ %925, %916 ], !dbg !1810
  %493 = phi <2 x i64> [ %489, %481 ], [ %923, %916 ], !dbg !1810
  %494 = icmp ugt i64 %491, 56, !dbg !1810
  %495 = extractelement <2 x i64> %493, i64 0, !dbg !1810
  %496 = or i64 %495, %487, !dbg !1810
  %497 = insertelement <2 x i64> poison, i64 %496, i64 0, !dbg !1810
  %498 = select i1 %494, <2 x i64> %493, <2 x i64> %497, !dbg !1810
  %499 = call i64 @llvm.umin.i64(i64 %491, i64 56), !dbg !1810
  %500 = trunc i64 %499 to i32, !dbg !1810
  %501 = extractelement <2 x i64> %498, i64 0, !dbg !1810
  %502 = icmp ugt i32 %500, 7, !dbg !1810
  br i1 %502, label %505, label %503, !dbg !1810

503:                                              ; preds = %490
  %504 = icmp eq i32 %500, 0, !dbg !1810
  br i1 %504, label %558, label %545, !dbg !1810

505:                                              ; preds = %490
  %506 = load i8, i8* %492, align 1, !dbg !1810, !tbaa !1807
  %507 = zext i8 %506 to i64, !dbg !1810
  %508 = getelementptr inbounds i8, i8* %492, i64 1, !dbg !1810
  %509 = load i8, i8* %508, align 1, !dbg !1810, !tbaa !1807
  %510 = zext i8 %509 to i64, !dbg !1810
  %511 = shl nuw nsw i64 %510, 8, !dbg !1810
  %512 = or i64 %511, %507, !dbg !1810
  %513 = getelementptr inbounds i8, i8* %492, i64 2, !dbg !1810
  %514 = load i8, i8* %513, align 1, !dbg !1810, !tbaa !1807
  %515 = zext i8 %514 to i64, !dbg !1810
  %516 = shl nuw nsw i64 %515, 16, !dbg !1810
  %517 = or i64 %512, %516, !dbg !1810
  %518 = getelementptr inbounds i8, i8* %492, i64 3, !dbg !1810
  %519 = load i8, i8* %518, align 1, !dbg !1810, !tbaa !1807
  %520 = zext i8 %519 to i64, !dbg !1810
  %521 = shl nuw nsw i64 %520, 24, !dbg !1810
  %522 = or i64 %517, %521, !dbg !1810
  %523 = getelementptr inbounds i8, i8* %492, i64 4, !dbg !1810
  %524 = load i8, i8* %523, align 1, !dbg !1810, !tbaa !1807
  %525 = zext i8 %524 to i64, !dbg !1810
  %526 = shl nuw nsw i64 %525, 32, !dbg !1810
  %527 = or i64 %522, %526, !dbg !1810
  %528 = getelementptr inbounds i8, i8* %492, i64 5, !dbg !1810
  %529 = load i8, i8* %528, align 1, !dbg !1810, !tbaa !1807
  %530 = zext i8 %529 to i64, !dbg !1810
  %531 = shl nuw nsw i64 %530, 40, !dbg !1810
  %532 = or i64 %527, %531, !dbg !1810
  %533 = getelementptr inbounds i8, i8* %492, i64 6, !dbg !1810
  %534 = load i8, i8* %533, align 1, !dbg !1810, !tbaa !1807
  %535 = zext i8 %534 to i64, !dbg !1810
  %536 = shl nuw nsw i64 %535, 48, !dbg !1810
  %537 = or i64 %532, %536, !dbg !1810
  %538 = getelementptr inbounds i8, i8* %492, i64 7, !dbg !1810
  %539 = load i8, i8* %538, align 1, !dbg !1810, !tbaa !1807
  %540 = zext i8 %539 to i64, !dbg !1810
  %541 = shl nuw i64 %540, 56, !dbg !1810
  %542 = or i64 %537, %541, !dbg !1810
  %543 = add nsw i32 %500, -8, !dbg !1810
  %544 = getelementptr inbounds i8, i8* %492, i64 8, !dbg !1810
  br label %558, !dbg !1810

545:                                              ; preds = %503, %545
  %546 = phi i32 [ %556, %545 ], [ 0, %503 ], !dbg !1810
  %547 = phi i64 [ %555, %545 ], [ 0, %503 ], !dbg !1810
  %548 = zext i32 %546 to i64, !dbg !1810
  %549 = getelementptr inbounds i8, i8* %492, i64 %548, !dbg !1810
  %550 = load i8, i8* %549, align 1, !dbg !1810, !tbaa !1807
  %551 = zext i8 %550 to i64, !dbg !1810
  %552 = shl i32 %546, 3, !dbg !1810
  %553 = zext i32 %552 to i64, !dbg !1810
  %554 = shl nuw i64 %551, %553, !dbg !1810
  %555 = or i64 %554, %547, !dbg !1810
  %556 = add nuw nsw i32 %546, 1, !dbg !1810
  %557 = icmp eq i32 %556, %500, !dbg !1810
  br i1 %557, label %558, label %545, !dbg !1810

558:                                              ; preds = %545, %505, %503
  %559 = phi i8* [ %544, %505 ], [ %492, %503 ], [ %492, %545 ], !dbg !1810
  %560 = phi i32 [ %543, %505 ], [ 0, %503 ], [ 0, %545 ], !dbg !1810
  %561 = phi i64 [ %542, %505 ], [ 0, %503 ], [ %555, %545 ], !dbg !1810
  %562 = icmp ugt i32 %560, 7, !dbg !1810
  br i1 %562, label %565, label %563, !dbg !1810

563:                                              ; preds = %558
  %564 = icmp eq i32 %560, 0, !dbg !1810
  br i1 %564, label %618, label %605, !dbg !1810

565:                                              ; preds = %558
  %566 = load i8, i8* %559, align 1, !dbg !1810, !tbaa !1807
  %567 = zext i8 %566 to i64, !dbg !1810
  %568 = getelementptr inbounds i8, i8* %559, i64 1, !dbg !1810
  %569 = load i8, i8* %568, align 1, !dbg !1810, !tbaa !1807
  %570 = zext i8 %569 to i64, !dbg !1810
  %571 = shl nuw nsw i64 %570, 8, !dbg !1810
  %572 = or i64 %571, %567, !dbg !1810
  %573 = getelementptr inbounds i8, i8* %559, i64 2, !dbg !1810
  %574 = load i8, i8* %573, align 1, !dbg !1810, !tbaa !1807
  %575 = zext i8 %574 to i64, !dbg !1810
  %576 = shl nuw nsw i64 %575, 16, !dbg !1810
  %577 = or i64 %572, %576, !dbg !1810
  %578 = getelementptr inbounds i8, i8* %559, i64 3, !dbg !1810
  %579 = load i8, i8* %578, align 1, !dbg !1810, !tbaa !1807
  %580 = zext i8 %579 to i64, !dbg !1810
  %581 = shl nuw nsw i64 %580, 24, !dbg !1810
  %582 = or i64 %577, %581, !dbg !1810
  %583 = getelementptr inbounds i8, i8* %559, i64 4, !dbg !1810
  %584 = load i8, i8* %583, align 1, !dbg !1810, !tbaa !1807
  %585 = zext i8 %584 to i64, !dbg !1810
  %586 = shl nuw nsw i64 %585, 32, !dbg !1810
  %587 = or i64 %582, %586, !dbg !1810
  %588 = getelementptr inbounds i8, i8* %559, i64 5, !dbg !1810
  %589 = load i8, i8* %588, align 1, !dbg !1810, !tbaa !1807
  %590 = zext i8 %589 to i64, !dbg !1810
  %591 = shl nuw nsw i64 %590, 40, !dbg !1810
  %592 = or i64 %587, %591, !dbg !1810
  %593 = getelementptr inbounds i8, i8* %559, i64 6, !dbg !1810
  %594 = load i8, i8* %593, align 1, !dbg !1810, !tbaa !1807
  %595 = zext i8 %594 to i64, !dbg !1810
  %596 = shl nuw nsw i64 %595, 48, !dbg !1810
  %597 = or i64 %592, %596, !dbg !1810
  %598 = getelementptr inbounds i8, i8* %559, i64 7, !dbg !1810
  %599 = load i8, i8* %598, align 1, !dbg !1810, !tbaa !1807
  %600 = zext i8 %599 to i64, !dbg !1810
  %601 = shl nuw i64 %600, 56, !dbg !1810
  %602 = or i64 %597, %601, !dbg !1810
  %603 = add nsw i32 %560, -8, !dbg !1810
  %604 = getelementptr inbounds i8, i8* %559, i64 8, !dbg !1810
  br label %618, !dbg !1810

605:                                              ; preds = %563, %605
  %606 = phi i32 [ %616, %605 ], [ 0, %563 ], !dbg !1810
  %607 = phi i64 [ %615, %605 ], [ 0, %563 ], !dbg !1810
  %608 = zext i32 %606 to i64, !dbg !1810
  %609 = getelementptr inbounds i8, i8* %559, i64 %608, !dbg !1810
  %610 = load i8, i8* %609, align 1, !dbg !1810, !tbaa !1807
  %611 = zext i8 %610 to i64, !dbg !1810
  %612 = shl i32 %606, 3, !dbg !1810
  %613 = zext i32 %612 to i64, !dbg !1810
  %614 = shl nuw i64 %611, %613, !dbg !1810
  %615 = or i64 %614, %607, !dbg !1810
  %616 = add nuw nsw i32 %606, 1, !dbg !1810
  %617 = icmp eq i32 %616, %560, !dbg !1810
  br i1 %617, label %618, label %605, !dbg !1810

618:                                              ; preds = %605, %565, %563
  %619 = phi i8* [ %604, %565 ], [ %559, %563 ], [ %559, %605 ], !dbg !1810
  %620 = phi i32 [ %603, %565 ], [ 0, %563 ], [ 0, %605 ], !dbg !1810
  %621 = phi i64 [ %602, %565 ], [ 0, %563 ], [ %615, %605 ], !dbg !1810
  %622 = icmp ugt i32 %620, 7, !dbg !1810
  br i1 %622, label %625, label %623, !dbg !1810

623:                                              ; preds = %618
  %624 = icmp eq i32 %620, 0, !dbg !1810
  br i1 %624, label %678, label %665, !dbg !1810

625:                                              ; preds = %618
  %626 = load i8, i8* %619, align 1, !dbg !1810, !tbaa !1807
  %627 = zext i8 %626 to i64, !dbg !1810
  %628 = getelementptr inbounds i8, i8* %619, i64 1, !dbg !1810
  %629 = load i8, i8* %628, align 1, !dbg !1810, !tbaa !1807
  %630 = zext i8 %629 to i64, !dbg !1810
  %631 = shl nuw nsw i64 %630, 8, !dbg !1810
  %632 = or i64 %631, %627, !dbg !1810
  %633 = getelementptr inbounds i8, i8* %619, i64 2, !dbg !1810
  %634 = load i8, i8* %633, align 1, !dbg !1810, !tbaa !1807
  %635 = zext i8 %634 to i64, !dbg !1810
  %636 = shl nuw nsw i64 %635, 16, !dbg !1810
  %637 = or i64 %632, %636, !dbg !1810
  %638 = getelementptr inbounds i8, i8* %619, i64 3, !dbg !1810
  %639 = load i8, i8* %638, align 1, !dbg !1810, !tbaa !1807
  %640 = zext i8 %639 to i64, !dbg !1810
  %641 = shl nuw nsw i64 %640, 24, !dbg !1810
  %642 = or i64 %637, %641, !dbg !1810
  %643 = getelementptr inbounds i8, i8* %619, i64 4, !dbg !1810
  %644 = load i8, i8* %643, align 1, !dbg !1810, !tbaa !1807
  %645 = zext i8 %644 to i64, !dbg !1810
  %646 = shl nuw nsw i64 %645, 32, !dbg !1810
  %647 = or i64 %642, %646, !dbg !1810
  %648 = getelementptr inbounds i8, i8* %619, i64 5, !dbg !1810
  %649 = load i8, i8* %648, align 1, !dbg !1810, !tbaa !1807
  %650 = zext i8 %649 to i64, !dbg !1810
  %651 = shl nuw nsw i64 %650, 40, !dbg !1810
  %652 = or i64 %647, %651, !dbg !1810
  %653 = getelementptr inbounds i8, i8* %619, i64 6, !dbg !1810
  %654 = load i8, i8* %653, align 1, !dbg !1810, !tbaa !1807
  %655 = zext i8 %654 to i64, !dbg !1810
  %656 = shl nuw nsw i64 %655, 48, !dbg !1810
  %657 = or i64 %652, %656, !dbg !1810
  %658 = getelementptr inbounds i8, i8* %619, i64 7, !dbg !1810
  %659 = load i8, i8* %658, align 1, !dbg !1810, !tbaa !1807
  %660 = zext i8 %659 to i64, !dbg !1810
  %661 = shl nuw i64 %660, 56, !dbg !1810
  %662 = or i64 %657, %661, !dbg !1810
  %663 = add nsw i32 %620, -8, !dbg !1810
  %664 = getelementptr inbounds i8, i8* %619, i64 8, !dbg !1810
  br label %678, !dbg !1810

665:                                              ; preds = %623, %665
  %666 = phi i32 [ %676, %665 ], [ 0, %623 ], !dbg !1810
  %667 = phi i64 [ %675, %665 ], [ 0, %623 ], !dbg !1810
  %668 = zext i32 %666 to i64, !dbg !1810
  %669 = getelementptr inbounds i8, i8* %619, i64 %668, !dbg !1810
  %670 = load i8, i8* %669, align 1, !dbg !1810, !tbaa !1807
  %671 = zext i8 %670 to i64, !dbg !1810
  %672 = shl i32 %666, 3, !dbg !1810
  %673 = zext i32 %672 to i64, !dbg !1810
  %674 = shl nuw i64 %671, %673, !dbg !1810
  %675 = or i64 %674, %667, !dbg !1810
  %676 = add nuw nsw i32 %666, 1, !dbg !1810
  %677 = icmp eq i32 %676, %620, !dbg !1810
  br i1 %677, label %678, label %665, !dbg !1810

678:                                              ; preds = %665, %625, %623
  %679 = phi i8* [ %664, %625 ], [ %619, %623 ], [ %619, %665 ], !dbg !1810
  %680 = phi i32 [ %663, %625 ], [ 0, %623 ], [ 0, %665 ], !dbg !1810
  %681 = phi i64 [ %662, %625 ], [ 0, %623 ], [ %675, %665 ], !dbg !1810
  %682 = icmp ugt i32 %680, 7, !dbg !1810
  br i1 %682, label %685, label %683, !dbg !1810

683:                                              ; preds = %678
  %684 = icmp eq i32 %680, 0, !dbg !1810
  br i1 %684, label %738, label %725, !dbg !1810

685:                                              ; preds = %678
  %686 = load i8, i8* %679, align 1, !dbg !1810, !tbaa !1807
  %687 = zext i8 %686 to i64, !dbg !1810
  %688 = getelementptr inbounds i8, i8* %679, i64 1, !dbg !1810
  %689 = load i8, i8* %688, align 1, !dbg !1810, !tbaa !1807
  %690 = zext i8 %689 to i64, !dbg !1810
  %691 = shl nuw nsw i64 %690, 8, !dbg !1810
  %692 = or i64 %691, %687, !dbg !1810
  %693 = getelementptr inbounds i8, i8* %679, i64 2, !dbg !1810
  %694 = load i8, i8* %693, align 1, !dbg !1810, !tbaa !1807
  %695 = zext i8 %694 to i64, !dbg !1810
  %696 = shl nuw nsw i64 %695, 16, !dbg !1810
  %697 = or i64 %692, %696, !dbg !1810
  %698 = getelementptr inbounds i8, i8* %679, i64 3, !dbg !1810
  %699 = load i8, i8* %698, align 1, !dbg !1810, !tbaa !1807
  %700 = zext i8 %699 to i64, !dbg !1810
  %701 = shl nuw nsw i64 %700, 24, !dbg !1810
  %702 = or i64 %697, %701, !dbg !1810
  %703 = getelementptr inbounds i8, i8* %679, i64 4, !dbg !1810
  %704 = load i8, i8* %703, align 1, !dbg !1810, !tbaa !1807
  %705 = zext i8 %704 to i64, !dbg !1810
  %706 = shl nuw nsw i64 %705, 32, !dbg !1810
  %707 = or i64 %702, %706, !dbg !1810
  %708 = getelementptr inbounds i8, i8* %679, i64 5, !dbg !1810
  %709 = load i8, i8* %708, align 1, !dbg !1810, !tbaa !1807
  %710 = zext i8 %709 to i64, !dbg !1810
  %711 = shl nuw nsw i64 %710, 40, !dbg !1810
  %712 = or i64 %707, %711, !dbg !1810
  %713 = getelementptr inbounds i8, i8* %679, i64 6, !dbg !1810
  %714 = load i8, i8* %713, align 1, !dbg !1810, !tbaa !1807
  %715 = zext i8 %714 to i64, !dbg !1810
  %716 = shl nuw nsw i64 %715, 48, !dbg !1810
  %717 = or i64 %712, %716, !dbg !1810
  %718 = getelementptr inbounds i8, i8* %679, i64 7, !dbg !1810
  %719 = load i8, i8* %718, align 1, !dbg !1810, !tbaa !1807
  %720 = zext i8 %719 to i64, !dbg !1810
  %721 = shl nuw i64 %720, 56, !dbg !1810
  %722 = or i64 %717, %721, !dbg !1810
  %723 = add nsw i32 %680, -8, !dbg !1810
  %724 = getelementptr inbounds i8, i8* %679, i64 8, !dbg !1810
  br label %738, !dbg !1810

725:                                              ; preds = %683, %725
  %726 = phi i32 [ %736, %725 ], [ 0, %683 ], !dbg !1810
  %727 = phi i64 [ %735, %725 ], [ 0, %683 ], !dbg !1810
  %728 = zext i32 %726 to i64, !dbg !1810
  %729 = getelementptr inbounds i8, i8* %679, i64 %728, !dbg !1810
  %730 = load i8, i8* %729, align 1, !dbg !1810, !tbaa !1807
  %731 = zext i8 %730 to i64, !dbg !1810
  %732 = shl i32 %726, 3, !dbg !1810
  %733 = zext i32 %732 to i64, !dbg !1810
  %734 = shl nuw i64 %731, %733, !dbg !1810
  %735 = or i64 %734, %727, !dbg !1810
  %736 = add nuw nsw i32 %726, 1, !dbg !1810
  %737 = icmp eq i32 %736, %680, !dbg !1810
  br i1 %737, label %738, label %725, !dbg !1810

738:                                              ; preds = %725, %685, %683
  %739 = phi i8* [ %724, %685 ], [ %679, %683 ], [ %679, %725 ], !dbg !1810
  %740 = phi i32 [ %723, %685 ], [ 0, %683 ], [ 0, %725 ], !dbg !1810
  %741 = phi i64 [ %722, %685 ], [ 0, %683 ], [ %735, %725 ], !dbg !1810
  %742 = icmp ugt i32 %740, 7, !dbg !1810
  br i1 %742, label %745, label %743, !dbg !1810

743:                                              ; preds = %738
  %744 = icmp eq i32 %740, 0, !dbg !1810
  br i1 %744, label %798, label %785, !dbg !1810

745:                                              ; preds = %738
  %746 = load i8, i8* %739, align 1, !dbg !1810, !tbaa !1807
  %747 = zext i8 %746 to i64, !dbg !1810
  %748 = getelementptr inbounds i8, i8* %739, i64 1, !dbg !1810
  %749 = load i8, i8* %748, align 1, !dbg !1810, !tbaa !1807
  %750 = zext i8 %749 to i64, !dbg !1810
  %751 = shl nuw nsw i64 %750, 8, !dbg !1810
  %752 = or i64 %751, %747, !dbg !1810
  %753 = getelementptr inbounds i8, i8* %739, i64 2, !dbg !1810
  %754 = load i8, i8* %753, align 1, !dbg !1810, !tbaa !1807
  %755 = zext i8 %754 to i64, !dbg !1810
  %756 = shl nuw nsw i64 %755, 16, !dbg !1810
  %757 = or i64 %752, %756, !dbg !1810
  %758 = getelementptr inbounds i8, i8* %739, i64 3, !dbg !1810
  %759 = load i8, i8* %758, align 1, !dbg !1810, !tbaa !1807
  %760 = zext i8 %759 to i64, !dbg !1810
  %761 = shl nuw nsw i64 %760, 24, !dbg !1810
  %762 = or i64 %757, %761, !dbg !1810
  %763 = getelementptr inbounds i8, i8* %739, i64 4, !dbg !1810
  %764 = load i8, i8* %763, align 1, !dbg !1810, !tbaa !1807
  %765 = zext i8 %764 to i64, !dbg !1810
  %766 = shl nuw nsw i64 %765, 32, !dbg !1810
  %767 = or i64 %762, %766, !dbg !1810
  %768 = getelementptr inbounds i8, i8* %739, i64 5, !dbg !1810
  %769 = load i8, i8* %768, align 1, !dbg !1810, !tbaa !1807
  %770 = zext i8 %769 to i64, !dbg !1810
  %771 = shl nuw nsw i64 %770, 40, !dbg !1810
  %772 = or i64 %767, %771, !dbg !1810
  %773 = getelementptr inbounds i8, i8* %739, i64 6, !dbg !1810
  %774 = load i8, i8* %773, align 1, !dbg !1810, !tbaa !1807
  %775 = zext i8 %774 to i64, !dbg !1810
  %776 = shl nuw nsw i64 %775, 48, !dbg !1810
  %777 = or i64 %772, %776, !dbg !1810
  %778 = getelementptr inbounds i8, i8* %739, i64 7, !dbg !1810
  %779 = load i8, i8* %778, align 1, !dbg !1810, !tbaa !1807
  %780 = zext i8 %779 to i64, !dbg !1810
  %781 = shl nuw i64 %780, 56, !dbg !1810
  %782 = or i64 %777, %781, !dbg !1810
  %783 = add nsw i32 %740, -8, !dbg !1810
  %784 = getelementptr inbounds i8, i8* %739, i64 8, !dbg !1810
  br label %798, !dbg !1810

785:                                              ; preds = %743, %785
  %786 = phi i32 [ %796, %785 ], [ 0, %743 ], !dbg !1810
  %787 = phi i64 [ %795, %785 ], [ 0, %743 ], !dbg !1810
  %788 = zext i32 %786 to i64, !dbg !1810
  %789 = getelementptr inbounds i8, i8* %739, i64 %788, !dbg !1810
  %790 = load i8, i8* %789, align 1, !dbg !1810, !tbaa !1807
  %791 = zext i8 %790 to i64, !dbg !1810
  %792 = shl i32 %786, 3, !dbg !1810
  %793 = zext i32 %792 to i64, !dbg !1810
  %794 = shl nuw i64 %791, %793, !dbg !1810
  %795 = or i64 %794, %787, !dbg !1810
  %796 = add nuw nsw i32 %786, 1, !dbg !1810
  %797 = icmp eq i32 %796, %740, !dbg !1810
  br i1 %797, label %798, label %785, !dbg !1810

798:                                              ; preds = %785, %745, %743
  %799 = phi i8* [ %784, %745 ], [ %739, %743 ], [ %739, %785 ], !dbg !1810
  %800 = phi i32 [ %783, %745 ], [ 0, %743 ], [ 0, %785 ], !dbg !1810
  %801 = phi i64 [ %782, %745 ], [ 0, %743 ], [ %795, %785 ], !dbg !1810
  %802 = icmp ugt i32 %800, 7, !dbg !1810
  br i1 %802, label %805, label %803, !dbg !1810

803:                                              ; preds = %798
  %804 = icmp eq i32 %800, 0, !dbg !1810
  br i1 %804, label %858, label %845, !dbg !1810

805:                                              ; preds = %798
  %806 = load i8, i8* %799, align 1, !dbg !1810, !tbaa !1807
  %807 = zext i8 %806 to i64, !dbg !1810
  %808 = getelementptr inbounds i8, i8* %799, i64 1, !dbg !1810
  %809 = load i8, i8* %808, align 1, !dbg !1810, !tbaa !1807
  %810 = zext i8 %809 to i64, !dbg !1810
  %811 = shl nuw nsw i64 %810, 8, !dbg !1810
  %812 = or i64 %811, %807, !dbg !1810
  %813 = getelementptr inbounds i8, i8* %799, i64 2, !dbg !1810
  %814 = load i8, i8* %813, align 1, !dbg !1810, !tbaa !1807
  %815 = zext i8 %814 to i64, !dbg !1810
  %816 = shl nuw nsw i64 %815, 16, !dbg !1810
  %817 = or i64 %812, %816, !dbg !1810
  %818 = getelementptr inbounds i8, i8* %799, i64 3, !dbg !1810
  %819 = load i8, i8* %818, align 1, !dbg !1810, !tbaa !1807
  %820 = zext i8 %819 to i64, !dbg !1810
  %821 = shl nuw nsw i64 %820, 24, !dbg !1810
  %822 = or i64 %817, %821, !dbg !1810
  %823 = getelementptr inbounds i8, i8* %799, i64 4, !dbg !1810
  %824 = load i8, i8* %823, align 1, !dbg !1810, !tbaa !1807
  %825 = zext i8 %824 to i64, !dbg !1810
  %826 = shl nuw nsw i64 %825, 32, !dbg !1810
  %827 = or i64 %822, %826, !dbg !1810
  %828 = getelementptr inbounds i8, i8* %799, i64 5, !dbg !1810
  %829 = load i8, i8* %828, align 1, !dbg !1810, !tbaa !1807
  %830 = zext i8 %829 to i64, !dbg !1810
  %831 = shl nuw nsw i64 %830, 40, !dbg !1810
  %832 = or i64 %827, %831, !dbg !1810
  %833 = getelementptr inbounds i8, i8* %799, i64 6, !dbg !1810
  %834 = load i8, i8* %833, align 1, !dbg !1810, !tbaa !1807
  %835 = zext i8 %834 to i64, !dbg !1810
  %836 = shl nuw nsw i64 %835, 48, !dbg !1810
  %837 = or i64 %832, %836, !dbg !1810
  %838 = getelementptr inbounds i8, i8* %799, i64 7, !dbg !1810
  %839 = load i8, i8* %838, align 1, !dbg !1810, !tbaa !1807
  %840 = zext i8 %839 to i64, !dbg !1810
  %841 = shl nuw i64 %840, 56, !dbg !1810
  %842 = or i64 %837, %841, !dbg !1810
  %843 = add nsw i32 %800, -8, !dbg !1810
  %844 = getelementptr inbounds i8, i8* %799, i64 8, !dbg !1810
  br label %858, !dbg !1810

845:                                              ; preds = %803, %845
  %846 = phi i32 [ %856, %845 ], [ 0, %803 ], !dbg !1810
  %847 = phi i64 [ %855, %845 ], [ 0, %803 ], !dbg !1810
  %848 = zext i32 %846 to i64, !dbg !1810
  %849 = getelementptr inbounds i8, i8* %799, i64 %848, !dbg !1810
  %850 = load i8, i8* %849, align 1, !dbg !1810, !tbaa !1807
  %851 = zext i8 %850 to i64, !dbg !1810
  %852 = shl i32 %846, 3, !dbg !1810
  %853 = zext i32 %852 to i64, !dbg !1810
  %854 = shl nuw i64 %851, %853, !dbg !1810
  %855 = or i64 %854, %847, !dbg !1810
  %856 = add nuw nsw i32 %846, 1, !dbg !1810
  %857 = icmp eq i32 %856, %800, !dbg !1810
  br i1 %857, label %858, label %845, !dbg !1810

858:                                              ; preds = %845, %805, %803
  %859 = phi i8* [ %844, %805 ], [ %799, %803 ], [ %799, %845 ], !dbg !1810
  %860 = phi i32 [ %843, %805 ], [ 0, %803 ], [ 0, %845 ], !dbg !1810
  %861 = phi i64 [ %842, %805 ], [ 0, %803 ], [ %855, %845 ], !dbg !1810
  %862 = icmp ugt i32 %860, 7, !dbg !1810
  br i1 %862, label %865, label %863, !dbg !1810

863:                                              ; preds = %858
  %864 = icmp eq i32 %860, 0, !dbg !1810
  br i1 %864, label %916, label %903, !dbg !1810

865:                                              ; preds = %858
  %866 = load i8, i8* %859, align 1, !dbg !1810, !tbaa !1807
  %867 = zext i8 %866 to i64, !dbg !1810
  %868 = getelementptr inbounds i8, i8* %859, i64 1, !dbg !1810
  %869 = load i8, i8* %868, align 1, !dbg !1810, !tbaa !1807
  %870 = zext i8 %869 to i64, !dbg !1810
  %871 = shl nuw nsw i64 %870, 8, !dbg !1810
  %872 = or i64 %871, %867, !dbg !1810
  %873 = getelementptr inbounds i8, i8* %859, i64 2, !dbg !1810
  %874 = load i8, i8* %873, align 1, !dbg !1810, !tbaa !1807
  %875 = zext i8 %874 to i64, !dbg !1810
  %876 = shl nuw nsw i64 %875, 16, !dbg !1810
  %877 = or i64 %872, %876, !dbg !1810
  %878 = getelementptr inbounds i8, i8* %859, i64 3, !dbg !1810
  %879 = load i8, i8* %878, align 1, !dbg !1810, !tbaa !1807
  %880 = zext i8 %879 to i64, !dbg !1810
  %881 = shl nuw nsw i64 %880, 24, !dbg !1810
  %882 = or i64 %877, %881, !dbg !1810
  %883 = getelementptr inbounds i8, i8* %859, i64 4, !dbg !1810
  %884 = load i8, i8* %883, align 1, !dbg !1810, !tbaa !1807
  %885 = zext i8 %884 to i64, !dbg !1810
  %886 = shl nuw nsw i64 %885, 32, !dbg !1810
  %887 = or i64 %882, %886, !dbg !1810
  %888 = getelementptr inbounds i8, i8* %859, i64 5, !dbg !1810
  %889 = load i8, i8* %888, align 1, !dbg !1810, !tbaa !1807
  %890 = zext i8 %889 to i64, !dbg !1810
  %891 = shl nuw nsw i64 %890, 40, !dbg !1810
  %892 = or i64 %887, %891, !dbg !1810
  %893 = getelementptr inbounds i8, i8* %859, i64 6, !dbg !1810
  %894 = load i8, i8* %893, align 1, !dbg !1810, !tbaa !1807
  %895 = zext i8 %894 to i64, !dbg !1810
  %896 = shl nuw nsw i64 %895, 48, !dbg !1810
  %897 = or i64 %892, %896, !dbg !1810
  %898 = getelementptr inbounds i8, i8* %859, i64 7, !dbg !1810
  %899 = load i8, i8* %898, align 1, !dbg !1810, !tbaa !1807
  %900 = zext i8 %899 to i64, !dbg !1810
  %901 = shl nuw i64 %900, 56, !dbg !1810
  %902 = or i64 %897, %901, !dbg !1810
  br label %916, !dbg !1810

903:                                              ; preds = %863, %903
  %904 = phi i32 [ %914, %903 ], [ 0, %863 ], !dbg !1810
  %905 = phi i64 [ %913, %903 ], [ 0, %863 ], !dbg !1810
  %906 = zext i32 %904 to i64, !dbg !1810
  %907 = getelementptr inbounds i8, i8* %859, i64 %906, !dbg !1810
  %908 = load i8, i8* %907, align 1, !dbg !1810, !tbaa !1807
  %909 = zext i8 %908 to i64, !dbg !1810
  %910 = shl i32 %904, 3, !dbg !1810
  %911 = zext i32 %910 to i64, !dbg !1810
  %912 = shl nuw i64 %909, %911, !dbg !1810
  %913 = or i64 %912, %905, !dbg !1810
  %914 = add nuw nsw i32 %904, 1, !dbg !1810
  %915 = icmp eq i32 %914, %860, !dbg !1810
  br i1 %915, label %916, label %903, !dbg !1810

916:                                              ; preds = %903, %865, %863
  %917 = phi i64 [ %902, %865 ], [ 0, %863 ], [ %913, %903 ], !dbg !1810
  %918 = shl nuw nsw i64 %499, 2, !dbg !1810
  %919 = add nuw nsw i64 %918, 28, !dbg !1810
  %920 = and i64 %919, 480, !dbg !1810
  %921 = and i64 %501, -225, !dbg !1810
  %922 = or i64 %921, %920, !dbg !1810
  %923 = call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %922, i64 noundef %561, i64 noundef %621, i64 noundef %681, i64 noundef %741, i64 noundef %801, i64 noundef %861, i64 noundef %917) #16, !dbg !1810
  %924 = sub i64 %491, %499, !dbg !1810
  %925 = getelementptr inbounds i8, i8* %492, i64 %499, !dbg !1810
  %926 = icmp eq i64 %924, 0, !dbg !1810
  br i1 %926, label %927, label %490, !dbg !1810

927:                                              ; preds = %916, %477
  %928 = phi <2 x i64> [ %480, %477 ], [ %923, %916 ], !dbg !1810
  %929 = extractelement <2 x i64> %928, i64 0, !dbg !1810
  %930 = zext i32 %2 to i64, !dbg !1812
  %931 = and i64 %929, -225, !dbg !1813
  %932 = or i64 %931, 32, !dbg !1813
  %933 = call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %932, i64 noundef %930, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #16, !dbg !1813
  br label %934, !dbg !1814

934:                                              ; preds = %934, %927
  %935 = phi i8* [ %3, %927 ], [ %936, %934 ], !dbg !1814
  %936 = getelementptr inbounds i8, i8* %935, i64 1, !dbg !1814
  %937 = load i8, i8* %935, align 1, !dbg !1814, !tbaa !1800
  %938 = icmp eq i8 %937, 0, !dbg !1814
  br i1 %938, label %939, label %934, !dbg !1814, !llvm.loop !1815

939:                                              ; preds = %934
  %940 = extractelement <2 x i64> %933, i64 0, !dbg !1813
  %941 = icmp eq i8* %3, null, !dbg !1816
  br i1 %941, label %942, label %946, !dbg !1816

942:                                              ; preds = %939
  %943 = and i64 %940, -225, !dbg !1816
  %944 = or i64 %943, 32, !dbg !1816
  %945 = call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %944, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #16, !dbg !1816
  br label %1392, !dbg !1816

946:                                              ; preds = %939
  %947 = ptrtoint i8* %936 to i64, !dbg !1814
  %948 = ptrtoint i8* %3 to i64, !dbg !1814
  %949 = sub i64 %947, %948, !dbg !1814
  %950 = shl i64 %949, 32, !dbg !1817
  %951 = ashr exact i64 %950, 32, !dbg !1817
  %952 = and i64 %940, 2, !dbg !1816
  %953 = and i64 %940, -3, !dbg !1816
  %954 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %953, i64 0, !dbg !1816
  br label %955, !dbg !1816

955:                                              ; preds = %1381, %946
  %956 = phi i64 [ %951, %946 ], [ %1389, %1381 ], !dbg !1816
  %957 = phi i8* [ %3, %946 ], [ %1390, %1381 ], !dbg !1816
  %958 = phi <2 x i64> [ %954, %946 ], [ %1388, %1381 ], !dbg !1816
  %959 = icmp ugt i64 %956, 56, !dbg !1816
  %960 = extractelement <2 x i64> %958, i64 0, !dbg !1816
  %961 = or i64 %960, %952, !dbg !1816
  %962 = insertelement <2 x i64> poison, i64 %961, i64 0, !dbg !1816
  %963 = select i1 %959, <2 x i64> %958, <2 x i64> %962, !dbg !1816
  %964 = call i64 @llvm.umin.i64(i64 %956, i64 56), !dbg !1816
  %965 = trunc i64 %964 to i32, !dbg !1816
  %966 = extractelement <2 x i64> %963, i64 0, !dbg !1816
  %967 = icmp ugt i32 %965, 7, !dbg !1816
  br i1 %967, label %970, label %968, !dbg !1816

968:                                              ; preds = %955
  %969 = icmp eq i32 %965, 0, !dbg !1816
  br i1 %969, label %1023, label %1010, !dbg !1816

970:                                              ; preds = %955
  %971 = load i8, i8* %957, align 1, !dbg !1816, !tbaa !1807
  %972 = zext i8 %971 to i64, !dbg !1816
  %973 = getelementptr inbounds i8, i8* %957, i64 1, !dbg !1816
  %974 = load i8, i8* %973, align 1, !dbg !1816, !tbaa !1807
  %975 = zext i8 %974 to i64, !dbg !1816
  %976 = shl nuw nsw i64 %975, 8, !dbg !1816
  %977 = or i64 %976, %972, !dbg !1816
  %978 = getelementptr inbounds i8, i8* %957, i64 2, !dbg !1816
  %979 = load i8, i8* %978, align 1, !dbg !1816, !tbaa !1807
  %980 = zext i8 %979 to i64, !dbg !1816
  %981 = shl nuw nsw i64 %980, 16, !dbg !1816
  %982 = or i64 %977, %981, !dbg !1816
  %983 = getelementptr inbounds i8, i8* %957, i64 3, !dbg !1816
  %984 = load i8, i8* %983, align 1, !dbg !1816, !tbaa !1807
  %985 = zext i8 %984 to i64, !dbg !1816
  %986 = shl nuw nsw i64 %985, 24, !dbg !1816
  %987 = or i64 %982, %986, !dbg !1816
  %988 = getelementptr inbounds i8, i8* %957, i64 4, !dbg !1816
  %989 = load i8, i8* %988, align 1, !dbg !1816, !tbaa !1807
  %990 = zext i8 %989 to i64, !dbg !1816
  %991 = shl nuw nsw i64 %990, 32, !dbg !1816
  %992 = or i64 %987, %991, !dbg !1816
  %993 = getelementptr inbounds i8, i8* %957, i64 5, !dbg !1816
  %994 = load i8, i8* %993, align 1, !dbg !1816, !tbaa !1807
  %995 = zext i8 %994 to i64, !dbg !1816
  %996 = shl nuw nsw i64 %995, 40, !dbg !1816
  %997 = or i64 %992, %996, !dbg !1816
  %998 = getelementptr inbounds i8, i8* %957, i64 6, !dbg !1816
  %999 = load i8, i8* %998, align 1, !dbg !1816, !tbaa !1807
  %1000 = zext i8 %999 to i64, !dbg !1816
  %1001 = shl nuw nsw i64 %1000, 48, !dbg !1816
  %1002 = or i64 %997, %1001, !dbg !1816
  %1003 = getelementptr inbounds i8, i8* %957, i64 7, !dbg !1816
  %1004 = load i8, i8* %1003, align 1, !dbg !1816, !tbaa !1807
  %1005 = zext i8 %1004 to i64, !dbg !1816
  %1006 = shl nuw i64 %1005, 56, !dbg !1816
  %1007 = or i64 %1002, %1006, !dbg !1816
  %1008 = add nsw i32 %965, -8, !dbg !1816
  %1009 = getelementptr inbounds i8, i8* %957, i64 8, !dbg !1816
  br label %1023, !dbg !1816

1010:                                             ; preds = %968, %1010
  %1011 = phi i32 [ %1021, %1010 ], [ 0, %968 ], !dbg !1816
  %1012 = phi i64 [ %1020, %1010 ], [ 0, %968 ], !dbg !1816
  %1013 = zext i32 %1011 to i64, !dbg !1816
  %1014 = getelementptr inbounds i8, i8* %957, i64 %1013, !dbg !1816
  %1015 = load i8, i8* %1014, align 1, !dbg !1816, !tbaa !1807
  %1016 = zext i8 %1015 to i64, !dbg !1816
  %1017 = shl i32 %1011, 3, !dbg !1816
  %1018 = zext i32 %1017 to i64, !dbg !1816
  %1019 = shl nuw i64 %1016, %1018, !dbg !1816
  %1020 = or i64 %1019, %1012, !dbg !1816
  %1021 = add nuw nsw i32 %1011, 1, !dbg !1816
  %1022 = icmp eq i32 %1021, %965, !dbg !1816
  br i1 %1022, label %1023, label %1010, !dbg !1816

1023:                                             ; preds = %1010, %970, %968
  %1024 = phi i8* [ %1009, %970 ], [ %957, %968 ], [ %957, %1010 ], !dbg !1816
  %1025 = phi i32 [ %1008, %970 ], [ 0, %968 ], [ 0, %1010 ], !dbg !1816
  %1026 = phi i64 [ %1007, %970 ], [ 0, %968 ], [ %1020, %1010 ], !dbg !1816
  %1027 = icmp ugt i32 %1025, 7, !dbg !1816
  br i1 %1027, label %1030, label %1028, !dbg !1816

1028:                                             ; preds = %1023
  %1029 = icmp eq i32 %1025, 0, !dbg !1816
  br i1 %1029, label %1083, label %1070, !dbg !1816

1030:                                             ; preds = %1023
  %1031 = load i8, i8* %1024, align 1, !dbg !1816, !tbaa !1807
  %1032 = zext i8 %1031 to i64, !dbg !1816
  %1033 = getelementptr inbounds i8, i8* %1024, i64 1, !dbg !1816
  %1034 = load i8, i8* %1033, align 1, !dbg !1816, !tbaa !1807
  %1035 = zext i8 %1034 to i64, !dbg !1816
  %1036 = shl nuw nsw i64 %1035, 8, !dbg !1816
  %1037 = or i64 %1036, %1032, !dbg !1816
  %1038 = getelementptr inbounds i8, i8* %1024, i64 2, !dbg !1816
  %1039 = load i8, i8* %1038, align 1, !dbg !1816, !tbaa !1807
  %1040 = zext i8 %1039 to i64, !dbg !1816
  %1041 = shl nuw nsw i64 %1040, 16, !dbg !1816
  %1042 = or i64 %1037, %1041, !dbg !1816
  %1043 = getelementptr inbounds i8, i8* %1024, i64 3, !dbg !1816
  %1044 = load i8, i8* %1043, align 1, !dbg !1816, !tbaa !1807
  %1045 = zext i8 %1044 to i64, !dbg !1816
  %1046 = shl nuw nsw i64 %1045, 24, !dbg !1816
  %1047 = or i64 %1042, %1046, !dbg !1816
  %1048 = getelementptr inbounds i8, i8* %1024, i64 4, !dbg !1816
  %1049 = load i8, i8* %1048, align 1, !dbg !1816, !tbaa !1807
  %1050 = zext i8 %1049 to i64, !dbg !1816
  %1051 = shl nuw nsw i64 %1050, 32, !dbg !1816
  %1052 = or i64 %1047, %1051, !dbg !1816
  %1053 = getelementptr inbounds i8, i8* %1024, i64 5, !dbg !1816
  %1054 = load i8, i8* %1053, align 1, !dbg !1816, !tbaa !1807
  %1055 = zext i8 %1054 to i64, !dbg !1816
  %1056 = shl nuw nsw i64 %1055, 40, !dbg !1816
  %1057 = or i64 %1052, %1056, !dbg !1816
  %1058 = getelementptr inbounds i8, i8* %1024, i64 6, !dbg !1816
  %1059 = load i8, i8* %1058, align 1, !dbg !1816, !tbaa !1807
  %1060 = zext i8 %1059 to i64, !dbg !1816
  %1061 = shl nuw nsw i64 %1060, 48, !dbg !1816
  %1062 = or i64 %1057, %1061, !dbg !1816
  %1063 = getelementptr inbounds i8, i8* %1024, i64 7, !dbg !1816
  %1064 = load i8, i8* %1063, align 1, !dbg !1816, !tbaa !1807
  %1065 = zext i8 %1064 to i64, !dbg !1816
  %1066 = shl nuw i64 %1065, 56, !dbg !1816
  %1067 = or i64 %1062, %1066, !dbg !1816
  %1068 = add nsw i32 %1025, -8, !dbg !1816
  %1069 = getelementptr inbounds i8, i8* %1024, i64 8, !dbg !1816
  br label %1083, !dbg !1816

1070:                                             ; preds = %1028, %1070
  %1071 = phi i32 [ %1081, %1070 ], [ 0, %1028 ], !dbg !1816
  %1072 = phi i64 [ %1080, %1070 ], [ 0, %1028 ], !dbg !1816
  %1073 = zext i32 %1071 to i64, !dbg !1816
  %1074 = getelementptr inbounds i8, i8* %1024, i64 %1073, !dbg !1816
  %1075 = load i8, i8* %1074, align 1, !dbg !1816, !tbaa !1807
  %1076 = zext i8 %1075 to i64, !dbg !1816
  %1077 = shl i32 %1071, 3, !dbg !1816
  %1078 = zext i32 %1077 to i64, !dbg !1816
  %1079 = shl nuw i64 %1076, %1078, !dbg !1816
  %1080 = or i64 %1079, %1072, !dbg !1816
  %1081 = add nuw nsw i32 %1071, 1, !dbg !1816
  %1082 = icmp eq i32 %1081, %1025, !dbg !1816
  br i1 %1082, label %1083, label %1070, !dbg !1816

1083:                                             ; preds = %1070, %1030, %1028
  %1084 = phi i8* [ %1069, %1030 ], [ %1024, %1028 ], [ %1024, %1070 ], !dbg !1816
  %1085 = phi i32 [ %1068, %1030 ], [ 0, %1028 ], [ 0, %1070 ], !dbg !1816
  %1086 = phi i64 [ %1067, %1030 ], [ 0, %1028 ], [ %1080, %1070 ], !dbg !1816
  %1087 = icmp ugt i32 %1085, 7, !dbg !1816
  br i1 %1087, label %1090, label %1088, !dbg !1816

1088:                                             ; preds = %1083
  %1089 = icmp eq i32 %1085, 0, !dbg !1816
  br i1 %1089, label %1143, label %1130, !dbg !1816

1090:                                             ; preds = %1083
  %1091 = load i8, i8* %1084, align 1, !dbg !1816, !tbaa !1807
  %1092 = zext i8 %1091 to i64, !dbg !1816
  %1093 = getelementptr inbounds i8, i8* %1084, i64 1, !dbg !1816
  %1094 = load i8, i8* %1093, align 1, !dbg !1816, !tbaa !1807
  %1095 = zext i8 %1094 to i64, !dbg !1816
  %1096 = shl nuw nsw i64 %1095, 8, !dbg !1816
  %1097 = or i64 %1096, %1092, !dbg !1816
  %1098 = getelementptr inbounds i8, i8* %1084, i64 2, !dbg !1816
  %1099 = load i8, i8* %1098, align 1, !dbg !1816, !tbaa !1807
  %1100 = zext i8 %1099 to i64, !dbg !1816
  %1101 = shl nuw nsw i64 %1100, 16, !dbg !1816
  %1102 = or i64 %1097, %1101, !dbg !1816
  %1103 = getelementptr inbounds i8, i8* %1084, i64 3, !dbg !1816
  %1104 = load i8, i8* %1103, align 1, !dbg !1816, !tbaa !1807
  %1105 = zext i8 %1104 to i64, !dbg !1816
  %1106 = shl nuw nsw i64 %1105, 24, !dbg !1816
  %1107 = or i64 %1102, %1106, !dbg !1816
  %1108 = getelementptr inbounds i8, i8* %1084, i64 4, !dbg !1816
  %1109 = load i8, i8* %1108, align 1, !dbg !1816, !tbaa !1807
  %1110 = zext i8 %1109 to i64, !dbg !1816
  %1111 = shl nuw nsw i64 %1110, 32, !dbg !1816
  %1112 = or i64 %1107, %1111, !dbg !1816
  %1113 = getelementptr inbounds i8, i8* %1084, i64 5, !dbg !1816
  %1114 = load i8, i8* %1113, align 1, !dbg !1816, !tbaa !1807
  %1115 = zext i8 %1114 to i64, !dbg !1816
  %1116 = shl nuw nsw i64 %1115, 40, !dbg !1816
  %1117 = or i64 %1112, %1116, !dbg !1816
  %1118 = getelementptr inbounds i8, i8* %1084, i64 6, !dbg !1816
  %1119 = load i8, i8* %1118, align 1, !dbg !1816, !tbaa !1807
  %1120 = zext i8 %1119 to i64, !dbg !1816
  %1121 = shl nuw nsw i64 %1120, 48, !dbg !1816
  %1122 = or i64 %1117, %1121, !dbg !1816
  %1123 = getelementptr inbounds i8, i8* %1084, i64 7, !dbg !1816
  %1124 = load i8, i8* %1123, align 1, !dbg !1816, !tbaa !1807
  %1125 = zext i8 %1124 to i64, !dbg !1816
  %1126 = shl nuw i64 %1125, 56, !dbg !1816
  %1127 = or i64 %1122, %1126, !dbg !1816
  %1128 = add nsw i32 %1085, -8, !dbg !1816
  %1129 = getelementptr inbounds i8, i8* %1084, i64 8, !dbg !1816
  br label %1143, !dbg !1816

1130:                                             ; preds = %1088, %1130
  %1131 = phi i32 [ %1141, %1130 ], [ 0, %1088 ], !dbg !1816
  %1132 = phi i64 [ %1140, %1130 ], [ 0, %1088 ], !dbg !1816
  %1133 = zext i32 %1131 to i64, !dbg !1816
  %1134 = getelementptr inbounds i8, i8* %1084, i64 %1133, !dbg !1816
  %1135 = load i8, i8* %1134, align 1, !dbg !1816, !tbaa !1807
  %1136 = zext i8 %1135 to i64, !dbg !1816
  %1137 = shl i32 %1131, 3, !dbg !1816
  %1138 = zext i32 %1137 to i64, !dbg !1816
  %1139 = shl nuw i64 %1136, %1138, !dbg !1816
  %1140 = or i64 %1139, %1132, !dbg !1816
  %1141 = add nuw nsw i32 %1131, 1, !dbg !1816
  %1142 = icmp eq i32 %1141, %1085, !dbg !1816
  br i1 %1142, label %1143, label %1130, !dbg !1816

1143:                                             ; preds = %1130, %1090, %1088
  %1144 = phi i8* [ %1129, %1090 ], [ %1084, %1088 ], [ %1084, %1130 ], !dbg !1816
  %1145 = phi i32 [ %1128, %1090 ], [ 0, %1088 ], [ 0, %1130 ], !dbg !1816
  %1146 = phi i64 [ %1127, %1090 ], [ 0, %1088 ], [ %1140, %1130 ], !dbg !1816
  %1147 = icmp ugt i32 %1145, 7, !dbg !1816
  br i1 %1147, label %1150, label %1148, !dbg !1816

1148:                                             ; preds = %1143
  %1149 = icmp eq i32 %1145, 0, !dbg !1816
  br i1 %1149, label %1203, label %1190, !dbg !1816

1150:                                             ; preds = %1143
  %1151 = load i8, i8* %1144, align 1, !dbg !1816, !tbaa !1807
  %1152 = zext i8 %1151 to i64, !dbg !1816
  %1153 = getelementptr inbounds i8, i8* %1144, i64 1, !dbg !1816
  %1154 = load i8, i8* %1153, align 1, !dbg !1816, !tbaa !1807
  %1155 = zext i8 %1154 to i64, !dbg !1816
  %1156 = shl nuw nsw i64 %1155, 8, !dbg !1816
  %1157 = or i64 %1156, %1152, !dbg !1816
  %1158 = getelementptr inbounds i8, i8* %1144, i64 2, !dbg !1816
  %1159 = load i8, i8* %1158, align 1, !dbg !1816, !tbaa !1807
  %1160 = zext i8 %1159 to i64, !dbg !1816
  %1161 = shl nuw nsw i64 %1160, 16, !dbg !1816
  %1162 = or i64 %1157, %1161, !dbg !1816
  %1163 = getelementptr inbounds i8, i8* %1144, i64 3, !dbg !1816
  %1164 = load i8, i8* %1163, align 1, !dbg !1816, !tbaa !1807
  %1165 = zext i8 %1164 to i64, !dbg !1816
  %1166 = shl nuw nsw i64 %1165, 24, !dbg !1816
  %1167 = or i64 %1162, %1166, !dbg !1816
  %1168 = getelementptr inbounds i8, i8* %1144, i64 4, !dbg !1816
  %1169 = load i8, i8* %1168, align 1, !dbg !1816, !tbaa !1807
  %1170 = zext i8 %1169 to i64, !dbg !1816
  %1171 = shl nuw nsw i64 %1170, 32, !dbg !1816
  %1172 = or i64 %1167, %1171, !dbg !1816
  %1173 = getelementptr inbounds i8, i8* %1144, i64 5, !dbg !1816
  %1174 = load i8, i8* %1173, align 1, !dbg !1816, !tbaa !1807
  %1175 = zext i8 %1174 to i64, !dbg !1816
  %1176 = shl nuw nsw i64 %1175, 40, !dbg !1816
  %1177 = or i64 %1172, %1176, !dbg !1816
  %1178 = getelementptr inbounds i8, i8* %1144, i64 6, !dbg !1816
  %1179 = load i8, i8* %1178, align 1, !dbg !1816, !tbaa !1807
  %1180 = zext i8 %1179 to i64, !dbg !1816
  %1181 = shl nuw nsw i64 %1180, 48, !dbg !1816
  %1182 = or i64 %1177, %1181, !dbg !1816
  %1183 = getelementptr inbounds i8, i8* %1144, i64 7, !dbg !1816
  %1184 = load i8, i8* %1183, align 1, !dbg !1816, !tbaa !1807
  %1185 = zext i8 %1184 to i64, !dbg !1816
  %1186 = shl nuw i64 %1185, 56, !dbg !1816
  %1187 = or i64 %1182, %1186, !dbg !1816
  %1188 = add nsw i32 %1145, -8, !dbg !1816
  %1189 = getelementptr inbounds i8, i8* %1144, i64 8, !dbg !1816
  br label %1203, !dbg !1816

1190:                                             ; preds = %1148, %1190
  %1191 = phi i32 [ %1201, %1190 ], [ 0, %1148 ], !dbg !1816
  %1192 = phi i64 [ %1200, %1190 ], [ 0, %1148 ], !dbg !1816
  %1193 = zext i32 %1191 to i64, !dbg !1816
  %1194 = getelementptr inbounds i8, i8* %1144, i64 %1193, !dbg !1816
  %1195 = load i8, i8* %1194, align 1, !dbg !1816, !tbaa !1807
  %1196 = zext i8 %1195 to i64, !dbg !1816
  %1197 = shl i32 %1191, 3, !dbg !1816
  %1198 = zext i32 %1197 to i64, !dbg !1816
  %1199 = shl nuw i64 %1196, %1198, !dbg !1816
  %1200 = or i64 %1199, %1192, !dbg !1816
  %1201 = add nuw nsw i32 %1191, 1, !dbg !1816
  %1202 = icmp eq i32 %1201, %1145, !dbg !1816
  br i1 %1202, label %1203, label %1190, !dbg !1816

1203:                                             ; preds = %1190, %1150, %1148
  %1204 = phi i8* [ %1189, %1150 ], [ %1144, %1148 ], [ %1144, %1190 ], !dbg !1816
  %1205 = phi i32 [ %1188, %1150 ], [ 0, %1148 ], [ 0, %1190 ], !dbg !1816
  %1206 = phi i64 [ %1187, %1150 ], [ 0, %1148 ], [ %1200, %1190 ], !dbg !1816
  %1207 = icmp ugt i32 %1205, 7, !dbg !1816
  br i1 %1207, label %1210, label %1208, !dbg !1816

1208:                                             ; preds = %1203
  %1209 = icmp eq i32 %1205, 0, !dbg !1816
  br i1 %1209, label %1263, label %1250, !dbg !1816

1210:                                             ; preds = %1203
  %1211 = load i8, i8* %1204, align 1, !dbg !1816, !tbaa !1807
  %1212 = zext i8 %1211 to i64, !dbg !1816
  %1213 = getelementptr inbounds i8, i8* %1204, i64 1, !dbg !1816
  %1214 = load i8, i8* %1213, align 1, !dbg !1816, !tbaa !1807
  %1215 = zext i8 %1214 to i64, !dbg !1816
  %1216 = shl nuw nsw i64 %1215, 8, !dbg !1816
  %1217 = or i64 %1216, %1212, !dbg !1816
  %1218 = getelementptr inbounds i8, i8* %1204, i64 2, !dbg !1816
  %1219 = load i8, i8* %1218, align 1, !dbg !1816, !tbaa !1807
  %1220 = zext i8 %1219 to i64, !dbg !1816
  %1221 = shl nuw nsw i64 %1220, 16, !dbg !1816
  %1222 = or i64 %1217, %1221, !dbg !1816
  %1223 = getelementptr inbounds i8, i8* %1204, i64 3, !dbg !1816
  %1224 = load i8, i8* %1223, align 1, !dbg !1816, !tbaa !1807
  %1225 = zext i8 %1224 to i64, !dbg !1816
  %1226 = shl nuw nsw i64 %1225, 24, !dbg !1816
  %1227 = or i64 %1222, %1226, !dbg !1816
  %1228 = getelementptr inbounds i8, i8* %1204, i64 4, !dbg !1816
  %1229 = load i8, i8* %1228, align 1, !dbg !1816, !tbaa !1807
  %1230 = zext i8 %1229 to i64, !dbg !1816
  %1231 = shl nuw nsw i64 %1230, 32, !dbg !1816
  %1232 = or i64 %1227, %1231, !dbg !1816
  %1233 = getelementptr inbounds i8, i8* %1204, i64 5, !dbg !1816
  %1234 = load i8, i8* %1233, align 1, !dbg !1816, !tbaa !1807
  %1235 = zext i8 %1234 to i64, !dbg !1816
  %1236 = shl nuw nsw i64 %1235, 40, !dbg !1816
  %1237 = or i64 %1232, %1236, !dbg !1816
  %1238 = getelementptr inbounds i8, i8* %1204, i64 6, !dbg !1816
  %1239 = load i8, i8* %1238, align 1, !dbg !1816, !tbaa !1807
  %1240 = zext i8 %1239 to i64, !dbg !1816
  %1241 = shl nuw nsw i64 %1240, 48, !dbg !1816
  %1242 = or i64 %1237, %1241, !dbg !1816
  %1243 = getelementptr inbounds i8, i8* %1204, i64 7, !dbg !1816
  %1244 = load i8, i8* %1243, align 1, !dbg !1816, !tbaa !1807
  %1245 = zext i8 %1244 to i64, !dbg !1816
  %1246 = shl nuw i64 %1245, 56, !dbg !1816
  %1247 = or i64 %1242, %1246, !dbg !1816
  %1248 = add nsw i32 %1205, -8, !dbg !1816
  %1249 = getelementptr inbounds i8, i8* %1204, i64 8, !dbg !1816
  br label %1263, !dbg !1816

1250:                                             ; preds = %1208, %1250
  %1251 = phi i32 [ %1261, %1250 ], [ 0, %1208 ], !dbg !1816
  %1252 = phi i64 [ %1260, %1250 ], [ 0, %1208 ], !dbg !1816
  %1253 = zext i32 %1251 to i64, !dbg !1816
  %1254 = getelementptr inbounds i8, i8* %1204, i64 %1253, !dbg !1816
  %1255 = load i8, i8* %1254, align 1, !dbg !1816, !tbaa !1807
  %1256 = zext i8 %1255 to i64, !dbg !1816
  %1257 = shl i32 %1251, 3, !dbg !1816
  %1258 = zext i32 %1257 to i64, !dbg !1816
  %1259 = shl nuw i64 %1256, %1258, !dbg !1816
  %1260 = or i64 %1259, %1252, !dbg !1816
  %1261 = add nuw nsw i32 %1251, 1, !dbg !1816
  %1262 = icmp eq i32 %1261, %1205, !dbg !1816
  br i1 %1262, label %1263, label %1250, !dbg !1816

1263:                                             ; preds = %1250, %1210, %1208
  %1264 = phi i8* [ %1249, %1210 ], [ %1204, %1208 ], [ %1204, %1250 ], !dbg !1816
  %1265 = phi i32 [ %1248, %1210 ], [ 0, %1208 ], [ 0, %1250 ], !dbg !1816
  %1266 = phi i64 [ %1247, %1210 ], [ 0, %1208 ], [ %1260, %1250 ], !dbg !1816
  %1267 = icmp ugt i32 %1265, 7, !dbg !1816
  br i1 %1267, label %1270, label %1268, !dbg !1816

1268:                                             ; preds = %1263
  %1269 = icmp eq i32 %1265, 0, !dbg !1816
  br i1 %1269, label %1323, label %1310, !dbg !1816

1270:                                             ; preds = %1263
  %1271 = load i8, i8* %1264, align 1, !dbg !1816, !tbaa !1807
  %1272 = zext i8 %1271 to i64, !dbg !1816
  %1273 = getelementptr inbounds i8, i8* %1264, i64 1, !dbg !1816
  %1274 = load i8, i8* %1273, align 1, !dbg !1816, !tbaa !1807
  %1275 = zext i8 %1274 to i64, !dbg !1816
  %1276 = shl nuw nsw i64 %1275, 8, !dbg !1816
  %1277 = or i64 %1276, %1272, !dbg !1816
  %1278 = getelementptr inbounds i8, i8* %1264, i64 2, !dbg !1816
  %1279 = load i8, i8* %1278, align 1, !dbg !1816, !tbaa !1807
  %1280 = zext i8 %1279 to i64, !dbg !1816
  %1281 = shl nuw nsw i64 %1280, 16, !dbg !1816
  %1282 = or i64 %1277, %1281, !dbg !1816
  %1283 = getelementptr inbounds i8, i8* %1264, i64 3, !dbg !1816
  %1284 = load i8, i8* %1283, align 1, !dbg !1816, !tbaa !1807
  %1285 = zext i8 %1284 to i64, !dbg !1816
  %1286 = shl nuw nsw i64 %1285, 24, !dbg !1816
  %1287 = or i64 %1282, %1286, !dbg !1816
  %1288 = getelementptr inbounds i8, i8* %1264, i64 4, !dbg !1816
  %1289 = load i8, i8* %1288, align 1, !dbg !1816, !tbaa !1807
  %1290 = zext i8 %1289 to i64, !dbg !1816
  %1291 = shl nuw nsw i64 %1290, 32, !dbg !1816
  %1292 = or i64 %1287, %1291, !dbg !1816
  %1293 = getelementptr inbounds i8, i8* %1264, i64 5, !dbg !1816
  %1294 = load i8, i8* %1293, align 1, !dbg !1816, !tbaa !1807
  %1295 = zext i8 %1294 to i64, !dbg !1816
  %1296 = shl nuw nsw i64 %1295, 40, !dbg !1816
  %1297 = or i64 %1292, %1296, !dbg !1816
  %1298 = getelementptr inbounds i8, i8* %1264, i64 6, !dbg !1816
  %1299 = load i8, i8* %1298, align 1, !dbg !1816, !tbaa !1807
  %1300 = zext i8 %1299 to i64, !dbg !1816
  %1301 = shl nuw nsw i64 %1300, 48, !dbg !1816
  %1302 = or i64 %1297, %1301, !dbg !1816
  %1303 = getelementptr inbounds i8, i8* %1264, i64 7, !dbg !1816
  %1304 = load i8, i8* %1303, align 1, !dbg !1816, !tbaa !1807
  %1305 = zext i8 %1304 to i64, !dbg !1816
  %1306 = shl nuw i64 %1305, 56, !dbg !1816
  %1307 = or i64 %1302, %1306, !dbg !1816
  %1308 = add nsw i32 %1265, -8, !dbg !1816
  %1309 = getelementptr inbounds i8, i8* %1264, i64 8, !dbg !1816
  br label %1323, !dbg !1816

1310:                                             ; preds = %1268, %1310
  %1311 = phi i32 [ %1321, %1310 ], [ 0, %1268 ], !dbg !1816
  %1312 = phi i64 [ %1320, %1310 ], [ 0, %1268 ], !dbg !1816
  %1313 = zext i32 %1311 to i64, !dbg !1816
  %1314 = getelementptr inbounds i8, i8* %1264, i64 %1313, !dbg !1816
  %1315 = load i8, i8* %1314, align 1, !dbg !1816, !tbaa !1807
  %1316 = zext i8 %1315 to i64, !dbg !1816
  %1317 = shl i32 %1311, 3, !dbg !1816
  %1318 = zext i32 %1317 to i64, !dbg !1816
  %1319 = shl nuw i64 %1316, %1318, !dbg !1816
  %1320 = or i64 %1319, %1312, !dbg !1816
  %1321 = add nuw nsw i32 %1311, 1, !dbg !1816
  %1322 = icmp eq i32 %1321, %1265, !dbg !1816
  br i1 %1322, label %1323, label %1310, !dbg !1816

1323:                                             ; preds = %1310, %1270, %1268
  %1324 = phi i8* [ %1309, %1270 ], [ %1264, %1268 ], [ %1264, %1310 ], !dbg !1816
  %1325 = phi i32 [ %1308, %1270 ], [ 0, %1268 ], [ 0, %1310 ], !dbg !1816
  %1326 = phi i64 [ %1307, %1270 ], [ 0, %1268 ], [ %1320, %1310 ], !dbg !1816
  %1327 = icmp ugt i32 %1325, 7, !dbg !1816
  br i1 %1327, label %1330, label %1328, !dbg !1816

1328:                                             ; preds = %1323
  %1329 = icmp eq i32 %1325, 0, !dbg !1816
  br i1 %1329, label %1381, label %1368, !dbg !1816

1330:                                             ; preds = %1323
  %1331 = load i8, i8* %1324, align 1, !dbg !1816, !tbaa !1807
  %1332 = zext i8 %1331 to i64, !dbg !1816
  %1333 = getelementptr inbounds i8, i8* %1324, i64 1, !dbg !1816
  %1334 = load i8, i8* %1333, align 1, !dbg !1816, !tbaa !1807
  %1335 = zext i8 %1334 to i64, !dbg !1816
  %1336 = shl nuw nsw i64 %1335, 8, !dbg !1816
  %1337 = or i64 %1336, %1332, !dbg !1816
  %1338 = getelementptr inbounds i8, i8* %1324, i64 2, !dbg !1816
  %1339 = load i8, i8* %1338, align 1, !dbg !1816, !tbaa !1807
  %1340 = zext i8 %1339 to i64, !dbg !1816
  %1341 = shl nuw nsw i64 %1340, 16, !dbg !1816
  %1342 = or i64 %1337, %1341, !dbg !1816
  %1343 = getelementptr inbounds i8, i8* %1324, i64 3, !dbg !1816
  %1344 = load i8, i8* %1343, align 1, !dbg !1816, !tbaa !1807
  %1345 = zext i8 %1344 to i64, !dbg !1816
  %1346 = shl nuw nsw i64 %1345, 24, !dbg !1816
  %1347 = or i64 %1342, %1346, !dbg !1816
  %1348 = getelementptr inbounds i8, i8* %1324, i64 4, !dbg !1816
  %1349 = load i8, i8* %1348, align 1, !dbg !1816, !tbaa !1807
  %1350 = zext i8 %1349 to i64, !dbg !1816
  %1351 = shl nuw nsw i64 %1350, 32, !dbg !1816
  %1352 = or i64 %1347, %1351, !dbg !1816
  %1353 = getelementptr inbounds i8, i8* %1324, i64 5, !dbg !1816
  %1354 = load i8, i8* %1353, align 1, !dbg !1816, !tbaa !1807
  %1355 = zext i8 %1354 to i64, !dbg !1816
  %1356 = shl nuw nsw i64 %1355, 40, !dbg !1816
  %1357 = or i64 %1352, %1356, !dbg !1816
  %1358 = getelementptr inbounds i8, i8* %1324, i64 6, !dbg !1816
  %1359 = load i8, i8* %1358, align 1, !dbg !1816, !tbaa !1807
  %1360 = zext i8 %1359 to i64, !dbg !1816
  %1361 = shl nuw nsw i64 %1360, 48, !dbg !1816
  %1362 = or i64 %1357, %1361, !dbg !1816
  %1363 = getelementptr inbounds i8, i8* %1324, i64 7, !dbg !1816
  %1364 = load i8, i8* %1363, align 1, !dbg !1816, !tbaa !1807
  %1365 = zext i8 %1364 to i64, !dbg !1816
  %1366 = shl nuw i64 %1365, 56, !dbg !1816
  %1367 = or i64 %1362, %1366, !dbg !1816
  br label %1381, !dbg !1816

1368:                                             ; preds = %1328, %1368
  %1369 = phi i32 [ %1379, %1368 ], [ 0, %1328 ], !dbg !1816
  %1370 = phi i64 [ %1378, %1368 ], [ 0, %1328 ], !dbg !1816
  %1371 = zext i32 %1369 to i64, !dbg !1816
  %1372 = getelementptr inbounds i8, i8* %1324, i64 %1371, !dbg !1816
  %1373 = load i8, i8* %1372, align 1, !dbg !1816, !tbaa !1807
  %1374 = zext i8 %1373 to i64, !dbg !1816
  %1375 = shl i32 %1369, 3, !dbg !1816
  %1376 = zext i32 %1375 to i64, !dbg !1816
  %1377 = shl nuw i64 %1374, %1376, !dbg !1816
  %1378 = or i64 %1377, %1370, !dbg !1816
  %1379 = add nuw nsw i32 %1369, 1, !dbg !1816
  %1380 = icmp eq i32 %1379, %1325, !dbg !1816
  br i1 %1380, label %1381, label %1368, !dbg !1816

1381:                                             ; preds = %1368, %1330, %1328
  %1382 = phi i64 [ %1367, %1330 ], [ 0, %1328 ], [ %1378, %1368 ], !dbg !1816
  %1383 = shl nuw nsw i64 %964, 2, !dbg !1816
  %1384 = add nuw nsw i64 %1383, 28, !dbg !1816
  %1385 = and i64 %1384, 480, !dbg !1816
  %1386 = and i64 %966, -225, !dbg !1816
  %1387 = or i64 %1386, %1385, !dbg !1816
  %1388 = call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1387, i64 noundef %1026, i64 noundef %1086, i64 noundef %1146, i64 noundef %1206, i64 noundef %1266, i64 noundef %1326, i64 noundef %1382) #16, !dbg !1816
  %1389 = sub i64 %956, %964, !dbg !1816
  %1390 = getelementptr inbounds i8, i8* %957, i64 %964, !dbg !1816
  %1391 = icmp eq i64 %1389, 0, !dbg !1816
  br i1 %1391, label %1392, label %955, !dbg !1816

1392:                                             ; preds = %1381, %942
  %1393 = phi <2 x i64> [ %945, %942 ], [ %1388, %1381 ], !dbg !1816
  br label %1394, !dbg !1818

1394:                                             ; preds = %1394, %1392
  %1395 = phi i8* [ %0, %1392 ], [ %1396, %1394 ], !dbg !1818
  %1396 = getelementptr inbounds i8, i8* %1395, i64 1, !dbg !1818
  %1397 = load i8, i8* %1395, align 1, !dbg !1818, !tbaa !1800
  %1398 = icmp eq i8 %1397, 0, !dbg !1818
  br i1 %1398, label %1399, label %1394, !dbg !1818, !llvm.loop !1819

1399:                                             ; preds = %1394
  %1400 = extractelement <2 x i64> %1393, i64 0, !dbg !1816
  %1401 = icmp eq i8* %0, null, !dbg !1820
  br i1 %1401, label %1402, label %1406, !dbg !1820

1402:                                             ; preds = %1399
  %1403 = and i64 %1400, -227, !dbg !1820
  %1404 = or i64 %1403, 34, !dbg !1820
  %1405 = call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1404, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #16, !dbg !1820
  br label %1851, !dbg !1820

1406:                                             ; preds = %1399
  %1407 = ptrtoint i8* %1396 to i64, !dbg !1818
  %1408 = ptrtoint i8* %0 to i64, !dbg !1818
  %1409 = sub i64 %1407, %1408, !dbg !1818
  %1410 = shl i64 %1409, 32, !dbg !1821
  %1411 = ashr exact i64 %1410, 32, !dbg !1821
  %1412 = and i64 %1400, -3, !dbg !1820
  %1413 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1412, i64 0, !dbg !1820
  br label %1414, !dbg !1820

1414:                                             ; preds = %1840, %1406
  %1415 = phi i64 [ %1411, %1406 ], [ %1848, %1840 ], !dbg !1820
  %1416 = phi i8* [ %0, %1406 ], [ %1849, %1840 ], !dbg !1820
  %1417 = phi <2 x i64> [ %1413, %1406 ], [ %1847, %1840 ], !dbg !1820
  %1418 = icmp ugt i64 %1415, 56, !dbg !1820
  %1419 = extractelement <2 x i64> %1417, i64 0, !dbg !1820
  %1420 = or i64 %1419, 2, !dbg !1820
  %1421 = insertelement <2 x i64> poison, i64 %1420, i64 0, !dbg !1820
  %1422 = select i1 %1418, <2 x i64> %1417, <2 x i64> %1421, !dbg !1820
  %1423 = call i64 @llvm.umin.i64(i64 %1415, i64 56), !dbg !1820
  %1424 = trunc i64 %1423 to i32, !dbg !1820
  %1425 = extractelement <2 x i64> %1422, i64 0, !dbg !1820
  %1426 = icmp ugt i32 %1424, 7, !dbg !1820
  br i1 %1426, label %1429, label %1427, !dbg !1820

1427:                                             ; preds = %1414
  %1428 = icmp eq i32 %1424, 0, !dbg !1820
  br i1 %1428, label %1482, label %1469, !dbg !1820

1429:                                             ; preds = %1414
  %1430 = load i8, i8* %1416, align 1, !dbg !1820, !tbaa !1807
  %1431 = zext i8 %1430 to i64, !dbg !1820
  %1432 = getelementptr inbounds i8, i8* %1416, i64 1, !dbg !1820
  %1433 = load i8, i8* %1432, align 1, !dbg !1820, !tbaa !1807
  %1434 = zext i8 %1433 to i64, !dbg !1820
  %1435 = shl nuw nsw i64 %1434, 8, !dbg !1820
  %1436 = or i64 %1435, %1431, !dbg !1820
  %1437 = getelementptr inbounds i8, i8* %1416, i64 2, !dbg !1820
  %1438 = load i8, i8* %1437, align 1, !dbg !1820, !tbaa !1807
  %1439 = zext i8 %1438 to i64, !dbg !1820
  %1440 = shl nuw nsw i64 %1439, 16, !dbg !1820
  %1441 = or i64 %1436, %1440, !dbg !1820
  %1442 = getelementptr inbounds i8, i8* %1416, i64 3, !dbg !1820
  %1443 = load i8, i8* %1442, align 1, !dbg !1820, !tbaa !1807
  %1444 = zext i8 %1443 to i64, !dbg !1820
  %1445 = shl nuw nsw i64 %1444, 24, !dbg !1820
  %1446 = or i64 %1441, %1445, !dbg !1820
  %1447 = getelementptr inbounds i8, i8* %1416, i64 4, !dbg !1820
  %1448 = load i8, i8* %1447, align 1, !dbg !1820, !tbaa !1807
  %1449 = zext i8 %1448 to i64, !dbg !1820
  %1450 = shl nuw nsw i64 %1449, 32, !dbg !1820
  %1451 = or i64 %1446, %1450, !dbg !1820
  %1452 = getelementptr inbounds i8, i8* %1416, i64 5, !dbg !1820
  %1453 = load i8, i8* %1452, align 1, !dbg !1820, !tbaa !1807
  %1454 = zext i8 %1453 to i64, !dbg !1820
  %1455 = shl nuw nsw i64 %1454, 40, !dbg !1820
  %1456 = or i64 %1451, %1455, !dbg !1820
  %1457 = getelementptr inbounds i8, i8* %1416, i64 6, !dbg !1820
  %1458 = load i8, i8* %1457, align 1, !dbg !1820, !tbaa !1807
  %1459 = zext i8 %1458 to i64, !dbg !1820
  %1460 = shl nuw nsw i64 %1459, 48, !dbg !1820
  %1461 = or i64 %1456, %1460, !dbg !1820
  %1462 = getelementptr inbounds i8, i8* %1416, i64 7, !dbg !1820
  %1463 = load i8, i8* %1462, align 1, !dbg !1820, !tbaa !1807
  %1464 = zext i8 %1463 to i64, !dbg !1820
  %1465 = shl nuw i64 %1464, 56, !dbg !1820
  %1466 = or i64 %1461, %1465, !dbg !1820
  %1467 = add nsw i32 %1424, -8, !dbg !1820
  %1468 = getelementptr inbounds i8, i8* %1416, i64 8, !dbg !1820
  br label %1482, !dbg !1820

1469:                                             ; preds = %1427, %1469
  %1470 = phi i32 [ %1480, %1469 ], [ 0, %1427 ], !dbg !1820
  %1471 = phi i64 [ %1479, %1469 ], [ 0, %1427 ], !dbg !1820
  %1472 = zext i32 %1470 to i64, !dbg !1820
  %1473 = getelementptr inbounds i8, i8* %1416, i64 %1472, !dbg !1820
  %1474 = load i8, i8* %1473, align 1, !dbg !1820, !tbaa !1807
  %1475 = zext i8 %1474 to i64, !dbg !1820
  %1476 = shl i32 %1470, 3, !dbg !1820
  %1477 = zext i32 %1476 to i64, !dbg !1820
  %1478 = shl nuw i64 %1475, %1477, !dbg !1820
  %1479 = or i64 %1478, %1471, !dbg !1820
  %1480 = add nuw nsw i32 %1470, 1, !dbg !1820
  %1481 = icmp eq i32 %1480, %1424, !dbg !1820
  br i1 %1481, label %1482, label %1469, !dbg !1820

1482:                                             ; preds = %1469, %1429, %1427
  %1483 = phi i8* [ %1468, %1429 ], [ %1416, %1427 ], [ %1416, %1469 ], !dbg !1820
  %1484 = phi i32 [ %1467, %1429 ], [ 0, %1427 ], [ 0, %1469 ], !dbg !1820
  %1485 = phi i64 [ %1466, %1429 ], [ 0, %1427 ], [ %1479, %1469 ], !dbg !1820
  %1486 = icmp ugt i32 %1484, 7, !dbg !1820
  br i1 %1486, label %1489, label %1487, !dbg !1820

1487:                                             ; preds = %1482
  %1488 = icmp eq i32 %1484, 0, !dbg !1820
  br i1 %1488, label %1542, label %1529, !dbg !1820

1489:                                             ; preds = %1482
  %1490 = load i8, i8* %1483, align 1, !dbg !1820, !tbaa !1807
  %1491 = zext i8 %1490 to i64, !dbg !1820
  %1492 = getelementptr inbounds i8, i8* %1483, i64 1, !dbg !1820
  %1493 = load i8, i8* %1492, align 1, !dbg !1820, !tbaa !1807
  %1494 = zext i8 %1493 to i64, !dbg !1820
  %1495 = shl nuw nsw i64 %1494, 8, !dbg !1820
  %1496 = or i64 %1495, %1491, !dbg !1820
  %1497 = getelementptr inbounds i8, i8* %1483, i64 2, !dbg !1820
  %1498 = load i8, i8* %1497, align 1, !dbg !1820, !tbaa !1807
  %1499 = zext i8 %1498 to i64, !dbg !1820
  %1500 = shl nuw nsw i64 %1499, 16, !dbg !1820
  %1501 = or i64 %1496, %1500, !dbg !1820
  %1502 = getelementptr inbounds i8, i8* %1483, i64 3, !dbg !1820
  %1503 = load i8, i8* %1502, align 1, !dbg !1820, !tbaa !1807
  %1504 = zext i8 %1503 to i64, !dbg !1820
  %1505 = shl nuw nsw i64 %1504, 24, !dbg !1820
  %1506 = or i64 %1501, %1505, !dbg !1820
  %1507 = getelementptr inbounds i8, i8* %1483, i64 4, !dbg !1820
  %1508 = load i8, i8* %1507, align 1, !dbg !1820, !tbaa !1807
  %1509 = zext i8 %1508 to i64, !dbg !1820
  %1510 = shl nuw nsw i64 %1509, 32, !dbg !1820
  %1511 = or i64 %1506, %1510, !dbg !1820
  %1512 = getelementptr inbounds i8, i8* %1483, i64 5, !dbg !1820
  %1513 = load i8, i8* %1512, align 1, !dbg !1820, !tbaa !1807
  %1514 = zext i8 %1513 to i64, !dbg !1820
  %1515 = shl nuw nsw i64 %1514, 40, !dbg !1820
  %1516 = or i64 %1511, %1515, !dbg !1820
  %1517 = getelementptr inbounds i8, i8* %1483, i64 6, !dbg !1820
  %1518 = load i8, i8* %1517, align 1, !dbg !1820, !tbaa !1807
  %1519 = zext i8 %1518 to i64, !dbg !1820
  %1520 = shl nuw nsw i64 %1519, 48, !dbg !1820
  %1521 = or i64 %1516, %1520, !dbg !1820
  %1522 = getelementptr inbounds i8, i8* %1483, i64 7, !dbg !1820
  %1523 = load i8, i8* %1522, align 1, !dbg !1820, !tbaa !1807
  %1524 = zext i8 %1523 to i64, !dbg !1820
  %1525 = shl nuw i64 %1524, 56, !dbg !1820
  %1526 = or i64 %1521, %1525, !dbg !1820
  %1527 = add nsw i32 %1484, -8, !dbg !1820
  %1528 = getelementptr inbounds i8, i8* %1483, i64 8, !dbg !1820
  br label %1542, !dbg !1820

1529:                                             ; preds = %1487, %1529
  %1530 = phi i32 [ %1540, %1529 ], [ 0, %1487 ], !dbg !1820
  %1531 = phi i64 [ %1539, %1529 ], [ 0, %1487 ], !dbg !1820
  %1532 = zext i32 %1530 to i64, !dbg !1820
  %1533 = getelementptr inbounds i8, i8* %1483, i64 %1532, !dbg !1820
  %1534 = load i8, i8* %1533, align 1, !dbg !1820, !tbaa !1807
  %1535 = zext i8 %1534 to i64, !dbg !1820
  %1536 = shl i32 %1530, 3, !dbg !1820
  %1537 = zext i32 %1536 to i64, !dbg !1820
  %1538 = shl nuw i64 %1535, %1537, !dbg !1820
  %1539 = or i64 %1538, %1531, !dbg !1820
  %1540 = add nuw nsw i32 %1530, 1, !dbg !1820
  %1541 = icmp eq i32 %1540, %1484, !dbg !1820
  br i1 %1541, label %1542, label %1529, !dbg !1820

1542:                                             ; preds = %1529, %1489, %1487
  %1543 = phi i8* [ %1528, %1489 ], [ %1483, %1487 ], [ %1483, %1529 ], !dbg !1820
  %1544 = phi i32 [ %1527, %1489 ], [ 0, %1487 ], [ 0, %1529 ], !dbg !1820
  %1545 = phi i64 [ %1526, %1489 ], [ 0, %1487 ], [ %1539, %1529 ], !dbg !1820
  %1546 = icmp ugt i32 %1544, 7, !dbg !1820
  br i1 %1546, label %1549, label %1547, !dbg !1820

1547:                                             ; preds = %1542
  %1548 = icmp eq i32 %1544, 0, !dbg !1820
  br i1 %1548, label %1602, label %1589, !dbg !1820

1549:                                             ; preds = %1542
  %1550 = load i8, i8* %1543, align 1, !dbg !1820, !tbaa !1807
  %1551 = zext i8 %1550 to i64, !dbg !1820
  %1552 = getelementptr inbounds i8, i8* %1543, i64 1, !dbg !1820
  %1553 = load i8, i8* %1552, align 1, !dbg !1820, !tbaa !1807
  %1554 = zext i8 %1553 to i64, !dbg !1820
  %1555 = shl nuw nsw i64 %1554, 8, !dbg !1820
  %1556 = or i64 %1555, %1551, !dbg !1820
  %1557 = getelementptr inbounds i8, i8* %1543, i64 2, !dbg !1820
  %1558 = load i8, i8* %1557, align 1, !dbg !1820, !tbaa !1807
  %1559 = zext i8 %1558 to i64, !dbg !1820
  %1560 = shl nuw nsw i64 %1559, 16, !dbg !1820
  %1561 = or i64 %1556, %1560, !dbg !1820
  %1562 = getelementptr inbounds i8, i8* %1543, i64 3, !dbg !1820
  %1563 = load i8, i8* %1562, align 1, !dbg !1820, !tbaa !1807
  %1564 = zext i8 %1563 to i64, !dbg !1820
  %1565 = shl nuw nsw i64 %1564, 24, !dbg !1820
  %1566 = or i64 %1561, %1565, !dbg !1820
  %1567 = getelementptr inbounds i8, i8* %1543, i64 4, !dbg !1820
  %1568 = load i8, i8* %1567, align 1, !dbg !1820, !tbaa !1807
  %1569 = zext i8 %1568 to i64, !dbg !1820
  %1570 = shl nuw nsw i64 %1569, 32, !dbg !1820
  %1571 = or i64 %1566, %1570, !dbg !1820
  %1572 = getelementptr inbounds i8, i8* %1543, i64 5, !dbg !1820
  %1573 = load i8, i8* %1572, align 1, !dbg !1820, !tbaa !1807
  %1574 = zext i8 %1573 to i64, !dbg !1820
  %1575 = shl nuw nsw i64 %1574, 40, !dbg !1820
  %1576 = or i64 %1571, %1575, !dbg !1820
  %1577 = getelementptr inbounds i8, i8* %1543, i64 6, !dbg !1820
  %1578 = load i8, i8* %1577, align 1, !dbg !1820, !tbaa !1807
  %1579 = zext i8 %1578 to i64, !dbg !1820
  %1580 = shl nuw nsw i64 %1579, 48, !dbg !1820
  %1581 = or i64 %1576, %1580, !dbg !1820
  %1582 = getelementptr inbounds i8, i8* %1543, i64 7, !dbg !1820
  %1583 = load i8, i8* %1582, align 1, !dbg !1820, !tbaa !1807
  %1584 = zext i8 %1583 to i64, !dbg !1820
  %1585 = shl nuw i64 %1584, 56, !dbg !1820
  %1586 = or i64 %1581, %1585, !dbg !1820
  %1587 = add nsw i32 %1544, -8, !dbg !1820
  %1588 = getelementptr inbounds i8, i8* %1543, i64 8, !dbg !1820
  br label %1602, !dbg !1820

1589:                                             ; preds = %1547, %1589
  %1590 = phi i32 [ %1600, %1589 ], [ 0, %1547 ], !dbg !1820
  %1591 = phi i64 [ %1599, %1589 ], [ 0, %1547 ], !dbg !1820
  %1592 = zext i32 %1590 to i64, !dbg !1820
  %1593 = getelementptr inbounds i8, i8* %1543, i64 %1592, !dbg !1820
  %1594 = load i8, i8* %1593, align 1, !dbg !1820, !tbaa !1807
  %1595 = zext i8 %1594 to i64, !dbg !1820
  %1596 = shl i32 %1590, 3, !dbg !1820
  %1597 = zext i32 %1596 to i64, !dbg !1820
  %1598 = shl nuw i64 %1595, %1597, !dbg !1820
  %1599 = or i64 %1598, %1591, !dbg !1820
  %1600 = add nuw nsw i32 %1590, 1, !dbg !1820
  %1601 = icmp eq i32 %1600, %1544, !dbg !1820
  br i1 %1601, label %1602, label %1589, !dbg !1820

1602:                                             ; preds = %1589, %1549, %1547
  %1603 = phi i8* [ %1588, %1549 ], [ %1543, %1547 ], [ %1543, %1589 ], !dbg !1820
  %1604 = phi i32 [ %1587, %1549 ], [ 0, %1547 ], [ 0, %1589 ], !dbg !1820
  %1605 = phi i64 [ %1586, %1549 ], [ 0, %1547 ], [ %1599, %1589 ], !dbg !1820
  %1606 = icmp ugt i32 %1604, 7, !dbg !1820
  br i1 %1606, label %1609, label %1607, !dbg !1820

1607:                                             ; preds = %1602
  %1608 = icmp eq i32 %1604, 0, !dbg !1820
  br i1 %1608, label %1662, label %1649, !dbg !1820

1609:                                             ; preds = %1602
  %1610 = load i8, i8* %1603, align 1, !dbg !1820, !tbaa !1807
  %1611 = zext i8 %1610 to i64, !dbg !1820
  %1612 = getelementptr inbounds i8, i8* %1603, i64 1, !dbg !1820
  %1613 = load i8, i8* %1612, align 1, !dbg !1820, !tbaa !1807
  %1614 = zext i8 %1613 to i64, !dbg !1820
  %1615 = shl nuw nsw i64 %1614, 8, !dbg !1820
  %1616 = or i64 %1615, %1611, !dbg !1820
  %1617 = getelementptr inbounds i8, i8* %1603, i64 2, !dbg !1820
  %1618 = load i8, i8* %1617, align 1, !dbg !1820, !tbaa !1807
  %1619 = zext i8 %1618 to i64, !dbg !1820
  %1620 = shl nuw nsw i64 %1619, 16, !dbg !1820
  %1621 = or i64 %1616, %1620, !dbg !1820
  %1622 = getelementptr inbounds i8, i8* %1603, i64 3, !dbg !1820
  %1623 = load i8, i8* %1622, align 1, !dbg !1820, !tbaa !1807
  %1624 = zext i8 %1623 to i64, !dbg !1820
  %1625 = shl nuw nsw i64 %1624, 24, !dbg !1820
  %1626 = or i64 %1621, %1625, !dbg !1820
  %1627 = getelementptr inbounds i8, i8* %1603, i64 4, !dbg !1820
  %1628 = load i8, i8* %1627, align 1, !dbg !1820, !tbaa !1807
  %1629 = zext i8 %1628 to i64, !dbg !1820
  %1630 = shl nuw nsw i64 %1629, 32, !dbg !1820
  %1631 = or i64 %1626, %1630, !dbg !1820
  %1632 = getelementptr inbounds i8, i8* %1603, i64 5, !dbg !1820
  %1633 = load i8, i8* %1632, align 1, !dbg !1820, !tbaa !1807
  %1634 = zext i8 %1633 to i64, !dbg !1820
  %1635 = shl nuw nsw i64 %1634, 40, !dbg !1820
  %1636 = or i64 %1631, %1635, !dbg !1820
  %1637 = getelementptr inbounds i8, i8* %1603, i64 6, !dbg !1820
  %1638 = load i8, i8* %1637, align 1, !dbg !1820, !tbaa !1807
  %1639 = zext i8 %1638 to i64, !dbg !1820
  %1640 = shl nuw nsw i64 %1639, 48, !dbg !1820
  %1641 = or i64 %1636, %1640, !dbg !1820
  %1642 = getelementptr inbounds i8, i8* %1603, i64 7, !dbg !1820
  %1643 = load i8, i8* %1642, align 1, !dbg !1820, !tbaa !1807
  %1644 = zext i8 %1643 to i64, !dbg !1820
  %1645 = shl nuw i64 %1644, 56, !dbg !1820
  %1646 = or i64 %1641, %1645, !dbg !1820
  %1647 = add nsw i32 %1604, -8, !dbg !1820
  %1648 = getelementptr inbounds i8, i8* %1603, i64 8, !dbg !1820
  br label %1662, !dbg !1820

1649:                                             ; preds = %1607, %1649
  %1650 = phi i32 [ %1660, %1649 ], [ 0, %1607 ], !dbg !1820
  %1651 = phi i64 [ %1659, %1649 ], [ 0, %1607 ], !dbg !1820
  %1652 = zext i32 %1650 to i64, !dbg !1820
  %1653 = getelementptr inbounds i8, i8* %1603, i64 %1652, !dbg !1820
  %1654 = load i8, i8* %1653, align 1, !dbg !1820, !tbaa !1807
  %1655 = zext i8 %1654 to i64, !dbg !1820
  %1656 = shl i32 %1650, 3, !dbg !1820
  %1657 = zext i32 %1656 to i64, !dbg !1820
  %1658 = shl nuw i64 %1655, %1657, !dbg !1820
  %1659 = or i64 %1658, %1651, !dbg !1820
  %1660 = add nuw nsw i32 %1650, 1, !dbg !1820
  %1661 = icmp eq i32 %1660, %1604, !dbg !1820
  br i1 %1661, label %1662, label %1649, !dbg !1820

1662:                                             ; preds = %1649, %1609, %1607
  %1663 = phi i8* [ %1648, %1609 ], [ %1603, %1607 ], [ %1603, %1649 ], !dbg !1820
  %1664 = phi i32 [ %1647, %1609 ], [ 0, %1607 ], [ 0, %1649 ], !dbg !1820
  %1665 = phi i64 [ %1646, %1609 ], [ 0, %1607 ], [ %1659, %1649 ], !dbg !1820
  %1666 = icmp ugt i32 %1664, 7, !dbg !1820
  br i1 %1666, label %1669, label %1667, !dbg !1820

1667:                                             ; preds = %1662
  %1668 = icmp eq i32 %1664, 0, !dbg !1820
  br i1 %1668, label %1722, label %1709, !dbg !1820

1669:                                             ; preds = %1662
  %1670 = load i8, i8* %1663, align 1, !dbg !1820, !tbaa !1807
  %1671 = zext i8 %1670 to i64, !dbg !1820
  %1672 = getelementptr inbounds i8, i8* %1663, i64 1, !dbg !1820
  %1673 = load i8, i8* %1672, align 1, !dbg !1820, !tbaa !1807
  %1674 = zext i8 %1673 to i64, !dbg !1820
  %1675 = shl nuw nsw i64 %1674, 8, !dbg !1820
  %1676 = or i64 %1675, %1671, !dbg !1820
  %1677 = getelementptr inbounds i8, i8* %1663, i64 2, !dbg !1820
  %1678 = load i8, i8* %1677, align 1, !dbg !1820, !tbaa !1807
  %1679 = zext i8 %1678 to i64, !dbg !1820
  %1680 = shl nuw nsw i64 %1679, 16, !dbg !1820
  %1681 = or i64 %1676, %1680, !dbg !1820
  %1682 = getelementptr inbounds i8, i8* %1663, i64 3, !dbg !1820
  %1683 = load i8, i8* %1682, align 1, !dbg !1820, !tbaa !1807
  %1684 = zext i8 %1683 to i64, !dbg !1820
  %1685 = shl nuw nsw i64 %1684, 24, !dbg !1820
  %1686 = or i64 %1681, %1685, !dbg !1820
  %1687 = getelementptr inbounds i8, i8* %1663, i64 4, !dbg !1820
  %1688 = load i8, i8* %1687, align 1, !dbg !1820, !tbaa !1807
  %1689 = zext i8 %1688 to i64, !dbg !1820
  %1690 = shl nuw nsw i64 %1689, 32, !dbg !1820
  %1691 = or i64 %1686, %1690, !dbg !1820
  %1692 = getelementptr inbounds i8, i8* %1663, i64 5, !dbg !1820
  %1693 = load i8, i8* %1692, align 1, !dbg !1820, !tbaa !1807
  %1694 = zext i8 %1693 to i64, !dbg !1820
  %1695 = shl nuw nsw i64 %1694, 40, !dbg !1820
  %1696 = or i64 %1691, %1695, !dbg !1820
  %1697 = getelementptr inbounds i8, i8* %1663, i64 6, !dbg !1820
  %1698 = load i8, i8* %1697, align 1, !dbg !1820, !tbaa !1807
  %1699 = zext i8 %1698 to i64, !dbg !1820
  %1700 = shl nuw nsw i64 %1699, 48, !dbg !1820
  %1701 = or i64 %1696, %1700, !dbg !1820
  %1702 = getelementptr inbounds i8, i8* %1663, i64 7, !dbg !1820
  %1703 = load i8, i8* %1702, align 1, !dbg !1820, !tbaa !1807
  %1704 = zext i8 %1703 to i64, !dbg !1820
  %1705 = shl nuw i64 %1704, 56, !dbg !1820
  %1706 = or i64 %1701, %1705, !dbg !1820
  %1707 = add nsw i32 %1664, -8, !dbg !1820
  %1708 = getelementptr inbounds i8, i8* %1663, i64 8, !dbg !1820
  br label %1722, !dbg !1820

1709:                                             ; preds = %1667, %1709
  %1710 = phi i32 [ %1720, %1709 ], [ 0, %1667 ], !dbg !1820
  %1711 = phi i64 [ %1719, %1709 ], [ 0, %1667 ], !dbg !1820
  %1712 = zext i32 %1710 to i64, !dbg !1820
  %1713 = getelementptr inbounds i8, i8* %1663, i64 %1712, !dbg !1820
  %1714 = load i8, i8* %1713, align 1, !dbg !1820, !tbaa !1807
  %1715 = zext i8 %1714 to i64, !dbg !1820
  %1716 = shl i32 %1710, 3, !dbg !1820
  %1717 = zext i32 %1716 to i64, !dbg !1820
  %1718 = shl nuw i64 %1715, %1717, !dbg !1820
  %1719 = or i64 %1718, %1711, !dbg !1820
  %1720 = add nuw nsw i32 %1710, 1, !dbg !1820
  %1721 = icmp eq i32 %1720, %1664, !dbg !1820
  br i1 %1721, label %1722, label %1709, !dbg !1820

1722:                                             ; preds = %1709, %1669, %1667
  %1723 = phi i8* [ %1708, %1669 ], [ %1663, %1667 ], [ %1663, %1709 ], !dbg !1820
  %1724 = phi i32 [ %1707, %1669 ], [ 0, %1667 ], [ 0, %1709 ], !dbg !1820
  %1725 = phi i64 [ %1706, %1669 ], [ 0, %1667 ], [ %1719, %1709 ], !dbg !1820
  %1726 = icmp ugt i32 %1724, 7, !dbg !1820
  br i1 %1726, label %1729, label %1727, !dbg !1820

1727:                                             ; preds = %1722
  %1728 = icmp eq i32 %1724, 0, !dbg !1820
  br i1 %1728, label %1782, label %1769, !dbg !1820

1729:                                             ; preds = %1722
  %1730 = load i8, i8* %1723, align 1, !dbg !1820, !tbaa !1807
  %1731 = zext i8 %1730 to i64, !dbg !1820
  %1732 = getelementptr inbounds i8, i8* %1723, i64 1, !dbg !1820
  %1733 = load i8, i8* %1732, align 1, !dbg !1820, !tbaa !1807
  %1734 = zext i8 %1733 to i64, !dbg !1820
  %1735 = shl nuw nsw i64 %1734, 8, !dbg !1820
  %1736 = or i64 %1735, %1731, !dbg !1820
  %1737 = getelementptr inbounds i8, i8* %1723, i64 2, !dbg !1820
  %1738 = load i8, i8* %1737, align 1, !dbg !1820, !tbaa !1807
  %1739 = zext i8 %1738 to i64, !dbg !1820
  %1740 = shl nuw nsw i64 %1739, 16, !dbg !1820
  %1741 = or i64 %1736, %1740, !dbg !1820
  %1742 = getelementptr inbounds i8, i8* %1723, i64 3, !dbg !1820
  %1743 = load i8, i8* %1742, align 1, !dbg !1820, !tbaa !1807
  %1744 = zext i8 %1743 to i64, !dbg !1820
  %1745 = shl nuw nsw i64 %1744, 24, !dbg !1820
  %1746 = or i64 %1741, %1745, !dbg !1820
  %1747 = getelementptr inbounds i8, i8* %1723, i64 4, !dbg !1820
  %1748 = load i8, i8* %1747, align 1, !dbg !1820, !tbaa !1807
  %1749 = zext i8 %1748 to i64, !dbg !1820
  %1750 = shl nuw nsw i64 %1749, 32, !dbg !1820
  %1751 = or i64 %1746, %1750, !dbg !1820
  %1752 = getelementptr inbounds i8, i8* %1723, i64 5, !dbg !1820
  %1753 = load i8, i8* %1752, align 1, !dbg !1820, !tbaa !1807
  %1754 = zext i8 %1753 to i64, !dbg !1820
  %1755 = shl nuw nsw i64 %1754, 40, !dbg !1820
  %1756 = or i64 %1751, %1755, !dbg !1820
  %1757 = getelementptr inbounds i8, i8* %1723, i64 6, !dbg !1820
  %1758 = load i8, i8* %1757, align 1, !dbg !1820, !tbaa !1807
  %1759 = zext i8 %1758 to i64, !dbg !1820
  %1760 = shl nuw nsw i64 %1759, 48, !dbg !1820
  %1761 = or i64 %1756, %1760, !dbg !1820
  %1762 = getelementptr inbounds i8, i8* %1723, i64 7, !dbg !1820
  %1763 = load i8, i8* %1762, align 1, !dbg !1820, !tbaa !1807
  %1764 = zext i8 %1763 to i64, !dbg !1820
  %1765 = shl nuw i64 %1764, 56, !dbg !1820
  %1766 = or i64 %1761, %1765, !dbg !1820
  %1767 = add nsw i32 %1724, -8, !dbg !1820
  %1768 = getelementptr inbounds i8, i8* %1723, i64 8, !dbg !1820
  br label %1782, !dbg !1820

1769:                                             ; preds = %1727, %1769
  %1770 = phi i32 [ %1780, %1769 ], [ 0, %1727 ], !dbg !1820
  %1771 = phi i64 [ %1779, %1769 ], [ 0, %1727 ], !dbg !1820
  %1772 = zext i32 %1770 to i64, !dbg !1820
  %1773 = getelementptr inbounds i8, i8* %1723, i64 %1772, !dbg !1820
  %1774 = load i8, i8* %1773, align 1, !dbg !1820, !tbaa !1807
  %1775 = zext i8 %1774 to i64, !dbg !1820
  %1776 = shl i32 %1770, 3, !dbg !1820
  %1777 = zext i32 %1776 to i64, !dbg !1820
  %1778 = shl nuw i64 %1775, %1777, !dbg !1820
  %1779 = or i64 %1778, %1771, !dbg !1820
  %1780 = add nuw nsw i32 %1770, 1, !dbg !1820
  %1781 = icmp eq i32 %1780, %1724, !dbg !1820
  br i1 %1781, label %1782, label %1769, !dbg !1820

1782:                                             ; preds = %1769, %1729, %1727
  %1783 = phi i8* [ %1768, %1729 ], [ %1723, %1727 ], [ %1723, %1769 ], !dbg !1820
  %1784 = phi i32 [ %1767, %1729 ], [ 0, %1727 ], [ 0, %1769 ], !dbg !1820
  %1785 = phi i64 [ %1766, %1729 ], [ 0, %1727 ], [ %1779, %1769 ], !dbg !1820
  %1786 = icmp ugt i32 %1784, 7, !dbg !1820
  br i1 %1786, label %1789, label %1787, !dbg !1820

1787:                                             ; preds = %1782
  %1788 = icmp eq i32 %1784, 0, !dbg !1820
  br i1 %1788, label %1840, label %1827, !dbg !1820

1789:                                             ; preds = %1782
  %1790 = load i8, i8* %1783, align 1, !dbg !1820, !tbaa !1807
  %1791 = zext i8 %1790 to i64, !dbg !1820
  %1792 = getelementptr inbounds i8, i8* %1783, i64 1, !dbg !1820
  %1793 = load i8, i8* %1792, align 1, !dbg !1820, !tbaa !1807
  %1794 = zext i8 %1793 to i64, !dbg !1820
  %1795 = shl nuw nsw i64 %1794, 8, !dbg !1820
  %1796 = or i64 %1795, %1791, !dbg !1820
  %1797 = getelementptr inbounds i8, i8* %1783, i64 2, !dbg !1820
  %1798 = load i8, i8* %1797, align 1, !dbg !1820, !tbaa !1807
  %1799 = zext i8 %1798 to i64, !dbg !1820
  %1800 = shl nuw nsw i64 %1799, 16, !dbg !1820
  %1801 = or i64 %1796, %1800, !dbg !1820
  %1802 = getelementptr inbounds i8, i8* %1783, i64 3, !dbg !1820
  %1803 = load i8, i8* %1802, align 1, !dbg !1820, !tbaa !1807
  %1804 = zext i8 %1803 to i64, !dbg !1820
  %1805 = shl nuw nsw i64 %1804, 24, !dbg !1820
  %1806 = or i64 %1801, %1805, !dbg !1820
  %1807 = getelementptr inbounds i8, i8* %1783, i64 4, !dbg !1820
  %1808 = load i8, i8* %1807, align 1, !dbg !1820, !tbaa !1807
  %1809 = zext i8 %1808 to i64, !dbg !1820
  %1810 = shl nuw nsw i64 %1809, 32, !dbg !1820
  %1811 = or i64 %1806, %1810, !dbg !1820
  %1812 = getelementptr inbounds i8, i8* %1783, i64 5, !dbg !1820
  %1813 = load i8, i8* %1812, align 1, !dbg !1820, !tbaa !1807
  %1814 = zext i8 %1813 to i64, !dbg !1820
  %1815 = shl nuw nsw i64 %1814, 40, !dbg !1820
  %1816 = or i64 %1811, %1815, !dbg !1820
  %1817 = getelementptr inbounds i8, i8* %1783, i64 6, !dbg !1820
  %1818 = load i8, i8* %1817, align 1, !dbg !1820, !tbaa !1807
  %1819 = zext i8 %1818 to i64, !dbg !1820
  %1820 = shl nuw nsw i64 %1819, 48, !dbg !1820
  %1821 = or i64 %1816, %1820, !dbg !1820
  %1822 = getelementptr inbounds i8, i8* %1783, i64 7, !dbg !1820
  %1823 = load i8, i8* %1822, align 1, !dbg !1820, !tbaa !1807
  %1824 = zext i8 %1823 to i64, !dbg !1820
  %1825 = shl nuw i64 %1824, 56, !dbg !1820
  %1826 = or i64 %1821, %1825, !dbg !1820
  br label %1840, !dbg !1820

1827:                                             ; preds = %1787, %1827
  %1828 = phi i32 [ %1838, %1827 ], [ 0, %1787 ], !dbg !1820
  %1829 = phi i64 [ %1837, %1827 ], [ 0, %1787 ], !dbg !1820
  %1830 = zext i32 %1828 to i64, !dbg !1820
  %1831 = getelementptr inbounds i8, i8* %1783, i64 %1830, !dbg !1820
  %1832 = load i8, i8* %1831, align 1, !dbg !1820, !tbaa !1807
  %1833 = zext i8 %1832 to i64, !dbg !1820
  %1834 = shl i32 %1828, 3, !dbg !1820
  %1835 = zext i32 %1834 to i64, !dbg !1820
  %1836 = shl nuw i64 %1833, %1835, !dbg !1820
  %1837 = or i64 %1836, %1829, !dbg !1820
  %1838 = add nuw nsw i32 %1828, 1, !dbg !1820
  %1839 = icmp eq i32 %1838, %1784, !dbg !1820
  br i1 %1839, label %1840, label %1827, !dbg !1820

1840:                                             ; preds = %1827, %1789, %1787
  %1841 = phi i64 [ %1826, %1789 ], [ 0, %1787 ], [ %1837, %1827 ], !dbg !1820
  %1842 = shl nuw nsw i64 %1423, 2, !dbg !1820
  %1843 = add nuw nsw i64 %1842, 28, !dbg !1820
  %1844 = and i64 %1843, 480, !dbg !1820
  %1845 = and i64 %1425, -225, !dbg !1820
  %1846 = or i64 %1845, %1844, !dbg !1820
  %1847 = call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1846, i64 noundef %1485, i64 noundef %1545, i64 noundef %1605, i64 noundef %1665, i64 noundef %1725, i64 noundef %1785, i64 noundef %1841) #16, !dbg !1820
  %1848 = sub i64 %1415, %1423, !dbg !1820
  %1849 = getelementptr inbounds i8, i8* %1416, i64 %1423, !dbg !1820
  %1850 = icmp eq i64 %1848, 0, !dbg !1820
  br i1 %1850, label %1851, label %1414, !dbg !1820

1851:                                             ; preds = %1840, %1402
  call void @llvm.trap(), !dbg !1822
  unreachable, !dbg !1823
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #3

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #3

; Function Attrs: mustprogress noinline nounwind
define weak hidden void @__assertfail() local_unnamed_addr #4 !dbg !1824 {
  tail call void @llvm.trap(), !dbg !1825
  unreachable, !dbg !1826
}

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13__d_incrementPi(i32 addrspace(1)* nocapture %0) local_unnamed_addr #5 !dbg !1827 {
  %2 = tail call i32 @llvm.amdgcn.workitem.id.x(), !dbg !1834, !range !1846
  %3 = zext i32 %2 to i64, !dbg !1847
  %4 = icmp eq i32 %2, 0, !dbg !1848
  br i1 %4, label %10, label %5, !dbg !1850

5:                                                ; preds = %1
  %6 = add nsw i64 %3, -1, !dbg !1851
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %6, !dbg !1853
  %8 = load i32, i32 addrspace(1)* %7, align 4, !dbg !1853, !tbaa !1854, !amdgpu.noclobber !1763
  %9 = add i32 %8, 1
  br label %10

10:                                               ; preds = %1, %5
  %11 = phi i32 [ %9, %5 ], [ 1, %1 ]
  fence syncscope("workgroup") release, !dbg !1856
  tail call void @llvm.amdgcn.s.barrier(), !dbg !1874
  fence syncscope("workgroup") acquire, !dbg !1875
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %3, !dbg !1876
  store i32 %11, i32 addrspace(1)* %12, align 4, !dbg !1877, !tbaa !1854
  ret void, !dbg !1878
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #6

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #7

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #7

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #8 {
  %10 = alloca i8*, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca %0 addrspace(1)*, align 8, addrspace(5)
  %23 = alloca i64, align 8, addrspace(5)
  %24 = alloca %1 addrspace(1)*, align 8, addrspace(5)
  %25 = alloca %2 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !1879
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !1881
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !1795
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !1795
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !1795
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !1795
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !1795
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !1795
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !1795
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !1795
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #11
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !1881
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !1881
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #16, !srcloc !1883
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !1881
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #11
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !1881
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !1881
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #11
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !1879
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !1879
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #11
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !1879
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !1881
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1881
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !1884
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !1887
  %50 = and i64 %49, %45
  %51 = getelementptr inbounds %1, %1 addrspace(1)* %48, i64 %50, i32 0
  %52 = load atomic i64, i64 addrspace(1)* %51 syncscope("one-as") monotonic, align 8
  %53 = cmpxchg i64 addrspace(1)* %44, i64 %45, i64 %52 syncscope("one-as") acquire monotonic, align 8
  %54 = extractvalue { i64, i1 } %53, 1
  br i1 %54, label %65, label %55

55:                                               ; preds = %55, %43
  %56 = phi { i64, i1 } [ %63, %55 ], [ %53, %43 ]
  %57 = extractvalue { i64, i1 } %56, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !1884
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !1887
  %60 = and i64 %59, %57
  %61 = getelementptr inbounds %1, %1 addrspace(1)* %58, i64 %60, i32 0
  %62 = load atomic i64, i64 addrspace(1)* %61 syncscope("one-as") monotonic, align 8
  %63 = cmpxchg i64 addrspace(1)* %44, i64 %57, i64 %62 syncscope("one-as") acquire monotonic, align 8
  %64 = extractvalue { i64, i1 } %63, 1
  br i1 %64, label %65, label %55

65:                                               ; preds = %55, %43
  %66 = phi { i64, i1 } [ %53, %43 ], [ %63, %55 ]
  %67 = extractvalue { i64, i1 } %66, 0
  br label %68

68:                                               ; preds = %9, %65
  %69 = phi i64 [ %67, %65 ], [ 0, %9 ]
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = trunc i64 %71 to i32
  %73 = call i32 @llvm.amdgcn.readfirstlane(i32 %70)
  %74 = call i32 @llvm.amdgcn.readfirstlane(i32 %72)
  %75 = zext i32 %74 to i64
  %76 = shl nuw i64 %75, 32
  %77 = zext i32 %73 to i64
  %78 = or i64 %76, %77
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !1795
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #11
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !1879
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !1795
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !1884
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !1887
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !1879
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #11
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !1879
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !1795
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !1888
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !1887
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !1879
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !1879
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !1879
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !1881
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !1795
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !1795
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !1795
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !1795
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !1795
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !1795
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !1795
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !1795
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !1881
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1881
  %110 = call i64 @llvm.read_register.i64(metadata !1889) #17
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !1890
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !1892
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !1893
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !1795
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !1795
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !1795
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !1795
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !1795
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !1795
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !1795
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !1795
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !1879
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !1795
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !1881
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1881
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !1884
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !1887
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !1894
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !1894
  %145 = cmpxchg i64 addrspace(1)* %132, i64 %144, i64 %127 syncscope("one-as") release monotonic, align 8
  %146 = extractvalue { i64, i1 } %145, 1
  br i1 %146, label %147, label %142

147:                                              ; preds = %142, %131
  %148 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 2, i32 0
  %149 = load i64, i64 addrspace(1)* %148, align 8
  %150 = inttoptr i64 %149 to %4 addrspace(1)*
  %151 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 1, i32 0
  %152 = atomicrmw add i64 addrspace(1)* %151, i64 1 syncscope("one-as") release, align 8
  %153 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 2
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !1895
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !1897
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #11
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !1879
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !1879
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !1881
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1881
  %169 = icmp eq i32 %167, %168
  %170 = getelementptr inbounds %1, %1 addrspace(1)* %165, i64 0, i32 3
  br label %171

171:                                              ; preds = %179, %163
  br i1 %169, label %172, label %175

172:                                              ; preds = %171
  %173 = load atomic i32, i32 addrspace(1)* %170 syncscope("one-as") acquire, align 4
  %174 = and i32 %173, 1
  br label %175

175:                                              ; preds = %172, %171
  %176 = phi i32 [ %174, %172 ], [ 1, %171 ]
  %177 = call i32 @llvm.amdgcn.readfirstlane(i32 %176)
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %180, label %179

179:                                              ; preds = %175
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %171

180:                                              ; preds = %175
  %181 = zext i32 %167 to i64
  %182 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 0
  %183 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 1
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !1795
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !1795
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !1807
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !1879
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !1795
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !1881
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !1881
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !1887
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !1884
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !1894
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !1894
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !1807
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #11
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #11
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #11
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #11
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #11
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #11
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #11
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #9

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #10

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #11

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #12

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #13

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #13

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #14

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p5i8.p4i8.i64(i8 addrspace(5)* noalias nocapture writeonly, i8 addrspace(4)* noalias nocapture readonly, i64, i1 immarg) #15

attributes #0 = { mustprogress noreturn nounwind "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx803" "target-features"="+16-bit-insts,+ci-insts,+dpp,+flat-address-space,+gfx8-insts,+s-memrealtime,+s-memtime-inst" }
attributes #1 = { cold noreturn nounwind }
attributes #2 = { convergent noinline nounwind "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx803" "target-features"="+16-bit-insts,+ci-insts,+dpp,+flat-address-space,+gfx8-insts,+s-memrealtime,+s-memtime-inst" }
attributes #3 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #4 = { mustprogress noinline nounwind "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx803" "target-features"="+16-bit-insts,+ci-insts,+dpp,+flat-address-space,+gfx8-insts,+s-memrealtime,+s-memtime-inst" }
attributes #5 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,1024" "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx803" "target-features"="+16-bit-insts,+ci-insts,+dpp,+flat-address-space,+gfx8-insts,+s-memrealtime,+s-memtime-inst" "uniform-work-group-size"="true" }
attributes #6 = { convergent mustprogress nounwind willreturn }
attributes #7 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #8 = { convergent noinline norecurse nounwind optnone "denormal-fp-math-f32"="preserve-sign,preserve-sign" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #9 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #10 = { mustprogress nounwind willreturn }
attributes #11 = { nounwind }
attributes #12 = { nofree nounwind readonly }
attributes #13 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #14 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #15 = { argmemonly nocallback nofree nounwind willreturn }
attributes #16 = { convergent nounwind }
attributes #17 = { convergent }

!llvm.dbg.cu = !{!1}
!llvm.dbg.retainedNodes = !{!1693, !1753}
!llvm.module.flags = !{!1755, !1756, !1757, !1758}
!opencl.ocl.version = !{!1759}
!llvm.ident = !{!1760}

!0 = distinct !DIFragment()
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !27, imports: !43, splitDebugInlining: false, nameTableKind: None)
!2 = !DIFile(filename: "test.C", directory: "/mnt/d/repos/SW4CK/src", checksumkind: CSK_MD5, checksum: "c87a7a04b1749c84edbbfc8cb48ae44f")
!3 = !{!4, !12, !20}
!4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Lock_policy", scope: !6, file: !5, line: 49, baseType: !7, size: 32, elements: !8, identifier: "_ZTSN9__gnu_cxx12_Lock_policyE")
!5 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ext/concurrence.h", directory: "")
!6 = !DINamespace(name: "__gnu_cxx", scope: null)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11}
!9 = !DIEnumerator(name: "_S_single", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "_S_mutex", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "_S_atomic", value: 2, isUnsigned: true)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__memory_scope", file: !13, line: 131, baseType: !7, size: 32, elements: !14, identifier: "_ZTS14__memory_scope")
!13 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/device_library_decls.h", directory: "", checksumkind: CSK_MD5, checksum: "8b6f554c5ff3913526d501b4647e437e")
!14 = !{!15, !16, !17, !18, !19}
!15 = !DIEnumerator(name: "__memory_scope_work_item", value: 0, isUnsigned: true)
!16 = !DIEnumerator(name: "__memory_scope_work_group", value: 1, isUnsigned: true)
!17 = !DIEnumerator(name: "__memory_scope_device", value: 2, isUnsigned: true)
!18 = !DIEnumerator(name: "__memory_scope_all_svm_devices", value: 3, isUnsigned: true)
!19 = !DIEnumerator(name: "__memory_scope_sub_group", value: 4, isUnsigned: true)
!20 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__memory_order", file: !13, line: 140, baseType: !7, size: 32, elements: !21, identifier: "_ZTS14__memory_order")
!21 = !{!22, !23, !24, !25, !26}
!22 = !DIEnumerator(name: "__memory_order_relaxed", value: 0, isUnsigned: true)
!23 = !DIEnumerator(name: "__memory_order_acquire", value: 2, isUnsigned: true)
!24 = !DIEnumerator(name: "__memory_order_release", value: 3, isUnsigned: true)
!25 = !DIEnumerator(name: "__memory_order_acq_rel", value: 4, isUnsigned: true)
!26 = !DIEnumerator(name: "__memory_order_seq_cst", value: 5, isUnsigned: true)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cl_mem_fence_flags", file: !13, line: 129, baseType: !7)
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !30, line: 934, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !31, identifier: "_ZTS4dim3")
!30 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "7560f6d8bd7c5ac736ef5dfcbc59d092")
!31 = !{!32, !37, !38, !39}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !29, file: !30, line: 935, baseType: !33, size: 32)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !34, line: 26, baseType: !35)
!34 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "d3ea318a915682aaf6645ec16ac9f991")
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !36, line: 42, baseType: !7)
!36 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "f6304b1a6dcfc6bee76e9a51043b5090")
!37 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !29, file: !30, line: 936, baseType: !33, size: 32, offset: 32)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !29, file: !30, line: 937, baseType: !33, size: 32, offset: 64)
!39 = !DISubprogram(name: "dim3", scope: !29, file: !30, line: 939, type: !40, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42, !33, !33, !33}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!43 = !{!44, !52, !59, !61, !63, !67, !69, !71, !73, !75, !77, !79, !81, !86, !90, !92, !94, !99, !101, !103, !105, !107, !109, !111, !114, !117, !119, !123, !128, !130, !132, !134, !136, !138, !140, !142, !144, !146, !148, !152, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !176, !178, !180, !182, !184, !186, !190, !194, !198, !200, !202, !204, !206, !208, !210, !212, !214, !216, !220, !224, !228, !230, !232, !234, !239, !243, !247, !249, !251, !253, !255, !257, !259, !261, !263, !265, !267, !269, !271, !276, !280, !284, !286, !288, !290, !297, !301, !305, !307, !309, !311, !313, !315, !317, !321, !325, !327, !329, !331, !333, !337, !341, !345, !347, !349, !351, !353, !355, !357, !361, !365, !369, !371, !375, !379, !381, !383, !385, !387, !389, !391, !395, !401, !405, !410, !412, !415, !419, !423, !438, !442, !446, !450, !454, !459, !463, !467, !471, !475, !483, !487, !491, !493, !497, !501, !505, !511, !515, !519, !521, !529, !533, !539, !541, !545, !549, !553, !557, !562, !566, !570, !571, !572, !573, !575, !576, !577, !578, !579, !580, !581, !583, !584, !585, !586, !587, !588, !589, !591, !592, !593, !594, !595, !596, !597, !598, !599, !600, !601, !602, !603, !604, !605, !606, !607, !608, !609, !610, !611, !612, !613, !614, !615, !619, !623, !627, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652, !654, !656, !658, !660, !662, !664, !666, !668, !670, !672, !674, !676, !678, !680, !684, !686, !688, !693, !697, !699, !701, !703, !705, !707, !709, !711, !713, !715, !717, !719, !721, !723, !725, !727, !729, !731, !733, !735, !737, !739, !744, !746, !748, !750, !752, !754, !756, !758, !760, !762, !764, !766, !768, !770, !772, !774, !776, !778, !780, !782, !786, !788, !790, !792, !794, !796, !798, !800, !802, !804, !806, !808, !810, !812, !814, !816, !818, !820, !822, !824, !826, !828, !830, !832, !834, !836, !838, !840, !842, !844, !846, !848, !850, !852, !854, !856, !858, !860, !862, !864, !866, !868, !870, !872, !874, !876, !878, !880, !882, !884, !886, !888, !890, !892, !894, !911, !914, !919, !977, !982, !986, !990, !994, !998, !1000, !1002, !1006, !1012, !1016, !1022, !1028, !1030, !1034, !1038, !1042, !1046, !1054, !1056, !1060, !1064, !1068, !1070, !1074, !1078, !1082, !1084, !1086, !1090, !1098, !1102, !1106, !1110, !1112, !1118, !1120, !1126, !1130, !1134, !1138, !1142, !1146, !1150, !1152, !1154, !1158, !1162, !1166, !1168, !1172, !1176, !1178, !1180, !1184, !1188, !1192, !1196, !1197, !1198, !1199, !1200, !1201, !1202, !1203, !1204, !1205, !1206, !1211, !1215, !1218, !1221, !1224, !1226, !1228, !1230, !1233, !1236, !1239, !1242, !1245, !1247, !1251, !1254, !1255, !1258, !1260, !1262, !1264, !1266, !1269, !1272, !1275, !1278, !1281, !1283, !1287, !1289, !1293, !1297, !1302, !1306, !1308, !1310, !1312, !1314, !1316, !1318, !1320, !1322, !1324, !1326, !1328, !1330, !1332, !1336, !1342, !1347, !1351, !1353, !1355, !1357, !1359, !1366, !1370, !1374, !1378, !1382, !1386, !1391, !1395, !1397, !1401, !1407, !1411, !1416, !1418, !1421, !1425, !1429, !1431, !1433, !1435, !1437, !1441, !1443, !1445, !1449, !1453, !1457, !1461, !1465, !1469, !1471, !1475, !1479, !1483, !1487, !1489, !1491, !1495, !1499, !1500, !1501, !1502, !1503, !1504, !1510, !1513, !1514, !1516, !1518, !1520, !1522, !1526, !1528, !1530, !1532, !1534, !1536, !1538, !1540, !1542, !1546, !1550, !1552, !1556, !1560, !1565, !1569, !1570, !1575, !1579, !1584, !1589, !1593, !1599, !1603, !1605, !1609, !1614, !1620, !1624, !1628, !1632, !1636, !1640, !1642, !1644, !1646, !1650, !1654, !1658, !1662, !1666, !1668, !1670, !1672, !1676, !1680, !1684, !1686, !1688, !1690}
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !46, file: !51, line: 52)
!45 = !DINamespace(name: "std", scope: null)
!46 = !DISubprogram(name: "abs", scope: !47, file: !47, line: 840, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!47 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f0db66726d35051e5af2525f5b33bd81")
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/std_abs.h", directory: "")
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !53, file: !58, line: 83)
!53 = !DISubprogram(name: "acos", scope: !54, file: !54, line: 53, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "833006f6c08fa0a86f73f7ac7f62dccb")
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57}
!57 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!58 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cmath", directory: "")
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
!113 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "2fed8744bf26ef122777e2a4593ca401")
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
!237 = !{!238, !57}
!238 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !240, file: !58, line: 1135)
!240 = !DISubprogram(name: "llrintf", scope: !54, file: !54, line: 316, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!241 = !DISubroutineType(types: !242)
!242 = !{!238, !116}
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !244, file: !58, line: 1136)
!244 = !DISubprogram(name: "llrintl", scope: !54, file: !54, line: 316, type: !245, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!245 = !DISubroutineType(types: !246)
!246 = !{!238, !127}
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !248, file: !58, line: 1138)
!248 = !DISubprogram(name: "llround", scope: !54, file: !54, line: 322, type: !236, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !250, file: !58, line: 1139)
!250 = !DISubprogram(name: "llroundf", scope: !54, file: !54, line: 322, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !252, file: !58, line: 1140)
!252 = !DISubprogram(name: "llroundl", scope: !54, file: !54, line: 322, type: !245, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !254, file: !58, line: 1143)
!254 = !DISubprogram(name: "log1p", scope: !54, file: !54, line: 122, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !256, file: !58, line: 1144)
!256 = !DISubprogram(name: "log1pf", scope: !54, file: !54, line: 122, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !258, file: !58, line: 1145)
!258 = !DISubprogram(name: "log1pl", scope: !54, file: !54, line: 122, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !260, file: !58, line: 1147)
!260 = !DISubprogram(name: "log2", scope: !54, file: !54, line: 133, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !262, file: !58, line: 1148)
!262 = !DISubprogram(name: "log2f", scope: !54, file: !54, line: 133, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !264, file: !58, line: 1149)
!264 = !DISubprogram(name: "log2l", scope: !54, file: !54, line: 133, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !266, file: !58, line: 1151)
!266 = !DISubprogram(name: "logb", scope: !54, file: !54, line: 125, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !268, file: !58, line: 1152)
!268 = !DISubprogram(name: "logbf", scope: !54, file: !54, line: 125, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !270, file: !58, line: 1153)
!270 = !DISubprogram(name: "logbl", scope: !54, file: !54, line: 125, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !272, file: !58, line: 1155)
!272 = !DISubprogram(name: "lrint", scope: !54, file: !54, line: 314, type: !273, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!273 = !DISubroutineType(types: !274)
!274 = !{!275, !57}
!275 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !277, file: !58, line: 1156)
!277 = !DISubprogram(name: "lrintf", scope: !54, file: !54, line: 314, type: !278, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!278 = !DISubroutineType(types: !279)
!279 = !{!275, !116}
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !281, file: !58, line: 1157)
!281 = !DISubprogram(name: "lrintl", scope: !54, file: !54, line: 314, type: !282, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!282 = !DISubroutineType(types: !283)
!283 = !{!275, !127}
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !285, file: !58, line: 1159)
!285 = !DISubprogram(name: "lround", scope: !54, file: !54, line: 320, type: !273, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !287, file: !58, line: 1160)
!287 = !DISubprogram(name: "lroundf", scope: !54, file: !54, line: 320, type: !278, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !289, file: !58, line: 1161)
!289 = !DISubprogram(name: "lroundl", scope: !54, file: !54, line: 320, type: !282, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !291, file: !58, line: 1163)
!291 = !DISubprogram(name: "nan", scope: !54, file: !54, line: 201, type: !292, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!292 = !DISubroutineType(types: !293)
!293 = !{!57, !294}
!294 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !295, size: 64)
!295 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !296)
!296 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !298, file: !58, line: 1164)
!298 = !DISubprogram(name: "nanf", scope: !54, file: !54, line: 201, type: !299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!299 = !DISubroutineType(types: !300)
!300 = !{!116, !294}
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !302, file: !58, line: 1165)
!302 = !DISubprogram(name: "nanl", scope: !54, file: !54, line: 201, type: !303, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!303 = !DISubroutineType(types: !304)
!304 = !{!127, !294}
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !306, file: !58, line: 1167)
!306 = !DISubprogram(name: "nearbyint", scope: !54, file: !54, line: 294, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !308, file: !58, line: 1168)
!308 = !DISubprogram(name: "nearbyintf", scope: !54, file: !54, line: 294, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !310, file: !58, line: 1169)
!310 = !DISubprogram(name: "nearbyintl", scope: !54, file: !54, line: 294, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !312, file: !58, line: 1171)
!312 = !DISubprogram(name: "nextafter", scope: !54, file: !54, line: 259, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !314, file: !58, line: 1172)
!314 = !DISubprogram(name: "nextafterf", scope: !54, file: !54, line: 259, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !316, file: !58, line: 1173)
!316 = !DISubprogram(name: "nextafterl", scope: !54, file: !54, line: 259, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !318, file: !58, line: 1175)
!318 = !DISubprogram(name: "nexttoward", scope: !54, file: !54, line: 261, type: !319, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!319 = !DISubroutineType(types: !320)
!320 = !{!57, !57, !127}
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !322, file: !58, line: 1176)
!322 = !DISubprogram(name: "nexttowardf", scope: !54, file: !54, line: 261, type: !323, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!323 = !DISubroutineType(types: !324)
!324 = !{!116, !116, !127}
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !326, file: !58, line: 1177)
!326 = !DISubprogram(name: "nexttowardl", scope: !54, file: !54, line: 261, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !328, file: !58, line: 1179)
!328 = !DISubprogram(name: "remainder", scope: !54, file: !54, line: 272, type: !65, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !330, file: !58, line: 1180)
!330 = !DISubprogram(name: "remainderf", scope: !54, file: !54, line: 272, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !332, file: !58, line: 1181)
!332 = !DISubprogram(name: "remainderl", scope: !54, file: !54, line: 272, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !334, file: !58, line: 1183)
!334 = !DISubprogram(name: "remquo", scope: !54, file: !54, line: 307, type: !335, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!335 = !DISubroutineType(types: !336)
!336 = !{!57, !57, !57, !85}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !338, file: !58, line: 1184)
!338 = !DISubprogram(name: "remquof", scope: !54, file: !54, line: 307, type: !339, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!339 = !DISubroutineType(types: !340)
!340 = !{!116, !116, !116, !85}
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !342, file: !58, line: 1185)
!342 = !DISubprogram(name: "remquol", scope: !54, file: !54, line: 307, type: !343, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!343 = !DISubroutineType(types: !344)
!344 = !{!127, !127, !127, !85}
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !346, file: !58, line: 1187)
!346 = !DISubprogram(name: "rint", scope: !54, file: !54, line: 256, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !348, file: !58, line: 1188)
!348 = !DISubprogram(name: "rintf", scope: !54, file: !54, line: 256, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !350, file: !58, line: 1189)
!350 = !DISubprogram(name: "rintl", scope: !54, file: !54, line: 256, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !352, file: !58, line: 1191)
!352 = !DISubprogram(name: "round", scope: !54, file: !54, line: 298, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !354, file: !58, line: 1192)
!354 = !DISubprogram(name: "roundf", scope: !54, file: !54, line: 298, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !356, file: !58, line: 1193)
!356 = !DISubprogram(name: "roundl", scope: !54, file: !54, line: 298, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !358, file: !58, line: 1195)
!358 = !DISubprogram(name: "scalbln", scope: !54, file: !54, line: 290, type: !359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!359 = !DISubroutineType(types: !360)
!360 = !{!57, !57, !275}
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !362, file: !58, line: 1196)
!362 = !DISubprogram(name: "scalblnf", scope: !54, file: !54, line: 290, type: !363, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!363 = !DISubroutineType(types: !364)
!364 = !{!116, !116, !275}
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !366, file: !58, line: 1197)
!366 = !DISubprogram(name: "scalblnl", scope: !54, file: !54, line: 290, type: !367, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!367 = !DISubroutineType(types: !368)
!368 = !{!127, !127, !275}
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !370, file: !58, line: 1199)
!370 = !DISubprogram(name: "scalbn", scope: !54, file: !54, line: 276, type: !88, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !372, file: !58, line: 1200)
!372 = !DISubprogram(name: "scalbnf", scope: !54, file: !54, line: 276, type: !373, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!373 = !DISubroutineType(types: !374)
!374 = !{!116, !116, !50}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !376, file: !58, line: 1201)
!376 = !DISubprogram(name: "scalbnl", scope: !54, file: !54, line: 276, type: !377, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!377 = !DISubroutineType(types: !378)
!378 = !{!127, !127, !50}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !380, file: !58, line: 1203)
!380 = !DISubprogram(name: "tgamma", scope: !54, file: !54, line: 235, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !382, file: !58, line: 1204)
!382 = !DISubprogram(name: "tgammaf", scope: !54, file: !54, line: 235, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !384, file: !58, line: 1205)
!384 = !DISubprogram(name: "tgammal", scope: !54, file: !54, line: 235, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !386, file: !58, line: 1207)
!386 = !DISubprogram(name: "trunc", scope: !54, file: !54, line: 302, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !388, file: !58, line: 1208)
!388 = !DISubprogram(name: "truncf", scope: !54, file: !54, line: 302, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !390, file: !58, line: 1209)
!390 = !DISubprogram(name: "truncl", scope: !54, file: !54, line: 302, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !392, file: !394, line: 127)
!392 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !47, line: 62, baseType: !393)
!393 = !DICompositeType(tag: DW_TAG_structure_type, file: !47, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!394 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdlib", directory: "")
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !396, file: !394, line: 128)
!396 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !47, line: 70, baseType: !397)
!397 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !47, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !398, identifier: "_ZTS6ldiv_t")
!398 = !{!399, !400}
!399 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !397, file: !47, line: 68, baseType: !275, size: 64)
!400 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !397, file: !47, line: 69, baseType: !275, size: 64, offset: 64)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !402, file: !394, line: 130)
!402 = !DISubprogram(name: "abort", scope: !47, file: !47, line: 591, type: !403, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!403 = !DISubroutineType(types: !404)
!404 = !{null}
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !406, file: !394, line: 134)
!406 = !DISubprogram(name: "atexit", scope: !47, file: !47, line: 595, type: !407, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!407 = !DISubroutineType(types: !408)
!408 = !{!50, !409}
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !403, size: 64)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !411, file: !394, line: 137)
!411 = !DISubprogram(name: "at_quick_exit", scope: !47, file: !47, line: 600, type: !407, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !413, file: !394, line: 140)
!413 = !DISubprogram(name: "atof", scope: !414, file: !414, line: 25, type: !292, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!414 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "48f612e342a3b16120b9f0760cf29677")
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !416, file: !394, line: 141)
!416 = !DISubprogram(name: "atoi", scope: !47, file: !47, line: 361, type: !417, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!417 = !DISubroutineType(types: !418)
!418 = !{!50, !294}
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !420, file: !394, line: 142)
!420 = !DISubprogram(name: "atol", scope: !47, file: !47, line: 366, type: !421, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!421 = !DISubroutineType(types: !422)
!422 = !{!275, !294}
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !424, file: !394, line: 143)
!424 = !DISubprogram(name: "bsearch", scope: !425, file: !425, line: 20, type: !426, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!425 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "ef5679a99236861b72c28d9a752239e4")
!426 = !DISubroutineType(types: !427)
!427 = !{!428, !429, !429, !431, !431, !434}
!428 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!429 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !430, size: 64)
!430 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!431 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !432, line: 46, baseType: !433)
!432 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!433 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!434 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !47, line: 808, baseType: !435)
!435 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !436, size: 64)
!436 = !DISubroutineType(types: !437)
!437 = !{!50, !429, !429}
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !439, file: !394, line: 144)
!439 = !DISubprogram(name: "calloc", scope: !47, file: !47, line: 542, type: !440, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!440 = !DISubroutineType(types: !441)
!441 = !{!428, !431, !431}
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !443, file: !394, line: 145)
!443 = !DISubprogram(name: "div", scope: !47, file: !47, line: 852, type: !444, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!444 = !DISubroutineType(types: !445)
!445 = !{!392, !50, !50}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !447, file: !394, line: 146)
!447 = !DISubprogram(name: "exit", scope: !47, file: !47, line: 617, type: !448, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!448 = !DISubroutineType(types: !449)
!449 = !{null, !50}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !451, file: !394, line: 147)
!451 = !DISubprogram(name: "free", scope: !47, file: !47, line: 565, type: !452, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!452 = !DISubroutineType(types: !453)
!453 = !{null, !428}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !455, file: !394, line: 148)
!455 = !DISubprogram(name: "getenv", scope: !47, file: !47, line: 634, type: !456, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!456 = !DISubroutineType(types: !457)
!457 = !{!458, !294}
!458 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !296, size: 64)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !460, file: !394, line: 149)
!460 = !DISubprogram(name: "labs", scope: !47, file: !47, line: 841, type: !461, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!461 = !DISubroutineType(types: !462)
!462 = !{!275, !275}
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !464, file: !394, line: 150)
!464 = !DISubprogram(name: "ldiv", scope: !47, file: !47, line: 854, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!465 = !DISubroutineType(types: !466)
!466 = !{!396, !275, !275}
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !468, file: !394, line: 151)
!468 = !DISubprogram(name: "malloc", scope: !47, file: !47, line: 539, type: !469, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!469 = !DISubroutineType(types: !470)
!470 = !{!428, !431}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !472, file: !394, line: 153)
!472 = !DISubprogram(name: "mblen", scope: !47, file: !47, line: 922, type: !473, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!473 = !DISubroutineType(types: !474)
!474 = !{!50, !294, !431}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !476, file: !394, line: 154)
!476 = !DISubprogram(name: "mbstowcs", scope: !47, file: !47, line: 933, type: !477, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!477 = !DISubroutineType(types: !478)
!478 = !{!431, !479, !482, !431}
!479 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !480)
!480 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !481, size: 64)
!481 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!482 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !294)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !484, file: !394, line: 155)
!484 = !DISubprogram(name: "mbtowc", scope: !47, file: !47, line: 925, type: !485, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!485 = !DISubroutineType(types: !486)
!486 = !{!50, !479, !482, !431}
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !488, file: !394, line: 157)
!488 = !DISubprogram(name: "qsort", scope: !47, file: !47, line: 830, type: !489, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!489 = !DISubroutineType(types: !490)
!490 = !{null, !428, !431, !431, !434}
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !492, file: !394, line: 160)
!492 = !DISubprogram(name: "quick_exit", scope: !47, file: !47, line: 623, type: !448, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !494, file: !394, line: 163)
!494 = !DISubprogram(name: "rand", scope: !47, file: !47, line: 453, type: !495, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!495 = !DISubroutineType(types: !496)
!496 = !{!50}
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !498, file: !394, line: 164)
!498 = !DISubprogram(name: "realloc", scope: !47, file: !47, line: 550, type: !499, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!499 = !DISubroutineType(types: !500)
!500 = !{!428, !428, !431}
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !502, file: !394, line: 165)
!502 = !DISubprogram(name: "srand", scope: !47, file: !47, line: 455, type: !503, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!503 = !DISubroutineType(types: !504)
!504 = !{null, !7}
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !506, file: !394, line: 166)
!506 = !DISubprogram(name: "strtod", scope: !47, file: !47, line: 117, type: !507, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!507 = !DISubroutineType(types: !508)
!508 = !{!57, !482, !509}
!509 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !510)
!510 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !458, size: 64)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !512, file: !394, line: 167)
!512 = !DISubprogram(name: "strtol", scope: !47, file: !47, line: 176, type: !513, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!513 = !DISubroutineType(types: !514)
!514 = !{!275, !482, !509, !50}
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !516, file: !394, line: 168)
!516 = !DISubprogram(name: "strtoul", scope: !47, file: !47, line: 180, type: !517, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!517 = !DISubroutineType(types: !518)
!518 = !{!433, !482, !509, !50}
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !520, file: !394, line: 169)
!520 = !DISubprogram(name: "system", scope: !47, file: !47, line: 784, type: !417, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !522, file: !394, line: 171)
!522 = !DISubprogram(name: "wcstombs", scope: !47, file: !47, line: 936, type: !523, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!523 = !DISubroutineType(types: !524)
!524 = !{!431, !525, !526, !431}
!525 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !458)
!526 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !527)
!527 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !528, size: 64)
!528 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !481)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !530, file: !394, line: 172)
!530 = !DISubprogram(name: "wctomb", scope: !47, file: !47, line: 929, type: !531, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!531 = !DISubroutineType(types: !532)
!532 = !{!50, !458, !481}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !534, file: !394, line: 200)
!534 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !47, line: 80, baseType: !535)
!535 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !47, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !536, identifier: "_ZTS7lldiv_t")
!536 = !{!537, !538}
!537 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !535, file: !47, line: 78, baseType: !238, size: 64)
!538 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !535, file: !47, line: 79, baseType: !238, size: 64, offset: 64)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !540, file: !394, line: 206)
!540 = !DISubprogram(name: "_Exit", scope: !47, file: !47, line: 629, type: !448, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !542, file: !394, line: 210)
!542 = !DISubprogram(name: "llabs", scope: !47, file: !47, line: 844, type: !543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!543 = !DISubroutineType(types: !544)
!544 = !{!238, !238}
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !546, file: !394, line: 216)
!546 = !DISubprogram(name: "lldiv", scope: !47, file: !47, line: 858, type: !547, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!547 = !DISubroutineType(types: !548)
!548 = !{!534, !238, !238}
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !550, file: !394, line: 227)
!550 = !DISubprogram(name: "atoll", scope: !47, file: !47, line: 373, type: !551, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!551 = !DISubroutineType(types: !552)
!552 = !{!238, !294}
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !554, file: !394, line: 228)
!554 = !DISubprogram(name: "strtoll", scope: !47, file: !47, line: 200, type: !555, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!555 = !DISubroutineType(types: !556)
!556 = !{!238, !482, !509, !50}
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !558, file: !394, line: 229)
!558 = !DISubprogram(name: "strtoull", scope: !47, file: !47, line: 205, type: !559, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!559 = !DISubroutineType(types: !560)
!560 = !{!561, !482, !509, !50}
!561 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !563, file: !394, line: 231)
!563 = !DISubprogram(name: "strtof", scope: !47, file: !47, line: 123, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!564 = !DISubroutineType(types: !565)
!565 = !{!116, !482, !509}
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !567, file: !394, line: 232)
!567 = !DISubprogram(name: "strtold", scope: !47, file: !47, line: 126, type: !568, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!568 = !DISubroutineType(types: !569)
!569 = !{!127, !482, !509}
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !534, file: !394, line: 240)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !540, file: !394, line: 242)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !542, file: !394, line: 244)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !574, file: !394, line: 245)
!574 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !6, file: !394, line: 213, type: !547, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !546, file: !394, line: 246)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !550, file: !394, line: 248)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !563, file: !394, line: 249)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !554, file: !394, line: 250)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !558, file: !394, line: 251)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !567, file: !394, line: 252)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !402, file: !582, line: 38)
!582 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "4cd0241d66f1b357b386fcd60bc71b0f")
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !406, file: !582, line: 39)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !447, file: !582, line: 40)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !411, file: !582, line: 43)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !492, file: !582, line: 46)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !392, file: !582, line: 51)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !396, file: !582, line: 52)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !590, file: !582, line: 54)
!590 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !45, file: !51, line: 79, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !413, file: !582, line: 55)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !416, file: !582, line: 56)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !420, file: !582, line: 57)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !424, file: !582, line: 58)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !439, file: !582, line: 59)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !574, file: !582, line: 60)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !451, file: !582, line: 61)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !455, file: !582, line: 62)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !460, file: !582, line: 63)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !464, file: !582, line: 64)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !468, file: !582, line: 65)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !472, file: !582, line: 67)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !476, file: !582, line: 68)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !484, file: !582, line: 69)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !488, file: !582, line: 71)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !494, file: !582, line: 72)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !498, file: !582, line: 73)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !502, file: !582, line: 74)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !506, file: !582, line: 75)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !512, file: !582, line: 76)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !516, file: !582, line: 77)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !520, file: !582, line: 78)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !522, file: !582, line: 80)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !530, file: !582, line: 81)
!615 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !616, entity: !617, file: !618, line: 58)
!616 = !DINamespace(name: "__gnu_debug", scope: null)
!617 = !DINamespace(name: "__debug", scope: !45)
!618 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "1e1a444391d862db9c9b259fde858dd4")
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !620, file: !621, line: 57)
!620 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !622, file: !621, line: 79, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!621 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "ad32556413cf4ca6a852273de62d0a18")
!622 = !DINamespace(name: "__exception_ptr", scope: !45)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !622, entity: !624, file: !621, line: 73)
!624 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !45, file: !621, line: 69, type: !625, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!625 = !DISubroutineType(types: !626)
!626 = !{null, !620}
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !628, file: !629, line: 200)
!628 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !629, file: !629, line: 28, type: !55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!629 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !631, file: !629, line: 201)
!631 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !629, file: !629, line: 32, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !633, file: !629, line: 202)
!633 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !629, file: !629, line: 34, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !635, file: !629, line: 203)
!635 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !629, file: !629, line: 36, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !637, file: !629, line: 204)
!637 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !629, file: !629, line: 38, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !639, file: !629, line: 205)
!639 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !629, file: !629, line: 42, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !641, file: !629, line: 206)
!641 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !629, file: !629, line: 40, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !643, file: !629, line: 207)
!643 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !629, file: !629, line: 44, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !645, file: !629, line: 208)
!645 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !629, file: !629, line: 46, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !647, file: !629, line: 209)
!647 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !629, file: !629, line: 48, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !649, file: !629, line: 210)
!649 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !629, file: !629, line: 50, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !651, file: !629, line: 211)
!651 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !629, file: !629, line: 52, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !653, file: !629, line: 212)
!653 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !629, file: !629, line: 54, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !655, file: !629, line: 213)
!655 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !629, file: !629, line: 58, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !657, file: !629, line: 214)
!657 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !629, file: !629, line: 56, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !659, file: !629, line: 215)
!659 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !629, file: !629, line: 62, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !661, file: !629, line: 216)
!661 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !629, file: !629, line: 60, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !663, file: !629, line: 217)
!663 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !629, file: !629, line: 64, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !665, file: !629, line: 218)
!665 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !629, file: !629, line: 66, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !667, file: !629, line: 219)
!667 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !629, file: !629, line: 68, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !669, file: !629, line: 220)
!669 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !629, file: !629, line: 70, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !671, file: !629, line: 221)
!671 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !629, file: !629, line: 72, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !673, file: !629, line: 222)
!673 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !629, file: !629, line: 74, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !675, file: !629, line: 223)
!675 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !629, file: !629, line: 76, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !677, file: !629, line: 224)
!677 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !629, file: !629, line: 78, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !679, file: !629, line: 225)
!679 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !629, file: !629, line: 80, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !681, file: !629, line: 226)
!681 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !629, file: !629, line: 82, type: !682, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!682 = !DISubroutineType(types: !683)
!683 = !{!116, !116, !85}
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !685, file: !629, line: 227)
!685 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !629, file: !629, line: 84, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !687, file: !629, line: 228)
!687 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !629, file: !629, line: 86, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !689, file: !629, line: 229)
!689 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !629, file: !629, line: 91, type: !690, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!690 = !DISubroutineType(types: !691)
!691 = !{!692, !116}
!692 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !694, file: !629, line: 230)
!694 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !629, file: !629, line: 95, type: !695, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!695 = !DISubroutineType(types: !696)
!696 = !{!692, !116, !116}
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !698, file: !629, line: 231)
!698 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !629, file: !629, line: 94, type: !695, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !700, file: !629, line: 232)
!700 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !629, file: !629, line: 100, type: !690, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !702, file: !629, line: 233)
!702 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !629, file: !629, line: 104, type: !695, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !704, file: !629, line: 234)
!704 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !629, file: !629, line: 103, type: !695, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !706, file: !629, line: 235)
!706 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !629, file: !629, line: 106, type: !695, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !708, file: !629, line: 236)
!708 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !629, file: !629, line: 111, type: !690, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !710, file: !629, line: 237)
!710 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !629, file: !629, line: 113, type: !690, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !712, file: !629, line: 238)
!712 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !629, file: !629, line: 115, type: !695, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !714, file: !629, line: 239)
!714 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !629, file: !629, line: 116, type: !461, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !716, file: !629, line: 240)
!716 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !629, file: !629, line: 118, type: !373, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !718, file: !629, line: 241)
!718 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !629, file: !629, line: 120, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !720, file: !629, line: 242)
!720 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !629, file: !629, line: 121, type: !543, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !722, file: !629, line: 243)
!722 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !629, file: !629, line: 123, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !724, file: !629, line: 244)
!724 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !629, file: !629, line: 133, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !726, file: !629, line: 245)
!726 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !629, file: !629, line: 125, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !728, file: !629, line: 246)
!728 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !629, file: !629, line: 127, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !730, file: !629, line: 247)
!730 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !629, file: !629, line: 129, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !732, file: !629, line: 248)
!732 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !629, file: !629, line: 131, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !734, file: !629, line: 249)
!734 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !629, file: !629, line: 135, type: !278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !736, file: !629, line: 250)
!736 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !629, file: !629, line: 137, type: !278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !738, file: !629, line: 251)
!738 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !629, file: !629, line: 138, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !740, file: !629, line: 252)
!740 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !629, file: !629, line: 140, type: !741, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!741 = !DISubroutineType(types: !742)
!742 = !{!116, !116, !743}
!743 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !745, file: !629, line: 253)
!745 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !629, file: !629, line: 141, type: !292, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !747, file: !629, line: 254)
!747 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !629, file: !629, line: 142, type: !299, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !749, file: !629, line: 255)
!749 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !629, file: !629, line: 144, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !751, file: !629, line: 256)
!751 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !629, file: !629, line: 146, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !753, file: !629, line: 257)
!753 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !629, file: !629, line: 150, type: !373, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !755, file: !629, line: 258)
!755 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !629, file: !629, line: 152, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !757, file: !629, line: 259)
!757 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !629, file: !629, line: 154, type: !339, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !759, file: !629, line: 260)
!759 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !629, file: !629, line: 156, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !761, file: !629, line: 261)
!761 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !629, file: !629, line: 158, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !763, file: !629, line: 262)
!763 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !629, file: !629, line: 160, type: !363, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !765, file: !629, line: 263)
!765 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !629, file: !629, line: 162, type: !373, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !767, file: !629, line: 264)
!767 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !629, file: !629, line: 167, type: !690, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !769, file: !629, line: 265)
!769 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !629, file: !629, line: 169, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !771, file: !629, line: 266)
!771 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !629, file: !629, line: 171, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !773, file: !629, line: 267)
!773 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !629, file: !629, line: 173, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !775, file: !629, line: 268)
!775 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !629, file: !629, line: 175, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !777, file: !629, line: 269)
!777 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !629, file: !629, line: 177, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !779, file: !629, line: 270)
!779 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !629, file: !629, line: 179, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !781, file: !629, line: 271)
!781 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !629, file: !629, line: 181, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !783, file: !785, line: 729)
!783 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !784, file: !784, line: 188, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!784 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "77b108a711ff1d970d6aaeeab7921660")
!785 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "0af09435178b3f6de185f06c3a9cbb63")
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !787, file: !785, line: 730)
!787 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !784, file: !784, line: 191, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !789, file: !785, line: 731)
!789 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !784, file: !784, line: 194, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !791, file: !785, line: 732)
!791 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !784, file: !784, line: 197, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !793, file: !785, line: 733)
!793 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !784, file: !784, line: 200, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !795, file: !785, line: 734)
!795 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !784, file: !784, line: 203, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !797, file: !785, line: 735)
!797 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !784, file: !784, line: 206, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !799, file: !785, line: 736)
!799 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !784, file: !784, line: 209, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !801, file: !785, line: 737)
!801 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !784, file: !784, line: 212, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !803, file: !785, line: 738)
!803 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !784, file: !784, line: 215, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !805, file: !785, line: 739)
!805 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !784, file: !784, line: 218, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !807, file: !785, line: 740)
!807 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !784, file: !784, line: 221, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !809, file: !785, line: 741)
!809 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !784, file: !784, line: 233, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !811, file: !785, line: 742)
!811 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !784, file: !784, line: 242, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !813, file: !785, line: 743)
!813 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !784, file: !784, line: 251, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !815, file: !785, line: 744)
!815 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !784, file: !784, line: 254, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !817, file: !785, line: 745)
!817 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !784, file: !784, line: 257, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !819, file: !785, line: 746)
!819 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !784, file: !784, line: 260, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !821, file: !785, line: 747)
!821 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !784, file: !784, line: 263, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !823, file: !785, line: 748)
!823 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !784, file: !784, line: 269, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !825, file: !785, line: 749)
!825 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !784, file: !784, line: 272, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !827, file: !785, line: 750)
!827 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !784, file: !784, line: 277, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !829, file: !785, line: 751)
!829 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !784, file: !784, line: 280, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !831, file: !785, line: 752)
!831 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !784, file: !784, line: 283, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !833, file: !785, line: 753)
!833 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !784, file: !784, line: 286, type: !682, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !835, file: !785, line: 754)
!835 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !784, file: !784, line: 299, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !837, file: !785, line: 755)
!837 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !784, file: !784, line: 302, type: !222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !839, file: !785, line: 756)
!839 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !784, file: !784, line: 341, type: !373, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !841, file: !785, line: 757)
!841 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !784, file: !784, line: 344, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !843, file: !785, line: 758)
!843 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !784, file: !784, line: 347, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !845, file: !785, line: 759)
!845 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !784, file: !784, line: 350, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !847, file: !785, line: 760)
!847 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !784, file: !784, line: 353, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !849, file: !785, line: 761)
!849 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !784, file: !784, line: 356, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !851, file: !785, line: 762)
!851 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !784, file: !784, line: 359, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !853, file: !785, line: 763)
!853 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !784, file: !784, line: 365, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !855, file: !785, line: 764)
!855 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !784, file: !784, line: 368, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !857, file: !785, line: 765)
!857 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !784, file: !784, line: 371, type: !278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !859, file: !785, line: 766)
!859 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !784, file: !784, line: 374, type: !278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !861, file: !785, line: 767)
!861 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !784, file: !784, line: 377, type: !741, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !863, file: !785, line: 768)
!863 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !784, file: !784, line: 413, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !865, file: !785, line: 769)
!865 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !784, file: !784, line: 416, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !867, file: !785, line: 771)
!867 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !784, file: !784, line: 449, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !869, file: !785, line: 772)
!869 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !784, file: !784, line: 474, type: !150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !871, file: !785, line: 773)
!871 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !784, file: !784, line: 479, type: !339, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !873, file: !785, line: 774)
!873 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !784, file: !784, line: 495, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !875, file: !785, line: 775)
!875 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !784, file: !784, line: 520, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !877, file: !785, line: 776)
!877 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !784, file: !784, line: 526, type: !363, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !879, file: !785, line: 777)
!879 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !784, file: !784, line: 532, type: !373, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !881, file: !785, line: 778)
!881 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !784, file: !784, line: 560, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !883, file: !785, line: 779)
!883 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !784, file: !784, line: 563, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !885, file: !785, line: 780)
!885 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !784, file: !784, line: 569, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !887, file: !785, line: 781)
!887 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !784, file: !784, line: 572, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !889, file: !785, line: 782)
!889 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !784, file: !784, line: 575, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !891, file: !785, line: 783)
!891 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !784, file: !784, line: 578, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !893, file: !785, line: 784)
!893 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !784, file: !784, line: 581, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !895, file: !910, line: 64)
!895 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !896, line: 6, baseType: !897)
!896 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!897 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !898, line: 21, baseType: !899)
!898 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!899 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !898, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !900, identifier: "_ZTS11__mbstate_t")
!900 = !{!901, !902}
!901 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !899, file: !898, line: 15, baseType: !50, size: 32)
!902 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !899, file: !898, line: 20, baseType: !903, size: 32, offset: 32)
!903 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !899, file: !898, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !904, identifier: "_ZTSN11__mbstate_tUt_E")
!904 = !{!905, !906}
!905 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !903, file: !898, line: 18, baseType: !7, size: 32)
!906 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !903, file: !898, line: 19, baseType: !907, size: 32)
!907 = !DICompositeType(tag: DW_TAG_array_type, baseType: !296, size: 32, elements: !908)
!908 = !{!909}
!909 = !DISubrange(count: 4)
!910 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cwchar", directory: "")
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !912, file: !910, line: 141)
!912 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !913, line: 20, baseType: !7)
!913 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !915, file: !910, line: 143)
!915 = !DISubprogram(name: "btowc", scope: !916, file: !916, line: 318, type: !917, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!916 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "8900d9ecbbe40d052c41becfbc5b5531")
!917 = !DISubroutineType(types: !918)
!918 = !{!912, !50}
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !920, file: !910, line: 144)
!920 = !DISubprogram(name: "fgetwc", scope: !916, file: !916, line: 726, type: !921, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!921 = !DISubroutineType(types: !922)
!922 = !{!912, !923}
!923 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !924, size: 64)
!924 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !925, line: 5, baseType: !926)
!925 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!926 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !927, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !928, identifier: "_ZTS8_IO_FILE")
!927 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "f3c970561f3408448ce03a9676ead8f4")
!928 = !{!929, !930, !931, !932, !933, !934, !935, !936, !937, !938, !939, !940, !941, !944, !946, !947, !948, !950, !952, !954, !958, !961, !963, !966, !969, !970, !971, !972, !973}
!929 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !926, file: !927, line: 51, baseType: !50, size: 32)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !926, file: !927, line: 54, baseType: !458, size: 64, offset: 64)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !926, file: !927, line: 55, baseType: !458, size: 64, offset: 128)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !926, file: !927, line: 56, baseType: !458, size: 64, offset: 192)
!933 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !926, file: !927, line: 57, baseType: !458, size: 64, offset: 256)
!934 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !926, file: !927, line: 58, baseType: !458, size: 64, offset: 320)
!935 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !926, file: !927, line: 59, baseType: !458, size: 64, offset: 384)
!936 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !926, file: !927, line: 60, baseType: !458, size: 64, offset: 448)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !926, file: !927, line: 61, baseType: !458, size: 64, offset: 512)
!938 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !926, file: !927, line: 64, baseType: !458, size: 64, offset: 576)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !926, file: !927, line: 65, baseType: !458, size: 64, offset: 640)
!940 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !926, file: !927, line: 66, baseType: !458, size: 64, offset: 704)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !926, file: !927, line: 68, baseType: !942, size: 64, offset: 768)
!942 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !943, size: 64)
!943 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !927, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!944 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !926, file: !927, line: 70, baseType: !945, size: 64, offset: 832)
!945 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !926, size: 64)
!946 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !926, file: !927, line: 72, baseType: !50, size: 32, offset: 896)
!947 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !926, file: !927, line: 73, baseType: !50, size: 32, offset: 928)
!948 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !926, file: !927, line: 74, baseType: !949, size: 64, offset: 960)
!949 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !36, line: 152, baseType: !275)
!950 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !926, file: !927, line: 77, baseType: !951, size: 16, offset: 1024)
!951 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!952 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !926, file: !927, line: 78, baseType: !953, size: 8, offset: 1040)
!953 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!954 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !926, file: !927, line: 79, baseType: !955, size: 8, offset: 1048)
!955 = !DICompositeType(tag: DW_TAG_array_type, baseType: !296, size: 8, elements: !956)
!956 = !{!957}
!957 = !DISubrange(count: 1)
!958 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !926, file: !927, line: 81, baseType: !959, size: 64, offset: 1088)
!959 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !960, size: 64)
!960 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !927, line: 43, baseType: null)
!961 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !926, file: !927, line: 89, baseType: !962, size: 64, offset: 1152)
!962 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !36, line: 153, baseType: !275)
!963 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !926, file: !927, line: 91, baseType: !964, size: 64, offset: 1216)
!964 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !965, size: 64)
!965 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !927, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!966 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !926, file: !927, line: 92, baseType: !967, size: 64, offset: 1280)
!967 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !968, size: 64)
!968 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !927, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!969 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !926, file: !927, line: 93, baseType: !945, size: 64, offset: 1344)
!970 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !926, file: !927, line: 94, baseType: !428, size: 64, offset: 1408)
!971 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !926, file: !927, line: 95, baseType: !431, size: 64, offset: 1472)
!972 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !926, file: !927, line: 96, baseType: !50, size: 32, offset: 1536)
!973 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !926, file: !927, line: 98, baseType: !974, size: 160, offset: 1568)
!974 = !DICompositeType(tag: DW_TAG_array_type, baseType: !296, size: 160, elements: !975)
!975 = !{!976}
!976 = !DISubrange(count: 20)
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !978, file: !910, line: 145)
!978 = !DISubprogram(name: "fgetws", scope: !916, file: !916, line: 755, type: !979, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!979 = !DISubroutineType(types: !980)
!980 = !{!480, !479, !50, !981}
!981 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !923)
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !983, file: !910, line: 146)
!983 = !DISubprogram(name: "fputwc", scope: !916, file: !916, line: 740, type: !984, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!984 = !DISubroutineType(types: !985)
!985 = !{!912, !481, !923}
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !987, file: !910, line: 147)
!987 = !DISubprogram(name: "fputws", scope: !916, file: !916, line: 762, type: !988, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!988 = !DISubroutineType(types: !989)
!989 = !{!50, !526, !981}
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !991, file: !910, line: 148)
!991 = !DISubprogram(name: "fwide", scope: !916, file: !916, line: 573, type: !992, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!992 = !DISubroutineType(types: !993)
!993 = !{!50, !923, !50}
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !995, file: !910, line: 149)
!995 = !DISubprogram(name: "fwprintf", scope: !916, file: !916, line: 580, type: !996, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!996 = !DISubroutineType(types: !997)
!997 = !{!50, !981, !526, null}
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !999, file: !910, line: 150)
!999 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !916, file: !916, line: 640, type: !996, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1001, file: !910, line: 151)
!1001 = !DISubprogram(name: "getwc", scope: !916, file: !916, line: 727, type: !921, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1003, file: !910, line: 152)
!1003 = !DISubprogram(name: "getwchar", scope: !916, file: !916, line: 733, type: !1004, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1004 = !DISubroutineType(types: !1005)
!1005 = !{!912}
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1007, file: !910, line: 153)
!1007 = !DISubprogram(name: "mbrlen", scope: !916, file: !916, line: 329, type: !1008, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1008 = !DISubroutineType(types: !1009)
!1009 = !{!431, !482, !431, !1010}
!1010 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1011)
!1011 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !895, size: 64)
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1013, file: !910, line: 154)
!1013 = !DISubprogram(name: "mbrtowc", scope: !916, file: !916, line: 296, type: !1014, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1014 = !DISubroutineType(types: !1015)
!1015 = !{!431, !479, !482, !431, !1010}
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1017, file: !910, line: 155)
!1017 = !DISubprogram(name: "mbsinit", scope: !916, file: !916, line: 292, type: !1018, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{!50, !1020}
!1020 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1021, size: 64)
!1021 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !895)
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1023, file: !910, line: 156)
!1023 = !DISubprogram(name: "mbsrtowcs", scope: !916, file: !916, line: 337, type: !1024, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{!431, !479, !1026, !431, !1010}
!1026 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1027)
!1027 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !294, size: 64)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1029, file: !910, line: 157)
!1029 = !DISubprogram(name: "putwc", scope: !916, file: !916, line: 741, type: !984, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1031, file: !910, line: 158)
!1031 = !DISubprogram(name: "putwchar", scope: !916, file: !916, line: 747, type: !1032, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{!912, !481}
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1035, file: !910, line: 160)
!1035 = !DISubprogram(name: "swprintf", scope: !916, file: !916, line: 590, type: !1036, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{!50, !479, !431, !526, null}
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1039, file: !910, line: 162)
!1039 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !916, file: !916, line: 647, type: !1040, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!50, !526, !526, null}
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1043, file: !910, line: 163)
!1043 = !DISubprogram(name: "ungetwc", scope: !916, file: !916, line: 770, type: !1044, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!912, !912, !923}
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1047, file: !910, line: 164)
!1047 = !DISubprogram(name: "vfwprintf", scope: !916, file: !916, line: 598, type: !1048, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1048 = !DISubroutineType(types: !1049)
!1049 = !{!50, !981, !526, !1050}
!1050 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1051, line: 32, baseType: !1052)
!1051 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stdarg.h", directory: "", checksumkind: CSK_MD5, checksum: "4de3cbd931b589d291e5c39387aecf82")
!1052 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1053, baseType: !458)
!1053 = !DIFile(filename: "test.C", directory: "/mnt/d/repos/SW4CK/src")
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1055, file: !910, line: 166)
!1055 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !916, file: !916, line: 693, type: !1048, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1057, file: !910, line: 169)
!1057 = !DISubprogram(name: "vswprintf", scope: !916, file: !916, line: 611, type: !1058, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1058 = !DISubroutineType(types: !1059)
!1059 = !{!50, !479, !431, !526, !1050}
!1060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1061, file: !910, line: 172)
!1061 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !916, file: !916, line: 700, type: !1062, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1062 = !DISubroutineType(types: !1063)
!1063 = !{!50, !526, !526, !1050}
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1065, file: !910, line: 174)
!1065 = !DISubprogram(name: "vwprintf", scope: !916, file: !916, line: 606, type: !1066, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1066 = !DISubroutineType(types: !1067)
!1067 = !{!50, !526, !1050}
!1068 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1069, file: !910, line: 176)
!1069 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !916, file: !916, line: 697, type: !1066, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1071, file: !910, line: 178)
!1071 = !DISubprogram(name: "wcrtomb", scope: !916, file: !916, line: 301, type: !1072, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!431, !525, !481, !1010}
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1075, file: !910, line: 179)
!1075 = !DISubprogram(name: "wcscat", scope: !916, file: !916, line: 97, type: !1076, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1076 = !DISubroutineType(types: !1077)
!1077 = !{!480, !479, !526}
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1079, file: !910, line: 180)
!1079 = !DISubprogram(name: "wcscmp", scope: !916, file: !916, line: 106, type: !1080, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!50, !527, !527}
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1083, file: !910, line: 181)
!1083 = !DISubprogram(name: "wcscoll", scope: !916, file: !916, line: 131, type: !1080, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1085, file: !910, line: 182)
!1085 = !DISubprogram(name: "wcscpy", scope: !916, file: !916, line: 87, type: !1076, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1087, file: !910, line: 183)
!1087 = !DISubprogram(name: "wcscspn", scope: !916, file: !916, line: 187, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!431, !527, !527}
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1091, file: !910, line: 184)
!1091 = !DISubprogram(name: "wcsftime", scope: !916, file: !916, line: 834, type: !1092, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1092 = !DISubroutineType(types: !1093)
!1093 = !{!431, !479, !431, !526, !1094}
!1094 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1095)
!1095 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1096, size: 64)
!1096 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1097)
!1097 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !916, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1099, file: !910, line: 185)
!1099 = !DISubprogram(name: "wcslen", scope: !916, file: !916, line: 222, type: !1100, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{!431, !527}
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1103, file: !910, line: 186)
!1103 = !DISubprogram(name: "wcsncat", scope: !916, file: !916, line: 101, type: !1104, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1104 = !DISubroutineType(types: !1105)
!1105 = !{!480, !479, !526, !431}
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1107, file: !910, line: 187)
!1107 = !DISubprogram(name: "wcsncmp", scope: !916, file: !916, line: 109, type: !1108, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1108 = !DISubroutineType(types: !1109)
!1109 = !{!50, !527, !527, !431}
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1111, file: !910, line: 188)
!1111 = !DISubprogram(name: "wcsncpy", scope: !916, file: !916, line: 92, type: !1104, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1113, file: !910, line: 189)
!1113 = !DISubprogram(name: "wcsrtombs", scope: !916, file: !916, line: 343, type: !1114, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1114 = !DISubroutineType(types: !1115)
!1115 = !{!431, !525, !1116, !431, !1010}
!1116 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1117)
!1117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !527, size: 64)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1119, file: !910, line: 190)
!1119 = !DISubprogram(name: "wcsspn", scope: !916, file: !916, line: 191, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1121, file: !910, line: 191)
!1121 = !DISubprogram(name: "wcstod", scope: !916, file: !916, line: 377, type: !1122, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1122 = !DISubroutineType(types: !1123)
!1123 = !{!57, !526, !1124}
!1124 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1125)
!1125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !480, size: 64)
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1127, file: !910, line: 193)
!1127 = !DISubprogram(name: "wcstof", scope: !916, file: !916, line: 382, type: !1128, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1128 = !DISubroutineType(types: !1129)
!1129 = !{!116, !526, !1124}
!1130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1131, file: !910, line: 195)
!1131 = !DISubprogram(name: "wcstok", scope: !916, file: !916, line: 217, type: !1132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1132 = !DISubroutineType(types: !1133)
!1133 = !{!480, !479, !526, !1124}
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1135, file: !910, line: 196)
!1135 = !DISubprogram(name: "wcstol", scope: !916, file: !916, line: 428, type: !1136, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!275, !526, !1124, !50}
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1139, file: !910, line: 197)
!1139 = !DISubprogram(name: "wcstoul", scope: !916, file: !916, line: 433, type: !1140, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1140 = !DISubroutineType(types: !1141)
!1141 = !{!433, !526, !1124, !50}
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1143, file: !910, line: 198)
!1143 = !DISubprogram(name: "wcsxfrm", scope: !916, file: !916, line: 135, type: !1144, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1144 = !DISubroutineType(types: !1145)
!1145 = !{!431, !479, !526, !431}
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1147, file: !910, line: 199)
!1147 = !DISubprogram(name: "wctob", scope: !916, file: !916, line: 324, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1148 = !DISubroutineType(types: !1149)
!1149 = !{!50, !912}
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1151, file: !910, line: 200)
!1151 = !DISubprogram(name: "wmemcmp", scope: !916, file: !916, line: 258, type: !1108, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1153, file: !910, line: 201)
!1153 = !DISubprogram(name: "wmemcpy", scope: !916, file: !916, line: 262, type: !1104, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1155, file: !910, line: 202)
!1155 = !DISubprogram(name: "wmemmove", scope: !916, file: !916, line: 267, type: !1156, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1156 = !DISubroutineType(types: !1157)
!1157 = !{!480, !480, !527, !431}
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1159, file: !910, line: 203)
!1159 = !DISubprogram(name: "wmemset", scope: !916, file: !916, line: 271, type: !1160, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1160 = !DISubroutineType(types: !1161)
!1161 = !{!480, !480, !481, !431}
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1163, file: !910, line: 204)
!1163 = !DISubprogram(name: "wprintf", scope: !916, file: !916, line: 587, type: !1164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1164 = !DISubroutineType(types: !1165)
!1165 = !{!50, !526, null}
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1167, file: !910, line: 205)
!1167 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !916, file: !916, line: 644, type: !1164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1169, file: !910, line: 206)
!1169 = !DISubprogram(name: "wcschr", scope: !916, file: !916, line: 164, type: !1170, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1170 = !DISubroutineType(types: !1171)
!1171 = !{!480, !527, !481}
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1173, file: !910, line: 207)
!1173 = !DISubprogram(name: "wcspbrk", scope: !916, file: !916, line: 201, type: !1174, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1174 = !DISubroutineType(types: !1175)
!1175 = !{!480, !527, !527}
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1177, file: !910, line: 208)
!1177 = !DISubprogram(name: "wcsrchr", scope: !916, file: !916, line: 174, type: !1170, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1179, file: !910, line: 209)
!1179 = !DISubprogram(name: "wcsstr", scope: !916, file: !916, line: 212, type: !1174, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1181, file: !910, line: 210)
!1181 = !DISubprogram(name: "wmemchr", scope: !916, file: !916, line: 253, type: !1182, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1182 = !DISubroutineType(types: !1183)
!1183 = !{!480, !527, !481, !431}
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !1185, file: !910, line: 251)
!1185 = !DISubprogram(name: "wcstold", scope: !916, file: !916, line: 384, type: !1186, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{!127, !526, !1124}
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !1189, file: !910, line: 260)
!1189 = !DISubprogram(name: "wcstoll", scope: !916, file: !916, line: 441, type: !1190, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1190 = !DISubroutineType(types: !1191)
!1191 = !{!238, !526, !1124, !50}
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !1193, file: !910, line: 261)
!1193 = !DISubprogram(name: "wcstoull", scope: !916, file: !916, line: 448, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1194 = !DISubroutineType(types: !1195)
!1195 = !{!561, !526, !1124, !50}
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1185, file: !910, line: 267)
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1189, file: !910, line: 268)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1193, file: !910, line: 269)
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1127, file: !910, line: 283)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1055, file: !910, line: 286)
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1061, file: !910, line: 289)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1069, file: !910, line: 292)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1185, file: !910, line: 296)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1189, file: !910, line: 297)
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1193, file: !910, line: 298)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1207, file: !1210, line: 47)
!1207 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1208, line: 24, baseType: !1209)
!1208 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "081edea97425b3437dded4a7fe223193")
!1209 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !36, line: 37, baseType: !953)
!1210 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdint", directory: "")
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1212, file: !1210, line: 48)
!1212 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1208, line: 25, baseType: !1213)
!1213 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !36, line: 39, baseType: !1214)
!1214 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1216, file: !1210, line: 49)
!1216 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1208, line: 26, baseType: !1217)
!1217 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !36, line: 41, baseType: !50)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1219, file: !1210, line: 50)
!1219 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1208, line: 27, baseType: !1220)
!1220 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !36, line: 44, baseType: !275)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1222, file: !1210, line: 52)
!1222 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1223, line: 58, baseType: !953)
!1223 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "24103e292ae21916e87130b926c8d2f8")
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1225, file: !1210, line: 53)
!1225 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1223, line: 60, baseType: !275)
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1227, file: !1210, line: 54)
!1227 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1223, line: 61, baseType: !275)
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1229, file: !1210, line: 55)
!1229 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1223, line: 62, baseType: !275)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1231, file: !1210, line: 57)
!1231 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1223, line: 43, baseType: !1232)
!1232 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !36, line: 52, baseType: !1209)
!1233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1234, file: !1210, line: 58)
!1234 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1223, line: 44, baseType: !1235)
!1235 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !36, line: 54, baseType: !1213)
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1237, file: !1210, line: 59)
!1237 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1223, line: 45, baseType: !1238)
!1238 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !36, line: 56, baseType: !1217)
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1240, file: !1210, line: 60)
!1240 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1223, line: 46, baseType: !1241)
!1241 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !36, line: 58, baseType: !1220)
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1243, file: !1210, line: 62)
!1243 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1223, line: 101, baseType: !1244)
!1244 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !36, line: 72, baseType: !275)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1246, file: !1210, line: 63)
!1246 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1223, line: 87, baseType: !275)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1248, file: !1210, line: 65)
!1248 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !34, line: 24, baseType: !1249)
!1249 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !36, line: 38, baseType: !1250)
!1250 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1252, file: !1210, line: 66)
!1252 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !34, line: 25, baseType: !1253)
!1253 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !36, line: 40, baseType: !951)
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !33, file: !1210, line: 67)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1256, file: !1210, line: 68)
!1256 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !34, line: 27, baseType: !1257)
!1257 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !36, line: 45, baseType: !433)
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1259, file: !1210, line: 70)
!1259 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1223, line: 71, baseType: !1250)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1261, file: !1210, line: 71)
!1261 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1223, line: 73, baseType: !433)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1263, file: !1210, line: 72)
!1263 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1223, line: 74, baseType: !433)
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1265, file: !1210, line: 73)
!1265 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1223, line: 75, baseType: !433)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1267, file: !1210, line: 75)
!1267 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1223, line: 49, baseType: !1268)
!1268 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !36, line: 53, baseType: !1249)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1270, file: !1210, line: 76)
!1270 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1223, line: 50, baseType: !1271)
!1271 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !36, line: 55, baseType: !1253)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1273, file: !1210, line: 77)
!1273 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1223, line: 51, baseType: !1274)
!1274 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !36, line: 57, baseType: !35)
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1276, file: !1210, line: 78)
!1276 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1223, line: 52, baseType: !1277)
!1277 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !36, line: 59, baseType: !1257)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1279, file: !1210, line: 80)
!1279 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1223, line: 102, baseType: !1280)
!1280 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !36, line: 73, baseType: !433)
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1282, file: !1210, line: 81)
!1282 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1223, line: 90, baseType: !433)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !1284, file: !1286, line: 44)
!1284 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !45, file: !1285, line: 258, baseType: !433)
!1285 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/x86_64-linux-gnu/c++/9/bits/c++config.h", directory: "", checksumkind: CSK_MD5, checksum: "f271377c6e7185560bbbc0bac2bc77fa")
!1286 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ext/new_allocator.h", directory: "", checksumkind: CSK_MD5, checksum: "d815d3ddb625b8849e2bd401d0f6b354")
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !1288, file: !1286, line: 45)
!1288 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !45, file: !1285, line: 259, baseType: !275)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1290, file: !1292, line: 53)
!1290 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1291, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1291 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "0cf373fc44eed8073800bdb9da87b72f")
!1292 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/clocale", directory: "")
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1294, file: !1292, line: 54)
!1294 = !DISubprogram(name: "setlocale", scope: !1291, file: !1291, line: 122, type: !1295, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!458, !50, !294}
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1298, file: !1292, line: 55)
!1298 = !DISubprogram(name: "localeconv", scope: !1291, file: !1291, line: 125, type: !1299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1299 = !DISubroutineType(types: !1300)
!1300 = !{!1301}
!1301 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1290, size: 64)
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1303, file: !1305, line: 64)
!1303 = !DISubprogram(name: "isalnum", scope: !1304, file: !1304, line: 108, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1304 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "36575f934ef4fe7e9d50a3cb17bd5c66")
!1305 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cctype", directory: "")
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1307, file: !1305, line: 65)
!1307 = !DISubprogram(name: "isalpha", scope: !1304, file: !1304, line: 109, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1309, file: !1305, line: 66)
!1309 = !DISubprogram(name: "iscntrl", scope: !1304, file: !1304, line: 110, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1311, file: !1305, line: 67)
!1311 = !DISubprogram(name: "isdigit", scope: !1304, file: !1304, line: 111, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1313, file: !1305, line: 68)
!1313 = !DISubprogram(name: "isgraph", scope: !1304, file: !1304, line: 113, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1315, file: !1305, line: 69)
!1315 = !DISubprogram(name: "islower", scope: !1304, file: !1304, line: 112, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1317, file: !1305, line: 70)
!1317 = !DISubprogram(name: "isprint", scope: !1304, file: !1304, line: 114, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1319, file: !1305, line: 71)
!1319 = !DISubprogram(name: "ispunct", scope: !1304, file: !1304, line: 115, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1321, file: !1305, line: 72)
!1321 = !DISubprogram(name: "isspace", scope: !1304, file: !1304, line: 116, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1323, file: !1305, line: 73)
!1323 = !DISubprogram(name: "isupper", scope: !1304, file: !1304, line: 117, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1325, file: !1305, line: 74)
!1325 = !DISubprogram(name: "isxdigit", scope: !1304, file: !1304, line: 118, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1327, file: !1305, line: 75)
!1327 = !DISubprogram(name: "tolower", scope: !1304, file: !1304, line: 122, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1329, file: !1305, line: 76)
!1329 = !DISubprogram(name: "toupper", scope: !1304, file: !1304, line: 125, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1331, file: !1305, line: 87)
!1331 = !DISubprogram(name: "isblank", scope: !1304, file: !1304, line: 130, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1333, file: !1335, line: 98)
!1333 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1334, line: 7, baseType: !926)
!1334 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1335 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdio", directory: "")
!1336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1337, file: !1335, line: 99)
!1337 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1338, line: 84, baseType: !1339)
!1338 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "5b917eded35ce2507d1e294bf8cb74d7")
!1339 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1340, line: 14, baseType: !1341)
!1340 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1341 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1340, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1343, file: !1335, line: 101)
!1343 = !DISubprogram(name: "clearerr", scope: !1338, file: !1338, line: 757, type: !1344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1344 = !DISubroutineType(types: !1345)
!1345 = !{null, !1346}
!1346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1333, size: 64)
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1348, file: !1335, line: 102)
!1348 = !DISubprogram(name: "fclose", scope: !1338, file: !1338, line: 213, type: !1349, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!50, !1346}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1352, file: !1335, line: 103)
!1352 = !DISubprogram(name: "feof", scope: !1338, file: !1338, line: 759, type: !1349, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1354, file: !1335, line: 104)
!1354 = !DISubprogram(name: "ferror", scope: !1338, file: !1338, line: 761, type: !1349, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1356, file: !1335, line: 105)
!1356 = !DISubprogram(name: "fflush", scope: !1338, file: !1338, line: 218, type: !1349, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1358, file: !1335, line: 106)
!1358 = !DISubprogram(name: "fgetc", scope: !1338, file: !1338, line: 485, type: !1349, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1360, file: !1335, line: 107)
!1360 = !DISubprogram(name: "fgetpos", scope: !1338, file: !1338, line: 731, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1361 = !DISubroutineType(types: !1362)
!1362 = !{!50, !1363, !1364}
!1363 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1346)
!1364 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1365)
!1365 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1337, size: 64)
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1367, file: !1335, line: 108)
!1367 = !DISubprogram(name: "fgets", scope: !1338, file: !1338, line: 564, type: !1368, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1368 = !DISubroutineType(types: !1369)
!1369 = !{!458, !525, !50, !1363}
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1371, file: !1335, line: 109)
!1371 = !DISubprogram(name: "fopen", scope: !1338, file: !1338, line: 246, type: !1372, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1372 = !DISubroutineType(types: !1373)
!1373 = !{!1346, !482, !482}
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1375, file: !1335, line: 110)
!1375 = !DISubprogram(name: "fprintf", scope: !1338, file: !1338, line: 326, type: !1376, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1376 = !DISubroutineType(types: !1377)
!1377 = !{!50, !1363, !482, null}
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1379, file: !1335, line: 111)
!1379 = !DISubprogram(name: "fputc", scope: !1338, file: !1338, line: 521, type: !1380, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1380 = !DISubroutineType(types: !1381)
!1381 = !{!50, !50, !1346}
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1383, file: !1335, line: 112)
!1383 = !DISubprogram(name: "fputs", scope: !1338, file: !1338, line: 626, type: !1384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{!50, !482, !1363}
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1387, file: !1335, line: 113)
!1387 = !DISubprogram(name: "fread", scope: !1338, file: !1338, line: 646, type: !1388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1388 = !DISubroutineType(types: !1389)
!1389 = !{!431, !1390, !431, !431, !1363}
!1390 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !428)
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1392, file: !1335, line: 114)
!1392 = !DISubprogram(name: "freopen", scope: !1338, file: !1338, line: 252, type: !1393, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1393 = !DISubroutineType(types: !1394)
!1394 = !{!1346, !482, !482, !1363}
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1396, file: !1335, line: 115)
!1396 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !1338, file: !1338, line: 407, type: !1376, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1398, file: !1335, line: 116)
!1398 = !DISubprogram(name: "fseek", scope: !1338, file: !1338, line: 684, type: !1399, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1399 = !DISubroutineType(types: !1400)
!1400 = !{!50, !1346, !275, !50}
!1401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1402, file: !1335, line: 117)
!1402 = !DISubprogram(name: "fsetpos", scope: !1338, file: !1338, line: 736, type: !1403, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1403 = !DISubroutineType(types: !1404)
!1404 = !{!50, !1346, !1405}
!1405 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1406, size: 64)
!1406 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1337)
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1408, file: !1335, line: 118)
!1408 = !DISubprogram(name: "ftell", scope: !1338, file: !1338, line: 689, type: !1409, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1409 = !DISubroutineType(types: !1410)
!1410 = !{!275, !1346}
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1412, file: !1335, line: 119)
!1412 = !DISubprogram(name: "fwrite", scope: !1338, file: !1338, line: 652, type: !1413, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1413 = !DISubroutineType(types: !1414)
!1414 = !{!431, !1415, !431, !431, !1363}
!1415 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !429)
!1416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1417, file: !1335, line: 120)
!1417 = !DISubprogram(name: "getc", scope: !1338, file: !1338, line: 486, type: !1349, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1419, file: !1335, line: 121)
!1419 = !DISubprogram(name: "getchar", scope: !1420, file: !1420, line: 47, type: !495, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1420 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "fe48be26b3c1dd399597f5e6205450c5")
!1421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1422, file: !1335, line: 126)
!1422 = !DISubprogram(name: "perror", scope: !1338, file: !1338, line: 775, type: !1423, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1423 = !DISubroutineType(types: !1424)
!1424 = !{null, !294}
!1425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1426, file: !1335, line: 127)
!1426 = !DISubprogram(name: "printf", scope: !1338, file: !1338, line: 332, type: !1427, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1427 = !DISubroutineType(types: !1428)
!1428 = !{!50, !482, null}
!1429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1430, file: !1335, line: 128)
!1430 = !DISubprogram(name: "putc", scope: !1338, file: !1338, line: 522, type: !1380, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1432, file: !1335, line: 129)
!1432 = !DISubprogram(name: "putchar", scope: !1420, file: !1420, line: 82, type: !48, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1434, file: !1335, line: 130)
!1434 = !DISubprogram(name: "puts", scope: !1338, file: !1338, line: 632, type: !417, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1436, file: !1335, line: 131)
!1436 = !DISubprogram(name: "remove", scope: !1338, file: !1338, line: 146, type: !417, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1438, file: !1335, line: 132)
!1438 = !DISubprogram(name: "rename", scope: !1338, file: !1338, line: 148, type: !1439, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1439 = !DISubroutineType(types: !1440)
!1440 = !{!50, !294, !294}
!1441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1442, file: !1335, line: 133)
!1442 = !DISubprogram(name: "rewind", scope: !1338, file: !1338, line: 694, type: !1344, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1444, file: !1335, line: 134)
!1444 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !1338, file: !1338, line: 410, type: !1427, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1446, file: !1335, line: 135)
!1446 = !DISubprogram(name: "setbuf", scope: !1338, file: !1338, line: 304, type: !1447, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{null, !1363, !525}
!1449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1450, file: !1335, line: 136)
!1450 = !DISubprogram(name: "setvbuf", scope: !1338, file: !1338, line: 308, type: !1451, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1451 = !DISubroutineType(types: !1452)
!1452 = !{!50, !1363, !525, !50, !431}
!1453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1454, file: !1335, line: 137)
!1454 = !DISubprogram(name: "sprintf", scope: !1338, file: !1338, line: 334, type: !1455, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1455 = !DISubroutineType(types: !1456)
!1456 = !{!50, !525, !482, null}
!1457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1458, file: !1335, line: 138)
!1458 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !1338, file: !1338, line: 412, type: !1459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1459 = !DISubroutineType(types: !1460)
!1460 = !{!50, !482, !482, null}
!1461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1462, file: !1335, line: 139)
!1462 = !DISubprogram(name: "tmpfile", scope: !1338, file: !1338, line: 173, type: !1463, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1463 = !DISubroutineType(types: !1464)
!1464 = !{!1346}
!1465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1466, file: !1335, line: 141)
!1466 = !DISubprogram(name: "tmpnam", scope: !1338, file: !1338, line: 187, type: !1467, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1467 = !DISubroutineType(types: !1468)
!1468 = !{!458, !458}
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1470, file: !1335, line: 143)
!1470 = !DISubprogram(name: "ungetc", scope: !1338, file: !1338, line: 639, type: !1380, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1472, file: !1335, line: 144)
!1472 = !DISubprogram(name: "vfprintf", scope: !1338, file: !1338, line: 341, type: !1473, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1473 = !DISubroutineType(types: !1474)
!1474 = !{!50, !1363, !482, !1050}
!1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1476, file: !1335, line: 145)
!1476 = !DISubprogram(name: "vprintf", scope: !1420, file: !1420, line: 39, type: !1477, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1477 = !DISubroutineType(types: !1478)
!1478 = !{!50, !482, !1050}
!1479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1480, file: !1335, line: 146)
!1480 = !DISubprogram(name: "vsprintf", scope: !1338, file: !1338, line: 349, type: !1481, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1481 = !DISubroutineType(types: !1482)
!1482 = !{!50, !525, !482, !1050}
!1483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !1484, file: !1335, line: 175)
!1484 = !DISubprogram(name: "snprintf", scope: !1338, file: !1338, line: 354, type: !1485, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1485 = !DISubroutineType(types: !1486)
!1486 = !{!50, !525, !431, !482, null}
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !1488, file: !1335, line: 176)
!1488 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !1338, file: !1338, line: 451, type: !1473, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !1490, file: !1335, line: 177)
!1490 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !1338, file: !1338, line: 456, type: !1477, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !1492, file: !1335, line: 178)
!1492 = !DISubprogram(name: "vsnprintf", scope: !1338, file: !1338, line: 358, type: !1493, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1493 = !DISubroutineType(types: !1494)
!1494 = !{!50, !525, !431, !482, !1050}
!1495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !1496, file: !1335, line: 179)
!1496 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !1338, file: !1338, line: 459, type: !1497, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1497 = !DISubroutineType(types: !1498)
!1498 = !{!50, !482, !482, !1050}
!1499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1484, file: !1335, line: 185)
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1488, file: !1335, line: 186)
!1501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1490, file: !1335, line: 187)
!1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1492, file: !1335, line: 188)
!1503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1496, file: !1335, line: 189)
!1504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1505, file: !1509, line: 82)
!1505 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1506, line: 48, baseType: !1507)
!1506 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "e83097fbf57cc71ea472db59df3ba75d")
!1507 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1508, size: 64)
!1508 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1217)
!1509 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cwctype", directory: "")
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1511, file: !1509, line: 83)
!1511 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1512, line: 38, baseType: !433)
!1512 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "3598b9d23ef5d76319026b46e316b55f")
!1513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !912, file: !1509, line: 84)
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1515, file: !1509, line: 86)
!1515 = !DISubprogram(name: "iswalnum", scope: !1512, file: !1512, line: 95, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1517, file: !1509, line: 87)
!1517 = !DISubprogram(name: "iswalpha", scope: !1512, file: !1512, line: 101, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1519, file: !1509, line: 89)
!1519 = !DISubprogram(name: "iswblank", scope: !1512, file: !1512, line: 146, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1521, file: !1509, line: 91)
!1521 = !DISubprogram(name: "iswcntrl", scope: !1512, file: !1512, line: 104, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1523, file: !1509, line: 92)
!1523 = !DISubprogram(name: "iswctype", scope: !1512, file: !1512, line: 159, type: !1524, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!50, !912, !1511}
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1527, file: !1509, line: 93)
!1527 = !DISubprogram(name: "iswdigit", scope: !1512, file: !1512, line: 108, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1529, file: !1509, line: 94)
!1529 = !DISubprogram(name: "iswgraph", scope: !1512, file: !1512, line: 112, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1531, file: !1509, line: 95)
!1531 = !DISubprogram(name: "iswlower", scope: !1512, file: !1512, line: 117, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1533, file: !1509, line: 96)
!1533 = !DISubprogram(name: "iswprint", scope: !1512, file: !1512, line: 120, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1535, file: !1509, line: 97)
!1535 = !DISubprogram(name: "iswpunct", scope: !1512, file: !1512, line: 125, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1537, file: !1509, line: 98)
!1537 = !DISubprogram(name: "iswspace", scope: !1512, file: !1512, line: 130, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1539, file: !1509, line: 99)
!1539 = !DISubprogram(name: "iswupper", scope: !1512, file: !1512, line: 135, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1541, file: !1509, line: 100)
!1541 = !DISubprogram(name: "iswxdigit", scope: !1512, file: !1512, line: 140, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1543, file: !1509, line: 101)
!1543 = !DISubprogram(name: "towctrans", scope: !1506, file: !1506, line: 55, type: !1544, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1544 = !DISubroutineType(types: !1545)
!1545 = !{!912, !912, !1505}
!1546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1547, file: !1509, line: 102)
!1547 = !DISubprogram(name: "towlower", scope: !1512, file: !1512, line: 166, type: !1548, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1548 = !DISubroutineType(types: !1549)
!1549 = !{!912, !912}
!1550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1551, file: !1509, line: 103)
!1551 = !DISubprogram(name: "towupper", scope: !1512, file: !1512, line: 169, type: !1548, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1553, file: !1509, line: 104)
!1553 = !DISubprogram(name: "wctrans", scope: !1506, file: !1506, line: 52, type: !1554, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1554 = !DISubroutineType(types: !1555)
!1555 = !{!1505, !294}
!1556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1557, file: !1509, line: 105)
!1557 = !DISubprogram(name: "wctype", scope: !1512, file: !1512, line: 155, type: !1558, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1558 = !DISubroutineType(types: !1559)
!1559 = !{!1511, !294}
!1560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1561, file: !1564, line: 60)
!1561 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1562, line: 7, baseType: !1563)
!1562 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1563 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !36, line: 156, baseType: !275)
!1564 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ctime", directory: "")
!1565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1566, file: !1564, line: 61)
!1566 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1567, line: 7, baseType: !1568)
!1567 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "49b4e16ef1215de5afdbb283400ab90c")
!1568 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !36, line: 160, baseType: !275)
!1569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1097, file: !1564, line: 62)
!1570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1571, file: !1564, line: 64)
!1571 = !DISubprogram(name: "clock", scope: !1572, file: !1572, line: 72, type: !1573, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1572 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "2dc9fb937b28c900f98919b5c35320c2")
!1573 = !DISubroutineType(types: !1574)
!1574 = !{!1561}
!1575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1576, file: !1564, line: 65)
!1576 = !DISubprogram(name: "difftime", scope: !1572, file: !1572, line: 78, type: !1577, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1577 = !DISubroutineType(types: !1578)
!1578 = !{!57, !1566, !1566}
!1579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1580, file: !1564, line: 66)
!1580 = !DISubprogram(name: "mktime", scope: !1572, file: !1572, line: 82, type: !1581, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1581 = !DISubroutineType(types: !1582)
!1582 = !{!1566, !1583}
!1583 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1097, size: 64)
!1584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1585, file: !1564, line: 67)
!1585 = !DISubprogram(name: "time", scope: !1572, file: !1572, line: 75, type: !1586, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1586 = !DISubroutineType(types: !1587)
!1587 = !{!1566, !1588}
!1588 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1566, size: 64)
!1589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1590, file: !1564, line: 68)
!1590 = !DISubprogram(name: "asctime", scope: !1572, file: !1572, line: 139, type: !1591, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1591 = !DISubroutineType(types: !1592)
!1592 = !{!458, !1095}
!1593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1594, file: !1564, line: 69)
!1594 = !DISubprogram(name: "ctime", scope: !1572, file: !1572, line: 142, type: !1595, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1595 = !DISubroutineType(types: !1596)
!1596 = !{!458, !1597}
!1597 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1598, size: 64)
!1598 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1566)
!1599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1600, file: !1564, line: 70)
!1600 = !DISubprogram(name: "gmtime", scope: !1572, file: !1572, line: 119, type: !1601, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1601 = !DISubroutineType(types: !1602)
!1602 = !{!1583, !1597}
!1603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1604, file: !1564, line: 71)
!1604 = !DISubprogram(name: "localtime", scope: !1572, file: !1572, line: 123, type: !1601, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1606, file: !1564, line: 72)
!1606 = !DISubprogram(name: "strftime", scope: !1572, file: !1572, line: 88, type: !1607, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1607 = !DISubroutineType(types: !1608)
!1608 = !{!431, !525, !431, !482, !1094}
!1609 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1610, entity: !1611, file: !1613, line: 973)
!1610 = !DINamespace(name: "chrono", scope: !45)
!1611 = !DINamespace(name: "chrono_literals", scope: !1612, exportSymbols: true)
!1612 = !DINamespace(name: "literals", scope: !45, exportSymbols: true)
!1613 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/chrono", directory: "")
!1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1615, file: !1619, line: 77)
!1615 = !DISubprogram(name: "memchr", scope: !1616, file: !1616, line: 84, type: !1617, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1616 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "61f60112cf5c0a45c54ea1f595add24c")
!1617 = !DISubroutineType(types: !1618)
!1618 = !{!429, !429, !50, !431}
!1619 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstring", directory: "")
!1620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1621, file: !1619, line: 78)
!1621 = !DISubprogram(name: "memcmp", scope: !1616, file: !1616, line: 64, type: !1622, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1622 = !DISubroutineType(types: !1623)
!1623 = !{!50, !429, !429, !431}
!1624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1625, file: !1619, line: 79)
!1625 = !DISubprogram(name: "memcpy", scope: !1616, file: !1616, line: 43, type: !1626, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1626 = !DISubroutineType(types: !1627)
!1627 = !{!428, !1390, !1415, !431}
!1628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1629, file: !1619, line: 80)
!1629 = !DISubprogram(name: "memmove", scope: !1616, file: !1616, line: 47, type: !1630, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1630 = !DISubroutineType(types: !1631)
!1631 = !{!428, !428, !429, !431}
!1632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1633, file: !1619, line: 81)
!1633 = !DISubprogram(name: "memset", scope: !1616, file: !1616, line: 61, type: !1634, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1634 = !DISubroutineType(types: !1635)
!1635 = !{!428, !428, !50, !431}
!1636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1637, file: !1619, line: 82)
!1637 = !DISubprogram(name: "strcat", scope: !1616, file: !1616, line: 130, type: !1638, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1638 = !DISubroutineType(types: !1639)
!1639 = !{!458, !525, !482}
!1640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1641, file: !1619, line: 83)
!1641 = !DISubprogram(name: "strcmp", scope: !1616, file: !1616, line: 137, type: !1439, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1643, file: !1619, line: 84)
!1643 = !DISubprogram(name: "strcoll", scope: !1616, file: !1616, line: 144, type: !1439, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1645, file: !1619, line: 85)
!1645 = !DISubprogram(name: "strcpy", scope: !1616, file: !1616, line: 122, type: !1638, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1647, file: !1619, line: 86)
!1647 = !DISubprogram(name: "strcspn", scope: !1616, file: !1616, line: 273, type: !1648, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1648 = !DISubroutineType(types: !1649)
!1649 = !{!431, !294, !294}
!1650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1651, file: !1619, line: 87)
!1651 = !DISubprogram(name: "strerror", scope: !1616, file: !1616, line: 397, type: !1652, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1652 = !DISubroutineType(types: !1653)
!1653 = !{!458, !50}
!1654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1655, file: !1619, line: 88)
!1655 = !DISubprogram(name: "strlen", scope: !1616, file: !1616, line: 385, type: !1656, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1656 = !DISubroutineType(types: !1657)
!1657 = !{!431, !294}
!1658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1659, file: !1619, line: 89)
!1659 = !DISubprogram(name: "strncat", scope: !1616, file: !1616, line: 133, type: !1660, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1660 = !DISubroutineType(types: !1661)
!1661 = !{!458, !525, !482, !431}
!1662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1663, file: !1619, line: 90)
!1663 = !DISubprogram(name: "strncmp", scope: !1616, file: !1616, line: 140, type: !1664, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1664 = !DISubroutineType(types: !1665)
!1665 = !{!50, !294, !294, !431}
!1666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1667, file: !1619, line: 91)
!1667 = !DISubprogram(name: "strncpy", scope: !1616, file: !1616, line: 125, type: !1660, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1669, file: !1619, line: 92)
!1669 = !DISubprogram(name: "strspn", scope: !1616, file: !1616, line: 277, type: !1648, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1671, file: !1619, line: 93)
!1671 = !DISubprogram(name: "strtok", scope: !1616, file: !1616, line: 336, type: !1638, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1673, file: !1619, line: 94)
!1673 = !DISubprogram(name: "strxfrm", scope: !1616, file: !1616, line: 147, type: !1674, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1674 = !DISubroutineType(types: !1675)
!1675 = !{!431, !525, !482, !431}
!1676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1677, file: !1619, line: 95)
!1677 = !DISubprogram(name: "strchr", scope: !1616, file: !1616, line: 219, type: !1678, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1678 = !DISubroutineType(types: !1679)
!1679 = !{!294, !294, !50}
!1680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1681, file: !1619, line: 96)
!1681 = !DISubprogram(name: "strpbrk", scope: !1616, file: !1616, line: 296, type: !1682, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1682 = !DISubroutineType(types: !1683)
!1683 = !{!294, !294, !294}
!1684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1685, file: !1619, line: 97)
!1685 = !DISubprogram(name: "strrchr", scope: !1616, file: !1616, line: 246, type: !1678, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1687, file: !1619, line: 98)
!1687 = !DISubprogram(name: "strstr", scope: !1616, file: !1616, line: 323, type: !1682, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !4, file: !1689, line: 86)
!1689 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/shared_ptr_base.h", directory: "", checksumkind: CSK_MD5, checksum: "1733263deedfa36d980cec211a9e526a")
!1690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !1691, file: !1689, line: 87)
!1691 = !DIGlobalVariable(name: "__default_lock_policy", linkageName: "_ZN9__gnu_cxxL21__default_lock_policyE", scope: !6, file: !5, line: 53, type: !1692, isLocal: true, isDefinition: false)
!1692 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!1693 = distinct !DILifetime(object: !1694, location: !DIExpr(DIOpArg(0, %struct.__HIP_Coordinates addrspace(4)*), DIOpDeref(%struct.__HIP_Coordinates)), argObjects: {!1752})
!1694 = distinct !DIGlobalVariable(name: "threadIdx", linkageName: "_ZL9threadIdx", scope: !1, file: !1695, line: 377, type: !1696, isLocal: true, isDefinition: true)
!1695 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "0ac9823654812ba0fd0f0538bfae47a7")
!1696 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1697)
!1697 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_Coordinates<__HIP_ThreadIdx>", file: !1695, line: 296, size: 8, flags: DIFlagTypePassByValue, elements: !1698, templateParams: !1743, identifier: "_ZTS17__HIP_CoordinatesI15__HIP_ThreadIdxE")
!1698 = !{!1699, !1714, !1726, !1738}
!1699 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1697, file: !1695, line: 312, baseType: !1700, flags: DIFlagStaticMember)
!1700 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1701)
!1701 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__X", scope: !1697, file: !1695, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !1702, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XE")
!1702 = !{!1703, !1708}
!1703 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !1701, file: !1695, line: 300, type: !1704, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1704 = !DISubroutineType(types: !1705)
!1705 = !{!1706, !1707}
!1706 = !DIDerivedType(tag: DW_TAG_typedef, name: "R", scope: !1697, file: !1695, line: 297, baseType: !33)
!1707 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1700, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1708 = !DISubprogram(name: "operator+=", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XpLERKj", scope: !1701, file: !1695, line: 301, type: !1709, scopeLine: 301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1709 = !DISubroutineType(types: !1710)
!1710 = !{!1706, !1711, !1712}
!1711 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1701, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1712 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1713, size: 64)
!1713 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1706)
!1714 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1697, file: !1695, line: 313, baseType: !1715, flags: DIFlagStaticMember)
!1715 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1716)
!1716 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__Y", scope: !1697, file: !1695, line: 303, size: 8, flags: DIFlagTypePassByValue, elements: !1717, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YE")
!1717 = !{!1718, !1722}
!1718 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YcvjEv", scope: !1716, file: !1695, line: 304, type: !1719, scopeLine: 304, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1719 = !DISubroutineType(types: !1720)
!1720 = !{!1706, !1721}
!1721 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1715, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1722 = !DISubprogram(name: "operator+=", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__YpLERKj", scope: !1716, file: !1695, line: 305, type: !1723, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1723 = !DISubroutineType(types: !1724)
!1724 = !{!1706, !1725, !1712}
!1725 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1716, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1726 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1697, file: !1695, line: 314, baseType: !1727, flags: DIFlagStaticMember)
!1727 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1728)
!1728 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__Z", scope: !1697, file: !1695, line: 307, size: 8, flags: DIFlagTypePassByValue, elements: !1729, identifier: "_ZTSN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZE")
!1729 = !{!1730, !1734}
!1730 = !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZcvjEv", scope: !1728, file: !1695, line: 308, type: !1731, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1731 = !DISubroutineType(types: !1732)
!1732 = !{!1706, !1733}
!1733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1727, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1734 = !DISubprogram(name: "operator+=", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE3__ZpLERKj", scope: !1728, file: !1695, line: 309, type: !1735, scopeLine: 309, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1735 = !DISubroutineType(types: !1736)
!1736 = !{!1706, !1737, !1712}
!1737 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1728, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1738 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxEcv4dim3Ev", scope: !1697, file: !1695, line: 316, type: !1739, scopeLine: 316, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1739 = !DISubroutineType(types: !1740)
!1740 = !{!1741, !1742}
!1741 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !30, line: 941, baseType: !29)
!1742 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1696, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1743 = !{!1744}
!1744 = !DITemplateTypeParameter(name: "F", type: !1745)
!1745 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__HIP_ThreadIdx", file: !1695, line: 277, size: 8, flags: DIFlagTypePassByValue, elements: !1746, identifier: "_ZTS15__HIP_ThreadIdx")
!1746 = !{!1747}
!1747 = !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !1745, file: !1695, line: 279, type: !1748, scopeLine: 279, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1748 = !DISubroutineType(types: !1749)
!1749 = !{!33, !1750, !33}
!1750 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1751, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1751 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1745)
!1752 = distinct !DIFragment()
!1753 = distinct !DILifetime(object: !1754, location: !DIExpr(DIOpArg(0, %"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X" addrspace(4)*), DIOpDeref(%"struct.__HIP_Coordinates<__HIP_ThreadIdx>::__X")), argObjects: {!0})
!1754 = distinct !DIGlobalVariable(name: "x", linkageName: "_ZN17__HIP_CoordinatesI15__HIP_ThreadIdxE1xE", scope: !1, file: !1695, line: 324, type: !1700, isLocal: false, isDefinition: true, declaration: !1699)
!1755 = !{i32 7, !"Dwarf Version", i32 5}
!1756 = !{i32 2, !"Debug Info Version", i32 4}
!1757 = !{i32 1, !"wchar_size", i32 4}
!1758 = !{i32 7, !"PIC Level", i32 1}
!1759 = !{i32 2, i32 0}
!1760 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}
!1761 = distinct !DISubprogram(name: "__cxa_pure_virtual", scope: !1762, file: !1762, line: 37, type: !403, scopeLine: 37, flags: DIFlagPrototyped | DIFlagNoReturn | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1, retainedNodes: !1763)
!1762 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_runtime_wrapper.h", directory: "", checksumkind: CSK_MD5, checksum: "f46a95b6d3abe242ff5c464c7ecb8925")
!1763 = !{}
!1764 = !DILocation(line: 38, column: 5, scope: !1761)
!1765 = !DILocation(line: 39, column: 3, scope: !1761)
!1766 = distinct !DISubprogram(name: "__cxa_deleted_virtual", scope: !1762, file: !1762, line: 43, type: !403, scopeLine: 43, flags: DIFlagPrototyped | DIFlagNoReturn | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1, retainedNodes: !1763)
!1767 = !DILocation(line: 44, column: 5, scope: !1766)
!1768 = !DILocation(line: 45, column: 3, scope: !1766)
!1769 = distinct !DISubprogram(name: "__assert_fail", scope: !1770, file: !1770, line: 870, type: !1771, scopeLine: 874, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1, retainedNodes: !1773)
!1770 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "59790372eacbad80338513022c6135db")
!1771 = !DISubroutineType(types: !1772)
!1772 = !{null, !294, !294, !7, !294}
!1773 = !{!1774, !1775, !1776, !1777, !1778, !1782, !1783, !1784, !1786, !1788, !1790}
!1774 = !DILocalVariable(name: "assertion", arg: 1, scope: !1769, file: !1770, line: 870, type: !294)
!1775 = !DILocalVariable(name: "file", arg: 2, scope: !1769, file: !1770, line: 871, type: !294)
!1776 = !DILocalVariable(name: "line", arg: 3, scope: !1769, file: !1770, line: 872, type: !7)
!1777 = !DILocalVariable(name: "function", arg: 4, scope: !1769, file: !1770, line: 873, type: !294)
!1778 = !DILocalVariable(name: "fmt", scope: !1769, file: !1770, line: 875, type: !1779)
!1779 = !DICompositeType(tag: DW_TAG_array_type, baseType: !295, size: 376, elements: !1780)
!1780 = !{!1781}
!1781 = !DISubrange(count: 47)
!1782 = !DILocalVariable(name: "msg", scope: !1769, file: !1770, line: 894, type: !1256)
!1783 = !DILocalVariable(name: "len", scope: !1769, file: !1770, line: 895, type: !50)
!1784 = !DILocalVariable(name: "tmp", scope: !1785, file: !1770, line: 896, type: !294)
!1785 = distinct !DILexicalBlock(scope: !1769, file: !1770, line: 896, column: 3)
!1786 = !DILocalVariable(name: "tmp", scope: !1787, file: !1770, line: 898, type: !294)
!1787 = distinct !DILexicalBlock(scope: !1769, file: !1770, line: 898, column: 3)
!1788 = !DILocalVariable(name: "tmp", scope: !1789, file: !1770, line: 901, type: !294)
!1789 = distinct !DILexicalBlock(scope: !1769, file: !1770, line: 901, column: 3)
!1790 = !DILocalVariable(name: "tmp", scope: !1791, file: !1770, line: 903, type: !294)
!1791 = distinct !DILexicalBlock(scope: !1769, file: !1770, line: 903, column: 3)
!1792 = !DILocation(line: 875, column: 3, scope: !1769)
!1793 = !DILocation(line: 875, column: 14, scope: !1769)
!1794 = !DILocation(line: 894, column: 14, scope: !1769)
!1795 = !{!1796, !1796, i64 0}
!1796 = !{!"long", !1797, i64 0}
!1797 = !{!"omnipotent char", !1798, i64 0}
!1798 = !{!"Simple C/C++ TBAA"}
!1799 = !DILocation(line: 896, column: 3, scope: !1785)
!1800 = !{!1801, !1801, i64 0}
!1801 = !{!"omnipotent char", !1802, i64 0}
!1802 = !{!"Simple C++ TBAA"}
!1803 = distinct !{!1803, !1799, !1799, !1804}
!1804 = !{!"llvm.loop.mustprogress"}
!1805 = !DILocation(line: 897, column: 9, scope: !1769)
!1806 = !DILocation(line: 897, column: 50, scope: !1769)
!1807 = !{!1797, !1797, i64 0}
!1808 = !DILocation(line: 898, column: 3, scope: !1787)
!1809 = distinct !{!1809, !1808, !1808, !1804}
!1810 = !DILocation(line: 899, column: 9, scope: !1769)
!1811 = !DILocation(line: 899, column: 51, scope: !1769)
!1812 = !DILocation(line: 900, column: 44, scope: !1769)
!1813 = !DILocation(line: 900, column: 9, scope: !1769)
!1814 = !DILocation(line: 901, column: 3, scope: !1789)
!1815 = distinct !{!1815, !1814, !1814, !1804}
!1816 = !DILocation(line: 902, column: 9, scope: !1769)
!1817 = !DILocation(line: 902, column: 55, scope: !1769)
!1818 = !DILocation(line: 903, column: 3, scope: !1791)
!1819 = distinct !{!1819, !1818, !1818, !1804}
!1820 = !DILocation(line: 904, column: 3, scope: !1769)
!1821 = !DILocation(line: 904, column: 50, scope: !1769)
!1822 = !DILocation(line: 908, column: 3, scope: !1769)
!1823 = !DILocation(line: 909, column: 1, scope: !1769)
!1824 = distinct !DISubprogram(name: "__assertfail", scope: !1770, file: !1770, line: 912, type: !403, scopeLine: 913, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1, retainedNodes: !1763)
!1825 = !DILocation(line: 915, column: 5, scope: !1824)
!1826 = !DILocation(line: 916, column: 1, scope: !1824)
!1827 = distinct !DISubprogram(name: "__d_increment", linkageName: "_Z13__d_incrementPi", scope: !2, file: !2, line: 17, type: !1828, scopeLine: 18, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1, retainedNodes: !1830)
!1828 = !DISubroutineType(types: !1829)
!1829 = !{null, !85}
!1830 = !{!1831, !1832, !1833}
!1831 = !DILocalVariable(name: "d_mem", arg: 1, scope: !1827, file: !2, line: 17, type: !85)
!1832 = !DILocalVariable(name: "i", scope: !1827, file: !2, line: 19, type: !431)
!1833 = !DILocalVariable(name: "tmp", scope: !1827, file: !2, line: 20, type: !50)
!1834 = !DILocation(line: 280, column: 12, scope: !1835, inlinedAt: !1840)
!1835 = distinct !DISubprogram(name: "operator()", linkageName: "_ZNK15__HIP_ThreadIdxclEj", scope: !1745, file: !1695, line: 279, type: !1748, scopeLine: 279, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1, declaration: !1747, retainedNodes: !1836)
!1836 = !{!1837, !1839}
!1837 = !DILocalVariable(name: "this", arg: 1, scope: !1835, type: !1838, flags: DIFlagArtificial | DIFlagObjectPointer)
!1838 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1751, size: 64)
!1839 = !DILocalVariable(name: "x", arg: 2, scope: !1835, file: !1695, line: 279, type: !33)
!1840 = distinct !DILocation(line: 300, column: 53, scope: !1841, inlinedAt: !1845)
!1841 = distinct !DISubprogram(name: "operator unsigned int", linkageName: "_ZNK17__HIP_CoordinatesI15__HIP_ThreadIdxE3__XcvjEv", scope: !1701, file: !1695, line: 300, type: !1704, scopeLine: 300, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1, declaration: !1703, retainedNodes: !1842)
!1842 = !{!1843}
!1843 = !DILocalVariable(name: "this", arg: 1, scope: !1841, type: !1844, flags: DIFlagArtificial | DIFlagObjectPointer)
!1844 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1700, size: 64)
!1845 = distinct !DILocation(line: 19, column: 16, scope: !1827)
!1846 = !{i32 0, i32 1024}
!1847 = !DILocation(line: 19, column: 16, scope: !1827)
!1848 = !DILocation(line: 21, column: 11, scope: !1849)
!1849 = distinct !DILexicalBlock(scope: !1827, file: !2, line: 21, column: 9)
!1850 = !DILocation(line: 21, column: 9, scope: !1827)
!1851 = !DILocation(line: 24, column: 20, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1849, file: !2, line: 23, column: 12)
!1853 = !DILocation(line: 24, column: 13, scope: !1852)
!1854 = !{!1855, !1855, i64 0}
!1855 = !{!"int", !1801, i64 0}
!1856 = !DILocation(line: 924, column: 9, scope: !1857, inlinedAt: !1866)
!1857 = distinct !DILexicalBlock(scope: !1858, file: !1770, line: 923, column: 16)
!1858 = distinct !DILexicalBlock(scope: !1859, file: !1770, line: 923, column: 9)
!1859 = distinct !DISubprogram(name: "__work_group_barrier", linkageName: "_ZL20__work_group_barrierj14__memory_scope", scope: !1770, file: !1770, line: 921, type: !1860, scopeLine: 922, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !1, retainedNodes: !1863)
!1860 = !DISubroutineType(cc: DW_CC_nocall, types: !1861)
!1861 = !{null, !28, !1862}
!1862 = !DIDerivedType(tag: DW_TAG_typedef, name: "__memory_scope", file: !13, line: 137, baseType: !12)
!1863 = !{!1864, !1865}
!1864 = !DILocalVariable(name: "flags", arg: 1, scope: !1859, file: !1770, line: 921, type: !28)
!1865 = !DILocalVariable(name: "scope", arg: 2, scope: !1859, file: !1770, line: 921, type: !1862)
!1866 = distinct !DILocation(line: 936, column: 3, scope: !1867, inlinedAt: !1871)
!1867 = distinct !DISubprogram(name: "__barrier", linkageName: "_ZL9__barrieri", scope: !1770, file: !1770, line: 934, type: !1868, scopeLine: 935, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !1, retainedNodes: !1869)
!1868 = !DISubroutineType(cc: DW_CC_nocall, types: !449)
!1869 = !{!1870}
!1870 = !DILocalVariable(name: "n", arg: 1, scope: !1867, file: !1770, line: 934, type: !50)
!1871 = distinct !DILocation(line: 944, column: 3, scope: !1872, inlinedAt: !1873)
!1872 = distinct !DISubprogram(name: "__syncthreads", linkageName: "_Z13__syncthreadsv", scope: !1770, file: !1770, line: 942, type: !403, scopeLine: 943, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1, retainedNodes: !1763)
!1873 = distinct !DILocation(line: 26, column: 5, scope: !1827)
!1874 = !DILocation(line: 925, column: 9, scope: !1857, inlinedAt: !1866)
!1875 = !DILocation(line: 926, column: 9, scope: !1857, inlinedAt: !1866)
!1876 = !DILocation(line: 28, column: 5, scope: !1827)
!1877 = !DILocation(line: 28, column: 14, scope: !1827)
!1878 = !DILocation(line: 29, column: 1, scope: !1827)
!1879 = !{!1880, !1880, i64 0}
!1880 = !{!"any pointer", !1797, i64 0}
!1881 = !{!1882, !1882, i64 0}
!1882 = !{!"int", !1797, i64 0}
!1883 = !{i64 2662}
!1884 = !{!1885, !1880, i64 0}
!1885 = !{!"", !1880, i64 0, !1880, i64 8, !1886, i64 16, !1796, i64 24, !1796, i64 32, !1796, i64 40}
!1886 = !{!"hsa_signal_s", !1796, i64 0}
!1887 = !{!1885, !1796, i64 40}
!1888 = !{!1885, !1880, i64 8}
!1889 = !{!"exec"}
!1890 = !{!1891, !1882, i64 16}
!1891 = !{!"", !1796, i64 0, !1796, i64 8, !1882, i64 16, !1882, i64 20}
!1892 = !{!1891, !1796, i64 8}
!1893 = !{!1891, !1882, i64 20}
!1894 = !{!1891, !1796, i64 0}
!1895 = !{!1896, !1796, i64 16}
!1896 = !{!"amd_signal_s", !1796, i64 0, !1797, i64 8, !1796, i64 16, !1882, i64 24, !1882, i64 28, !1796, i64 32, !1796, i64 40, !1797, i64 48, !1797, i64 56}
!1897 = !{!1896, !1882, i64 24}

; __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa-gfx803

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = 'test.C'
source_filename = "test.C"
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
%"struct.std::chrono::time_point" = type { %"struct.std::chrono::duration" }
%"struct.std::chrono::duration" = type { i64 }
%"struct.std::chrono::duration.0" = type { i64 }

$__hip_gpubin_handle = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@_Z13__d_incrementPi = dso_local constant void (i32*)* @_Z28__device_stub____d_incrementPi, align 8
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [35 x i8] c"Increment through an array:\0Asize: \00", align 1, !dbg !7
@.str.1 = private unnamed_addr constant [14 x i8] c"\0Aiterations: \00", align 1, !dbg !15
@.str.2 = private unnamed_addr constant [11 x i8] c"HIP time: \00", align 1, !dbg !20
@.str.3 = private unnamed_addr constant [11 x i8] c" micro sec\00", align 1, !dbg !25
@.str.4 = private unnamed_addr constant [12 x i8] c"NORM time: \00", align 1, !dbg !27
@0 = private unnamed_addr constant [20 x i8] c"_Z13__d_incrementPi\00", align 1
@__hip_fatbin = external constant i8, section ".hip_fatbin"
@__hip_fatbin_wrapper = internal constant { i32, i32, i8*, i8* } { i32 1212764230, i32 1, i8* @__hip_fatbin, i8* null }, section ".hipFatBinSegment", align 8
@__hip_gpubin_handle = linkonce hidden local_unnamed_addr global i8** null, comdat, align 8
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_test.C, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @__hip_module_ctor, i8* null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: norecurse uwtable
define dso_local void @_Z28__device_stub____d_incrementPi(i32* noundef %0) #3 {
  %2 = alloca i32*, align 8
  %3 = alloca %struct.dim3, align 8
  %4 = alloca %struct.dim3, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  store i32* %0, i32** %2, align 8, !tbaa !2015
  %7 = alloca i8*, align 16
  %8 = bitcast i8** %7 to i32***
  store i32** %2, i32*** %8, align 16
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
  %21 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void (i32*)** @_Z13__d_incrementPi to i8*), i64 %14, i32 %16, i64 %18, i32 %20, i8** noundef nonnull %7, i64 noundef %10, %struct.ihipStream_t* noundef %12)
  ret void
}

declare dso_local i32 @__hipPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**) local_unnamed_addr

declare dso_local i32 @hipLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.ihipStream_t*) local_unnamed_addr

; Function Attrs: uwtable
define dso_local void @_Z13hip_incrementPiS_m(i32* noundef %0, i32* noundef %1, i64 noundef %2) local_unnamed_addr #4 !dbg !2019 {
  %4 = alloca i32*, align 8
  %5 = alloca %struct.dim3, align 8
  %6 = alloca %struct.dim3, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 16
  %10 = alloca i32*, align 8
  call void @llvm.dbg.value(metadata i32* %0, metadata !2024, metadata !DIExpression()), !dbg !2029
  call void @llvm.dbg.value(metadata i32* %1, metadata !2025, metadata !DIExpression()), !dbg !2029
  call void @llvm.dbg.value(metadata i64 %2, metadata !2026, metadata !DIExpression()), !dbg !2029
  %11 = shl i64 %2, 2, !dbg !2030
  call void @llvm.dbg.value(metadata i64 %11, metadata !2027, metadata !DIExpression()), !dbg !2029
  %12 = bitcast i32** %10 to i8*, !dbg !2031
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #12, !dbg !2031
  %13 = bitcast i32** %10 to i8**, !dbg !2032
  call void @llvm.dbg.value(metadata i32** %10, metadata !2028, metadata !DIExpression(DW_OP_deref)), !dbg !2029
  %14 = call i32 @hipMalloc(i8** noundef nonnull %13, i64 noundef %11), !dbg !2033
  %15 = load i8*, i8** %13, align 8, !dbg !2034, !tbaa !2015
  call void @llvm.dbg.value(metadata i32* undef, metadata !2028, metadata !DIExpression()), !dbg !2029
  %16 = bitcast i32* %1 to i8*, !dbg !2035
  %17 = call i32 @hipMemcpy(i8* noundef %15, i8* noundef %16, i64 noundef %11, i32 noundef 1), !dbg !2036
  %18 = and i64 %2, 4294967295, !dbg !2037
  %19 = or i64 %18, 4294967296, !dbg !2037
  %20 = call i32 @__hipPushCallConfiguration(i64 4294967297, i32 1, i64 %19, i32 1, i64 noundef 0, %struct.ihipStream_t* noundef null), !dbg !2037
  %21 = icmp eq i32 %20, 0, !dbg !2037
  br i1 %21, label %22, label %44, !dbg !2037

22:                                               ; preds = %3
  %23 = load i32*, i32** %10, align 8, !dbg !2037, !tbaa !2015
  call void @llvm.dbg.value(metadata i32* %23, metadata !2028, metadata !DIExpression()), !dbg !2029
  %24 = bitcast i32** %4 to i8*, !dbg !2037
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %24), !dbg !2037
  %25 = bitcast %struct.dim3* %5 to i8*, !dbg !2037
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %25), !dbg !2037
  %26 = bitcast %struct.dim3* %6 to i8*, !dbg !2037
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %26), !dbg !2037
  %27 = bitcast i64* %7 to i8*, !dbg !2037
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %27), !dbg !2037
  %28 = bitcast i8** %8 to i8*, !dbg !2037
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %28), !dbg !2037
  %29 = bitcast i8** %9 to i8*, !dbg !2037
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %29), !dbg !2037
  store i32* %23, i32** %4, align 8, !dbg !2037, !tbaa !2015
  %30 = bitcast i8** %9 to i32***, !dbg !2037
  store i32** %4, i32*** %30, align 16, !dbg !2037
  %31 = call i32 @__hipPopCallConfiguration(%struct.dim3* nonnull %5, %struct.dim3* nonnull %6, i64* nonnull %7, i8** nonnull %8), !dbg !2037
  %32 = load i64, i64* %7, align 8, !dbg !2037
  %33 = bitcast i8** %8 to %struct.ihipStream_t**, !dbg !2037
  %34 = load %struct.ihipStream_t*, %struct.ihipStream_t** %33, align 8, !dbg !2037
  %35 = bitcast %struct.dim3* %5 to i64*, !dbg !2037
  %36 = load i64, i64* %35, align 8, !dbg !2037
  %37 = getelementptr inbounds %struct.dim3, %struct.dim3* %5, i64 0, i32 2, !dbg !2037
  %38 = load i32, i32* %37, align 8, !dbg !2037
  %39 = bitcast %struct.dim3* %6 to i64*, !dbg !2037
  %40 = load i64, i64* %39, align 8, !dbg !2037
  %41 = getelementptr inbounds %struct.dim3, %struct.dim3* %6, i64 0, i32 2, !dbg !2037
  %42 = load i32, i32* %41, align 8, !dbg !2037
  %43 = call noundef i32 @hipLaunchKernel(i8* noundef bitcast (void (i32*)** @_Z13__d_incrementPi to i8*), i64 %36, i32 %38, i64 %40, i32 %42, i8** noundef nonnull %9, i64 noundef %32, %struct.ihipStream_t* noundef %34), !dbg !2037
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %24), !dbg !2037
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %25), !dbg !2037
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %26), !dbg !2037
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %27), !dbg !2037
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %28), !dbg !2037
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %29), !dbg !2037
  br label %44, !dbg !2037

44:                                               ; preds = %22, %3
  %45 = call i32 @hipDeviceSynchronize(), !dbg !2039
  %46 = bitcast i32* %0 to i8*, !dbg !2040
  %47 = load i8*, i8** %13, align 8, !dbg !2041, !tbaa !2015
  call void @llvm.dbg.value(metadata i32* undef, metadata !2028, metadata !DIExpression()), !dbg !2029
  %48 = call i32 @hipMemcpy(i8* noundef %46, i8* noundef %47, i64 noundef %11, i32 noundef 2), !dbg !2042
  %49 = load i8*, i8** %13, align 8, !dbg !2043, !tbaa !2015
  call void @llvm.dbg.value(metadata i32* undef, metadata !2028, metadata !DIExpression()), !dbg !2029
  %50 = call i32 @hipFree(i8* noundef %49), !dbg !2044
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #12, !dbg !2045
  ret void, !dbg !2045
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

declare !dbg !2046 dso_local i32 @hipMalloc(i8** noundef, i64 noundef) local_unnamed_addr #0

declare !dbg !2050 dso_local i32 @hipMemcpy(i8* noundef, i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #0

declare dso_local i32 @__hipPushCallConfiguration(i64, i32, i64, i32, i64 noundef, %struct.ihipStream_t* noundef) local_unnamed_addr #0

declare !dbg !2054 dso_local i32 @hipDeviceSynchronize() local_unnamed_addr #0

declare !dbg !2057 dso_local i32 @hipFree(i8* noundef) local_unnamed_addr #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z14norm_incrementPiS_m(i32* nocapture noundef writeonly %0, i32* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #6 !dbg !2060 {
  call void @llvm.dbg.value(metadata i32* %0, metadata !2062, metadata !DIExpression()), !dbg !2067
  call void @llvm.dbg.value(metadata i32* %1, metadata !2063, metadata !DIExpression()), !dbg !2067
  call void @llvm.dbg.value(metadata i64 %2, metadata !2064, metadata !DIExpression()), !dbg !2067
  call void @llvm.dbg.value(metadata i64 0, metadata !2065, metadata !DIExpression()), !dbg !2068
  %4 = ptrtoint i32* %1 to i64
  %5 = ptrtoint i32* %0 to i64
  %6 = add i64 %2, -1
  call void @llvm.dbg.value(metadata i64 0, metadata !2065, metadata !DIExpression()), !dbg !2068
  %7 = icmp eq i64 %6, 0, !dbg !2069
  br i1 %7, label %95, label %8, !dbg !2071

8:                                                ; preds = %3
  %9 = icmp ult i64 %6, 8, !dbg !2071
  br i1 %9, label %75, label %10, !dbg !2071

10:                                               ; preds = %8
  %11 = add i64 %5, 4, !dbg !2071
  %12 = sub i64 %11, %4, !dbg !2071
  %13 = icmp ult i64 %12, 32, !dbg !2071
  br i1 %13, label %75, label %14, !dbg !2071

14:                                               ; preds = %10
  %15 = and i64 %6, -8, !dbg !2071
  %16 = add i64 %15, -8, !dbg !2071
  %17 = lshr exact i64 %16, 3, !dbg !2071
  %18 = add nuw nsw i64 %17, 1, !dbg !2071
  %19 = and i64 %18, 1, !dbg !2071
  %20 = icmp eq i64 %16, 0, !dbg !2071
  br i1 %20, label %56, label %21, !dbg !2071

21:                                               ; preds = %14
  %22 = and i64 %18, 4611686018427387902, !dbg !2071
  br label %23, !dbg !2071

23:                                               ; preds = %23, %21
  %24 = phi i64 [ 0, %21 ], [ %53, %23 ], !dbg !2072
  %25 = phi i64 [ 0, %21 ], [ %54, %23 ]
  %26 = getelementptr inbounds i32, i32* %1, i64 %24, !dbg !2073
  %27 = bitcast i32* %26 to <4 x i32>*, !dbg !2073
  %28 = load <4 x i32>, <4 x i32>* %27, align 4, !dbg !2073, !tbaa !2074
  %29 = getelementptr inbounds i32, i32* %26, i64 4, !dbg !2073
  %30 = bitcast i32* %29 to <4 x i32>*, !dbg !2073
  %31 = load <4 x i32>, <4 x i32>* %30, align 4, !dbg !2073, !tbaa !2074
  %32 = add nsw <4 x i32> %28, <i32 1, i32 1, i32 1, i32 1>, !dbg !2076
  %33 = add nsw <4 x i32> %31, <i32 1, i32 1, i32 1, i32 1>, !dbg !2076
  %34 = or i64 %24, 1, !dbg !2072
  %35 = getelementptr inbounds i32, i32* %0, i64 %34, !dbg !2077
  %36 = bitcast i32* %35 to <4 x i32>*, !dbg !2078
  store <4 x i32> %32, <4 x i32>* %36, align 4, !dbg !2078, !tbaa !2074
  %37 = getelementptr inbounds i32, i32* %35, i64 4, !dbg !2078
  %38 = bitcast i32* %37 to <4 x i32>*, !dbg !2078
  store <4 x i32> %33, <4 x i32>* %38, align 4, !dbg !2078, !tbaa !2074
  %39 = or i64 %24, 8, !dbg !2072
  %40 = getelementptr inbounds i32, i32* %1, i64 %39, !dbg !2073
  %41 = bitcast i32* %40 to <4 x i32>*, !dbg !2073
  %42 = load <4 x i32>, <4 x i32>* %41, align 4, !dbg !2073, !tbaa !2074
  %43 = getelementptr inbounds i32, i32* %40, i64 4, !dbg !2073
  %44 = bitcast i32* %43 to <4 x i32>*, !dbg !2073
  %45 = load <4 x i32>, <4 x i32>* %44, align 4, !dbg !2073, !tbaa !2074
  %46 = add nsw <4 x i32> %42, <i32 1, i32 1, i32 1, i32 1>, !dbg !2076
  %47 = add nsw <4 x i32> %45, <i32 1, i32 1, i32 1, i32 1>, !dbg !2076
  %48 = or i64 %24, 9, !dbg !2072
  %49 = getelementptr inbounds i32, i32* %0, i64 %48, !dbg !2077
  %50 = bitcast i32* %49 to <4 x i32>*, !dbg !2078
  store <4 x i32> %46, <4 x i32>* %50, align 4, !dbg !2078, !tbaa !2074
  %51 = getelementptr inbounds i32, i32* %49, i64 4, !dbg !2078
  %52 = bitcast i32* %51 to <4 x i32>*, !dbg !2078
  store <4 x i32> %47, <4 x i32>* %52, align 4, !dbg !2078, !tbaa !2074
  %53 = add nuw i64 %24, 16, !dbg !2072
  %54 = add i64 %25, 2, !dbg !2072
  %55 = icmp eq i64 %54, %22, !dbg !2072
  br i1 %55, label %56, label %23, !dbg !2072, !llvm.loop !2079

56:                                               ; preds = %23, %14
  %57 = phi i64 [ 0, %14 ], [ %53, %23 ]
  %58 = icmp eq i64 %19, 0, !dbg !2072
  br i1 %58, label %73, label %59, !dbg !2072

59:                                               ; preds = %56
  %60 = getelementptr inbounds i32, i32* %1, i64 %57, !dbg !2073
  %61 = bitcast i32* %60 to <4 x i32>*, !dbg !2073
  %62 = load <4 x i32>, <4 x i32>* %61, align 4, !dbg !2073, !tbaa !2074
  %63 = getelementptr inbounds i32, i32* %60, i64 4, !dbg !2073
  %64 = bitcast i32* %63 to <4 x i32>*, !dbg !2073
  %65 = load <4 x i32>, <4 x i32>* %64, align 4, !dbg !2073, !tbaa !2074
  %66 = add nsw <4 x i32> %62, <i32 1, i32 1, i32 1, i32 1>, !dbg !2076
  %67 = add nsw <4 x i32> %65, <i32 1, i32 1, i32 1, i32 1>, !dbg !2076
  %68 = or i64 %57, 1, !dbg !2072
  %69 = getelementptr inbounds i32, i32* %0, i64 %68, !dbg !2077
  %70 = bitcast i32* %69 to <4 x i32>*, !dbg !2078
  store <4 x i32> %66, <4 x i32>* %70, align 4, !dbg !2078, !tbaa !2074
  %71 = getelementptr inbounds i32, i32* %69, i64 4, !dbg !2078
  %72 = bitcast i32* %71 to <4 x i32>*, !dbg !2078
  store <4 x i32> %67, <4 x i32>* %72, align 4, !dbg !2078, !tbaa !2074
  br label %73, !dbg !2071

73:                                               ; preds = %56, %59
  %74 = icmp eq i64 %6, %15, !dbg !2071
  br i1 %74, label %95, label %75, !dbg !2071

75:                                               ; preds = %10, %8, %73
  %76 = phi i64 [ 0, %10 ], [ 0, %8 ], [ %15, %73 ]
  %77 = add i64 %2, 3, !dbg !2071
  %78 = add i64 %2, -2, !dbg !2071
  %79 = sub i64 %78, %76, !dbg !2071
  %80 = and i64 %77, 3, !dbg !2071
  %81 = icmp eq i64 %80, 0, !dbg !2071
  br i1 %81, label %92, label %82, !dbg !2071

82:                                               ; preds = %75, %82
  %83 = phi i64 [ %88, %82 ], [ %76, %75 ]
  %84 = phi i64 [ %90, %82 ], [ 0, %75 ]
  call void @llvm.dbg.value(metadata i64 %83, metadata !2065, metadata !DIExpression()), !dbg !2068
  %85 = getelementptr inbounds i32, i32* %1, i64 %83, !dbg !2073
  %86 = load i32, i32* %85, align 4, !dbg !2073, !tbaa !2074
  %87 = add nsw i32 %86, 1, !dbg !2076
  %88 = add nuw i64 %83, 1, !dbg !2072
  %89 = getelementptr inbounds i32, i32* %0, i64 %88, !dbg !2077
  store i32 %87, i32* %89, align 4, !dbg !2078, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 %88, metadata !2065, metadata !DIExpression()), !dbg !2068
  %90 = add i64 %84, 1, !dbg !2071
  %91 = icmp eq i64 %90, %80, !dbg !2071
  br i1 %91, label %92, label %82, !dbg !2071, !llvm.loop !2083

92:                                               ; preds = %82, %75
  %93 = phi i64 [ %76, %75 ], [ %88, %82 ]
  %94 = icmp ult i64 %79, 3, !dbg !2071
  br i1 %94, label %95, label %96, !dbg !2071

95:                                               ; preds = %92, %96, %73, %3
  ret void, !dbg !2085

96:                                               ; preds = %92, %96
  %97 = phi i64 [ %116, %96 ], [ %93, %92 ]
  call void @llvm.dbg.value(metadata i64 %97, metadata !2065, metadata !DIExpression()), !dbg !2068
  %98 = getelementptr inbounds i32, i32* %1, i64 %97, !dbg !2073
  %99 = load i32, i32* %98, align 4, !dbg !2073, !tbaa !2074
  %100 = add nsw i32 %99, 1, !dbg !2076
  %101 = add nuw i64 %97, 1, !dbg !2072
  %102 = getelementptr inbounds i32, i32* %0, i64 %101, !dbg !2077
  store i32 %100, i32* %102, align 4, !dbg !2078, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 %101, metadata !2065, metadata !DIExpression()), !dbg !2068
  call void @llvm.dbg.value(metadata i64 %101, metadata !2065, metadata !DIExpression()), !dbg !2068
  %103 = getelementptr inbounds i32, i32* %1, i64 %101, !dbg !2073
  %104 = load i32, i32* %103, align 4, !dbg !2073, !tbaa !2074
  %105 = add nsw i32 %104, 1, !dbg !2076
  %106 = add nuw i64 %97, 2, !dbg !2072
  %107 = getelementptr inbounds i32, i32* %0, i64 %106, !dbg !2077
  store i32 %105, i32* %107, align 4, !dbg !2078, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 %106, metadata !2065, metadata !DIExpression()), !dbg !2068
  call void @llvm.dbg.value(metadata i64 %106, metadata !2065, metadata !DIExpression()), !dbg !2068
  %108 = getelementptr inbounds i32, i32* %1, i64 %106, !dbg !2073
  %109 = load i32, i32* %108, align 4, !dbg !2073, !tbaa !2074
  %110 = add nsw i32 %109, 1, !dbg !2076
  %111 = add nuw i64 %97, 3, !dbg !2072
  %112 = getelementptr inbounds i32, i32* %0, i64 %111, !dbg !2077
  store i32 %110, i32* %112, align 4, !dbg !2078, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 %111, metadata !2065, metadata !DIExpression()), !dbg !2068
  call void @llvm.dbg.value(metadata i64 %111, metadata !2065, metadata !DIExpression()), !dbg !2068
  %113 = getelementptr inbounds i32, i32* %1, i64 %111, !dbg !2073
  %114 = load i32, i32* %113, align 4, !dbg !2073, !tbaa !2074
  %115 = add nsw i32 %114, 1, !dbg !2076
  %116 = add nuw i64 %97, 4, !dbg !2072
  %117 = getelementptr inbounds i32, i32* %0, i64 %116, !dbg !2077
  store i32 %115, i32* %117, align 4, !dbg !2078, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 %116, metadata !2065, metadata !DIExpression()), !dbg !2068
  %118 = icmp eq i64 %116, %6, !dbg !2069
  br i1 %118, label %95, label %96, !dbg !2071, !llvm.loop !2086
}

; Function Attrs: norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #3 !dbg !2087 {
  call void @llvm.dbg.value(metadata i64 16384, metadata !2089, metadata !DIExpression()), !dbg !2104
  call void @llvm.dbg.value(metadata i64 16384, metadata !2090, metadata !DIExpression()), !dbg !2104
  %1 = tail call noalias noundef nonnull dereferenceable(65536) i8* @_Znam(i64 noundef 65536) #13, !dbg !2105, !heapallocsite !132
  call void @llvm.dbg.value(metadata i32* %4, metadata !2091, metadata !DIExpression()), !dbg !2104
  %2 = tail call noalias noundef nonnull dereferenceable(65536) i8* @_Znam(i64 noundef 65536) #13, !dbg !2106, !heapallocsite !132
  call void @llvm.dbg.value(metadata i32* %5, metadata !2092, metadata !DIExpression()), !dbg !2104
  %3 = tail call noalias noundef nonnull dereferenceable(65536) i8* @_Znam(i64 noundef 65536) #13, !dbg !2107, !heapallocsite !132
  call void @llvm.dbg.value(metadata i32* %6, metadata !2093, metadata !DIExpression()), !dbg !2104
  call void @llvm.dbg.value(metadata i32 0, metadata !2094, metadata !DIExpression()), !dbg !2108
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(65536) %1, i8 0, i64 65536, i1 false), !dbg !2109, !tbaa !2074
  call void @llvm.dbg.value(metadata i32 undef, metadata !2094, metadata !DIExpression()), !dbg !2108
  call void @llvm.dbg.value(metadata i32 undef, metadata !2094, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !2108
  %4 = bitcast i8* %1 to i32*, !dbg !2105
  %5 = bitcast i8* %2 to i32*, !dbg !2106
  %6 = bitcast i8* %3 to i32*, !dbg !2107
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2111, metadata !DIExpression()), !dbg !2175
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), metadata !2120, metadata !DIExpression()), !dbg !2175
  %7 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i64 noundef 34), !dbg !2177
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2179, metadata !DIExpression()), !dbg !2190
  call void @llvm.dbg.value(metadata i64 16384, metadata !2188, metadata !DIExpression()), !dbg !2190
  %8 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef 16384), !dbg !2192
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %8, metadata !2111, metadata !DIExpression()), !dbg !2193
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), metadata !2120, metadata !DIExpression()), !dbg !2193
  %9 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %8, i8* noundef nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i64 noundef 13), !dbg !2195
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %8, metadata !2179, metadata !DIExpression()), !dbg !2196
  call void @llvm.dbg.value(metadata i64 16384, metadata !2188, metadata !DIExpression()), !dbg !2196
  %10 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %8, i64 noundef 16384), !dbg !2198
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %10, metadata !2199, metadata !DIExpression()), !dbg !2209
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %10, metadata !2211, metadata !DIExpression()), !dbg !2217
  %11 = bitcast %"class.std::basic_ostream"* %10 to i8**, !dbg !2219
  %12 = load i8*, i8** %11, align 8, !dbg !2219, !tbaa !2220
  %13 = getelementptr i8, i8* %12, i64 -24, !dbg !2219
  %14 = bitcast i8* %13 to i64*, !dbg !2219
  %15 = load i64, i64* %14, align 8, !dbg !2219
  %16 = bitcast %"class.std::basic_ostream"* %10 to i8*, !dbg !2219
  %17 = getelementptr inbounds i8, i8* %16, i64 %15, !dbg !2219
  call void @llvm.dbg.value(metadata i8* %17, metadata !2222, metadata !DIExpression()), !dbg !2236
  call void @llvm.dbg.value(metadata i8 10, metadata !2234, metadata !DIExpression()), !dbg !2236
  %18 = getelementptr inbounds i8, i8* %17, i64 240, !dbg !2238
  %19 = bitcast i8* %18 to %"class.std::ctype"**, !dbg !2238
  %20 = load %"class.std::ctype"*, %"class.std::ctype"** %19, align 8, !dbg !2238, !tbaa !2239
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %20, metadata !2248, metadata !DIExpression()), !dbg !2260
  %21 = icmp eq %"class.std::ctype"* %20, null, !dbg !2262
  br i1 %21, label %22, label %23, !dbg !2264

22:                                               ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #14, !dbg !2265
  unreachable, !dbg !2265

23:                                               ; preds = %0
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %20, metadata !2266, metadata !DIExpression()), !dbg !2275
  call void @llvm.dbg.value(metadata i8 10, metadata !2274, metadata !DIExpression()), !dbg !2275
  %24 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %20, i64 0, i32 8, !dbg !2277
  %25 = load i8, i8* %24, align 8, !dbg !2277, !tbaa !2279
  %26 = icmp eq i8 %25, 0, !dbg !2277
  br i1 %26, label %30, label %27, !dbg !2282

27:                                               ; preds = %23
  %28 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %20, i64 0, i32 9, i64 10, !dbg !2283
  %29 = load i8, i8* %28, align 1, !dbg !2283, !tbaa !2284
  br label %36, !dbg !2285

30:                                               ; preds = %23
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %20), !dbg !2286
  %31 = bitcast %"class.std::ctype"* %20 to i8 (%"class.std::ctype"*, i8)***, !dbg !2287
  %32 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %31, align 8, !dbg !2287, !tbaa !2220
  %33 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %32, i64 6, !dbg !2287
  %34 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %33, align 8, !dbg !2287
  %35 = tail call noundef signext i8 %34(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %20, i8 noundef signext 10), !dbg !2287
  br label %36, !dbg !2288

36:                                               ; preds = %27, %30
  %37 = phi i8 [ %29, %27 ], [ %35, %30 ], !dbg !2275
  %38 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %10, i8 noundef signext %37), !dbg !2289
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %38, metadata !2290, metadata !DIExpression()), !dbg !2293
  %39 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %38), !dbg !2295
  %40 = tail call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #12, !dbg !2296
  call void @llvm.dbg.value(metadata i64 %40, metadata !2096, metadata !DIExpression()), !dbg !2104
  call void @llvm.dbg.value(metadata i64 0, metadata !2097, metadata !DIExpression()), !dbg !2297
  br label %106, !dbg !2298

41:                                               ; preds = %106
  %42 = tail call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #12, !dbg !2299
  call void @llvm.dbg.value(metadata i64 %42, metadata !2099, metadata !DIExpression()), !dbg !2104
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2111, metadata !DIExpression()), !dbg !2300
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), metadata !2120, metadata !DIExpression()), !dbg !2300
  %43 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i64 noundef 10), !dbg !2302
  call void @llvm.dbg.value(metadata %"struct.std::chrono::time_point"* undef, metadata !2303, metadata !DIExpression()), !dbg !2313
  call void @llvm.dbg.value(metadata %"struct.std::chrono::time_point"* undef, metadata !2309, metadata !DIExpression()), !dbg !2313
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !306, metadata !DIExpression()), !dbg !2315
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !307, metadata !DIExpression()), !dbg !2315
  %44 = sub nsw i64 %42, %40, !dbg !2317
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !290, metadata !DIExpression()), !dbg !2318
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration.0"* undef, metadata !291, metadata !DIExpression()), !dbg !2318
  %45 = sdiv i64 %44, 1000, !dbg !2320
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2321, metadata !DIExpression()), !dbg !2328
  call void @llvm.dbg.value(metadata i64 %45, metadata !2327, metadata !DIExpression()), !dbg !2328
  %46 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %45), !dbg !2330
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %46, metadata !2111, metadata !DIExpression()), !dbg !2331
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), metadata !2120, metadata !DIExpression()), !dbg !2331
  %47 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %46, i8* noundef nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i64 noundef 10), !dbg !2333
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %46, metadata !2199, metadata !DIExpression()), !dbg !2334
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %46, metadata !2211, metadata !DIExpression()), !dbg !2336
  %48 = bitcast %"class.std::basic_ostream"* %46 to i8**, !dbg !2338
  %49 = load i8*, i8** %48, align 8, !dbg !2338, !tbaa !2220
  %50 = getelementptr i8, i8* %49, i64 -24, !dbg !2338
  %51 = bitcast i8* %50 to i64*, !dbg !2338
  %52 = load i64, i64* %51, align 8, !dbg !2338
  %53 = bitcast %"class.std::basic_ostream"* %46 to i8*, !dbg !2338
  %54 = getelementptr inbounds i8, i8* %53, i64 %52, !dbg !2338
  call void @llvm.dbg.value(metadata i8* %54, metadata !2222, metadata !DIExpression()), !dbg !2339
  call void @llvm.dbg.value(metadata i8 10, metadata !2234, metadata !DIExpression()), !dbg !2339
  %55 = getelementptr inbounds i8, i8* %54, i64 240, !dbg !2341
  %56 = bitcast i8* %55 to %"class.std::ctype"**, !dbg !2341
  %57 = load %"class.std::ctype"*, %"class.std::ctype"** %56, align 8, !dbg !2341, !tbaa !2239
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %57, metadata !2248, metadata !DIExpression()), !dbg !2342
  %58 = icmp eq %"class.std::ctype"* %57, null, !dbg !2344
  br i1 %58, label %59, label %60, !dbg !2345

59:                                               ; preds = %41
  tail call void @_ZSt16__throw_bad_castv() #14, !dbg !2346
  unreachable, !dbg !2346

60:                                               ; preds = %41
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %57, metadata !2266, metadata !DIExpression()), !dbg !2347
  call void @llvm.dbg.value(metadata i8 10, metadata !2274, metadata !DIExpression()), !dbg !2347
  %61 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %57, i64 0, i32 8, !dbg !2349
  %62 = load i8, i8* %61, align 8, !dbg !2349, !tbaa !2279
  %63 = icmp eq i8 %62, 0, !dbg !2349
  br i1 %63, label %67, label %64, !dbg !2350

64:                                               ; preds = %60
  %65 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %57, i64 0, i32 9, i64 10, !dbg !2351
  %66 = load i8, i8* %65, align 1, !dbg !2351, !tbaa !2284
  br label %73, !dbg !2352

67:                                               ; preds = %60
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %57), !dbg !2353
  %68 = bitcast %"class.std::ctype"* %57 to i8 (%"class.std::ctype"*, i8)***, !dbg !2354
  %69 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %68, align 8, !dbg !2354, !tbaa !2220
  %70 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %69, i64 6, !dbg !2354
  %71 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %70, align 8, !dbg !2354
  %72 = tail call noundef signext i8 %71(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %57, i8 noundef signext 10), !dbg !2354
  br label %73, !dbg !2355

73:                                               ; preds = %64, %67
  %74 = phi i8 [ %66, %64 ], [ %72, %67 ], !dbg !2347
  %75 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %46, i8 noundef signext %74), !dbg !2356
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %75, metadata !2290, metadata !DIExpression()), !dbg !2357
  %76 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %75), !dbg !2359
  %77 = tail call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #12, !dbg !2360
  call void @llvm.dbg.value(metadata i64 %77, metadata !2100, metadata !DIExpression()), !dbg !2104
  call void @llvm.dbg.value(metadata i64 0, metadata !2101, metadata !DIExpression()), !dbg !2361
  %78 = getelementptr inbounds i32, i32* %4, i64 16376, !dbg !2362
  %79 = load i32, i32* %78, align 4, !tbaa !2074
  %80 = add nsw i32 %79, 1
  %81 = getelementptr inbounds i32, i32* %5, i64 16377
  %82 = getelementptr inbounds i32, i32* %4, i64 16377
  %83 = load i32, i32* %82, align 4, !tbaa !2074
  %84 = add nsw i32 %83, 1
  %85 = getelementptr inbounds i32, i32* %5, i64 16378
  %86 = getelementptr inbounds i32, i32* %4, i64 16378
  %87 = load i32, i32* %86, align 4, !tbaa !2074
  %88 = add nsw i32 %87, 1
  %89 = getelementptr inbounds i32, i32* %5, i64 16379
  %90 = getelementptr inbounds i32, i32* %4, i64 16379
  %91 = load i32, i32* %90, align 4, !tbaa !2074
  %92 = add nsw i32 %91, 1
  %93 = getelementptr inbounds i32, i32* %5, i64 16380
  %94 = getelementptr inbounds i32, i32* %4, i64 16380
  %95 = load i32, i32* %94, align 4, !tbaa !2074
  %96 = add nsw i32 %95, 1
  %97 = getelementptr inbounds i32, i32* %5, i64 16381
  %98 = getelementptr inbounds i32, i32* %4, i64 16381
  %99 = load i32, i32* %98, align 4, !tbaa !2074
  %100 = add nsw i32 %99, 1
  %101 = getelementptr inbounds i32, i32* %5, i64 16382
  %102 = getelementptr inbounds i32, i32* %4, i64 16382
  %103 = load i32, i32* %102, align 4, !tbaa !2074
  %104 = add nsw i32 %103, 1
  %105 = getelementptr inbounds i32, i32* %5, i64 16383
  br label %110, !dbg !2365

106:                                              ; preds = %36, %106
  %107 = phi i64 [ 0, %36 ], [ %108, %106 ]
  call void @llvm.dbg.value(metadata i64 %107, metadata !2097, metadata !DIExpression()), !dbg !2297
  tail call void @_Z13hip_incrementPiS_m(i32* noundef nonnull %6, i32* noundef nonnull %4, i64 noundef 16384), !dbg !2366
  %108 = add nuw nsw i64 %107, 1, !dbg !2368
  call void @llvm.dbg.value(metadata i64 %108, metadata !2097, metadata !DIExpression()), !dbg !2297
  %109 = icmp eq i64 %108, 16384, !dbg !2369
  br i1 %109, label %41, label %106, !dbg !2298, !llvm.loop !2370

110:                                              ; preds = %180, %73
  %111 = phi i64 [ 0, %73 ], [ %181, %180 ]
  call void @llvm.dbg.value(metadata i64 %111, metadata !2101, metadata !DIExpression()), !dbg !2361
  br label %112, !dbg !2372

112:                                              ; preds = %129, %110
  %113 = phi i64 [ 0, %110 ], [ %143, %129 ], !dbg !2373
  %114 = getelementptr inbounds i32, i32* %4, i64 %113, !dbg !2362
  %115 = bitcast i32* %114 to <4 x i32>*, !dbg !2362
  %116 = load <4 x i32>, <4 x i32>* %115, align 4, !dbg !2362, !tbaa !2074
  %117 = getelementptr inbounds i32, i32* %114, i64 4, !dbg !2362
  %118 = bitcast i32* %117 to <4 x i32>*, !dbg !2362
  %119 = load <4 x i32>, <4 x i32>* %118, align 4, !dbg !2362, !tbaa !2074
  %120 = add nsw <4 x i32> %116, <i32 1, i32 1, i32 1, i32 1>, !dbg !2374
  %121 = add nsw <4 x i32> %119, <i32 1, i32 1, i32 1, i32 1>, !dbg !2374
  %122 = or i64 %113, 1, !dbg !2373
  %123 = getelementptr inbounds i32, i32* %5, i64 %122, !dbg !2375
  %124 = bitcast i32* %123 to <4 x i32>*, !dbg !2376
  store <4 x i32> %120, <4 x i32>* %124, align 4, !dbg !2376, !tbaa !2074
  %125 = getelementptr inbounds i32, i32* %123, i64 4, !dbg !2376
  %126 = bitcast i32* %125 to <4 x i32>*, !dbg !2376
  store <4 x i32> %121, <4 x i32>* %126, align 4, !dbg !2376, !tbaa !2074
  %127 = or i64 %113, 8, !dbg !2373
  %128 = icmp eq i64 %127, 16376, !dbg !2373
  br i1 %128, label %180, label %129, !dbg !2373, !llvm.loop !2377

129:                                              ; preds = %112
  %130 = getelementptr inbounds i32, i32* %4, i64 %127, !dbg !2362
  %131 = bitcast i32* %130 to <4 x i32>*, !dbg !2362
  %132 = load <4 x i32>, <4 x i32>* %131, align 4, !dbg !2362, !tbaa !2074
  %133 = getelementptr inbounds i32, i32* %130, i64 4, !dbg !2362
  %134 = bitcast i32* %133 to <4 x i32>*, !dbg !2362
  %135 = load <4 x i32>, <4 x i32>* %134, align 4, !dbg !2362, !tbaa !2074
  %136 = add nsw <4 x i32> %132, <i32 1, i32 1, i32 1, i32 1>, !dbg !2374
  %137 = add nsw <4 x i32> %135, <i32 1, i32 1, i32 1, i32 1>, !dbg !2374
  %138 = or i64 %113, 9, !dbg !2373
  %139 = getelementptr inbounds i32, i32* %5, i64 %138, !dbg !2375
  %140 = bitcast i32* %139 to <4 x i32>*, !dbg !2376
  store <4 x i32> %136, <4 x i32>* %140, align 4, !dbg !2376, !tbaa !2074
  %141 = getelementptr inbounds i32, i32* %139, i64 4, !dbg !2376
  %142 = bitcast i32* %141 to <4 x i32>*, !dbg !2376
  store <4 x i32> %137, <4 x i32>* %142, align 4, !dbg !2376, !tbaa !2074
  %143 = add nuw nsw i64 %113, 16, !dbg !2373
  br label %112

144:                                              ; preds = %180
  %145 = tail call i64 @_ZNSt6chrono3_V212system_clock3nowEv() #12, !dbg !2379
  call void @llvm.dbg.value(metadata i64 %145, metadata !2103, metadata !DIExpression()), !dbg !2104
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2111, metadata !DIExpression()), !dbg !2380
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i64 0, i64 0), metadata !2120, metadata !DIExpression()), !dbg !2380
  %146 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i64 0, i64 0), i64 noundef 11), !dbg !2382
  call void @llvm.dbg.value(metadata %"struct.std::chrono::time_point"* undef, metadata !2303, metadata !DIExpression()), !dbg !2383
  call void @llvm.dbg.value(metadata %"struct.std::chrono::time_point"* undef, metadata !2309, metadata !DIExpression()), !dbg !2383
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !306, metadata !DIExpression()), !dbg !2385
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !307, metadata !DIExpression()), !dbg !2385
  %147 = sub nsw i64 %145, %77, !dbg !2387
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration"* undef, metadata !290, metadata !DIExpression()), !dbg !2388
  call void @llvm.dbg.value(metadata %"struct.std::chrono::duration.0"* undef, metadata !291, metadata !DIExpression()), !dbg !2388
  %148 = sdiv i64 %147, 1000, !dbg !2390
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* @_ZSt4cout, metadata !2321, metadata !DIExpression()), !dbg !2391
  call void @llvm.dbg.value(metadata i64 %148, metadata !2327, metadata !DIExpression()), !dbg !2391
  %149 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %148), !dbg !2393
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %149, metadata !2111, metadata !DIExpression()), !dbg !2394
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), metadata !2120, metadata !DIExpression()), !dbg !2394
  %150 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %149, i8* noundef nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i64 noundef 10), !dbg !2396
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %149, metadata !2199, metadata !DIExpression()), !dbg !2397
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %149, metadata !2211, metadata !DIExpression()), !dbg !2399
  %151 = bitcast %"class.std::basic_ostream"* %149 to i8**, !dbg !2401
  %152 = load i8*, i8** %151, align 8, !dbg !2401, !tbaa !2220
  %153 = getelementptr i8, i8* %152, i64 -24, !dbg !2401
  %154 = bitcast i8* %153 to i64*, !dbg !2401
  %155 = load i64, i64* %154, align 8, !dbg !2401
  %156 = bitcast %"class.std::basic_ostream"* %149 to i8*, !dbg !2401
  %157 = getelementptr inbounds i8, i8* %156, i64 %155, !dbg !2401
  call void @llvm.dbg.value(metadata i8* %157, metadata !2222, metadata !DIExpression()), !dbg !2402
  call void @llvm.dbg.value(metadata i8 10, metadata !2234, metadata !DIExpression()), !dbg !2402
  %158 = getelementptr inbounds i8, i8* %157, i64 240, !dbg !2404
  %159 = bitcast i8* %158 to %"class.std::ctype"**, !dbg !2404
  %160 = load %"class.std::ctype"*, %"class.std::ctype"** %159, align 8, !dbg !2404, !tbaa !2239
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %160, metadata !2248, metadata !DIExpression()), !dbg !2405
  %161 = icmp eq %"class.std::ctype"* %160, null, !dbg !2407
  br i1 %161, label %162, label %163, !dbg !2408

162:                                              ; preds = %144
  tail call void @_ZSt16__throw_bad_castv() #14, !dbg !2409
  unreachable, !dbg !2409

163:                                              ; preds = %144
  call void @llvm.dbg.value(metadata %"class.std::ctype"* %160, metadata !2266, metadata !DIExpression()), !dbg !2410
  call void @llvm.dbg.value(metadata i8 10, metadata !2274, metadata !DIExpression()), !dbg !2410
  %164 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %160, i64 0, i32 8, !dbg !2412
  %165 = load i8, i8* %164, align 8, !dbg !2412, !tbaa !2279
  %166 = icmp eq i8 %165, 0, !dbg !2412
  br i1 %166, label %170, label %167, !dbg !2413

167:                                              ; preds = %163
  %168 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %160, i64 0, i32 9, i64 10, !dbg !2414
  %169 = load i8, i8* %168, align 1, !dbg !2414, !tbaa !2284
  br label %176, !dbg !2415

170:                                              ; preds = %163
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %160), !dbg !2416
  %171 = bitcast %"class.std::ctype"* %160 to i8 (%"class.std::ctype"*, i8)***, !dbg !2417
  %172 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %171, align 8, !dbg !2417, !tbaa !2220
  %173 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %172, i64 6, !dbg !2417
  %174 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %173, align 8, !dbg !2417
  %175 = tail call noundef signext i8 %174(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570) %160, i8 noundef signext 10), !dbg !2417
  br label %176, !dbg !2418

176:                                              ; preds = %167, %170
  %177 = phi i8 [ %169, %167 ], [ %175, %170 ], !dbg !2410
  %178 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %149, i8 noundef signext %177), !dbg !2419
  call void @llvm.dbg.value(metadata %"class.std::basic_ostream"* %178, metadata !2290, metadata !DIExpression()), !dbg !2420
  %179 = tail call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %178), !dbg !2422
  tail call void @_ZdlPv(i8* noundef nonnull %1) #15, !dbg !2423
  tail call void @_ZdlPv(i8* noundef nonnull %2) #15, !dbg !2424
  tail call void @_ZdlPv(i8* noundef nonnull %3) #15, !dbg !2425
  ret i32 0, !dbg !2426

180:                                              ; preds = %112
  call void @llvm.dbg.value(metadata i64 16376, metadata !2065, metadata !DIExpression()), !dbg !2427
  store i32 %80, i32* %81, align 4, !dbg !2376, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 16377, metadata !2065, metadata !DIExpression()), !dbg !2427
  call void @llvm.dbg.value(metadata i64 16377, metadata !2065, metadata !DIExpression()), !dbg !2427
  store i32 %84, i32* %85, align 4, !dbg !2376, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 16378, metadata !2065, metadata !DIExpression()), !dbg !2427
  call void @llvm.dbg.value(metadata i64 16378, metadata !2065, metadata !DIExpression()), !dbg !2427
  store i32 %88, i32* %89, align 4, !dbg !2376, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 16379, metadata !2065, metadata !DIExpression()), !dbg !2427
  call void @llvm.dbg.value(metadata i64 16379, metadata !2065, metadata !DIExpression()), !dbg !2427
  store i32 %92, i32* %93, align 4, !dbg !2376, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 16380, metadata !2065, metadata !DIExpression()), !dbg !2427
  call void @llvm.dbg.value(metadata i64 16380, metadata !2065, metadata !DIExpression()), !dbg !2427
  store i32 %96, i32* %97, align 4, !dbg !2376, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 16381, metadata !2065, metadata !DIExpression()), !dbg !2427
  call void @llvm.dbg.value(metadata i64 16381, metadata !2065, metadata !DIExpression()), !dbg !2427
  store i32 %100, i32* %101, align 4, !dbg !2376, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 16382, metadata !2065, metadata !DIExpression()), !dbg !2427
  call void @llvm.dbg.value(metadata i64 16382, metadata !2065, metadata !DIExpression()), !dbg !2427
  store i32 %104, i32* %105, align 4, !dbg !2376, !tbaa !2074
  call void @llvm.dbg.value(metadata i64 16383, metadata !2065, metadata !DIExpression()), !dbg !2427
  %181 = add nuw nsw i64 %111, 1, !dbg !2428
  call void @llvm.dbg.value(metadata i64 %181, metadata !2101, metadata !DIExpression()), !dbg !2361
  %182 = icmp eq i64 %181, 16384, !dbg !2429
  br i1 %182, label %144, label %110, !dbg !2365, !llvm.loop !2430
}

; Function Attrs: nobuiltin allocsize(0)
declare dso_local noundef nonnull i8* @_Znam(i64 noundef) local_unnamed_addr #7

; Function Attrs: nounwind
declare dso_local i64 @_ZNSt6chrono3_V212system_clock3nowEv() local_unnamed_addr #1

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8* noundef) local_unnamed_addr #8

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef, i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

; Function Attrs: noreturn
declare dso_local void @_ZSt16__throw_bad_castv() local_unnamed_addr #9

declare dso_local void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #0

declare dso_local noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSo9_M_insertIlEERSoT_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_test.C() #4 section ".text.startup" !dbg !2432 {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit), !dbg !2434
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #12, !dbg !2438
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
  %7 = tail call i32 @__hipRegisterFunction(i8** %6, i8* bitcast (void (i32*)** @_Z13__d_incrementPi to i8*), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i64 0, i64 0), i32 -1, i8* null, i8* null, i8* null, i8* null, i32* null)
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
declare void @llvm.dbg.value(metadata, metadata, metadata) #10

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #11

attributes #0 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #6 = { argmemonly mustprogress nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nobuiltin allocsize(0) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nobuiltin nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { noreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #12 = { nounwind }
attributes #13 = { builtin allocsize(0) }
attributes #14 = { noreturn }
attributes #15 = { builtin nounwind }

!llvm.dbg.cu = !{!32}
!llvm.module.flags = !{!2010, !2011, !2012, !2013}
!llvm.ident = !{!2014}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/iostream", directory: "")
!4 = !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 608, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/ios_base.h", directory: "")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt8ios_base")
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !9, line: 81, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "test.C", directory: "/mnt/d/repos/SW4CK/src", checksumkind: CSK_MD5, checksum: "c87a7a04b1749c84edbbfc8cb48ae44f")
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 280, elements: !13)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{!14}
!14 = !DISubrange(count: 35)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(scope: null, file: !9, line: 82, type: !17, isLocal: true, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 112, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 14)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(scope: null, file: !9, line: 92, type: !22, isLocal: true, isDefinition: true)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 88, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 11)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(scope: null, file: !9, line: 92, type: !22, isLocal: true, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(scope: null, file: !9, line: 105, type: !29, isLocal: true, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 96, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 12)
!32 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !9, producer: "AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !33, retainedTypes: !141, globals: !373, imports: !374, splitDebugInlining: false, nameTableKind: None)
!33 = !{!34, !42, !123, !131}
!34 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Lock_policy", scope: !36, file: !35, line: 49, baseType: !37, size: 32, elements: !38, identifier: "_ZTSN9__gnu_cxx12_Lock_policyE")
!35 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ext/concurrence.h", directory: "")
!36 = !DINamespace(name: "__gnu_cxx", scope: null)
!37 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!38 = !{!39, !40, !41}
!39 = !DIEnumerator(name: "_S_single", value: 0, isUnsigned: true)
!40 = !DIEnumerator(name: "_S_mutex", value: 1, isUnsigned: true)
!41 = !DIEnumerator(name: "_S_atomic", value: 2, isUnsigned: true)
!42 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipError_t", file: !43, line: 206, baseType: !37, size: 32, elements: !44, identifier: "_ZTS10hipError_t")
!43 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "7560f6d8bd7c5ac736ef5dfcbc59d092")
!44 = !{!45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122}
!45 = !DIEnumerator(name: "hipSuccess", value: 0, isUnsigned: true)
!46 = !DIEnumerator(name: "hipErrorInvalidValue", value: 1, isUnsigned: true)
!47 = !DIEnumerator(name: "hipErrorOutOfMemory", value: 2, isUnsigned: true)
!48 = !DIEnumerator(name: "hipErrorMemoryAllocation", value: 2, isUnsigned: true)
!49 = !DIEnumerator(name: "hipErrorNotInitialized", value: 3, isUnsigned: true)
!50 = !DIEnumerator(name: "hipErrorInitializationError", value: 3, isUnsigned: true)
!51 = !DIEnumerator(name: "hipErrorDeinitialized", value: 4, isUnsigned: true)
!52 = !DIEnumerator(name: "hipErrorProfilerDisabled", value: 5, isUnsigned: true)
!53 = !DIEnumerator(name: "hipErrorProfilerNotInitialized", value: 6, isUnsigned: true)
!54 = !DIEnumerator(name: "hipErrorProfilerAlreadyStarted", value: 7, isUnsigned: true)
!55 = !DIEnumerator(name: "hipErrorProfilerAlreadyStopped", value: 8, isUnsigned: true)
!56 = !DIEnumerator(name: "hipErrorInvalidConfiguration", value: 9, isUnsigned: true)
!57 = !DIEnumerator(name: "hipErrorInvalidPitchValue", value: 12, isUnsigned: true)
!58 = !DIEnumerator(name: "hipErrorInvalidSymbol", value: 13, isUnsigned: true)
!59 = !DIEnumerator(name: "hipErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!60 = !DIEnumerator(name: "hipErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!61 = !DIEnumerator(name: "hipErrorInsufficientDriver", value: 35, isUnsigned: true)
!62 = !DIEnumerator(name: "hipErrorMissingConfiguration", value: 52, isUnsigned: true)
!63 = !DIEnumerator(name: "hipErrorPriorLaunchFailure", value: 53, isUnsigned: true)
!64 = !DIEnumerator(name: "hipErrorInvalidDeviceFunction", value: 98, isUnsigned: true)
!65 = !DIEnumerator(name: "hipErrorNoDevice", value: 100, isUnsigned: true)
!66 = !DIEnumerator(name: "hipErrorInvalidDevice", value: 101, isUnsigned: true)
!67 = !DIEnumerator(name: "hipErrorInvalidImage", value: 200, isUnsigned: true)
!68 = !DIEnumerator(name: "hipErrorInvalidContext", value: 201, isUnsigned: true)
!69 = !DIEnumerator(name: "hipErrorContextAlreadyCurrent", value: 202, isUnsigned: true)
!70 = !DIEnumerator(name: "hipErrorMapFailed", value: 205, isUnsigned: true)
!71 = !DIEnumerator(name: "hipErrorMapBufferObjectFailed", value: 205, isUnsigned: true)
!72 = !DIEnumerator(name: "hipErrorUnmapFailed", value: 206, isUnsigned: true)
!73 = !DIEnumerator(name: "hipErrorArrayIsMapped", value: 207, isUnsigned: true)
!74 = !DIEnumerator(name: "hipErrorAlreadyMapped", value: 208, isUnsigned: true)
!75 = !DIEnumerator(name: "hipErrorNoBinaryForGpu", value: 209, isUnsigned: true)
!76 = !DIEnumerator(name: "hipErrorAlreadyAcquired", value: 210, isUnsigned: true)
!77 = !DIEnumerator(name: "hipErrorNotMapped", value: 211, isUnsigned: true)
!78 = !DIEnumerator(name: "hipErrorNotMappedAsArray", value: 212, isUnsigned: true)
!79 = !DIEnumerator(name: "hipErrorNotMappedAsPointer", value: 213, isUnsigned: true)
!80 = !DIEnumerator(name: "hipErrorECCNotCorrectable", value: 214, isUnsigned: true)
!81 = !DIEnumerator(name: "hipErrorUnsupportedLimit", value: 215, isUnsigned: true)
!82 = !DIEnumerator(name: "hipErrorContextAlreadyInUse", value: 216, isUnsigned: true)
!83 = !DIEnumerator(name: "hipErrorPeerAccessUnsupported", value: 217, isUnsigned: true)
!84 = !DIEnumerator(name: "hipErrorInvalidKernelFile", value: 218, isUnsigned: true)
!85 = !DIEnumerator(name: "hipErrorInvalidGraphicsContext", value: 219, isUnsigned: true)
!86 = !DIEnumerator(name: "hipErrorInvalidSource", value: 300, isUnsigned: true)
!87 = !DIEnumerator(name: "hipErrorFileNotFound", value: 301, isUnsigned: true)
!88 = !DIEnumerator(name: "hipErrorSharedObjectSymbolNotFound", value: 302, isUnsigned: true)
!89 = !DIEnumerator(name: "hipErrorSharedObjectInitFailed", value: 303, isUnsigned: true)
!90 = !DIEnumerator(name: "hipErrorOperatingSystem", value: 304, isUnsigned: true)
!91 = !DIEnumerator(name: "hipErrorInvalidHandle", value: 400, isUnsigned: true)
!92 = !DIEnumerator(name: "hipErrorInvalidResourceHandle", value: 400, isUnsigned: true)
!93 = !DIEnumerator(name: "hipErrorIllegalState", value: 401, isUnsigned: true)
!94 = !DIEnumerator(name: "hipErrorNotFound", value: 500, isUnsigned: true)
!95 = !DIEnumerator(name: "hipErrorNotReady", value: 600, isUnsigned: true)
!96 = !DIEnumerator(name: "hipErrorIllegalAddress", value: 700, isUnsigned: true)
!97 = !DIEnumerator(name: "hipErrorLaunchOutOfResources", value: 701, isUnsigned: true)
!98 = !DIEnumerator(name: "hipErrorLaunchTimeOut", value: 702, isUnsigned: true)
!99 = !DIEnumerator(name: "hipErrorPeerAccessAlreadyEnabled", value: 704, isUnsigned: true)
!100 = !DIEnumerator(name: "hipErrorPeerAccessNotEnabled", value: 705, isUnsigned: true)
!101 = !DIEnumerator(name: "hipErrorSetOnActiveProcess", value: 708, isUnsigned: true)
!102 = !DIEnumerator(name: "hipErrorContextIsDestroyed", value: 709, isUnsigned: true)
!103 = !DIEnumerator(name: "hipErrorAssert", value: 710, isUnsigned: true)
!104 = !DIEnumerator(name: "hipErrorHostMemoryAlreadyRegistered", value: 712, isUnsigned: true)
!105 = !DIEnumerator(name: "hipErrorHostMemoryNotRegistered", value: 713, isUnsigned: true)
!106 = !DIEnumerator(name: "hipErrorLaunchFailure", value: 719, isUnsigned: true)
!107 = !DIEnumerator(name: "hipErrorCooperativeLaunchTooLarge", value: 720, isUnsigned: true)
!108 = !DIEnumerator(name: "hipErrorNotSupported", value: 801, isUnsigned: true)
!109 = !DIEnumerator(name: "hipErrorStreamCaptureUnsupported", value: 900, isUnsigned: true)
!110 = !DIEnumerator(name: "hipErrorStreamCaptureInvalidated", value: 901, isUnsigned: true)
!111 = !DIEnumerator(name: "hipErrorStreamCaptureMerge", value: 902, isUnsigned: true)
!112 = !DIEnumerator(name: "hipErrorStreamCaptureUnmatched", value: 903, isUnsigned: true)
!113 = !DIEnumerator(name: "hipErrorStreamCaptureUnjoined", value: 904, isUnsigned: true)
!114 = !DIEnumerator(name: "hipErrorStreamCaptureIsolation", value: 905, isUnsigned: true)
!115 = !DIEnumerator(name: "hipErrorStreamCaptureImplicit", value: 906, isUnsigned: true)
!116 = !DIEnumerator(name: "hipErrorCapturedEvent", value: 907, isUnsigned: true)
!117 = !DIEnumerator(name: "hipErrorStreamCaptureWrongThread", value: 908, isUnsigned: true)
!118 = !DIEnumerator(name: "hipErrorGraphExecUpdateFailure", value: 910, isUnsigned: true)
!119 = !DIEnumerator(name: "hipErrorUnknown", value: 999, isUnsigned: true)
!120 = !DIEnumerator(name: "hipErrorRuntimeMemory", value: 1052, isUnsigned: true)
!121 = !DIEnumerator(name: "hipErrorRuntimeOther", value: 1053, isUnsigned: true)
!122 = !DIEnumerator(name: "hipErrorTbd", value: 1054, isUnsigned: true)
!123 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "hipMemcpyKind", file: !124, line: 344, baseType: !37, size: 32, elements: !125, identifier: "_ZTS13hipMemcpyKind")
!124 = !DIFile(filename: "/opt/rocm-5.4.3/include/hip/driver_types.h", directory: "", checksumkind: CSK_MD5, checksum: "ac8c80c0e1fdd9c44dee17b35e5c6ced")
!125 = !{!126, !127, !128, !129, !130}
!126 = !DIEnumerator(name: "hipMemcpyHostToHost", value: 0, isUnsigned: true)
!127 = !DIEnumerator(name: "hipMemcpyHostToDevice", value: 1, isUnsigned: true)
!128 = !DIEnumerator(name: "hipMemcpyDeviceToHost", value: 2, isUnsigned: true)
!129 = !DIEnumerator(name: "hipMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!130 = !DIEnumerator(name: "hipMemcpyDefault", value: 4, isUnsigned: true)
!131 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Ios_Iostate", scope: !2, file: !5, line: 153, baseType: !132, size: 32, elements: !133, identifier: "_ZTSSt12_Ios_Iostate")
!132 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!133 = !{!134, !135, !136, !137, !138, !139, !140}
!134 = !DIEnumerator(name: "_S_goodbit", value: 0)
!135 = !DIEnumerator(name: "_S_badbit", value: 1)
!136 = !DIEnumerator(name: "_S_eofbit", value: 2)
!137 = !DIEnumerator(name: "_S_failbit", value: 4)
!138 = !DIEnumerator(name: "_S_ios_iostate_end", value: 65536)
!139 = !DIEnumerator(name: "_S_ios_iostate_max", value: 2147483647)
!140 = !DIEnumerator(name: "_S_ios_iostate_min", value: -2147483648)
!141 = !{!142, !144, !158, !224, !236, !165, !239, !301, !164, !310, !131, !132, !314, !145, !315, !161, !366, !6}
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!144 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !43, line: 941, baseType: !145)
!145 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !43, line: 934, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !146, identifier: "_ZTS4dim3")
!146 = !{!147, !152, !153, !154}
!147 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !145, file: !43, line: 935, baseType: !148, size: 32)
!148 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !149, line: 26, baseType: !150)
!149 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "d3ea318a915682aaf6645ec16ac9f991")
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !151, line: 42, baseType: !37)
!151 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "f6304b1a6dcfc6bee76e9a51043b5090")
!152 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !145, file: !43, line: 936, baseType: !148, size: 32, offset: 32)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !145, file: !43, line: 937, baseType: !148, size: 32, offset: 64)
!154 = !DISubprogram(name: "dim3", scope: !145, file: !43, line: 939, type: !155, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!155 = !DISubroutineType(types: !156)
!156 = !{null, !157, !148, !148, !148}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !145, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!158 = !DIDerivedType(tag: DW_TAG_typedef, name: "microseconds", scope: !160, file: !159, line: 608, baseType: !161)
!159 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/chrono", directory: "")
!160 = !DINamespace(name: "chrono", scope: !2)
!161 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1000000L> >", scope: !160, file: !159, line: 300, size: 64, flags: DIFlagTypePassByValue, elements: !162, templateParams: !209, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEE")
!162 = !{!163, !166, !170, !175, !176, !180, !184, !187, !188, !191, !194, !195, !196, !197, !198, !203, !204, !207, !208}
!163 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !161, file: !159, line: 443, baseType: !164, size: 64, flags: DIFlagPrivate)
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !161, file: !159, line: 313, baseType: !165)
!165 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!166 = !DISubprogram(name: "duration", scope: !161, file: !159, line: 322, type: !167, scopeLine: 322, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!167 = !DISubroutineType(types: !168)
!168 = !{null, !169}
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!170 = !DISubprogram(name: "duration", scope: !161, file: !159, line: 324, type: !171, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!171 = !DISubroutineType(types: !172)
!172 = !{null, !169, !173}
!173 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !174, size: 64)
!174 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !161)
!175 = !DISubprogram(name: "~duration", scope: !161, file: !159, line: 341, type: !167, scopeLine: 341, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!176 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEaSERKS3_", scope: !161, file: !159, line: 342, type: !177, scopeLine: 342, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!177 = !DISubroutineType(types: !178)
!178 = !{!179, !169, !173}
!179 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !161, size: 64)
!180 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000EEE5countEv", scope: !161, file: !159, line: 346, type: !181, scopeLine: 346, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!181 = !DISubroutineType(types: !182)
!182 = !{!164, !183}
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!184 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000EEEpsEv", scope: !161, file: !159, line: 351, type: !185, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!185 = !DISubroutineType(types: !186)
!186 = !{!161, !183}
!187 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000EEEngEv", scope: !161, file: !159, line: 355, type: !185, scopeLine: 355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!188 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEppEv", scope: !161, file: !159, line: 359, type: !189, scopeLine: 359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!189 = !DISubroutineType(types: !190)
!190 = !{!179, !169}
!191 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEppEi", scope: !161, file: !159, line: 366, type: !192, scopeLine: 366, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!192 = !DISubroutineType(types: !193)
!193 = !{!161, !169, !132}
!194 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEmmEv", scope: !161, file: !159, line: 370, type: !189, scopeLine: 370, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!195 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEmmEi", scope: !161, file: !159, line: 377, type: !192, scopeLine: 377, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!196 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEpLERKS3_", scope: !161, file: !159, line: 381, type: !177, scopeLine: 381, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!197 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEmIERKS3_", scope: !161, file: !159, line: 388, type: !177, scopeLine: 388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!198 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEmLERKl", scope: !161, file: !159, line: 395, type: !199, scopeLine: 395, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!199 = !DISubroutineType(types: !200)
!200 = !{!179, !169, !201}
!201 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !202, size: 64)
!202 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !164)
!203 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEEdVERKl", scope: !161, file: !159, line: 402, type: !199, scopeLine: 402, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!204 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEE4zeroEv", scope: !161, file: !159, line: 431, type: !205, scopeLine: 431, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!205 = !DISubroutineType(types: !206)
!206 = !{!161}
!207 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEE3minEv", scope: !161, file: !159, line: 435, type: !205, scopeLine: 435, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!208 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000EEE3maxEv", scope: !161, file: !159, line: 439, type: !205, scopeLine: 439, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!209 = !{!210, !211}
!210 = !DITemplateTypeParameter(name: "_Rep", type: !165)
!211 = !DITemplateTypeParameter(name: "_Period", type: !212)
!212 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000000L>", scope: !2, file: !213, line: 261, size: 8, flags: DIFlagTypePassByValue, elements: !214, templateParams: !221, identifier: "_ZTSSt5ratioILl1ELl1000000EE")
!213 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ratio", directory: "")
!214 = !{!215, !220}
!215 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !212, file: !213, line: 268, baseType: !216, flags: DIFlagStaticMember, extraData: i64 1)
!216 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !217)
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !218, line: 101, baseType: !219)
!218 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "24103e292ae21916e87130b926c8d2f8")
!219 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !151, line: 72, baseType: !165)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !212, file: !213, line: 271, baseType: !216, flags: DIFlagStaticMember, extraData: i64 1000000)
!221 = !{!222, !223}
!222 = !DITemplateValueParameter(name: "_Num", type: !165, value: i64 1)
!223 = !DITemplateValueParameter(name: "_Den", type: !165, value: i64 1000000)
!224 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cd", scope: !225, file: !159, line: 513, baseType: !297)
!225 = distinct !DISubprogram(name: "operator/<long, std::ratio<1L, 1000000000L>, long, std::ratio<1L, 1000000L> >", linkageName: "_ZNSt6chronodvIlSt5ratioILl1ELl1000000000EElS1_ILl1ELl1000000EEEENSt11common_typeIJT_T1_EE4typeERKNS_8durationIS5_T0_EERKNS9_IS6_T2_EE", scope: !160, file: !159, line: 508, type: !226, scopeLine: 510, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, templateParams: !292, retainedNodes: !289)
!226 = !DISubroutineType(types: !227)
!227 = !{!228, !234, !173}
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !230, file: !229, line: 187, baseType: !165)
!229 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/type_traits", directory: "")
!230 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__success_type<long>", scope: !2, file: !229, line: 186, size: 8, flags: DIFlagTypePassByValue, elements: !231, templateParams: !232, identifier: "_ZTSSt14__success_typeIlE")
!231 = !{}
!232 = !{!233}
!233 = !DITemplateTypeParameter(name: "_Tp", type: !165)
!234 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !235, size: 64)
!235 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !236)
!236 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1000000000L> >", scope: !160, file: !159, line: 300, size: 64, flags: DIFlagTypePassByValue, elements: !237, templateParams: !281, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEE")
!237 = !{!238, !240, !244, !247, !248, !252, !256, !259, !260, !263, !266, !267, !268, !269, !270, !275, !276, !279, !280}
!238 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !236, file: !159, line: 443, baseType: !239, size: 64, flags: DIFlagPrivate)
!239 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !236, file: !159, line: 313, baseType: !165)
!240 = !DISubprogram(name: "duration", scope: !236, file: !159, line: 322, type: !241, scopeLine: 322, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!241 = !DISubroutineType(types: !242)
!242 = !{null, !243}
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!244 = !DISubprogram(name: "duration", scope: !236, file: !159, line: 324, type: !245, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!245 = !DISubroutineType(types: !246)
!246 = !{null, !243, !234}
!247 = !DISubprogram(name: "~duration", scope: !236, file: !159, line: 341, type: !241, scopeLine: 341, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEaSERKS3_", scope: !236, file: !159, line: 342, type: !249, scopeLine: 342, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!249 = !DISubroutineType(types: !250)
!250 = !{!251, !243, !234}
!251 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !236, size: 64)
!252 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv", scope: !236, file: !159, line: 346, type: !253, scopeLine: 346, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!253 = !DISubroutineType(types: !254)
!254 = !{!239, !255}
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!256 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpsEv", scope: !236, file: !159, line: 351, type: !257, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!257 = !DISubroutineType(types: !258)
!258 = !{!236, !255}
!259 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEngEv", scope: !236, file: !159, line: 355, type: !257, scopeLine: 355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!260 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEv", scope: !236, file: !159, line: 359, type: !261, scopeLine: 359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!261 = !DISubroutineType(types: !262)
!262 = !{!251, !243}
!263 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEi", scope: !236, file: !159, line: 366, type: !264, scopeLine: 366, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!264 = !DISubroutineType(types: !265)
!265 = !{!236, !243, !132}
!266 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEv", scope: !236, file: !159, line: 370, type: !261, scopeLine: 370, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!267 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEi", scope: !236, file: !159, line: 377, type: !264, scopeLine: 377, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!268 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpLERKS3_", scope: !236, file: !159, line: 381, type: !249, scopeLine: 381, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!269 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmIERKS3_", scope: !236, file: !159, line: 388, type: !249, scopeLine: 388, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!270 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmLERKl", scope: !236, file: !159, line: 395, type: !271, scopeLine: 395, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!271 = !DISubroutineType(types: !272)
!272 = !{!251, !243, !273}
!273 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !274, size: 64)
!274 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !239)
!275 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEdVERKl", scope: !236, file: !159, line: 402, type: !271, scopeLine: 402, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!276 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE4zeroEv", scope: !236, file: !159, line: 431, type: !277, scopeLine: 431, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!277 = !DISubroutineType(types: !278)
!278 = !{!236}
!279 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3minEv", scope: !236, file: !159, line: 435, type: !277, scopeLine: 435, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!280 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3maxEv", scope: !236, file: !159, line: 439, type: !277, scopeLine: 439, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!281 = !{!210, !282}
!282 = !DITemplateTypeParameter(name: "_Period", type: !283)
!283 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000000000L>", scope: !2, file: !213, line: 261, size: 8, flags: DIFlagTypePassByValue, elements: !284, templateParams: !287, identifier: "_ZTSSt5ratioILl1ELl1000000000EE")
!284 = !{!285, !286}
!285 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !283, file: !213, line: 268, baseType: !216, flags: DIFlagStaticMember, extraData: i64 1)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !283, file: !213, line: 271, baseType: !216, flags: DIFlagStaticMember, extraData: i64 1000000000)
!287 = !{!222, !288}
!288 = !DITemplateValueParameter(name: "_Den", type: !165, value: i64 1000000000)
!289 = !{!290, !291}
!290 = !DILocalVariable(name: "__lhs", arg: 1, scope: !225, file: !159, line: 508, type: !234)
!291 = !DILocalVariable(name: "__rhs", arg: 2, scope: !225, file: !159, line: 509, type: !173)
!292 = !{!293, !294, !295, !296}
!293 = !DITemplateTypeParameter(name: "_Rep1", type: !165)
!294 = !DITemplateTypeParameter(name: "_Period1", type: !283)
!295 = !DITemplateTypeParameter(name: "_Rep2", type: !165)
!296 = !DITemplateTypeParameter(name: "_Period2", type: !212)
!297 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !298, file: !229, line: 187, baseType: !236)
!298 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__success_type<std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !2, file: !229, line: 186, size: 8, flags: DIFlagTypePassByValue, elements: !231, templateParams: !299, identifier: "_ZTSSt14__success_typeINSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEEE")
!299 = !{!300}
!300 = !DITemplateTypeParameter(name: "_Tp", type: !236)
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cd", scope: !302, file: !159, line: 468, baseType: !297)
!302 = distinct !DISubprogram(name: "operator-<long, std::ratio<1L, 1000000000L>, long, std::ratio<1L, 1000000000L> >", linkageName: "_ZNSt6chronomiIlSt5ratioILl1ELl1000000000EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_", scope: !160, file: !159, line: 463, type: !303, scopeLine: 465, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, templateParams: !308, retainedNodes: !305)
!303 = !DISubroutineType(types: !304)
!304 = !{!297, !234, !234}
!305 = !{!306, !307}
!306 = !DILocalVariable(name: "__lhs", arg: 1, scope: !302, file: !159, line: 463, type: !234)
!307 = !DILocalVariable(name: "__rhs", arg: 2, scope: !302, file: !159, line: 464, type: !234)
!308 = !{!293, !294, !295, !309}
!309 = !DITemplateTypeParameter(name: "_Period2", type: !283)
!310 = !DIDerivedType(tag: DW_TAG_typedef, name: "streamsize", scope: !2, file: !311, line: 98, baseType: !312)
!311 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/postypes.h", directory: "")
!312 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !2, file: !313, line: 259, baseType: !165)
!313 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/x86_64-linux-gnu/c++/9/bits/c++config.h", directory: "", checksumkind: CSK_MD5, checksum: "f271377c6e7185560bbbc0bac2bc77fa")
!314 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!315 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "time_point<std::chrono::_V2::system_clock, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !160, file: !159, line: 626, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !316, templateParams: !342, identifier: "_ZTSNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEEE")
!316 = !{!317, !319, !323, !328, !333, !337, !338, !341}
!317 = !DIDerivedType(tag: DW_TAG_member, name: "__d", scope: !315, file: !159, line: 677, baseType: !318, size: 64, flags: DIFlagPrivate)
!318 = !DIDerivedType(tag: DW_TAG_typedef, name: "duration", scope: !315, file: !159, line: 629, baseType: !236)
!319 = !DISubprogram(name: "time_point", scope: !315, file: !159, line: 633, type: !320, scopeLine: 633, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!320 = !DISubroutineType(types: !321)
!321 = !{null, !322}
!322 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!323 = !DISubprogram(name: "time_point", scope: !315, file: !159, line: 636, type: !324, scopeLine: 636, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!324 = !DISubroutineType(types: !325)
!325 = !{null, !322, !326}
!326 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !327, size: 64)
!327 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !318)
!328 = !DISubprogram(name: "time_since_epoch", linkageName: "_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE16time_since_epochEv", scope: !315, file: !159, line: 649, type: !329, scopeLine: 649, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!329 = !DISubroutineType(types: !330)
!330 = !{!318, !331}
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !332, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!332 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !315)
!333 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEEpLERKS6_", scope: !315, file: !159, line: 654, type: !334, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!334 = !DISubroutineType(types: !335)
!335 = !{!336, !322, !326}
!336 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !315, size: 64)
!337 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEEmIERKS6_", scope: !315, file: !159, line: 661, type: !334, scopeLine: 661, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!338 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE3minEv", scope: !315, file: !159, line: 669, type: !339, scopeLine: 669, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!339 = !DISubroutineType(types: !340)
!340 = !{!315}
!341 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono10time_pointINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEEE3maxEv", scope: !315, file: !159, line: 673, type: !339, scopeLine: 673, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!342 = !{!343, !365}
!343 = !DITemplateTypeParameter(name: "_Clock", type: !344)
!344 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "system_clock", scope: !345, file: !159, line: 828, size: 8, flags: DIFlagTypePassByValue, elements: !346, identifier: "_ZTSNSt6chrono3_V212system_clockE")
!345 = !DINamespace(name: "_V2", scope: !160, exportSymbols: true)
!346 = !{!347, !350, !354, !362}
!347 = !DIDerivedType(tag: DW_TAG_member, name: "is_steady", scope: !344, file: !159, line: 839, baseType: !348, flags: DIFlagStaticMember, extraData: i1 false)
!348 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !349)
!349 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!350 = !DISubprogram(name: "now", linkageName: "_ZNSt6chrono3_V212system_clock3nowEv", scope: !344, file: !159, line: 842, type: !351, scopeLine: 842, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!351 = !DISubroutineType(types: !352)
!352 = !{!353}
!353 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_point", scope: !344, file: !159, line: 833, baseType: !315)
!354 = !DISubprogram(name: "to_time_t", linkageName: "_ZNSt6chrono3_V212system_clock9to_time_tERKNS_10time_pointIS1_NS_8durationIlSt5ratioILl1ELl1000000000EEEEEE", scope: !344, file: !159, line: 846, type: !355, scopeLine: 846, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!355 = !DISubroutineType(types: !356)
!356 = !{!357, !360}
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !358, line: 7, baseType: !359)
!358 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "49b4e16ef1215de5afdbb283400ab90c")
!359 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !151, line: 160, baseType: !165)
!360 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !361, size: 64)
!361 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !353)
!362 = !DISubprogram(name: "from_time_t", linkageName: "_ZNSt6chrono3_V212system_clock11from_time_tEl", scope: !344, file: !159, line: 853, type: !363, scopeLine: 853, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!363 = !DISubroutineType(types: !364)
!364 = !{!353, !357}
!365 = !DITemplateTypeParameter(name: "_Dur", type: !236)
!366 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1000L, 1L>", scope: !2, file: !213, line: 261, size: 8, flags: DIFlagTypePassByValue, elements: !367, templateParams: !370, identifier: "_ZTSSt5ratioILl1000ELl1EE")
!367 = !{!368, !369}
!368 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !366, file: !213, line: 268, baseType: !216, flags: DIFlagStaticMember, extraData: i64 1000)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !366, file: !213, line: 271, baseType: !216, flags: DIFlagStaticMember, extraData: i64 1)
!370 = !{!371, !372}
!371 = !DITemplateValueParameter(name: "_Num", type: !165, value: i64 1000)
!372 = !DITemplateValueParameter(name: "_Den", type: !165, defaulted: true, value: i64 1)
!373 = !{!0, !7, !15, !20, !25, !27}
!374 = !{!375, !381, !388, !390, !392, !396, !398, !400, !402, !404, !406, !408, !410, !415, !419, !421, !423, !428, !430, !432, !434, !436, !438, !440, !443, !446, !448, !452, !457, !459, !461, !463, !465, !467, !469, !471, !473, !475, !477, !481, !485, !487, !489, !491, !493, !495, !497, !499, !501, !503, !505, !507, !509, !511, !513, !515, !519, !523, !527, !529, !531, !533, !535, !537, !539, !541, !543, !545, !549, !553, !557, !559, !561, !563, !568, !572, !576, !578, !580, !582, !584, !586, !588, !590, !592, !594, !596, !598, !600, !604, !608, !612, !614, !616, !618, !623, !627, !631, !633, !635, !637, !639, !641, !643, !647, !651, !653, !655, !657, !659, !663, !667, !671, !673, !675, !677, !679, !681, !683, !687, !691, !695, !697, !701, !705, !707, !709, !711, !713, !715, !717, !721, !727, !731, !736, !738, !741, !745, !749, !763, !767, !771, !775, !779, !784, !788, !792, !796, !800, !808, !812, !816, !818, !822, !826, !830, !836, !840, !844, !846, !854, !858, !864, !866, !870, !874, !878, !882, !887, !891, !895, !896, !897, !898, !900, !901, !902, !903, !904, !905, !906, !908, !909, !910, !911, !912, !913, !914, !916, !917, !918, !919, !920, !921, !922, !923, !924, !925, !926, !927, !928, !929, !930, !931, !932, !933, !934, !935, !936, !937, !938, !939, !940, !944, !948, !952, !955, !957, !959, !961, !963, !965, !967, !969, !971, !973, !975, !977, !979, !981, !983, !985, !987, !989, !991, !993, !995, !997, !999, !1001, !1003, !1005, !1009, !1011, !1013, !1017, !1021, !1023, !1025, !1027, !1029, !1031, !1033, !1035, !1037, !1039, !1041, !1043, !1045, !1047, !1049, !1051, !1053, !1055, !1057, !1059, !1061, !1063, !1068, !1070, !1072, !1074, !1076, !1078, !1080, !1082, !1084, !1086, !1088, !1090, !1092, !1094, !1096, !1098, !1100, !1102, !1104, !1106, !1110, !1112, !1114, !1116, !1118, !1120, !1122, !1124, !1126, !1128, !1130, !1132, !1134, !1136, !1138, !1140, !1142, !1144, !1146, !1148, !1150, !1152, !1154, !1156, !1158, !1160, !1162, !1164, !1166, !1168, !1170, !1172, !1174, !1176, !1178, !1180, !1182, !1184, !1186, !1188, !1190, !1192, !1194, !1196, !1198, !1200, !1202, !1204, !1206, !1208, !1210, !1212, !1214, !1216, !1218, !1235, !1238, !1243, !1301, !1306, !1310, !1314, !1318, !1322, !1324, !1326, !1330, !1336, !1340, !1346, !1352, !1354, !1358, !1362, !1366, !1370, !1382, !1384, !1388, !1392, !1396, !1398, !1402, !1406, !1410, !1412, !1414, !1418, !1426, !1430, !1434, !1438, !1440, !1446, !1448, !1454, !1458, !1462, !1466, !1470, !1474, !1478, !1480, !1482, !1486, !1490, !1494, !1496, !1500, !1504, !1506, !1508, !1512, !1516, !1520, !1524, !1525, !1526, !1527, !1528, !1529, !1530, !1531, !1532, !1533, !1534, !1539, !1543, !1546, !1549, !1551, !1553, !1555, !1557, !1560, !1563, !1566, !1569, !1570, !1572, !1575, !1578, !1579, !1582, !1584, !1586, !1588, !1590, !1593, !1596, !1599, !1602, !1605, !1607, !1610, !1611, !1615, !1619, !1624, !1628, !1630, !1632, !1634, !1636, !1638, !1640, !1642, !1644, !1646, !1648, !1650, !1652, !1654, !1658, !1664, !1669, !1673, !1675, !1677, !1679, !1681, !1688, !1692, !1696, !1700, !1704, !1708, !1713, !1717, !1719, !1723, !1729, !1733, !1738, !1740, !1743, !1747, !1751, !1753, !1755, !1757, !1759, !1763, !1765, !1767, !1771, !1775, !1779, !1783, !1787, !1791, !1793, !1797, !1801, !1805, !1809, !1811, !1813, !1817, !1821, !1822, !1823, !1824, !1825, !1826, !1832, !1835, !1836, !1838, !1840, !1842, !1844, !1848, !1850, !1852, !1854, !1856, !1858, !1860, !1862, !1864, !1868, !1872, !1874, !1878, !1882, !1887, !1888, !1889, !1894, !1898, !1903, !1908, !1912, !1918, !1922, !1924, !1928, !1931, !1937, !1941, !1945, !1949, !1953, !1957, !1959, !1961, !1963, !1967, !1971, !1975, !1979, !1983, !1985, !1987, !1989, !1993, !1997, !2001, !2003, !2005, !2007}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !376, file: !380, line: 52)
!376 = !DISubprogram(name: "abs", scope: !377, file: !377, line: 840, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!377 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f0db66726d35051e5af2525f5b33bd81")
!378 = !DISubroutineType(types: !379)
!379 = !{!132, !132}
!380 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/std_abs.h", directory: "")
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !382, file: !387, line: 83)
!382 = !DISubprogram(name: "acos", scope: !383, file: !383, line: 53, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!383 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "833006f6c08fa0a86f73f7ac7f62dccb")
!384 = !DISubroutineType(types: !385)
!385 = !{!386, !386}
!386 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!387 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cmath", directory: "")
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !389, file: !387, line: 102)
!389 = !DISubprogram(name: "asin", scope: !383, file: !383, line: 55, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !391, file: !387, line: 121)
!391 = !DISubprogram(name: "atan", scope: !383, file: !383, line: 57, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !393, file: !387, line: 140)
!393 = !DISubprogram(name: "atan2", scope: !383, file: !383, line: 59, type: !394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!394 = !DISubroutineType(types: !395)
!395 = !{!386, !386, !386}
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !397, file: !387, line: 161)
!397 = !DISubprogram(name: "ceil", scope: !383, file: !383, line: 159, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !399, file: !387, line: 180)
!399 = !DISubprogram(name: "cos", scope: !383, file: !383, line: 62, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !401, file: !387, line: 199)
!401 = !DISubprogram(name: "cosh", scope: !383, file: !383, line: 71, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !403, file: !387, line: 218)
!403 = !DISubprogram(name: "exp", scope: !383, file: !383, line: 95, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !405, file: !387, line: 237)
!405 = !DISubprogram(name: "fabs", scope: !383, file: !383, line: 162, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !407, file: !387, line: 256)
!407 = !DISubprogram(name: "floor", scope: !383, file: !383, line: 165, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !409, file: !387, line: 275)
!409 = !DISubprogram(name: "fmod", scope: !383, file: !383, line: 168, type: !394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !411, file: !387, line: 296)
!411 = !DISubprogram(name: "frexp", scope: !383, file: !383, line: 98, type: !412, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!412 = !DISubroutineType(types: !413)
!413 = !{!386, !386, !414}
!414 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !416, file: !387, line: 315)
!416 = !DISubprogram(name: "ldexp", scope: !383, file: !383, line: 101, type: !417, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!417 = !DISubroutineType(types: !418)
!418 = !{!386, !386, !132}
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !420, file: !387, line: 334)
!420 = !DISubprogram(name: "log", scope: !383, file: !383, line: 104, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !422, file: !387, line: 353)
!422 = !DISubprogram(name: "log10", scope: !383, file: !383, line: 107, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !424, file: !387, line: 372)
!424 = !DISubprogram(name: "modf", scope: !383, file: !383, line: 110, type: !425, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!425 = !DISubroutineType(types: !426)
!426 = !{!386, !386, !427}
!427 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !386, size: 64)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !429, file: !387, line: 384)
!429 = !DISubprogram(name: "pow", scope: !383, file: !383, line: 140, type: !394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !431, file: !387, line: 421)
!431 = !DISubprogram(name: "sin", scope: !383, file: !383, line: 64, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !433, file: !387, line: 440)
!433 = !DISubprogram(name: "sinh", scope: !383, file: !383, line: 73, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !435, file: !387, line: 459)
!435 = !DISubprogram(name: "sqrt", scope: !383, file: !383, line: 143, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !437, file: !387, line: 478)
!437 = !DISubprogram(name: "tan", scope: !383, file: !383, line: 66, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !439, file: !387, line: 497)
!439 = !DISubprogram(name: "tanh", scope: !383, file: !383, line: 75, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !441, file: !387, line: 1065)
!441 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !442, line: 150, baseType: !386)
!442 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "2fed8744bf26ef122777e2a4593ca401")
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !444, file: !387, line: 1066)
!444 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !442, line: 149, baseType: !445)
!445 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !447, file: !387, line: 1069)
!447 = !DISubprogram(name: "acosh", scope: !383, file: !383, line: 85, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !449, file: !387, line: 1070)
!449 = !DISubprogram(name: "acoshf", scope: !383, file: !383, line: 85, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!450 = !DISubroutineType(types: !451)
!451 = !{!445, !445}
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !453, file: !387, line: 1071)
!453 = !DISubprogram(name: "acoshl", scope: !383, file: !383, line: 85, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!454 = !DISubroutineType(types: !455)
!455 = !{!456, !456}
!456 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !458, file: !387, line: 1073)
!458 = !DISubprogram(name: "asinh", scope: !383, file: !383, line: 87, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !460, file: !387, line: 1074)
!460 = !DISubprogram(name: "asinhf", scope: !383, file: !383, line: 87, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !462, file: !387, line: 1075)
!462 = !DISubprogram(name: "asinhl", scope: !383, file: !383, line: 87, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !464, file: !387, line: 1077)
!464 = !DISubprogram(name: "atanh", scope: !383, file: !383, line: 89, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !466, file: !387, line: 1078)
!466 = !DISubprogram(name: "atanhf", scope: !383, file: !383, line: 89, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !468, file: !387, line: 1079)
!468 = !DISubprogram(name: "atanhl", scope: !383, file: !383, line: 89, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !470, file: !387, line: 1081)
!470 = !DISubprogram(name: "cbrt", scope: !383, file: !383, line: 152, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !472, file: !387, line: 1082)
!472 = !DISubprogram(name: "cbrtf", scope: !383, file: !383, line: 152, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !474, file: !387, line: 1083)
!474 = !DISubprogram(name: "cbrtl", scope: !383, file: !383, line: 152, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !476, file: !387, line: 1085)
!476 = !DISubprogram(name: "copysign", scope: !383, file: !383, line: 196, type: !394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !387, line: 1086)
!478 = !DISubprogram(name: "copysignf", scope: !383, file: !383, line: 196, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!479 = !DISubroutineType(types: !480)
!480 = !{!445, !445, !445}
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !482, file: !387, line: 1087)
!482 = !DISubprogram(name: "copysignl", scope: !383, file: !383, line: 196, type: !483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!483 = !DISubroutineType(types: !484)
!484 = !{!456, !456, !456}
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !486, file: !387, line: 1089)
!486 = !DISubprogram(name: "erf", scope: !383, file: !383, line: 228, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !488, file: !387, line: 1090)
!488 = !DISubprogram(name: "erff", scope: !383, file: !383, line: 228, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !490, file: !387, line: 1091)
!490 = !DISubprogram(name: "erfl", scope: !383, file: !383, line: 228, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !492, file: !387, line: 1093)
!492 = !DISubprogram(name: "erfc", scope: !383, file: !383, line: 229, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !494, file: !387, line: 1094)
!494 = !DISubprogram(name: "erfcf", scope: !383, file: !383, line: 229, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !496, file: !387, line: 1095)
!496 = !DISubprogram(name: "erfcl", scope: !383, file: !383, line: 229, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !498, file: !387, line: 1097)
!498 = !DISubprogram(name: "exp2", scope: !383, file: !383, line: 130, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !500, file: !387, line: 1098)
!500 = !DISubprogram(name: "exp2f", scope: !383, file: !383, line: 130, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !502, file: !387, line: 1099)
!502 = !DISubprogram(name: "exp2l", scope: !383, file: !383, line: 130, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !504, file: !387, line: 1101)
!504 = !DISubprogram(name: "expm1", scope: !383, file: !383, line: 119, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !506, file: !387, line: 1102)
!506 = !DISubprogram(name: "expm1f", scope: !383, file: !383, line: 119, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !508, file: !387, line: 1103)
!508 = !DISubprogram(name: "expm1l", scope: !383, file: !383, line: 119, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !510, file: !387, line: 1105)
!510 = !DISubprogram(name: "fdim", scope: !383, file: !383, line: 326, type: !394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !512, file: !387, line: 1106)
!512 = !DISubprogram(name: "fdimf", scope: !383, file: !383, line: 326, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !514, file: !387, line: 1107)
!514 = !DISubprogram(name: "fdiml", scope: !383, file: !383, line: 326, type: !483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !516, file: !387, line: 1109)
!516 = !DISubprogram(name: "fma", scope: !383, file: !383, line: 335, type: !517, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!517 = !DISubroutineType(types: !518)
!518 = !{!386, !386, !386, !386}
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !520, file: !387, line: 1110)
!520 = !DISubprogram(name: "fmaf", scope: !383, file: !383, line: 335, type: !521, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!521 = !DISubroutineType(types: !522)
!522 = !{!445, !445, !445, !445}
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !524, file: !387, line: 1111)
!524 = !DISubprogram(name: "fmal", scope: !383, file: !383, line: 335, type: !525, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!525 = !DISubroutineType(types: !526)
!526 = !{!456, !456, !456, !456}
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !528, file: !387, line: 1113)
!528 = !DISubprogram(name: "fmax", scope: !383, file: !383, line: 329, type: !394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !530, file: !387, line: 1114)
!530 = !DISubprogram(name: "fmaxf", scope: !383, file: !383, line: 329, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !532, file: !387, line: 1115)
!532 = !DISubprogram(name: "fmaxl", scope: !383, file: !383, line: 329, type: !483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !534, file: !387, line: 1117)
!534 = !DISubprogram(name: "fmin", scope: !383, file: !383, line: 332, type: !394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !536, file: !387, line: 1118)
!536 = !DISubprogram(name: "fminf", scope: !383, file: !383, line: 332, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !538, file: !387, line: 1119)
!538 = !DISubprogram(name: "fminl", scope: !383, file: !383, line: 332, type: !483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !540, file: !387, line: 1121)
!540 = !DISubprogram(name: "hypot", scope: !383, file: !383, line: 147, type: !394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !542, file: !387, line: 1122)
!542 = !DISubprogram(name: "hypotf", scope: !383, file: !383, line: 147, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !544, file: !387, line: 1123)
!544 = !DISubprogram(name: "hypotl", scope: !383, file: !383, line: 147, type: !483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !546, file: !387, line: 1125)
!546 = !DISubprogram(name: "ilogb", scope: !383, file: !383, line: 280, type: !547, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!547 = !DISubroutineType(types: !548)
!548 = !{!132, !386}
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !550, file: !387, line: 1126)
!550 = !DISubprogram(name: "ilogbf", scope: !383, file: !383, line: 280, type: !551, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!551 = !DISubroutineType(types: !552)
!552 = !{!132, !445}
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !554, file: !387, line: 1127)
!554 = !DISubprogram(name: "ilogbl", scope: !383, file: !383, line: 280, type: !555, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!555 = !DISubroutineType(types: !556)
!556 = !{!132, !456}
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !558, file: !387, line: 1129)
!558 = !DISubprogram(name: "lgamma", scope: !383, file: !383, line: 230, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !560, file: !387, line: 1130)
!560 = !DISubprogram(name: "lgammaf", scope: !383, file: !383, line: 230, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !562, file: !387, line: 1131)
!562 = !DISubprogram(name: "lgammal", scope: !383, file: !383, line: 230, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !564, file: !387, line: 1134)
!564 = !DISubprogram(name: "llrint", scope: !383, file: !383, line: 316, type: !565, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!565 = !DISubroutineType(types: !566)
!566 = !{!567, !386}
!567 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !569, file: !387, line: 1135)
!569 = !DISubprogram(name: "llrintf", scope: !383, file: !383, line: 316, type: !570, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!570 = !DISubroutineType(types: !571)
!571 = !{!567, !445}
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !573, file: !387, line: 1136)
!573 = !DISubprogram(name: "llrintl", scope: !383, file: !383, line: 316, type: !574, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!574 = !DISubroutineType(types: !575)
!575 = !{!567, !456}
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !577, file: !387, line: 1138)
!577 = !DISubprogram(name: "llround", scope: !383, file: !383, line: 322, type: !565, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !579, file: !387, line: 1139)
!579 = !DISubprogram(name: "llroundf", scope: !383, file: !383, line: 322, type: !570, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !581, file: !387, line: 1140)
!581 = !DISubprogram(name: "llroundl", scope: !383, file: !383, line: 322, type: !574, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !583, file: !387, line: 1143)
!583 = !DISubprogram(name: "log1p", scope: !383, file: !383, line: 122, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !585, file: !387, line: 1144)
!585 = !DISubprogram(name: "log1pf", scope: !383, file: !383, line: 122, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !587, file: !387, line: 1145)
!587 = !DISubprogram(name: "log1pl", scope: !383, file: !383, line: 122, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !589, file: !387, line: 1147)
!589 = !DISubprogram(name: "log2", scope: !383, file: !383, line: 133, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !591, file: !387, line: 1148)
!591 = !DISubprogram(name: "log2f", scope: !383, file: !383, line: 133, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !593, file: !387, line: 1149)
!593 = !DISubprogram(name: "log2l", scope: !383, file: !383, line: 133, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !595, file: !387, line: 1151)
!595 = !DISubprogram(name: "logb", scope: !383, file: !383, line: 125, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !597, file: !387, line: 1152)
!597 = !DISubprogram(name: "logbf", scope: !383, file: !383, line: 125, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !599, file: !387, line: 1153)
!599 = !DISubprogram(name: "logbl", scope: !383, file: !383, line: 125, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !601, file: !387, line: 1155)
!601 = !DISubprogram(name: "lrint", scope: !383, file: !383, line: 314, type: !602, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!602 = !DISubroutineType(types: !603)
!603 = !{!165, !386}
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !605, file: !387, line: 1156)
!605 = !DISubprogram(name: "lrintf", scope: !383, file: !383, line: 314, type: !606, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!606 = !DISubroutineType(types: !607)
!607 = !{!165, !445}
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !609, file: !387, line: 1157)
!609 = !DISubprogram(name: "lrintl", scope: !383, file: !383, line: 314, type: !610, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!610 = !DISubroutineType(types: !611)
!611 = !{!165, !456}
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !613, file: !387, line: 1159)
!613 = !DISubprogram(name: "lround", scope: !383, file: !383, line: 320, type: !602, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !615, file: !387, line: 1160)
!615 = !DISubprogram(name: "lroundf", scope: !383, file: !383, line: 320, type: !606, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !617, file: !387, line: 1161)
!617 = !DISubprogram(name: "lroundl", scope: !383, file: !383, line: 320, type: !610, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !619, file: !387, line: 1163)
!619 = !DISubprogram(name: "nan", scope: !383, file: !383, line: 201, type: !620, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!620 = !DISubroutineType(types: !621)
!621 = !{!386, !622}
!622 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !624, file: !387, line: 1164)
!624 = !DISubprogram(name: "nanf", scope: !383, file: !383, line: 201, type: !625, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!625 = !DISubroutineType(types: !626)
!626 = !{!445, !622}
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !628, file: !387, line: 1165)
!628 = !DISubprogram(name: "nanl", scope: !383, file: !383, line: 201, type: !629, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!629 = !DISubroutineType(types: !630)
!630 = !{!456, !622}
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !632, file: !387, line: 1167)
!632 = !DISubprogram(name: "nearbyint", scope: !383, file: !383, line: 294, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !634, file: !387, line: 1168)
!634 = !DISubprogram(name: "nearbyintf", scope: !383, file: !383, line: 294, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !636, file: !387, line: 1169)
!636 = !DISubprogram(name: "nearbyintl", scope: !383, file: !383, line: 294, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !638, file: !387, line: 1171)
!638 = !DISubprogram(name: "nextafter", scope: !383, file: !383, line: 259, type: !394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !640, file: !387, line: 1172)
!640 = !DISubprogram(name: "nextafterf", scope: !383, file: !383, line: 259, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !642, file: !387, line: 1173)
!642 = !DISubprogram(name: "nextafterl", scope: !383, file: !383, line: 259, type: !483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !644, file: !387, line: 1175)
!644 = !DISubprogram(name: "nexttoward", scope: !383, file: !383, line: 261, type: !645, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!645 = !DISubroutineType(types: !646)
!646 = !{!386, !386, !456}
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !648, file: !387, line: 1176)
!648 = !DISubprogram(name: "nexttowardf", scope: !383, file: !383, line: 261, type: !649, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!649 = !DISubroutineType(types: !650)
!650 = !{!445, !445, !456}
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !652, file: !387, line: 1177)
!652 = !DISubprogram(name: "nexttowardl", scope: !383, file: !383, line: 261, type: !483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !654, file: !387, line: 1179)
!654 = !DISubprogram(name: "remainder", scope: !383, file: !383, line: 272, type: !394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !656, file: !387, line: 1180)
!656 = !DISubprogram(name: "remainderf", scope: !383, file: !383, line: 272, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !658, file: !387, line: 1181)
!658 = !DISubprogram(name: "remainderl", scope: !383, file: !383, line: 272, type: !483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !660, file: !387, line: 1183)
!660 = !DISubprogram(name: "remquo", scope: !383, file: !383, line: 307, type: !661, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!661 = !DISubroutineType(types: !662)
!662 = !{!386, !386, !386, !414}
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !664, file: !387, line: 1184)
!664 = !DISubprogram(name: "remquof", scope: !383, file: !383, line: 307, type: !665, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!665 = !DISubroutineType(types: !666)
!666 = !{!445, !445, !445, !414}
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !668, file: !387, line: 1185)
!668 = !DISubprogram(name: "remquol", scope: !383, file: !383, line: 307, type: !669, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!669 = !DISubroutineType(types: !670)
!670 = !{!456, !456, !456, !414}
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !672, file: !387, line: 1187)
!672 = !DISubprogram(name: "rint", scope: !383, file: !383, line: 256, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !674, file: !387, line: 1188)
!674 = !DISubprogram(name: "rintf", scope: !383, file: !383, line: 256, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !676, file: !387, line: 1189)
!676 = !DISubprogram(name: "rintl", scope: !383, file: !383, line: 256, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !678, file: !387, line: 1191)
!678 = !DISubprogram(name: "round", scope: !383, file: !383, line: 298, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !680, file: !387, line: 1192)
!680 = !DISubprogram(name: "roundf", scope: !383, file: !383, line: 298, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !682, file: !387, line: 1193)
!682 = !DISubprogram(name: "roundl", scope: !383, file: !383, line: 298, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !684, file: !387, line: 1195)
!684 = !DISubprogram(name: "scalbln", scope: !383, file: !383, line: 290, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!685 = !DISubroutineType(types: !686)
!686 = !{!386, !386, !165}
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !688, file: !387, line: 1196)
!688 = !DISubprogram(name: "scalblnf", scope: !383, file: !383, line: 290, type: !689, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!689 = !DISubroutineType(types: !690)
!690 = !{!445, !445, !165}
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !692, file: !387, line: 1197)
!692 = !DISubprogram(name: "scalblnl", scope: !383, file: !383, line: 290, type: !693, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!693 = !DISubroutineType(types: !694)
!694 = !{!456, !456, !165}
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !696, file: !387, line: 1199)
!696 = !DISubprogram(name: "scalbn", scope: !383, file: !383, line: 276, type: !417, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !698, file: !387, line: 1200)
!698 = !DISubprogram(name: "scalbnf", scope: !383, file: !383, line: 276, type: !699, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!699 = !DISubroutineType(types: !700)
!700 = !{!445, !445, !132}
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !702, file: !387, line: 1201)
!702 = !DISubprogram(name: "scalbnl", scope: !383, file: !383, line: 276, type: !703, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!703 = !DISubroutineType(types: !704)
!704 = !{!456, !456, !132}
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !706, file: !387, line: 1203)
!706 = !DISubprogram(name: "tgamma", scope: !383, file: !383, line: 235, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !708, file: !387, line: 1204)
!708 = !DISubprogram(name: "tgammaf", scope: !383, file: !383, line: 235, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !710, file: !387, line: 1205)
!710 = !DISubprogram(name: "tgammal", scope: !383, file: !383, line: 235, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !712, file: !387, line: 1207)
!712 = !DISubprogram(name: "trunc", scope: !383, file: !383, line: 302, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !714, file: !387, line: 1208)
!714 = !DISubprogram(name: "truncf", scope: !383, file: !383, line: 302, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !716, file: !387, line: 1209)
!716 = !DISubprogram(name: "truncl", scope: !383, file: !383, line: 302, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !718, file: !720, line: 127)
!718 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !377, line: 62, baseType: !719)
!719 = !DICompositeType(tag: DW_TAG_structure_type, file: !377, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!720 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdlib", directory: "")
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !722, file: !720, line: 128)
!722 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !377, line: 70, baseType: !723)
!723 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !377, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !724, identifier: "_ZTS6ldiv_t")
!724 = !{!725, !726}
!725 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !723, file: !377, line: 68, baseType: !165, size: 64)
!726 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !723, file: !377, line: 69, baseType: !165, size: 64, offset: 64)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !728, file: !720, line: 130)
!728 = !DISubprogram(name: "abort", scope: !377, file: !377, line: 591, type: !729, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!729 = !DISubroutineType(types: !730)
!730 = !{null}
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !732, file: !720, line: 134)
!732 = !DISubprogram(name: "atexit", scope: !377, file: !377, line: 595, type: !733, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!733 = !DISubroutineType(types: !734)
!734 = !{!132, !735}
!735 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !729, size: 64)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !737, file: !720, line: 137)
!737 = !DISubprogram(name: "at_quick_exit", scope: !377, file: !377, line: 600, type: !733, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !739, file: !720, line: 140)
!739 = !DISubprogram(name: "atof", scope: !740, file: !740, line: 25, type: !620, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!740 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "48f612e342a3b16120b9f0760cf29677")
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !742, file: !720, line: 141)
!742 = !DISubprogram(name: "atoi", scope: !377, file: !377, line: 361, type: !743, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!743 = !DISubroutineType(types: !744)
!744 = !{!132, !622}
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !746, file: !720, line: 142)
!746 = !DISubprogram(name: "atol", scope: !377, file: !377, line: 366, type: !747, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!747 = !DISubroutineType(types: !748)
!748 = !{!165, !622}
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !750, file: !720, line: 143)
!750 = !DISubprogram(name: "bsearch", scope: !751, file: !751, line: 20, type: !752, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!751 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "ef5679a99236861b72c28d9a752239e4")
!752 = !DISubroutineType(types: !753)
!753 = !{!143, !754, !754, !756, !756, !759}
!754 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !755, size: 64)
!755 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!756 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !757, line: 46, baseType: !758)
!757 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!758 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!759 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !377, line: 808, baseType: !760)
!760 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !761, size: 64)
!761 = !DISubroutineType(types: !762)
!762 = !{!132, !754, !754}
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !764, file: !720, line: 144)
!764 = !DISubprogram(name: "calloc", scope: !377, file: !377, line: 542, type: !765, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!765 = !DISubroutineType(types: !766)
!766 = !{!143, !756, !756}
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !768, file: !720, line: 145)
!768 = !DISubprogram(name: "div", scope: !377, file: !377, line: 852, type: !769, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!769 = !DISubroutineType(types: !770)
!770 = !{!718, !132, !132}
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !772, file: !720, line: 146)
!772 = !DISubprogram(name: "exit", scope: !377, file: !377, line: 617, type: !773, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!773 = !DISubroutineType(types: !774)
!774 = !{null, !132}
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !776, file: !720, line: 147)
!776 = !DISubprogram(name: "free", scope: !377, file: !377, line: 565, type: !777, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!777 = !DISubroutineType(types: !778)
!778 = !{null, !143}
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !780, file: !720, line: 148)
!780 = !DISubprogram(name: "getenv", scope: !377, file: !377, line: 634, type: !781, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!781 = !DISubroutineType(types: !782)
!782 = !{!783, !622}
!783 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !785, file: !720, line: 149)
!785 = !DISubprogram(name: "labs", scope: !377, file: !377, line: 841, type: !786, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!786 = !DISubroutineType(types: !787)
!787 = !{!165, !165}
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !789, file: !720, line: 150)
!789 = !DISubprogram(name: "ldiv", scope: !377, file: !377, line: 854, type: !790, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!790 = !DISubroutineType(types: !791)
!791 = !{!722, !165, !165}
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !793, file: !720, line: 151)
!793 = !DISubprogram(name: "malloc", scope: !377, file: !377, line: 539, type: !794, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!794 = !DISubroutineType(types: !795)
!795 = !{!143, !756}
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !797, file: !720, line: 153)
!797 = !DISubprogram(name: "mblen", scope: !377, file: !377, line: 922, type: !798, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!798 = !DISubroutineType(types: !799)
!799 = !{!132, !622, !756}
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !801, file: !720, line: 154)
!801 = !DISubprogram(name: "mbstowcs", scope: !377, file: !377, line: 933, type: !802, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!802 = !DISubroutineType(types: !803)
!803 = !{!756, !804, !807, !756}
!804 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !805)
!805 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !806, size: 64)
!806 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!807 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !622)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !809, file: !720, line: 155)
!809 = !DISubprogram(name: "mbtowc", scope: !377, file: !377, line: 925, type: !810, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!810 = !DISubroutineType(types: !811)
!811 = !{!132, !804, !807, !756}
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !813, file: !720, line: 157)
!813 = !DISubprogram(name: "qsort", scope: !377, file: !377, line: 830, type: !814, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!814 = !DISubroutineType(types: !815)
!815 = !{null, !143, !756, !756, !759}
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !817, file: !720, line: 160)
!817 = !DISubprogram(name: "quick_exit", scope: !377, file: !377, line: 623, type: !773, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !819, file: !720, line: 163)
!819 = !DISubprogram(name: "rand", scope: !377, file: !377, line: 453, type: !820, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!820 = !DISubroutineType(types: !821)
!821 = !{!132}
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !823, file: !720, line: 164)
!823 = !DISubprogram(name: "realloc", scope: !377, file: !377, line: 550, type: !824, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!824 = !DISubroutineType(types: !825)
!825 = !{!143, !143, !756}
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !827, file: !720, line: 165)
!827 = !DISubprogram(name: "srand", scope: !377, file: !377, line: 455, type: !828, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!828 = !DISubroutineType(types: !829)
!829 = !{null, !37}
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !831, file: !720, line: 166)
!831 = !DISubprogram(name: "strtod", scope: !377, file: !377, line: 117, type: !832, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!832 = !DISubroutineType(types: !833)
!833 = !{!386, !807, !834}
!834 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !835)
!835 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !783, size: 64)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !837, file: !720, line: 167)
!837 = !DISubprogram(name: "strtol", scope: !377, file: !377, line: 176, type: !838, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!838 = !DISubroutineType(types: !839)
!839 = !{!165, !807, !834, !132}
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !841, file: !720, line: 168)
!841 = !DISubprogram(name: "strtoul", scope: !377, file: !377, line: 180, type: !842, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!842 = !DISubroutineType(types: !843)
!843 = !{!758, !807, !834, !132}
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !845, file: !720, line: 169)
!845 = !DISubprogram(name: "system", scope: !377, file: !377, line: 784, type: !743, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !847, file: !720, line: 171)
!847 = !DISubprogram(name: "wcstombs", scope: !377, file: !377, line: 936, type: !848, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!848 = !DISubroutineType(types: !849)
!849 = !{!756, !850, !851, !756}
!850 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !783)
!851 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !852)
!852 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !853, size: 64)
!853 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !806)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !855, file: !720, line: 172)
!855 = !DISubprogram(name: "wctomb", scope: !377, file: !377, line: 929, type: !856, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!856 = !DISubroutineType(types: !857)
!857 = !{!132, !783, !806}
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !859, file: !720, line: 200)
!859 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !377, line: 80, baseType: !860)
!860 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !377, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !861, identifier: "_ZTS7lldiv_t")
!861 = !{!862, !863}
!862 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !860, file: !377, line: 78, baseType: !567, size: 64)
!863 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !860, file: !377, line: 79, baseType: !567, size: 64, offset: 64)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !865, file: !720, line: 206)
!865 = !DISubprogram(name: "_Exit", scope: !377, file: !377, line: 629, type: !773, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !867, file: !720, line: 210)
!867 = !DISubprogram(name: "llabs", scope: !377, file: !377, line: 844, type: !868, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!868 = !DISubroutineType(types: !869)
!869 = !{!567, !567}
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !871, file: !720, line: 216)
!871 = !DISubprogram(name: "lldiv", scope: !377, file: !377, line: 858, type: !872, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!872 = !DISubroutineType(types: !873)
!873 = !{!859, !567, !567}
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !875, file: !720, line: 227)
!875 = !DISubprogram(name: "atoll", scope: !377, file: !377, line: 373, type: !876, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!876 = !DISubroutineType(types: !877)
!877 = !{!567, !622}
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !879, file: !720, line: 228)
!879 = !DISubprogram(name: "strtoll", scope: !377, file: !377, line: 200, type: !880, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!880 = !DISubroutineType(types: !881)
!881 = !{!567, !807, !834, !132}
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !883, file: !720, line: 229)
!883 = !DISubprogram(name: "strtoull", scope: !377, file: !377, line: 205, type: !884, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!884 = !DISubroutineType(types: !885)
!885 = !{!886, !807, !834, !132}
!886 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !888, file: !720, line: 231)
!888 = !DISubprogram(name: "strtof", scope: !377, file: !377, line: 123, type: !889, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!889 = !DISubroutineType(types: !890)
!890 = !{!445, !807, !834}
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !892, file: !720, line: 232)
!892 = !DISubprogram(name: "strtold", scope: !377, file: !377, line: 126, type: !893, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!893 = !DISubroutineType(types: !894)
!894 = !{!456, !807, !834}
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !859, file: !720, line: 240)
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !865, file: !720, line: 242)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !867, file: !720, line: 244)
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !899, file: !720, line: 245)
!899 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !36, file: !720, line: 213, type: !872, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !871, file: !720, line: 246)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !875, file: !720, line: 248)
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !888, file: !720, line: 249)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !879, file: !720, line: 250)
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !883, file: !720, line: 251)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !892, file: !720, line: 252)
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !728, file: !907, line: 38)
!907 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "4cd0241d66f1b357b386fcd60bc71b0f")
!908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !732, file: !907, line: 39)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !772, file: !907, line: 40)
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !737, file: !907, line: 43)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !817, file: !907, line: 46)
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !718, file: !907, line: 51)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !722, file: !907, line: 52)
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !915, file: !907, line: 54)
!915 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !2, file: !380, line: 79, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !739, file: !907, line: 55)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !742, file: !907, line: 56)
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !746, file: !907, line: 57)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !750, file: !907, line: 58)
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !764, file: !907, line: 59)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !899, file: !907, line: 60)
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !776, file: !907, line: 61)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !780, file: !907, line: 62)
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !785, file: !907, line: 63)
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !789, file: !907, line: 64)
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !793, file: !907, line: 65)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !797, file: !907, line: 67)
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !801, file: !907, line: 68)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !809, file: !907, line: 69)
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !813, file: !907, line: 71)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !819, file: !907, line: 72)
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !823, file: !907, line: 73)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !827, file: !907, line: 74)
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !831, file: !907, line: 75)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !837, file: !907, line: 76)
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !841, file: !907, line: 77)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !845, file: !907, line: 78)
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !847, file: !907, line: 80)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !855, file: !907, line: 81)
!940 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !941, entity: !942, file: !943, line: 58)
!941 = !DINamespace(name: "__gnu_debug", scope: null)
!942 = !DINamespace(name: "__debug", scope: !2)
!943 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "1e1a444391d862db9c9b259fde858dd4")
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !945, file: !946, line: 57)
!945 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !947, file: !946, line: 79, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!946 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "ad32556413cf4ca6a852273de62d0a18")
!947 = !DINamespace(name: "__exception_ptr", scope: !2)
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !947, entity: !949, file: !946, line: 73)
!949 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !946, line: 69, type: !950, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!950 = !DISubroutineType(types: !951)
!951 = !{null, !945}
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !953, file: !954, line: 200)
!953 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !954, file: !954, line: 28, type: !384, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!954 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !956, file: !954, line: 201)
!956 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !954, file: !954, line: 32, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !958, file: !954, line: 202)
!958 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !954, file: !954, line: 34, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !960, file: !954, line: 203)
!960 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !954, file: !954, line: 36, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !962, file: !954, line: 204)
!962 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !954, file: !954, line: 38, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !964, file: !954, line: 205)
!964 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !954, file: !954, line: 42, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !966, file: !954, line: 206)
!966 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !954, file: !954, line: 40, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !968, file: !954, line: 207)
!968 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !954, file: !954, line: 44, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !970, file: !954, line: 208)
!970 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !954, file: !954, line: 46, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !972, file: !954, line: 209)
!972 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !954, file: !954, line: 48, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !974, file: !954, line: 210)
!974 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !954, file: !954, line: 50, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !976, file: !954, line: 211)
!976 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !954, file: !954, line: 52, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !978, file: !954, line: 212)
!978 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !954, file: !954, line: 54, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !980, file: !954, line: 213)
!980 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !954, file: !954, line: 58, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !982, file: !954, line: 214)
!982 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !954, file: !954, line: 56, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !984, file: !954, line: 215)
!984 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !954, file: !954, line: 62, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !986, file: !954, line: 216)
!986 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !954, file: !954, line: 60, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !988, file: !954, line: 217)
!988 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !954, file: !954, line: 64, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !990, file: !954, line: 218)
!990 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !954, file: !954, line: 66, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !992, file: !954, line: 219)
!992 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !954, file: !954, line: 68, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !994, file: !954, line: 220)
!994 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !954, file: !954, line: 70, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !996, file: !954, line: 221)
!996 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !954, file: !954, line: 72, type: !521, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !998, file: !954, line: 222)
!998 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !954, file: !954, line: 74, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1000, file: !954, line: 223)
!1000 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !954, file: !954, line: 76, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1002, file: !954, line: 224)
!1002 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !954, file: !954, line: 78, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1004, file: !954, line: 225)
!1004 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !954, file: !954, line: 80, type: !551, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1006, file: !954, line: 226)
!1006 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !954, file: !954, line: 82, type: !1007, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1007 = !DISubroutineType(types: !1008)
!1008 = !{!445, !445, !414}
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1010, file: !954, line: 227)
!1010 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !954, file: !954, line: 84, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1012, file: !954, line: 228)
!1012 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !954, file: !954, line: 86, type: !551, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1014, file: !954, line: 229)
!1014 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !954, file: !954, line: 91, type: !1015, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!349, !445}
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1018, file: !954, line: 230)
!1018 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !954, file: !954, line: 95, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!349, !445, !445}
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1022, file: !954, line: 231)
!1022 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !954, file: !954, line: 94, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1024, file: !954, line: 232)
!1024 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !954, file: !954, line: 100, type: !1015, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1026, file: !954, line: 233)
!1026 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !954, file: !954, line: 104, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1028, file: !954, line: 234)
!1028 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !954, file: !954, line: 103, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1030, file: !954, line: 235)
!1030 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !954, file: !954, line: 106, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1032, file: !954, line: 236)
!1032 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !954, file: !954, line: 111, type: !1015, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1034, file: !954, line: 237)
!1034 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !954, file: !954, line: 113, type: !1015, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1036, file: !954, line: 238)
!1036 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !954, file: !954, line: 115, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1038, file: !954, line: 239)
!1038 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !954, file: !954, line: 116, type: !786, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1040, file: !954, line: 240)
!1040 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !954, file: !954, line: 118, type: !699, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1042, file: !954, line: 241)
!1042 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !954, file: !954, line: 120, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1044, file: !954, line: 242)
!1044 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !954, file: !954, line: 121, type: !868, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1046, file: !954, line: 243)
!1046 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !954, file: !954, line: 123, type: !570, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1048, file: !954, line: 244)
!1048 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !954, file: !954, line: 133, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1050, file: !954, line: 245)
!1050 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !954, file: !954, line: 125, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1052, file: !954, line: 246)
!1052 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !954, file: !954, line: 127, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1054, file: !954, line: 247)
!1054 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !954, file: !954, line: 129, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1056, file: !954, line: 248)
!1056 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !954, file: !954, line: 131, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1058, file: !954, line: 249)
!1058 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !954, file: !954, line: 135, type: !606, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1060, file: !954, line: 250)
!1060 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !954, file: !954, line: 137, type: !606, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1062, file: !954, line: 251)
!1062 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !954, file: !954, line: 138, type: !570, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1064, file: !954, line: 252)
!1064 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !954, file: !954, line: 140, type: !1065, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{!445, !445, !1067}
!1067 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !445, size: 64)
!1068 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1069, file: !954, line: 253)
!1069 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !954, file: !954, line: 141, type: !620, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1071, file: !954, line: 254)
!1071 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !954, file: !954, line: 142, type: !625, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1073, file: !954, line: 255)
!1073 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !954, file: !954, line: 144, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1075, file: !954, line: 256)
!1075 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !954, file: !954, line: 146, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1077, file: !954, line: 257)
!1077 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !954, file: !954, line: 150, type: !699, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1079, file: !954, line: 258)
!1079 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !954, file: !954, line: 152, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1081, file: !954, line: 259)
!1081 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !954, file: !954, line: 154, type: !665, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1083, file: !954, line: 260)
!1083 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !954, file: !954, line: 156, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1085, file: !954, line: 261)
!1085 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !954, file: !954, line: 158, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1087, file: !954, line: 262)
!1087 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !954, file: !954, line: 160, type: !689, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1088 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1089, file: !954, line: 263)
!1089 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !954, file: !954, line: 162, type: !699, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1091, file: !954, line: 264)
!1091 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !954, file: !954, line: 167, type: !1015, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1093, file: !954, line: 265)
!1093 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !954, file: !954, line: 169, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1094 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1095, file: !954, line: 266)
!1095 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !954, file: !954, line: 171, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1096 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1097, file: !954, line: 267)
!1097 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !954, file: !954, line: 173, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1099, file: !954, line: 268)
!1099 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !954, file: !954, line: 175, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1101, file: !954, line: 269)
!1101 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !954, file: !954, line: 177, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1103, file: !954, line: 270)
!1103 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !954, file: !954, line: 179, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1105, file: !954, line: 271)
!1105 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !954, file: !954, line: 181, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1107, file: !1109, line: 729)
!1107 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !1108, file: !1108, line: 188, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1108 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "77b108a711ff1d970d6aaeeab7921660")
!1109 = !DIFile(filename: "/opt/rocm-5.4.3/llvm/lib/clang/15.0.0/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "0af09435178b3f6de185f06c3a9cbb63")
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1111, file: !1109, line: 730)
!1111 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !1108, file: !1108, line: 191, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1113, file: !1109, line: 731)
!1113 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !1108, file: !1108, line: 194, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1115, file: !1109, line: 732)
!1115 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !1108, file: !1108, line: 197, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1117, file: !1109, line: 733)
!1117 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !1108, file: !1108, line: 200, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1119, file: !1109, line: 734)
!1119 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !1108, file: !1108, line: 203, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1121, file: !1109, line: 735)
!1121 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !1108, file: !1108, line: 206, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1123, file: !1109, line: 736)
!1123 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !1108, file: !1108, line: 209, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1125, file: !1109, line: 737)
!1125 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !1108, file: !1108, line: 212, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1127, file: !1109, line: 738)
!1127 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !1108, file: !1108, line: 215, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1129, file: !1109, line: 739)
!1129 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !1108, file: !1108, line: 218, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1131, file: !1109, line: 740)
!1131 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !1108, file: !1108, line: 221, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1133, file: !1109, line: 741)
!1133 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !1108, file: !1108, line: 233, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1135, file: !1109, line: 742)
!1135 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !1108, file: !1108, line: 242, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1137, file: !1109, line: 743)
!1137 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !1108, file: !1108, line: 251, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1139, file: !1109, line: 744)
!1139 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !1108, file: !1108, line: 254, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1141, file: !1109, line: 745)
!1141 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !1108, file: !1108, line: 257, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1143, file: !1109, line: 746)
!1143 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !1108, file: !1108, line: 260, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1145, file: !1109, line: 747)
!1145 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !1108, file: !1108, line: 263, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1147, file: !1109, line: 748)
!1147 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !1108, file: !1108, line: 269, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1149, file: !1109, line: 749)
!1149 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !1108, file: !1108, line: 272, type: !521, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1151, file: !1109, line: 750)
!1151 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !1108, file: !1108, line: 277, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1153, file: !1109, line: 751)
!1153 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !1108, file: !1108, line: 280, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1155, file: !1109, line: 752)
!1155 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !1108, file: !1108, line: 283, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1157, file: !1109, line: 753)
!1157 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !1108, file: !1108, line: 286, type: !1007, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1159, file: !1109, line: 754)
!1159 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !1108, file: !1108, line: 299, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1161, file: !1109, line: 755)
!1161 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !1108, file: !1108, line: 302, type: !551, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1163, file: !1109, line: 756)
!1163 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !1108, file: !1108, line: 341, type: !699, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1165, file: !1109, line: 757)
!1165 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !1108, file: !1108, line: 344, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1167, file: !1109, line: 758)
!1167 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !1108, file: !1108, line: 347, type: !570, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1169, file: !1109, line: 759)
!1169 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !1108, file: !1108, line: 350, type: !570, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1171, file: !1109, line: 760)
!1171 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !1108, file: !1108, line: 353, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1173, file: !1109, line: 761)
!1173 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !1108, file: !1108, line: 356, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1175, file: !1109, line: 762)
!1175 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !1108, file: !1108, line: 359, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1177, file: !1109, line: 763)
!1177 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !1108, file: !1108, line: 365, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1179, file: !1109, line: 764)
!1179 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !1108, file: !1108, line: 368, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1181, file: !1109, line: 765)
!1181 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !1108, file: !1108, line: 371, type: !606, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1183, file: !1109, line: 766)
!1183 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !1108, file: !1108, line: 374, type: !606, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1185, file: !1109, line: 767)
!1185 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !1108, file: !1108, line: 377, type: !1065, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1187, file: !1109, line: 768)
!1187 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !1108, file: !1108, line: 413, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1189, file: !1109, line: 769)
!1189 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !1108, file: !1108, line: 416, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1191, file: !1109, line: 771)
!1191 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !1108, file: !1108, line: 449, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1193, file: !1109, line: 772)
!1193 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !1108, file: !1108, line: 474, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1195, file: !1109, line: 773)
!1195 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !1108, file: !1108, line: 479, type: !665, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1197, file: !1109, line: 774)
!1197 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !1108, file: !1108, line: 495, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1199, file: !1109, line: 775)
!1199 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !1108, file: !1108, line: 520, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1201, file: !1109, line: 776)
!1201 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !1108, file: !1108, line: 526, type: !689, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1203, file: !1109, line: 777)
!1203 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !1108, file: !1108, line: 532, type: !699, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1205, file: !1109, line: 778)
!1205 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !1108, file: !1108, line: 560, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1207, file: !1109, line: 779)
!1207 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !1108, file: !1108, line: 563, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1209, file: !1109, line: 780)
!1209 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !1108, file: !1108, line: 569, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1211, file: !1109, line: 781)
!1211 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !1108, file: !1108, line: 572, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1213, file: !1109, line: 782)
!1213 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !1108, file: !1108, line: 575, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1215, file: !1109, line: 783)
!1215 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !1108, file: !1108, line: 578, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1217, file: !1109, line: 784)
!1217 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !1108, file: !1108, line: 581, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagOptimized)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1219, file: !1234, line: 64)
!1219 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !1220, line: 6, baseType: !1221)
!1220 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!1221 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !1222, line: 21, baseType: !1223)
!1222 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!1223 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1222, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !1224, identifier: "_ZTS11__mbstate_t")
!1224 = !{!1225, !1226}
!1225 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !1223, file: !1222, line: 15, baseType: !132, size: 32)
!1226 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !1223, file: !1222, line: 20, baseType: !1227, size: 32, offset: 32)
!1227 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1223, file: !1222, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !1228, identifier: "_ZTSN11__mbstate_tUt_E")
!1228 = !{!1229, !1230}
!1229 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !1227, file: !1222, line: 18, baseType: !37, size: 32)
!1230 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !1227, file: !1222, line: 19, baseType: !1231, size: 32)
!1231 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 32, elements: !1232)
!1232 = !{!1233}
!1233 = !DISubrange(count: 4)
!1234 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cwchar", directory: "")
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1236, file: !1234, line: 141)
!1236 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !1237, line: 20, baseType: !37)
!1237 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1239, file: !1234, line: 143)
!1239 = !DISubprogram(name: "btowc", scope: !1240, file: !1240, line: 318, type: !1241, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1240 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "8900d9ecbbe40d052c41becfbc5b5531")
!1241 = !DISubroutineType(types: !1242)
!1242 = !{!1236, !132}
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1244, file: !1234, line: 144)
!1244 = !DISubprogram(name: "fgetwc", scope: !1240, file: !1240, line: 726, type: !1245, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1245 = !DISubroutineType(types: !1246)
!1246 = !{!1236, !1247}
!1247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1248, size: 64)
!1248 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !1249, line: 5, baseType: !1250)
!1249 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!1250 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !1251, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !1252, identifier: "_ZTS8_IO_FILE")
!1251 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "f3c970561f3408448ce03a9676ead8f4")
!1252 = !{!1253, !1254, !1255, !1256, !1257, !1258, !1259, !1260, !1261, !1262, !1263, !1264, !1265, !1268, !1270, !1271, !1272, !1274, !1276, !1278, !1282, !1285, !1287, !1290, !1293, !1294, !1295, !1296, !1297}
!1253 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !1250, file: !1251, line: 51, baseType: !132, size: 32)
!1254 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !1250, file: !1251, line: 54, baseType: !783, size: 64, offset: 64)
!1255 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !1250, file: !1251, line: 55, baseType: !783, size: 64, offset: 128)
!1256 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !1250, file: !1251, line: 56, baseType: !783, size: 64, offset: 192)
!1257 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !1250, file: !1251, line: 57, baseType: !783, size: 64, offset: 256)
!1258 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !1250, file: !1251, line: 58, baseType: !783, size: 64, offset: 320)
!1259 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !1250, file: !1251, line: 59, baseType: !783, size: 64, offset: 384)
!1260 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !1250, file: !1251, line: 60, baseType: !783, size: 64, offset: 448)
!1261 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !1250, file: !1251, line: 61, baseType: !783, size: 64, offset: 512)
!1262 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !1250, file: !1251, line: 64, baseType: !783, size: 64, offset: 576)
!1263 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !1250, file: !1251, line: 65, baseType: !783, size: 64, offset: 640)
!1264 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !1250, file: !1251, line: 66, baseType: !783, size: 64, offset: 704)
!1265 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !1250, file: !1251, line: 68, baseType: !1266, size: 64, offset: 768)
!1266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1267, size: 64)
!1267 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !1251, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!1268 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !1250, file: !1251, line: 70, baseType: !1269, size: 64, offset: 832)
!1269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1250, size: 64)
!1270 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !1250, file: !1251, line: 72, baseType: !132, size: 32, offset: 896)
!1271 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !1250, file: !1251, line: 73, baseType: !132, size: 32, offset: 928)
!1272 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !1250, file: !1251, line: 74, baseType: !1273, size: 64, offset: 960)
!1273 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !151, line: 152, baseType: !165)
!1274 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !1250, file: !1251, line: 77, baseType: !1275, size: 16, offset: 1024)
!1275 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1276 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !1250, file: !1251, line: 78, baseType: !1277, size: 8, offset: 1040)
!1277 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1278 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !1250, file: !1251, line: 79, baseType: !1279, size: 8, offset: 1048)
!1279 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 8, elements: !1280)
!1280 = !{!1281}
!1281 = !DISubrange(count: 1)
!1282 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !1250, file: !1251, line: 81, baseType: !1283, size: 64, offset: 1088)
!1283 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1284, size: 64)
!1284 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !1251, line: 43, baseType: null)
!1285 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !1250, file: !1251, line: 89, baseType: !1286, size: 64, offset: 1152)
!1286 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !151, line: 153, baseType: !165)
!1287 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !1250, file: !1251, line: 91, baseType: !1288, size: 64, offset: 1216)
!1288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1289, size: 64)
!1289 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !1251, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!1290 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !1250, file: !1251, line: 92, baseType: !1291, size: 64, offset: 1280)
!1291 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1292, size: 64)
!1292 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !1251, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!1293 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !1250, file: !1251, line: 93, baseType: !1269, size: 64, offset: 1344)
!1294 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !1250, file: !1251, line: 94, baseType: !143, size: 64, offset: 1408)
!1295 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !1250, file: !1251, line: 95, baseType: !756, size: 64, offset: 1472)
!1296 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !1250, file: !1251, line: 96, baseType: !132, size: 32, offset: 1536)
!1297 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !1250, file: !1251, line: 98, baseType: !1298, size: 160, offset: 1568)
!1298 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, elements: !1299)
!1299 = !{!1300}
!1300 = !DISubrange(count: 20)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1302, file: !1234, line: 145)
!1302 = !DISubprogram(name: "fgetws", scope: !1240, file: !1240, line: 755, type: !1303, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!805, !804, !132, !1305}
!1305 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1247)
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1307, file: !1234, line: 146)
!1307 = !DISubprogram(name: "fputwc", scope: !1240, file: !1240, line: 740, type: !1308, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1308 = !DISubroutineType(types: !1309)
!1309 = !{!1236, !806, !1247}
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1311, file: !1234, line: 147)
!1311 = !DISubprogram(name: "fputws", scope: !1240, file: !1240, line: 762, type: !1312, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1312 = !DISubroutineType(types: !1313)
!1313 = !{!132, !851, !1305}
!1314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1315, file: !1234, line: 148)
!1315 = !DISubprogram(name: "fwide", scope: !1240, file: !1240, line: 573, type: !1316, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1316 = !DISubroutineType(types: !1317)
!1317 = !{!132, !1247, !132}
!1318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1319, file: !1234, line: 149)
!1319 = !DISubprogram(name: "fwprintf", scope: !1240, file: !1240, line: 580, type: !1320, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1320 = !DISubroutineType(types: !1321)
!1321 = !{!132, !1305, !851, null}
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1323, file: !1234, line: 150)
!1323 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !1240, file: !1240, line: 640, type: !1320, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1325, file: !1234, line: 151)
!1325 = !DISubprogram(name: "getwc", scope: !1240, file: !1240, line: 727, type: !1245, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1327, file: !1234, line: 152)
!1327 = !DISubprogram(name: "getwchar", scope: !1240, file: !1240, line: 733, type: !1328, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1328 = !DISubroutineType(types: !1329)
!1329 = !{!1236}
!1330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1331, file: !1234, line: 153)
!1331 = !DISubprogram(name: "mbrlen", scope: !1240, file: !1240, line: 329, type: !1332, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1332 = !DISubroutineType(types: !1333)
!1333 = !{!756, !807, !756, !1334}
!1334 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1335)
!1335 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1219, size: 64)
!1336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1337, file: !1234, line: 154)
!1337 = !DISubprogram(name: "mbrtowc", scope: !1240, file: !1240, line: 296, type: !1338, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1338 = !DISubroutineType(types: !1339)
!1339 = !{!756, !804, !807, !756, !1334}
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1341, file: !1234, line: 155)
!1341 = !DISubprogram(name: "mbsinit", scope: !1240, file: !1240, line: 292, type: !1342, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1342 = !DISubroutineType(types: !1343)
!1343 = !{!132, !1344}
!1344 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1345, size: 64)
!1345 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1219)
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1347, file: !1234, line: 156)
!1347 = !DISubprogram(name: "mbsrtowcs", scope: !1240, file: !1240, line: 337, type: !1348, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1348 = !DISubroutineType(types: !1349)
!1349 = !{!756, !804, !1350, !756, !1334}
!1350 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1351)
!1351 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !622, size: 64)
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1353, file: !1234, line: 157)
!1353 = !DISubprogram(name: "putwc", scope: !1240, file: !1240, line: 741, type: !1308, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1355, file: !1234, line: 158)
!1355 = !DISubprogram(name: "putwchar", scope: !1240, file: !1240, line: 747, type: !1356, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1356 = !DISubroutineType(types: !1357)
!1357 = !{!1236, !806}
!1358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1359, file: !1234, line: 160)
!1359 = !DISubprogram(name: "swprintf", scope: !1240, file: !1240, line: 590, type: !1360, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1360 = !DISubroutineType(types: !1361)
!1361 = !{!132, !804, !756, !851, null}
!1362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1363, file: !1234, line: 162)
!1363 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !1240, file: !1240, line: 647, type: !1364, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1364 = !DISubroutineType(types: !1365)
!1365 = !{!132, !851, !851, null}
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1367, file: !1234, line: 163)
!1367 = !DISubprogram(name: "ungetwc", scope: !1240, file: !1240, line: 770, type: !1368, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1368 = !DISubroutineType(types: !1369)
!1369 = !{!1236, !1236, !1247}
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1371, file: !1234, line: 164)
!1371 = !DISubprogram(name: "vfwprintf", scope: !1240, file: !1240, line: 598, type: !1372, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1372 = !DISubroutineType(types: !1373)
!1373 = !{!132, !1305, !851, !1374}
!1374 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1375, size: 64)
!1375 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !1376, size: 192, flags: DIFlagTypePassByValue, elements: !1377, identifier: "_ZTS13__va_list_tag")
!1376 = !DIFile(filename: "test.C", directory: "/mnt/d/repos/SW4CK/src")
!1377 = !{!1378, !1379, !1380, !1381}
!1378 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !1375, file: !1376, baseType: !37, size: 32)
!1379 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !1375, file: !1376, baseType: !37, size: 32, offset: 32)
!1380 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !1375, file: !1376, baseType: !143, size: 64, offset: 64)
!1381 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !1375, file: !1376, baseType: !143, size: 64, offset: 128)
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1383, file: !1234, line: 166)
!1383 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !1240, file: !1240, line: 693, type: !1372, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1385, file: !1234, line: 169)
!1385 = !DISubprogram(name: "vswprintf", scope: !1240, file: !1240, line: 611, type: !1386, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1386 = !DISubroutineType(types: !1387)
!1387 = !{!132, !804, !756, !851, !1374}
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1389, file: !1234, line: 172)
!1389 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !1240, file: !1240, line: 700, type: !1390, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1390 = !DISubroutineType(types: !1391)
!1391 = !{!132, !851, !851, !1374}
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1393, file: !1234, line: 174)
!1393 = !DISubprogram(name: "vwprintf", scope: !1240, file: !1240, line: 606, type: !1394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1394 = !DISubroutineType(types: !1395)
!1395 = !{!132, !851, !1374}
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1397, file: !1234, line: 176)
!1397 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !1240, file: !1240, line: 697, type: !1394, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1399, file: !1234, line: 178)
!1399 = !DISubprogram(name: "wcrtomb", scope: !1240, file: !1240, line: 301, type: !1400, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1400 = !DISubroutineType(types: !1401)
!1401 = !{!756, !850, !806, !1334}
!1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1403, file: !1234, line: 179)
!1403 = !DISubprogram(name: "wcscat", scope: !1240, file: !1240, line: 97, type: !1404, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1404 = !DISubroutineType(types: !1405)
!1405 = !{!805, !804, !851}
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1407, file: !1234, line: 180)
!1407 = !DISubprogram(name: "wcscmp", scope: !1240, file: !1240, line: 106, type: !1408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1408 = !DISubroutineType(types: !1409)
!1409 = !{!132, !852, !852}
!1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1411, file: !1234, line: 181)
!1411 = !DISubprogram(name: "wcscoll", scope: !1240, file: !1240, line: 131, type: !1408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1413, file: !1234, line: 182)
!1413 = !DISubprogram(name: "wcscpy", scope: !1240, file: !1240, line: 87, type: !1404, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1415, file: !1234, line: 183)
!1415 = !DISubprogram(name: "wcscspn", scope: !1240, file: !1240, line: 187, type: !1416, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1416 = !DISubroutineType(types: !1417)
!1417 = !{!756, !852, !852}
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1419, file: !1234, line: 184)
!1419 = !DISubprogram(name: "wcsftime", scope: !1240, file: !1240, line: 834, type: !1420, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1420 = !DISubroutineType(types: !1421)
!1421 = !{!756, !804, !756, !851, !1422}
!1422 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1423)
!1423 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1424, size: 64)
!1424 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1425)
!1425 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1240, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1427, file: !1234, line: 185)
!1427 = !DISubprogram(name: "wcslen", scope: !1240, file: !1240, line: 222, type: !1428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1428 = !DISubroutineType(types: !1429)
!1429 = !{!756, !852}
!1430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1431, file: !1234, line: 186)
!1431 = !DISubprogram(name: "wcsncat", scope: !1240, file: !1240, line: 101, type: !1432, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1432 = !DISubroutineType(types: !1433)
!1433 = !{!805, !804, !851, !756}
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1435, file: !1234, line: 187)
!1435 = !DISubprogram(name: "wcsncmp", scope: !1240, file: !1240, line: 109, type: !1436, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1436 = !DISubroutineType(types: !1437)
!1437 = !{!132, !852, !852, !756}
!1438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1439, file: !1234, line: 188)
!1439 = !DISubprogram(name: "wcsncpy", scope: !1240, file: !1240, line: 92, type: !1432, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1441, file: !1234, line: 189)
!1441 = !DISubprogram(name: "wcsrtombs", scope: !1240, file: !1240, line: 343, type: !1442, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1442 = !DISubroutineType(types: !1443)
!1443 = !{!756, !850, !1444, !756, !1334}
!1444 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1445)
!1445 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !852, size: 64)
!1446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1447, file: !1234, line: 190)
!1447 = !DISubprogram(name: "wcsspn", scope: !1240, file: !1240, line: 191, type: !1416, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1449, file: !1234, line: 191)
!1449 = !DISubprogram(name: "wcstod", scope: !1240, file: !1240, line: 377, type: !1450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1450 = !DISubroutineType(types: !1451)
!1451 = !{!386, !851, !1452}
!1452 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1453)
!1453 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !805, size: 64)
!1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1455, file: !1234, line: 193)
!1455 = !DISubprogram(name: "wcstof", scope: !1240, file: !1240, line: 382, type: !1456, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1456 = !DISubroutineType(types: !1457)
!1457 = !{!445, !851, !1452}
!1458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1459, file: !1234, line: 195)
!1459 = !DISubprogram(name: "wcstok", scope: !1240, file: !1240, line: 217, type: !1460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1460 = !DISubroutineType(types: !1461)
!1461 = !{!805, !804, !851, !1452}
!1462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1463, file: !1234, line: 196)
!1463 = !DISubprogram(name: "wcstol", scope: !1240, file: !1240, line: 428, type: !1464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1464 = !DISubroutineType(types: !1465)
!1465 = !{!165, !851, !1452, !132}
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1467, file: !1234, line: 197)
!1467 = !DISubprogram(name: "wcstoul", scope: !1240, file: !1240, line: 433, type: !1468, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1468 = !DISubroutineType(types: !1469)
!1469 = !{!758, !851, !1452, !132}
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1471, file: !1234, line: 198)
!1471 = !DISubprogram(name: "wcsxfrm", scope: !1240, file: !1240, line: 135, type: !1472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1472 = !DISubroutineType(types: !1473)
!1473 = !{!756, !804, !851, !756}
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1475, file: !1234, line: 199)
!1475 = !DISubprogram(name: "wctob", scope: !1240, file: !1240, line: 324, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1476 = !DISubroutineType(types: !1477)
!1477 = !{!132, !1236}
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1479, file: !1234, line: 200)
!1479 = !DISubprogram(name: "wmemcmp", scope: !1240, file: !1240, line: 258, type: !1436, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1481, file: !1234, line: 201)
!1481 = !DISubprogram(name: "wmemcpy", scope: !1240, file: !1240, line: 262, type: !1432, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1483, file: !1234, line: 202)
!1483 = !DISubprogram(name: "wmemmove", scope: !1240, file: !1240, line: 267, type: !1484, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1484 = !DISubroutineType(types: !1485)
!1485 = !{!805, !805, !852, !756}
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1487, file: !1234, line: 203)
!1487 = !DISubprogram(name: "wmemset", scope: !1240, file: !1240, line: 271, type: !1488, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{!805, !805, !806, !756}
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1491, file: !1234, line: 204)
!1491 = !DISubprogram(name: "wprintf", scope: !1240, file: !1240, line: 587, type: !1492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1492 = !DISubroutineType(types: !1493)
!1493 = !{!132, !851, null}
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1495, file: !1234, line: 205)
!1495 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !1240, file: !1240, line: 644, type: !1492, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1497, file: !1234, line: 206)
!1497 = !DISubprogram(name: "wcschr", scope: !1240, file: !1240, line: 164, type: !1498, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1498 = !DISubroutineType(types: !1499)
!1499 = !{!805, !852, !806}
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1501, file: !1234, line: 207)
!1501 = !DISubprogram(name: "wcspbrk", scope: !1240, file: !1240, line: 201, type: !1502, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1502 = !DISubroutineType(types: !1503)
!1503 = !{!805, !852, !852}
!1504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1505, file: !1234, line: 208)
!1505 = !DISubprogram(name: "wcsrchr", scope: !1240, file: !1240, line: 174, type: !1498, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1507, file: !1234, line: 209)
!1507 = !DISubprogram(name: "wcsstr", scope: !1240, file: !1240, line: 212, type: !1502, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1509, file: !1234, line: 210)
!1509 = !DISubprogram(name: "wmemchr", scope: !1240, file: !1240, line: 253, type: !1510, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1510 = !DISubroutineType(types: !1511)
!1511 = !{!805, !852, !806, !756}
!1512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1513, file: !1234, line: 251)
!1513 = !DISubprogram(name: "wcstold", scope: !1240, file: !1240, line: 384, type: !1514, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1514 = !DISubroutineType(types: !1515)
!1515 = !{!456, !851, !1452}
!1516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1517, file: !1234, line: 260)
!1517 = !DISubprogram(name: "wcstoll", scope: !1240, file: !1240, line: 441, type: !1518, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1518 = !DISubroutineType(types: !1519)
!1519 = !{!567, !851, !1452, !132}
!1520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1521, file: !1234, line: 261)
!1521 = !DISubprogram(name: "wcstoull", scope: !1240, file: !1240, line: 448, type: !1522, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1522 = !DISubroutineType(types: !1523)
!1523 = !{!886, !851, !1452, !132}
!1524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1513, file: !1234, line: 267)
!1525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1517, file: !1234, line: 268)
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1521, file: !1234, line: 269)
!1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1455, file: !1234, line: 283)
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1383, file: !1234, line: 286)
!1529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1389, file: !1234, line: 289)
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1397, file: !1234, line: 292)
!1531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1513, file: !1234, line: 296)
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1517, file: !1234, line: 297)
!1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1521, file: !1234, line: 298)
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1535, file: !1538, line: 47)
!1535 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1536, line: 24, baseType: !1537)
!1536 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "081edea97425b3437dded4a7fe223193")
!1537 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !151, line: 37, baseType: !1277)
!1538 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdint", directory: "")
!1539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1540, file: !1538, line: 48)
!1540 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1536, line: 25, baseType: !1541)
!1541 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !151, line: 39, baseType: !1542)
!1542 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1544, file: !1538, line: 49)
!1544 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1536, line: 26, baseType: !1545)
!1545 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !151, line: 41, baseType: !132)
!1546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1547, file: !1538, line: 50)
!1547 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1536, line: 27, baseType: !1548)
!1548 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !151, line: 44, baseType: !165)
!1549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1550, file: !1538, line: 52)
!1550 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !218, line: 58, baseType: !1277)
!1551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1552, file: !1538, line: 53)
!1552 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !218, line: 60, baseType: !165)
!1553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1554, file: !1538, line: 54)
!1554 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !218, line: 61, baseType: !165)
!1555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1556, file: !1538, line: 55)
!1556 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !218, line: 62, baseType: !165)
!1557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1558, file: !1538, line: 57)
!1558 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !218, line: 43, baseType: !1559)
!1559 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !151, line: 52, baseType: !1537)
!1560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1561, file: !1538, line: 58)
!1561 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !218, line: 44, baseType: !1562)
!1562 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !151, line: 54, baseType: !1541)
!1563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1564, file: !1538, line: 59)
!1564 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !218, line: 45, baseType: !1565)
!1565 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !151, line: 56, baseType: !1545)
!1566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1567, file: !1538, line: 60)
!1567 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !218, line: 46, baseType: !1568)
!1568 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !151, line: 58, baseType: !1548)
!1569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !217, file: !1538, line: 62)
!1570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1571, file: !1538, line: 63)
!1571 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !218, line: 87, baseType: !165)
!1572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1573, file: !1538, line: 65)
!1573 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !149, line: 24, baseType: !1574)
!1574 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !151, line: 38, baseType: !314)
!1575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1576, file: !1538, line: 66)
!1576 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !149, line: 25, baseType: !1577)
!1577 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !151, line: 40, baseType: !1275)
!1578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !148, file: !1538, line: 67)
!1579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1580, file: !1538, line: 68)
!1580 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !149, line: 27, baseType: !1581)
!1581 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !151, line: 45, baseType: !758)
!1582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1583, file: !1538, line: 70)
!1583 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !218, line: 71, baseType: !314)
!1584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1585, file: !1538, line: 71)
!1585 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !218, line: 73, baseType: !758)
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1587, file: !1538, line: 72)
!1587 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !218, line: 74, baseType: !758)
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1589, file: !1538, line: 73)
!1589 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !218, line: 75, baseType: !758)
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1591, file: !1538, line: 75)
!1591 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !218, line: 49, baseType: !1592)
!1592 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !151, line: 53, baseType: !1574)
!1593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1594, file: !1538, line: 76)
!1594 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !218, line: 50, baseType: !1595)
!1595 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !151, line: 55, baseType: !1577)
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1597, file: !1538, line: 77)
!1597 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !218, line: 51, baseType: !1598)
!1598 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !151, line: 57, baseType: !150)
!1599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1600, file: !1538, line: 78)
!1600 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !218, line: 52, baseType: !1601)
!1601 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !151, line: 59, baseType: !1581)
!1602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1603, file: !1538, line: 80)
!1603 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !218, line: 102, baseType: !1604)
!1604 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !151, line: 73, baseType: !758)
!1605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1606, file: !1538, line: 81)
!1606 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !218, line: 90, baseType: !758)
!1607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1608, file: !1609, line: 44)
!1608 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !2, file: !313, line: 258, baseType: !758)
!1609 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ext/new_allocator.h", directory: "", checksumkind: CSK_MD5, checksum: "d815d3ddb625b8849e2bd401d0f6b354")
!1610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !312, file: !1609, line: 45)
!1611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1612, file: !1614, line: 53)
!1612 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1613, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1613 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "0cf373fc44eed8073800bdb9da87b72f")
!1614 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/clocale", directory: "")
!1615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1616, file: !1614, line: 54)
!1616 = !DISubprogram(name: "setlocale", scope: !1613, file: !1613, line: 122, type: !1617, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1617 = !DISubroutineType(types: !1618)
!1618 = !{!783, !132, !622}
!1619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1620, file: !1614, line: 55)
!1620 = !DISubprogram(name: "localeconv", scope: !1613, file: !1613, line: 125, type: !1621, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1621 = !DISubroutineType(types: !1622)
!1622 = !{!1623}
!1623 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1612, size: 64)
!1624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1625, file: !1627, line: 64)
!1625 = !DISubprogram(name: "isalnum", scope: !1626, file: !1626, line: 108, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1626 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "36575f934ef4fe7e9d50a3cb17bd5c66")
!1627 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cctype", directory: "")
!1628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1629, file: !1627, line: 65)
!1629 = !DISubprogram(name: "isalpha", scope: !1626, file: !1626, line: 109, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1631, file: !1627, line: 66)
!1631 = !DISubprogram(name: "iscntrl", scope: !1626, file: !1626, line: 110, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1633, file: !1627, line: 67)
!1633 = !DISubprogram(name: "isdigit", scope: !1626, file: !1626, line: 111, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1635, file: !1627, line: 68)
!1635 = !DISubprogram(name: "isgraph", scope: !1626, file: !1626, line: 113, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1637, file: !1627, line: 69)
!1637 = !DISubprogram(name: "islower", scope: !1626, file: !1626, line: 112, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1639, file: !1627, line: 70)
!1639 = !DISubprogram(name: "isprint", scope: !1626, file: !1626, line: 114, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1641, file: !1627, line: 71)
!1641 = !DISubprogram(name: "ispunct", scope: !1626, file: !1626, line: 115, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1643, file: !1627, line: 72)
!1643 = !DISubprogram(name: "isspace", scope: !1626, file: !1626, line: 116, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1645, file: !1627, line: 73)
!1645 = !DISubprogram(name: "isupper", scope: !1626, file: !1626, line: 117, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1647, file: !1627, line: 74)
!1647 = !DISubprogram(name: "isxdigit", scope: !1626, file: !1626, line: 118, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1649, file: !1627, line: 75)
!1649 = !DISubprogram(name: "tolower", scope: !1626, file: !1626, line: 122, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1651, file: !1627, line: 76)
!1651 = !DISubprogram(name: "toupper", scope: !1626, file: !1626, line: 125, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1653, file: !1627, line: 87)
!1653 = !DISubprogram(name: "isblank", scope: !1626, file: !1626, line: 130, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1655, file: !1657, line: 98)
!1655 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1656, line: 7, baseType: !1250)
!1656 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1657 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdio", directory: "")
!1658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1659, file: !1657, line: 99)
!1659 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1660, line: 84, baseType: !1661)
!1660 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "5b917eded35ce2507d1e294bf8cb74d7")
!1661 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1662, line: 14, baseType: !1663)
!1662 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1663 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1662, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1665, file: !1657, line: 101)
!1665 = !DISubprogram(name: "clearerr", scope: !1660, file: !1660, line: 757, type: !1666, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1666 = !DISubroutineType(types: !1667)
!1667 = !{null, !1668}
!1668 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1655, size: 64)
!1669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1670, file: !1657, line: 102)
!1670 = !DISubprogram(name: "fclose", scope: !1660, file: !1660, line: 213, type: !1671, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1671 = !DISubroutineType(types: !1672)
!1672 = !{!132, !1668}
!1673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1674, file: !1657, line: 103)
!1674 = !DISubprogram(name: "feof", scope: !1660, file: !1660, line: 759, type: !1671, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1676, file: !1657, line: 104)
!1676 = !DISubprogram(name: "ferror", scope: !1660, file: !1660, line: 761, type: !1671, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1678, file: !1657, line: 105)
!1678 = !DISubprogram(name: "fflush", scope: !1660, file: !1660, line: 218, type: !1671, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1680, file: !1657, line: 106)
!1680 = !DISubprogram(name: "fgetc", scope: !1660, file: !1660, line: 485, type: !1671, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1682, file: !1657, line: 107)
!1682 = !DISubprogram(name: "fgetpos", scope: !1660, file: !1660, line: 731, type: !1683, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1683 = !DISubroutineType(types: !1684)
!1684 = !{!132, !1685, !1686}
!1685 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1668)
!1686 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1687)
!1687 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1659, size: 64)
!1688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1689, file: !1657, line: 108)
!1689 = !DISubprogram(name: "fgets", scope: !1660, file: !1660, line: 564, type: !1690, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1690 = !DISubroutineType(types: !1691)
!1691 = !{!783, !850, !132, !1685}
!1692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1693, file: !1657, line: 109)
!1693 = !DISubprogram(name: "fopen", scope: !1660, file: !1660, line: 246, type: !1694, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1694 = !DISubroutineType(types: !1695)
!1695 = !{!1668, !807, !807}
!1696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1697, file: !1657, line: 110)
!1697 = !DISubprogram(name: "fprintf", scope: !1660, file: !1660, line: 326, type: !1698, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1698 = !DISubroutineType(types: !1699)
!1699 = !{!132, !1685, !807, null}
!1700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1701, file: !1657, line: 111)
!1701 = !DISubprogram(name: "fputc", scope: !1660, file: !1660, line: 521, type: !1702, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1702 = !DISubroutineType(types: !1703)
!1703 = !{!132, !132, !1668}
!1704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1705, file: !1657, line: 112)
!1705 = !DISubprogram(name: "fputs", scope: !1660, file: !1660, line: 626, type: !1706, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1706 = !DISubroutineType(types: !1707)
!1707 = !{!132, !807, !1685}
!1708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1709, file: !1657, line: 113)
!1709 = !DISubprogram(name: "fread", scope: !1660, file: !1660, line: 646, type: !1710, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1710 = !DISubroutineType(types: !1711)
!1711 = !{!756, !1712, !756, !756, !1685}
!1712 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !143)
!1713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1714, file: !1657, line: 114)
!1714 = !DISubprogram(name: "freopen", scope: !1660, file: !1660, line: 252, type: !1715, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1715 = !DISubroutineType(types: !1716)
!1716 = !{!1668, !807, !807, !1685}
!1717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1718, file: !1657, line: 115)
!1718 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !1660, file: !1660, line: 407, type: !1698, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1720, file: !1657, line: 116)
!1720 = !DISubprogram(name: "fseek", scope: !1660, file: !1660, line: 684, type: !1721, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1721 = !DISubroutineType(types: !1722)
!1722 = !{!132, !1668, !165, !132}
!1723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1724, file: !1657, line: 117)
!1724 = !DISubprogram(name: "fsetpos", scope: !1660, file: !1660, line: 736, type: !1725, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1725 = !DISubroutineType(types: !1726)
!1726 = !{!132, !1668, !1727}
!1727 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1728, size: 64)
!1728 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1659)
!1729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1730, file: !1657, line: 118)
!1730 = !DISubprogram(name: "ftell", scope: !1660, file: !1660, line: 689, type: !1731, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1731 = !DISubroutineType(types: !1732)
!1732 = !{!165, !1668}
!1733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1734, file: !1657, line: 119)
!1734 = !DISubprogram(name: "fwrite", scope: !1660, file: !1660, line: 652, type: !1735, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1735 = !DISubroutineType(types: !1736)
!1736 = !{!756, !1737, !756, !756, !1685}
!1737 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !754)
!1738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1739, file: !1657, line: 120)
!1739 = !DISubprogram(name: "getc", scope: !1660, file: !1660, line: 486, type: !1671, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1741, file: !1657, line: 121)
!1741 = !DISubprogram(name: "getchar", scope: !1742, file: !1742, line: 47, type: !820, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1742 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "fe48be26b3c1dd399597f5e6205450c5")
!1743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1744, file: !1657, line: 126)
!1744 = !DISubprogram(name: "perror", scope: !1660, file: !1660, line: 775, type: !1745, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1745 = !DISubroutineType(types: !1746)
!1746 = !{null, !622}
!1747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1748, file: !1657, line: 127)
!1748 = !DISubprogram(name: "printf", scope: !1660, file: !1660, line: 332, type: !1749, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1749 = !DISubroutineType(types: !1750)
!1750 = !{!132, !807, null}
!1751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1752, file: !1657, line: 128)
!1752 = !DISubprogram(name: "putc", scope: !1660, file: !1660, line: 522, type: !1702, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1754, file: !1657, line: 129)
!1754 = !DISubprogram(name: "putchar", scope: !1742, file: !1742, line: 82, type: !378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1756, file: !1657, line: 130)
!1756 = !DISubprogram(name: "puts", scope: !1660, file: !1660, line: 632, type: !743, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1758, file: !1657, line: 131)
!1758 = !DISubprogram(name: "remove", scope: !1660, file: !1660, line: 146, type: !743, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1760, file: !1657, line: 132)
!1760 = !DISubprogram(name: "rename", scope: !1660, file: !1660, line: 148, type: !1761, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1761 = !DISubroutineType(types: !1762)
!1762 = !{!132, !622, !622}
!1763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1764, file: !1657, line: 133)
!1764 = !DISubprogram(name: "rewind", scope: !1660, file: !1660, line: 694, type: !1666, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1766, file: !1657, line: 134)
!1766 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !1660, file: !1660, line: 410, type: !1749, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1768, file: !1657, line: 135)
!1768 = !DISubprogram(name: "setbuf", scope: !1660, file: !1660, line: 304, type: !1769, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1769 = !DISubroutineType(types: !1770)
!1770 = !{null, !1685, !850}
!1771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1772, file: !1657, line: 136)
!1772 = !DISubprogram(name: "setvbuf", scope: !1660, file: !1660, line: 308, type: !1773, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1773 = !DISubroutineType(types: !1774)
!1774 = !{!132, !1685, !850, !132, !756}
!1775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1776, file: !1657, line: 137)
!1776 = !DISubprogram(name: "sprintf", scope: !1660, file: !1660, line: 334, type: !1777, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1777 = !DISubroutineType(types: !1778)
!1778 = !{!132, !850, !807, null}
!1779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1780, file: !1657, line: 138)
!1780 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !1660, file: !1660, line: 412, type: !1781, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1781 = !DISubroutineType(types: !1782)
!1782 = !{!132, !807, !807, null}
!1783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1784, file: !1657, line: 139)
!1784 = !DISubprogram(name: "tmpfile", scope: !1660, file: !1660, line: 173, type: !1785, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1785 = !DISubroutineType(types: !1786)
!1786 = !{!1668}
!1787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1788, file: !1657, line: 141)
!1788 = !DISubprogram(name: "tmpnam", scope: !1660, file: !1660, line: 187, type: !1789, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1789 = !DISubroutineType(types: !1790)
!1790 = !{!783, !783}
!1791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1792, file: !1657, line: 143)
!1792 = !DISubprogram(name: "ungetc", scope: !1660, file: !1660, line: 639, type: !1702, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1794, file: !1657, line: 144)
!1794 = !DISubprogram(name: "vfprintf", scope: !1660, file: !1660, line: 341, type: !1795, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1795 = !DISubroutineType(types: !1796)
!1796 = !{!132, !1685, !807, !1374}
!1797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1798, file: !1657, line: 145)
!1798 = !DISubprogram(name: "vprintf", scope: !1742, file: !1742, line: 39, type: !1799, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1799 = !DISubroutineType(types: !1800)
!1800 = !{!132, !807, !1374}
!1801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1802, file: !1657, line: 146)
!1802 = !DISubprogram(name: "vsprintf", scope: !1660, file: !1660, line: 349, type: !1803, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1803 = !DISubroutineType(types: !1804)
!1804 = !{!132, !850, !807, !1374}
!1805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1806, file: !1657, line: 175)
!1806 = !DISubprogram(name: "snprintf", scope: !1660, file: !1660, line: 354, type: !1807, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1807 = !DISubroutineType(types: !1808)
!1808 = !{!132, !850, !756, !807, null}
!1809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1810, file: !1657, line: 176)
!1810 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !1660, file: !1660, line: 451, type: !1795, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1812, file: !1657, line: 177)
!1812 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !1660, file: !1660, line: 456, type: !1799, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1814, file: !1657, line: 178)
!1814 = !DISubprogram(name: "vsnprintf", scope: !1660, file: !1660, line: 358, type: !1815, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1815 = !DISubroutineType(types: !1816)
!1816 = !{!132, !850, !756, !807, !1374}
!1817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !36, entity: !1818, file: !1657, line: 179)
!1818 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !1660, file: !1660, line: 459, type: !1819, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1819 = !DISubroutineType(types: !1820)
!1820 = !{!132, !807, !807, !1374}
!1821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1806, file: !1657, line: 185)
!1822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1810, file: !1657, line: 186)
!1823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1812, file: !1657, line: 187)
!1824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1814, file: !1657, line: 188)
!1825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1818, file: !1657, line: 189)
!1826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1827, file: !1831, line: 82)
!1827 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1828, line: 48, baseType: !1829)
!1828 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "e83097fbf57cc71ea472db59df3ba75d")
!1829 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1830, size: 64)
!1830 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1545)
!1831 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cwctype", directory: "")
!1832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1833, file: !1831, line: 83)
!1833 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1834, line: 38, baseType: !758)
!1834 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "3598b9d23ef5d76319026b46e316b55f")
!1835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1236, file: !1831, line: 84)
!1836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1837, file: !1831, line: 86)
!1837 = !DISubprogram(name: "iswalnum", scope: !1834, file: !1834, line: 95, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1839, file: !1831, line: 87)
!1839 = !DISubprogram(name: "iswalpha", scope: !1834, file: !1834, line: 101, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1841, file: !1831, line: 89)
!1841 = !DISubprogram(name: "iswblank", scope: !1834, file: !1834, line: 146, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1843, file: !1831, line: 91)
!1843 = !DISubprogram(name: "iswcntrl", scope: !1834, file: !1834, line: 104, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1845, file: !1831, line: 92)
!1845 = !DISubprogram(name: "iswctype", scope: !1834, file: !1834, line: 159, type: !1846, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1846 = !DISubroutineType(types: !1847)
!1847 = !{!132, !1236, !1833}
!1848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1849, file: !1831, line: 93)
!1849 = !DISubprogram(name: "iswdigit", scope: !1834, file: !1834, line: 108, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1851, file: !1831, line: 94)
!1851 = !DISubprogram(name: "iswgraph", scope: !1834, file: !1834, line: 112, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1853, file: !1831, line: 95)
!1853 = !DISubprogram(name: "iswlower", scope: !1834, file: !1834, line: 117, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1855, file: !1831, line: 96)
!1855 = !DISubprogram(name: "iswprint", scope: !1834, file: !1834, line: 120, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1857, file: !1831, line: 97)
!1857 = !DISubprogram(name: "iswpunct", scope: !1834, file: !1834, line: 125, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1859, file: !1831, line: 98)
!1859 = !DISubprogram(name: "iswspace", scope: !1834, file: !1834, line: 130, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1861, file: !1831, line: 99)
!1861 = !DISubprogram(name: "iswupper", scope: !1834, file: !1834, line: 135, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1863, file: !1831, line: 100)
!1863 = !DISubprogram(name: "iswxdigit", scope: !1834, file: !1834, line: 140, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1865, file: !1831, line: 101)
!1865 = !DISubprogram(name: "towctrans", scope: !1828, file: !1828, line: 55, type: !1866, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1866 = !DISubroutineType(types: !1867)
!1867 = !{!1236, !1236, !1827}
!1868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1869, file: !1831, line: 102)
!1869 = !DISubprogram(name: "towlower", scope: !1834, file: !1834, line: 166, type: !1870, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1870 = !DISubroutineType(types: !1871)
!1871 = !{!1236, !1236}
!1872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1873, file: !1831, line: 103)
!1873 = !DISubprogram(name: "towupper", scope: !1834, file: !1834, line: 169, type: !1870, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1875, file: !1831, line: 104)
!1875 = !DISubprogram(name: "wctrans", scope: !1828, file: !1828, line: 52, type: !1876, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1876 = !DISubroutineType(types: !1877)
!1877 = !{!1827, !622}
!1878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1879, file: !1831, line: 105)
!1879 = !DISubprogram(name: "wctype", scope: !1834, file: !1834, line: 155, type: !1880, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1880 = !DISubroutineType(types: !1881)
!1881 = !{!1833, !622}
!1882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1883, file: !1886, line: 60)
!1883 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1884, line: 7, baseType: !1885)
!1884 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1885 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !151, line: 156, baseType: !165)
!1886 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ctime", directory: "")
!1887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !357, file: !1886, line: 61)
!1888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1425, file: !1886, line: 62)
!1889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1890, file: !1886, line: 64)
!1890 = !DISubprogram(name: "clock", scope: !1891, file: !1891, line: 72, type: !1892, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1891 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "2dc9fb937b28c900f98919b5c35320c2")
!1892 = !DISubroutineType(types: !1893)
!1893 = !{!1883}
!1894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1895, file: !1886, line: 65)
!1895 = !DISubprogram(name: "difftime", scope: !1891, file: !1891, line: 78, type: !1896, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1896 = !DISubroutineType(types: !1897)
!1897 = !{!386, !357, !357}
!1898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1899, file: !1886, line: 66)
!1899 = !DISubprogram(name: "mktime", scope: !1891, file: !1891, line: 82, type: !1900, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1900 = !DISubroutineType(types: !1901)
!1901 = !{!357, !1902}
!1902 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1425, size: 64)
!1903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1904, file: !1886, line: 67)
!1904 = !DISubprogram(name: "time", scope: !1891, file: !1891, line: 75, type: !1905, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1905 = !DISubroutineType(types: !1906)
!1906 = !{!357, !1907}
!1907 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !357, size: 64)
!1908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1909, file: !1886, line: 68)
!1909 = !DISubprogram(name: "asctime", scope: !1891, file: !1891, line: 139, type: !1910, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1910 = !DISubroutineType(types: !1911)
!1911 = !{!783, !1423}
!1912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1913, file: !1886, line: 69)
!1913 = !DISubprogram(name: "ctime", scope: !1891, file: !1891, line: 142, type: !1914, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1914 = !DISubroutineType(types: !1915)
!1915 = !{!783, !1916}
!1916 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1917, size: 64)
!1917 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !357)
!1918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1919, file: !1886, line: 70)
!1919 = !DISubprogram(name: "gmtime", scope: !1891, file: !1891, line: 119, type: !1920, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1920 = !DISubroutineType(types: !1921)
!1921 = !{!1902, !1916}
!1922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1923, file: !1886, line: 71)
!1923 = !DISubprogram(name: "localtime", scope: !1891, file: !1891, line: 123, type: !1920, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1925, file: !1886, line: 72)
!1925 = !DISubprogram(name: "strftime", scope: !1891, file: !1891, line: 88, type: !1926, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1926 = !DISubroutineType(types: !1927)
!1927 = !{!756, !850, !756, !807, !1422}
!1928 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !160, entity: !1929, file: !159, line: 973)
!1929 = !DINamespace(name: "chrono_literals", scope: !1930, exportSymbols: true)
!1930 = !DINamespace(name: "literals", scope: !2, exportSymbols: true)
!1931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1932, file: !1936, line: 77)
!1932 = !DISubprogram(name: "memchr", scope: !1933, file: !1933, line: 84, type: !1934, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1933 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "61f60112cf5c0a45c54ea1f595add24c")
!1934 = !DISubroutineType(types: !1935)
!1935 = !{!754, !754, !132, !756}
!1936 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstring", directory: "")
!1937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1938, file: !1936, line: 78)
!1938 = !DISubprogram(name: "memcmp", scope: !1933, file: !1933, line: 64, type: !1939, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1939 = !DISubroutineType(types: !1940)
!1940 = !{!132, !754, !754, !756}
!1941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1942, file: !1936, line: 79)
!1942 = !DISubprogram(name: "memcpy", scope: !1933, file: !1933, line: 43, type: !1943, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1943 = !DISubroutineType(types: !1944)
!1944 = !{!143, !1712, !1737, !756}
!1945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1946, file: !1936, line: 80)
!1946 = !DISubprogram(name: "memmove", scope: !1933, file: !1933, line: 47, type: !1947, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1947 = !DISubroutineType(types: !1948)
!1948 = !{!143, !143, !754, !756}
!1949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1950, file: !1936, line: 81)
!1950 = !DISubprogram(name: "memset", scope: !1933, file: !1933, line: 61, type: !1951, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1951 = !DISubroutineType(types: !1952)
!1952 = !{!143, !143, !132, !756}
!1953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1954, file: !1936, line: 82)
!1954 = !DISubprogram(name: "strcat", scope: !1933, file: !1933, line: 130, type: !1955, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1955 = !DISubroutineType(types: !1956)
!1956 = !{!783, !850, !807}
!1957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1958, file: !1936, line: 83)
!1958 = !DISubprogram(name: "strcmp", scope: !1933, file: !1933, line: 137, type: !1761, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1960, file: !1936, line: 84)
!1960 = !DISubprogram(name: "strcoll", scope: !1933, file: !1933, line: 144, type: !1761, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1962, file: !1936, line: 85)
!1962 = !DISubprogram(name: "strcpy", scope: !1933, file: !1933, line: 122, type: !1955, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1964, file: !1936, line: 86)
!1964 = !DISubprogram(name: "strcspn", scope: !1933, file: !1933, line: 273, type: !1965, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1965 = !DISubroutineType(types: !1966)
!1966 = !{!756, !622, !622}
!1967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1968, file: !1936, line: 87)
!1968 = !DISubprogram(name: "strerror", scope: !1933, file: !1933, line: 397, type: !1969, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1969 = !DISubroutineType(types: !1970)
!1970 = !{!783, !132}
!1971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1972, file: !1936, line: 88)
!1972 = !DISubprogram(name: "strlen", scope: !1933, file: !1933, line: 385, type: !1973, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1973 = !DISubroutineType(types: !1974)
!1974 = !{!756, !622}
!1975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1976, file: !1936, line: 89)
!1976 = !DISubprogram(name: "strncat", scope: !1933, file: !1933, line: 133, type: !1977, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1977 = !DISubroutineType(types: !1978)
!1978 = !{!783, !850, !807, !756}
!1979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1980, file: !1936, line: 90)
!1980 = !DISubprogram(name: "strncmp", scope: !1933, file: !1933, line: 140, type: !1981, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1981 = !DISubroutineType(types: !1982)
!1982 = !{!132, !622, !622, !756}
!1983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1984, file: !1936, line: 91)
!1984 = !DISubprogram(name: "strncpy", scope: !1933, file: !1933, line: 125, type: !1977, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1986, file: !1936, line: 92)
!1986 = !DISubprogram(name: "strspn", scope: !1933, file: !1933, line: 277, type: !1965, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1988, file: !1936, line: 93)
!1988 = !DISubprogram(name: "strtok", scope: !1933, file: !1933, line: 336, type: !1955, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1990, file: !1936, line: 94)
!1990 = !DISubprogram(name: "strxfrm", scope: !1933, file: !1933, line: 147, type: !1991, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1991 = !DISubroutineType(types: !1992)
!1992 = !{!756, !850, !807, !756}
!1993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1994, file: !1936, line: 95)
!1994 = !DISubprogram(name: "strchr", scope: !1933, file: !1933, line: 219, type: !1995, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1995 = !DISubroutineType(types: !1996)
!1996 = !{!622, !622, !132}
!1997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1998, file: !1936, line: 96)
!1998 = !DISubprogram(name: "strpbrk", scope: !1933, file: !1933, line: 296, type: !1999, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1999 = !DISubroutineType(types: !2000)
!2000 = !{!622, !622, !622}
!2001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2002, file: !1936, line: 97)
!2002 = !DISubprogram(name: "strrchr", scope: !1933, file: !1933, line: 246, type: !1995, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2004, file: !1936, line: 98)
!2004 = !DISubprogram(name: "strstr", scope: !1933, file: !1933, line: 323, type: !1999, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !34, file: !2006, line: 86)
!2006 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/shared_ptr_base.h", directory: "", checksumkind: CSK_MD5, checksum: "1733263deedfa36d980cec211a9e526a")
!2007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !2008, file: !2006, line: 87)
!2008 = !DIGlobalVariable(name: "__default_lock_policy", linkageName: "_ZN9__gnu_cxxL21__default_lock_policyE", scope: !36, file: !35, line: 53, type: !2009, isLocal: true, isDefinition: false)
!2009 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!2010 = !{i32 7, !"Dwarf Version", i32 5}
!2011 = !{i32 2, !"Debug Info Version", i32 3}
!2012 = !{i32 1, !"wchar_size", i32 4}
!2013 = !{i32 7, !"uwtable", i32 2}
!2014 = !{!"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.3 23045 a29fe425c7b0e5aba97ed2f95f61fd5ecba68aed)"}
!2015 = !{!2016, !2016, i64 0}
!2016 = !{!"any pointer", !2017, i64 0}
!2017 = !{!"omnipotent char", !2018, i64 0}
!2018 = !{!"Simple C++ TBAA"}
!2019 = distinct !DISubprogram(name: "hip_increment", linkageName: "_Z13hip_incrementPiS_m", scope: !9, file: !9, line: 33, type: !2020, scopeLine: 34, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, retainedNodes: !2023)
!2020 = !DISubroutineType(types: !2021)
!2021 = !{null, !414, !414, !2022}
!2022 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !756)
!2023 = !{!2024, !2025, !2026, !2027, !2028}
!2024 = !DILocalVariable(name: "h_out", arg: 1, scope: !2019, file: !9, line: 33, type: !414)
!2025 = !DILocalVariable(name: "h_in", arg: 2, scope: !2019, file: !9, line: 33, type: !414)
!2026 = !DILocalVariable(name: "ARRAY_SIZE", arg: 3, scope: !2019, file: !9, line: 33, type: !2022)
!2027 = !DILocalVariable(name: "ARRAY_BYTES", scope: !2019, file: !9, line: 47, type: !2022)
!2028 = !DILocalVariable(name: "d_mem", scope: !2019, file: !9, line: 48, type: !414)
!2029 = !DILocation(line: 0, scope: !2019)
!2030 = !DILocation(line: 47, column: 43, scope: !2019)
!2031 = !DILocation(line: 48, column: 5, scope: !2019)
!2032 = !DILocation(line: 50, column: 15, scope: !2019)
!2033 = !DILocation(line: 50, column: 5, scope: !2019)
!2034 = !DILocation(line: 52, column: 15, scope: !2019)
!2035 = !DILocation(line: 52, column: 22, scope: !2019)
!2036 = !DILocation(line: 52, column: 5, scope: !2019)
!2037 = !DILocation(line: 54, column: 5, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !2019, file: !9, line: 54, column: 5)
!2039 = !DILocation(line: 55, column: 5, scope: !2019)
!2040 = !DILocation(line: 57, column: 15, scope: !2019)
!2041 = !DILocation(line: 57, column: 22, scope: !2019)
!2042 = !DILocation(line: 57, column: 5, scope: !2019)
!2043 = !DILocation(line: 59, column: 13, scope: !2019)
!2044 = !DILocation(line: 59, column: 5, scope: !2019)
!2045 = !DILocation(line: 60, column: 1, scope: !2019)
!2046 = !DISubprogram(name: "hipMalloc", scope: !43, file: !43, line: 2654, type: !2047, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !231)
!2047 = !DISubroutineType(types: !2048)
!2048 = !{!2049, !142, !756}
!2049 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipError_t", file: !43, line: 320, baseType: !42)
!2050 = !DISubprogram(name: "hipMemcpy", scope: !43, file: !43, line: 3408, type: !2051, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !231)
!2051 = !DISubroutineType(types: !2052)
!2052 = !{!2049, !143, !754, !756, !2053}
!2053 = !DIDerivedType(tag: DW_TAG_typedef, name: "hipMemcpyKind", file: !124, line: 351, baseType: !123)
!2054 = !DISubprogram(name: "hipDeviceSynchronize", scope: !43, file: !43, line: 1465, type: !2055, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !231)
!2055 = !DISubroutineType(types: !2056)
!2056 = !{!2049}
!2057 = !DISubprogram(name: "hipFree", scope: !43, file: !43, line: 3353, type: !2058, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !231)
!2058 = !DISubroutineType(types: !2059)
!2059 = !{!2049, !143}
!2060 = distinct !DISubprogram(name: "norm_increment", linkageName: "_Z14norm_incrementPiS_m", scope: !9, file: !9, line: 63, type: !2020, scopeLine: 64, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, retainedNodes: !2061)
!2061 = !{!2062, !2063, !2064, !2065}
!2062 = !DILocalVariable(name: "h_out", arg: 1, scope: !2060, file: !9, line: 63, type: !414)
!2063 = !DILocalVariable(name: "h_in", arg: 2, scope: !2060, file: !9, line: 63, type: !414)
!2064 = !DILocalVariable(name: "ARRAY_SIZE", arg: 3, scope: !2060, file: !9, line: 63, type: !2022)
!2065 = !DILocalVariable(name: "i", scope: !2066, file: !9, line: 65, type: !756)
!2066 = distinct !DILexicalBlock(scope: !2060, file: !9, line: 65, column: 3)
!2067 = !DILocation(line: 0, scope: !2060)
!2068 = !DILocation(line: 0, scope: !2066)
!2069 = !DILocation(line: 65, column: 21, scope: !2070)
!2070 = distinct !DILexicalBlock(scope: !2066, file: !9, line: 65, column: 3)
!2071 = !DILocation(line: 65, column: 3, scope: !2066)
!2072 = !DILocation(line: 66, column: 12, scope: !2070)
!2073 = !DILocation(line: 66, column: 18, scope: !2070)
!2074 = !{!2075, !2075, i64 0}
!2075 = !{!"int", !2017, i64 0}
!2076 = !DILocation(line: 66, column: 26, scope: !2070)
!2077 = !DILocation(line: 66, column: 5, scope: !2070)
!2078 = !DILocation(line: 66, column: 16, scope: !2070)
!2079 = distinct !{!2079, !2071, !2080, !2081, !2082}
!2080 = !DILocation(line: 66, column: 28, scope: !2066)
!2081 = !{!"llvm.loop.mustprogress"}
!2082 = !{!"llvm.loop.isvectorized", i32 1}
!2083 = distinct !{!2083, !2084}
!2084 = !{!"llvm.loop.unroll.disable"}
!2085 = !DILocation(line: 67, column: 1, scope: !2060)
!2086 = distinct !{!2086, !2071, !2080, !2081, !2082}
!2087 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 70, type: !820, scopeLine: 71, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, retainedNodes: !2088)
!2088 = !{!2089, !2090, !2091, !2092, !2093, !2094, !2096, !2097, !2099, !2100, !2101, !2103}
!2089 = !DILocalVariable(name: "ARRAY_SIZE", scope: !2087, file: !9, line: 72, type: !2022)
!2090 = !DILocalVariable(name: "ITERATIONS", scope: !2087, file: !9, line: 73, type: !2022)
!2091 = !DILocalVariable(name: "in", scope: !2087, file: !9, line: 74, type: !414)
!2092 = !DILocalVariable(name: "norm_out", scope: !2087, file: !9, line: 75, type: !414)
!2093 = !DILocalVariable(name: "hip_out", scope: !2087, file: !9, line: 76, type: !414)
!2094 = !DILocalVariable(name: "i", scope: !2095, file: !9, line: 78, type: !132)
!2095 = distinct !DILexicalBlock(scope: !2087, file: !9, line: 78, column: 5)
!2096 = !DILocalVariable(name: "hip_start_time", scope: !2087, file: !9, line: 84, type: !353)
!2097 = !DILocalVariable(name: "i", scope: !2098, file: !9, line: 86, type: !756)
!2098 = distinct !DILexicalBlock(scope: !2087, file: !9, line: 86, column: 5)
!2099 = !DILocalVariable(name: "hip_end_time", scope: !2087, file: !9, line: 90, type: !353)
!2100 = !DILocalVariable(name: "norm_start_time", scope: !2087, file: !9, line: 95, type: !353)
!2101 = !DILocalVariable(name: "i", scope: !2102, file: !9, line: 97, type: !756)
!2102 = distinct !DILexicalBlock(scope: !2087, file: !9, line: 97, column: 5)
!2103 = !DILocalVariable(name: "norm_end_time", scope: !2087, file: !9, line: 103, type: !353)
!2104 = !DILocation(line: 0, scope: !2087)
!2105 = !DILocation(line: 74, column: 15, scope: !2087)
!2106 = !DILocation(line: 75, column: 21, scope: !2087)
!2107 = !DILocation(line: 76, column: 20, scope: !2087)
!2108 = !DILocation(line: 0, scope: !2095)
!2109 = !DILocation(line: 79, column: 15, scope: !2110)
!2110 = distinct !DILexicalBlock(scope: !2095, file: !9, line: 78, column: 5)
!2111 = !DILocalVariable(name: "__out", arg: 1, scope: !2112, file: !2113, line: 565, type: !2116)
!2112 = distinct !DISubprogram(name: "operator<<<std::char_traits<char> >", linkageName: "_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc", scope: !2, file: !2113, line: 565, type: !2114, scopeLine: 566, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, templateParams: !2121, retainedNodes: !2119)
!2113 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ostream", directory: "")
!2114 = !DISubroutineType(types: !2115)
!2115 = !{!2116, !2116, !622}
!2116 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2117, size: 64)
!2117 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ostream<char, std::char_traits<char> >", scope: !2, file: !2118, line: 359, size: 2176, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!2118 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/ostream.tcc", directory: "")
!2119 = !{!2111, !2120}
!2120 = !DILocalVariable(name: "__s", arg: 2, scope: !2112, file: !2113, line: 565, type: !622)
!2121 = !{!2122}
!2122 = !DITemplateTypeParameter(name: "_Traits", type: !2123)
!2123 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !2, file: !2124, line: 290, size: 8, flags: DIFlagTypePassByValue, elements: !2125, templateParams: !2173, identifier: "_ZTSSt11char_traitsIcE")
!2124 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/char_traits.h", directory: "")
!2125 = !{!2126, !2133, !2136, !2137, !2141, !2144, !2147, !2151, !2152, !2155, !2161, !2164, !2167, !2170}
!2126 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignERcRKc", scope: !2123, file: !2124, line: 299, type: !2127, scopeLine: 299, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2127 = !DISubroutineType(types: !2128)
!2128 = !{null, !2129, !2131}
!2129 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2130, size: 64)
!2130 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2123, file: !2124, line: 292, baseType: !12)
!2131 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2132, size: 64)
!2132 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2130)
!2133 = !DISubprogram(name: "eq", linkageName: "_ZNSt11char_traitsIcE2eqERKcS2_", scope: !2123, file: !2124, line: 303, type: !2134, scopeLine: 303, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2134 = !DISubroutineType(types: !2135)
!2135 = !{!349, !2131, !2131}
!2136 = !DISubprogram(name: "lt", linkageName: "_ZNSt11char_traitsIcE2ltERKcS2_", scope: !2123, file: !2124, line: 307, type: !2134, scopeLine: 307, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2137 = !DISubprogram(name: "compare", linkageName: "_ZNSt11char_traitsIcE7compareEPKcS2_m", scope: !2123, file: !2124, line: 315, type: !2138, scopeLine: 315, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2138 = !DISubroutineType(types: !2139)
!2139 = !{!132, !2140, !2140, !1608}
!2140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2132, size: 64)
!2141 = !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !2123, file: !2124, line: 336, type: !2142, scopeLine: 336, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2142 = !DISubroutineType(types: !2143)
!2143 = !{!1608, !2140}
!2144 = !DISubprogram(name: "find", linkageName: "_ZNSt11char_traitsIcE4findEPKcmRS1_", scope: !2123, file: !2124, line: 346, type: !2145, scopeLine: 346, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2145 = !DISubroutineType(types: !2146)
!2146 = !{!2140, !2140, !1608, !2131}
!2147 = !DISubprogram(name: "move", linkageName: "_ZNSt11char_traitsIcE4moveEPcPKcm", scope: !2123, file: !2124, line: 360, type: !2148, scopeLine: 360, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2148 = !DISubroutineType(types: !2149)
!2149 = !{!2150, !2150, !2140, !1608}
!2150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2130, size: 64)
!2151 = !DISubprogram(name: "copy", linkageName: "_ZNSt11char_traitsIcE4copyEPcPKcm", scope: !2123, file: !2124, line: 368, type: !2148, scopeLine: 368, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2152 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignEPcmc", scope: !2123, file: !2124, line: 376, type: !2153, scopeLine: 376, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2153 = !DISubroutineType(types: !2154)
!2154 = !{!2150, !2150, !1608, !2130}
!2155 = !DISubprogram(name: "to_char_type", linkageName: "_ZNSt11char_traitsIcE12to_char_typeERKi", scope: !2123, file: !2124, line: 384, type: !2156, scopeLine: 384, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2156 = !DISubroutineType(types: !2157)
!2157 = !{!2130, !2158}
!2158 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2159, size: 64)
!2159 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2160)
!2160 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !2123, file: !2124, line: 293, baseType: !132)
!2161 = !DISubprogram(name: "to_int_type", linkageName: "_ZNSt11char_traitsIcE11to_int_typeERKc", scope: !2123, file: !2124, line: 390, type: !2162, scopeLine: 390, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2162 = !DISubroutineType(types: !2163)
!2163 = !{!2160, !2131}
!2164 = !DISubprogram(name: "eq_int_type", linkageName: "_ZNSt11char_traitsIcE11eq_int_typeERKiS2_", scope: !2123, file: !2124, line: 394, type: !2165, scopeLine: 394, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2165 = !DISubroutineType(types: !2166)
!2166 = !{!349, !2158, !2158}
!2167 = !DISubprogram(name: "eof", linkageName: "_ZNSt11char_traitsIcE3eofEv", scope: !2123, file: !2124, line: 398, type: !2168, scopeLine: 398, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2168 = !DISubroutineType(types: !2169)
!2169 = !{!2160}
!2170 = !DISubprogram(name: "not_eof", linkageName: "_ZNSt11char_traitsIcE7not_eofERKi", scope: !2123, file: !2124, line: 402, type: !2171, scopeLine: 402, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!2171 = !DISubroutineType(types: !2172)
!2172 = !{!2160, !2158}
!2173 = !{!2174}
!2174 = !DITemplateTypeParameter(name: "_CharT", type: !12)
!2175 = !DILocation(line: 0, scope: !2112, inlinedAt: !2176)
!2176 = distinct !DILocation(line: 81, column: 15, scope: !2087)
!2177 = !DILocation(line: 570, column: 2, scope: !2178, inlinedAt: !2176)
!2178 = distinct !DILexicalBlock(scope: !2112, file: !2113, line: 567, column: 11)
!2179 = !DILocalVariable(name: "this", arg: 1, scope: !2180, type: !2189, flags: DIFlagArtificial | DIFlagObjectPointer)
!2180 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !2117, file: !2113, line: 170, type: !2181, scopeLine: 171, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, declaration: !2186, retainedNodes: !2187)
!2181 = !DISubroutineType(types: !2182)
!2182 = !{!2183, !2185, !758}
!2183 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2184, size: 64)
!2184 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ostream_type", scope: !2117, file: !2113, line: 71, baseType: !2117)
!2185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2117, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2186 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !2117, file: !2113, line: 170, type: !2181, scopeLine: 170, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2187 = !{!2179, !2188}
!2188 = !DILocalVariable(name: "__n", arg: 2, scope: !2180, file: !2113, line: 170, type: !758)
!2189 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2117, size: 64)
!2190 = !DILocation(line: 0, scope: !2180, inlinedAt: !2191)
!2191 = distinct !DILocation(line: 81, column: 56, scope: !2087)
!2192 = !DILocation(line: 171, column: 16, scope: !2180, inlinedAt: !2191)
!2193 = !DILocation(line: 0, scope: !2112, inlinedAt: !2194)
!2194 = distinct !DILocation(line: 82, column: 15, scope: !2087)
!2195 = !DILocation(line: 570, column: 2, scope: !2178, inlinedAt: !2194)
!2196 = !DILocation(line: 0, scope: !2180, inlinedAt: !2197)
!2197 = distinct !DILocation(line: 82, column: 35, scope: !2087)
!2198 = !DILocation(line: 171, column: 16, scope: !2180, inlinedAt: !2197)
!2199 = !DILocalVariable(name: "this", arg: 1, scope: !2200, type: !2189, flags: DIFlagArtificial | DIFlagObjectPointer)
!2200 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !2117, file: !2113, line: 108, type: !2201, scopeLine: 109, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, declaration: !2206, retainedNodes: !2207)
!2201 = !DISubroutineType(types: !2202)
!2202 = !{!2183, !2185, !2203}
!2203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2204, size: 64)
!2204 = !DISubroutineType(types: !2205)
!2205 = !{!2183, !2183}
!2206 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEPFRSoS_E", scope: !2117, file: !2113, line: 108, type: !2201, scopeLine: 108, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2207 = !{!2199, !2208}
!2208 = !DILocalVariable(name: "__pf", arg: 2, scope: !2200, file: !2113, line: 108, type: !2203)
!2209 = !DILocation(line: 0, scope: !2200, inlinedAt: !2210)
!2210 = distinct !DILocation(line: 82, column: 49, scope: !2087)
!2211 = !DILocalVariable(name: "__os", arg: 1, scope: !2212, file: !2113, line: 599, type: !2116)
!2212 = distinct !DISubprogram(name: "endl<char, std::char_traits<char> >", linkageName: "_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !2, file: !2113, line: 599, type: !2213, scopeLine: 600, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, templateParams: !2216, retainedNodes: !2215)
!2213 = !DISubroutineType(types: !2214)
!2214 = !{!2116, !2116}
!2215 = !{!2211}
!2216 = !{!2174, !2122}
!2217 = !DILocation(line: 0, scope: !2212, inlinedAt: !2218)
!2218 = distinct !DILocation(line: 113, column: 9, scope: !2200, inlinedAt: !2210)
!2219 = !DILocation(line: 600, column: 29, scope: !2212, inlinedAt: !2218)
!2220 = !{!2221, !2221, i64 0}
!2221 = !{!"vtable pointer", !2018, i64 0}
!2222 = !DILocalVariable(name: "this", arg: 1, scope: !2223, type: !2235, flags: DIFlagArtificial | DIFlagObjectPointer)
!2223 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !2225, file: !2224, line: 449, type: !2227, scopeLine: 450, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, declaration: !2232, retainedNodes: !2233)
!2224 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/basic_ios.h", directory: "")
!2225 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ios<char, std::char_traits<char> >", scope: !2, file: !2226, line: 178, size: 2112, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!2226 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/basic_ios.tcc", directory: "")
!2227 = !DISubroutineType(types: !2228)
!2228 = !{!2229, !2230, !12}
!2229 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2225, file: !2224, line: 76, baseType: !12)
!2230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2231, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2231 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2225)
!2232 = !DISubprogram(name: "widen", linkageName: "_ZNKSt9basic_iosIcSt11char_traitsIcEE5widenEc", scope: !2225, file: !2224, line: 449, type: !2227, scopeLine: 449, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2233 = !{!2222, !2234}
!2234 = !DILocalVariable(name: "__c", arg: 2, scope: !2223, file: !2224, line: 449, type: !12)
!2235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2231, size: 64)
!2236 = !DILocation(line: 0, scope: !2223, inlinedAt: !2237)
!2237 = distinct !DILocation(line: 600, column: 34, scope: !2212, inlinedAt: !2218)
!2238 = !DILocation(line: 450, column: 30, scope: !2223, inlinedAt: !2237)
!2239 = !{!2240, !2016, i64 240}
!2240 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !2241, i64 0, !2016, i64 216, !2017, i64 224, !2247, i64 225, !2016, i64 232, !2016, i64 240, !2016, i64 248, !2016, i64 256}
!2241 = !{!"_ZTSSt8ios_base", !2242, i64 8, !2242, i64 16, !2243, i64 24, !2244, i64 28, !2244, i64 32, !2016, i64 40, !2245, i64 48, !2017, i64 64, !2075, i64 192, !2016, i64 200, !2246, i64 208}
!2242 = !{!"long", !2017, i64 0}
!2243 = !{!"_ZTSSt13_Ios_Fmtflags", !2017, i64 0}
!2244 = !{!"_ZTSSt12_Ios_Iostate", !2017, i64 0}
!2245 = !{!"_ZTSNSt8ios_base6_WordsE", !2016, i64 0, !2242, i64 8}
!2246 = !{!"_ZTSSt6locale", !2016, i64 0}
!2247 = !{!"bool", !2017, i64 0}
!2248 = !DILocalVariable(name: "__f", arg: 1, scope: !2249, file: !2224, line: 47, type: !2256)
!2249 = distinct !DISubprogram(name: "__check_facet<std::ctype<char> >", linkageName: "_ZSt13__check_facetISt5ctypeIcEERKT_PS3_", scope: !2, file: !2224, line: 47, type: !2250, scopeLine: 48, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, templateParams: !2258, retainedNodes: !2257)
!2250 = !DISubroutineType(types: !2251)
!2251 = !{!2252, !2256}
!2252 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2253, size: 64)
!2253 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2254)
!2254 = !DICompositeType(tag: DW_TAG_class_type, name: "ctype<char>", scope: !2, file: !2255, line: 681, size: 4608, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt5ctypeIcE")
!2255 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/locale_facets.h", directory: "")
!2256 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2253, size: 64)
!2257 = !{!2248}
!2258 = !{!2259}
!2259 = !DITemplateTypeParameter(name: "_Facet", type: !2254)
!2260 = !DILocation(line: 0, scope: !2249, inlinedAt: !2261)
!2261 = distinct !DILocation(line: 450, column: 16, scope: !2223, inlinedAt: !2237)
!2262 = !DILocation(line: 49, column: 12, scope: !2263, inlinedAt: !2261)
!2263 = distinct !DILexicalBlock(scope: !2249, file: !2224, line: 49, column: 11)
!2264 = !DILocation(line: 49, column: 11, scope: !2249, inlinedAt: !2261)
!2265 = !DILocation(line: 50, column: 2, scope: !2263, inlinedAt: !2261)
!2266 = !DILocalVariable(name: "this", arg: 1, scope: !2267, type: !2256, flags: DIFlagArtificial | DIFlagObjectPointer)
!2267 = distinct !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !2254, file: !2255, line: 872, type: !2268, scopeLine: 873, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, declaration: !2272, retainedNodes: !2273)
!2268 = !DISubroutineType(types: !2269)
!2269 = !{!2270, !2271, !12}
!2270 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !2254, file: !2255, line: 686, baseType: !12)
!2271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2253, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2272 = !DISubprogram(name: "widen", linkageName: "_ZNKSt5ctypeIcE5widenEc", scope: !2254, file: !2255, line: 872, type: !2268, scopeLine: 872, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2273 = !{!2266, !2274}
!2274 = !DILocalVariable(name: "__c", arg: 2, scope: !2267, file: !2255, line: 872, type: !12)
!2275 = !DILocation(line: 0, scope: !2267, inlinedAt: !2276)
!2276 = distinct !DILocation(line: 450, column: 40, scope: !2223, inlinedAt: !2237)
!2277 = !DILocation(line: 874, column: 6, scope: !2278, inlinedAt: !2276)
!2278 = distinct !DILexicalBlock(scope: !2267, file: !2255, line: 874, column: 6)
!2279 = !{!2280, !2017, i64 56}
!2280 = !{!"_ZTSSt5ctypeIcE", !2281, i64 0, !2016, i64 16, !2247, i64 24, !2016, i64 32, !2016, i64 40, !2016, i64 48, !2017, i64 56, !2017, i64 57, !2017, i64 313, !2017, i64 569}
!2281 = !{!"_ZTSNSt6locale5facetE", !2075, i64 8}
!2282 = !DILocation(line: 874, column: 6, scope: !2267, inlinedAt: !2276)
!2283 = !DILocation(line: 875, column: 11, scope: !2278, inlinedAt: !2276)
!2284 = !{!2017, !2017, i64 0}
!2285 = !DILocation(line: 875, column: 4, scope: !2278, inlinedAt: !2276)
!2286 = !DILocation(line: 876, column: 8, scope: !2267, inlinedAt: !2276)
!2287 = !DILocation(line: 877, column: 15, scope: !2267, inlinedAt: !2276)
!2288 = !DILocation(line: 877, column: 2, scope: !2267, inlinedAt: !2276)
!2289 = !DILocation(line: 600, column: 25, scope: !2212, inlinedAt: !2218)
!2290 = !DILocalVariable(name: "__os", arg: 1, scope: !2291, file: !2113, line: 621, type: !2116)
!2291 = distinct !DISubprogram(name: "flush<char, std::char_traits<char> >", linkageName: "_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_", scope: !2, file: !2113, line: 621, type: !2213, scopeLine: 622, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, templateParams: !2216, retainedNodes: !2292)
!2292 = !{!2290}
!2293 = !DILocation(line: 0, scope: !2291, inlinedAt: !2294)
!2294 = distinct !DILocation(line: 600, column: 14, scope: !2212, inlinedAt: !2218)
!2295 = !DILocation(line: 622, column: 19, scope: !2291, inlinedAt: !2294)
!2296 = !DILocation(line: 84, column: 27, scope: !2087)
!2297 = !DILocation(line: 0, scope: !2098)
!2298 = !DILocation(line: 86, column: 5, scope: !2098)
!2299 = !DILocation(line: 90, column: 25, scope: !2087)
!2300 = !DILocation(line: 0, scope: !2112, inlinedAt: !2301)
!2301 = distinct !DILocation(line: 92, column: 15, scope: !2087)
!2302 = !DILocation(line: 570, column: 2, scope: !2178, inlinedAt: !2301)
!2303 = !DILocalVariable(name: "__lhs", arg: 1, scope: !2304, file: !159, line: 762, type: !2307)
!2304 = distinct !DISubprogram(name: "operator-<std::chrono::_V2::system_clock, std::chrono::duration<long, std::ratio<1L, 1000000000L> >, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", linkageName: "_ZNSt6chronomiINS_3_V212system_clockENS_8durationIlSt5ratioILl1ELl1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE", scope: !160, file: !159, line: 762, type: !2305, scopeLine: 764, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, templateParams: !2310, retainedNodes: !2308)
!2305 = !DISubroutineType(types: !2306)
!2306 = !{!297, !2307, !2307}
!2307 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !332, size: 64)
!2308 = !{!2303, !2309}
!2309 = !DILocalVariable(name: "__rhs", arg: 2, scope: !2304, file: !159, line: 763, type: !2307)
!2310 = !{!343, !2311, !2312}
!2311 = !DITemplateTypeParameter(name: "_Dur1", type: !236)
!2312 = !DITemplateTypeParameter(name: "_Dur2", type: !236)
!2313 = !DILocation(line: 0, scope: !2304, inlinedAt: !2314)
!2314 = distinct !DILocation(line: 92, column: 49, scope: !2087)
!2315 = !DILocation(line: 0, scope: !302, inlinedAt: !2316)
!2316 = distinct !DILocation(line: 764, column: 41, scope: !2304, inlinedAt: !2314)
!2317 = !DILocation(line: 469, column: 34, scope: !302, inlinedAt: !2316)
!2318 = !DILocation(line: 0, scope: !225, inlinedAt: !2319)
!2319 = distinct !DILocation(line: 92, column: 66, scope: !2087)
!2320 = !DILocation(line: 514, column: 29, scope: !225, inlinedAt: !2319)
!2321 = !DILocalVariable(name: "this", arg: 1, scope: !2322, type: !2189, flags: DIFlagArtificial | DIFlagObjectPointer)
!2322 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEl", scope: !2117, file: !2113, line: 166, type: !2323, scopeLine: 167, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32, declaration: !2325, retainedNodes: !2326)
!2323 = !DISubroutineType(types: !2324)
!2324 = !{!2183, !2185, !165}
!2325 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEl", scope: !2117, file: !2113, line: 166, type: !2323, scopeLine: 166, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2326 = !{!2321, !2327}
!2327 = !DILocalVariable(name: "__n", arg: 2, scope: !2322, file: !2113, line: 166, type: !165)
!2328 = !DILocation(line: 0, scope: !2322, inlinedAt: !2329)
!2329 = distinct !DILocation(line: 92, column: 31, scope: !2087)
!2330 = !DILocation(line: 167, column: 16, scope: !2322, inlinedAt: !2329)
!2331 = !DILocation(line: 0, scope: !2112, inlinedAt: !2332)
!2332 = distinct !DILocation(line: 92, column: 97, scope: !2087)
!2333 = !DILocation(line: 570, column: 2, scope: !2178, inlinedAt: !2332)
!2334 = !DILocation(line: 0, scope: !2200, inlinedAt: !2335)
!2335 = distinct !DILocation(line: 92, column: 113, scope: !2087)
!2336 = !DILocation(line: 0, scope: !2212, inlinedAt: !2337)
!2337 = distinct !DILocation(line: 113, column: 9, scope: !2200, inlinedAt: !2335)
!2338 = !DILocation(line: 600, column: 29, scope: !2212, inlinedAt: !2337)
!2339 = !DILocation(line: 0, scope: !2223, inlinedAt: !2340)
!2340 = distinct !DILocation(line: 600, column: 34, scope: !2212, inlinedAt: !2337)
!2341 = !DILocation(line: 450, column: 30, scope: !2223, inlinedAt: !2340)
!2342 = !DILocation(line: 0, scope: !2249, inlinedAt: !2343)
!2343 = distinct !DILocation(line: 450, column: 16, scope: !2223, inlinedAt: !2340)
!2344 = !DILocation(line: 49, column: 12, scope: !2263, inlinedAt: !2343)
!2345 = !DILocation(line: 49, column: 11, scope: !2249, inlinedAt: !2343)
!2346 = !DILocation(line: 50, column: 2, scope: !2263, inlinedAt: !2343)
!2347 = !DILocation(line: 0, scope: !2267, inlinedAt: !2348)
!2348 = distinct !DILocation(line: 450, column: 40, scope: !2223, inlinedAt: !2340)
!2349 = !DILocation(line: 874, column: 6, scope: !2278, inlinedAt: !2348)
!2350 = !DILocation(line: 874, column: 6, scope: !2267, inlinedAt: !2348)
!2351 = !DILocation(line: 875, column: 11, scope: !2278, inlinedAt: !2348)
!2352 = !DILocation(line: 875, column: 4, scope: !2278, inlinedAt: !2348)
!2353 = !DILocation(line: 876, column: 8, scope: !2267, inlinedAt: !2348)
!2354 = !DILocation(line: 877, column: 15, scope: !2267, inlinedAt: !2348)
!2355 = !DILocation(line: 877, column: 2, scope: !2267, inlinedAt: !2348)
!2356 = !DILocation(line: 600, column: 25, scope: !2212, inlinedAt: !2337)
!2357 = !DILocation(line: 0, scope: !2291, inlinedAt: !2358)
!2358 = distinct !DILocation(line: 600, column: 14, scope: !2212, inlinedAt: !2337)
!2359 = !DILocation(line: 622, column: 19, scope: !2291, inlinedAt: !2358)
!2360 = !DILocation(line: 95, column: 28, scope: !2087)
!2361 = !DILocation(line: 0, scope: !2102)
!2362 = !DILocation(line: 66, column: 18, scope: !2070, inlinedAt: !2363)
!2363 = distinct !DILocation(line: 98, column: 7, scope: !2364)
!2364 = distinct !DILexicalBlock(scope: !2102, file: !9, line: 97, column: 5)
!2365 = !DILocation(line: 97, column: 5, scope: !2102)
!2366 = !DILocation(line: 87, column: 7, scope: !2367)
!2367 = distinct !DILexicalBlock(scope: !2098, file: !9, line: 86, column: 5)
!2368 = !DILocation(line: 86, column: 37, scope: !2367)
!2369 = !DILocation(line: 86, column: 23, scope: !2367)
!2370 = distinct !{!2370, !2298, !2371, !2081}
!2371 = !DILocation(line: 87, column: 44, scope: !2098)
!2372 = !DILocation(line: 65, column: 3, scope: !2066, inlinedAt: !2363)
!2373 = !DILocation(line: 66, column: 12, scope: !2070, inlinedAt: !2363)
!2374 = !DILocation(line: 66, column: 26, scope: !2070, inlinedAt: !2363)
!2375 = !DILocation(line: 66, column: 5, scope: !2070, inlinedAt: !2363)
!2376 = !DILocation(line: 66, column: 16, scope: !2070, inlinedAt: !2363)
!2377 = distinct !{!2377, !2372, !2378, !2081, !2082}
!2378 = !DILocation(line: 66, column: 28, scope: !2066, inlinedAt: !2363)
!2379 = !DILocation(line: 103, column: 26, scope: !2087)
!2380 = !DILocation(line: 0, scope: !2112, inlinedAt: !2381)
!2381 = distinct !DILocation(line: 105, column: 15, scope: !2087)
!2382 = !DILocation(line: 570, column: 2, scope: !2178, inlinedAt: !2381)
!2383 = !DILocation(line: 0, scope: !2304, inlinedAt: !2384)
!2384 = distinct !DILocation(line: 105, column: 51, scope: !2087)
!2385 = !DILocation(line: 0, scope: !302, inlinedAt: !2386)
!2386 = distinct !DILocation(line: 764, column: 41, scope: !2304, inlinedAt: !2384)
!2387 = !DILocation(line: 469, column: 34, scope: !302, inlinedAt: !2386)
!2388 = !DILocation(line: 0, scope: !225, inlinedAt: !2389)
!2389 = distinct !DILocation(line: 105, column: 69, scope: !2087)
!2390 = !DILocation(line: 514, column: 29, scope: !225, inlinedAt: !2389)
!2391 = !DILocation(line: 0, scope: !2322, inlinedAt: !2392)
!2392 = distinct !DILocation(line: 105, column: 32, scope: !2087)
!2393 = !DILocation(line: 167, column: 16, scope: !2322, inlinedAt: !2392)
!2394 = !DILocation(line: 0, scope: !2112, inlinedAt: !2395)
!2395 = distinct !DILocation(line: 105, column: 100, scope: !2087)
!2396 = !DILocation(line: 570, column: 2, scope: !2178, inlinedAt: !2395)
!2397 = !DILocation(line: 0, scope: !2200, inlinedAt: !2398)
!2398 = distinct !DILocation(line: 105, column: 116, scope: !2087)
!2399 = !DILocation(line: 0, scope: !2212, inlinedAt: !2400)
!2400 = distinct !DILocation(line: 113, column: 9, scope: !2200, inlinedAt: !2398)
!2401 = !DILocation(line: 600, column: 29, scope: !2212, inlinedAt: !2400)
!2402 = !DILocation(line: 0, scope: !2223, inlinedAt: !2403)
!2403 = distinct !DILocation(line: 600, column: 34, scope: !2212, inlinedAt: !2400)
!2404 = !DILocation(line: 450, column: 30, scope: !2223, inlinedAt: !2403)
!2405 = !DILocation(line: 0, scope: !2249, inlinedAt: !2406)
!2406 = distinct !DILocation(line: 450, column: 16, scope: !2223, inlinedAt: !2403)
!2407 = !DILocation(line: 49, column: 12, scope: !2263, inlinedAt: !2406)
!2408 = !DILocation(line: 49, column: 11, scope: !2249, inlinedAt: !2406)
!2409 = !DILocation(line: 50, column: 2, scope: !2263, inlinedAt: !2406)
!2410 = !DILocation(line: 0, scope: !2267, inlinedAt: !2411)
!2411 = distinct !DILocation(line: 450, column: 40, scope: !2223, inlinedAt: !2403)
!2412 = !DILocation(line: 874, column: 6, scope: !2278, inlinedAt: !2411)
!2413 = !DILocation(line: 874, column: 6, scope: !2267, inlinedAt: !2411)
!2414 = !DILocation(line: 875, column: 11, scope: !2278, inlinedAt: !2411)
!2415 = !DILocation(line: 875, column: 4, scope: !2278, inlinedAt: !2411)
!2416 = !DILocation(line: 876, column: 8, scope: !2267, inlinedAt: !2411)
!2417 = !DILocation(line: 877, column: 15, scope: !2267, inlinedAt: !2411)
!2418 = !DILocation(line: 877, column: 2, scope: !2267, inlinedAt: !2411)
!2419 = !DILocation(line: 600, column: 25, scope: !2212, inlinedAt: !2400)
!2420 = !DILocation(line: 0, scope: !2291, inlinedAt: !2421)
!2421 = distinct !DILocation(line: 600, column: 14, scope: !2212, inlinedAt: !2400)
!2422 = !DILocation(line: 622, column: 19, scope: !2291, inlinedAt: !2421)
!2423 = !DILocation(line: 112, column: 5, scope: !2087)
!2424 = !DILocation(line: 113, column: 5, scope: !2087)
!2425 = !DILocation(line: 114, column: 5, scope: !2087)
!2426 = !DILocation(line: 115, column: 5, scope: !2087)
!2427 = !DILocation(line: 0, scope: !2066, inlinedAt: !2363)
!2428 = !DILocation(line: 97, column: 37, scope: !2364)
!2429 = !DILocation(line: 97, column: 23, scope: !2364)
!2430 = distinct !{!2430, !2365, !2431, !2081}
!2431 = !DILocation(line: 98, column: 46, scope: !2102)
!2432 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_test.C", scope: !1376, file: !1376, type: !2433, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !32, retainedNodes: !231)
!2433 = !DISubroutineType(types: !231)
!2434 = !DILocation(line: 74, column: 25, scope: !2435, inlinedAt: !2437)
!2435 = !DILexicalBlockFile(scope: !2436, file: !3, discriminator: 0)
!2436 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1376, file: !1376, type: !729, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !32, retainedNodes: !231)
!2437 = distinct !DILocation(line: 0, scope: !2432)
!2438 = !DILocation(line: 0, scope: !2436, inlinedAt: !2437)

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
