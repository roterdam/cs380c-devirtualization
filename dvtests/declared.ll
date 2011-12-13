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

define i32 @main(i32 %argc, i8** %args) {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %basePtr = alloca %class.Base*, align 8
  %childPtr = alloca %class.Child*, align 8
  %n = alloca i8, align 1
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !44), !dbg !45
  store i8** %args, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !46), !dbg !49
  call void @llvm.dbg.declare(metadata !{%class.Base** %basePtr}, metadata !50), !dbg !53
  %4 = call noalias i8* @_Znwm(i64 8), !dbg !54
  %5 = bitcast i8* %4 to %class.Base*, !dbg !54
  %6 = bitcast %class.Base* %5 to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 8, i32 8, i1 false), !dbg !54
  call void @_ZN4BaseC1Ev(%class.Base* %5) nounwind, !dbg !54
  store %class.Base* %5, %class.Base** %basePtr, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata !{%class.Child** %childPtr}, metadata !55), !dbg !57
  %7 = call noalias i8* @_Znwm(i64 8), !dbg !58
  %8 = bitcast i8* %7 to %class.Child*, !dbg !58
  %9 = bitcast %class.Child* %8 to i8*, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 8, i32 8, i1 false), !dbg !58
  call void @_ZN5ChildC1Ev(%class.Child* %8) nounwind, !dbg !58
  store %class.Child* %8, %class.Child** %childPtr, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata !{i8* %n}, metadata !59), !dbg !60
  store i8 0, i8* %n, align 1, !dbg !61
  call void @llvm.dbg.declare(metadata !{i32* %sum}, metadata !62), !dbg !63
  store i32 0, i32* %sum, align 4, !dbg !64
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !65), !dbg !68
  store i32 0, i32* %i, align 4, !dbg !69
  br label %10, !dbg !69

; <label>:10                                      ; preds = %60, %0
  %11 = load i32* %i, align 4, !dbg !69
  %12 = icmp ult i32 %11, 1000000, !dbg !69
  br i1 %12, label %13, label %63, !dbg !69

; <label>:13                                      ; preds = %10
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !70), !dbg !73
  store i32 0, i32* %j, align 4, !dbg !74
  br label %14, !dbg !74

; <label>:14                                      ; preds = %56, %13
  %15 = load i32* %j, align 4, !dbg !74
  %16 = icmp ult i32 %15, 1000, !dbg !74
  br i1 %16, label %17, label %59, !dbg !74

; <label>:17                                      ; preds = %14
  %18 = load %class.Base** %basePtr, align 8, !dbg !75
  %19 = bitcast %class.Base* %18 to i8 (%class.Base*)***, !dbg !75
  %20 = load i8 (%class.Base*)*** %19, !dbg !75
  %21 = getelementptr inbounds i8 (%class.Base*)** %20, i64 0, !dbg !75
  %22 = load i8 (%class.Base*)** %21, !dbg !75
  %23 = call signext i8 %22(%class.Base* %18), !dbg !75, !virtual-call !77
  %24 = sext i8 %23 to i32, !dbg !75
  %25 = load i8* %n, align 1, !dbg !75
  %26 = sext i8 %25 to i32, !dbg !75
  %27 = or i32 %26, %24, !dbg !75
  %28 = trunc i32 %27 to i8, !dbg !75
  store i8 %28, i8* %n, align 1, !dbg !75
  %29 = load %class.Child** %childPtr, align 8, !dbg !78
  %30 = bitcast %class.Child* %29 to i8 (%class.Child*)***, !dbg !78
  %31 = load i8 (%class.Child*)*** %30, !dbg !78
  %32 = getelementptr inbounds i8 (%class.Child*)** %31, i64 0, !dbg !78
  %33 = load i8 (%class.Child*)** %32, !dbg !78
  %34 = call signext i8 %33(%class.Child* %29), !dbg !78, !virtual-call !79
  %35 = sext i8 %34 to i32, !dbg !78
  %36 = load i8* %n, align 1, !dbg !78
  %37 = sext i8 %36 to i32, !dbg !78
  %38 = or i32 %37, %35, !dbg !78
  %39 = trunc i32 %38 to i8, !dbg !78
  store i8 %39, i8* %n, align 1, !dbg !78
  %40 = load %class.Base** %basePtr, align 8, !dbg !80
  %41 = bitcast %class.Base* %40 to i32 (%class.Base*)***, !dbg !80
  %42 = load i32 (%class.Base*)*** %41, !dbg !80
  %43 = getelementptr inbounds i32 (%class.Base*)** %42, i64 1, !dbg !80
  %44 = load i32 (%class.Base*)** %43, !dbg !80
  %45 = call i32 %44(%class.Base* %40), !dbg !80, !virtual-call !81
  %46 = load %class.Child** %childPtr, align 8, !dbg !80
  %47 = bitcast %class.Child* %46 to %class.Base*, !dbg !80
  %48 = bitcast %class.Base* %47 to i32 (%class.Base*)***, !dbg !80
  %49 = load i32 (%class.Base*)*** %48, !dbg !80
  %50 = getelementptr inbounds i32 (%class.Base*)** %49, i64 1, !dbg !80
  %51 = load i32 (%class.Base*)** %50, !dbg !80
  %52 = call i32 %51(%class.Base* %47), !dbg !80, !virtual-call !81
  %53 = add nsw i32 %45, %52, !dbg !80
  %54 = load i32* %sum, align 4, !dbg !80
  %55 = add nsw i32 %54, %53, !dbg !80
  store i32 %55, i32* %sum, align 4, !dbg !80
  br label %56, !dbg !82

