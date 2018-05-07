; ModuleID = '2level_nesting_2.cpp'
source_filename = "2level_nesting_2.cpp"
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
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !11, metadata !DIExpression()), !dbg !13
  store i32 0, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i32, i32* %i, align 4, !dbg !15
  %cmp = icmp slt i32 %0, 100, !dbg !17
  br i1 %cmp, label %for.body, label %for.end15, !dbg !18

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !19, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %j, align 4, !dbg !22
  br label %for.cond1, !dbg !23

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !24
  %cmp2 = icmp slt i32 %1, 100, !dbg !26
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !27

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4, !dbg !28
  %mul = mul nsw i32 %2, 100, !dbg !30
  %3 = load i32, i32* %j, align 4, !dbg !31
  %add = add nsw i32 %mul, %3, !dbg !32
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add), !dbg !33
  br label %for.inc, !dbg !34

for.inc:                                          ; preds = %for.body3
  %4 = load i32, i32* %j, align 4, !dbg !35
  %inc = add nsw i32 %4, 1, !dbg !35
  store i32 %inc, i32* %j, align 4, !dbg !35
  br label %for.cond1, !dbg !36, !llvm.loop !37

for.end:                                          ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %k, metadata !39, metadata !DIExpression()), !dbg !41
  store i32 0, i32* %k, align 4, !dbg !41
  br label %for.cond4, !dbg !42

for.cond4:                                        ; preds = %for.inc10, %for.end
  %5 = load i32, i32* %k, align 4, !dbg !43
  %cmp5 = icmp slt i32 %5, 100, !dbg !45
  br i1 %cmp5, label %for.body6, label %for.end12, !dbg !46

for.body6:                                        ; preds = %for.cond4
  %6 = load i32, i32* %i, align 4, !dbg !47
  %mul7 = mul nsw i32 %6, 10000, !dbg !49
  %7 = load i32, i32* %k, align 4, !dbg !50
  %add8 = add nsw i32 %mul7, %7, !dbg !51
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add8), !dbg !52
  br label %for.inc10, !dbg !53

for.inc10:                                        ; preds = %for.body6
  %8 = load i32, i32* %k, align 4, !dbg !54
  %inc11 = add nsw i32 %8, 1, !dbg !54
  store i32 %inc11, i32* %k, align 4, !dbg !54
  br label %for.cond4, !dbg !55, !llvm.loop !56

for.end12:                                        ; preds = %for.cond4
  br label %for.inc13, !dbg !58

for.inc13:                                        ; preds = %for.end12
  %9 = load i32, i32* %i, align 4, !dbg !59
  %inc14 = add nsw i32 %9, 1, !dbg !59
  store i32 %inc14, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end15:                                        ; preds = %for.cond
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !63
  %10 = load i32, i32* %retval, align 4, !dbg !64
  ret i32 %10, !dbg !64
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
!1 = !DIFile(filename: "2level_nesting_2.cpp", directory: "/home/hlbs/Desktop/loopProfiler/testcasebasicones")
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
!28 = !DILocation(line: 9, column: 19, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 8, column: 3)
!30 = !DILocation(line: 9, column: 20, scope: !29)
!31 = !DILocation(line: 9, column: 25, scope: !29)
!32 = !DILocation(line: 9, column: 24, scope: !29)
!33 = !DILocation(line: 9, column: 4, scope: !29)
!34 = !DILocation(line: 10, column: 3, scope: !29)
!35 = !DILocation(line: 7, column: 22, scope: !25)
!36 = !DILocation(line: 7, column: 3, scope: !25)
!37 = distinct !{!37, !27, !38}
!38 = !DILocation(line: 10, column: 3, scope: !20)
!39 = !DILocalVariable(name: "k", scope: !40, file: !1, line: 11, type: !10)
!40 = distinct !DILexicalBlock(scope: !21, file: !1, line: 11, column: 3)
!41 = !DILocation(line: 11, column: 11, scope: !40)
!42 = !DILocation(line: 11, column: 7, scope: !40)
!43 = !DILocation(line: 11, column: 15, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 11, column: 3)
!45 = !DILocation(line: 11, column: 16, scope: !44)
!46 = !DILocation(line: 11, column: 3, scope: !40)
!47 = !DILocation(line: 13, column: 19, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 12, column: 3)
!49 = !DILocation(line: 13, column: 20, scope: !48)
!50 = !DILocation(line: 13, column: 27, scope: !48)
!51 = !DILocation(line: 13, column: 26, scope: !48)
!52 = !DILocation(line: 13, column: 4, scope: !48)
!53 = !DILocation(line: 14, column: 3, scope: !48)
!54 = !DILocation(line: 11, column: 22, scope: !44)
!55 = !DILocation(line: 11, column: 3, scope: !44)
!56 = distinct !{!56, !46, !57}
!57 = !DILocation(line: 14, column: 3, scope: !40)
!58 = !DILocation(line: 16, column: 2, scope: !21)
!59 = !DILocation(line: 5, column: 21, scope: !16)
!60 = !DILocation(line: 5, column: 2, scope: !16)
!61 = distinct !{!61, !18, !62}
!62 = !DILocation(line: 16, column: 2, scope: !12)
!63 = !DILocation(line: 17, column: 2, scope: !7)
!64 = !DILocation(line: 18, column: 1, scope: !7)
