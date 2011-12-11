; ModuleID = 'Test.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8*, i8* }
%1 = type { i8*, i8*, i32, i32, i8*, i64, i8*, i64 }
%class.A = type { i32 (...)**, i32 }
%class.A2 = type { i32 (...)** }
%class.B = type { [12 x i8], [4 x i8], [8 x i8] }
%class.C = type { [24 x i8] }
%class.D = type { [24 x i8] }
%class.Z = type { i32 (...)** }

@_ZTV1B = linkonce_odr unnamed_addr constant [9 x i8*] [i8* null, i8* bitcast (%1* @_ZTI1B to i8*), i8* bitcast (i8 (%class.B*)* @_ZN1B3fooEv to i8*), i8* bitcast (i32 (%class.B*, i32)* @_ZN1B3fooEi to i8*), i8* bitcast (i32 (%class.A*, %class.A*)* @_ZN1AplES_ to i8*), i8* bitcast (i32 (%class.B*)* @_ZN1B3gooEv to i8*), i8* inttoptr (i64 -16 to i8*), i8* bitcast (%1* @_ZTI1B to i8*), i8* bitcast (i32 (%class.B*)* @_ZThn16_N1B3gooEv to i8*)]
@_ZTVN10__cxxabiv121__vmi_class_type_infoE = external global i8*
@_ZTS1B = linkonce_odr constant [3 x i8] c"1B\00"
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTS1A = linkonce_odr constant [3 x i8] c"1A\00"
@_ZTI1A = linkonce_odr unnamed_addr constant %0 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8]* @_ZTS1A, i32 0, i32 0) }
@_ZTS2A2 = linkonce_odr constant [4 x i8] c"2A2\00"
@_ZTI2A2 = linkonce_odr unnamed_addr constant %0 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8]* @_ZTS2A2, i32 0, i32 0) }
@_ZTI1B = linkonce_odr unnamed_addr constant %1 { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8]* @_ZTS1B, i32 0, i32 0), i32 0, i32 2, i8* bitcast (%0* @_ZTI1A to i8*), i64 2, i8* bitcast (%0* @_ZTI2A2 to i8*), i64 4098 }
@_ZTV2A2 = linkonce_odr unnamed_addr constant [3 x i8*] [i8* null, i8* bitcast (%0* @_ZTI2A2 to i8*), i8* bitcast (i32 (%class.A2*)* @_ZN2A23gooEv to i8*)]
@_ZTV1A = linkonce_odr unnamed_addr constant [5 x i8*] [i8* null, i8* bitcast (%0* @_ZTI1A to i8*), i8* bitcast (i8 (%class.A*)* @_ZN1A3fooEv to i8*), i8* bitcast (i32 (%class.A*, i32)* @_ZN1A3fooEi to i8*), i8* bitcast (i32 (%class.A*, %class.A*)* @_ZN1AplES_ to i8*)]

define i32 @main() {
  %1 = alloca i32, align 4
  %a = alloca %class.A*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  %a2 = alloca %class.A2*, align 8
  %b = alloca %class.B*, align 8
  %x = alloca %class.A*, align 8
  %z = alloca %class.A2*, align 8
  %c = alloca %class.C*, align 8
  %d = alloca %class.C*, align 8
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{%class.A** %a}, metadata !102), !dbg !105
  %4 = call noalias i8* @_Znwm(i64 16), !dbg !106
  %5 = bitcast i8* %4 to %class.A*, !dbg !106
  invoke void @_ZN1AC1Ei(%class.A* %5, i32 1)
          to label %6 unwind label %34, !dbg !106

; <label>:6                                       ; preds = %0
  store %class.A* %5, %class.A** %a, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata !{%class.A2** %a2}, metadata !107), !dbg !109
  %7 = call noalias i8* @_Znwm(i64 8), !dbg !110
  %8 = bitcast i8* %7 to %class.A2*, !dbg !110
  %9 = bitcast %class.A2* %8 to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 8, i32 8, i1 false), !dbg !110
  call void @_ZN2A2C1Ev(%class.A2* %8) nounwind, !dbg !110
  store %class.A2* %8, %class.A2** %a2, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata !{%class.B** %b}, metadata !111), !dbg !113
  %10 = call noalias i8* @_Znwm(i64 24), !dbg !114
  %11 = bitcast i8* %10 to %class.B*, !dbg !114
  invoke void @_ZN1BC1Ei(%class.B* %11, i32 2)
          to label %12 unwind label %37, !dbg !114

