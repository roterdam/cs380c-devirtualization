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

define i32 @main(i32 %argc, i8** nocapture %args) {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !40), !dbg !58
  tail call void @llvm.dbg.value(metadata !{i8** %args}, i64 0, metadata !41), !dbg !59
  %1 = tail call noalias i8* @_Znwm(i64 8), !dbg !60
  %2 = bitcast i8* %1 to %"class.<anonymous namespace>::A"*, !dbg !60
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::A"* %2}, i64 0, metadata !55), !dbg !61
  %3 = bitcast i8* %1 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*]* @_ZTVN12_GLOBAL__N_11AE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::A"* %2}, i64 0, metadata !45), !dbg !60
  %4 = tail call noalias i8* @_Znwm(i64 8), !dbg !62
  %5 = bitcast i8* %4 to %"class.<anonymous namespace>::B"*, !dbg !62
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::B"* %5}, i64 0, metadata !52), !dbg !63
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !55)
  %6 = bitcast i8* %4 to i8***
  store i8** getelementptr inbounds ([4 x i8*]* @_ZTVN12_GLOBAL__N_11BE, i64 0, i64 2), i8*** %6, align 8
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::B"* %5}, i64 0, metadata !48), !dbg !62
  %7 = bitcast i8* %1 to i32 (%"class.<anonymous namespace>::A"*)***, !dbg !64
  %8 = load i32 (%"class.<anonymous namespace>::A"*)*** %7, align 8, !dbg !64
  %9 = load i32 (%"class.<anonymous namespace>::A"*)** %8, align 8, !dbg !64
  %10 = tail call i32 %9(%"class.<anonymous namespace>::A"* %2), !dbg !64, !virtual-call !65
  %11 = bitcast i8* %4 to i32 (%"class.<anonymous namespace>::B"*)***, !dbg !64
  %12 = load i32 (%"class.<anonymous namespace>::B"*)*** %11, align 8, !dbg !64
  %13 = load i32 (%"class.<anonymous namespace>::B"*)** %12, align 8, !dbg !64
  %14 = tail call i32 %13(%"class.<anonymous namespace>::B"* %5), !dbg !64, !virtual-call !66
  %15 = add nsw i32 %14, %10, !dbg !64
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !50), !dbg !64
  %16 = icmp eq i8* %1, null, !dbg !67
  br i1 %16, label %18, label %17, !dbg !67

; <label>:17                                      ; preds = %0
  tail call void @_ZdlPv(i8* %1) nounwind, !dbg !67
  br label %18, !dbg !67

; <label>:18                                      ; preds = %17, %0
  %19 = icmp eq i8* %4, null, !dbg !68
  br i1 %19, label %21, label %20, !dbg !68

; <label>:20                                      ; preds = %18
  tail call void @_ZdlPv(i8* %4) nounwind, !dbg !68
  br label %21, !dbg !68

; <label>:21                                      ; preds = %20, %18
  ret i32 %15, !dbg !69
}

declare noalias i8* @_Znwm(i64)

declare void @_ZdlPv(i8*) nounwind

define internal i32 @_ZN12_GLOBAL__N_11B3fooEv(%"class.<anonymous namespace>::B"* nocapture %this) nounwind readnone align 2 {
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::B"* %this}, i64 0, metadata !54), !dbg !70
  ret i32 2, !dbg !71
}

define internal i32 @_ZN12_GLOBAL__N_11B3gooEv(%"class.<anonymous namespace>::B"* nocapture %this) nounwind readnone align 2 {
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::B"* %this}, i64 0, metadata !53), !dbg !73
  ret i32 2, !dbg !74
}

define internal i32 @_ZN12_GLOBAL__N_11A3fooEv(%"class.<anonymous namespace>::A"* %this) align 2 {
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::A"* %this}, i64 0, metadata !57), !dbg !76
  %1 = bitcast %"class.<anonymous namespace>::A"* %this to i32 (%"class.<anonymous namespace>::A"*)***, !dbg !77
  %2 = load i32 (%"class.<anonymous namespace>::A"*)*** %1, align 8, !dbg !77
  %3 = getelementptr inbounds i32 (%"class.<anonymous namespace>::A"*)** %2, i64 1, !dbg !77
  %4 = load i32 (%"class.<anonymous namespace>::A"*)** %3, align 8, !dbg !77
  %5 = tail call i32 %4(%"class.<anonymous namespace>::A"* %this), !dbg !77, !virtual-call !79
  ret i32 %5, !dbg !77
}

