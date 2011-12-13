; ModuleID = 'declared.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8*, i8* }
%1 = type { i8*, i8*, i8* }
%"class.<anonymous namespace>::Base" = type { i32 (...)** }
%"class.<anonymous namespace>::Child" = type { [8 x i8] }

@_ZTVN12_GLOBAL__N_15ChildE = internal unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast (%1* @_ZTIN12_GLOBAL__N_15ChildE to i8*), i8* bitcast (i8 (%"class.<anonymous namespace>::Child"*)* @_ZN12_GLOBAL__N_15Child4nameEv to i8*), i8* bitcast (i32 (%"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14Base8nameHashEv to i8*)]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSN12_GLOBAL__N_15ChildE = internal constant [23 x i8] c"N12_GLOBAL__N_15ChildE\00"
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSN12_GLOBAL__N_14BaseE = internal constant [22 x i8] c"N12_GLOBAL__N_14BaseE\00"
@_ZTIN12_GLOBAL__N_14BaseE = internal unnamed_addr constant %0 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([22 x i8]* @_ZTSN12_GLOBAL__N_14BaseE, i32 0, i32 0) }
@_ZTIN12_GLOBAL__N_15ChildE = internal unnamed_addr constant %1 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([23 x i8]* @_ZTSN12_GLOBAL__N_15ChildE, i32 0, i32 0), i8* bitcast (%0* @_ZTIN12_GLOBAL__N_14BaseE to i8*) }
@_ZTVN12_GLOBAL__N_14BaseE = internal unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast (%0* @_ZTIN12_GLOBAL__N_14BaseE to i8*), i8* bitcast (i8 (%"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14Base4nameEv to i8*), i8* bitcast (i32 (%"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14Base8nameHashEv to i8*)]