; <label>:56                                      ; preds = %17
  %57 = load i32* %j, align 4, !dbg !83
  %58 = add i32 %57, 1, !dbg !83
  store i32 %58, i32* %j, align 4, !dbg !83
  br label %14, !dbg !83

; <label>:59                                      ; preds = %14
  br label %60, !dbg !84

; <label>:60                                      ; preds = %59
  %61 = load i32* %i, align 4, !dbg !85
  %62 = add i32 %61, 1, !dbg !85
  store i32 %62, i32* %i, align 4, !dbg !85
  br label %10, !dbg !85

; <label>:63                                      ; preds = %10
  %64 = load %class.Base** %basePtr, align 8, !dbg !86
  %65 = icmp eq %class.Base* %64, null, !dbg !86
  br i1 %65, label %68, label %66, !dbg !86

; <label>:66                                      ; preds = %63
  %67 = bitcast %class.Base* %64 to i8*, !dbg !86
  call void @_ZdlPv(i8* %67) nounwind, !dbg !86
  br label %68, !dbg !86

; <label>:68                                      ; preds = %66, %63
  %69 = load %class.Child** %childPtr, align 8, !dbg !87
  %70 = icmp eq %class.Child* %69, null, !dbg !87
  br i1 %70, label %73, label %71, !dbg !87

; <label>:71                                      ; preds = %68
  %72 = bitcast %class.Child* %69 to i8*, !dbg !87
  call void @_ZdlPv(i8* %72) nounwind, !dbg !87
  br label %73, !dbg !87

; <label>:73                                      ; preds = %71, %68
  %74 = load i32* %sum, align 4, !dbg !88
  ret i32 %74, !dbg !88
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare noalias i8* @_Znwm(i64)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define linkonce_odr void @_ZN4BaseC1Ev(%class.Base* %this) unnamed_addr nounwind inlinehint align 2 {
  %1 = alloca %class.Base*, align 8
  store %class.Base* %this, %class.Base** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.Base** %1}, metadata !89), !dbg !90
  %2 = load %class.Base** %1
  call void @_ZN4BaseC2Ev(%class.Base* %2) nounwind, !dbg !90
  ret void, !dbg !90
}

define linkonce_odr void @_ZN5ChildC1Ev(%class.Child* %this) unnamed_addr nounwind inlinehint align 2 {
  %1 = alloca %class.Child*, align 8
  store %class.Child* %this, %class.Child** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.Child** %1}, metadata !91), !dbg !92
  %2 = load %class.Child** %1
  call void @_ZN5ChildC2Ev(%class.Child* %2) nounwind, !dbg !92
  ret void, !dbg !92
}

define linkonce_odr signext i8 @_ZN4Base4nameEv(%class.Base* %this) nounwind align 2 {
  %1 = alloca %class.Base*, align 8
  store %class.Base* %this, %class.Base** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.Base** %1}, metadata !93), !dbg !94
  %2 = load %class.Base** %1
  ret i8 48, !dbg !95
}

define linkonce_odr signext i8 @_ZN5Child4nameEv(%class.Child* %this) nounwind align 2 {
  %1 = alloca %class.Child*, align 8
  store %class.Child* %this, %class.Child** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.Child** %1}, metadata !97), !dbg !98
  %2 = load %class.Child** %1
  ret i8 49, !dbg !99
}