; <label>:12                                      ; preds = %6
  store %class.B* %11, %class.B** %b, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata !{%class.A** %x}, metadata !115), !dbg !116
  %13 = load %class.B** %b, align 8, !dbg !117
  %14 = bitcast %class.B* %13 to %class.A*, !dbg !117
  store %class.A* %14, %class.A** %x, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata !{%class.A2** %z}, metadata !118), !dbg !120
  call void @llvm.dbg.declare(metadata !{%class.C** %c}, metadata !121), !dbg !123
  call void @llvm.dbg.declare(metadata !{%class.C** %d}, metadata !124), !dbg !126
  %15 = load %class.A** %a, align 8, !dbg !127
  call void @_ZN1A7nonvirtEv(%class.A* %15), !dbg !127
  %16 = load %class.A** %x, align 8, !dbg !128
  call void @_ZN1A7nonvirtEv(%class.A* %16), !dbg !128
  %17 = load %class.B** %b, align 8, !dbg !129
  %18 = bitcast %class.B* %17 to %class.A*, !dbg !129
  call void @_ZN1A7nonvirtEv(%class.A* %18), !dbg !129
  %19 = load %class.A** %a, align 8, !dbg !130
  %20 = icmp eq %class.A* %19, null, !dbg !130
  br i1 %20, label %23, label %21, !dbg !130

; <label>:21                                      ; preds = %12
  %22 = bitcast %class.A* %19 to i8*, !dbg !130
  call void @_ZdlPv(i8* %22) nounwind, !dbg !130
  br label %23, !dbg !130

; <label>:23                                      ; preds = %21, %12
  %24 = load %class.A2** %a2, align 8, !dbg !131
  %25 = icmp eq %class.A2* %24, null, !dbg !131
  br i1 %25, label %28, label %26, !dbg !131

; <label>:26                                      ; preds = %23
  %27 = bitcast %class.A2* %24 to i8*, !dbg !131
  call void @_ZdlPv(i8* %27) nounwind, !dbg !131
  br label %28, !dbg !131

; <label>:28                                      ; preds = %26, %23
  %29 = load %class.B** %b, align 8, !dbg !132
  %30 = icmp eq %class.B* %29, null, !dbg !132
  br i1 %30, label %33, label %31, !dbg !132

; <label>:31                                      ; preds = %28
  %32 = bitcast %class.B* %29 to i8*, !dbg !132
  call void @_ZdlPv(i8* %32) nounwind, !dbg !132
  br label %33, !dbg !132

; <label>:33                                      ; preds = %31, %28
  ret i32 0, !dbg !133

; <label>:34                                      ; preds = %0
  %35 = call i8* @llvm.eh.exception() nounwind, !dbg !106
  store i8* %35, i8** %2, !dbg !106
  %36 = call i32 (i8*, i8*, ...)* @llvm.eh.selector(i8* %35, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) nounwind, !dbg !106
  store i32 0, i32* %3
  call void @_ZdlPv(i8* %4) nounwind, !dbg !106
  br label %40

; <label>:37                                      ; preds = %6
  %38 = call i8* @llvm.eh.exception() nounwind, !dbg !114
  store i8* %38, i8** %2, !dbg !114
  %39 = call i32 (i8*, i8*, ...)* @llvm.eh.selector(i8* %38, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) nounwind, !dbg !114
  store i32 0, i32* %3
  call void @_ZdlPv(i8* %10) nounwind, !dbg !114
  br label %40

; <label>:40                                      ; preds = %37, %34
  %41 = load i8** %2, !dbg !106
  call void @_Unwind_Resume_or_Rethrow(i8* %41) noreturn, !dbg !106
  unreachable, !dbg !106
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare noalias i8* @_Znwm(i64)

define linkonce_odr void @_ZN1AC1Ei(%class.A* %this, i32 %x) unnamed_addr nounwind align 2 {
  %1 = alloca %class.A*, align 8
  %2 = alloca i32, align 4
  store %class.A* %this, %class.A** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A** %1}, metadata !134), !dbg !135
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !136), !dbg !137
  %3 = load %class.A** %1
  %4 = load i32* %2, align 4, !dbg !137
  call void @_ZN1AC2Ei(%class.A* %3, i32 %4), !dbg !137
  ret void, !dbg !137
}

declare i8* @llvm.eh.exception() nounwind readonly

declare i32 @__gxx_personality_v0(...)

declare i32 @llvm.eh.selector(i8*, i8*, ...) nounwind

declare i32 @llvm.eh.typeid.for(i8*) nounwind

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare void @_ZdlPv(i8*) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define linkonce_odr void @_ZN2A2C1Ev(%class.A2* %this) unnamed_addr nounwind inlinehint align 2 {
  %1 = alloca %class.A2*, align 8
  store %class.A2* %this, %class.A2** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A2** %1}, metadata !138), !dbg !139
  %2 = load %class.A2** %1
  call void @_ZN2A2C2Ev(%class.A2* %2) nounwind, !dbg !139
  ret void, !dbg !139
}