@_ZN12_GLOBAL__N_15ChildC1Ev = alias internal void (%"class.<anonymous namespace>::Child"*)* @_ZN12_GLOBAL__N_15ChildC2Ev
@_ZN12_GLOBAL__N_14BaseC1Ev = alias internal void (%"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14BaseC2Ev

define i32 @main(i32 %argc, i8** %args) {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %basePtr = alloca %"class.<anonymous namespace>::Base"*, align 8
  %childPtr = alloca %"class.<anonymous namespace>::Child"*, align 8
  %baseName = alloca i8, align 1
  %childName = alloca i8, align 1
  %s = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !43), !dbg !44
  store i8** %args, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !45), !dbg !48
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::Base"** %basePtr}, metadata !49), !dbg !52
  %4 = call noalias i8* @_Znwm(i64 8), !dbg !53
  %5 = bitcast i8* %4 to %"class.<anonymous namespace>::Base"*, !dbg !53
  %6 = bitcast %"class.<anonymous namespace>::Base"* %5 to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 8, i32 8, i1 false), !dbg !53
  call void @_ZN12_GLOBAL__N_14BaseC1Ev(%"class.<anonymous namespace>::Base"* %5) nounwind, !dbg !53
  store %"class.<anonymous namespace>::Base"* %5, %"class.<anonymous namespace>::Base"** %basePtr, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::Child"** %childPtr}, metadata !54), !dbg !56
  %7 = call noalias i8* @_Znwm(i64 8), !dbg !57
  %8 = bitcast i8* %7 to %"class.<anonymous namespace>::Child"*, !dbg !57
  %9 = bitcast %"class.<anonymous namespace>::Child"* %8 to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 8, i32 8, i1 false), !dbg !57
  call void @_ZN12_GLOBAL__N_15ChildC1Ev(%"class.<anonymous namespace>::Child"* %8) nounwind, !dbg !57
  store %"class.<anonymous namespace>::Child"* %8, %"class.<anonymous namespace>::Child"** %childPtr, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata !{i8* %baseName}, metadata !58), !dbg !60
  %10 = load %"class.<anonymous namespace>::Base"** %basePtr, align 8, !dbg !61
  %11 = bitcast %"class.<anonymous namespace>::Base"* %10 to i8 (%"class.<anonymous namespace>::Base"*)***, !dbg !61
  %12 = load i8 (%"class.<anonymous namespace>::Base"*)*** %11, !dbg !61
  %13 = getelementptr inbounds i8 (%"class.<anonymous namespace>::Base"*)** %12, i64 0, !dbg !61
  %14 = load i8 (%"class.<anonymous namespace>::Base"*)** %13, !dbg !61
  %15 = call signext i8 %14(%"class.<anonymous namespace>::Base"* %10), !dbg !61, !virtual-call !62
  store i8 %15, i8* %baseName, align 1, !dbg !61
  call void @llvm.dbg.declare(metadata !{i8* %childName}, metadata !63), !dbg !64
  %16 = load %"class.<anonymous namespace>::Base"** %basePtr, align 8, !dbg !65
  %17 = bitcast %"class.<anonymous namespace>::Base"* %16 to i8 (%"class.<anonymous namespace>::Base"*)***, !dbg !65
  %18 = load i8 (%"class.<anonymous namespace>::Base"*)*** %17, !dbg !65
  %19 = getelementptr inbounds i8 (%"class.<anonymous namespace>::Base"*)** %18, i64 0, !dbg !65
  %20 = load i8 (%"class.<anonymous namespace>::Base"*)** %19, !dbg !65
  %21 = call signext i8 %20(%"class.<anonymous namespace>::Base"* %16), !dbg !65, !virtual-call !62
  store i8 %21, i8* %childName, align 1, !dbg !65
  call void @llvm.dbg.declare(metadata !{i32* %s}, metadata !66), !dbg !68
  %22 = load i8* %baseName, align 1, !dbg !69
  %23 = sext i8 %22 to i32, !dbg !69
  %24 = load i8* %childName, align 1, !dbg !69
  %25 = sext i8 %24 to i32, !dbg !69
  %26 = add nsw i32 %23, %25, !dbg !69
  store i32 %26, i32* %s, align 4, !dbg !69
  %27 = load i32* %s, align 4, !dbg !70
  %28 = load %"class.<anonymous namespace>::Base"** %basePtr, align 8, !dbg !70
  %29 = bitcast %"class.<anonymous namespace>::Base"* %28 to i32 (%"class.<anonymous namespace>::Base"*)***, !dbg !70
  %30 = load i32 (%"class.<anonymous namespace>::Base"*)*** %29, !dbg !70
  %31 = getelementptr inbounds i32 (%"class.<anonymous namespace>::Base"*)** %30, i64 1, !dbg !70
  %32 = load i32 (%"class.<anonymous namespace>::Base"*)** %31, !dbg !70
  %33 = call i32 %32(%"class.<anonymous namespace>::Base"* %28), !dbg !70, !virtual-call !71
  %34 = add nsw i32 %27, %33, !dbg !70
  %35 = load %"class.<anonymous namespace>::Child"** %childPtr, align 8, !dbg !70
  %36 = bitcast %"class.<anonymous namespace>::Child"* %35 to %"class.<anonymous namespace>::Base"*, !dbg !70
  %37 = bitcast %"class.<anonymous namespace>::Base"* %36 to i32 (%"class.<anonymous namespace>::Base"*)***, !dbg !70
  %38 = load i32 (%"class.<anonymous namespace>::Base"*)*** %37, !dbg !70
  %39 = getelementptr inbounds i32 (%"class.<anonymous namespace>::Base"*)** %38, i64 1, !dbg !70
  %40 = load i32 (%"class.<anonymous namespace>::Base"*)** %39, !dbg !70
  %41 = call i32 %40(%"class.<anonymous namespace>::Base"* %36), !dbg !70, !virtual-call !71
  %42 = add nsw i32 %34, %41, !dbg !70
  ret i32 %42, !dbg !70
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare noalias i8* @_Znwm(i64)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define internal void @_ZN12_GLOBAL__N_15ChildC2Ev(%"class.<anonymous namespace>::Child"* %this) unnamed_addr nounwind inlinehint align 2 {
  %1 = alloca %"class.<anonymous namespace>::Child"*, align 8
  store %"class.<anonymous namespace>::Child"* %this, %"class.<anonymous namespace>::Child"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::Child"** %1}, metadata !72), !dbg !73
  %2 = load %"class.<anonymous namespace>::Child"** %1
  %3 = bitcast %"class.<anonymous namespace>::Child"* %2 to %"class.<anonymous namespace>::Base"*
  call void @_ZN12_GLOBAL__N_14BaseC2Ev(%"class.<anonymous namespace>::Base"* %3) nounwind
  %4 = bitcast %"class.<anonymous namespace>::Child"* %2 to i8***
  store i8** getelementptr inbounds ([4 x i8*]* @_ZTVN12_GLOBAL__N_15ChildE, i64 0, i64 2), i8*** %4
  ret void, !dbg !74
}

