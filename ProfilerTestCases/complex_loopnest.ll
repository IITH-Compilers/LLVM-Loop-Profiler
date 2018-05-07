; ModuleID = 'complex_loopnest.cpp'
source_filename = "complex_loopnest.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%d  \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %l17 = alloca i32, align 4
  %l32 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !11, metadata !DIExpression()), !dbg !13
  store i32 0, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.inc43, %entry
  %0 = load i32, i32* %i, align 4, !dbg !15
  %cmp = icmp slt i32 %0, 100, !dbg !17
  br i1 %cmp, label %for.body, label %for.end45, !dbg !18

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !19, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %j, align 4, !dbg !22
  br label %for.cond1, !dbg !23

for.cond1:                                        ; preds = %for.inc29, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !24
  %cmp2 = icmp slt i32 %1, 100, !dbg !26
  br i1 %cmp2, label %for.body3, label %for.end31, !dbg !27

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %k, metadata !28, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %k, align 4, !dbg !31
  br label %for.cond4, !dbg !32

for.cond4:                                        ; preds = %for.inc14, %for.body3
  %2 = load i32, i32* %k, align 4, !dbg !33
  %cmp5 = icmp slt i32 %2, 100, !dbg !35
  br i1 %cmp5, label %for.body6, label %for.end16, !dbg !36

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %l, metadata !37, metadata !DIExpression()), !dbg !40
  store i32 0, i32* %l, align 4, !dbg !40
  br label %for.cond7, !dbg !41

for.cond7:                                        ; preds = %for.inc, %for.body6
  %3 = load i32, i32* %l, align 4, !dbg !42
  %cmp8 = icmp slt i32 %3, 100, !dbg !44
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !45

for.body9:                                        ; preds = %for.cond7
  %4 = load i32, i32* %i, align 4, !dbg !46
  %mul = mul nsw i32 %4, 1000000, !dbg !48
  %5 = load i32, i32* %j, align 4, !dbg !49
  %mul10 = mul nsw i32 %5, 10000, !dbg !50
  %add = add nsw i32 %mul, %mul10, !dbg !51
  %6 = load i32, i32* %k, align 4, !dbg !52
  %mul11 = mul nsw i32 %6, 100, !dbg !53
  %add12 = add nsw i32 %add, %mul11, !dbg !54
  %7 = load i32, i32* %l, align 4, !dbg !55
  %add13 = add nsw i32 %add12, %7, !dbg !56
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add13), !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body9
  %8 = load i32, i32* %l, align 4, !dbg !59
  %inc = add nsw i32 %8, 1, !dbg !59
  store i32 %inc, i32* %l, align 4, !dbg !59
  br label %for.cond7, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond7
  br label %for.inc14, !dbg !63

for.inc14:                                        ; preds = %for.end
  %9 = load i32, i32* %k, align 4, !dbg !64
  %inc15 = add nsw i32 %9, 1, !dbg !64
  store i32 %inc15, i32* %k, align 4, !dbg !64
  br label %for.cond4, !dbg !65, !llvm.loop !66

for.end16:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %l17, metadata !68, metadata !DIExpression()), !dbg !70
  store i32 0, i32* %l17, align 4, !dbg !70
  br label %for.cond18, !dbg !71

for.cond18:                                       ; preds = %for.inc26, %for.end16
  %10 = load i32, i32* %l17, align 4, !dbg !72
  %cmp19 = icmp slt i32 %10, 100, !dbg !74
  br i1 %cmp19, label %for.body20, label %for.end28, !dbg !75

for.body20:                                       ; preds = %for.cond18
  %11 = load i32, i32* %i, align 4, !dbg !76
  %mul21 = mul nsw i32 %11, 1000000, !dbg !78
  %12 = load i32, i32* %j, align 4, !dbg !79
  %mul22 = mul nsw i32 %12, 10000, !dbg !80
  %add23 = add nsw i32 %mul21, %mul22, !dbg !81
  %13 = load i32, i32* %l17, align 4, !dbg !82
  %add24 = add nsw i32 %add23, %13, !dbg !83
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add24), !dbg !84
  br label %for.inc26, !dbg !85

for.inc26:                                        ; preds = %for.body20
  %14 = load i32, i32* %l17, align 4, !dbg !86
  %inc27 = add nsw i32 %14, 1, !dbg !86
  store i32 %inc27, i32* %l17, align 4, !dbg !86
  br label %for.cond18, !dbg !87, !llvm.loop !88

for.end28:                                        ; preds = %for.cond18
  br label %for.inc29, !dbg !90

for.inc29:                                        ; preds = %for.end28
  %15 = load i32, i32* %j, align 4, !dbg !91
  %inc30 = add nsw i32 %15, 1, !dbg !91
  store i32 %inc30, i32* %j, align 4, !dbg !91
  br label %for.cond1, !dbg !92, !llvm.loop !93

