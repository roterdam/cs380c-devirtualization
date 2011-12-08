; ModuleID = 'Test.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8*, i8* }
%1 = type { i8*, i8*, i8* }
%class.A = type { i32 (...)**, i32 }
%class.B = type { [12 x i8], [4 x i8] }
%class.Z = type { i32 (...)** }

@_ZTV1B = linkonce_odr unnamed_addr constant [3 x i8*] [i8* null, i8* bitcast (%1* @_ZTI1B to i8*), i8* bitcast (i8 (%class.B*)* @_ZN1B3fooEv to i8*)]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS1B = linkonce_odr constant [3 x i8] c"1B\00"
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTS1A = linkonce_odr constant [3 x i8] c"1A\00"
@_ZTI1A = linkonce_odr unnamed_addr constant %0 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8]* @_ZTS1A, i32 0, i32 0) }
@_ZTI1B = linkonce_odr unnamed_addr constant %1 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8]* @_ZTS1B, i32 0, i32 0), i8* bitcast (%0* @_ZTI1A to i8*) }
@_ZTV1A = linkonce_odr unnamed_addr constant [3 x i8*] [i8* null, i8* bitcast (%0* @_ZTI1A to i8*), i8* bitcast (i8 (%class.A*)* @_ZN1A3fooEv to i8*)]

define i32 @main() nounwind {
  %1 = alloca i32, align 4
  %a = alloca %class.A*, align 8
  %b = alloca %class.B*, align 8
  %x = alloca %class.A*, align 8
  %z = alloca %class.Z*, align 8
  %reg = alloca i8, align 1
  %virt = alloca i8, align 1
  %forced = alloca i8, align 1
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{%class.A** %a}, metadata !55), !dbg !58
  %2 = call noalias i8* @_Znwm(i64 16), !dbg !59
  %3 = bitcast i8* %2 to %class.A*, !dbg !59
  call void @_ZN1AC1Ei(%class.A* %3, i32 1), !dbg !59
  store %class.A* %3, %class.A** %a, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata !{%class.B** %b}, metadata !60), !dbg !62
  %4 = call noalias i8* @_Znwm(i64 16), !dbg !63
  %5 = bitcast i8* %4 to %class.B*, !dbg !63
  call void @_ZN1BC1Ei(%class.B* %5, i32 2), !dbg !63
  store %class.B* %5, %class.B** %b, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata !{%class.A** %x}, metadata !64), !dbg !65
  %6 = load %class.B** %b, align 8, !dbg !66
  %7 = bitcast %class.B* %6 to %class.A*, !dbg !66
  store %class.A* %7, %class.A** %x, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata !{%class.Z** %z}, metadata !67), !dbg !69
  %8 = load %class.A** %a, align 8, !dbg !70
  call void @_ZN1A7nonvirtEv(%class.A* %8), !dbg !70
  %9 = load %class.A** %x, align 8, !dbg !71
  call void @_ZN1A7nonvirtEv(%class.A* %9), !dbg !71
  %10 = load %class.B** %b, align 8, !dbg !72
  %11 = bitcast %class.B* %10 to %class.A*, !dbg !72
  call void @_ZN1A7nonvirtEv(%class.A* %11), !dbg !72
  call void @llvm.dbg.declare(metadata !{i8* %reg}, metadata !73), !dbg !74
  %12 = load %class.B** %b, align 8, !dbg !75
  %13 = bitcast %class.B* %12 to i8 (%class.B*)***, !dbg !75
  %14 = load i8 (%class.B*)*** %13, !dbg !75
  %15 = getelementptr inbounds i8 (%class.B*)** %14, i64 0, !dbg !75
  %16 = load i8 (%class.B*)** %15, !dbg !75
  %17 = call signext i8 %16(%class.B* %12), !dbg !75, !virtual-call !76
  store i8 %17, i8* %reg, align 1, !dbg !75
  %18 = load %class.A** %a, align 8, !dbg !77
  %19 = bitcast %class.A* %18 to i8 (%class.A*)***, !dbg !77
  %20 = load i8 (%class.A*)*** %19, !dbg !77
  %21 = getelementptr inbounds i8 (%class.A*)** %20, i64 0, !dbg !77
  %22 = load i8 (%class.A*)** %21, !dbg !77
  %23 = call signext i8 %22(%class.A* %18), !dbg !77, !virtual-call !78
  call void @llvm.dbg.declare(metadata !{i8* %virt}, metadata !79), !dbg !80
  %24 = load %class.A** %x, align 8, !dbg !81
  %25 = bitcast %class.A* %24 to i8 (%class.A*)***, !dbg !81
  %26 = load i8 (%class.A*)*** %25, !dbg !81
  %27 = getelementptr inbounds i8 (%class.A*)** %26, i64 0, !dbg !81
  %28 = load i8 (%class.A*)** %27, !dbg !81
  %29 = call signext i8 %28(%class.A* %24), !dbg !81, !virtual-call !78
  store i8 %29, i8* %virt, align 1, !dbg !81
  call void @llvm.dbg.declare(metadata !{i8* %forced}, metadata !82), !dbg !83
  %30 = load %class.A** %x, align 8, !dbg !84
  %31 = call signext i8 @_ZN1A3fooEv(%class.A* %30), !dbg !84
  store i8 %31, i8* %forced, align 1, !dbg !84
  %32 = load %class.B** %b, align 8, !dbg !85
  %33 = bitcast %class.B* %32 to %class.A*, !dbg !85
  %34 = call signext i8 @_ZN1A3fooEv(%class.A* %33), !dbg !85
  %35 = load %class.A** %a, align 8, !dbg !86
  %36 = icmp eq %class.A* %35, null, !dbg !86
  br i1 %36, label %39, label %37, !dbg !86