define internal void @_ZN12_GLOBAL__N_14BaseC2Ev(%"class.<anonymous namespace>::Base"* %this) unnamed_addr nounwind inlinehint align 2 {
  %1 = alloca %"class.<anonymous namespace>::Base"*, align 8
  store %"class.<anonymous namespace>::Base"* %this, %"class.<anonymous namespace>::Base"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::Base"** %1}, metadata !76), !dbg !77
  %2 = load %"class.<anonymous namespace>::Base"** %1
  %3 = bitcast %"class.<anonymous namespace>::Base"* %2 to i8***
  store i8** getelementptr inbounds ([4 x i8*]* @_ZTVN12_GLOBAL__N_14BaseE, i64 0, i64 2), i8*** %3
  ret void, !dbg !78
}

define internal signext i8 @_ZN12_GLOBAL__N_15Child4nameEv(%"class.<anonymous namespace>::Child"* %this) nounwind align 2 {
  %1 = alloca %"class.<anonymous namespace>::Child"*, align 8
  store %"class.<anonymous namespace>::Child"* %this, %"class.<anonymous namespace>::Child"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::Child"** %1}, metadata !80), !dbg !81
  %2 = load %"class.<anonymous namespace>::Child"** %1
  ret i8 49, !dbg !82
}

define internal i32 @_ZN12_GLOBAL__N_14Base8nameHashEv(%"class.<anonymous namespace>::Base"* %this) align 2 {
  %1 = alloca %"class.<anonymous namespace>::Base"*, align 8
  store %"class.<anonymous namespace>::Base"* %this, %"class.<anonymous namespace>::Base"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::Base"** %1}, metadata !84), !dbg !85
  %2 = load %"class.<anonymous namespace>::Base"** %1
  %3 = bitcast %"class.<anonymous namespace>::Base"* %2 to i8 (%"class.<anonymous namespace>::Base"*)***, !dbg !86
  %4 = load i8 (%"class.<anonymous namespace>::Base"*)*** %3, !dbg !86
  %5 = getelementptr inbounds i8 (%"class.<anonymous namespace>::Base"*)** %4, i64 0, !dbg !86
  %6 = load i8 (%"class.<anonymous namespace>::Base"*)** %5, !dbg !86
  %7 = call signext i8 %6(%"class.<anonymous namespace>::Base"* %2), !dbg !86, !virtual-call !62
  %8 = sext i8 %7 to i32, !dbg !86
  ret i32 %8, !dbg !86
}

define internal signext i8 @_ZN12_GLOBAL__N_14Base4nameEv(%"class.<anonymous namespace>::Base"* %this) nounwind align 2 {
  %1 = alloca %"class.<anonymous namespace>::Base"*, align 8
  store %"class.<anonymous namespace>::Base"* %this, %"class.<anonymous namespace>::Base"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::Base"** %1}, metadata !88), !dbg !89
  %2 = load %"class.<anonymous namespace>::Base"** %1
  ret i8 48, !dbg !90
}

