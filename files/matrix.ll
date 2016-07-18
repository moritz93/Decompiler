@stack_inc = common global i8* null
@stack = global [49 x i8] zeroinitializer, align 32
@zero = common global i32 0
@low = common global i32 0
@high = common global i32 0

define void @inc(i8* %a) nounwind {
entry:
%a_addr = alloca i8*, align 4
store i8* %a, i8** %a_addr
%0 = load i8** %a_addr, align 4
%1 = load i8** @stack_inc, align 4

%2 = getelementptr inbounds i8* %1, i32 -16   ;4001f0: addiu $29<POINTER>,$29<POINTER>,-16<VALUE> [POINTER]
%3 = load i32* @zero, align 4
%4 = getelementptr inbounds i8* %2, i32 8
%5 = bitcast i8* %4 to i32*
store i32 %3, i32* %5   ;4001f8: sw $30<VALUE>, 8($29<POINTER>)<POINTER> [POINTER]
%6 = getelementptr inbounds i8* %2, i32 0   ;400200: addu $30<POINTER>,$0<INTEGER>,$29<POINTER> [POINTER]
%7 = getelementptr inbounds i8* %6, i32 16
%8 = bitcast i8* %7 to i32*
%9 = zext i8* %0 to i32
store i32 %9, i32* %8   ;400208: sw $4<POINTER>, 16($30<POINTER>)<POINTER> [POINTER]
%10 = add nsw i32 0, 2   ;400210: addiu $2<INTEGER>,$0<INTEGER>,2 [VALUE]
%11 = getelementptr inbounds i8* %6, i32 0
%12 = bitcast i8* %11 to i32*
store i32 %10, i32* %12   ;400218: sw $2<INTEGER>, 0($30<POINTER>)<POINTER> [POINTER]
%13 = getelementptr inbounds i8* %6, i32 4
%14 = bitcast i8* %13 to i32*
store i32 0, i32* %14   ;400220: sw $0<INTEGER>, 4($30<POINTER>)<POINTER> [POINTER]
br label %label-4

label-4:
%15 = getelementptr inbounds i8* %6, i32 4
%16 = bitcast i8* %15 to i32*
%17 = load i32* %16, align 4   ;400228: lw $2<INTEGER>, 4($30<POINTER>)<POINTER> [POINTER]
%18 = icmp slt i32 %17, 10   ;400230: slti $3<BIT>,$2<INTEGER>,10 [VALUE]
%19 = icmp ne i1 %18, 0
br i1 %19, label %label-1, label %label-2   ;400238: bne $3<BIT>,$0<INTEGER>,400248 [VALUE]

label-2:
br label %label-3   ;400240: j 4002e0<JUMP> [JUMP]

label-1:
%20 = getelementptr inbounds i8* %6, i32 4
%21 = bitcast i8* %20 to i32*
%22 = load i32* %21, align 4   ;400248: lw $2<INTEGER>, 4($30<POINTER>)<POINTER> [POINTER]
%23 = add nsw i32 0, %22   ;400250: addu $3<INTEGER>,$0<INTEGER>,$2<INTEGER> [VALUE]
%24 = shl i32 %23, 2   ;400258: sll $2<INTEGER>,$3<INTEGER>,0x02 [VALUE]
%25 = getelementptr inbounds i8* %6, i32 16
%26 = bitcast i8* %25 to i32*
%27 = load i32* %26, align 4   ;400260: lw $3<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
%28 = add nsw i32 %24, %27   ;400268: addu $2<INTEGER>,$2<INTEGER>,$3<INTEGER> [VALUE]
%29 = getelementptr inbounds i8* %6, i32 4
%30 = bitcast i8* %29 to i32*
%31 = load i32* %30, align 4   ;400270: lw $3<INTEGER>, 4($30<POINTER>)<POINTER> [POINTER]
%32 = add nsw i32 0, %31   ;400278: addu $4<INTEGER>,$0<INTEGER>,$3<INTEGER> [VALUE]
%33 = shl i32 %32, 2   ;400280: sll $3<INTEGER>,$4<INTEGER>,0x02 [VALUE]
%34 = getelementptr inbounds i8* %6, i32 16
%35 = bitcast i8* %34 to i32*
%36 = load i32* %35, align 4   ;400288: lw $4<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
%37 = add nsw i32 %33, %36   ;400290: addu $3<INTEGER>,$3<INTEGER>,$4<INTEGER> [VALUE]
%38 = getelementptr inbounds i8* %37, i32 0
%39 = bitcast i8* %38 to i32*
%40 = load i32* %39, align 4   ;400298: lw $4<INTEGER>, 0($3<POINTER>)<VALUE> [POINTER]
%41 = getelementptr inbounds i8* %6, i32 0
%42 = bitcast i8* %41 to i32*
%43 = load i32* %42, align 4   ;4002a0: lw $3<INTEGER>, 0($30<POINTER>)<POINTER> [POINTER]
%44 = add nsw i32 %40, %43   ;4002a8: addu $4<INTEGER>,$4<INTEGER>,$3<INTEGER> [VALUE]
%45 = getelementptr inbounds i8* %28, i32 0
%46 = bitcast i8* %45 to i32*
store i32 %44, i32* %46   ;4002b0: sw $4<INTEGER>, 0($2<POINTER>)<VALUE> [POINTER]
%47 = getelementptr inbounds i8* %6, i32 4
%48 = bitcast i8* %47 to i32*
%49 = load i32* %48, align 4   ;4002b8: lw $3<INTEGER>, 4($30<POINTER>)<POINTER> [POINTER]
%50 = add nsw i32 %49, 1   ;4002c0: addiu $2<INTEGER>,$3<INTEGER>,1 [VALUE]
%51 = add nsw i32 0, %50   ;4002c8: addu $3<INTEGER>,$0<INTEGER>,$2<INTEGER> [VALUE]
%52 = getelementptr inbounds i8* %6, i32 4
%53 = bitcast i8* %52 to i32*
store i32 %51, i32* %53   ;4002d0: sw $3<INTEGER>, 4($30<POINTER>)<POINTER> [POINTER]
br label %label-4   ;4002d8: j 400228<JUMP> [JUMP]

label-3:
%54 = getelementptr inbounds i8* %6, i32 0   ;4002e0: addu $29<POINTER>,$0<INTEGER>,$30<POINTER> [POINTER]
%55 = getelementptr inbounds i8* %54, i32 8
%56 = bitcast i8* %55 to i32*
%57 = load i32* %56, align 4   ;4002e8: lw $30<INTEGER>, 8($29<POINTER>)<POINTER> [POINTER]
%58 = getelementptr inbounds i8* %54, i32 16   ;4002f0: addiu $29<POINTER>,$29<POINTER>,16 [POINTER]
br label %return
return:
ret void   ;4002f8: jr $31<VALUE><JUMP> [JUMP]
}

