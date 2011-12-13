; ModuleID = 'declared.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8*, i8* }
%1 = type { i8*, i8*, i8* }
%class.Base = type { i32 (...)** }
%class.Child = type { [8 x i8] }

@_ZTV5Child = linkonce_odr unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast (%1* @_ZTI5Child to i8*), i8* bitcast (i8 (%class.Child*)* @_ZN5Child4nameEv to i8*), i8* bitcast (i32 (%class.Base*)* @_ZN4Base8nameHashEv to i8*)]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS5Child = linkonce_odr constant [7 x i8] c"5Child\00"
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTS4Base = linkonce_odr constant [6 x i8] c"4Base\00"
@_ZTI4Base = linkonce_odr unnamed_addr constant %0 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([6 x i8]* @_ZTS4Base, i32 0, i32 0) }
@_ZTI5Child = linkonce_odr unnamed_addr constant %1 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([7 x i8]* @_ZTS5Child, i32 0, i32 0), i8* bitcast (%0* @_ZTI4Base to i8*) }
@_ZTV4Base = linkonce_odr unnamed_addr constant [4 x i8*] [i8* null, i8* bitcast (%0* @_ZTI4Base to i8*), i8* bitcast (i8 (%class.Base*)* @_ZN4Base4nameEv to i8*), i8* bitcast (i32 (%class.Base*)* @_ZN4Base8nameHashEv to i8*)]

define i32 @main(i32 %argc, i8** nocapture %args) {
; <label>:0
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !44), !dbg !68
  tail call void @llvm.dbg.value(metadata !{i8** %args}, i64 0, metadata !45), !dbg !69
  %1 = tail call noalias i8* @_Znwm(i64 8), !dbg !70
  %2 = bitcast i8* %1 to %class.Base*, !dbg !70
  tail call void @llvm.dbg.value(metadata !{%class.Base* %2}, i64 0, metadata !67), !dbg !71
  tail call void @llvm.dbg.value(metadata !{%class.Base* %2}, i64 0, metadata !66), !dbg !72
  %3 = bitcast i8* %1 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([4 x i8*]* @_ZTV4Base, i64 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8
  tail call void @llvm.dbg.value(metadata !{%class.Base* %2}, i64 0, metadata !48), !dbg !70
  %4 = tail call noalias i8* @_Znwm(i64 8), !dbg !73
  %5 = bitcast i8* %4 to %class.Child*, !dbg !73
  tail call void @llvm.dbg.value(metadata !{%class.Child* %5}, i64 0, metadata !64), !dbg !74
  tail call void @llvm.dbg.value(metadata !{%class.Child* %5}, i64 0, metadata !65), !dbg !75
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !66)
  %6 = bitcast i8* %4 to i8***
  store i8** getelementptr inbounds ([4 x i8*]* @_ZTV5Child, i64 0, i64 2), i8*** %6, align 8
  tail call void @llvm.dbg.value(metadata !{%class.Child* %5}, i64 0, metadata !51), !dbg !73
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !53), !dbg !77
  tail call void @llvm.dbg.value(metadata !19, i64 0, metadata !54), !dbg !78
  tail call void @llvm.dbg.value(metadata !19, i64 0, metadata !55), !dbg !79
  %7 = bitcast i8* %1 to i8 (%class.Base*)***, !dbg !80
  %8 = bitcast i8* %4 to i8 (%class.Child*)***, !dbg !82
  %9 = bitcast i8* %1 to i32 (%class.Base*)***, !dbg !83
  %10 = bitcast i8* %4 to %class.Base*, !dbg !83
  %11 = bitcast i8* %4 to i32 (%class.Base*)***, !dbg !83
  br label %.preheader

.preheader:                                       ; preds = %30, %0
  %i.06 = phi i32 [ 0, %0 ], [ %31, %30 ]
  %sum.05 = phi i32 [ 0, %0 ], [ %28, %30 ]
  br label %12

