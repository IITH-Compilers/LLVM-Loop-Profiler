; ModuleID = '4level_nesting.cpp'
source_filename = "4level_nesting.cpp"
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
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !11, metadata !DIExpression()), !dbg !13
  store i32 0, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i32, i32* %i, align 4, !dbg !15
  %cmp = icmp slt i32 %0, 100, !dbg !17
  br i1 %cmp, label %for.body, label %for.end22, !dbg !18

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !19, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %j, align 4, !dbg !22
  br label %for.cond1, !dbg !23

for.cond1:                                        ; preds = %for.inc17, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !24
  %cmp2 = icmp slt i32 %1, 100, !dbg !26
  br i1 %cmp2, label %for.body3, label %for.end19, !dbg !27

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
  br label %for.inc17, !dbg !68

for.inc17:                                        ; preds = %for.end16
  %10 = load i32, i32* %j, align 4, !dbg !69
  %inc18 = add nsw i32 %10, 1, !dbg !69
  store i32 %inc18, i32* %j, align 4, !dbg !69
  br label %for.cond1, !dbg !70, !llvm.loop !71

for.end19:                                        ; preds = %for.cond1
  br label %for.inc20, !dbg !73

for.inc20:                                        ; preds = %for.end19
  %11 = load i32, i32* %i, align 4, !dbg !74
  %inc21 = add nsw i32 %11, 1, !dbg !74
  store i32 %inc21, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end22:                                        ; preds = %for.cond
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !78
  %12 = load i32, i32* %retval, align 4, !dbg !79
  ret i32 %12, !dbg !79
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
!1 = !DIFile(filename: "4level_nesting.cpp", directory: "/home/hlbs/Desktop/loopProfiler/testcasebasicones")
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
!68 = !DILocation(line: 16, column: 3, scope: !30)
!69 = !DILocation(line: 7, column: 22, scope: !25)
!70 = !DILocation(line: 7, column: 3, scope: !25)
!71 = distinct !{!71, !27, !72}
!72 = !DILocation(line: 16, column: 3, scope: !20)
!73 = !DILocation(line: 17, column: 2, scope: !21)
!74 = !DILocation(line: 5, column: 21, scope: !16)
!75 = !DILocation(line: 5, column: 2, scope: !16)
!76 = distinct !{!76, !18, !77}
!77 = !DILocation(line: 17, column: 2, scope: !12)
!78 = !DILocation(line: 18, column: 2, scope: !7)
!79 = !DILocation(line: 19, column: 1, scope: !7)
