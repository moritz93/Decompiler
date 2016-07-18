@stack = common global [433 x i8] zeroinitializer, align 32
@zero = common global i32 0
@low = common global i32 0
@high = common global i32 0

define void @main() nounwind {
entry:
%0 = getelementptr inbounds [433 x i8]* @stack, i32 0, i32 432

%1 = getelementptr inbounds i8* %0, i32 -432   ;4001f0: addiu $29,$29,-432 [POINTER]
-%2 = getelementptr inbounds i8* %1, i32 428
%3 = bitcast i8* %2 to i32*
store i32 %31, i32* %3   ;4001f8: sw $31, -428($29) [POINTER]
%4 = load i32* @zero, align 4
%5 = getelementptr inbounds i8* %1, i32 424
%6 = bitcast i8* %5 to i32*
store i32 %4, i32* %6   ;400200: sw $30, 424($29) [POINTER]
%7 = getelementptr inbounds i8* %1, i32 0   ;400208: addu $30,$0,$29 [POINTER]
   ;400210: jal 4004c8 <main> [JUMP]
%8 = add nsw i32 0, 1   ;400218: addiu $2,$0,1 [VALUE]
%9 = getelementptr inbounds i8* %7, i32 16
%10 = bitcast i8* %9 to i32*
store i32 %8, i32* %10   ;400220: sw $2, 16($30) [POINTER]
br label %label-2

label-2:
%11 = getelementptr inbounds i8* %7, i32 16
%12 = bitcast i8* %11 to i32*
%13 = load i32* %12, align 4   ;400228: lw $2, 16($30) [POINTER]
%14 = icmp slt i32 %13, 101   ;400230: slti $3,$2,101 [VALUE]
%cmp = icmp ne i1 %14, false
br i1 %cmp, label %label-2, label %label-0   ;400238: bne $3,$0,400248 [VALUE]

br label %label-4   ;400240: j 4002e8 [JUMP]

label-2:
%15 = getelementptr inbounds i8* %7, i32 16
%16 = bitcast i8* %15 to i32*
%17 = load i32* %16, align 4   ;400248: lw $2, 16($30) [POINTER]
%18 = add nsw i32 0, %17   ;400250: addu $3,$0,$2 [VALUE]
%19 = shl i32 %18, 2   ;400258: sll $2,$3,0x02 [VALUE]
%20 = getelementptr inbounds i8* %7, i32 16   ;400260: addiu $4,$30,16 [POINTER]
%21 = getelementptr inbounds i8* %20, i32 %19   ;400268: addu $3,$2,$4 [POINTER]
%22 = getelementptr inbounds i8* %21, i32 8   ;400270: addiu $2,$3,8 [POINTER]
%23 = getelementptr inbounds i8* %7, i32 16
%24 = bitcast i8* %23 to i32*
%25 = load i32* %24, align 4   ;400278: lw $3, 16($30) [POINTER]
%26 = add nsw i32 0, %25   ;400280: addu $4,$0,$3 [VALUE]
%27 = shl i32 %26, 2   ;400288: sll $3,$4,0x02 [VALUE]
%28 = getelementptr inbounds i8* %7, i32 16   ;400290: addiu $4,$30,16 [POINTER]
%29 = getelementptr inbounds i8* %28, i32 %27   ;400298: addu $3,$3,$4 [POINTER]
%30 = getelementptr inbounds i8* %29, i32 8   ;4002a0: addiu $4,$3,8 [POINTER]
%31 = getelementptr inbounds i8* %30, i32 0
%32 = bitcast i8* %31 to i32*
%33 = load i32* %32, align 4   ;4002a8: lw $3, 0($4) [POINTER]
%34 = add nsw i32 %33, 5   ;4002b0: addiu $4,$3,5 [VALUE]
%35 = getelementptr inbounds i8* %22, i32 0
%36 = bitcast i8* %35 to i32*
store i32 %34, i32* %36   ;4002b8: sw $4, 0($2) [POINTER]
%37 = getelementptr inbounds i8* %7, i32 16
%38 = bitcast i8* %37 to i32*
%39 = load i32* %38, align 4   ;4002c0: lw $3, 16($30) [POINTER]
%40 = add nsw i32 %39, 1   ;4002c8: addiu $2,$3,1 [VALUE]
%41 = add nsw i32 0, %40   ;4002d0: addu $3,$0,$2 [VALUE]
%42 = getelementptr inbounds i8* %7, i32 16
%43 = bitcast i8* %42 to i32*
store i32 %41, i32* %43   ;4002d8: sw $3, 16($30) [POINTER]
br label %label-2   ;4002e0: j 400228 [JUMP]

label-4:
%44 = add nsw i32 0, 0   ;4002e8: addu $2,$0,$0 [VALUE]
br label %label-6   ;4002f0: j 4002f8 [JUMP]

label-6:
%45 = getelementptr inbounds i8* %7, i32 0   ;4002f8: addu $29,$0,$30 [POINTER]
%46 = getelementptr inbounds i8* %45, i32 428
%47 = bitcast i8* %46 to i32*
%48 = load i32* %47, align 4   ;400300: lw $31, 428($29) [POINTER]
%49 = getelementptr inbounds i8* %45, i32 424
%50 = bitcast i8* %49 to i32*
%51 = load i32* %50, align 4   ;400308: lw $30, 424($29) [POINTER]
%52 = getelementptr inbounds i8* %45, i32 432   ;400310: addiu $29,$29,432 [POINTER]
br label %return
   ;400318: jr $31 [JUMP]
return:
ret void
}