; <label>:37                                      ; preds = %0
  %38 = bitcast %class.A* %35 to i8*, !dbg !86
  call void @_ZdlPv(i8* %38) nounwind, !dbg !86
  br label %39, !dbg !86

; <label>:39                                      ; preds = %37, %0
  %40 = load i8* %reg, align 1, !dbg !87
  %41 = sext i8 %40 to i32, !dbg !87
  %42 = load i8* %virt, align 1, !dbg !87
  %43 = sext i8 %42 to i32, !dbg !87
  %44 = add nsw i32 %41, %43, !dbg !87
  %45 = load i8* %forced, align 1, !dbg !87
  %46 = sext i8 %45 to i32, !dbg !87
  %47 = add nsw i32 %44, %46, !dbg !87
  ret i32 %47, !dbg !87
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare noalias i8* @_Znwm(i64)

define linkonce_odr void @_ZN1AC1Ei(%class.A* %this, i32 %x) unnamed_addr nounwind align 2 {
  %1 = alloca %class.A*, align 8
  %2 = alloca i32, align 4
  store %class.A* %this, %class.A** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A** %1}, metadata !88), !dbg !89
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !90), !dbg !91
  %3 = load %class.A** %1
  %4 = load i32* %2, align 4, !dbg !91
  call void @_ZN1AC2Ei(%class.A* %3, i32 %4), !dbg !91
  ret void, !dbg !91
}

define linkonce_odr void @_ZN1BC1Ei(%class.B* %this, i32 %x) unnamed_addr nounwind align 2 {
  %1 = alloca %class.B*, align 8
  %2 = alloca i32, align 4
  store %class.B* %this, %class.B** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.B** %1}, metadata !92), !dbg !93
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !94), !dbg !95
  %3 = load %class.B** %1
  %4 = load i32* %2, align 4, !dbg !95
  call void @_ZN1BC2Ei(%class.B* %3, i32 %4), !dbg !95
  ret void, !dbg !95
}

define linkonce_odr void @_ZN1A7nonvirtEv(%class.A* %this) nounwind align 2 {
  %1 = alloca %class.A*, align 8
  store %class.A* %this, %class.A** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A** %1}, metadata !96), !dbg !97
  %2 = load %class.A** %1
  ret void, !dbg !98
}

define linkonce_odr signext i8 @_ZN1B3fooEv(%class.B* %this) nounwind align 2 {
  %1 = alloca %class.B*, align 8
  store %class.B* %this, %class.B** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.B** %1}, metadata !100), !dbg !101
  %2 = load %class.B** %1
  ret i8 66, !dbg !102
}

define linkonce_odr signext i8 @_ZN1A3fooEv(%class.A* %this) nounwind align 2 {
  %1 = alloca %class.A*, align 8
  store %class.A* %this, %class.A** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A** %1}, metadata !104), !dbg !105
  %2 = load %class.A** %1
  ret i8 65, !dbg !106
}

declare void @_ZdlPv(i8*) nounwind

