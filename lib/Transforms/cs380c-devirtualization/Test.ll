; ModuleID = 'Test.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32 (...)**, i32 }
%struct.A.base.64 = type { i32 (...)**, i32 }
%struct.A2 = type { i32 (...)** }
%struct.B = type { %struct.A, %struct.A2 }
%struct.C = type { %struct.B }
%struct.D = type { %struct.C }
%struct.Z = type { i32 (...)**, i32 }
%struct.__base_class_type_info_pseudo = type { %"struct.std::type_info"*, i64 }
%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__si_class_type_info_pseudo = type { %struct.__type_info_pseudo, %"struct.std::type_info"* }
%struct.__type_info_pseudo = type { i8*, i8* }
%struct.__vmi_class_type_info_pseudo2 = type { %struct.__type_info_pseudo, i32, i32, [2 x %struct.__base_class_type_info_pseudo] }
%"struct.std::type_info" = type opaque

@_ZTV1A = external unnamed_addr constant [7 x i32 (...)*]
@_ZTV2A2 = weak_odr unnamed_addr constant [3 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__class_type_info_pseudo* @_ZTI2A2 to i32 (...)*), i32 (...)* bitcast (i32 (%struct.A2*)* @_ZN2A23gooEv to i32 (...)*)], align 16
@_ZTI2A2 = weak_odr unnamed_addr constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i64 add (i64 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i64), i64 16) to i8*), i8* getelementptr inbounds ([4 x i8]* @_ZTS2A2, i64 0, i64 0) } }, align 16
@_ZTVN10__cxxabiv117__class_type_infoE = external unnamed_addr constant [0 x i32 (...)*]
@_ZTS2A2 = weak_odr unnamed_addr constant [4 x i8] c"2A2\00"
@_ZTV1B = weak_odr unnamed_addr constant [11 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__vmi_class_type_info_pseudo2* @_ZTI1B to i32 (...)*), i32 (...)* bitcast (void (%struct.A*)* @_ZN1A3ahaEv to i32 (...)*), i32 (...)* bitcast (i8 (%struct.B*)* @_ZN1B3fooEv to i32 (...)*), i32 (...)* bitcast (i8 (%struct.B*, i8)* @_ZN1B3fooEc to i32 (...)*), i32 (...)* bitcast (i32 (%struct.B*, i32)* @_ZN1B3fooEi to i32 (...)*), i32 (...)* bitcast (i32 (%struct.A*, %struct.A*)* @_ZN1AplES_ to i32 (...)*), i32 (...)* bitcast (i32 (%struct.B*)* @_ZN1B3gooEv to i32 (...)*), i32 (...)* inttoptr (i64 -16 to i32 (...)*), i32 (...)* bitcast (%struct.__vmi_class_type_info_pseudo2* @_ZTI1B to i32 (...)*), i32 (...)* bitcast (i32 (%struct.B*)* @_ZThn16_N1B3gooEv to i32 (...)*)], align 32
@_ZTI1B = weak_odr unnamed_addr constant %struct.__vmi_class_type_info_pseudo2 { %struct.__type_info_pseudo { i8* inttoptr (i64 add (i64 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv121__vmi_class_type_infoE to i64), i64 16) to i8*), i8* getelementptr inbounds ([3 x i8]* @_ZTS1B, i64 0, i64 0) }, i32 0, i32 2, [2 x %struct.__base_class_type_info_pseudo] [%struct.__base_class_type_info_pseudo { %"struct.std::type_info"* bitcast (%struct.__class_type_info_pseudo* @_ZTI1A to %"struct.std::type_info"*), i64 2 }, %struct.__base_class_type_info_pseudo { %"struct.std::type_info"* bitcast (%struct.__class_type_info_pseudo* @_ZTI2A2 to %"struct.std::type_info"*), i64 4098 }] }, align 32
@_ZTVN10__cxxabiv121__vmi_class_type_infoE = external unnamed_addr constant [0 x i32 (...)*]
@_ZTS1B = weak_odr unnamed_addr constant [3 x i8] c"1B\00"
@_ZTI1A = external unnamed_addr constant %struct.__class_type_info_pseudo
@_ZTV1C = weak_odr unnamed_addr constant [11 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI1C to i32 (...)*), i32 (...)* bitcast (void (%struct.A*)* @_ZN1A3ahaEv to i32 (...)*), i32 (...)* bitcast (i8 (%struct.B*)* @_ZN1B3fooEv to i32 (...)*), i32 (...)* bitcast (i8 (%struct.B*, i8)* @_ZN1B3fooEc to i32 (...)*), i32 (...)* bitcast (i32 (%struct.B*, i32)* @_ZN1B3fooEi to i32 (...)*), i32 (...)* bitcast (i32 (%struct.A*, %struct.A*)* @_ZN1AplES_ to i32 (...)*), i32 (...)* bitcast (i32 (%struct.B*)* @_ZN1B3gooEv to i32 (...)*), i32 (...)* inttoptr (i64 -16 to i32 (...)*), i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI1C to i32 (...)*), i32 (...)* bitcast (i32 (%struct.B*)* @_ZThn16_N1B3gooEv to i32 (...)*)], align 32
@_ZTI1C = weak_odr unnamed_addr constant %struct.__si_class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i64 add (i64 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv120__si_class_type_infoE to i64), i64 16) to i8*), i8* getelementptr inbounds ([3 x i8]* @_ZTS1C, i64 0, i64 0) }, %"struct.std::type_info"* bitcast (%struct.__vmi_class_type_info_pseudo2* @_ZTI1B to %"struct.std::type_info"*) }, align 16
@_ZTVN10__cxxabiv120__si_class_type_infoE = external unnamed_addr constant [0 x i32 (...)*]
@_ZTS1C = weak_odr unnamed_addr constant [3 x i8] c"1C\00"
@_ZTV1D = weak_odr unnamed_addr constant [11 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI1D to i32 (...)*), i32 (...)* bitcast (void (%struct.A*)* @_ZN1A3ahaEv to i32 (...)*), i32 (...)* bitcast (i8 (%struct.D*)* @_ZN1D3fooEv to i32 (...)*), i32 (...)* bitcast (i8 (%struct.B*, i8)* @_ZN1B3fooEc to i32 (...)*), i32 (...)* bitcast (i32 (%struct.B*, i32)* @_ZN1B3fooEi to i32 (...)*), i32 (...)* bitcast (i32 (%struct.A*, %struct.A*)* @_ZN1AplES_ to i32 (...)*), i32 (...)* bitcast (i32 (%struct.B*)* @_ZN1B3gooEv to i32 (...)*), i32 (...)* inttoptr (i64 -16 to i32 (...)*), i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI1D to i32 (...)*), i32 (...)* bitcast (i32 (%struct.B*)* @_ZThn16_N1B3gooEv to i32 (...)*)], align 32
@_ZTI1D = weak_odr unnamed_addr constant %struct.__si_class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i64 add (i64 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv120__si_class_type_infoE to i64), i64 16) to i8*), i8* getelementptr inbounds ([3 x i8]* @_ZTS1D, i64 0, i64 0) }, %"struct.std::type_info"* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI1C to %"struct.std::type_info"*) }, align 16
@_ZTS1D = weak_odr unnamed_addr constant [3 x i8] c"1D\00"

@"*.LTHUNK0" = alias internal i32 (%struct.B*)* @_ZN1B3gooEv