for.end31:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %l32, metadata !95, metadata !DIExpression()), !dbg !97
  store i32 0, i32* %l32, align 4, !dbg !97
  br label %for.cond33, !dbg !98

for.cond33:                                       ; preds = %for.inc40, %for.end31
  %16 = load i32, i32* %l32, align 4, !dbg !99
  %cmp34 = icmp slt i32 %16, 100, !dbg !101
  br i1 %cmp34, label %for.body35, label %for.end42, !dbg !102

for.body35:                                       ; preds = %for.cond33
  %17 = load i32, i32* %i, align 4, !dbg !103
  %mul36 = mul nsw i32 %17, 1000000, !dbg !105
  %add37 = add nsw i32 %mul36, 10000, !dbg !106
  %18 = load i32, i32* %l32, align 4, !dbg !107
  %add38 = add nsw i32 %add37, %18, !dbg !108
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add38), !dbg !109
  br label %for.inc40, !dbg !110

for.inc40:                                        ; preds = %for.body35
  %19 = load i32, i32* %l32, align 4, !dbg !111
  %inc41 = add nsw i32 %19, 1, !dbg !111
  store i32 %inc41, i32* %l32, align 4, !dbg !111
  br label %for.cond33, !dbg !112, !llvm.loop !113

for.end42:                                        ; preds = %for.cond33
  br label %for.inc43, !dbg !115

for.inc43:                                        ; preds = %for.end42
  %20 = load i32, i32* %i, align 4, !dbg !116
  %inc44 = add nsw i32 %20, 1, !dbg !116
  store i32 %inc44, i32* %i, align 4, !dbg !116
  br label %for.cond, !dbg !117, !llvm.loop !118