define internal i32 @_ZN12_GLOBAL__N_11A3gooEv(%"class.<anonymous namespace>::A"* nocapture %this) nounwind readnone align 2 {
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::A"* %this}, i64 0, metadata !56), !dbg !80
  ret i32 1, !dbg !81
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !6, !13, !17, !21, !25, !29, !32, !35, !36, !37, !38, !39}
!llvm.dbg.lv.main = !{!40, !41, !45, !48, !50}
!llvm.dbg.lv._ZN12_GLOBAL__N_11BC2Ev = !{!52}
!llvm.dbg.lv._ZN12_GLOBAL__N_11B3gooEv = !{!53}
!llvm.dbg.lv._ZN12_GLOBAL__N_11B3fooEv = !{!54}
!llvm.dbg.lv._ZN12_GLOBAL__N_11AC2Ev = !{!55}
!llvm.dbg.lv._ZN12_GLOBAL__N_11A3gooEv = !{!56}
!llvm.dbg.lv._ZN12_GLOBAL__N_11A3fooEv = !{!57}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"", metadata !1, i32 26, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"pairwise.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 4, metadata !"pairwise.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !"clang version 2.9 (tags/RELEASE_29/final)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !4, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !2, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"foo", metadata !"foo", metadata !"_ZN12_GLOBAL__N_11A3fooEv", metadata !1, i32 11, metadata !14, i1 false, i1 false, i32 1, i32 0, metadata !7, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589826, metadata !8, metadata !"A", metadata !1, i32 9, i64 64, i64 64, i32 0, i32 0, null, metadata !9, i32 0, metadata !7, metadata !20} ; [ DW_TAG_class_type ]
!8 = metadata !{i32 589881, metadata !2, metadata !"", metadata !1, i32 8} ; [ DW_TAG_namespace ]
!9 = metadata !{metadata !10, metadata !6, metadata !13, metadata !17}
!10 = metadata !{i32 589837, metadata !1, metadata !"_vptr$A", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!11 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589839, metadata !2, metadata !"__vtbl_ptr_type", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 589870, i32 0, metadata !7, metadata !"goo", metadata !"goo", metadata !"_ZN12_GLOBAL__N_11A3gooEv", metadata !1, i32 14, metadata !14, i1 false, i1 false, i32 1, i32 1, metadata !7, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{metadata !5, metadata !16}
!16 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !7} ; [ DW_TAG_pointer_type ]
!17 = metadata !{i32 589870, i32 0, metadata !7, metadata !"A", metadata !"A", metadata !"", metadata !1, i32 9, metadata !18, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{null, metadata !16}
!20 = metadata !{i32 0}
!21 = metadata !{i32 589870, i32 0, metadata !22, metadata !"foo", metadata !"foo", metadata !"_ZN12_GLOBAL__N_11B3fooEv", metadata !1, i32 21, metadata !26, i1 false, i1 false, i32 1, i32 0, metadata !22, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!22 = metadata !{i32 589826, metadata !8, metadata !"B", metadata !1, i32 19, i64 64, i64 64, i32 0, i32 0, null, metadata !23, i32 0, metadata !7, metadata !20} ; [ DW_TAG_class_type ]
!23 = metadata !{metadata !24, metadata !21, metadata !25, metadata !29}
!24 = metadata !{i32 589852, metadata !22, null, metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !7} ; [ DW_TAG_inheritance ]
!25 = metadata !{i32 589870, i32 0, metadata !22, metadata !"goo", metadata !"goo", metadata !"_ZN12_GLOBAL__N_11B3gooEv", metadata !1, i32 22, metadata !26, i1 false, i1 false, i32 1, i32 1, metadata !22, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!26 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !27, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!27 = metadata !{metadata !5, metadata !28}
!28 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !22} ; [ DW_TAG_pointer_type ]
!29 = metadata !{i32 589870, i32 0, metadata !22, metadata !"B", metadata !"B", metadata !"", metadata !1, i32 19, metadata !30, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!30 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!31 = metadata !{null, metadata !28}
!32 = metadata !{i32 589870, i32 0, metadata !1, metadata !"B", metadata !"B", metadata !"_ZN12_GLOBAL__N_11BC2Ev", metadata !1, i32 19, metadata !33, i1 true, i1 true, i32 0, i32 0, i32 0, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!33 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !34, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!34 = metadata !{null}
!35 = metadata !{i32 589870, i32 0, metadata !1, metadata !"goo", metadata !"goo", metadata !"_ZN12_GLOBAL__N_11B3gooEv", metadata !1, i32 22, metadata !3, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (%"class.<anonymous namespace>::B"*)* @_ZN12_GLOBAL__N_11B3gooEv} ; [ DW_TAG_subprogram ]
!36 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN12_GLOBAL__N_11B3fooEv", metadata !1, i32 21, metadata !3, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (%"class.<anonymous namespace>::B"*)* @_ZN12_GLOBAL__N_11B3fooEv} ; [ DW_TAG_subprogram ]
!37 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A", metadata !"A", metadata !"_ZN12_GLOBAL__N_11AC2Ev", metadata !1, i32 9, metadata !33, i1 true, i1 true, i32 0, i32 0, i32 0, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!38 = metadata !{i32 589870, i32 0, metadata !1, metadata !"goo", metadata !"goo", metadata !"_ZN12_GLOBAL__N_11A3gooEv", metadata !1, i32 14, metadata !3, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (%"class.<anonymous namespace>::A"*)* @_ZN12_GLOBAL__N_11A3gooEv} ; [ DW_TAG_subprogram ]
!39 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN12_GLOBAL__N_11A3fooEv", metadata !1, i32 11, metadata !3, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (%"class.<anonymous namespace>::A"*)* @_ZN12_GLOBAL__N_11A3fooEv} ; [ DW_TAG_subprogram ]
!40 = metadata !{i32 590081, metadata !0, metadata !"argc", metadata !1, i32 16777242, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!41 = metadata !{i32 590081, metadata !0, metadata !"args", metadata !1, i32 33554458, metadata !42, i32 0} ; [ DW_TAG_arg_variable ]
!42 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !43} ; [ DW_TAG_pointer_type ]
!43 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !44} ; [ DW_TAG_pointer_type ]
!44 = metadata !{i32 589860, metadata !2, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!45 = metadata !{i32 590080, metadata !46, metadata !"a", metadata !1, i32 27, metadata !47, i32 0} ; [ DW_TAG_auto_variable ]
!46 = metadata !{i32 589835, metadata !0, i32 26, i32 33, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!47 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!48 = metadata !{i32 590080, metadata !46, metadata !"b", metadata !1, i32 28, metadata !49, i32 0} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ]
!50 = metadata !{i32 590080, metadata !46, metadata !"ret", metadata !1, i32 29, metadata !51, i32 0} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 589862, metadata !2, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !5} ; [ DW_TAG_const_type ]
!52 = metadata !{i32 590081, metadata !32, metadata !"this", metadata !1, i32 16777235, metadata !49, i32 64} ; [ DW_TAG_arg_variable ]
!53 = metadata !{i32 590081, metadata !35, metadata !"this", metadata !1, i32 16777238, metadata !49, i32 64} ; [ DW_TAG_arg_variable ]
!54 = metadata !{i32 590081, metadata !36, metadata !"this", metadata !1, i32 16777237, metadata !49, i32 64} ; [ DW_TAG_arg_variable ]
!55 = metadata !{i32 590081, metadata !37, metadata !"this", metadata !1, i32 16777225, metadata !47, i32 64} ; [ DW_TAG_arg_variable ]
!56 = metadata !{i32 590081, metadata !38, metadata !"this", metadata !1, i32 16777230, metadata !47, i32 64} ; [ DW_TAG_arg_variable ]
!57 = metadata !{i32 590081, metadata !39, metadata !"this", metadata !1, i32 16777227, metadata !47, i32 64} ; [ DW_TAG_arg_variable ]
!58 = metadata !{i32 26, i32 14, metadata !0, null}
!59 = metadata !{i32 26, i32 27, metadata !0, null}
!60 = metadata !{i32 27, i32 16, metadata !46, null}
!61 = metadata !{i32 9, i32 7, metadata !37, metadata !60}
!62 = metadata !{i32 28, i32 16, metadata !46, null}
!63 = metadata !{i32 19, i32 7, metadata !32, metadata !62}
!64 = metadata !{i32 29, i32 37, metadata !46, null}
!65 = metadata !{metadata !"_ZN12_GLOBAL__N_11A3fooEv"}
!66 = metadata !{metadata !"_ZN12_GLOBAL__N_11B3fooEv"}
!67 = metadata !{i32 30, i32 2, metadata !46, null}
!68 = metadata !{i32 31, i32 2, metadata !46, null}
!69 = metadata !{i32 32, i32 2, metadata !46, null}
!70 = metadata !{i32 21, i32 14, metadata !36, null}
!71 = metadata !{i32 21, i32 25, metadata !72, null}
!72 = metadata !{i32 589835, metadata !36, i32 21, i32 24, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 22, i32 14, metadata !35, null}
!74 = metadata !{i32 22, i32 25, metadata !75, null}
!75 = metadata !{i32 589835, metadata !35, i32 22, i32 24, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!76 = metadata !{i32 11, i32 14, metadata !39, null}
!77 = metadata !{i32 12, i32 3, metadata !78, null}
!78 = metadata !{i32 589835, metadata !39, i32 11, i32 24, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!79 = metadata !{metadata !"_ZN12_GLOBAL__N_11A3gooEv"}
!80 = metadata !{i32 14, i32 14, metadata !38, null}
!81 = metadata !{i32 15, i32 3, metadata !82, null}
!82 = metadata !{i32 589835, metadata !38, i32 14, i32 24, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
