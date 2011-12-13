; ModuleID = 'pairwise.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8*, i8* }
%1 = type { i8*, i8*, i8* }
%"class.<anonymous namespace>::A" = type { i32 (...)** }
%"class.<anonymous namespace>::B" = type { [8 x i8] }

@_ZTVN12_GLOBAL__N_11BE = internal unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast (%1* @_ZTIN12_GLOBAL__N_11BE to i8*), i8* bitcast (i32 (%"class.<anonymous namespace>::B"*)* @_ZN12_GLOBAL__N_11B3fooEv to i8*), i8* bitcast (i32 (%"class.<anonymous namespace>::B"*)* @_ZN12_GLOBAL__N_11B3gooEv to i8*)]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSN12_GLOBAL__N_11BE = internal constant [19 x i8] c"N12_GLOBAL__N_11BE\00"
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSN12_GLOBAL__N_11AE = internal constant [19 x i8] c"N12_GLOBAL__N_11AE\00"
@_ZTIN12_GLOBAL__N_11AE = internal unnamed_addr constant %0 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([19 x i8]* @_ZTSN12_GLOBAL__N_11AE, i32 0, i32 0) }
@_ZTIN12_GLOBAL__N_11BE = internal unnamed_addr constant %1 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([19 x i8]* @_ZTSN12_GLOBAL__N_11BE, i32 0, i32 0), i8* bitcast (%0* @_ZTIN12_GLOBAL__N_11AE to i8*) }
@_ZTVN12_GLOBAL__N_11AE = internal unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast (%0* @_ZTIN12_GLOBAL__N_11AE to i8*), i8* bitcast (i32 (%"class.<anonymous namespace>::A"*)* @_ZN12_GLOBAL__N_11A3fooEv to i8*), i8* bitcast (i32 (%"class.<anonymous namespace>::A"*)* @_ZN12_GLOBAL__N_11A3gooEv to i8*)]

@_ZN12_GLOBAL__N_11BC1Ev = alias internal void (%"class.<anonymous namespace>::B"*)* @_ZN12_GLOBAL__N_11BC2Ev
@_ZN12_GLOBAL__N_11AC1Ev = alias internal void (%"class.<anonymous namespace>::A"*)* @_ZN12_GLOBAL__N_11AC2Ev

define i32 @main(i32 %argc, i8** %args) {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %a = alloca %"class.<anonymous namespace>::A"*, align 8
  %b = alloca %"class.<anonymous namespace>::B"*, align 8
  %ret = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !40), !dbg !41
  store i8** %args, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !42), !dbg !46
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::A"** %a}, metadata !47), !dbg !50
  %4 = call noalias i8* @_Znwm(i64 8), !dbg !51
  %5 = bitcast i8* %4 to %"class.<anonymous namespace>::A"*, !dbg !51
  %6 = bitcast %"class.<anonymous namespace>::A"* %5 to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 8, i32 8, i1 false), !dbg !51
  call void @_ZN12_GLOBAL__N_11AC1Ev(%"class.<anonymous namespace>::A"* %5) nounwind, !dbg !51
  store %"class.<anonymous namespace>::A"* %5, %"class.<anonymous namespace>::A"** %a, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::B"** %b}, metadata !52), !dbg !54
  %7 = call noalias i8* @_Znwm(i64 8), !dbg !55
  %8 = bitcast i8* %7 to %"class.<anonymous namespace>::B"*, !dbg !55
  %9 = bitcast %"class.<anonymous namespace>::B"* %8 to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 8, i32 8, i1 false), !dbg !55
  call void @_ZN12_GLOBAL__N_11BC1Ev(%"class.<anonymous namespace>::B"* %8) nounwind, !dbg !55
  store %"class.<anonymous namespace>::B"* %8, %"class.<anonymous namespace>::B"** %b, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata !{i32* %ret}, metadata !56), !dbg !58
  %10 = load %"class.<anonymous namespace>::A"** %a, align 8, !dbg !59
  %11 = bitcast %"class.<anonymous namespace>::A"* %10 to i32 (%"class.<anonymous namespace>::A"*)***, !dbg !59
  %12 = load i32 (%"class.<anonymous namespace>::A"*)*** %11, !dbg !59
  %13 = getelementptr inbounds i32 (%"class.<anonymous namespace>::A"*)** %12, i64 0, !dbg !59
  %14 = load i32 (%"class.<anonymous namespace>::A"*)** %13, !dbg !59
  %15 = call i32 %14(%"class.<anonymous namespace>::A"* %10), !dbg !59, !virtual-call !60
  %16 = load %"class.<anonymous namespace>::B"** %b, align 8, !dbg !59
  %17 = bitcast %"class.<anonymous namespace>::B"* %16 to i32 (%"class.<anonymous namespace>::B"*)***, !dbg !59
  %18 = load i32 (%"class.<anonymous namespace>::B"*)*** %17, !dbg !59
  %19 = getelementptr inbounds i32 (%"class.<anonymous namespace>::B"*)** %18, i64 0, !dbg !59
  %20 = load i32 (%"class.<anonymous namespace>::B"*)** %19, !dbg !59
  %21 = call i32 %20(%"class.<anonymous namespace>::B"* %16), !dbg !59, !virtual-call !61
  %22 = add nsw i32 %15, %21, !dbg !59
  store i32 %22, i32* %ret, align 4, !dbg !59
  %23 = load %"class.<anonymous namespace>::A"** %a, align 8, !dbg !62
  %24 = icmp eq %"class.<anonymous namespace>::A"* %23, null, !dbg !62
  br i1 %24, label %27, label %25, !dbg !62