define i32 @main() {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %1 = alloca %struct.D*
  %2 = alloca %struct.B*
  %3 = alloca %struct.A2*
  %4 = alloca %struct.A*
  %a = alloca %struct.A*
  %a2 = alloca %struct.A2*
  %b = alloca %struct.B*
  %d = alloca %struct.D*
  %x = alloca %struct.A*
  %z = alloca %struct.A*
  %c = alloca %struct.C*
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.A** %a}, metadata !111), !dbg !115
  call void @llvm.dbg.declare(metadata !{%struct.A2** %a2}, metadata !116), !dbg !118
  call void @llvm.dbg.declare(metadata !{%struct.B** %b}, metadata !119), !dbg !121
  call void @llvm.dbg.declare(metadata !{%struct.D** %d}, metadata !122), !dbg !124
  call void @llvm.dbg.declare(metadata !{%struct.A** %x}, metadata !125), !dbg !126
  call void @llvm.dbg.declare(metadata !{%struct.A** %z}, metadata !127), !dbg !129
  call void @llvm.dbg.declare(metadata !{%struct.C** %c}, metadata !130), !dbg !132
  %5 = call i8* @_Znwm(i64 16), !dbg !115
  %6 = bitcast i8* %5 to %struct.A*, !dbg !115
  store %struct.A* %6, %struct.A** %4, align 8, !dbg !115
  %7 = load %struct.A** %4, align 8, !dbg !115
  call void @_ZN1AC1Ei(%struct.A* %7, i32 1) nounwind, !dbg !115
  %8 = load %struct.A** %4, align 8, !dbg !115
  store %struct.A* %8, %struct.A** %a, align 8, !dbg !115
  %9 = call i8* @_Znwm(i64 8), !dbg !118
  %10 = bitcast i8* %9 to %struct.A2*, !dbg !118
  store %struct.A2* %10, %struct.A2** %3, align 8, !dbg !118
  %11 = load %struct.A2** %3, align 8, !dbg !118
  call void @_ZN2A2C1Ev(%struct.A2* %11) nounwind, !dbg !118
  %12 = load %struct.A2** %3, align 8, !dbg !118
  store %struct.A2* %12, %struct.A2** %a2, align 8, !dbg !118
  %13 = call i8* @_Znwm(i64 24), !dbg !121
  %14 = bitcast i8* %13 to %struct.B*, !dbg !121
  store %struct.B* %14, %struct.B** %2, align 8, !dbg !121
  %15 = load %struct.B** %2, align 8, !dbg !121
  call void @_ZN1BC1Ei(%struct.B* %15, i32 2) nounwind, !dbg !121
  %16 = load %struct.B** %2, align 8, !dbg !121
  store %struct.B* %16, %struct.B** %b, align 8, !dbg !121
  %17 = call i8* @_Znwm(i64 24), !dbg !124
  %18 = bitcast i8* %17 to %struct.D*, !dbg !124
  store %struct.D* %18, %struct.D** %1, align 8, !dbg !124
  %19 = load %struct.D** %1, align 8, !dbg !124
  call void @_ZN1DC1Ev(%struct.D* %19) nounwind, !dbg !124
  %20 = load %struct.D** %1, align 8, !dbg !124
  store %struct.D* %20, %struct.D** %d, align 8, !dbg !124
  %21 = load %struct.B** %b, align 8, !dbg !126
  %22 = bitcast %struct.B* %21 to %struct.A*, !dbg !126
  store %struct.A* %22, %struct.A** %x, align 8, !dbg !126
  %23 = load %struct.A** %a, align 8, !dbg !133
  %24 = getelementptr inbounds %struct.A* %23, i32 0, i32 0, !dbg !133
  %25 = load i32 (...)*** %24, align 8, !dbg !133
  %26 = getelementptr inbounds i32 (...)** %25, i64 0, !dbg !133
  %27 = load i32 (...)** %26, align 1, !dbg !133
  %28 = bitcast i32 (...)* %27 to void (%struct.A*)*, !dbg !133
  %29 = load %struct.A** %a, align 8, !dbg !133
  call void %28(%struct.A* %29), !dbg !133
  %30 = load %struct.D** %d, align 8, !dbg !134
  %31 = getelementptr inbounds %struct.D* %30, i32 0, i32 0, !dbg !134
  %32 = getelementptr inbounds %struct.C* %31, i32 0, i32 0, !dbg !134
  %33 = getelementptr inbounds %struct.B* %32, i32 0, i32 0, !dbg !134
  %34 = getelementptr inbounds %struct.A* %33, i32 0, i32 0, !dbg !134
  %35 = load i32 (...)*** %34, align 8, !dbg !134
  %36 = getelementptr inbounds i32 (...)** %35, i64 1, !dbg !134
  %37 = load i32 (...)** %36, align 1, !dbg !134
  %38 = bitcast i32 (...)* %37 to i8 (%struct.D*)*, !dbg !134
  %39 = load %struct.D** %d, align 8, !dbg !134
  %40 = call signext i8 %38(%struct.D* %39), !dbg !134
  %41 = load %struct.A** %a, align 8, !dbg !135
  %42 = bitcast %struct.A* %41 to i8*, !dbg !135
  call void @_ZdlPv(i8* %42) nounwind, !dbg !135
  %43 = load %struct.A2** %a2, align 8, !dbg !136
  %44 = bitcast %struct.A2* %43 to i8*, !dbg !136
  call void @_ZdlPv(i8* %44) nounwind, !dbg !136
  %45 = load %struct.B** %b, align 8, !dbg !137
  %46 = bitcast %struct.B* %45 to i8*, !dbg !137
  call void @_ZdlPv(i8* %46) nounwind, !dbg !137
  store i32 0, i32* %0, align 4, !dbg !138
  %47 = load i32* %0, align 4, !dbg !138
  store i32 %47, i32* %retval, align 4, !dbg !138
  br label %return, !dbg !138

return:                                           ; preds = %entry
  %retval1 = load i32* %retval, !dbg !138
  ret i32 %retval1, !dbg !138
}

define linkonce_odr void @_ZN1AC2Ei(%struct.A* %this, i32 %x) nounwind align 2 {
entry:
  %this_addr = alloca %struct.A*, align 8
  %x_addr = alloca i32, align 4
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.A** %this_addr}, metadata !139), !dbg !141
  store %struct.A* %this, %struct.A** %this_addr
  call void @llvm.dbg.declare(metadata !{i32* %x_addr}, metadata !142), !dbg !141
  store i32 %x, i32* %x_addr
  %0 = load %struct.A** %this_addr, align 8, !dbg !141
  %1 = getelementptr inbounds %struct.A* %0, i32 0, i32 0, !dbg !141
  store i32 (...)** getelementptr inbounds ([7 x i32 (...)*]* @_ZTV1A, i64 0, i64 2), i32 (...)*** %1, align 8, !dbg !141
  %2 = load %struct.A** %this_addr, align 8, !dbg !141
  %3 = getelementptr inbounds %struct.A* %2, i32 0, i32 1, !dbg !141
  %4 = load i32* %x_addr, align 4, !dbg !141
  store i32 %4, i32* %3, align 8, !dbg !141
  br label %return, !dbg !141