; <label>:12                                      ; preds = %12, %.preheader
  %j.03 = phi i32 [ 0, %.preheader ], [ %29, %12 ]
  %sum.12 = phi i32 [ %sum.05, %.preheader ], [ %28, %12 ]
  %13 = load i8 (%class.Base*)*** %7, align 8, !dbg !80
  %14 = load i8 (%class.Base*)** %13, align 8, !dbg !80
  %15 = tail call signext i8 %14(%class.Base* %2), !dbg !80, !virtual-call !84
  %16 = load i8 (%class.Child*)*** %8, align 8, !dbg !82
  %17 = load i8 (%class.Child*)** %16, align 8, !dbg !82
  %18 = tail call signext i8 %17(%class.Child* %5), !dbg !82, !virtual-call !85
  %19 = load i32 (%class.Base*)*** %9, align 8, !dbg !83
  %20 = getelementptr inbounds i32 (%class.Base*)** %19, i64 1, !dbg !83
  %21 = load i32 (%class.Base*)** %20, align 8, !dbg !83
  %22 = tail call i32 %21(%class.Base* %2), !dbg !83, !virtual-call !86
  %23 = load i32 (%class.Base*)*** %11, align 8, !dbg !83
  %24 = getelementptr inbounds i32 (%class.Base*)** %23, i64 1, !dbg !83
  %25 = load i32 (%class.Base*)** %24, align 8, !dbg !83
  %26 = tail call i32 %25(%class.Base* %10), !dbg !83, !virtual-call !86
  %27 = add i32 %22, %sum.12, !dbg !83
  %28 = add i32 %27, %26, !dbg !83
  %29 = add i32 %j.03, 1, !dbg !87
  %exitcond = icmp eq i32 %29, 1000
  br i1 %exitcond, label %30, label %12, !dbg !88

; <label>:30                                      ; preds = %12
  %31 = add i32 %i.06, 1, !dbg !89
  %exitcond8 = icmp eq i32 %31, 1000000
  br i1 %exitcond8, label %32, label %.preheader, !dbg !79

; <label>:32                                      ; preds = %30
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !53), !dbg !80
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !53), !dbg !82
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !54), !dbg !83
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !58), !dbg !87
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !55), !dbg !89
  %33 = icmp eq i8* %1, null, !dbg !90
  br i1 %33, label %35, label %34, !dbg !90

; <label>:34                                      ; preds = %32
  tail call void @_ZdlPv(i8* %1) nounwind, !dbg !90
  br label %35, !dbg !90

; <label>:35                                      ; preds = %34, %32
  %36 = icmp eq i8* %4, null, !dbg !91
  br i1 %36, label %38, label %37, !dbg !91

; <label>:37                                      ; preds = %35
  tail call void @_ZdlPv(i8* %4) nounwind, !dbg !91
  br label %38, !dbg !91

; <label>:38                                      ; preds = %37, %35
  ret i32 %28, !dbg !92
}

declare noalias i8* @_Znwm(i64)

define linkonce_odr signext i8 @_ZN4Base4nameEv(%class.Base* nocapture %this) nounwind readnone align 2 {
  tail call void @llvm.dbg.value(metadata !{%class.Base* %this}, i64 0, metadata !63), !dbg !93
  ret i8 48, !dbg !94
}

define linkonce_odr signext i8 @_ZN5Child4nameEv(%class.Child* nocapture %this) nounwind readnone align 2 {
  tail call void @llvm.dbg.value(metadata !{%class.Child* %this}, i64 0, metadata !62), !dbg !96
  ret i8 49, !dbg !97
}

define linkonce_odr i32 @_ZN4Base8nameHashEv(%class.Base* %this) align 2 {
  tail call void @llvm.dbg.value(metadata !{%class.Base* %this}, i64 0, metadata !61), !dbg !99
  %1 = bitcast %class.Base* %this to i8 (%class.Base*)***, !dbg !100
  %2 = load i8 (%class.Base*)*** %1, align 8, !dbg !100
  %3 = load i8 (%class.Base*)** %2, align 8, !dbg !100
  %4 = tail call signext i8 %3(%class.Base* %this), !dbg !100, !virtual-call !102
  %5 = sext i8 %4 to i32, !dbg !100
  ret i32 %5, !dbg !100
}

