@stack = global [33 x i8] zeroinitializer, align 32
@zero = common global i32 0
@low = common global i32 0
@high = common global i32 0

define void @main() nounwind {
entry:
%0 = getelementptr inbounds [33 x i8]* @stack, i32 0, i32 32

%1 = getelementptr inbounds i8* %0, i32 -32   ;4001f0: addiu $29<POINTER>,$29<POINTER>,-32<VALUE> [POINTER]
%2 = load i32* @zero, align 4
%3 = getelementptr inbounds i8* %1, i32 28
%4 = bitcast i8* %3 to i32*
store i32 %2, i32* %4   ;4001f8: sw $31<VALUE>, 28($29<POINTER>)<POINTER> [POINTER]
%5 = load i32* @zero, align 4
%6 = getelementptr inbounds i8* %1, i32 24
%7 = bitcast i8* %6 to i32*
store i32 %5, i32* %7   ;400200: sw $30<VALUE>, 24($29<POINTER>)<POINTER> [POINTER]
%8 = getelementptr inbounds i8* %1, i32 0   ;400208: addu $30<POINTER>,$0<INTEGER>,$29<POINTER> [POINTER]
   ;400210: jal 400488 <main><null> [null]
%9 = getelementptr inbounds i8* %8, i32 16
%10 = bitcast i8* %9 to i32*
store i32 0, i32* %10   ;400218: sw $0<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
br label %label-2

label-2:
%11 = getelementptr inbounds i8* %8, i32 16
%12 = bitcast i8* %11 to i32*
%13 = load i32* %12, align 4   ;400220: lw $2<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
%14 = icmp slt i32 %13, 5   ;400228: slti $3<BIT>,$2<INTEGER>,5 [VALUE]
%15 = icmp ne i1 %14, 0
br i1 %15, label %label-2, label %label-0   ;400230: bne $3<BIT>,$0<INTEGER>,400240 [VALUE]

br label %label-4   ;400238: j 4002a8<JUMP> [JUMP]

label-2:
%16 = getelementptr inbounds i8* %8, i32 16
%17 = bitcast i8* %16 to i32*
%18 = load i32* %17, align 4   ;400240: lw $2<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
%19 = add nsw i32 0, %18   ;400248: addu $3<INTEGER>,$0<INTEGER>,$2<INTEGER> [VALUE]
%20 = shl i32 %19, 2   ;400250: sll $2<INTEGER>,$3<INTEGER>,0x02 [VALUE]
%21 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400258: lui $3<POINTER>, 4096 [POINTER]
%22 = getelementptr inbounds i8* %21, i32 1008   ;400260: addiu $3<POINTER>,$3<POINTER>,1008 [POINTER]
%23 = getelementptr inbounds i8* %22, i32 %20   ;400268: addu $2<POINTER>,$2<INTEGER>,$3<POINTER> [POINTER]
%24 = add nsw i32 0, 5   ;400270: addiu $3<INTEGER>,$0<INTEGER>,5 [VALUE]
%25 = getelementptr inbounds i8* %23, i32 0
%26 = bitcast i8* %25 to i32*
store i32 %24, i32* %26   ;400278: sw $3<INTEGER>, 0($2<POINTER>)<VALUE> [POINTER]
%27 = getelementptr inbounds i8* %8, i32 16
%28 = bitcast i8* %27 to i32*
%29 = load i32* %28, align 4   ;400280: lw $3<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
%30 = add nsw i32 %29, 1   ;400288: addiu $2<INTEGER>,$3<INTEGER>,1 [VALUE]
%31 = add nsw i32 0, %30   ;400290: addu $3<INTEGER>,$0<INTEGER>,$2<INTEGER> [VALUE]
%32 = getelementptr inbounds i8* %8, i32 16
%33 = bitcast i8* %32 to i32*
store i32 %31, i32* %33   ;400298: sw $3<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
br label %label-2   ;4002a0: j 400220<JUMP> [JUMP]

label-4:
%34 = add nsw i32 0, 0   ;4002a8: addu $2<INTEGER>,$0<INTEGER>,$0<INTEGER> [VALUE]
br label %label-6   ;4002b0: j 4002b8<JUMP> [JUMP]

label-6:
%35 = getelementptr inbounds i8* %8, i32 0   ;4002b8: addu $29<POINTER>,$0<INTEGER>,$30<POINTER> [POINTER]
%36 = getelementptr inbounds i8* %35, i32 28
%37 = bitcast i8* %36 to i32*
%38 = load i32* %37, align 4   ;4002c0: lw $31<INTEGER>, 28($29<POINTER>)<POINTER> [POINTER]
%39 = getelementptr inbounds i8* %35, i32 24
%40 = bitcast i8* %39 to i32*
%41 = load i32* %40, align 4   ;4002c8: lw $30<INTEGER>, 24($29<POINTER>)<POINTER> [POINTER]
%42 = getelementptr inbounds i8* %35, i32 32   ;4002d0: addiu $29<POINTER>,$29<POINTER>,32 [POINTER]
br label %return
return:
ret void   ;4002d8: jr $31<VALUE><JUMP> [JUMP]
}

declare void @exit(i32) noreturn nounwind
