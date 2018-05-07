; ModuleID = 'nested_do_while.cpp'
source_filename = "nested_do_while.cpp"
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
  br label %do.body, !dbg !21, !llvm.loop !22

do.body:                                          ; preds = %do.cond32, %entry
  br label %do.body1, !dbg !24, !llvm.loop !26

do.body1:                                         ; preds = %do.cond20, %do.body
  br label %do.body2, !dbg !28, !llvm.loop !30

do.body2:                                         ; preds = %do.cond8, %do.body1
  br label %do.body3, !dbg !32, !llvm.loop !34

do.body3:                                         ; preds = %do.cond, %do.body2
  %0 = load i32, i32* %i, align 4, !dbg !36
  %mul = mul nsw i32 %0, 1000000, !dbg !38
  %1 = load i32, i32* %j, align 4, !dbg !39
  %mul4 = mul nsw i32 %1, 10000, !dbg !40
  %add = add nsw i32 %mul, %mul4, !dbg !41
  %2 = load i32, i32* %k, align 4, !dbg !42
  %mul5 = mul nsw i32 %2, 100, !dbg !43
  %add6 = add nsw i32 %add, %mul5, !dbg !44
  %3 = load i32, i32* %l, align 4, !dbg !45
  %add7 = add nsw i32 %add6, %3, !dbg !46
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add7), !dbg !47
  br label %do.cond, !dbg !48

do.cond:                                          ; preds = %do.body3
  %4 = load i32, i32* %l, align 4, !dbg !49
  %cmp = icmp slt i32 %4, 100, !dbg !50
  br i1 %cmp, label %do.body3, label %do.end, !dbg !48, !llvm.loop !34

do.end:                                           ; preds = %do.cond
  br label %do.cond8, !dbg !51

do.cond8:                                         ; preds = %do.end
  %5 = load i32, i32* %k, align 4, !dbg !52
  %cmp9 = icmp slt i32 %5, 100, !dbg !53
  br i1 %cmp9, label %do.body2, label %do.end10, !dbg !51, !llvm.loop !30

do.end10:                                         ; preds = %do.cond8
  br label %do.body11, !dbg !54, !llvm.loop !55

do.body11:                                        ; preds = %do.cond17, %do.end10
  %6 = load i32, i32* %i, align 4, !dbg !57
  %mul12 = mul nsw i32 %6, 1000000, !dbg !59
  %7 = load i32, i32* %j, align 4, !dbg !60
  %mul13 = mul nsw i32 %7, 10000, !dbg !61
  %add14 = add nsw i32 %mul12, %mul13, !dbg !62
  %8 = load i32, i32* %l, align 4, !dbg !63
  %add15 = add nsw i32 %add14, %8, !dbg !64
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add15), !dbg !65
  br label %do.cond17, !dbg !66

do.cond17:                                        ; preds = %do.body11
  %9 = load i32, i32* %k, align 4, !dbg !67
  %cmp18 = icmp slt i32 %9, 100, !dbg !68
  br i1 %cmp18, label %do.body11, label %do.end19, !dbg !66, !llvm.loop !55

do.end19:                                         ; preds = %do.cond17
  br label %do.cond20, !dbg !69

do.cond20:                                        ; preds = %do.end19
  %10 = load i32, i32* %l, align 4, !dbg !70
  %cmp21 = icmp slt i32 %10, 100, !dbg !71
  br i1 %cmp21, label %do.body1, label %do.end22, !dbg !69, !llvm.loop !26

do.end22:                                         ; preds = %do.cond20
  br label %do.body23, !dbg !72, !llvm.loop !73

do.body23:                                        ; preds = %do.cond29, %do.end22
  %11 = load i32, i32* %i, align 4, !dbg !75
  %mul24 = mul nsw i32 %11, 1000000, !dbg !77
  %12 = load i32, i32* %j, align 4, !dbg !78
  %mul25 = mul nsw i32 %12, 10000, !dbg !79
  %add26 = add nsw i32 %mul24, %mul25, !dbg !80
  %13 = load i32, i32* %l, align 4, !dbg !81
  %add27 = add nsw i32 %add26, %13, !dbg !82
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add27), !dbg !83
  br label %do.cond29, !dbg !84

do.cond29:                                        ; preds = %do.body23
  %14 = load i32, i32* %j, align 4, !dbg !85
  %cmp30 = icmp slt i32 %14, 100, !dbg !86
  br i1 %cmp30, label %do.body23, label %do.end31, !dbg !84, !llvm.loop !73

do.end31:                                         ; preds = %do.cond29
  br label %do.cond32, !dbg !87

do.cond32:                                        ; preds = %do.end31
  %15 = load i32, i32* %i, align 4, !dbg !88
  %cmp33 = icmp slt i32 %15, 100, !dbg !89
  br i1 %cmp33, label %do.body, label %do.end34, !dbg !87, !llvm.loop !22