return:                                           ; preds = %entry
  ret void, !dbg !143
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define linkonce_odr void @_ZN1AC1Ei(%struct.A* %this, i32 %x) nounwind align 2 {
entry:
  %this_addr = alloca %struct.A*, align 8
  %x_addr = alloca i32, align 4
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.A** %this_addr}, metadata !146), !dbg !147
  store %struct.A* %this, %struct.A** %this_addr
  call void @llvm.dbg.declare(metadata !{i32* %x_addr}, metadata !148), !dbg !147
  store i32 %x, i32* %x_addr
  %0 = load %struct.A** %this_addr, align 8, !dbg !147
  %1 = getelementptr inbounds %struct.A* %0, i32 0, i32 0, !dbg !147
  store i32 (...)** getelementptr inbounds ([7 x i32 (...)*]* @_ZTV1A, i64 0, i64 2), i32 (...)*** %1, align 8, !dbg !147
  %2 = load %struct.A** %this_addr, align 8, !dbg !147
  %3 = getelementptr inbounds %struct.A* %2, i32 0, i32 1, !dbg !147
  %4 = load i32* %x_addr, align 4, !dbg !147
  store i32 %4, i32* %3, align 8, !dbg !147
  br label %return, !dbg !147

return:                                           ; preds = %entry
  ret void, !dbg !149
}

define linkonce_odr i32 @_ZN1AplES_(%struct.A* %this, %struct.A* noalias %a) nounwind align 2 {
entry:
  %this_addr = alloca %struct.A*, align 8
  %a_addr = alloca %struct.A*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.A** %this_addr}, metadata !152), !dbg !153
  store %struct.A* %this, %struct.A** %this_addr
  call void @llvm.dbg.declare(metadata !{%struct.A** %a_addr}, metadata !154), !dbg !153
  store %struct.A* %a, %struct.A** %a_addr
  store i32 3, i32* %0, align 4, !dbg !153
  %1 = load i32* %0, align 4, !dbg !153
  store i32 %1, i32* %retval, align 4, !dbg !153
  br label %return, !dbg !153

return:                                           ; preds = %entry
  %retval1 = load i32* %retval, !dbg !153
  ret i32 %retval1, !dbg !156
}

define linkonce_odr i32 @_ZN2A23gooEv(%struct.A2* %this) nounwind align 2 {
entry:
  %this_addr = alloca %struct.A2*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.A2** %this_addr}, metadata !158), !dbg !160
  store %struct.A2* %this, %struct.A2** %this_addr
  store i32 22, i32* %0, align 4, !dbg !160
  %1 = load i32* %0, align 4, !dbg !160
  store i32 %1, i32* %retval, align 4, !dbg !160
  br label %return, !dbg !160

return:                                           ; preds = %entry
  %retval1 = load i32* %retval, !dbg !160
  ret i32 %retval1, !dbg !161
}

define linkonce_odr void @_ZN2A2C2Ev(%struct.A2* %this) nounwind align 2 {
entry:
  %this_addr = alloca %struct.A2*, align 8
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.A2** %this_addr}, metadata !163), !dbg !164
  store %struct.A2* %this, %struct.A2** %this_addr
  %0 = load %struct.A2** %this_addr, align 8, !dbg !165
  %1 = getelementptr inbounds %struct.A2* %0, i32 0, i32 0, !dbg !165
  store i32 (...)** getelementptr inbounds ([3 x i32 (...)*]* @_ZTV2A2, i64 0, i64 2), i32 (...)*** %1, align 8, !dbg !165
  br label %return, !dbg !165

return:                                           ; preds = %entry
  ret void, !dbg !166
}

define linkonce_odr void @_ZN2A2C1Ev(%struct.A2* %this) nounwind align 2 {
entry:
  %this_addr = alloca %struct.A2*, align 8
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.A2** %this_addr}, metadata !169), !dbg !170
  store %struct.A2* %this, %struct.A2** %this_addr
  %0 = load %struct.A2** %this_addr, align 8, !dbg !171
  %1 = getelementptr inbounds %struct.A2* %0, i32 0, i32 0, !dbg !171
  store i32 (...)** getelementptr inbounds ([3 x i32 (...)*]* @_ZTV2A2, i64 0, i64 2), i32 (...)*** %1, align 8, !dbg !171
  br label %return, !dbg !171

return:                                           ; preds = %entry
  ret void, !dbg !172
}

define linkonce_odr void @_ZN1BC1Ei(%struct.B* %this, i32 %x) nounwind align 2 {
entry:
  %this_addr = alloca %struct.B*, align 8
  %x_addr = alloca i32, align 4
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.B** %this_addr}, metadata !175), !dbg !177
  store %struct.B* %this, %struct.B** %this_addr
  call void @llvm.dbg.declare(metadata !{i32* %x_addr}, metadata !178), !dbg !177
  store i32 %x, i32* %x_addr
  %0 = load %struct.B** %this_addr, align 8, !dbg !177
  %1 = getelementptr inbounds %struct.B* %0, i32 0, i32 0, !dbg !177
  %2 = load i32* %x_addr, align 4, !dbg !177
  call void @_ZN1AC2Ei(%struct.A* %1, i32 %2) nounwind, !dbg !177
  %3 = load %struct.B** %this_addr, align 8, !dbg !177
  %4 = getelementptr inbounds %struct.B* %3, i32 0, i32 1, !dbg !177
  call void @_ZN2A2C2Ev(%struct.A2* %4) nounwind, !dbg !177
  %5 = load %struct.B** %this_addr, align 8, !dbg !177
  %6 = getelementptr inbounds %struct.B* %5, i32 0, i32 0, !dbg !177
  %7 = getelementptr inbounds %struct.A* %6, i32 0, i32 0, !dbg !177
  store i32 (...)** getelementptr inbounds ([11 x i32 (...)*]* @_ZTV1B, i64 0, i64 2), i32 (...)*** %7, align 8, !dbg !177
  %8 = load %struct.B** %this_addr, align 8, !dbg !177
  %9 = getelementptr inbounds %struct.B* %8, i32 0, i32 1, !dbg !177
  %10 = getelementptr inbounds %struct.A2* %9, i32 0, i32 0, !dbg !177
  store i32 (...)** getelementptr inbounds ([11 x i32 (...)*]* @_ZTV1B, i64 0, i64 10), i32 (...)*** %10, align 8, !dbg !177
  br label %return, !dbg !177

return:                                           ; preds = %entry
  ret void, !dbg !179
}

declare void @_ZN1A3ahaEv(%struct.A*)

define linkonce_odr signext i8 @_ZN1B3fooEv(%struct.B* %this) nounwind align 2 {
entry:
  %this_addr = alloca %struct.B*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.B** %this_addr}, metadata !182), !dbg !183
  store %struct.B* %this, %struct.B** %this_addr
  store i32 66, i32* %0, align 4, !dbg !183
  %1 = load i32* %0, align 4, !dbg !183
  store i32 %1, i32* %retval, align 4, !dbg !183
  br label %return, !dbg !183

return:                                           ; preds = %entry
  %retval1 = load i32* %retval, !dbg !183
  %retval12 = trunc i32 %retval1 to i8, !dbg !183
  ret i8 %retval12, !dbg !184
}

define linkonce_odr signext i8 @_ZN1B3fooEc(%struct.B* %this, i8 signext %y) nounwind align 2 {
entry:
  %this_addr = alloca %struct.B*, align 8
  %y_addr = alloca i8, align 1
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.B** %this_addr}, metadata !186), !dbg !187
  store %struct.B* %this, %struct.B** %this_addr
  call void @llvm.dbg.declare(metadata !{i8* %y_addr}, metadata !188), !dbg !187
  store i8 %y, i8* %y_addr
  %1 = load i8* %y_addr, align 1, !dbg !187
  %2 = add i8 %1, 1, !dbg !187
  %3 = sext i8 %2 to i32, !dbg !187
  store i32 %3, i32* %0, align 4, !dbg !187
  %4 = load i32* %0, align 4, !dbg !187
  store i32 %4, i32* %retval, align 4, !dbg !187
  br label %return, !dbg !187