define linkonce_odr i32 @_ZN4Base8nameHashEv(%class.Base* %this) align 2 {
  %1 = alloca %class.Base*, align 8
  store %class.Base* %this, %class.Base** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.Base** %1}, metadata !101), !dbg !102
  %2 = load %class.Base** %1
  %3 = bitcast %class.Base* %2 to i8 (%class.Base*)***, !dbg !103
  %4 = load i8 (%class.Base*)*** %3, !dbg !103
  %5 = getelementptr inbounds i8 (%class.Base*)** %4, i64 0, !dbg !103
  %6 = load i8 (%class.Base*)** %5, !dbg !103
  %7 = call signext i8 %6(%class.Base* %2), !dbg !103, !virtual-call !105
  %8 = sext i8 %7 to i32, !dbg !103
  ret i32 %8, !dbg !103
}

declare void @_ZdlPv(i8*) nounwind

define linkonce_odr void @_ZN5ChildC2Ev(%class.Child* %this) unnamed_addr nounwind inlinehint align 2 {
  %1 = alloca %class.Child*, align 8
  store %class.Child* %this, %class.Child** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.Child** %1}, metadata !106), !dbg !107
  %2 = load %class.Child** %1
  %3 = bitcast %class.Child* %2 to %class.Base*
  call void @_ZN4BaseC2Ev(%class.Base* %3) nounwind
  %4 = bitcast %class.Child* %2 to i8***
  store i8** getelementptr inbounds ([4 x i8*]* @_ZTV5Child, i64 0, i64 2), i8*** %4
  ret void, !dbg !108
}

define linkonce_odr void @_ZN4BaseC2Ev(%class.Base* %this) unnamed_addr nounwind inlinehint align 2 {
  %1 = alloca %class.Base*, align 8
  store %class.Base* %this, %class.Base** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.Base** %1}, metadata !110), !dbg !111
  %2 = load %class.Base** %1
  %3 = bitcast %class.Base* %2 to i8***
  store i8** getelementptr inbounds ([4 x i8*]* @_ZTV4Base, i64 0, i64 2), i8*** %3
  ret void, !dbg !112
}

