; ModuleID = 'nested_while.cpp'
source_filename = "nested_while.cpp"
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
  %m = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 0, i32* %i, align 4, !dbg !12
  call void @llvm.dbg.declare(metadata i32* %j, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 0, i32* %j, align 4, !dbg !14
  call void @llvm.dbg.declare(metadata i32* %k, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %k, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %l, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %l, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %m, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %m, align 4, !dbg !20
  br label %while.cond, !dbg !21

while.cond:                                       ; preds = %while.end33, %entry
  %0 = load i32, i32* %i, align 4, !dbg !22
  %cmp = icmp slt i32 %0, 100, !dbg !23
  br i1 %cmp, label %while.body, label %while.end34, !dbg !21

while.body:                                       ; preds = %while.cond
  br label %while.cond1, !dbg !24

while.cond1:                                      ; preds = %while.end23, %while.body
  %1 = load i32, i32* %j, align 4, !dbg !26
  %cmp2 = icmp slt i32 %1, 100, !dbg !27
  br i1 %cmp2, label %while.body3, label %while.end24, !dbg !24

while.body3:                                      ; preds = %while.cond1
  br label %while.cond4, !dbg !28

while.cond4:                                      ; preds = %while.end, %while.body3
  %2 = load i32, i32* %k, align 4, !dbg !30
  %cmp5 = icmp slt i32 %2, 100, !dbg !31
  br i1 %cmp5, label %while.body6, label %while.end14, !dbg !28

while.body6:                                      ; preds = %while.cond4
  br label %while.cond7, !dbg !32

while.cond7:                                      ; preds = %while.body9, %while.body6
  %3 = load i32, i32* %l, align 4, !dbg !34
  %cmp8 = icmp slt i32 %3, 100, !dbg !35
  br i1 %cmp8, label %while.body9, label %while.end, !dbg !32

while.body9:                                      ; preds = %while.cond7
  %4 = load i32, i32* %i, align 4, !dbg !36
  %mul = mul nsw i32 %4, 1000000, !dbg !38
  %5 = load i32, i32* %j, align 4, !dbg !39
  %mul10 = mul nsw i32 %5, 10000, !dbg !40
  %add = add nsw i32 %mul, %mul10, !dbg !41
  %6 = load i32, i32* %k, align 4, !dbg !42
  %mul11 = mul nsw i32 %6, 100, !dbg !43
  %add12 = add nsw i32 %add, %mul11, !dbg !44
  %7 = load i32, i32* %l, align 4, !dbg !45
  %add13 = add nsw i32 %add12, %7, !dbg !46
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add13), !dbg !47
  br label %while.cond7, !dbg !32, !llvm.loop !48

while.end:                                        ; preds = %while.cond7
  br label %while.cond4, !dbg !28, !llvm.loop !50

while.end14:                                      ; preds = %while.cond4
  br label %while.cond15, !dbg !52

while.cond15:                                     ; preds = %while.body17, %while.end14
  %8 = load i32, i32* %l, align 4, !dbg !53
  %cmp16 = icmp slt i32 %8, 100, !dbg !54
  br i1 %cmp16, label %while.body17, label %while.end23, !dbg !52

while.body17:                                     ; preds = %while.cond15
  %9 = load i32, i32* %i, align 4, !dbg !55
  %mul18 = mul nsw i32 %9, 1000000, !dbg !57
  %10 = load i32, i32* %j, align 4, !dbg !58
  %mul19 = mul nsw i32 %10, 10000, !dbg !59
  %add20 = add nsw i32 %mul18, %mul19, !dbg !60
  %11 = load i32, i32* %l, align 4, !dbg !61
  %add21 = add nsw i32 %add20, %11, !dbg !62
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add21), !dbg !63
  br label %while.cond15, !dbg !52, !llvm.loop !64

while.end23:                                      ; preds = %while.cond15
  br label %while.cond1, !dbg !24, !llvm.loop !66

while.end24:                                      ; preds = %while.cond1
  br label %while.cond25, !dbg !68

while.cond25:                                     ; preds = %while.body27, %while.end24
  %12 = load i32, i32* %l, align 4, !dbg !69
  %cmp26 = icmp slt i32 %12, 100, !dbg !70
  br i1 %cmp26, label %while.body27, label %while.end33, !dbg !68

while.body27:                                     ; preds = %while.cond25
  %13 = load i32, i32* %i, align 4, !dbg !71
  %mul28 = mul nsw i32 %13, 1000000, !dbg !73
  %14 = load i32, i32* %j, align 4, !dbg !74
  %mul29 = mul nsw i32 %14, 10000, !dbg !75
  %add30 = add nsw i32 %mul28, %mul29, !dbg !76
  %15 = load i32, i32* %l, align 4, !dbg !77
  %add31 = add nsw i32 %add30, %15, !dbg !78
  %call32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add31), !dbg !79
  br label %while.cond25, !dbg !68, !llvm.loop !80

while.end33:                                      ; preds = %while.cond25
  br label %while.cond, !dbg !21, !llvm.loop !82