return:                                           ; preds = %entry
  %retval1 = load i32* %retval, !dbg !187
  %retval12 = trunc i32 %retval1 to i8, !dbg !187
  ret i8 %retval12, !dbg !189
}

define linkonce_odr i32 @_ZN1B3fooEi(%struct.B* %this, i32 %x) nounwind align 2 {
entry:
  %this_addr = alloca %struct.B*, align 8
  %x_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.B** %this_addr}, metadata !191), !dbg !192
  store %struct.B* %this, %struct.B** %this_addr
  call void @llvm.dbg.declare(metadata !{i32* %x_addr}, metadata !193), !dbg !192
  store i32 %x, i32* %x_addr
  %1 = load i32* %x_addr, align 4, !dbg !192
  %2 = mul nsw i32 %1, 3, !dbg !192
  store i32 %2, i32* %0, align 4, !dbg !192
  %3 = load i32* %0, align 4, !dbg !192
  store i32 %3, i32* %retval, align 4, !dbg !192
  br label %return, !dbg !192

return:                                           ; preds = %entry
  %retval1 = load i32* %retval, !dbg !192
  ret i32 %retval1, !dbg !194
}

define linkonce_odr i32 @_ZN1B3gooEv(%struct.B* %this) nounwind align 2 {
entry:
  %this_addr = alloca %struct.B*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.B** %this_addr}, metadata !196), !dbg !197
  store %struct.B* %this, %struct.B** %this_addr
  store i32 42, i32* %0, align 4, !dbg !197
  %1 = load i32* %0, align 4, !dbg !197
  store i32 %1, i32* %retval, align 4, !dbg !197
  br label %return, !dbg !197

return:                                           ; preds = %entry
  %retval1 = load i32* %retval, !dbg !197
  ret i32 %retval1, !dbg !198
}

define linkonce_odr i32 @_ZThn16_N1B3gooEv(%struct.B* %this) {
entry:
  %this_addr = alloca %struct.B*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store %struct.B* %this, %struct.B** %this_addr
  %1 = load %struct.B** %this_addr, align 8
  %2 = ptrtoint %struct.B* %1 to i64
  %3 = add i64 %2, -16
  %4 = inttoptr i64 %3 to %struct.B*
  %5 = call i32 @"*.LTHUNK0"(%struct.B* %4)
  store i32 %5, i32* %0, align 4
  %6 = load i32* %0, align 4
  store i32 %6, i32* %retval, align 4
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i32* %retval
  ret i32 %retval1
}

define linkonce_odr void @_ZN1BC2Ev(%struct.B* %this) nounwind align 2 {
entry:
  %this_addr = alloca %struct.B*, align 8
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.B** %this_addr}, metadata !200), !dbg !201
  store %struct.B* %this, %struct.B** %this_addr
  %0 = load %struct.B** %this_addr, align 8, !dbg !201
  %1 = getelementptr inbounds %struct.B* %0, i32 0, i32 0, !dbg !201
  call void @_ZN1AC2Ei(%struct.A* %1, i32 3) nounwind, !dbg !201
  %2 = load %struct.B** %this_addr, align 8, !dbg !201
  %3 = getelementptr inbounds %struct.B* %2, i32 0, i32 1, !dbg !201
  call void @_ZN2A2C2Ev(%struct.A2* %3) nounwind, !dbg !201
  %4 = load %struct.B** %this_addr, align 8, !dbg !201
  %5 = getelementptr inbounds %struct.B* %4, i32 0, i32 0, !dbg !201
  %6 = getelementptr inbounds %struct.A* %5, i32 0, i32 0, !dbg !201
  store i32 (...)** getelementptr inbounds ([11 x i32 (...)*]* @_ZTV1B, i64 0, i64 2), i32 (...)*** %6, align 8, !dbg !201
  %7 = load %struct.B** %this_addr, align 8, !dbg !201
  %8 = getelementptr inbounds %struct.B* %7, i32 0, i32 1, !dbg !201
  %9 = getelementptr inbounds %struct.A2* %8, i32 0, i32 0, !dbg !201
  store i32 (...)** getelementptr inbounds ([11 x i32 (...)*]* @_ZTV1B, i64 0, i64 10), i32 (...)*** %9, align 8, !dbg !201
  br label %return, !dbg !201

return:                                           ; preds = %entry
  ret void, !dbg !202
}

define linkonce_odr signext i8 @_ZN1D3fooEv(%struct.D* %this) nounwind align 2 {
entry:
  %this_addr = alloca %struct.D*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.D** %this_addr}, metadata !205), !dbg !207
  store %struct.D* %this, %struct.D** %this_addr
  store i32 68, i32* %0, align 4, !dbg !207
  %1 = load i32* %0, align 4, !dbg !207
  store i32 %1, i32* %retval, align 4, !dbg !207
  br label %return, !dbg !207

return:                                           ; preds = %entry
  %retval1 = load i32* %retval, !dbg !207
  %retval12 = trunc i32 %retval1 to i8, !dbg !207
  ret i8 %retval12, !dbg !208
}

define linkonce_odr void @_ZN1CC2Ev(%struct.C* %this) nounwind align 2 {
entry:
  %this_addr = alloca %struct.C*, align 8
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.C** %this_addr}, metadata !210), !dbg !212
  store %struct.C* %this, %struct.C** %this_addr
  %0 = load %struct.C** %this_addr, align 8, !dbg !213
  %1 = getelementptr inbounds %struct.C* %0, i32 0, i32 0, !dbg !213
  call void @_ZN1BC2Ev(%struct.B* %1) nounwind, !dbg !213
  %2 = load %struct.C** %this_addr, align 8, !dbg !213
  %3 = getelementptr inbounds %struct.C* %2, i32 0, i32 0, !dbg !213
  %4 = getelementptr inbounds %struct.B* %3, i32 0, i32 0, !dbg !213
  %5 = getelementptr inbounds %struct.A* %4, i32 0, i32 0, !dbg !213
  store i32 (...)** getelementptr inbounds ([11 x i32 (...)*]* @_ZTV1C, i64 0, i64 2), i32 (...)*** %5, align 8, !dbg !213
  %6 = load %struct.C** %this_addr, align 8, !dbg !213
  %7 = getelementptr inbounds %struct.C* %6, i32 0, i32 0, !dbg !213
  %8 = getelementptr inbounds %struct.B* %7, i32 0, i32 1, !dbg !213
  %9 = getelementptr inbounds %struct.A2* %8, i32 0, i32 0, !dbg !213
  store i32 (...)** getelementptr inbounds ([11 x i32 (...)*]* @_ZTV1C, i64 0, i64 10), i32 (...)*** %9, align 8, !dbg !213
  br label %return, !dbg !213

return:                                           ; preds = %entry
  ret void, !dbg !214
}