!llvm.dbg.sp = !{!0, !6, !12, !16, !23, !27, !33, !34, !37, !38, !41, !42, !43}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"", metadata !1, i32 21, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"declared.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 4, metadata !"declared.cpp", metadata !"/home/vitor/llvm/dvtests", metadata !"clang version 2.9 (tags/RELEASE_29/final)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !4, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !2, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"name", metadata !"name", metadata !"_ZN4Base4nameEv", metadata !1, i32 11, metadata !20, i1 false, i1 false, i32 1, i32 0, metadata !7, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589826, metadata !2, metadata !"Base", metadata !1, i32 9, i64 64, i64 64, i32 0, i32 0, null, metadata !8, i32 0, metadata !7, metadata !19} ; [ DW_TAG_class_type ]
!8 = metadata !{metadata !9, metadata !6, metadata !12, metadata !16}
!9 = metadata !{i32 589837, metadata !1, metadata !"_vptr$Base", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ]
!10 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 589839, metadata !2, metadata !"__vtbl_ptr_type", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589870, i32 0, metadata !7, metadata !"nameHash", metadata !"nameHash", metadata !"_ZN4Base8nameHashEv", metadata !1, i32 12, metadata !13, i1 false, i1 false, i32 1, i32 1, metadata !7, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!13 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !14, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!14 = metadata !{metadata !5, metadata !15}
!15 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !7} ; [ DW_TAG_pointer_type ]
!16 = metadata !{i32 589870, i32 0, metadata !7, metadata !"Base", metadata !"Base", metadata !"", metadata !1, i32 9, metadata !17, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{null, metadata !15}
!19 = metadata !{i32 0}
!20 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !21, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!21 = metadata !{metadata !22, metadata !15}
!22 = metadata !{i32 589860, metadata !2, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!23 = metadata !{i32 589870, i32 0, metadata !24, metadata !"name", metadata !"name", metadata !"_ZN5Child4nameEv", metadata !1, i32 17, metadata !31, i1 false, i1 false, i32 1, i32 0, metadata !24, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!24 = metadata !{i32 589826, metadata !2, metadata !"Child", metadata !1, i32 15, i64 64, i64 64, i32 0, i32 0, null, metadata !25, i32 0, metadata !7, metadata !19} ; [ DW_TAG_class_type ]
!25 = metadata !{metadata !26, metadata !23, metadata !27}
!26 = metadata !{i32 589852, metadata !24, null, metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !7} ; [ DW_TAG_inheritance ]
!27 = metadata !{i32 589870, i32 0, metadata !24, metadata !"Child", metadata !"Child", metadata !"", metadata !1, i32 15, metadata !28, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!28 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !29, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!29 = metadata !{null, metadata !30}
!30 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !24} ; [ DW_TAG_pointer_type ]
!31 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !32, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!32 = metadata !{metadata !22, metadata !30}
!33 = metadata !{i32 589870, i32 0, metadata !1, metadata !"nameHash", metadata !"nameHash", metadata !"_ZN4Base8nameHashEv", metadata !1, i32 12, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%class.Base*)* @_ZN4Base8nameHashEv} ; [ DW_TAG_subprogram ]
!34 = metadata !{i32 589870, i32 0, metadata !1, metadata !"name", metadata !"name", metadata !"_ZN5Child4nameEv", metadata !1, i32 17, metadata !35, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i8 (%class.Child*)* @_ZN5Child4nameEv} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !36, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!36 = metadata !{metadata !22}
!37 = metadata !{i32 589870, i32 0, metadata !1, metadata !"name", metadata !"name", metadata !"_ZN4Base4nameEv", metadata !1, i32 11, metadata !35, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i8 (%class.Base*)* @_ZN4Base4nameEv} ; [ DW_TAG_subprogram ]
!38 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Child", metadata !"Child", metadata !"_ZN5ChildC1Ev", metadata !1, i32 15, metadata !39, i1 false, i1 true, i32 0, i32 0, i32 0, i32 320, i1 false, void (%class.Child*)* @_ZN5ChildC1Ev} ; [ DW_TAG_subprogram ]
!39 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !40, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!40 = metadata !{null}
!41 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Child", metadata !"Child", metadata !"_ZN5ChildC2Ev", metadata !1, i32 15, metadata !39, i1 false, i1 true, i32 0, i32 0, i32 0, i32 320, i1 false, void (%class.Child*)* @_ZN5ChildC2Ev} ; [ DW_TAG_subprogram ]
!42 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Base", metadata !"Base", metadata !"_ZN4BaseC2Ev", metadata !1, i32 9, metadata !39, i1 false, i1 true, i32 0, i32 0, i32 0, i32 320, i1 false, void (%class.Base*)* @_ZN4BaseC2Ev} ; [ DW_TAG_subprogram ]
!43 = metadata !{i32 589870, i32 0, metadata !1, metadata !"Base", metadata !"Base", metadata !"_ZN4BaseC1Ev", metadata !1, i32 9, metadata !39, i1 false, i1 true, i32 0, i32 0, i32 0, i32 320, i1 false, void (%class.Base*)* @_ZN4BaseC1Ev} ; [ DW_TAG_subprogram ]
!44 = metadata !{i32 590081, metadata !0, metadata !"argc", metadata !1, i32 16777237, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!45 = metadata !{i32 21, i32 14, metadata !0, null}
!46 = metadata !{i32 590081, metadata !0, metadata !"args", metadata !1, i32 33554453, metadata !47, i32 0} ; [ DW_TAG_arg_variable ]
!47 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !48} ; [ DW_TAG_pointer_type ]
!48 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ]
!49 = metadata !{i32 21, i32 27, metadata !0, null}
!50 = metadata !{i32 590080, metadata !51, metadata !"basePtr", metadata !1, i32 22, metadata !52, i32 0} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 589835, metadata !0, i32 21, i32 33, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!52 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!53 = metadata !{i32 22, i32 8, metadata !51, null}
!54 = metadata !{i32 22, i32 28, metadata !51, null}
!55 = metadata !{i32 590080, metadata !51, metadata !"childPtr", metadata !1, i32 23, metadata !56, i32 0} ; [ DW_TAG_auto_variable ]
!56 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ]
!57 = metadata !{i32 23, i32 9, metadata !51, null}
!58 = metadata !{i32 23, i32 31, metadata !51, null}
!59 = metadata !{i32 590080, metadata !51, metadata !"n", metadata !1, i32 24, metadata !22, i32 0} ; [ DW_TAG_auto_variable ]
!60 = metadata !{i32 24, i32 7, metadata !51, null}
!61 = metadata !{i32 24, i32 15, metadata !51, null}
!62 = metadata !{i32 590080, metadata !51, metadata !"sum", metadata !1, i32 25, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!63 = metadata !{i32 25, i32 6, metadata !51, null}
!64 = metadata !{i32 25, i32 13, metadata !51, null}
!65 = metadata !{i32 590080, metadata !66, metadata !"i", metadata !1, i32 26, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 589835, metadata !51, i32 26, i32 2, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!67 = metadata !{i32 589860, metadata !2, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!68 = metadata !{i32 26, i32 16, metadata !66, null}
!69 = metadata !{i32 26, i32 2, metadata !51, null}
!70 = metadata !{i32 590080, metadata !71, metadata !"j", metadata !1, i32 27, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!71 = metadata !{i32 589835, metadata !72, i32 27, i32 3, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!72 = metadata !{i32 589835, metadata !66, i32 26, i32 41, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 27, i32 17, metadata !71, null}
!74 = metadata !{i32 27, i32 3, metadata !72, null}
!75 = metadata !{i32 28, i32 4, metadata !76, null}
!76 = metadata !{i32 589835, metadata !71, i32 27, i32 39, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!77 = metadata !{metadata !"_ZN4Base4nameEv", i1 false}
!78 = metadata !{i32 29, i32 4, metadata !76, null}
!79 = metadata !{metadata !"_ZN5Child4nameEv", i1 false}
!80 = metadata !{i32 30, i32 4, metadata !76, null}
!81 = metadata !{metadata !"_ZN4Base8nameHashEv", i1 false}
!82 = metadata !{i32 31, i32 3, metadata !76, null}
!83 = metadata !{i32 27, i32 34, metadata !71, null}
!84 = metadata !{i32 32, i32 2, metadata !72, null}
!85 = metadata !{i32 26, i32 36, metadata !66, null}
!86 = metadata !{i32 33, i32 2, metadata !51, null}
!87 = metadata !{i32 34, i32 2, metadata !51, null}
!88 = metadata !{i32 35, i32 2, metadata !51, null}
!89 = metadata !{i32 590081, metadata !43, metadata !"this", metadata !1, i32 16777225, metadata !52, i32 64} ; [ DW_TAG_arg_variable ]
!90 = metadata !{i32 9, i32 7, metadata !43, null}
!91 = metadata !{i32 590081, metadata !38, metadata !"this", metadata !1, i32 16777231, metadata !56, i32 64} ; [ DW_TAG_arg_variable ]
!92 = metadata !{i32 15, i32 7, metadata !38, null}
!93 = metadata !{i32 590081, metadata !37, metadata !"this", metadata !1, i32 16777227, metadata !52, i32 64} ; [ DW_TAG_arg_variable ]
!94 = metadata !{i32 11, i32 15, metadata !37, null}
!95 = metadata !{i32 11, i32 27, metadata !96, null}
!96 = metadata !{i32 589835, metadata !37, i32 11, i32 26, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!97 = metadata !{i32 590081, metadata !34, metadata !"this", metadata !1, i32 16777233, metadata !56, i32 64} ; [ DW_TAG_arg_variable ]
!98 = metadata !{i32 17, i32 15, metadata !34, null}
!99 = metadata !{i32 17, i32 27, metadata !100, null}
!100 = metadata !{i32 589835, metadata !34, i32 17, i32 26, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!101 = metadata !{i32 590081, metadata !33, metadata !"this", metadata !1, i32 16777228, metadata !52, i32 64} ; [ DW_TAG_arg_variable ]
!102 = metadata !{i32 12, i32 14, metadata !33, null}
!103 = metadata !{i32 12, i32 30, metadata !104, null}
!104 = metadata !{i32 589835, metadata !33, i32 12, i32 29, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!105 = metadata !{metadata !"_ZN4Base4nameEv", i1 true}
!106 = metadata !{i32 590081, metadata !41, metadata !"this", metadata !1, i32 16777231, metadata !56, i32 64} ; [ DW_TAG_arg_variable ]
!107 = metadata !{i32 15, i32 7, metadata !41, null}
!108 = metadata !{i32 15, i32 7, metadata !109, null}
!109 = metadata !{i32 589835, metadata !41, i32 15, i32 7, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!110 = metadata !{i32 590081, metadata !42, metadata !"this", metadata !1, i32 16777225, metadata !52, i32 64} ; [ DW_TAG_arg_variable ]
!111 = metadata !{i32 9, i32 7, metadata !42, null}
!112 = metadata !{i32 9, i32 7, metadata !113, null}
!113 = metadata !{i32 589835, metadata !42, i32 9, i32 7, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