define linkonce_odr void @_ZN1BC2Ei(%class.B* %this, i32 %x) unnamed_addr nounwind align 2 {
  %1 = alloca %class.B*, align 8
  %2 = alloca i32, align 4
  store %class.B* %this, %class.B** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.B** %1}, metadata !108), !dbg !109
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !110), !dbg !111
  %3 = load %class.B** %1
  %4 = bitcast %class.B* %3 to %class.A*
  %5 = load i32* %2, align 4
  call void @_ZN1AC2Ei(%class.A* %4, i32 %5)
  %6 = bitcast %class.B* %3 to i8***
  store i8** getelementptr inbounds ([3 x i8*]* @_ZTV1B, i64 0, i64 2), i8*** %6
  ret void, !dbg !112
}

define linkonce_odr void @_ZN1AC2Ei(%class.A* %this, i32 %x) unnamed_addr nounwind align 2 {
  %1 = alloca %class.A*, align 8
  %2 = alloca i32, align 4
  store %class.A* %this, %class.A** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A** %1}, metadata !114), !dbg !115
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !116), !dbg !117
  %3 = load %class.A** %1
  %4 = bitcast %class.A* %3 to i8***
  store i8** getelementptr inbounds ([3 x i8*]* @_ZTV1A, i64 0, i64 2), i8*** %4
  %5 = getelementptr inbounds %class.A* %3, i32 0, i32 1
  %6 = load i32* %2, align 4
  store i32 %6, i32* %5, align 4
  ret void, !dbg !118
}