!llvm.dbg.sp = !{!0, !6, !13, !17, !24, !28, !34, !37, !38, !41, !42}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"", metadata !1, i32 21, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"declared.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 4, metadata !"declared.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !"clang version 2.9 (tags/RELEASE_29/final)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !4, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !2, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"name", metadata !"name", metadata !"_ZN12_GLOBAL__N_14Base4nameEv", metadata !1, i32 11, metadata !21, i1 false, i1 false, i32 1, i32 0, metadata !7, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589826, metadata !8, metadata !"Base", metadata !1, i32 9, i64 64, i64 64, i32 0, i32 0, null, metadata !9, i32 0, metadata !7, metadata !20} ; [ DW_TAG_class_type ]
!8 = metadata !{i32 589881, metadata !2, metadata !"", metadata !1, i32 8} ; [ DW_TAG_namespace ]
!9 = metadata !{metadata !10, metadata !6, metadata !13, metadata !17}
!10 = metadata !{i32 589837, metadata !1, metadata !"_vptr$Base", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!11 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589839, metadata !2, metadata !"__vtbl_ptr_type", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 589870, i32 0, metadata !7, metadata !"nameHash", metadata !"nameHash", metadata !"_ZN12_GLOBAL__N_14Base8nameHashEv", metadata !1, i32 12, metadata !14, i1 false, i1 false, i32 1, i32 1, metadata !7, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{metadata !5, metadata !16}
!16 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !7} ; [ DW_TAG_pointer_type ]
!17 = metadata !{i32 589870, i32 0, metadata !7, metadata !"Base", metadata !"Base", metadata !"", metadata !1, i32 9, metadata !18, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{null, metadata !16}
!20 = metadata !{i32 0}
!21 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{metadata !23, metadata !16}
!23 = metadata !{i32 589860, metadata !2, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!24 = metadata !{i32 589870, i32 0, metadata !25, metadata !"name", metadata !"name", metadata !"_ZN12_GLOBAL__N_15Child4nameEv", metadata !1, i32 17, metadata !32, i1 false, i1 false, i32 1, i32 0, metadata !25, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!25 = metadata !{i32 589826, metadata !8, metadata !"Child", metadata !1, i32 15, i64 64, i64 64, i32 0, i32 0, null, metadata !26, i32 0, metadata !7, metadata !20} ; [ DW_TAG_class_type ]
!26 = metadata !{metadata !27, metadata !24, metadata !28}
!27 = metadata !{i32 589852, metadata !25, null, metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !7} ; [ DW_TAG_inheritance ]
!28 = metadata !{i32 589870, i32 0, metadata !25, metadata !"Child", metadata !"Child", metadata !"", metadata !1, i32 15, metadata !29, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !30, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{null, metadata !31}
!31 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !25} ; [ DW_TAG_pointer_type ]
!32 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !33, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!33 = metadata !{metadata !23, metadata !31}
!34 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Child", metadata !"Child", metadata !"_ZN12_GLOBAL__N_15ChildC2Ev", metadata !1, i32 15, metadata !35, i1 true, i1 true, i32 0, i32 0, i32 0, i32 320, i1 false, void (%"class.<anonymous namespace>::Child"*)* @_ZN12_GLOBAL__N_15ChildC2Ev} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !36, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!36 = metadata !{null}
!37 = metadata !{i32 589870, i32 0, metadata !1, metadata !"nameHash", metadata !"nameHash", metadata !"_ZN12_GLOBAL__N_14Base8nameHashEv", metadata !1, i32 12, metadata !3, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14Base8nameHashEv} ; [ DW_TAG_subprogram ]
!38 = metadata !{i32 589870, i32 0, metadata !1, metadata !"name", metadata !"name", metadata !"_ZN12_GLOBAL__N_15Child4nameEv", metadata !1, i32 17, metadata !39, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i8 (%"class.<anonymous namespace>::Child"*)* @_ZN12_GLOBAL__N_15Child4nameEv} ; [ DW_TAG_subprogram ]
!39 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !40, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!40 = metadata !{metadata !23}
!41 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Base", metadata !"Base", metadata !"_ZN12_GLOBAL__N_14BaseC2Ev", metadata !1, i32 9, metadata !35, i1 true, i1 true, i32 0, i32 0, i32 0, i32 320, i1 false, void (%"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14BaseC2Ev} ; [ DW_TAG_subprogram ]
!42 = metadata !{i32 589870, i32 0, metadata !1, metadata !"name", metadata !"name", metadata !"_ZN12_GLOBAL__N_14Base4nameEv", metadata !1, i32 11, metadata !39, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i8 (%"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14Base4nameEv} ; [ DW_TAG_subprogram ]
!43 = metadata !{i32 590081, metadata !0, metadata !"argc", metadata !1, i32 16777237, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!44 = metadata !{i32 21, i32 14, metadata !0, null}
!45 = metadata !{i32 590081, metadata !0, metadata !"args", metadata !1, i32 33554453, metadata !46, i32 0} ; [ DW_TAG_arg_variable ]
!46 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !47} ; [ DW_TAG_pointer_type ]
!47 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ]
!48 = metadata !{i32 21, i32 27, metadata !0, null}
!49 = metadata !{i32 590080, metadata !50, metadata !"basePtr", metadata !1, i32 22, metadata !51, i32 0} ; [ DW_TAG_auto_variable ]
!50 = metadata !{i32 589835, metadata !0, i32 21, i32 33, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!51 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!52 = metadata !{i32 22, i32 8, metadata !50, null}
!53 = metadata !{i32 22, i32 28, metadata !50, null}
!54 = metadata !{i32 590080, metadata !50, metadata !"childPtr", metadata !1, i32 23, metadata !55, i32 0} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ]
!56 = metadata !{i32 23, i32 9, metadata !50, null}
!57 = metadata !{i32 23, i32 31, metadata !50, null}
!58 = metadata !{i32 590080, metadata !50, metadata !"baseName", metadata !1, i32 24, metadata !59, i32 0} ; [ DW_TAG_auto_variable ]
!59 = metadata !{i32 589862, metadata !2, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_const_type ]
!60 = metadata !{i32 24, i32 13, metadata !50, null}
!61 = metadata !{i32 24, i32 39, metadata !50, null}
!62 = metadata !{metadata !"_ZN12_GLOBAL__N_14Base4nameEv"}
!63 = metadata !{i32 590080, metadata !50, metadata !"childName", metadata !1, i32 25, metadata !59, i32 0} ; [ DW_TAG_auto_variable ]
!64 = metadata !{i32 25, i32 13, metadata !50, null}
!65 = metadata !{i32 25, i32 40, metadata !50, null}
!66 = metadata !{i32 590080, metadata !50, metadata !"s", metadata !1, i32 26, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!67 = metadata !{i32 589862, metadata !2, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !5} ; [ DW_TAG_const_type ]
!68 = metadata !{i32 26, i32 12, metadata !50, null}
!69 = metadata !{i32 26, i32 46, metadata !50, null}
!70 = metadata !{i32 27, i32 2, metadata !50, null}
!71 = metadata !{metadata !"_ZN12_GLOBAL__N_14Base8nameHashEv"}
!72 = metadata !{i32 590081, metadata !34, metadata !"this", metadata !1, i32 16777231, metadata !55, i32 64} ; [ DW_TAG_arg_variable ]
!73 = metadata !{i32 15, i32 7, metadata !34, null}
!74 = metadata !{i32 15, i32 7, metadata !75, null}
!75 = metadata !{i32 589835, metadata !34, i32 15, i32 7, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!76 = metadata !{i32 590081, metadata !41, metadata !"this", metadata !1, i32 16777225, metadata !51, i32 64} ; [ DW_TAG_arg_variable ]
!77 = metadata !{i32 9, i32 7, metadata !41, null}
!78 = metadata !{i32 9, i32 7, metadata !79, null}
!79 = metadata !{i32 589835, metadata !41, i32 9, i32 7, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 590081, metadata !38, metadata !"this", metadata !1, i32 16777233, metadata !55, i32 64} ; [ DW_TAG_arg_variable ]
!81 = metadata !{i32 17, i32 15, metadata !38, null}
!82 = metadata !{i32 17, i32 27, metadata !83, null}
!83 = metadata !{i32 589835, metadata !38, i32 17, i32 26, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!84 = metadata !{i32 590081, metadata !37, metadata !"this", metadata !1, i32 16777228, metadata !51, i32 64} ; [ DW_TAG_arg_variable ]
!85 = metadata !{i32 12, i32 14, metadata !37, null}
!86 = metadata !{i32 12, i32 30, metadata !87, null}
!87 = metadata !{i32 589835, metadata !37, i32 12, i32 29, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 590081, metadata !42, metadata !"this", metadata !1, i32 16777227, metadata !51, i32 64} ; [ DW_TAG_arg_variable ]
!89 = metadata !{i32 11, i32 15, metadata !42, null}
!90 = metadata !{i32 11, i32 27, metadata !91, null}
!91 = metadata !{i32 589835, metadata !42, i32 11, i32 26, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