; <label>:25                                      ; preds = %0
  %26 = bitcast %"class.<anonymous namespace>::A"* %23 to i8*, !dbg !62
  call void @_ZdlPv(i8* %26) nounwind, !dbg !62
  br label %27, !dbg !62

; <label>:27                                      ; preds = %25, %0
  %28 = load %"class.<anonymous namespace>::B"** %b, align 8, !dbg !63
  %29 = icmp eq %"class.<anonymous namespace>::B"* %28, null, !dbg !63
  br i1 %29, label %32, label %30, !dbg !63

; <label>:30                                      ; preds = %27
  %31 = bitcast %"class.<anonymous namespace>::B"* %28 to i8*, !dbg !63
  call void @_ZdlPv(i8* %31) nounwind, !dbg !63
  br label %32, !dbg !63

; <label>:32                                      ; preds = %30, %27
  %33 = load i32* %ret, align 4, !dbg !64
  ret i32 %33, !dbg !64
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare noalias i8* @_Znwm(i64)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @_ZdlPv(i8*) nounwind

define internal void @_ZN12_GLOBAL__N_11BC2Ev(%"class.<anonymous namespace>::B"* %this) unnamed_addr nounwind inlinehint align 2 {
  %1 = alloca %"class.<anonymous namespace>::B"*, align 8
  store %"class.<anonymous namespace>::B"* %this, %"class.<anonymous namespace>::B"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::B"** %1}, metadata !65), !dbg !66
  %2 = load %"class.<anonymous namespace>::B"** %1
  %3 = bitcast %"class.<anonymous namespace>::B"* %2 to %"class.<anonymous namespace>::A"*
  call void @_ZN12_GLOBAL__N_11AC2Ev(%"class.<anonymous namespace>::A"* %3) nounwind
  %4 = bitcast %"class.<anonymous namespace>::B"* %2 to i8***
  store i8** getelementptr inbounds ([4 x i8*]* @_ZTVN12_GLOBAL__N_11BE, i64 0, i64 2), i8*** %4
  ret void, !dbg !67
}

define internal void @_ZN12_GLOBAL__N_11AC2Ev(%"class.<anonymous namespace>::A"* %this) unnamed_addr nounwind inlinehint align 2 {
  %1 = alloca %"class.<anonymous namespace>::A"*, align 8
  store %"class.<anonymous namespace>::A"* %this, %"class.<anonymous namespace>::A"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::A"** %1}, metadata !69), !dbg !70
  %2 = load %"class.<anonymous namespace>::A"** %1
  %3 = bitcast %"class.<anonymous namespace>::A"* %2 to i8***
  store i8** getelementptr inbounds ([4 x i8*]* @_ZTVN12_GLOBAL__N_11AE, i64 0, i64 2), i8*** %3
  ret void, !dbg !71
}

