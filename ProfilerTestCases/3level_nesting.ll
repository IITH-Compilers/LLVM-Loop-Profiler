; ModuleID = '3level_nesting.cpp'
source_filename = "3level_nesting.cpp"
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

for.cond:                                         ; preds = %for.inc12, %entry
  %0 = load i32, i32* %i, align 4, !dbg !15
  %cmp = icmp slt i32 %0, 100, !dbg !17
  br i1 %cmp, label %for.body, label %for.end14, !dbg !18

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !19, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %j, align 4, !dbg !22
  br label %for.cond1, !dbg !23

for.cond1:                                        ; preds = %for.inc9, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !24
  %cmp2 = icmp slt i32 %1, 100, !dbg !26
  br i1 %cmp2, label %for.body3, label %for.end11, !dbg !27

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %k, metadata !28, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %k, align 4, !dbg !31
  br label %for.cond4, !dbg !32

for.cond4:                                        ; preds = %for.inc, %for.body3
  %2 = load i32, i32* %k, align 4, !dbg !33
  %cmp5 = icmp slt i32 %2, 100, !dbg !35
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !36

for.body6:                                        ; preds = %for.cond4
  %3 = load i32, i32* %i, align 4, !dbg !37
  %mul = mul nsw i32 %3, 10000, !dbg !39
  %4 = load i32, i32* %j, align 4, !dbg !40
  %mul7 = mul nsw i32 %4, 100, !dbg !41
  %add = add nsw i32 %mul, %mul7, !dbg !42
  %5 = load i32, i32* %k, align 4, !dbg !43
  %add8 = add nsw i32 %add, %5, !dbg !44
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add8), !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body6
  %6 = load i32, i32* %k, align 4, !dbg !47
  %inc = add nsw i32 %6, 1, !dbg !47
  store i32 %inc, i32* %k, align 4, !dbg !47
  br label %for.cond4, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond4
  br label %for.inc9, !dbg !51

for.inc9:                                         ; preds = %for.end
  %7 = load i32, i32* %j, align 4, !dbg !52
  %inc10 = add nsw i32 %7, 1, !dbg !52
  store i32 %inc10, i32* %j, align 4, !dbg !52
  br label %for.cond1, !dbg !53, !llvm.loop !54

for.end11:                                        ; preds = %for.cond1
  br label %for.inc12, !dbg !56

for.inc12:                                        ; preds = %for.end11
  %8 = load i32, i32* %i, align 4, !dbg !57
  %inc13 = add nsw i32 %8, 1, !dbg !57
  store i32 %inc13, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end14:                                        ; preds = %for.cond
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !61
  %9 = load i32, i32* %retval, align 4, !dbg !62
  ret i32 %9, !dbg !62
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
!1 = !DIFile(filename: "3level_nesting.cpp", directory: "/home/hlbs/Desktop/loopProfiler/testcasebasicones")
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
!37 = !DILocation(line: 11, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !1, line: 10, column: 4)
!39 = !DILocation(line: 11, column: 21, scope: !38)
!40 = !DILocation(line: 11, column: 28, scope: !38)
!41 = !DILocation(line: 11, column: 29, scope: !38)
!42 = !DILocation(line: 11, column: 27, scope: !38)
!43 = !DILocation(line: 11, column: 34, scope: !38)
!44 = !DILocation(line: 11, column: 33, scope: !38)
!45 = !DILocation(line: 11, column: 5, scope: !38)
!46 = !DILocation(line: 12, column: 4, scope: !38)
!47 = !DILocation(line: 9, column: 23, scope: !34)
!48 = !DILocation(line: 9, column: 4, scope: !34)
!49 = distinct !{!49, !36, !50}
!50 = !DILocation(line: 12, column: 4, scope: !29)
!51 = !DILocation(line: 13, column: 3, scope: !30)
!52 = !DILocation(line: 7, column: 22, scope: !25)
!53 = !DILocation(line: 7, column: 3, scope: !25)
!54 = distinct !{!54, !27, !55}
!55 = !DILocation(line: 13, column: 3, scope: !20)
!56 = !DILocation(line: 14, column: 2, scope: !21)
!57 = !DILocation(line: 5, column: 21, scope: !16)
!58 = !DILocation(line: 5, column: 2, scope: !16)
!59 = distinct !{!59, !18, !60}
!60 = !DILocation(line: 14, column: 2, scope: !12)
!61 = !DILocation(line: 15, column: 2, scope: !7)
!62 = !DILocation(line: 16, column: 1, scope: !7)