define linkonce_odr void @_ZN1DC1Ev(%struct.D* %this) nounwind align 2 {
entry:
  %this_addr = alloca %struct.D*, align 8
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{%struct.D** %this_addr}, metadata !217), !dbg !218
  store %struct.D* %this, %struct.D** %this_addr
  %0 = load %struct.D** %this_addr, align 8, !dbg !219
  %1 = getelementptr inbounds %struct.D* %0, i32 0, i32 0, !dbg !219
  call void @_ZN1CC2Ev(%struct.C* %1) nounwind, !dbg !219
  %2 = load %struct.D** %this_addr, align 8, !dbg !219
  %3 = getelementptr inbounds %struct.D* %2, i32 0, i32 0, !dbg !219
  %4 = getelementptr inbounds %struct.C* %3, i32 0, i32 0, !dbg !219
  %5 = getelementptr inbounds %struct.B* %4, i32 0, i32 0, !dbg !219
  %6 = getelementptr inbounds %struct.A* %5, i32 0, i32 0, !dbg !219
  store i32 (...)** getelementptr inbounds ([11 x i32 (...)*]* @_ZTV1D, i64 0, i64 2), i32 (...)*** %6, align 8, !dbg !219
  %7 = load %struct.D** %this_addr, align 8, !dbg !219
  %8 = getelementptr inbounds %struct.D* %7, i32 0, i32 0, !dbg !219
  %9 = getelementptr inbounds %struct.C* %8, i32 0, i32 0, !dbg !219
  %10 = getelementptr inbounds %struct.B* %9, i32 0, i32 1, !dbg !219
  %11 = getelementptr inbounds %struct.A2* %10, i32 0, i32 0, !dbg !219
  store i32 (...)** getelementptr inbounds ([11 x i32 (...)*]* @_ZTV1D, i64 0, i64 10), i32 (...)*** %11, align 8, !dbg !219
  br label %return, !dbg !219

return:                                           ; preds = %entry
  ret void, !dbg !220
}

declare i8* @_Znwm(i64)

declare void @_ZdlPv(i8*) nounwind

