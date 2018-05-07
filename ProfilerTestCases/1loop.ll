; ModuleID = '1loop.cpp'
source_filename = "1loop.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%d  \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !11, metadata !DIExpression()), !dbg !13
  store i32 0, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !15
  %cmp = icmp slt i32 %0, 100, !dbg !17
  br i1 %cmp, label %for.body, label %for.end, !dbg !18

for.body:                                         ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 1), !dbg !19
  br label %for.inc, !dbg !21

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !22
  %inc = add nsw i32 %1, 1, !dbg !22
  store i32 %inc, i32* %i, align 4, !dbg !22
  br label %for.cond, !dbg !23, !llvm.loop !24

for.end:                                          ; preds = %for.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !26
  %2 = load i32, i32* %retval, align 4, !dbg !27
  ret i32 %2, !dbg !27
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
!1 = !DIFile(filename: "1loop.cpp", directory: "/home/hlbs/Desktop/loopProfiler/testcasebasicones")
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
!19 = !DILocation(line: 7, column: 3, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !1, line: 6, column: 2)
!21 = !DILocation(line: 8, column: 2, scope: !20)
!22 = !DILocation(line: 5, column: 21, scope: !16)
!23 = !DILocation(line: 5, column: 2, scope: !16)
!24 = distinct !{!24, !18, !25}
!25 = !DILocation(line: 8, column: 2, scope: !12)
!26 = !DILocation(line: 9, column: 2, scope: !7)
!27 = !DILocation(line: 10, column: 1, scope: !7)