declare void @_ZdlPv(i8*) nounwind

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !6, !12, !16, !23, !27, !33, !34, !37, !38, !41, !42, !43}
!llvm.dbg.lv.main = !{!44, !45, !48, !51, !53, !54, !55, !58}
!llvm.dbg.lv._ZN4Base8nameHashEv = !{!61}
!llvm.dbg.lv._ZN5Child4nameEv = !{!62}
!llvm.dbg.lv._ZN4Base4nameEv = !{!63}
!llvm.dbg.lv._ZN5ChildC1Ev = !{!64}
!llvm.dbg.lv._ZN5ChildC2Ev = !{!65}
!llvm.dbg.lv._ZN4BaseC2Ev = !{!66}
!llvm.dbg.lv._ZN4BaseC1Ev = !{!67}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"", metadata !1, i32 21, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"declared.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 4, metadata !"declared.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !"clang version 2.9 (tags/RELEASE_29/final)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !4, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !2, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"name", metadata !"name", metadata !"_ZN4Base4nameEv", metadata !1, i32 11, metadata !20, i1 false, i1 false, i32 1, i32 0, metadata !7, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589826, metadata !2, metadata !"Base", metadata !1, i32 9, i64 64, i64 64, i32 0, i32 0, null, metadata !8, i32 0, metadata !7, metadata !19} ; [ DW_TAG_class_type ]
!8 = metadata !{metadata !9, metadata !6, metadata !12, metadata !16}
!9 = metadata !{i32 589837, metadata !1, metadata !"_vptr$Base", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ]
!10 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 589839, metadata !2, metadata !"__vtbl_ptr_type", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589870, i32 0, metadata !7, metadata !"nameHash", metadata !"nameHash", metadata !"_ZN4Base8nameHashEv", metadata !1, i32 12, metadata !13, i1 false, i1 false, i32 1, i32 1, metadata !7, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!13 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !14, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!14 = metadata !{metadata !5, metadata !15}
!15 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !7} ; [ DW_TAG_pointer_type ]
!16 = metadata !{i32 589870, i32 0, metadata !7, metadata !"Base", metadata !"Base", metadata !"", metadata !1, i32 9, metadata !17, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{null, metadata !15}
!19 = metadata !{i32 0}
!20 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !21, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!21 = metadata !{metadata !22, metadata !15}
!22 = metadata !{i32 589860, metadata !2, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!23 = metadata !{i32 589870, i32 0, metadata !24, metadata !"name", metadata !"name", metadata !"_ZN5Child4nameEv", metadata !1, i32 17, metadata !31, i1 false, i1 false, i32 1, i32 0, metadata !24, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!24 = metadata !{i32 589826, metadata !2, metadata !"Child", metadata !1, i32 15, i64 64, i64 64, i32 0, i32 0, null, metadata !25, i32 0, metadata !7, metadata !19} ; [ DW_TAG_class_type ]
!25 = metadata !{metadata !26, metadata !23, metadata !27}
!26 = metadata !{i32 589852, metadata !24, null, metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !7} ; [ DW_TAG_inheritance ]
!27 = metadata !{i32 589870, i32 0, metadata !24, metadata !"Child", metadata !"Child", metadata !"", metadata !1, i32 15, metadata !28, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!28 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !29, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!29 = metadata !{null, metadata !30}
!30 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !24} ; [ DW_TAG_pointer_type ]
!31 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !32, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!32 = metadata !{metadata !22, metadata !30}
!33 = metadata !{i32 589870, i32 0, metadata !1, metadata !"nameHash", metadata !"nameHash", metadata !"_ZN4Base8nameHashEv", metadata !1, i32 12, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (%class.Base*)* @_ZN4Base8nameHashEv} ; [ DW_TAG_subprogram ]
!34 = metadata !{i32 589870, i32 0, metadata !1, metadata !"name", metadata !"name", metadata !"_ZN5Child4nameEv", metadata !1, i32 17, metadata !35, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i8 (%class.Child*)* @_ZN5Child4nameEv} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !36, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!36 = metadata !{metadata !22}
!37 = metadata !{i32 589870, i32 0, metadata !1, metadata !"name", metadata !"name", metadata !"_ZN4Base4nameEv", metadata !1, i32 11, metadata !35, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i8 (%class.Base*)* @_ZN4Base4nameEv} ; [ DW_TAG_subprogram ]
!38 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Child", metadata !"Child", metadata !"_ZN5ChildC1Ev", metadata !1, i32 15, metadata !39, i1 false, i1 true, i32 0, i32 0, i32 0, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!39 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !40, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!40 = metadata !{null}
!41 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Child", metadata !"Child", metadata !"_ZN5ChildC2Ev", metadata !1, i32 15, metadata !39, i1 false, i1 true, i32 0, i32 0, i32 0, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!42 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Base", metadata !"Base", metadata !"_ZN4BaseC2Ev", metadata !1, i32 9, metadata !39, i1 false, i1 true, i32 0, i32 0, i32 0, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!43 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Base", metadata !"Base", metadata !"_ZN4BaseC1Ev", metadata !1, i32 9, metadata !39, i1 false, i1 true, i32 0, i32 0, i32 0, i32 320, i1 true, null} ; [ DW_TAG_subprogram ]
!44 = metadata !{i32 590081, metadata !0, metadata !"argc", metadata !1, i32 16777237, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!45 = metadata !{i32 590081, metadata !0, metadata !"args", metadata !1, i32 33554453, metadata !46, i32 0} ; [ DW_TAG_arg_variable ]
!46 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !47} ; [ DW_TAG_pointer_type ]
!47 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ]
!48 = metadata !{i32 590080, metadata !49, metadata !"basePtr", metadata !1, i32 22, metadata !50, i32 0} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 589835, metadata !0, i32 21, i32 33, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!50 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!51 = metadata !{i32 590080, metadata !49, metadata !"childPtr", metadata !1, i32 23, metadata !52, i32 0} ; [ DW_TAG_auto_variable ]
!52 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ]
!53 = metadata !{i32 590080, metadata !49, metadata !"n", metadata !1, i32 24, metadata !22, i32 0} ; [ DW_TAG_auto_variable ]
!54 = metadata !{i32 590080, metadata !49, metadata !"sum", metadata !1, i32 25, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 590080, metadata !56, metadata !"i", metadata !1, i32 26, metadata !57, i32 0} ; [ DW_TAG_auto_variable ]
!56 = metadata !{i32 589835, metadata !49, i32 26, i32 2, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!57 = metadata !{i32 589860, metadata !2, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!58 = metadata !{i32 590080, metadata !59, metadata !"j", metadata !1, i32 27, metadata !57, i32 0} ; [ DW_TAG_auto_variable ]
!59 = metadata !{i32 589835, metadata !60, i32 27, i32 3, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!60 = metadata !{i32 589835, metadata !56, i32 26, i32 41, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!61 = metadata !{i32 590081, metadata !33, metadata !"this", metadata !1, i32 16777228, metadata !50, i32 64} ; [ DW_TAG_arg_variable ]
!62 = metadata !{i32 590081, metadata !34, metadata !"this", metadata !1, i32 16777233, metadata !52, i32 64} ; [ DW_TAG_arg_variable ]
!63 = metadata !{i32 590081, metadata !37, metadata !"this", metadata !1, i32 16777227, metadata !50, i32 64} ; [ DW_TAG_arg_variable ]
!64 = metadata !{i32 590081, metadata !38, metadata !"this", metadata !1, i32 16777231, metadata !52, i32 64} ; [ DW_TAG_arg_variable ]
!65 = metadata !{i32 590081, metadata !41, metadata !"this", metadata !1, i32 16777231, metadata !52, i32 64} ; [ DW_TAG_arg_variable ]
!66 = metadata !{i32 590081, metadata !42, metadata !"this", metadata !1, i32 16777225, metadata !50, i32 64} ; [ DW_TAG_arg_variable ]
!67 = metadata !{i32 590081, metadata !43, metadata !"this", metadata !1, i32 16777225, metadata !50, i32 64} ; [ DW_TAG_arg_variable ]
!68 = metadata !{i32 21, i32 14, metadata !0, null}
!69 = metadata !{i32 21, i32 27, metadata !0, null}
!70 = metadata !{i32 22, i32 28, metadata !49, null}
!71 = metadata !{i32 9, i32 7, metadata !43, metadata !70}
!72 = metadata !{i32 9, i32 7, metadata !42, metadata !71}
!73 = metadata !{i32 23, i32 31, metadata !49, null}
!74 = metadata !{i32 15, i32 7, metadata !38, metadata !73}
!75 = metadata !{i32 15, i32 7, metadata !41, metadata !74}
!76 = metadata !{i8 0}                            
!77 = metadata !{i32 24, i32 15, metadata !49, null}
!78 = metadata !{i32 25, i32 13, metadata !49, null}
!79 = metadata !{i32 26, i32 2, metadata !49, null}
!80 = metadata !{i32 28, i32 4, metadata !81, null}
!81 = metadata !{i32 589835, metadata !59, i32 27, i32 39, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!82 = metadata !{i32 29, i32 4, metadata !81, null}
!83 = metadata !{i32 30, i32 4, metadata !81, null}
!84 = metadata !{metadata !"_ZN4Base4nameEv", i1 false}
!85 = metadata !{metadata !"_ZN5Child4nameEv", i1 false}
!86 = metadata !{metadata !"_ZN4Base8nameHashEv", i1 false}
!87 = metadata !{i32 27, i32 34, metadata !59, null}
!88 = metadata !{i32 27, i32 3, metadata !60, null}
!89 = metadata !{i32 26, i32 36, metadata !56, null}
!90 = metadata !{i32 33, i32 2, metadata !49, null}
!91 = metadata !{i32 34, i32 2, metadata !49, null}
!92 = metadata !{i32 35, i32 2, metadata !49, null}
!93 = metadata !{i32 11, i32 15, metadata !37, null}
!94 = metadata !{i32 11, i32 27, metadata !95, null}
!95 = metadata !{i32 589835, metadata !37, i32 11, i32 26, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!96 = metadata !{i32 17, i32 15, metadata !34, null}
!97 = metadata !{i32 17, i32 27, metadata !98, null}
!98 = metadata !{i32 589835, metadata !34, i32 17, i32 26, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!99 = metadata !{i32 12, i32 14, metadata !33, null}
!100 = metadata !{i32 12, i32 30, metadata !101, null}
!101 = metadata !{i32 589835, metadata !33, i32 12, i32 29, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!102 = metadata !{metadata !"_ZN4Base4nameEv", i1 true}
