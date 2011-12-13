; ModuleID = 'pairwise.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8*, i8* }
%"class.<anonymous namespace>::Base" = type { i32 (...)**, [10 x i32] }

@_ZTVN12_GLOBAL__N_14BaseE = internal unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast (%0* @_ZTIN12_GLOBAL__N_14BaseE to i8*), i8* bitcast (i1 (%"class.<anonymous namespace>::Base"*, %"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14BaseeqERKS0_ to i8*), i8* bitcast (i1 (%"class.<anonymous namespace>::Base"*, %"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14BaseneERKS0_ to i8*)]
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSN12_GLOBAL__N_14BaseE = internal constant [22 x i8] c"N12_GLOBAL__N_14BaseE\00"
@_ZTIN12_GLOBAL__N_14BaseE = internal unnamed_addr constant %0 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([22 x i8]* @_ZTSN12_GLOBAL__N_14BaseE, i32 0, i32 0) }

define i32 @main(i32 %argc, i8** nocapture %args) {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !37), !dbg !59
  tail call void @llvm.dbg.value(metadata !{i8** %args}, i64 0, metadata !38), !dbg !60
  %1 = tail call noalias i8* @_Znwm(i64 48), !dbg !61
  %2 = bitcast i8* %1 to %"class.<anonymous namespace>::Base"*, !dbg !61
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %2}, i64 0, metadata !48), !dbg !62
  %3 = bitcast i8* %1 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*]* @_ZTVN12_GLOBAL__N_14BaseE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %2}, i64 0, metadata !42), !dbg !61
  %4 = tail call noalias i8* @_Znwm(i64 48), !dbg !63
  %5 = bitcast i8* %4 to %"class.<anonymous namespace>::Base"*, !dbg !63
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %5}, i64 0, metadata !48), !dbg !64
  %6 = bitcast i8* %4 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*]* @_ZTVN12_GLOBAL__N_14BaseE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %6, align 8
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %5}, i64 0, metadata !45), !dbg !63
  %7 = bitcast i8* %1 to i1 (%"class.<anonymous namespace>::Base"*, %"class.<anonymous namespace>::Base"*)***, !dbg !65
  %8 = load i1 (%"class.<anonymous namespace>::Base"*, %"class.<anonymous namespace>::Base"*)*** %7, align 8, !dbg !65
  %9 = load i1 (%"class.<anonymous namespace>::Base"*, %"class.<anonymous namespace>::Base"*)** %8, align 8, !dbg !65
  %10 = tail call zeroext i1 %9(%"class.<anonymous namespace>::Base"* %2, %"class.<anonymous namespace>::Base"* %5), !dbg !65, !virtual-call !66
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !46), !dbg !65
  %11 = icmp eq i8* %4, null, !dbg !67
  br i1 %11, label %13, label %12, !dbg !67

; <label>:12                                      ; preds = %0
  tail call void @_ZdlPv(i8* %4) nounwind, !dbg !67
  br label %13, !dbg !67

; <label>:13                                      ; preds = %12, %0
  %14 = icmp eq i8* %1, null, !dbg !68
  br i1 %14, label %16, label %15, !dbg !68

; <label>:15                                      ; preds = %13
  tail call void @_ZdlPv(i8* %1) nounwind, !dbg !68
  br label %16, !dbg !68

; <label>:16                                      ; preds = %15, %13
  ret i32 0, !dbg !69
}

declare noalias i8* @_Znwm(i64)

declare void @_ZdlPv(i8*) nounwind

define internal zeroext i1 @_ZN12_GLOBAL__N_14BaseeqERKS0_(%"class.<anonymous namespace>::Base"* %this, %"class.<anonymous namespace>::Base"* %other) nounwind readonly align 2 {
; <label>:0
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %this}, i64 0, metadata !57), !dbg !70
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %other}, i64 0, metadata !58), !dbg !71
  %1 = icmp eq %"class.<anonymous namespace>::Base"* %other, %this, !dbg !72
  br i1 %1, label %_ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_.exit, label %.preheader, !dbg !72

.preheader:                                       ; preds = %0, %7
  %indvar.i = phi i64 [ %indvar.next.i, %7 ], [ 0, %0 ]
  %i.0.i = trunc i64 %indvar.i to i32
  %2 = icmp ult i32 %i.0.i, 10, !dbg !74
  br i1 %2, label %3, label %_ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_.exit, !dbg !74

