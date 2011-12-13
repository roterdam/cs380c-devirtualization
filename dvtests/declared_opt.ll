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

define i32 @main(i32 %argc, i8** nocapture %args) {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !43), !dbg !62
  tail call void @llvm.dbg.value(metadata !{i8** %args}, i64 0, metadata !44), !dbg !63
  %1 = tail call noalias i8* @_Znwm(i64 8), !dbg !64
  %2 = bitcast i8* %1 to %"class.<anonymous namespace>::Base"*, !dbg !64
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %2}, i64 0, metadata !60), !dbg !65
  %3 = bitcast i8* %1 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*]* @_ZTVN12_GLOBAL__N_14BaseE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %2}, i64 0, metadata !47), !dbg !64
  %4 = tail call noalias i8* @_Znwm(i64 8), !dbg !66
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !57), !dbg !67
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !60)
  %5 = bitcast i8* %4 to i8***
  store i8** getelementptr inbounds ([4 x i8*]* @_ZTVN12_GLOBAL__N_15ChildE, i64 0, i64 2), i8*** %5, align 8
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !50), !dbg !66
  %6 = bitcast i8* %1 to i8 (%"class.<anonymous namespace>::Base"*)***, !dbg !68
  %7 = load i8 (%"class.<anonymous namespace>::Base"*)*** %6, align 8, !dbg !68
  %8 = load i8 (%"class.<anonymous namespace>::Base"*)** %7, align 8, !dbg !68
  %9 = tail call signext i8 %8(%"class.<anonymous namespace>::Base"* %2), !dbg !68, !virtual-call !69
  tail call void @llvm.dbg.value(metadata !{i8 %9}, i64 0, metadata !52), !dbg !68
  %10 = load i8 (%"class.<anonymous namespace>::Base"*)*** %6, align 8, !dbg !70
  %11 = load i8 (%"class.<anonymous namespace>::Base"*)** %10, align 8, !dbg !70
  %12 = tail call signext i8 %11(%"class.<anonymous namespace>::Base"* %2), !dbg !70, !virtual-call !69
  tail call void @llvm.dbg.value(metadata !{i8 %12}, i64 0, metadata !54), !dbg !70
  %13 = sext i8 %9 to i32, !dbg !71
  %14 = sext i8 %12 to i32, !dbg !71
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !55), !dbg !71
  %15 = bitcast i8* %1 to i32 (%"class.<anonymous namespace>::Base"*)***, !dbg !72
  %16 = load i32 (%"class.<anonymous namespace>::Base"*)*** %15, align 8, !dbg !72
  %17 = getelementptr inbounds i32 (%"class.<anonymous namespace>::Base"*)** %16, i64 1, !dbg !72
  %18 = load i32 (%"class.<anonymous namespace>::Base"*)** %17, align 8, !dbg !72
  %19 = tail call i32 %18(%"class.<anonymous namespace>::Base"* %2), !dbg !72, !virtual-call !73
  %20 = bitcast i8* %4 to %"class.<anonymous namespace>::Base"*, !dbg !72
  %21 = bitcast i8* %4 to i32 (%"class.<anonymous namespace>::Base"*)***, !dbg !72
  %22 = load i32 (%"class.<anonymous namespace>::Base"*)*** %21, align 8, !dbg !72
  %23 = getelementptr inbounds i32 (%"class.<anonymous namespace>::Base"*)** %22, i64 1, !dbg !72
  %24 = load i32 (%"class.<anonymous namespace>::Base"*)** %23, align 8, !dbg !72
  %25 = tail call i32 %24(%"class.<anonymous namespace>::Base"* %20), !dbg !72, !virtual-call !73
  %26 = add i32 %14, %13, !dbg !71
  %27 = add i32 %26, %19, !dbg !72
  %28 = add i32 %27, %25, !dbg !72
  ret i32 %28, !dbg !72
}

declare noalias i8* @_Znwm(i64)

define internal signext i8 @_ZN12_GLOBAL__N_15Child4nameEv(%"class.<anonymous namespace>::Child"* nocapture %this) nounwind readnone align 2 {
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Child"* %this}, i64 0, metadata !59), !dbg !74
  ret i8 49, !dbg !75
}

define internal i32 @_ZN12_GLOBAL__N_14Base8nameHashEv(%"class.<anonymous namespace>::Base"* %this) align 2 {
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %this}, i64 0, metadata !58), !dbg !77
  %1 = bitcast %"class.<anonymous namespace>::Base"* %this to i8 (%"class.<anonymous namespace>::Base"*)***, !dbg !78
  %2 = load i8 (%"class.<anonymous namespace>::Base"*)*** %1, align 8, !dbg !78
  %3 = load i8 (%"class.<anonymous namespace>::Base"*)** %2, align 8, !dbg !78
  %4 = tail call signext i8 %3(%"class.<anonymous namespace>::Base"* %this), !dbg !78, !virtual-call !69
  %5 = sext i8 %4 to i32, !dbg !78
  ret i32 %5, !dbg !78
}