define linkonce_odr void @_ZN1BC1Ei(%class.B* %this, i32 %x) unnamed_addr align 2 {
  %1 = alloca %class.B*, align 8
  %2 = alloca i32, align 4
  store %class.B* %this, %class.B** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.B** %1}, metadata !140), !dbg !141
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !142), !dbg !143
  %3 = load %class.B** %1
  %4 = load i32* %2, align 4, !dbg !143
  call void @_ZN1BC2Ei(%class.B* %3, i32 %4), !dbg !143
  ret void, !dbg !143
}

define linkonce_odr void @_ZN1A7nonvirtEv(%class.A* %this) nounwind align 2 {
  %1 = alloca %class.A*, align 8
  store %class.A* %this, %class.A** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A** %1}, metadata !144), !dbg !145
  %2 = load %class.A** %1
  ret void, !dbg !146
}

define linkonce_odr void @_ZN1BC2Ei(%class.B* %this, i32 %x) unnamed_addr align 2 {
  %1 = alloca %class.B*, align 8
  %2 = alloca i32, align 4
  store %class.B* %this, %class.B** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.B** %1}, metadata !148), !dbg !149
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !150), !dbg !151
  %3 = load %class.B** %1
  %4 = bitcast %class.B* %3 to %class.A*
  %5 = load i32* %2, align 4
  call void @_ZN1AC2Ei(%class.A* %4, i32 %5)
  %6 = bitcast %class.B* %3 to i8*
  %7 = getelementptr inbounds i8* %6, i64 16
  %8 = bitcast i8* %7 to %class.A2*
  call void @_ZN2A2C2Ev(%class.A2* %8) nounwind
  %9 = bitcast %class.B* %3 to i8***
  store i8** getelementptr inbounds ([9 x i8*]* @_ZTV1B, i64 0, i64 2), i8*** %9
  %10 = bitcast %class.B* %3 to i8*
  %11 = getelementptr i8* %10, i64 16
  %12 = bitcast i8* %11 to i8***
  store i8** getelementptr inbounds ([9 x i8*]* @_ZTV1B, i64 0, i64 8), i8*** %12
  ret void, !dbg !152
}

define linkonce_odr void @_ZN1AC2Ei(%class.A* %this, i32 %x) unnamed_addr nounwind align 2 {
  %1 = alloca %class.A*, align 8
  %2 = alloca i32, align 4
  store %class.A* %this, %class.A** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A** %1}, metadata !154), !dbg !155
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !156), !dbg !157
  %3 = load %class.A** %1
  %4 = bitcast %class.A* %3 to i8***
  store i8** getelementptr inbounds ([5 x i8*]* @_ZTV1A, i64 0, i64 2), i8*** %4
  %5 = getelementptr inbounds %class.A* %3, i32 0, i32 1
  %6 = load i32* %2, align 4
  store i32 %6, i32* %5, align 4
  ret void, !dbg !158
}

define linkonce_odr void @_ZN2A2C2Ev(%class.A2* %this) unnamed_addr nounwind inlinehint align 2 {
  %1 = alloca %class.A2*, align 8
  store %class.A2* %this, %class.A2** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A2** %1}, metadata !160), !dbg !161
  %2 = load %class.A2** %1
  %3 = bitcast %class.A2* %2 to i8***
  store i8** getelementptr inbounds ([3 x i8*]* @_ZTV2A2, i64 0, i64 2), i8*** %3
  ret void, !dbg !162
}

define linkonce_odr signext i8 @_ZN1B3fooEv(%class.B* %this) nounwind align 2 {
  %1 = alloca %class.B*, align 8
  store %class.B* %this, %class.B** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.B** %1}, metadata !164), !dbg !165
  %2 = load %class.B** %1
  ret i8 66, !dbg !166
}

define linkonce_odr i32 @_ZN1B3fooEi(%class.B* %this, i32 %x) nounwind align 2 {
  %1 = alloca %class.B*, align 8
  %2 = alloca i32, align 4
  store %class.B* %this, %class.B** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.B** %1}, metadata !168), !dbg !169
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !170), !dbg !171
  %3 = load %class.B** %1
  %4 = load i32* %2, align 4, !dbg !172
  %5 = mul nsw i32 %4, 3, !dbg !172
  ret i32 %5, !dbg !172
}

define linkonce_odr i32 @_ZN1AplES_(%class.A* %this, %class.A* %a) nounwind align 2 {
  %1 = alloca %class.A*, align 8
  store %class.A* %this, %class.A** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A** %1}, metadata !174), !dbg !175
  call void @llvm.dbg.declare(metadata !{%class.A* %a}, metadata !176), !dbg !178
  %2 = load %class.A** %1
  ret i32 3, !dbg !179
}

define linkonce_odr i32 @_ZN1B3gooEv(%class.B* %this) nounwind align 2 {
  %1 = alloca %class.B*, align 8
  store %class.B* %this, %class.B** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.B** %1}, metadata !181), !dbg !182
  %2 = load %class.B** %1
  ret i32 42, !dbg !183
}