!llvm.dbg.sp = !{!0, !6, !13, !18, !24, !28, !34, !38, !44, !47, !48, !51, !52, !53, !54}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"", metadata !1, i32 23, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 ()* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"Test.cpp", metadata !"/home/brian/llvm/lib/Transforms/cs380c-devirtualization", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 4, metadata !"<unknown>", metadata !"/home/brian/llvm/lib/Transforms/cs380c-devirtualization", metadata !"clang version 2.9 (tags/RELEASE_29/final)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !4, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !2, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"A", metadata !"A", metadata !"", metadata !1, i32 13, metadata !22, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589826, metadata !2, metadata !"A", metadata !1, i32 10, i64 128, i64 64, i32 0, i32 0, null, metadata !8, i32 0, metadata !7, metadata !21} ; [ DW_TAG_class_type ]
!8 = metadata !{metadata !9, metadata !12, metadata !6, metadata !13, metadata !18}
!9 = metadata !{i32 589837, metadata !1, metadata !"_vptr$A", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ]
!10 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 589839, metadata !2, metadata !"__vtbl_ptr_type", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589837, metadata !1, metadata !"x", metadata !1, i32 12, i64 32, i64 32, i64 64, i32 0, metadata !5} ; [ DW_TAG_member ]
!13 = metadata !{i32 589870, i32 0, metadata !7, metadata !"foo", metadata !"foo", metadata !"_ZN1A3fooEv", metadata !1, i32 14, metadata !14, i1 false, i1 false, i32 1, i32 0, metadata !7, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{metadata !16, metadata !17}
!16 = metadata !{i32 589860, metadata !2, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!17 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !7} ; [ DW_TAG_pointer_type ]
!18 = metadata !{i32 589870, i32 0, metadata !7, metadata !"nonvirt", metadata !"nonvirt", metadata !"_ZN1A7nonvirtEv", metadata !1, i32 16, metadata !19, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!19 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !20, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{null, metadata !17}
!21 = metadata !{i32 0}
!22 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!23 = metadata !{null, metadata !17, metadata !5}
!24 = metadata !{i32 589870, i32 0, metadata !25, metadata !"B", metadata !"B", metadata !"", metadata !1, i32 20, metadata !32, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!25 = metadata !{i32 589826, metadata !2, metadata !"B", metadata !1, i32 18, i64 128, i64 64, i32 0, i32 0, null, metadata !26, i32 0, metadata !7, metadata !21} ; [ DW_TAG_class_type ]
!26 = metadata !{metadata !27, metadata !24, metadata !28}
!27 = metadata !{i32 589852, metadata !25, null, metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !7} ; [ DW_TAG_inheritance ]
!28 = metadata !{i32 589870, i32 0, metadata !25, metadata !"foo", metadata !"foo", metadata !"_ZN1B3fooEv", metadata !1, i32 21, metadata !29, i1 false, i1 false, i32 1, i32 0, metadata !25, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !30, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{metadata !16, metadata !31}
!31 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !25} ; [ DW_TAG_pointer_type ]
!32 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !33, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!33 = metadata !{null, metadata !31, metadata !5}
!34 = metadata !{i32 589870, i32 0, metadata !35, metadata !"g", metadata !"g", metadata !"_ZN1Z1gEv", metadata !1, i32 6, metadata !42, i1 false, i1 false, i32 1, i32 0, metadata !35, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 589826, metadata !2, metadata !"Z", metadata !1, i32 4, i64 64, i64 64, i32 0, i32 0, null, metadata !36, i32 0, metadata !35, metadata !21} ; [ DW_TAG_class_type ]
!36 = metadata !{metadata !37, metadata !34, metadata !38}
!37 = metadata !{i32 589837, metadata !1, metadata !"_vptr$Z", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ]
!38 = metadata !{i32 589870, i32 0, metadata !35, metadata !"Z", metadata !"Z", metadata !"", metadata !1, i32 8, metadata !39, i1 false, i1 false, i32 0, i32 0, null, i32 257, i1 false, null} ; [ DW_TAG_subprogram ]
!39 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !40, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!40 = metadata !{null, metadata !41}
!41 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !35} ; [ DW_TAG_pointer_type ]
!42 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !43, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!43 = metadata !{metadata !16, metadata !41}
!44 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN1A3fooEv", metadata !1, i32 14, metadata !45, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i8 (%class.A*)* @_ZN1A3fooEv} ; [ DW_TAG_subprogram ]
!45 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !46, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!46 = metadata !{metadata !16}
!47 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN1B3fooEv", metadata !1, i32 21, metadata !45, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i8 (%class.B*)* @_ZN1B3fooEv} ; [ DW_TAG_subprogram ]
!48 = metadata !{i32 589870, i32 0, metadata !1, metadata !"nonvirt", metadata !"nonvirt", metadata !"_ZN1A7nonvirtEv", metadata !1, i32 16, metadata !49, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, void (%class.A*)* @_ZN1A7nonvirtEv} ; [ DW_TAG_subprogram ]
!49 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !50, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!50 = metadata !{null}
!51 = metadata !{i32 589870, i32 0, metadata !1, metadata !"B", metadata !"B", metadata !"_ZN1BC1Ei", metadata !1, i32 20, metadata !49, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, void (%class.B*, i32)* @_ZN1BC1Ei} ; [ DW_TAG_subprogram ]
!52 = metadata !{i32 589870, i32 0, metadata !1, metadata !"B", metadata !"B", metadata !"_ZN1BC2Ei", metadata !1, i32 20, metadata !49, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, void (%class.B*, i32)* @_ZN1BC2Ei} ; [ DW_TAG_subprogram ]
!53 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A", metadata !"A", metadata !"_ZN1AC2Ei", metadata !1, i32 13, metadata !49, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, void (%class.A*, i32)* @_ZN1AC2Ei} ; [ DW_TAG_subprogram ]
!54 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A", metadata !"A", metadata !"_ZN1AC1Ei", metadata !1, i32 13, metadata !49, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, void (%class.A*, i32)* @_ZN1AC1Ei} ; [ DW_TAG_subprogram ]
!55 = metadata !{i32 590080, metadata !56, metadata !"a", metadata !1, i32 24, metadata !57, i32 0} ; [ DW_TAG_auto_variable ]
!56 = metadata !{i32 589835, metadata !0, i32 23, i32 12, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!57 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!58 = metadata !{i32 24, i32 6, metadata !56, null}
!59 = metadata !{i32 24, i32 18, metadata !56, null}
!60 = metadata !{i32 590080, metadata !56, metadata !"b", metadata !1, i32 25, metadata !61, i32 0} ; [ DW_TAG_auto_variable ]
!61 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ]
!62 = metadata !{i32 25, i32 6, metadata !56, null}
!63 = metadata !{i32 25, i32 18, metadata !56, null}
!64 = metadata !{i32 590080, metadata !56, metadata !"x", metadata !1, i32 26, metadata !57, i32 0} ; [ DW_TAG_auto_variable ]
!65 = metadata !{i32 26, i32 6, metadata !56, null}
!66 = metadata !{i32 26, i32 11, metadata !56, null}
!67 = metadata !{i32 590080, metadata !56, metadata !"z", metadata !1, i32 27, metadata !68, i32 0} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ]
!69 = metadata !{i32 27, i32 6, metadata !56, null}
!70 = metadata !{i32 28, i32 3, metadata !56, null}
!71 = metadata !{i32 29, i32 3, metadata !56, null}
!72 = metadata !{i32 30, i32 3, metadata !56, null}
!73 = metadata !{i32 590080, metadata !56, metadata !"reg", metadata !1, i32 31, metadata !16, i32 0} ; [ DW_TAG_auto_variable ]
!74 = metadata !{i32 31, i32 8, metadata !56, null}
!75 = metadata !{i32 31, i32 22, metadata !56, null}
!76 = metadata !{i8 (%class.B*)* @_ZN1B3fooEv}
!77 = metadata !{i32 32, i32 3, metadata !56, null}
!78 = metadata !{i8 (%class.A*)* @_ZN1A3fooEv}
!79 = metadata !{i32 590080, metadata !56, metadata !"virt", metadata !1, i32 33, metadata !16, i32 0} ; [ DW_TAG_auto_variable ]
!80 = metadata !{i32 33, i32 8, metadata !56, null}
!81 = metadata !{i32 33, i32 23, metadata !56, null}
!82 = metadata !{i32 590080, metadata !56, metadata !"forced", metadata !1, i32 34, metadata !16, i32 0} ; [ DW_TAG_auto_variable ]
!83 = metadata !{i32 34, i32 8, metadata !56, null}
!84 = metadata !{i32 34, i32 28, metadata !56, null}
!85 = metadata !{i32 35, i32 3, metadata !56, null}
!86 = metadata !{i32 36, i32 3, metadata !56, null}
!87 = metadata !{i32 40, i32 3, metadata !56, null}
!88 = metadata !{i32 590081, metadata !54, metadata !"this", metadata !1, i32 16777229, metadata !57, i32 64} ; [ DW_TAG_arg_variable ]
!89 = metadata !{i32 13, i32 3, metadata !54, null}
!90 = metadata !{i32 590081, metadata !54, metadata !"x", metadata !1, i32 33554445, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!91 = metadata !{i32 13, i32 9, metadata !54, null}
!92 = metadata !{i32 590081, metadata !51, metadata !"this", metadata !1, i32 16777236, metadata !61, i32 64} ; [ DW_TAG_arg_variable ]
!93 = metadata !{i32 20, i32 3, metadata !51, null}
!94 = metadata !{i32 590081, metadata !51, metadata !"x", metadata !1, i32 33554452, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!95 = metadata !{i32 20, i32 9, metadata !51, null}
!96 = metadata !{i32 590081, metadata !48, metadata !"this", metadata !1, i32 16777232, metadata !57, i32 64} ; [ DW_TAG_arg_variable ]
!97 = metadata !{i32 16, i32 8, metadata !48, null}
!98 = metadata !{i32 16, i32 19, metadata !99, null}
!99 = metadata !{i32 589835, metadata !48, i32 16, i32 18, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!100 = metadata !{i32 590081, metadata !47, metadata !"this", metadata !1, i32 16777237, metadata !61, i32 64} ; [ DW_TAG_arg_variable ]
!101 = metadata !{i32 21, i32 16, metadata !47, null}
!102 = metadata !{i32 21, i32 23, metadata !103, null}
!103 = metadata !{i32 589835, metadata !47, i32 21, i32 22, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!104 = metadata !{i32 590081, metadata !44, metadata !"this", metadata !1, i32 16777230, metadata !57, i32 64} ; [ DW_TAG_arg_variable ]
!105 = metadata !{i32 14, i32 16, metadata !44, null}
!106 = metadata !{i32 14, i32 23, metadata !107, null}
!107 = metadata !{i32 589835, metadata !44, i32 14, i32 22, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!108 = metadata !{i32 590081, metadata !52, metadata !"this", metadata !1, i32 16777236, metadata !61, i32 64} ; [ DW_TAG_arg_variable ]
!109 = metadata !{i32 20, i32 3, metadata !52, null}
!110 = metadata !{i32 590081, metadata !52, metadata !"x", metadata !1, i32 33554452, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!111 = metadata !{i32 20, i32 9, metadata !52, null}
!112 = metadata !{i32 20, i32 20, metadata !113, null}
!113 = metadata !{i32 589835, metadata !52, i32 20, i32 19, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!114 = metadata !{i32 590081, metadata !53, metadata !"this", metadata !1, i32 16777229, metadata !57, i32 64} ; [ DW_TAG_arg_variable ]
!115 = metadata !{i32 13, i32 3, metadata !53, null}
!116 = metadata !{i32 590081, metadata !53, metadata !"x", metadata !1, i32 33554445, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!117 = metadata !{i32 13, i32 9, metadata !53, null}
!118 = metadata !{i32 13, i32 20, metadata !119, null}
!119 = metadata !{i32 589835, metadata !53, i32 13, i32 19, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