define internal i32 @_ZN12_GLOBAL__N_11B3fooEv(%"class.<anonymous namespace>::B"* %this) nounwind align 2 {
  %1 = alloca %"class.<anonymous namespace>::B"*, align 8
  store %"class.<anonymous namespace>::B"* %this, %"class.<anonymous namespace>::B"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::B"** %1}, metadata !73), !dbg !74
  %2 = load %"class.<anonymous namespace>::B"** %1
  ret i32 2, !dbg !75
}

define internal i32 @_ZN12_GLOBAL__N_11B3gooEv(%"class.<anonymous namespace>::B"* %this) nounwind align 2 {
  %1 = alloca %"class.<anonymous namespace>::B"*, align 8
  store %"class.<anonymous namespace>::B"* %this, %"class.<anonymous namespace>::B"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::B"** %1}, metadata !77), !dbg !78
  %2 = load %"class.<anonymous namespace>::B"** %1
  ret i32 2, !dbg !79
}

define internal i32 @_ZN12_GLOBAL__N_11A3fooEv(%"class.<anonymous namespace>::A"* %this) align 2 {
  %1 = alloca %"class.<anonymous namespace>::A"*, align 8
  store %"class.<anonymous namespace>::A"* %this, %"class.<anonymous namespace>::A"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::A"** %1}, metadata !81), !dbg !82
  %2 = load %"class.<anonymous namespace>::A"** %1
  %3 = bitcast %"class.<anonymous namespace>::A"* %2 to i32 (%"class.<anonymous namespace>::A"*)***, !dbg !83
  %4 = load i32 (%"class.<anonymous namespace>::A"*)*** %3, !dbg !83
  %5 = getelementptr inbounds i32 (%"class.<anonymous namespace>::A"*)** %4, i64 1, !dbg !83
  %6 = load i32 (%"class.<anonymous namespace>::A"*)** %5, !dbg !83
  %7 = call i32 %6(%"class.<anonymous namespace>::A"* %2), !dbg !83, !virtual-call !85
  ret i32 %7, !dbg !83
}

define internal i32 @_ZN12_GLOBAL__N_11A3gooEv(%"class.<anonymous namespace>::A"* %this) nounwind align 2 {
  %1 = alloca %"class.<anonymous namespace>::A"*, align 8
  store %"class.<anonymous namespace>::A"* %this, %"class.<anonymous namespace>::A"** %1, align 8
  call void @llvm.dbg.declare(metadata !{%"class.<anonymous namespace>::A"** %1}, metadata !86), !dbg !87
  %2 = load %"class.<anonymous namespace>::A"** %1
  ret i32 1, !dbg !88
}