define linkonce_odr i32 @_ZThn16_N1B3gooEv(%class.B* %this) {
  %1 = alloca %class.B*, align 8
  store %class.B* %this, %class.B** %1, align 8
  %2 = load %class.B** %1
  %3 = bitcast %class.B* %2 to i8*
  %4 = getelementptr inbounds i8* %3, i64 -16
  %5 = bitcast i8* %4 to %class.B*
  %6 = call i32 @_ZN1B3gooEv(%class.B* %5)
  ret i32 %6
}

define linkonce_odr i32 @_ZN2A23gooEv(%class.A2* %this) nounwind align 2 {
  %1 = alloca %class.A2*, align 8
  store %class.A2* %this, %class.A2** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A2** %1}, metadata !185), !dbg !186
  %2 = load %class.A2** %1
  ret i32 22, !dbg !187
}

define linkonce_odr signext i8 @_ZN1A3fooEv(%class.A* %this) nounwind align 2 {
  %1 = alloca %class.A*, align 8
  store %class.A* %this, %class.A** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A** %1}, metadata !189), !dbg !190
  %2 = load %class.A** %1
  ret i8 65, !dbg !191
}

define linkonce_odr i32 @_ZN1A3fooEi(%class.A* %this, i32 %x) nounwind align 2 {
  %1 = alloca %class.A*, align 8
  %2 = alloca i32, align 4
  store %class.A* %this, %class.A** %1, align 8
  call void @llvm.dbg.declare(metadata !{%class.A** %1}, metadata !193), !dbg !194
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !195), !dbg !196
  %3 = load %class.A** %1
  %4 = load i32* %2, align 4, !dbg !197
  %5 = mul nsw i32 %4, 2, !dbg !197
  ret i32 %5, !dbg !197
}