; <label>:3                                       ; preds = %.preheader
  %scevgep1.i = getelementptr %"class.<anonymous namespace>::Base"* %this, i64 0, i32 1, i64 %indvar.i
  %scevgep.i = getelementptr %"class.<anonymous namespace>::Base"* %other, i64 0, i32 1, i64 %indvar.i
  %4 = load i32* %scevgep1.i, align 4, !dbg !76, !tbaa !78
  %5 = load i32* %scevgep.i, align 4, !dbg !76, !tbaa !78
  %6 = icmp eq i32 %4, %5, !dbg !76
  br i1 %6, label %7, label %_ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_.exit, !dbg !76

; <label>:7                                       ; preds = %3
  %indvar.next.i = add i64 %indvar.i, 1
  br label %.preheader, !dbg !81

_ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_.exit:   ; preds = %3, %.preheader, %0
  %.0 = phi i1 [ true, %0 ], [ false, %3 ], [ true, %.preheader ]
  ret i1 %.0, !dbg !82
}

define internal zeroext i1 @_ZN12_GLOBAL__N_14BaseneERKS0_(%"class.<anonymous namespace>::Base"* %this, %"class.<anonymous namespace>::Base"* %other) nounwind readonly align 2 {
; <label>:0
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %this}, i64 0, metadata !49), !dbg !83
  tail call void @llvm.dbg.value(metadata !{%"class.<anonymous namespace>::Base"* %other}, i64 0, metadata !50), !dbg !84
  %1 = icmp eq %"class.<anonymous namespace>::Base"* %other, %this, !dbg !85
  br i1 %1, label %_ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_.exit, label %.preheader, !dbg !85

.preheader:                                       ; preds = %0, %7
  %indvar.i = phi i64 [ %indvar.next.i, %7 ], [ 0, %0 ]
  %i.0.i = trunc i64 %indvar.i to i32
  %2 = icmp ult i32 %i.0.i, 10, !dbg !87
  br i1 %2, label %3, label %_ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_.exit, !dbg !87

; <label>:3                                       ; preds = %.preheader
  %scevgep1.i = getelementptr %"class.<anonymous namespace>::Base"* %this, i64 0, i32 1, i64 %indvar.i
  %scevgep.i = getelementptr %"class.<anonymous namespace>::Base"* %other, i64 0, i32 1, i64 %indvar.i
  %4 = load i32* %scevgep1.i, align 4, !dbg !89, !tbaa !78
  %5 = load i32* %scevgep.i, align 4, !dbg !89, !tbaa !78
  %6 = icmp eq i32 %4, %5, !dbg !89
  br i1 %6, label %7, label %_ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_.exit, !dbg !89

; <label>:7                                       ; preds = %3
  %indvar.next.i = add i64 %indvar.i, 1
  br label %.preheader, !dbg !90

_ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_.exit:   ; preds = %3, %.preheader, %0
  %.0 = phi i1 [ false, %0 ], [ true, %3 ], [ false, %.preheader ]
  ret i1 %.0, !dbg !91
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !6, !17, !24, !25, !29, !32, !35, !36}
!llvm.dbg.lv.main = !{!37, !38, !42, !45, !46}
!llvm.dbg.lv._ZN12_GLOBAL__N_14BaseC2Ev = !{!48}
!llvm.dbg.lv._ZN12_GLOBAL__N_14BaseneERKS0_ = !{!49, !50}
!llvm.dbg.lv._ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_ = !{!51, !52, !53}
!llvm.dbg.lv._ZN12_GLOBAL__N_14BaseeqERKS0_ = !{!57, !58}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"", metadata !1, i32 34, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"pairwise.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 4, metadata !"pairwise.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !"clang version 2.9 (tags/RELEASE_29/final)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !4, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !2, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"operator==", metadata !"operator==", metadata !"_ZN12_GLOBAL__N_14BaseeqERKS0_", metadata !1, i32 12, metadata !18, i1 false, i1 false, i32 1, i32 0, metadata !7, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589826, metadata !8, metadata !"Base", metadata !1, i32 9, i64 384, i64 64, i32 0, i32 0, null, metadata !9, i32 0, metadata !7, metadata !28} ; [ DW_TAG_class_type ]
!8 = metadata !{i32 589881, metadata !2, metadata !"", metadata !1, i32 8} ; [ DW_TAG_namespace ]
!9 = metadata !{metadata !10, metadata !13, metadata !6, metadata !17, metadata !24, metadata !25}
!10 = metadata !{i32 589837, metadata !1, metadata !"_vptr$Base", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!11 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589839, metadata !2, metadata !"__vtbl_ptr_type", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 589837, metadata !1, metadata !"vars", metadata !1, i32 22, i64 320, i64 32, i64 64, i32 2, metadata !14} ; [ DW_TAG_member ]
!14 = metadata !{i32 589825, metadata !2, metadata !"", metadata !2, i32 0, i64 320, i64 32, i32 0, i32 0, metadata !5, metadata !15, i32 0, i32 0} ; [ DW_TAG_array_type ]
!15 = metadata !{metadata !16}
!16 = metadata !{i32 589857, i64 0, i64 9}        ; [ DW_TAG_subrange_type ]
!17 = metadata !{i32 589870, i32 0, metadata !7, metadata !"operator!=", metadata !"operator!=", metadata !"_ZN12_GLOBAL__N_14BaseneERKS0_", metadata !1, i32 16, metadata !18, i1 false, i1 false, i32 1, i32 1, metadata !7, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{metadata !20, metadata !21, metadata !22}
!20 = metadata !{i32 589860, metadata !2, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!21 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !7} ; [ DW_TAG_pointer_type ]
!22 = metadata !{i32 589840, metadata !2, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_reference_type ]
!23 = metadata !{i32 589862, metadata !2, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !7} ; [ DW_TAG_const_type ]
!24 = metadata !{i32 589870, i32 0, metadata !7, metadata !"sameArrayAs", metadata !"sameArrayAs", metadata !"_ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_", metadata !1, i32 24, metadata !18, i1 false, i1 false, i32 0, i32 0, null, i32 258, i1 true, null} ; [ DW_TAG_subprogram ]
!25 = metadata !{i32 589870, i32 0, metadata !7, metadata !"Base", metadata !"Base", metadata !"", metadata !1, i32 9, metadata !26, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!26 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !27, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!27 = metadata !{null, metadata !21}
!28 = metadata !{i32 0}
!29 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Base", metadata !"Base", metadata !"_ZN12_GLOBAL__N_14BaseC2Ev", metadata !1, i32 9, metadata !30, i1 true, i1 true, i32 0, i32 0, i32 0, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!30 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!31 = metadata !{null}
!32 = metadata !{i32 589870, i32 0, metadata !1, metadata !"operator!=", metadata !"operator!=", metadata !"_ZN12_GLOBAL__N_14BaseneERKS0_", metadata !1, i32 16, metadata !33, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i1 (%"class.<anonymous namespace>::Base"*, %"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14BaseneERKS0_} ; [ DW_TAG_subprogram ]
!33 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !34, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!34 = metadata !{metadata !20}
!35 = metadata !{i32 589870, i32 0, metadata !1, metadata !"sameArrayAs", metadata !"sameArrayAs", metadata !"_ZN12_GLOBAL__N_14Base11sameArrayAsERKS0_", metadata !1, i32 24, metadata !33, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!36 = metadata !{i32 589870, i32 0, metadata !1, metadata !"operator==", metadata !"operator==", metadata !"_ZN12_GLOBAL__N_14BaseeqERKS0_", metadata !1, i32 12, metadata !33, i1 true, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i1 (%"class.<anonymous namespace>::Base"*, %"class.<anonymous namespace>::Base"*)* @_ZN12_GLOBAL__N_14BaseeqERKS0_} ; [ DW_TAG_subprogram ]
!37 = metadata !{i32 590081, metadata !0, metadata !"argc", metadata !1, i32 16777250, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!38 = metadata !{i32 590081, metadata !0, metadata !"args", metadata !1, i32 33554466, metadata !39, i32 0} ; [ DW_TAG_arg_variable ]
!39 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !40} ; [ DW_TAG_pointer_type ]
!40 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ]
!41 = metadata !{i32 589860, metadata !2, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!42 = metadata !{i32 590080, metadata !43, metadata !"basePtr", metadata !1, i32 35, metadata !44, i32 0} ; [ DW_TAG_auto_variable ]
!43 = metadata !{i32 589835, metadata !0, i32 34, i32 33, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!44 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!45 = metadata !{i32 590080, metadata !43, metadata !"basePtr2", metadata !1, i32 36, metadata !44, i32 0} ; [ DW_TAG_auto_variable ]
!46 = metadata !{i32 590080, metadata !43, metadata !"same", metadata !1, i32 37, metadata !47, i32 0} ; [ DW_TAG_auto_variable ]
!47 = metadata !{i32 589862, metadata !2, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ]
!48 = metadata !{i32 590081, metadata !29, metadata !"this", metadata !1, i32 16777225, metadata !44, i32 64} ; [ DW_TAG_arg_variable ]
!49 = metadata !{i32 590081, metadata !32, metadata !"this", metadata !1, i32 16777232, metadata !44, i32 64} ; [ DW_TAG_arg_variable ]
!50 = metadata !{i32 590081, metadata !32, metadata !"other", metadata !1, i32 33554448, metadata !22, i32 0} ; [ DW_TAG_arg_variable ]
!51 = metadata !{i32 590081, metadata !35, metadata !"this", metadata !1, i32 16777240, metadata !44, i32 64} ; [ DW_TAG_arg_variable ]
!52 = metadata !{i32 590081, metadata !35, metadata !"other", metadata !1, i32 33554456, metadata !22, i32 0} ; [ DW_TAG_arg_variable ]
!53 = metadata !{i32 590080, metadata !54, metadata !"i", metadata !1, i32 25, metadata !56, i32 0} ; [ DW_TAG_auto_variable ]
!54 = metadata !{i32 589835, metadata !55, i32 25, i32 3, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!55 = metadata !{i32 589835, metadata !35, i32 24, i32 38, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!56 = metadata !{i32 589860, metadata !2, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!57 = metadata !{i32 590081, metadata !36, metadata !"this", metadata !1, i32 16777228, metadata !44, i32 64} ; [ DW_TAG_arg_variable ]
!58 = metadata !{i32 590081, metadata !36, metadata !"other", metadata !1, i32 33554444, metadata !22, i32 0} ; [ DW_TAG_arg_variable ]
!59 = metadata !{i32 34, i32 14, metadata !0, null}
!60 = metadata !{i32 34, i32 27, metadata !0, null}
!61 = metadata !{i32 35, i32 26, metadata !43, null}
!62 = metadata !{i32 9, i32 7, metadata !29, metadata !61}
!63 = metadata !{i32 36, i32 27, metadata !43, null}
!64 = metadata !{i32 9, i32 7, metadata !29, metadata !63}
!65 = metadata !{i32 37, i32 51, metadata !43, null}
!66 = metadata !{metadata !"_ZN12_GLOBAL__N_14BaseeqERKS0_"}
!67 = metadata !{i32 38, i32 2, metadata !43, null}
!68 = metadata !{i32 39, i32 2, metadata !43, null}
!69 = metadata !{i32 40, i32 2, metadata !43, null}
!70 = metadata !{i32 12, i32 15, metadata !36, null}
!71 = metadata !{i32 12, i32 38, metadata !36, null}
!72 = metadata !{i32 13, i32 3, metadata !73, null}
!73 = metadata !{i32 589835, metadata !36, i32 12, i32 45, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!74 = metadata !{i32 25, i32 3, metadata !55, metadata !75}
!75 = metadata !{i32 14, i32 3, metadata !73, null}
!76 = metadata !{i32 26, i32 4, metadata !77, metadata !75}
!77 = metadata !{i32 589835, metadata !54, i32 25, i32 41, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!78 = metadata !{metadata !"int", metadata !79}
!79 = metadata !{metadata !"omnipotent char", metadata !80}
!80 = metadata !{metadata !"Simple C/C++ TBAA", null}
!81 = metadata !{i32 25, i32 36, metadata !54, metadata !75}
!82 = metadata !{i32 15, i32 2, metadata !73, null}
!83 = metadata !{i32 16, i32 15, metadata !32, null}
!84 = metadata !{i32 16, i32 38, metadata !32, null}
!85 = metadata !{i32 17, i32 3, metadata !86, null}
!86 = metadata !{i32 589835, metadata !32, i32 16, i32 45, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!87 = metadata !{i32 25, i32 3, metadata !55, metadata !88}
!88 = metadata !{i32 18, i32 3, metadata !86, null}
!89 = metadata !{i32 26, i32 4, metadata !77, metadata !88}
!90 = metadata !{i32 25, i32 36, metadata !54, metadata !88}
!91 = metadata !{i32 19, i32 2, metadata !86, null}