!llvm.dbg.sp = !{!0, !13, !17, !21, !24, !27, !28, !33, !34, !28, !35, !39, !39, !45, !46, !47, !52, !56, !59, !62, !65, !70, !71, !56, !59, !62, !65, !72, !79, !83, !83, !89, !90, !91, !92, !97, !101, !104}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A", metadata !"A", metadata !"", metadata !2, i32 15, metadata !31, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589843, metadata !2, metadata !"A", metadata !2, i32 12, i64 128, i64 64, i64 0, i32 0, null, metadata !4, i32 0, metadata !1} ; [ DW_TAG_structure_type ]
!2 = metadata !{i32 589865, metadata !"Test.cpp", metadata !"/home/vitor/llvm/lib/Transforms/cs380c-devirtualization/", metadata !3} ; [ DW_TAG_file_type ]
!3 = metadata !{i32 589841, i32 0, i32 4, metadata !"Test.cpp", metadata !"/home/vitor/llvm/lib/Transforms/cs380c-devirtualization/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{metadata !5, metadata !12, metadata !0, metadata !13, metadata !17, metadata !21, metadata !24, metadata !27, metadata !28}
!5 = metadata !{i32 589837, metadata !1, metadata !"_vptr.A", metadata !2, i32 12, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!6 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 589839, metadata !2, metadata !"__vtbl_ptr_type", metadata !8, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 589865, metadata !"<built-in>", metadata !"/home/vitor/llvm/lib/Transforms/cs380c-devirtualization/", metadata !3} ; [ DW_TAG_file_type ]
!9 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_subroutine_type ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 589860, metadata !2, metadata !"int", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 589837, metadata !1, metadata !"x", metadata !2, i32 14, i64 32, i64 32, i64 64, i32 0, metadata !11} ; [ DW_TAG_member ]
!13 = metadata !{i32 589870, i32 0, metadata !1, metadata !"aha", metadata !"aha", metadata !"_ZN1A3ahaEv", metadata !2, i32 16, metadata !14, i1 false, i1 false, i32 1, i32 0, metadata !1, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{null, metadata !16}
!16 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !1} ; [ DW_TAG_pointer_type ]
!17 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN1A3fooEv", metadata !2, i32 17, metadata !18, i1 false, i1 false, i32 1, i32 1, metadata !1, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{metadata !20, metadata !16}
!20 = metadata !{i32 589860, metadata !2, metadata !"char", metadata !2, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!21 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN1A3fooEc", metadata !2, i32 18, metadata !22, i1 false, i1 false, i32 1, i32 2, metadata !1, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!22 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null} ; [ DW_TAG_subroutine_type ]
!23 = metadata !{metadata !20, metadata !16, metadata !20}
!24 = metadata !{i32 589870, i32 0, metadata !1, metadata !"foo", metadata !"foo", metadata !"_ZN1A3fooEi", metadata !2, i32 19, metadata !25, i1 false, i1 false, i32 1, i32 3, metadata !1, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!25 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null} ; [ DW_TAG_subroutine_type ]
!26 = metadata !{metadata !11, metadata !16, metadata !11}
!27 = metadata !{i32 589870, i32 0, metadata !1, metadata !"nonvirt", metadata !"nonvirt", metadata !"_ZN1A7nonvirtEv", metadata !2, i32 20, metadata !14, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!28 = metadata !{i32 589870, i32 0, metadata !1, metadata !"operator+", metadata !"operator+", metadata !"_ZN1AplES_", metadata !2, i32 21, metadata !29, i1 false, i1 true, i32 1, i32 4, metadata !1, i32 256, i1 false, i32 (%struct.A*, %struct.A*)* @_ZN1AplES_} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{metadata !11, metadata !16, metadata !1}
!31 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null} ; [ DW_TAG_subroutine_type ]
!32 = metadata !{null, metadata !16, metadata !11}
!33 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A", metadata !"A", metadata !"_ZN1AC2Ei", metadata !2, i32 15, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.A*, i32)* @_ZN1AC2Ei} ; [ DW_TAG_subprogram ]
!34 = metadata !{i32 589870, i32 0, metadata !1, metadata !"A", metadata !"A", metadata !"_ZN1AC1Ei", metadata !2, i32 15, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.A*, i32)* @_ZN1AC1Ei} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 589870, i32 0, metadata !36, metadata !"A2", metadata !"A2", metadata !"", metadata !2, i32 23, metadata !43, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!36 = metadata !{i32 589843, metadata !2, metadata !"A2", metadata !2, i32 23, i64 64, i64 64, i64 0, i32 0, null, metadata !37, i32 0, metadata !36} ; [ DW_TAG_structure_type ]
!37 = metadata !{metadata !38, metadata !35, metadata !39}
!38 = metadata !{i32 589837, metadata !36, metadata !"_vptr.A2", metadata !2, i32 23, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!39 = metadata !{i32 589870, i32 0, metadata !36, metadata !"goo", metadata !"goo", metadata !"_ZN2A23gooEv", metadata !2, i32 25, metadata !40, i1 false, i1 true, i32 1, i32 0, metadata !36, i32 256, i1 false, i32 (%struct.A2*)* @_ZN2A23gooEv} ; [ DW_TAG_subprogram ]
!40 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, null} ; [ DW_TAG_subroutine_type ]
!41 = metadata !{metadata !11, metadata !42}
!42 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !36} ; [ DW_TAG_pointer_type ]
!43 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null} ; [ DW_TAG_subroutine_type ]
!44 = metadata !{null, metadata !42}
!45 = metadata !{i32 589870, i32 0, metadata !2, metadata !"A2", metadata !"A2", metadata !"_ZN2A2C2Ev", metadata !2, i32 23, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 64, i1 false, void (%struct.A2*)* @_ZN2A2C2Ev} ; [ DW_TAG_subprogram ]
!46 = metadata !{i32 589870, i32 0, metadata !2, metadata !"A2", metadata !"A2", metadata !"_ZN2A2C1Ev", metadata !2, i32 23, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 64, i1 false, void (%struct.A2*)* @_ZN2A2C1Ev} ; [ DW_TAG_subprogram ]
!47 = metadata !{i32 589870, i32 0, metadata !48, metadata !"B", metadata !"B", metadata !"", metadata !2, i32 29, metadata !68, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!48 = metadata !{i32 589843, metadata !2, metadata !"B", metadata !2, i32 27, i64 192, i64 64, i64 0, i32 0, null, metadata !49, i32 0, metadata !1} ; [ DW_TAG_structure_type ]
!49 = metadata !{metadata !50, metadata !51, metadata !47, metadata !52, metadata !56, metadata !59, metadata !62, metadata !65}
!50 = metadata !{i32 589852, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1} ; [ DW_TAG_inheritance ]
!51 = metadata !{i32 589852, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 128, i32 0, metadata !36} ; [ DW_TAG_inheritance ]
!52 = metadata !{i32 589870, i32 0, metadata !48, metadata !"B", metadata !"B", metadata !"", metadata !2, i32 30, metadata !53, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!53 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, null} ; [ DW_TAG_subroutine_type ]
!54 = metadata !{null, metadata !55}
!55 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !48} ; [ DW_TAG_pointer_type ]
!56 = metadata !{i32 589870, i32 0, metadata !48, metadata !"foo", metadata !"foo", metadata !"_ZN1B3fooEv", metadata !2, i32 31, metadata !57, i1 false, i1 true, i32 1, i32 1, metadata !48, i32 256, i1 false, i8 (%struct.B*)* @_ZN1B3fooEv} ; [ DW_TAG_subprogram ]
!57 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null} ; [ DW_TAG_subroutine_type ]
!58 = metadata !{metadata !20, metadata !55}
!59 = metadata !{i32 589870, i32 0, metadata !48, metadata !"foo", metadata !"foo", metadata !"_ZN1B3fooEc", metadata !2, i32 32, metadata !60, i1 false, i1 true, i32 1, i32 2, metadata !48, i32 256, i1 false, i8 (%struct.B*, i8)* @_ZN1B3fooEc} ; [ DW_TAG_subprogram ]
!60 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null} ; [ DW_TAG_subroutine_type ]
!61 = metadata !{metadata !20, metadata !55, metadata !20}
!62 = metadata !{i32 589870, i32 0, metadata !48, metadata !"foo", metadata !"foo", metadata !"_ZN1B3fooEi", metadata !2, i32 33, metadata !63, i1 false, i1 true, i32 1, i32 3, metadata !48, i32 256, i1 false, i32 (%struct.B*, i32)* @_ZN1B3fooEi} ; [ DW_TAG_subprogram ]
!63 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null} ; [ DW_TAG_subroutine_type ]
!64 = metadata !{metadata !11, metadata !55, metadata !11}
!65 = metadata !{i32 589870, i32 0, metadata !48, metadata !"goo", metadata !"goo", metadata !"_ZN1B3gooEv", metadata !2, i32 34, metadata !66, i1 false, i1 true, i32 1, i32 5, metadata !48, i32 256, i1 false, i32 (%struct.B*)* @_ZN1B3gooEv} ; [ DW_TAG_subprogram ]
!66 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !67, i32 0, null} ; [ DW_TAG_subroutine_type ]
!67 = metadata !{metadata !11, metadata !55}
!68 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !69, i32 0, null} ; [ DW_TAG_subroutine_type ]
!69 = metadata !{null, metadata !55, metadata !11}
!70 = metadata !{i32 589870, i32 0, metadata !48, metadata !"B", metadata !"B", metadata !"_ZN1BC1Ei", metadata !2, i32 29, metadata !68, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.B*, i32)* @_ZN1BC1Ei} ; [ DW_TAG_subprogram ]
!71 = metadata !{i32 589870, i32 0, metadata !48, metadata !"B", metadata !"B", metadata !"_ZN1BC2Ev", metadata !2, i32 30, metadata !53, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.B*)* @_ZN1BC2Ev} ; [ DW_TAG_subprogram ]
!72 = metadata !{i32 589870, i32 0, metadata !73, metadata !"C", metadata !"C", metadata !"", metadata !2, i32 36, metadata !76, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!73 = metadata !{i32 589843, metadata !2, metadata !"C", metadata !2, i32 36, i64 192, i64 64, i64 0, i32 0, null, metadata !74, i32 0, metadata !1} ; [ DW_TAG_structure_type ]
!74 = metadata !{metadata !75, metadata !72}
!75 = metadata !{i32 589852, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_inheritance ]
!76 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !77, i32 0, null} ; [ DW_TAG_subroutine_type ]
!77 = metadata !{null, metadata !78}
!78 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !73} ; [ DW_TAG_pointer_type ]
!79 = metadata !{i32 589870, i32 0, metadata !80, metadata !"D", metadata !"D", metadata !"", metadata !2, i32 38, metadata !87, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!80 = metadata !{i32 589843, metadata !2, metadata !"D", metadata !2, i32 38, i64 192, i64 64, i64 0, i32 0, null, metadata !81, i32 0, metadata !1} ; [ DW_TAG_structure_type ]
!81 = metadata !{metadata !82, metadata !79, metadata !83}
!82 = metadata !{i32 589852, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_inheritance ]
!83 = metadata !{i32 589870, i32 0, metadata !80, metadata !"foo", metadata !"foo", metadata !"_ZN1D3fooEv", metadata !2, i32 40, metadata !84, i1 false, i1 true, i32 1, i32 1, metadata !80, i32 256, i1 false, i8 (%struct.D*)* @_ZN1D3fooEv} ; [ DW_TAG_subprogram ]
!84 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !85, i32 0, null} ; [ DW_TAG_subroutine_type ]
!85 = metadata !{metadata !20, metadata !86}
!86 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !80} ; [ DW_TAG_pointer_type ]
!87 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !88, i32 0, null} ; [ DW_TAG_subroutine_type ]
!88 = metadata !{null, metadata !86}
!89 = metadata !{i32 589870, i32 0, metadata !2, metadata !"C", metadata !"C", metadata !"_ZN1CC2Ev", metadata !2, i32 36, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 64, i1 false, void (%struct.C*)* @_ZN1CC2Ev} ; [ DW_TAG_subprogram ]
!90 = metadata !{i32 589870, i32 0, metadata !2, metadata !"D", metadata !"D", metadata !"_ZN1DC1Ev", metadata !2, i32 38, metadata !87, i1 false, i1 true, i32 0, i32 0, null, i32 64, i1 false, void (%struct.D*)* @_ZN1DC1Ev} ; [ DW_TAG_subprogram ]
!91 = metadata !{i32 589870, i32 0, metadata !2, metadata !"main", metadata !"main", metadata !"main", metadata !2, i32 42, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main} ; [ DW_TAG_subprogram ]
!92 = metadata !{i32 589870, i32 0, metadata !93, metadata !"Z", metadata !"Z", metadata !"", metadata !2, i32 4, metadata !107, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null} ; [ DW_TAG_subprogram ]
!93 = metadata !{i32 589843, metadata !2, metadata !"Z", metadata !2, i32 4, i64 128, i64 64, i64 0, i32 0, null, metadata !94, i32 0, metadata !93} ; [ DW_TAG_structure_type ]
!94 = metadata !{metadata !95, metadata !96, metadata !92, metadata !97, metadata !101, metadata !104}
!95 = metadata !{i32 589837, metadata !93, metadata !"_vptr.Z", metadata !2, i32 4, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!96 = metadata !{i32 589837, metadata !93, metadata !"xx", metadata !2, i32 9, i64 32, i64 32, i64 64, i32 1, metadata !11} ; [ DW_TAG_member ]
!97 = metadata !{i32 589870, i32 0, metadata !93, metadata !"g", metadata !"g", metadata !"_ZN1Z1gEv", metadata !2, i32 6, metadata !98, i1 false, i1 false, i32 1, i32 0, metadata !93, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!98 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, null} ; [ DW_TAG_subroutine_type ]
!99 = metadata !{metadata !20, metadata !100}
!100 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !93} ; [ DW_TAG_pointer_type ]
!101 = metadata !{i32 589870, i32 0, metadata !93, metadata !"Create", metadata !"Create", metadata !"_ZN1Z6CreateEv", metadata !2, i32 7, metadata !102, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!102 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !103, i32 0, null} ; [ DW_TAG_subroutine_type ]
!103 = metadata !{metadata !93}
!104 = metadata !{i32 589870, i32 0, metadata !93, metadata !"Z", metadata !"Z", metadata !"", metadata !2, i32 10, metadata !105, i1 false, i1 false, i32 0, i32 0, null, i32 1, i1 false, null} ; [ DW_TAG_subprogram ]
!105 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !106, i32 0, null} ; [ DW_TAG_subroutine_type ]
!106 = metadata !{null, metadata !100}
!107 = metadata !{i32 589845, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null} ; [ DW_TAG_subroutine_type ]
!108 = metadata !{null, metadata !100, metadata !109}
!109 = metadata !{i32 589840, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_reference_type ]
!110 = metadata !{i32 589862, metadata !2, metadata !"", metadata !2, i32 0, i64 128, i64 64, i64 0, i32 0, metadata !93} ; [ DW_TAG_const_type ]
!111 = metadata !{i32 590080, metadata !112, metadata !"a", metadata !2, i32 43, metadata !114, i32 0} ; [ DW_TAG_auto_variable ]
!112 = metadata !{i32 589835, metadata !113, i32 42, i32 0, metadata !2, i32 24} ; [ DW_TAG_lexical_block ]
!113 = metadata !{i32 589835, metadata !91, i32 42, i32 0, metadata !2, i32 23} ; [ DW_TAG_lexical_block ]
!114 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1} ; [ DW_TAG_pointer_type ]
!115 = metadata !{i32 43, i32 0, metadata !112, null}
!116 = metadata !{i32 590080, metadata !112, metadata !"a2", metadata !2, i32 44, metadata !117, i32 0} ; [ DW_TAG_auto_variable ]
!117 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_pointer_type ]
!118 = metadata !{i32 44, i32 0, metadata !112, null}
!119 = metadata !{i32 590080, metadata !112, metadata !"b", metadata !2, i32 45, metadata !120, i32 0} ; [ DW_TAG_auto_variable ]
!120 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !48} ; [ DW_TAG_pointer_type ]
!121 = metadata !{i32 45, i32 0, metadata !112, null}
!122 = metadata !{i32 590080, metadata !112, metadata !"d", metadata !2, i32 46, metadata !123, i32 0} ; [ DW_TAG_auto_variable ]
!123 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_pointer_type ]
!124 = metadata !{i32 46, i32 0, metadata !112, null}
!125 = metadata !{i32 590080, metadata !112, metadata !"x", metadata !2, i32 47, metadata !114, i32 0} ; [ DW_TAG_auto_variable ]
!126 = metadata !{i32 47, i32 0, metadata !112, null}
!127 = metadata !{i32 590080, metadata !112, metadata !"z", metadata !2, i32 49, metadata !128, i32 0} ; [ DW_TAG_auto_variable ]
!128 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !93} ; [ DW_TAG_pointer_type ]
!129 = metadata !{i32 49, i32 0, metadata !112, null}
!130 = metadata !{i32 590080, metadata !112, metadata !"c", metadata !2, i32 50, metadata !131, i32 0} ; [ DW_TAG_auto_variable ]
!131 = metadata !{i32 589839, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !73} ; [ DW_TAG_pointer_type ]
!132 = metadata !{i32 50, i32 0, metadata !112, null}
!133 = metadata !{i32 48, i32 0, metadata !112, null}
!134 = metadata !{i32 51, i32 0, metadata !112, null}
!135 = metadata !{i32 55, i32 0, metadata !112, null}
!136 = metadata !{i32 56, i32 0, metadata !112, null}
!137 = metadata !{i32 57, i32 0, metadata !112, null}
!138 = metadata !{i32 58, i32 0, metadata !112, null}
!139 = metadata !{i32 590081, metadata !33, metadata !"this", metadata !2, i32 15, metadata !140, i32 0} ; [ DW_TAG_arg_variable ]
!140 = metadata !{i32 589862, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !114} ; [ DW_TAG_const_type ]
!141 = metadata !{i32 15, i32 0, metadata !33, null}
!142 = metadata !{i32 590081, metadata !33, metadata !"x", metadata !2, i32 15, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!143 = metadata !{i32 15, i32 0, metadata !144, null}
!144 = metadata !{i32 589835, metadata !145, i32 15, i32 0, metadata !2, i32 1} ; [ DW_TAG_lexical_block ]
!145 = metadata !{i32 589835, metadata !33, i32 15, i32 0, metadata !2, i32 0} ; [ DW_TAG_lexical_block ]
!146 = metadata !{i32 590081, metadata !34, metadata !"this", metadata !2, i32 15, metadata !140, i32 0} ; [ DW_TAG_arg_variable ]
!147 = metadata !{i32 15, i32 0, metadata !34, null}
!148 = metadata !{i32 590081, metadata !34, metadata !"x", metadata !2, i32 15, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!149 = metadata !{i32 15, i32 0, metadata !150, null}
!150 = metadata !{i32 589835, metadata !151, i32 15, i32 0, metadata !2, i32 3} ; [ DW_TAG_lexical_block ]
!151 = metadata !{i32 589835, metadata !34, i32 15, i32 0, metadata !2, i32 2} ; [ DW_TAG_lexical_block ]
!152 = metadata !{i32 590081, metadata !28, metadata !"this", metadata !2, i32 21, metadata !140, i32 0} ; [ DW_TAG_arg_variable ]
!153 = metadata !{i32 21, i32 0, metadata !28, null}
!154 = metadata !{i32 590081, metadata !28, metadata !"a", metadata !2, i32 21, metadata !155, i32 0} ; [ DW_TAG_arg_variable ]
!155 = metadata !{i32 589840, metadata !2, metadata !"A", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1} ; [ DW_TAG_reference_type ]
!156 = metadata !{i32 21, i32 0, metadata !157, null}
!157 = metadata !{i32 589835, metadata !28, i32 21, i32 0, metadata !2, i32 4} ; [ DW_TAG_lexical_block ]
!158 = metadata !{i32 590081, metadata !39, metadata !"this", metadata !2, i32 25, metadata !159, i32 0} ; [ DW_TAG_arg_variable ]
!159 = metadata !{i32 589862, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !117} ; [ DW_TAG_const_type ]
!160 = metadata !{i32 25, i32 0, metadata !39, null}
!161 = metadata !{i32 25, i32 0, metadata !162, null}
!162 = metadata !{i32 589835, metadata !39, i32 25, i32 0, metadata !2, i32 5} ; [ DW_TAG_lexical_block ]
!163 = metadata !{i32 590081, metadata !45, metadata !"this", metadata !2, i32 29, metadata !159, i32 0} ; [ DW_TAG_arg_variable ]
!164 = metadata !{i32 29, i32 0, metadata !45, null}
!165 = metadata !{i32 23, i32 0, metadata !45, null}
!166 = metadata !{i32 23, i32 0, metadata !167, null}
!167 = metadata !{i32 589835, metadata !168, i32 23, i32 0, metadata !2, i32 7} ; [ DW_TAG_lexical_block ]
!168 = metadata !{i32 589835, metadata !45, i32 23, i32 0, metadata !2, i32 6} ; [ DW_TAG_lexical_block ]
!169 = metadata !{i32 590081, metadata !46, metadata !"this", metadata !2, i32 29, metadata !159, i32 0} ; [ DW_TAG_arg_variable ]
!170 = metadata !{i32 29, i32 0, metadata !46, null}
!171 = metadata !{i32 23, i32 0, metadata !46, null}
!172 = metadata !{i32 23, i32 0, metadata !173, null}
!173 = metadata !{i32 589835, metadata !174, i32 23, i32 0, metadata !2, i32 9} ; [ DW_TAG_lexical_block ]
!174 = metadata !{i32 589835, metadata !46, i32 23, i32 0, metadata !2, i32 8} ; [ DW_TAG_lexical_block ]
!175 = metadata !{i32 590081, metadata !70, metadata !"this", metadata !2, i32 29, metadata !176, i32 0} ; [ DW_TAG_arg_variable ]
!176 = metadata !{i32 589862, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !120} ; [ DW_TAG_const_type ]
!177 = metadata !{i32 29, i32 0, metadata !70, null}
!178 = metadata !{i32 590081, metadata !70, metadata !"x", metadata !2, i32 29, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!179 = metadata !{i32 29, i32 0, metadata !180, null}
!180 = metadata !{i32 589835, metadata !181, i32 29, i32 0, metadata !2, i32 11} ; [ DW_TAG_lexical_block ]
!181 = metadata !{i32 589835, metadata !70, i32 29, i32 0, metadata !2, i32 10} ; [ DW_TAG_lexical_block ]
!182 = metadata !{i32 590081, metadata !56, metadata !"this", metadata !2, i32 31, metadata !176, i32 0} ; [ DW_TAG_arg_variable ]
!183 = metadata !{i32 31, i32 0, metadata !56, null}
!184 = metadata !{i32 31, i32 0, metadata !185, null}
!185 = metadata !{i32 589835, metadata !56, i32 31, i32 0, metadata !2, i32 14} ; [ DW_TAG_lexical_block ]
!186 = metadata !{i32 590081, metadata !59, metadata !"this", metadata !2, i32 32, metadata !176, i32 0} ; [ DW_TAG_arg_variable ]
!187 = metadata !{i32 32, i32 0, metadata !59, null}
!188 = metadata !{i32 590081, metadata !59, metadata !"y", metadata !2, i32 32, metadata !20, i32 0} ; [ DW_TAG_arg_variable ]
!189 = metadata !{i32 32, i32 0, metadata !190, null}
!190 = metadata !{i32 589835, metadata !59, i32 32, i32 0, metadata !2, i32 15} ; [ DW_TAG_lexical_block ]
!191 = metadata !{i32 590081, metadata !62, metadata !"this", metadata !2, i32 33, metadata !176, i32 0} ; [ DW_TAG_arg_variable ]
!192 = metadata !{i32 33, i32 0, metadata !62, null}
!193 = metadata !{i32 590081, metadata !62, metadata !"x", metadata !2, i32 33, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!194 = metadata !{i32 33, i32 0, metadata !195, null}
!195 = metadata !{i32 589835, metadata !62, i32 33, i32 0, metadata !2, i32 16} ; [ DW_TAG_lexical_block ]
!196 = metadata !{i32 590081, metadata !65, metadata !"this", metadata !2, i32 34, metadata !176, i32 0} ; [ DW_TAG_arg_variable ]
!197 = metadata !{i32 34, i32 0, metadata !65, null}
!198 = metadata !{i32 34, i32 0, metadata !199, null}
!199 = metadata !{i32 589835, metadata !65, i32 34, i32 0, metadata !2, i32 17} ; [ DW_TAG_lexical_block ]
!200 = metadata !{i32 590081, metadata !71, metadata !"this", metadata !2, i32 30, metadata !176, i32 0} ; [ DW_TAG_arg_variable ]
!201 = metadata !{i32 30, i32 0, metadata !71, null}
!202 = metadata !{i32 30, i32 0, metadata !203, null}
!203 = metadata !{i32 589835, metadata !204, i32 30, i32 0, metadata !2, i32 13} ; [ DW_TAG_lexical_block ]
!204 = metadata !{i32 589835, metadata !71, i32 30, i32 0, metadata !2, i32 12} ; [ DW_TAG_lexical_block ]
!205 = metadata !{i32 590081, metadata !83, metadata !"this", metadata !2, i32 40, metadata !206, i32 0} ; [ DW_TAG_arg_variable ]
!206 = metadata !{i32 589862, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !123} ; [ DW_TAG_const_type ]
!207 = metadata !{i32 40, i32 0, metadata !83, null}
!208 = metadata !{i32 40, i32 0, metadata !209, null}
!209 = metadata !{i32 589835, metadata !83, i32 40, i32 0, metadata !2, i32 18} ; [ DW_TAG_lexical_block ]
!210 = metadata !{i32 590081, metadata !89, metadata !"this", metadata !2, i32 46, metadata !211, i32 0} ; [ DW_TAG_arg_variable ]
!211 = metadata !{i32 589862, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !131} ; [ DW_TAG_const_type ]
!212 = metadata !{i32 46, i32 0, metadata !89, null}
!213 = metadata !{i32 36, i32 0, metadata !89, null}
!214 = metadata !{i32 36, i32 0, metadata !215, null}
!215 = metadata !{i32 589835, metadata !216, i32 36, i32 0, metadata !2, i32 20} ; [ DW_TAG_lexical_block ]
!216 = metadata !{i32 589835, metadata !89, i32 36, i32 0, metadata !2, i32 19} ; [ DW_TAG_lexical_block ]
!217 = metadata !{i32 590081, metadata !90, metadata !"this", metadata !2, i32 46, metadata !206, i32 0} ; [ DW_TAG_arg_variable ]
!218 = metadata !{i32 46, i32 0, metadata !90, null}
!219 = metadata !{i32 38, i32 0, metadata !90, null}
!220 = metadata !{i32 38, i32 0, metadata !221, null}
!221 = metadata !{i32 589835, metadata !222, i32 38, i32 0, metadata !2, i32 22} ; [ DW_TAG_lexical_block ]
!222 = metadata !{i32 589835, metadata !90, i32 38, i32 0, metadata !2, i32 21} ; [ DW_TAG_lexical_block ]