define internal signext i8 @_ZN12_GLOBAL__N_14Base4nameEv(%"class.<anonymous namespace>::Base"* nocapture %this) nounwind readnone align 2 {
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %this}, i64 0, metadata !61), !dbg !80
  ret i8 48, !dbg !81
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !6, !13, !17, !24, !28, !34, !37, !38, !41, !42}
!llvm.dbg.lv.main = !{!43, !44, !47, !50, !52, !54, !55}
!llvm.dbg.lv._ZN12_GLOBAL__N_15ChildC2Ev = !{!57}
!llvm.dbg.lv._ZN12_GLOBAL__N_14Base8nameHashEv = !{!58}
!llvm.dbg.lv._ZN12_GLOBAL__N_15Child4nameEv = !{!59}
!llvm.dbg.lv._ZN12_GLOBAL__N_14BaseC2Ev = !{!60}
!llvm.dbg.lv._ZN12_GLOBAL__N_14Base4nameEv = !{!61}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"", metadata !1, i32 21, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"declared.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 4, metadata !"declared.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !"clang version 2.9 (tags/RELEASE_29/final)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !4, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !2, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"name", metadata !"name", metadata !"_ZN12_GLOBAL__N_14Base4nameEv", metadata !1, i32 11, metadata !21, i1 false, i1 false, i32 1, i32 0, metadata !7, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589826, metadata !8, metadata !"Base", metadata !1, i32 9, i64 64, i64 64, i32 0, i32 0, null, metadata !9, i32 0, metadata !7, metadata !20} ; [ DW_TAG_class_type ]
!8 = metadata !{i32 589881, metadata !2, metadata !"", metadata !1, i32 8} ; [ DW_TAG_namespace ]
!9 = metadata !{metadata !10, metadata !6, metadata !13, metadata !17}
!10 = metadata !{i32 589837, metadata !1, metadata !"_vptr$Base", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!11 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589839, metadata !2, metadata !"__vtbl_ptr_type", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 589870, i32 0, metadata !7, metadata !"nameHash", metadata !"nameHash", metadata !"_ZN12_GLOBAL__N_14Base8nameHashEv", metadata !1, i32 12, metadata !14, i1 false, i1 false, i32 1, i32 1, metadata !7, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{metadata !5, metadata !16}
!16 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !7} ; [ DW_TAG_pointer_type ]
!17 = metadata !{i32 589870, i32 0, metadata !7, metadata !"Base", metadata !"Base", metadata !"", metadata !1, i32 9, metadata !18, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{null, metadata !16}
!20 = metadata !{i32 0}
!21 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{metadata !23, metadata !16}
!23 = metadata !{i32 589860, metadata !2, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!24 = metadata !{i32 589870, i32 0, metadata !25, metadata !"name", metadata !"name", metadata !"_ZN12_GLOBAL__N_15Child4nameEv", metadata !1, i32 17, metadata !32, i1 false, i1 false, i32 1, i32 0, metadata !25, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!25 = metadata !{i32 589826, metadata !8, metadata !"Child", metadata !1, i32 15, i64 64, i64 64, i32 0, i32 0, null, metadata !26, i32 0, metadata !7, metadata !20} ; [ DW_TAG_class_type ]
!26 = metadata !{metadata !27, metadata !24, metadata !28}
!27 = metadata !{i32 589852, metadata !25, null, metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !7} ; [ DW_TAG_inheritance ]
!28 = metadata !{i32 589870, i32 0, metadata !25, metadata !"Child", metadata !"Child", metadata !"", metadata !1, i32 15, metadata !29, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !30, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{null, metadata !31}
!31 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !25} ; [ DW_TAG_pointer_type ]
!32 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !33, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!33 = metadata !{metadata !23, metadata !31}
!34 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Child", metadata !"Child", metadata !"_ZN12_GLOBAL__N_15ChildC2Ev", metadata !1, i32 15, metadata !35, i1 true, i1 true, i32 0, i32 0, i32 0, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !36, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!36 = metadata !{null}
!37 = metadata !{i32 589870, i32 0, metadata !1, metadata !"nameHash", metadata !"nameHash", metadata !"_ZN12_GLOBAL__N_14Base8nameHashEv", metadata !1, i32 12, metadata !3, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (%"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14Base8nameHashEv} ; [ DW_TAG_subprogram ]
!38 = metadata !{i32 589870, i32 0, metadata !1, metadata !"name", metadata !"name", metadata !"_ZN12_GLOBAL__N_15Child4nameEv", metadata !1, i32 17, metadata !39, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i8 (%"class.<anonymous namespace>::Child"*)* @_ZN12_GLOBAL__N_15Child4nameEv} ; [ DW_TAG_subprogram ]
!39 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !40, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!40 = metadata !{metadata !23}
!41 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Base", metadata !"Base", metadata !"_ZN12_GLOBAL__N_14BaseC2Ev", metadata !1, i32 9, metadata !35, i1 true, i1 true, i32 0, i32 0, i32 0, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!42 = metadata !{i32 589870, i32 0, metadata !1, metadata !"name", metadata !"name", metadata !"_ZN12_GLOBAL__N_14Base4nameEv", metadata !1, i32 11, metadata !39, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i8 (%"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14Base4nameEv} ; [ DW_TAG_subprogram ]
!43 = metadata !{i32 590081, metadata !0, metadata !"argc", metadata !1, i32 16777237, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!44 = metadata !{i32 590081, metadata !0, metadata !"args", metadata !1, i32 33554453, metadata !45, i32 0} ; [ DW_TAG_arg_variable ]
!45 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ]
!46 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ]
!47 = metadata !{i32 590080, metadata !48, metadata !"basePtr", metadata !1, i32 22, metadata !49, i32 0} ; [ DW_TAG_auto_variable ]
!48 = metadata !{i32 589835, metadata !0, i32 21, i32 33, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!49 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!50 = metadata !{i32 590080, metadata !48, metadata !"childPtr", metadata !1, i32 23, metadata !51, i32 0} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ]
!52 = metadata !{i32 590080, metadata !48, metadata !"baseName", metadata !1, i32 24, metadata !53, i32 0} ; [ DW_TAG_auto_variable ]
!53 = metadata !{i32 589862, metadata !2, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_const_type ]
!54 = metadata !{i32 590080, metadata !48, metadata !"childName", metadata !1, i32 25, metadata !53, i32 0} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 590080, metadata !48, metadata !"s", metadata !1, i32 26, metadata !56, i32 0} ; [ DW_TAG_auto_variable ]
!56 = metadata !{i32 589862, metadata !2, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !5} ; [ DW_TAG_const_type ]
!57 = metadata !{i32 590081, metadata !34, metadata !"this", metadata !1, i32 16777231, metadata !51, i32 64} ; [ DW_TAG_arg_variable ]
!58 = metadata !{i32 590081, metadata !37, metadata !"this", metadata !1, i32 16777228, metadata !49, i32 64} ; [ DW_TAG_arg_variable ]
!59 = metadata !{i32 590081, metadata !38, metadata !"this", metadata !1, i32 16777233, metadata !51, i32 64} ; [ DW_TAG_arg_variable ]
!60 = metadata !{i32 590081, metadata !41, metadata !"this", metadata !1, i32 16777225, metadata !49, i32 64} ; [ DW_TAG_arg_variable ]
!61 = metadata !{i32 590081, metadata !42, metadata !"this", metadata !1, i32 16777227, metadata !49, i32 64} ; [ DW_TAG_arg_variable ]
!62 = metadata !{i32 21, i32 14, metadata !0, null}
!63 = metadata !{i32 21, i32 27, metadata !0, null}
!64 = metadata !{i32 22, i32 28, metadata !48, null}
!65 = metadata !{i32 9, i32 7, metadata !41, metadata !64}
!66 = metadata !{i32 23, i32 31, metadata !48, null}
!67 = metadata !{i32 15, i32 7, metadata !34, metadata !66}
!68 = metadata !{i32 24, i32 39, metadata !48, null}
!69 = metadata !{metadata !"_ZN12_GLOBAL__N_14Base4nameEv"}
!70 = metadata !{i32 25, i32 40, metadata !48, null}
!71 = metadata !{i32 26, i32 46, metadata !48, null}
!72 = metadata !{i32 27, i32 2, metadata !48, null}
!73 = metadata !{metadata !"_ZN12_GLOBAL__N_14Base8nameHashEv"}
!74 = metadata !{i32 17, i32 15, metadata !38, null}
!75 = metadata !{i32 17, i32 27, metadata !76, null}
!76 = metadata !{i32 589835, metadata !38, i32 17, i32 26, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!77 = metadata !{i32 12, i32 14, metadata !37, null}
!78 = metadata !{i32 12, i32 30, metadata !79, null}
!79 = metadata !{i32 589835, metadata !37, i32 12, i32 29, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 11, i32 15, metadata !42, null}
!81 = metadata !{i32 11, i32 27, metadata !82, null}
!82 = metadata !{i32 589835, metadata !42, i32 11, i32 26, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