for.end45:                                        ; preds = %for.cond
  %call46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !120
  %21 = load i32, i32* %retval, align 4, !dbg !121
  ret i32 %21, !dbg !121
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 (http://llvm.org/git/clang.git bb7269ae797f282e27e47eb4ebedfa6abe826e9e) (http://llvm.org/git/llvm.git ea309d9184312ed25fa2422b781ad26350aa0ee5)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "complex_loopnest.cpp", directory: "/home/hlbs/Desktop/loopProfiler/testcasebasicones")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 7.0.0 (http://llvm.org/git/clang.git bb7269ae797f282e27e47eb4ebedfa6abe826e9e) (http://llvm.org/git/llvm.git ea309d9184312ed25fa2422b781ad26350aa0ee5)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, isLocal: false, isDefinition: true, scopeLine: 4, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "i", scope: !12, file: !1, line: 5, type: !10)
!12 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 2)
!13 = !DILocation(line: 5, column: 10, scope: !12)
!14 = !DILocation(line: 5, column: 6, scope: !12)
!15 = !DILocation(line: 5, column: 14, scope: !16)
!16 = distinct !DILexicalBlock(scope: !12, file: !1, line: 5, column: 2)
!17 = !DILocation(line: 5, column: 15, scope: !16)
!18 = !DILocation(line: 5, column: 2, scope: !12)
!19 = !DILocalVariable(name: "j", scope: !20, file: !1, line: 7, type: !10)
!20 = distinct !DILexicalBlock(scope: !21, file: !1, line: 7, column: 3)
!21 = distinct !DILexicalBlock(scope: !16, file: !1, line: 6, column: 2)
!22 = !DILocation(line: 7, column: 11, scope: !20)
!23 = !DILocation(line: 7, column: 7, scope: !20)
!24 = !DILocation(line: 7, column: 15, scope: !25)
!25 = distinct !DILexicalBlock(scope: !20, file: !1, line: 7, column: 3)
!26 = !DILocation(line: 7, column: 16, scope: !25)
!27 = !DILocation(line: 7, column: 3, scope: !20)
!28 = !DILocalVariable(name: "k", scope: !29, file: !1, line: 9, type: !10)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 9, column: 4)
!30 = distinct !DILexicalBlock(scope: !25, file: !1, line: 8, column: 3)
!31 = !DILocation(line: 9, column: 12, scope: !29)
!32 = !DILocation(line: 9, column: 8, scope: !29)
!33 = !DILocation(line: 9, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 9, column: 4)
!35 = !DILocation(line: 9, column: 17, scope: !34)
!36 = !DILocation(line: 9, column: 4, scope: !29)
!37 = !DILocalVariable(name: "l", scope: !38, file: !1, line: 11, type: !10)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 11, column: 5)
!39 = distinct !DILexicalBlock(scope: !34, file: !1, line: 10, column: 4)
!40 = !DILocation(line: 11, column: 13, scope: !38)
!41 = !DILocation(line: 11, column: 9, scope: !38)
!42 = !DILocation(line: 11, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !38, file: !1, line: 11, column: 5)
!44 = !DILocation(line: 11, column: 18, scope: !43)
!45 = !DILocation(line: 11, column: 5, scope: !38)
!46 = !DILocation(line: 13, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 12, column: 5)
!48 = !DILocation(line: 13, column: 22, scope: !47)
!49 = !DILocation(line: 13, column: 31, scope: !47)
!50 = !DILocation(line: 13, column: 32, scope: !47)
!51 = !DILocation(line: 13, column: 30, scope: !47)
!52 = !DILocation(line: 13, column: 39, scope: !47)
!53 = !DILocation(line: 13, column: 40, scope: !47)
!54 = !DILocation(line: 13, column: 38, scope: !47)
!55 = !DILocation(line: 13, column: 45, scope: !47)
!56 = !DILocation(line: 13, column: 44, scope: !47)
!57 = !DILocation(line: 13, column: 6, scope: !47)
!58 = !DILocation(line: 14, column: 5, scope: !47)
!59 = !DILocation(line: 11, column: 24, scope: !43)
!60 = !DILocation(line: 11, column: 5, scope: !43)
!61 = distinct !{!61, !45, !62}
!62 = !DILocation(line: 14, column: 5, scope: !38)
!63 = !DILocation(line: 15, column: 4, scope: !39)
!64 = !DILocation(line: 9, column: 23, scope: !34)
!65 = !DILocation(line: 9, column: 4, scope: !34)
!66 = distinct !{!66, !36, !67}
!67 = !DILocation(line: 15, column: 4, scope: !29)
!68 = !DILocalVariable(name: "l", scope: !69, file: !1, line: 16, type: !10)
!69 = distinct !DILexicalBlock(scope: !30, file: !1, line: 16, column: 4)
!70 = !DILocation(line: 16, column: 12, scope: !69)
!71 = !DILocation(line: 16, column: 8, scope: !69)
!72 = !DILocation(line: 16, column: 16, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !1, line: 16, column: 4)
!74 = !DILocation(line: 16, column: 17, scope: !73)
!75 = !DILocation(line: 16, column: 4, scope: !69)
!76 = !DILocation(line: 18, column: 20, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !1, line: 17, column: 4)
!78 = !DILocation(line: 18, column: 21, scope: !77)
!79 = !DILocation(line: 18, column: 30, scope: !77)
!80 = !DILocation(line: 18, column: 31, scope: !77)
!81 = !DILocation(line: 18, column: 29, scope: !77)
!82 = !DILocation(line: 18, column: 38, scope: !77)
!83 = !DILocation(line: 18, column: 37, scope: !77)
!84 = !DILocation(line: 18, column: 5, scope: !77)
!85 = !DILocation(line: 19, column: 4, scope: !77)
!86 = !DILocation(line: 16, column: 23, scope: !73)
!87 = !DILocation(line: 16, column: 4, scope: !73)
!88 = distinct !{!88, !75, !89}
!89 = !DILocation(line: 19, column: 4, scope: !69)
!90 = !DILocation(line: 20, column: 3, scope: !30)
!91 = !DILocation(line: 7, column: 22, scope: !25)
!92 = !DILocation(line: 7, column: 3, scope: !25)
!93 = distinct !{!93, !27, !94}
!94 = !DILocation(line: 20, column: 3, scope: !20)
!95 = !DILocalVariable(name: "l", scope: !96, file: !1, line: 21, type: !10)
!96 = distinct !DILexicalBlock(scope: !21, file: !1, line: 21, column: 3)
!97 = !DILocation(line: 21, column: 11, scope: !96)
!98 = !DILocation(line: 21, column: 7, scope: !96)
!99 = !DILocation(line: 21, column: 15, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !1, line: 21, column: 3)
!101 = !DILocation(line: 21, column: 16, scope: !100)
!102 = !DILocation(line: 21, column: 3, scope: !96)
!103 = !DILocation(line: 23, column: 19, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 22, column: 3)
!105 = !DILocation(line: 23, column: 20, scope: !104)
!106 = !DILocation(line: 23, column: 28, scope: !104)
!107 = !DILocation(line: 23, column: 35, scope: !104)
!108 = !DILocation(line: 23, column: 34, scope: !104)
!109 = !DILocation(line: 23, column: 4, scope: !104)
!110 = !DILocation(line: 24, column: 3, scope: !104)
!111 = !DILocation(line: 21, column: 22, scope: !100)
!112 = !DILocation(line: 21, column: 3, scope: !100)
!113 = distinct !{!113, !102, !114}
!114 = !DILocation(line: 24, column: 3, scope: !96)
!115 = !DILocation(line: 25, column: 2, scope: !21)
!116 = !DILocation(line: 5, column: 21, scope: !16)
!117 = !DILocation(line: 5, column: 2, scope: !16)
!118 = distinct !{!118, !18, !119}
!119 = !DILocation(line: 25, column: 2, scope: !12)
!120 = !DILocation(line: 26, column: 2, scope: !7)
!121 = !DILocation(line: 27, column: 1, scope: !7)
