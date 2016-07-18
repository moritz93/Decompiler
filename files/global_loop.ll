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
   ;400210: jal 4004d8 <main><null> [null]
%9 = add nsw i32 0, 4   ;400218: addiu $2<INTEGER>,$0<INTEGER>,4 [VALUE]
%10 = getelementptr inbounds i8* %8, i32 16
%11 = bitcast i8* %10 to i32*
store i32 %9, i32* %11   ;400220: sw $2<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
%12 = getelementptr inbounds i8* %8, i32 20
%13 = bitcast i8* %12 to i32*
store i32 0, i32* %13   ;400228: sw $0<INTEGER>, 20($30<POINTER>)<POINTER> [POINTER]
br label %label-4

label-4:
%14 = getelementptr inbounds i8* %8, i32 20
%15 = bitcast i8* %14 to i32*
%16 = load i32* %15, align 4   ;400230: lw $2<INTEGER>, 20($30<POINTER>)<POINTER> [POINTER]
%17 = icmp slt i32 %16, 100   ;400238: slti $3<BIT>,$2<INTEGER>,100 [VALUE]
%18 = icmp ne i1 %17, 0
br i1 %18, label %label-1, label %label-2   ;400240: bne $3<BIT>,$0<INTEGER>,400250 [VALUE]

label-2:
br label %label-3   ;400248: j 4002f8<JUMP> [JUMP]

label-1:
%19 = getelementptr inbounds i8* %8, i32 20
%20 = bitcast i8* %19 to i32*
%21 = load i32* %20, align 4   ;400250: lw $2<INTEGER>, 20($30<POINTER>)<POINTER> [POINTER]
%22 = add nsw i32 0, %21   ;400258: addu $3<INTEGER>,$0<INTEGER>,$2<INTEGER> [VALUE]
%23 = shl i32 %22, 2   ;400260: sll $2<INTEGER>,$3<INTEGER>,0x02 [VALUE]
%24 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400268: lui $3<POINTER>, 4096 [POINTER]
%25 = getelementptr inbounds i8* %24, i32 96   ;400270: addiu $3<POINTER>,$3<POINTER>,96 [POINTER]
%26 = getelementptr inbounds i8* %25, i32 %23   ;400278: addu $2<POINTER>,$2<INTEGER>,$3<POINTER> [POINTER]
%27 = getelementptr inbounds i8* %8, i32 20
%28 = bitcast i8* %27 to i32*
%29 = load i32* %28, align 4   ;400280: lw $3<INTEGER>, 20($30<POINTER>)<POINTER> [POINTER]
%30 = add nsw i32 0, %29   ;400288: addu $4<INTEGER>,$0<INTEGER>,$3<INTEGER> [VALUE]
%31 = shl i32 %30, 2   ;400290: sll $3<INTEGER>,$4<INTEGER>,0x02 [VALUE]
%32 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400298: lui $4<POINTER>, 4096 [POINTER]
%33 = getelementptr inbounds i8* %32, i32 96   ;4002a0: addiu $4<POINTER>,$4<POINTER>,96 [POINTER]
%34 = getelementptr inbounds i8* %33, i32 %31   ;4002a8: addu $3<POINTER>,$3<INTEGER>,$4<POINTER> [POINTER]
%35 = getelementptr inbounds i8* %34, i32 0
%36 = bitcast i8* %35 to i32*
%37 = load i32* %36, align 4   ;4002b0: lw $4<INTEGER>, 0($3<POINTER>)<VALUE> [POINTER]
%38 = getelementptr inbounds i8* %8, i32 16
%39 = bitcast i8* %38 to i32*
%40 = load i32* %39, align 4   ;4002b8: lw $3<INTEGER>, 16($30<POINTER>)<POINTER> [POINTER]
%41 = add nsw i32 %37, %40   ;4002c0: addu $4<INTEGER>,$4<INTEGER>,$3<INTEGER> [VALUE]
%42 = getelementptr inbounds i8* %26, i32 0
%43 = bitcast i8* %42 to i32*
store i32 %41, i32* %43   ;4002c8: sw $4<INTEGER>, 0($2<POINTER>)<VALUE> [POINTER]
%44 = getelementptr inbounds i8* %8, i32 20
%45 = bitcast i8* %44 to i32*
%46 = load i32* %45, align 4   ;4002d0: lw $3<INTEGER>, 20($30<POINTER>)<POINTER> [POINTER]
%47 = add nsw i32 %46, 1   ;4002d8: addiu $2<INTEGER>,$3<INTEGER>,1 [VALUE]
%48 = add nsw i32 0, %47   ;4002e0: addu $3<INTEGER>,$0<INTEGER>,$2<INTEGER> [VALUE]
%49 = getelementptr inbounds i8* %8, i32 20
%50 = bitcast i8* %49 to i32*
store i32 %48, i32* %50   ;4002e8: sw $3<INTEGER>, 20($30<POINTER>)<POINTER> [POINTER]
br label %label-4   ;4002f0: j 400230<JUMP> [JUMP]

label-3:
%51 = add nsw i32 0, 0   ;4002f8: addu $2<INTEGER>,$0<INTEGER>,$0<INTEGER> [VALUE]
br label %label-5   ;400300: j 400308<JUMP> [JUMP]

label-5:
%52 = getelementptr inbounds i8* %8, i32 0   ;400308: addu $29<POINTER>,$0<INTEGER>,$30<POINTER> [POINTER]
%53 = getelementptr inbounds i8* %52, i32 28
%54 = bitcast i8* %53 to i32*
%55 = load i32* %54, align 4   ;400310: lw $31<INTEGER>, 28($29<POINTER>)<POINTER> [POINTER]
%56 = getelementptr inbounds i8* %52, i32 24
%57 = bitcast i8* %56 to i32*
%58 = load i32* %57, align 4   ;400318: lw $30<INTEGER>, 24($29<POINTER>)<POINTER> [POINTER]
%59 = getelementptr inbounds i8* %52, i32 32   ;400320: addiu $29<POINTER>,$29<POINTER>,32 [POINTER]
br label %return
return:
ret void   ;400328: jr $31<VALUE><JUMP> [JUMP]
}

declare void @exit(i32) noreturn nounwind