do.end34:                                         ; preds = %do.cond32
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !90
  %16 = load i32, i32* %retval, align 4, !dbg !91
  ret i32 %16, !dbg !91
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
!1 = !DIFile(filename: "nested_do_while.cpp", directory: "/home/hlbs/Desktop/loopProfiler/testcasebasicones")
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
!22 = distinct !{!22, !21, !23}
!23 = !DILocation(line: 20, column: 14, scope: !7)
!24 = !DILocation(line: 7, column: 3, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 5)
!26 = distinct !{!26, !24, !27}
!27 = !DILocation(line: 16, column: 15, scope: !25)
!28 = !DILocation(line: 8, column: 4, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 7, column: 6)
!30 = distinct !{!30, !28, !31}
!31 = !DILocation(line: 12, column: 16, scope: !29)
!32 = !DILocation(line: 9, column: 5, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !1, line: 8, column: 7)
!34 = distinct !{!34, !32, !35}
!35 = !DILocation(line: 11, column: 17, scope: !33)
!36 = !DILocation(line: 10, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !1, line: 9, column: 8)
!38 = !DILocation(line: 10, column: 22, scope: !37)
!39 = !DILocation(line: 10, column: 31, scope: !37)
!40 = !DILocation(line: 10, column: 32, scope: !37)
!41 = !DILocation(line: 10, column: 30, scope: !37)
!42 = !DILocation(line: 10, column: 39, scope: !37)
!43 = !DILocation(line: 10, column: 40, scope: !37)
!44 = !DILocation(line: 10, column: 38, scope: !37)
!45 = !DILocation(line: 10, column: 45, scope: !37)
!46 = !DILocation(line: 10, column: 44, scope: !37)
!47 = !DILocation(line: 10, column: 6, scope: !37)
!48 = !DILocation(line: 11, column: 5, scope: !37)
!49 = !DILocation(line: 11, column: 12, scope: !33)
!50 = !DILocation(line: 11, column: 13, scope: !33)
!51 = !DILocation(line: 12, column: 4, scope: !33)
!52 = !DILocation(line: 12, column: 11, scope: !29)
!53 = !DILocation(line: 12, column: 12, scope: !29)
!54 = !DILocation(line: 13, column: 4, scope: !29)
!55 = distinct !{!55, !54, !56}
!56 = !DILocation(line: 15, column: 16, scope: !29)
!57 = !DILocation(line: 14, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !29, file: !1, line: 13, column: 7)
!59 = !DILocation(line: 14, column: 21, scope: !58)
!60 = !DILocation(line: 14, column: 30, scope: !58)
!61 = !DILocation(line: 14, column: 31, scope: !58)
!62 = !DILocation(line: 14, column: 29, scope: !58)
!63 = !DILocation(line: 14, column: 38, scope: !58)
!64 = !DILocation(line: 14, column: 37, scope: !58)
!65 = !DILocation(line: 14, column: 5, scope: !58)
!66 = !DILocation(line: 15, column: 4, scope: !58)
!67 = !DILocation(line: 15, column: 11, scope: !29)
!68 = !DILocation(line: 15, column: 12, scope: !29)
!69 = !DILocation(line: 16, column: 3, scope: !29)
!70 = !DILocation(line: 16, column: 10, scope: !25)
!71 = !DILocation(line: 16, column: 11, scope: !25)
!72 = !DILocation(line: 17, column: 3, scope: !25)
!73 = distinct !{!73, !72, !74}
!74 = !DILocation(line: 19, column: 15, scope: !25)
!75 = !DILocation(line: 18, column: 19, scope: !76)
!76 = distinct !DILexicalBlock(scope: !25, file: !1, line: 17, column: 6)
!77 = !DILocation(line: 18, column: 20, scope: !76)
!78 = !DILocation(line: 18, column: 29, scope: !76)
!79 = !DILocation(line: 18, column: 30, scope: !76)
!80 = !DILocation(line: 18, column: 28, scope: !76)
!81 = !DILocation(line: 18, column: 37, scope: !76)
!82 = !DILocation(line: 18, column: 36, scope: !76)
!83 = !DILocation(line: 18, column: 4, scope: !76)
!84 = !DILocation(line: 19, column: 3, scope: !76)
!85 = !DILocation(line: 19, column: 10, scope: !25)
!86 = !DILocation(line: 19, column: 11, scope: !25)
!87 = !DILocation(line: 20, column: 2, scope: !25)
!88 = !DILocation(line: 20, column: 9, scope: !7)
!89 = !DILocation(line: 20, column: 10, scope: !7)
!90 = !DILocation(line: 21, column: 2, scope: !7)
!91 = !DILocation(line: 22, column: 1, scope: !7)