while.end34:                                      ; preds = %while.cond
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !84
  %16 = load i32, i32* %retval, align 4, !dbg !85
  ret i32 %16, !dbg !85
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
!1 = !DIFile(filename: "nested_while.cpp", directory: "/home/hlbs/Desktop/loopProfiler/testcasebasicones")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 7.0.0 (http://llvm.org/git/clang.git bb7269ae797f282e27e47eb4ebedfa6abe826e9e) (http://llvm.org/git/llvm.git ea309d9184312ed25fa2422b781ad26350aa0ee5)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, isLocal: false, isDefinition: true, scopeLine: 4, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 6, scope: !7)
!13 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 5, column: 11, scope: !7)
!15 = !DILocalVariable(name: "k", scope: !7, file: !1, line: 5, type: !10)
!16 = !DILocation(line: 5, column: 16, scope: !7)
!17 = !DILocalVariable(name: "l", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 5, column: 21, scope: !7)
!19 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 5, type: !10)
!20 = !DILocation(line: 5, column: 26, scope: !7)
!21 = !DILocation(line: 6, column: 2, scope: !7)
!22 = !DILocation(line: 6, column: 8, scope: !7)
!23 = !DILocation(line: 6, column: 9, scope: !7)
!24 = !DILocation(line: 8, column: 3, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 2)
!26 = !DILocation(line: 8, column: 9, scope: !25)
!27 = !DILocation(line: 8, column: 10, scope: !25)
!28 = !DILocation(line: 10, column: 4, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 9, column: 3)
!30 = !DILocation(line: 10, column: 10, scope: !29)
!31 = !DILocation(line: 10, column: 11, scope: !29)
!32 = !DILocation(line: 12, column: 5, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !1, line: 11, column: 4)
!34 = !DILocation(line: 12, column: 11, scope: !33)
!35 = !DILocation(line: 12, column: 12, scope: !33)
!36 = !DILocation(line: 14, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !1, line: 13, column: 5)
!38 = !DILocation(line: 14, column: 22, scope: !37)
!39 = !DILocation(line: 14, column: 31, scope: !37)
!40 = !DILocation(line: 14, column: 32, scope: !37)
!41 = !DILocation(line: 14, column: 30, scope: !37)
!42 = !DILocation(line: 14, column: 39, scope: !37)
!43 = !DILocation(line: 14, column: 40, scope: !37)
!44 = !DILocation(line: 14, column: 38, scope: !37)
!45 = !DILocation(line: 14, column: 45, scope: !37)
!46 = !DILocation(line: 14, column: 44, scope: !37)
!47 = !DILocation(line: 14, column: 6, scope: !37)
!48 = distinct !{!48, !32, !49}
!49 = !DILocation(line: 15, column: 5, scope: !33)
!50 = distinct !{!50, !28, !51}
!51 = !DILocation(line: 16, column: 4, scope: !29)
!52 = !DILocation(line: 17, column: 4, scope: !29)
!53 = !DILocation(line: 17, column: 10, scope: !29)
!54 = !DILocation(line: 17, column: 11, scope: !29)
!55 = !DILocation(line: 19, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !29, file: !1, line: 18, column: 4)
!57 = !DILocation(line: 19, column: 21, scope: !56)
!58 = !DILocation(line: 19, column: 30, scope: !56)
!59 = !DILocation(line: 19, column: 31, scope: !56)
!60 = !DILocation(line: 19, column: 29, scope: !56)
!61 = !DILocation(line: 19, column: 38, scope: !56)
!62 = !DILocation(line: 19, column: 37, scope: !56)
!63 = !DILocation(line: 19, column: 5, scope: !56)
!64 = distinct !{!64, !52, !65}
!65 = !DILocation(line: 20, column: 4, scope: !29)
!66 = distinct !{!66, !24, !67}
!67 = !DILocation(line: 21, column: 3, scope: !25)
!68 = !DILocation(line: 22, column: 3, scope: !25)
!69 = !DILocation(line: 22, column: 9, scope: !25)
!70 = !DILocation(line: 22, column: 10, scope: !25)
!71 = !DILocation(line: 24, column: 19, scope: !72)
!72 = distinct !DILexicalBlock(scope: !25, file: !1, line: 23, column: 3)
!73 = !DILocation(line: 24, column: 20, scope: !72)
!74 = !DILocation(line: 24, column: 29, scope: !72)
!75 = !DILocation(line: 24, column: 30, scope: !72)
!76 = !DILocation(line: 24, column: 28, scope: !72)
!77 = !DILocation(line: 24, column: 37, scope: !72)
!78 = !DILocation(line: 24, column: 36, scope: !72)
!79 = !DILocation(line: 24, column: 4, scope: !72)
!80 = distinct !{!80, !68, !81}
!81 = !DILocation(line: 25, column: 3, scope: !25)
!82 = distinct !{!82, !21, !83}
!83 = !DILocation(line: 26, column: 2, scope: !7)
!84 = !DILocation(line: 27, column: 2, scope: !7)
!85 = !DILocation(line: 28, column: 1, scope: !7)