define void @main() nounwind {
entry:
%0 = getelementptr inbounds [49 x i8]* @stack, i32 0, i32 48

%1 = getelementptr inbounds i8* %0, i32 -32   ;400300: addiu $29<POINTER>,$29<POINTER>,-32<VALUE> [POINTER]
%2 = load i32* @zero, align 4
%3 = getelementptr inbounds i8* %1, i32 28
%4 = bitcast i8* %3 to i32*
store i32 %2, i32* %4   ;400308: sw $31<VALUE>, 28($29<POINTER>)<POINTER> [POINTER]
%5 = load i32* @zero, align 4
%6 = getelementptr inbounds i8* %1, i32 24
%7 = bitcast i8* %6 to i32*
store i32 %5, i32* %7   ;400310: sw $30<VALUE>, 24($29<POINTER>)<POINTER> [POINTER]
%8 = getelementptr inbounds i8* %1, i32 0   ;400318: addu $30<POINTER>,$0<INTEGER>,$29<POINTER> [POINTER]
   ;400320: jal 4005a8 <main><null> [null]
%9 = getelementptr inbounds i8* %8, i32 16
%10 = bitcast i8* %9 to i32*
store i32 0, i32* %10   ;400328: sw $0<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
br label %label-8

label-8:
%11 = getelementptr inbounds i8* %8, i32 16
%12 = bitcast i8* %11 to i32*
%13 = load i32* %12, align 4   ;400330: lw $2<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
%14 = icmp slt i32 %13, 5   ;400338: slti $3<BIT>,$2<INTEGER>,5 [VALUE]
%15 = icmp ne i1 %14, 0
br i1 %15, label %label-5, label %label-6   ;400340: bne $3<BIT>,$0<INTEGER>,400350 [VALUE]

label-6:
br label %label-7   ;400348: j 4003c8<JUMP> [JUMP]

label-5:
%16 = getelementptr inbounds i8* %8, i32 16
%17 = bitcast i8* %16 to i32*
%18 = load i32* %17, align 4   ;400350: lw $2<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
%19 = add nsw i32 0, %18   ;400358: addu $4<INTEGER>,$0<INTEGER>,$2<INTEGER> [VALUE]
%20 = shl i32 %19, 2   ;400360: sll $3<INTEGER>,$4<INTEGER>,0x02 [VALUE]
%21 = add nsw i32 %20, %18   ;400368: addu $3<INTEGER>,$3<INTEGER>,$2<INTEGER> [VALUE]
%22 = shl i32 %21, 3   ;400370: sll $2<INTEGER>,$3<INTEGER>,0x03 [VALUE]
%23 = shl i32 4096, 16   ;400378: lui $3<UNKNOWN>, 4096 [UNKNOWN]
%24 = add nsw i32 %23, 96   ;400380: addiu $3<UNKNOWN>,$3<UNKNOWN>,96 [VALUE]
%25 = zext i32 %22 to i32
%26 = add nsw i32 %25, %24   ;400388: addu $2<UNKNOWN>,$2<INTEGER>,$3<UNKNOWN> [VALUE]
%27 = zext i32 %-10 to i32
%28 = add nsw i32 %27, %26   ;400390: addu $4<UNKNOWN>,$0<INTEGER>,$2<UNKNOWN> [VALUE]
store i8* %1, i8** @stack_inc
call void @inc(i32 %28) nounwind   ;400398: jal 4001f0 <inc><null> [null]
%29 = getelementptr inbounds i8* %8, i32 16
%30 = bitcast i8* %29 to i32*
%31 = load i32* %30, align 4   ;4003a0: lw $3<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
%32 = add nsw i32 %31, 1   ;4003a8: addiu $2<INTEGER>,$3<INTEGER>,1 [VALUE]
%33 = add nsw i32 0, %32   ;4003b0: addu $3<INTEGER>,$0<INTEGER>,$2<INTEGER> [VALUE]
%34 = getelementptr inbounds i8* %8, i32 16
%35 = bitcast i8* %34 to i32*
store i32 %33, i32* %35   ;4003b8: sw $3<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
br label %label-8   ;4003c0: j 400330<JUMP> [JUMP]

label-7:
%36 = add nsw i32 0, 0   ;4003c8: addu $2<INTEGER>,$0<INTEGER>,$0<INTEGER> [VALUE]
br label %label-9   ;4003d0: j 4003d8<JUMP> [JUMP]

label-9:
%37 = getelementptr inbounds i8* %8, i32 0   ;4003d8: addu $29<POINTER>,$0<INTEGER>,$30<POINTER> [POINTER]
%38 = getelementptr inbounds i8* %37, i32 28
%39 = bitcast i8* %38 to i32*
%40 = load i32* %39, align 4   ;4003e0: lw $31<INTEGER>, 28($29<POINTER>)<POINTER> [POINTER]
%41 = getelementptr inbounds i8* %37, i32 24
%42 = bitcast i8* %41 to i32*
%43 = load i32* %42, align 4   ;4003e8: lw $30<INTEGER>, 24($29<POINTER>)<POINTER> [POINTER]
%44 = getelementptr inbounds i8* %37, i32 32   ;4003f0: addiu $29<POINTER>,$29<POINTER>,32 [POINTER]
br label %return
return:
ret void   ;4003f8: jr $31<VALUE><JUMP> [JUMP]
}

declare void @exit(i32) noreturn nounwind