!llvm.dbg.sp = !{!0, !6, !13, !18, !21, !24, !30, !34, !40, !45, !49, !52, !55, !60, !64, !70, !77, !84, !87, !88, !89, !90, !91, !92, !95, !96, !97, !98, !99, !100, !101}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"", metadata !1, i32 37, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 ()* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"Test.cpp", metadata !"/home/vitor/llvm/lib/Transforms/cs380c-devirtualization", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 4, metadata !"Test.cpp", metadata !"/home/vitor/llvm/lib/Transforms/cs380c-devirtualization", metadata !"clang version 2.9 (tags/RELEASE_29/final)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !4, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !2, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"A", metadata !"A", metadata !"", metadata !1, i32 10, metadata !28, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589826, metadata !2, metadata !"A", metadata !1, i32 7, i64 128, i64 64, i32 0, i32 0, null, metadata !8, i32 0, metadata !7, metadata !27} ; [ DW_TAG_class_type ]
!8 = metadata !{metadata !9, metadata !12, metadata !6, metadata !13, metadata !18, metadata !21, metadata !24}
!9 = metadata !{i32 589837, metadata !1, metadata !"_vptr$A", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ]
!10 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 589839, metadata !2, metadata !"__vtbl_ptr_type", null, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589837, metadata !1, metadata !"x", metadata !1, i32 9, i64 32, i64 32, i64 64, i32 0, metadata !5} ; [ DW_TAG_member ]
!13 = metadata !{i32 589870, i32 0, metadata !7, metadata !"foo", metadata !"foo", metadata !"_ZN1A3fooEv", metadata !1, i32 11, metadata !14, i1 false, i1 false, i32 1, i32 0, metadata !7, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{metadata !16, metadata !17}
!16 = metadata !{i32 589860, metadata !2, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!17 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !7} ; [ DW_TAG_pointer_type ]
!18 = metadata !{i32 589870, i32 0, metadata !7, metadata !"foo", metadata !"foo", metadata !"_ZN1A3fooEi", metadata !1, i32 12, metadata !19, i1 false, i1 false, i32 1, i32 1, metadata !7, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!19 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !20, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{metadata !5, metadata !17, metadata !5}
!21 = metadata !{i32 589870, i32 0, metadata !7, metadata !"nonvirt", metadata !"nonvirt", metadata !"_ZN1A7nonvirtEv", metadata !1, i32 13, metadata !22, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!22 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!23 = metadata !{null, metadata !17}
!24 = metadata !{i32 589870, i32 0, metadata !7, metadata !"operator+", metadata !"operator+", metadata !"_ZN1AplES_", metadata !1, i32 14, metadata !25, i1 false, i1 false, i32 1, i32 2, metadata !7, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!25 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!26 = metadata !{metadata !5, metadata !17, metadata !7}
!27 = metadata !{i32 0}
!28 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !29, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!29 = metadata !{null, metadata !17, metadata !5}
!30 = metadata !{i32 589870, i32 0, metadata !31, metadata !"goo", metadata !"goo", metadata !"_ZN2A23gooEv", metadata !1, i32 18, metadata !38, i1 false, i1 false, i32 1, i32 0, metadata !31, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!31 = metadata !{i32 589826, metadata !2, metadata !"A2", metadata !1, i32 16, i64 64, i64 64, i32 0, i32 0, null, metadata !32, i32 0, metadata !31, metadata !27} ; [ DW_TAG_class_type ]
!32 = metadata !{metadata !33, metadata !30, metadata !34}
!33 = metadata !{i32 589837, metadata !1, metadata !"_vptr$A2", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ]
!34 = metadata !{i32 589870, i32 0, metadata !31, metadata !"A2", metadata !"A2", metadata !"", metadata !1, i32 16, metadata !35, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !36, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!36 = metadata !{null, metadata !37}
!37 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !31} ; [ DW_TAG_pointer_type ]
!38 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !39, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!39 = metadata !{metadata !5, metadata !37}
!40 = metadata !{i32 589870, i32 0, metadata !41, metadata !"B", metadata !"B", metadata !"", metadata !1, i32 22, metadata !58, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!41 = metadata !{i32 589826, metadata !2, metadata !"B", metadata !1, i32 20, i64 192, i64 64, i32 0, i32 0, null, metadata !42, i32 0, metadata !7, metadata !27} ; [ DW_TAG_class_type ]
!42 = metadata !{metadata !43, metadata !44, metadata !40, metadata !45, metadata !49, metadata !52, metadata !55}
!43 = metadata !{i32 589852, metadata !41, null, metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !7} ; [ DW_TAG_inheritance ]
!44 = metadata !{i32 589852, metadata !41, null, metadata !1, i32 0, i64 0, i64 0, i64 128, i32 0, metadata !31} ; [ DW_TAG_inheritance ]
!45 = metadata !{i32 589870, i32 0, metadata !41, metadata !"B", metadata !"B", metadata !"", metadata !1, i32 23, metadata !46, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!46 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !47, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!47 = metadata !{null, metadata !48}
!48 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !41} ; [ DW_TAG_pointer_type ]
!49 = metadata !{i32 589870, i32 0, metadata !41, metadata !"foo", metadata !"foo", metadata !"_ZN1B3fooEv", metadata !1, i32 24, metadata !50, i1 false, i1 false, i32 1, i32 0, metadata !41, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!50 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !51, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!51 = metadata !{metadata !16, metadata !48}
!52 = metadata !{i32 589870, i32 0, metadata !41, metadata !"foo", metadata !"foo", metadata !"_ZN1B3fooEi", metadata !1, i32 25, metadata !53, i1 false, i1 false, i32 1, i32 1, metadata !41, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!53 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !54, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!54 = metadata !{metadata !5, metadata !48, metadata !5}
!55 = metadata !{i32 589870, i32 0, metadata !41, metadata !"goo", metadata !"goo", metadata !"_ZN1B3gooEv", metadata !1, i32 26, metadata !56, i1 false, i1 false, i32 1, i32 3, metadata !41, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!56 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !57, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!57 = metadata !{metadata !5, metadata !48}
!58 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !59, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!59 = metadata !{null, metadata !48, metadata !5}
!60 = metadata !{i32 589870, i32 0, metadata !61, metadata !"g", metadata !"g", metadata !"_ZN1Z1gEv", metadata !1, i32 3, metadata !68, i1 false, i1 false, i32 1, i32 0, metadata !61, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!61 = metadata !{i32 589826, metadata !2, metadata !"Z", metadata !1, i32 1, i64 64, i64 64, i32 0, i32 0, null, metadata !62, i32 0, metadata !61, metadata !27} ; [ DW_TAG_class_type ]
!62 = metadata !{metadata !63, metadata !60, metadata !64}
!63 = metadata !{i32 589837, metadata !1, metadata !"_vptr$Z", metadata !1, i32 0, i64 64, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ]
!64 = metadata !{i32 589870, i32 0, metadata !61, metadata !"Z", metadata !"Z", metadata !"", metadata !1, i32 5, metadata !65, i1 false, i1 false, i32 0, i32 0, null, i32 257, i1 false, null} ; [ DW_TAG_subprogram ]
!65 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !66, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!66 = metadata !{null, metadata !67}
!67 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !61} ; [ DW_TAG_pointer_type ]
!68 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !69, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!69 = metadata !{metadata !16, metadata !67}
!70 = metadata !{i32 589870, i32 0, metadata !71, metadata !"C", metadata !"C", metadata !"", metadata !1, i32 29, metadata !74, i1 false, i1 false, i32 0, i32 0, null, i32 257, i1 false, null} ; [ DW_TAG_subprogram ]
!71 = metadata !{i32 589826, metadata !2, metadata !"C", metadata !1, i32 28, i64 192, i64 64, i32 0, i32 0, null, metadata !72, i32 0, metadata !7, metadata !27} ; [ DW_TAG_class_type ]
!72 = metadata !{metadata !73, metadata !70}
!73 = metadata !{i32 589852, metadata !71, null, metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_inheritance ]
!74 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !75, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!75 = metadata !{null, metadata !76}
!76 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !71} ; [ DW_TAG_pointer_type ]
!77 = metadata !{i32 589870, i32 0, metadata !78, metadata !"foo", metadata !"foo", metadata !"_ZN1D3fooEv", metadata !1, i32 34, metadata !81, i1 false, i1 false, i32 1, i32 0, metadata !78, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!78 = metadata !{i32 589826, metadata !2, metadata !"D", metadata !1, i32 32, i64 192, i64 64, i32 0, i32 0, null, metadata !79, i32 0, metadata !7, metadata !27} ; [ DW_TAG_class_type ]
!79 = metadata !{metadata !80, metadata !77}
!80 = metadata !{i32 589852, metadata !78, null, metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_inheritance ]
!81 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !82, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!82 = metadata !{metadata !16, metadata !83}
!83 = metadata !{i32 589839, metadata !2, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !78} ; [ DW_TAG_pointer_type ]
!84 = metadata !{i32 589870, i32 0, metadata !1, metadata !"nonvirt", metadata !"nonvirt", metadata !"_ZN1A7nonvirtEv", metadata !1, i32 13, metadata !85, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, void (%class.A*)* @_ZN1A7nonvirtEv} ; [ DW_TAG_subprogram ]
!85 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !86, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!86 = metadata !{null}
!87 = metadata !{i32 589870, i32 0, metadata !1, metadata !"B", metadata !"B", metadata !"_ZN1BC1Ei", metadata !1, i32 22, metadata !85, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, void (%class.B*, i32)* @_ZN1BC1Ei} ; [ DW_TAG_subprogram ]
!88 = metadata !{i32 589870, i32 0, metadata !1, metadata !"B", metadata !"B", metadata !"_ZN1BC2Ei", metadata !1, i32 22, metadata !85, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, void (%class.B*, i32)* @_ZN1BC2Ei} ; [ DW_TAG_subprogram ]
!89 = metadata !{i32 589870, i32 0, metadata !1, metadata !"goo", metadata !"goo", metadata !"_ZN1B3gooEv", metadata !1, i32 26, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%class.B*)* @_ZN1B3gooEv} ; [ DW_TAG_subprogram ]
!90 = metadata !{i32 589870, i32 0, metadata !1, metadata !"operator+", metadata !"operator+", metadata !"_ZN1AplES_", metadata !1, i32 14, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%class.A*, %class.A*)* @_ZN1AplES_} ; [ DW_TAG_subprogram ]
!91 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN1B3fooEi", metadata !1, i32 25, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%class.B*, i32)* @_ZN1B3fooEi} ; [ DW_TAG_subprogram ]
!92 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN1B3fooEv", metadata !1, i32 24, metadata !93, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i8 (%class.B*)* @_ZN1B3fooEv} ; [ DW_TAG_subprogram ]
!93 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !94, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!94 = metadata !{metadata !16}
!95 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A2", metadata !"A2", metadata !"_ZN2A2C2Ev", metadata !1, i32 16, metadata !85, i1 false, i1 true, i32 0, i32 0, i32 0, i32 320, i1 false, void (%class.A2*)* @_ZN2A2C2Ev} ; [ DW_TAG_subprogram ]
!96 = metadata !{i32 589870, i32 0, metadata !1, metadata !"goo", metadata !"goo", metadata !"_ZN2A23gooEv", metadata !1, i32 18, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%class.A2*)* @_ZN2A23gooEv} ; [ DW_TAG_subprogram ]
!97 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A", metadata !"A", metadata !"_ZN1AC2Ei", metadata !1, i32 10, metadata !85, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, void (%class.A*, i32)* @_ZN1AC2Ei} ; [ DW_TAG_subprogram ]
!98 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN1A3fooEi", metadata !1, i32 12, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i32 (%class.A*, i32)* @_ZN1A3fooEi} ; [ DW_TAG_subprogram ]
!99 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN1A3fooEv", metadata !1, i32 11, metadata !93, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, i8 (%class.A*)* @_ZN1A3fooEv} ; [ DW_TAG_subprogram ]
!100 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A2", metadata !"A2", metadata !"_ZN2A2C1Ev", metadata !1, i32 16, metadata !85, i1 false, i1 true, i32 0, i32 0, i32 0, i32 320, i1 false, void (%class.A2*)* @_ZN2A2C1Ev} ; [ DW_TAG_subprogram ]
!101 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A", metadata !"A", metadata !"_ZN1AC1Ei", metadata !1, i32 10, metadata !85, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 false, void (%class.A*, i32)* @_ZN1AC1Ei} ; [ DW_TAG_subprogram ]
!102 = metadata !{i32 590080, metadata !103, metadata !"a", metadata !1, i32 38, metadata !104, i32 0} ; [ DW_TAG_auto_variable ]
!103 = metadata !{i32 589835, metadata !0, i32 37, i32 12, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!104 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!105 = metadata !{i32 38, i32 6, metadata !103, null}
!106 = metadata !{i32 38, i32 18, metadata !103, null}
!107 = metadata !{i32 590080, metadata !103, metadata !"a2", metadata !1, i32 39, metadata !108, i32 0} ; [ DW_TAG_auto_variable ]
!108 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ]
!109 = metadata !{i32 39, i32 7, metadata !103, null}
!110 = metadata !{i32 39, i32 20, metadata !103, null}
!111 = metadata !{i32 590080, metadata !103, metadata !"b", metadata !1, i32 40, metadata !112, i32 0} ; [ DW_TAG_auto_variable ]
!112 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ]
!113 = metadata !{i32 40, i32 6, metadata !103, null}
!114 = metadata !{i32 40, i32 18, metadata !103, null}
!115 = metadata !{i32 590080, metadata !103, metadata !"x", metadata !1, i32 41, metadata !104, i32 0} ; [ DW_TAG_auto_variable ]
!116 = metadata !{i32 41, i32 6, metadata !103, null}
!117 = metadata !{i32 41, i32 11, metadata !103, null}
!118 = metadata !{i32 590080, metadata !103, metadata !"z", metadata !1, i32 42, metadata !119, i32 0} ; [ DW_TAG_auto_variable ]
!119 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ]
!120 = metadata !{i32 42, i32 6, metadata !103, null}
!121 = metadata !{i32 590080, metadata !103, metadata !"c", metadata !1, i32 43, metadata !122, i32 0} ; [ DW_TAG_auto_variable ]
!122 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !71} ; [ DW_TAG_pointer_type ]
!123 = metadata !{i32 43, i32 6, metadata !103, null}
!124 = metadata !{i32 590080, metadata !103, metadata !"d", metadata !1, i32 44, metadata !125, i32 0} ; [ DW_TAG_auto_variable ]
!125 = metadata !{i32 589839, metadata !2, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_pointer_type ]
!126 = metadata !{i32 44, i32 6, metadata !103, null}
!127 = metadata !{i32 45, i32 3, metadata !103, null}
!128 = metadata !{i32 46, i32 3, metadata !103, null}
!129 = metadata !{i32 47, i32 3, metadata !103, null}
!130 = metadata !{i32 48, i32 3, metadata !103, null}
!131 = metadata !{i32 49, i32 3, metadata !103, null}
!132 = metadata !{i32 50, i32 3, metadata !103, null}
!133 = metadata !{i32 51, i32 3, metadata !103, null}
!134 = metadata !{i32 590081, metadata !101, metadata !"this", metadata !1, i32 16777226, metadata !104, i32 64} ; [ DW_TAG_arg_variable ]
!135 = metadata !{i32 10, i32 3, metadata !101, null}
!136 = metadata !{i32 590081, metadata !101, metadata !"x", metadata !1, i32 33554442, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!137 = metadata !{i32 10, i32 9, metadata !101, null}
!138 = metadata !{i32 590081, metadata !100, metadata !"this", metadata !1, i32 16777232, metadata !108, i32 64} ; [ DW_TAG_arg_variable ]
!139 = metadata !{i32 16, i32 7, metadata !100, null}
!140 = metadata !{i32 590081, metadata !87, metadata !"this", metadata !1, i32 16777238, metadata !112, i32 64} ; [ DW_TAG_arg_variable ]
!141 = metadata !{i32 22, i32 3, metadata !87, null}
!142 = metadata !{i32 590081, metadata !87, metadata !"x", metadata !1, i32 33554454, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!143 = metadata !{i32 22, i32 9, metadata !87, null}
!144 = metadata !{i32 590081, metadata !84, metadata !"this", metadata !1, i32 16777229, metadata !104, i32 64} ; [ DW_TAG_arg_variable ]
!145 = metadata !{i32 13, i32 8, metadata !84, null}
!146 = metadata !{i32 13, i32 19, metadata !147, null}
!147 = metadata !{i32 589835, metadata !84, i32 13, i32 18, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!148 = metadata !{i32 590081, metadata !88, metadata !"this", metadata !1, i32 16777238, metadata !112, i32 64} ; [ DW_TAG_arg_variable ]
!149 = metadata !{i32 22, i32 3, metadata !88, null}
!150 = metadata !{i32 590081, metadata !88, metadata !"x", metadata !1, i32 33554454, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!151 = metadata !{i32 22, i32 9, metadata !88, null}
!152 = metadata !{i32 22, i32 20, metadata !153, null}
!153 = metadata !{i32 589835, metadata !88, i32 22, i32 19, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!154 = metadata !{i32 590081, metadata !97, metadata !"this", metadata !1, i32 16777226, metadata !104, i32 64} ; [ DW_TAG_arg_variable ]
!155 = metadata !{i32 10, i32 3, metadata !97, null}
!156 = metadata !{i32 590081, metadata !97, metadata !"x", metadata !1, i32 33554442, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!157 = metadata !{i32 10, i32 9, metadata !97, null}
!158 = metadata !{i32 10, i32 20, metadata !159, null}
!159 = metadata !{i32 589835, metadata !97, i32 10, i32 19, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
!160 = metadata !{i32 590081, metadata !95, metadata !"this", metadata !1, i32 16777232, metadata !108, i32 64} ; [ DW_TAG_arg_variable ]
!161 = metadata !{i32 16, i32 7, metadata !95, null}
!162 = metadata !{i32 16, i32 7, metadata !163, null}
!163 = metadata !{i32 589835, metadata !95, i32 16, i32 7, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!164 = metadata !{i32 590081, metadata !92, metadata !"this", metadata !1, i32 16777240, metadata !112, i32 64} ; [ DW_TAG_arg_variable ]
!165 = metadata !{i32 24, i32 16, metadata !92, null}
!166 = metadata !{i32 24, i32 23, metadata !167, null}
!167 = metadata !{i32 589835, metadata !92, i32 24, i32 22, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!168 = metadata !{i32 590081, metadata !91, metadata !"this", metadata !1, i32 16777241, metadata !112, i32 64} ; [ DW_TAG_arg_variable ]
!169 = metadata !{i32 25, i32 15, metadata !91, null}
!170 = metadata !{i32 590081, metadata !91, metadata !"x", metadata !1, i32 33554457, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!171 = metadata !{i32 25, i32 23, metadata !91, null}
!172 = metadata !{i32 25, i32 27, metadata !173, null}
!173 = metadata !{i32 589835, metadata !91, i32 25, i32 26, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!174 = metadata !{i32 590081, metadata !90, metadata !"this", metadata !1, i32 16777230, metadata !104, i32 64} ; [ DW_TAG_arg_variable ]
!175 = metadata !{i32 14, i32 15, metadata !90, null}
!176 = metadata !{i32 590081, metadata !90, metadata !"a", metadata !1, i32 33554446, metadata !177, i32 0} ; [ DW_TAG_arg_variable ]
!177 = metadata !{i32 589840, metadata !2, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !7} ; [ DW_TAG_reference_type ]
!178 = metadata !{i32 14, i32 27, metadata !90, null}
!179 = metadata !{i32 14, i32 31, metadata !180, null}
!180 = metadata !{i32 589835, metadata !90, i32 14, i32 30, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!181 = metadata !{i32 590081, metadata !89, metadata !"this", metadata !1, i32 16777242, metadata !112, i32 64} ; [ DW_TAG_arg_variable ]
!182 = metadata !{i32 26, i32 15, metadata !89, null}
!183 = metadata !{i32 26, i32 22, metadata !184, null}
!184 = metadata !{i32 589835, metadata !89, i32 26, i32 21, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!185 = metadata !{i32 590081, metadata !96, metadata !"this", metadata !1, i32 16777234, metadata !108, i32 64} ; [ DW_TAG_arg_variable ]
!186 = metadata !{i32 18, i32 15, metadata !96, null}
!187 = metadata !{i32 18, i32 22, metadata !188, null}
!188 = metadata !{i32 589835, metadata !96, i32 18, i32 21, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!189 = metadata !{i32 590081, metadata !99, metadata !"this", metadata !1, i32 16777227, metadata !104, i32 64} ; [ DW_TAG_arg_variable ]
!190 = metadata !{i32 11, i32 16, metadata !99, null}
!191 = metadata !{i32 11, i32 23, metadata !192, null}
!192 = metadata !{i32 589835, metadata !99, i32 11, i32 22, metadata !1, i32 11} ; [ DW_TAG_lexical_block ]
!193 = metadata !{i32 590081, metadata !98, metadata !"this", metadata !1, i32 16777228, metadata !104, i32 64} ; [ DW_TAG_arg_variable ]
!194 = metadata !{i32 12, i32 15, metadata !98, null}
!195 = metadata !{i32 590081, metadata !98, metadata !"x", metadata !1, i32 33554444, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!196 = metadata !{i32 12, i32 23, metadata !98, null}
!197 = metadata !{i32 12, i32 27, metadata !198, null}
!198 = metadata !{i32 589835, metadata !98, i32 12, i32 26, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