!llvm.dbg.sp = !{!0, !6, !13, !17, !21, !25, !29, !32, !35, !36, !37, !38, !39}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"", metadata !1, i32 26, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"pairwise.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 4, metadata !"pairwise.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !"clang version 2.9 (tags/RELEASE_29/final)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !4, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !2, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"foo", metadata !"foo", metadata !"_ZN12_GLOBAL__N_11A3fooEv", metadata !1, i32 11, metadata !14, i1 false, i1 false, i32 1, i32 0, metadata !7, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589826, metadata !8, metadata !"A", metadata !1, i32 9, i64 64, i64 64, i32 0, i32 0, null, metadata !9, i32 0, metadata !7, metadata !20} ; [ DW_TAG_class_type ]
!8 = metadata !{i32 589881, metadata !2, metadata !"", metadata !1, i32 8} ; [ DW_TAG_namespace ]
!9 = metadata !{metadata !10, metadata !6, metadata !13, metadata !17}
!10 = metadata !{i32 589837, metadata !1, metadata !"_vptr$A", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!11 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589839, metadata !2, metadata !"__vtbl_ptr_type", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 589870, i32 0, metadata !7, metadata !"goo", metadata !"goo", metadata !"_ZN12_GLOBAL__N_11A3gooEv", metadata !1, i32 14, metadata !14, i1 false, i1 false, i32 1, i32 1, metadata !7, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{metadata !5, metadata !16}
!16 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !7} ; [ DW_TAG_pointer_type ]
!17 = metadata !{i32 589870, i32 0, metadata !7, metadata !"A", metadata !"A", metadata !"", metadata !1, i32 9, metadata !18, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{null, metadata !16}
!20 = metadata !{i32 0}
!21 = metadata !{i32 589870, i32 0, metadata !22, metadata !"foo", metadata !"foo", metadata !"_ZN12_GLOBAL__N_11B3fooEv", metadata !1, i32 21, metadata !26, i1 false, i1 false, i32 1, i32 0, metadata !22, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!22 = metadata !{i32 589826, metadata !8, metadata !"B", metadata !1, i32 19, i64 64, i64 64, i32 0, i32 0, null, metadata !23, i32 0, metadata !7, metadata !20} ; [ DW_TAG_class_type ]
!23 = metadata !{metadata !24, metadata !21, metadata !25, metadata !29}
!24 = metadata !{i32 589852, metadata !22, null, metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !7} ; [ DW_TAG_inheritance ]
!25 = metadata !{i32 589870, i32 0, metadata !22, metadata !"goo", metadata !"goo", metadata !"_ZN12_GLOBAL__N_11B3gooEv", metadata !1, i32 22, metadata !26, i1 false, i1 false, i32 1, i32 1, metadata !22, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!26 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !27, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!27 = metadata !{metadata !5, metadata !28}
!28 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !22} ; [ DW_TAG_pointer_type ]
!29 = metadata !{i32 589870, i32 0, metadata !22, metadata !"B", metadata !"B", metadata !"", metadata !1, i32 19, metadata !30, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!30 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!31 = metadata !{null, metadata !28}
!32 = metadata !{i32 589870, i32 0, metadata !1, metadata !"B", metadata !"B", metadata !"_ZN12_GLOBAL__N_11BC2Ev", metadata !1, i32 19, metadata !33, i1 true, i1 true, i32 0, i32 0, i32 0, i32 320, i1 false, void (%"class.<anonymous namespace>::B"*)* @_ZN12_GLOBAL__N_11BC2Ev} ; [ DW_TAG_subprogram ]
!33 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !34, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!34 = metadata !{null}
!35 = metadata !{i32 589870, i32 0, metadata !1, metadata !"goo", metadata !"goo", metadata !"_ZN12_GLOBAL__N_11B3gooEv", metadata !1, i32 22, metadata !3, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%"class.<anonymous namespace>::B"*)* @_ZN12_GLOBAL__N_11B3gooEv} ; [ DW_TAG_subprogram ]
!36 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN12_GLOBAL__N_11B3fooEv", metadata !1, i32 21, metadata !3, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%"class.<anonymous namespace>::B"*)* @_ZN12_GLOBAL__N_11B3fooEv} ; [ DW_TAG_subprogram ]
!37 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A", metadata !"A", metadata !"_ZN12_GLOBAL__N_11AC2Ev", metadata !1, i32 9, metadata !33, i1 true, i1 true, i32 0, i32 0, i32 0, i32 320, i1 false, void (%"class.<anonymous namespace>::A"*)* @_ZN12_GLOBAL__N_11AC2Ev} ; [ DW_TAG_subprogram ]
!38 = metadata !{i32 589870, i32 0, metadata !1, metadata !"goo", metadata !"goo", metadata !"_ZN12_GLOBAL__N_11A3gooEv", metadata !1, i32 14, metadata !3, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%"class.<anonymous namespace>::A"*)* @_ZN12_GLOBAL__N_11A3gooEv} ; [ DW_TAG_subprogram ]
!39 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN12_GLOBAL__N_11A3fooEv", metadata !1, i32 11, metadata !3, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%"class.<anonymous namespace>::A"*)* @_ZN12_GLOBAL__N_11A3fooEv} ; [ DW_TAG_subprogram ]
!40 = metadata !{i32 590081, metadata !0, metadata !"argc", metadata !1, i32 16777242, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!41 = metadata !{i32 26, i32 14, metadata !0, null}
!42 = metadata !{i32 590081, metadata !0, metadata !"args", metadata !1, i32 33554458, metadata !43, i32 0} ; [ DW_TAG_arg_variable ]
!43 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !44} ; [ DW_TAG_pointer_type ]
!44 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ]
!45 = metadata !{i32 589860, metadata !2, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!46 = metadata !{i32 26, i32 27, metadata !0, null}
!47 = metadata !{i32 590080, metadata !48, metadata !"a", metadata !1, i32 27, metadata !49, i32 0} ; [ DW_TAG_auto_variable ]
!48 = metadata !{i32 589835, metadata !0, i32 26, i32 33, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!49 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!50 = metadata !{i32 27, i32 5, metadata !48, null}
!51 = metadata !{i32 27, i32 16, metadata !48, null}
!52 = metadata !{i32 590080, metadata !48, metadata !"b", metadata !1, i32 28, metadata !53, i32 0} ; [ DW_TAG_auto_variable ]
!53 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ]
!54 = metadata !{i32 28, i32 5, metadata !48, null}
!55 = metadata !{i32 28, i32 16, metadata !48, null}
!56 = metadata !{i32 590080, metadata !48, metadata !"ret", metadata !1, i32 29, metadata !57, i32 0} ; [ DW_TAG_auto_variable ]
!57 = metadata !{i32 589862, metadata !2, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !5} ; [ DW_TAG_const_type ]
!58 = metadata !{i32 29, i32 12, metadata !48, null}
!59 = metadata !{i32 29, i32 37, metadata !48, null}
!60 = metadata !{metadata !"_ZN12_GLOBAL__N_11A3fooEv"}
!61 = metadata !{metadata !"_ZN12_GLOBAL__N_11B3fooEv"}
!62 = metadata !{i32 30, i32 2, metadata !48, null}
!63 = metadata !{i32 31, i32 2, metadata !48, null}
!64 = metadata !{i32 32, i32 2, metadata !48, null}
!65 = metadata !{i32 590081, metadata !32, metadata !"this", metadata !1, i32 16777235, metadata !53, i32 64} ; [ DW_TAG_arg_variable ]
!66 = metadata !{i32 19, i32 7, metadata !32, null}
!67 = metadata !{i32 19, i32 7, metadata !68, null}
!68 = metadata !{i32 589835, metadata !32, i32 19, i32 7, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!69 = metadata !{i32 590081, metadata !37, metadata !"this", metadata !1, i32 16777225, metadata !49, i32 64} ; [ DW_TAG_arg_variable ]
!70 = metadata !{i32 9, i32 7, metadata !37, null}
!71 = metadata !{i32 9, i32 7, metadata !72, null}
!72 = metadata !{i32 589835, metadata !37, i32 9, i32 7, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 590081, metadata !36, metadata !"this", metadata !1, i32 16777237, metadata !53, i32 64} ; [ DW_TAG_arg_variable ]
!74 = metadata !{i32 21, i32 14, metadata !36, null}
!75 = metadata !{i32 21, i32 25, metadata !76, null}
!76 = metadata !{i32 589835, metadata !36, i32 21, i32 24, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!77 = metadata !{i32 590081, metadata !35, metadata !"this", metadata !1, i32 16777238, metadata !53, i32 64} ; [ DW_TAG_arg_variable ]
!78 = metadata !{i32 22, i32 14, metadata !35, null}
!79 = metadata !{i32 22, i32 25, metadata !80, null}
!80 = metadata !{i32 589835, metadata !35, i32 22, i32 24, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!81 = metadata !{i32 590081, metadata !39, metadata !"this", metadata !1, i32 16777227, metadata !49, i32 64} ; [ DW_TAG_arg_variable ]
!82 = metadata !{i32 11, i32 14, metadata !39, null}
!83 = metadata !{i32 12, i32 3, metadata !84, null}
!84 = metadata !{i32 589835, metadata !39, i32 11, i32 24, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!85 = metadata !{metadata !"_ZN12_GLOBAL__N_11A3gooEv"}
!86 = metadata !{i32 590081, metadata !38, metadata !"this", metadata !1, i32 16777230, metadata !49, i32 64} ; [ DW_TAG_arg_variable ]
!87 = metadata !{i32 14, i32 14, metadata !38, null}
!88 = metadata !{i32 15, i32 3, metadata !89, null}
!89 = metadata !{i32 589835, metadata !38, i32 14, i32 24, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
