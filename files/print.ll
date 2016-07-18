@stack_KeyExpansion = common global i8* null
@stack = global [721 x i8] zeroinitializer
@zero = common global i32 0
@low = common global i32 0
@high = common global i32 0
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1

define void @KeyExpansion(i8* %a, i8* %b, i32 %c) nounwind {
entry:
%a_addr = alloca i8*
store i8* %a, i8** %a_addr
%0 = load i8** %a_addr
%b_addr = alloca i8*
store i8* %b, i8** %b_addr
%1 = load i8** %b_addr
%c_addr = alloca i32
store i32 %c, i32* %c_addr
%2 = load i32* %c_addr
%3 = load i8** @stack_KeyExpansion

%4 = getelementptr inbounds i8* %3, i32 -72   ;4001f0: addiu $29<POINTER>,$29<POINTER>,-72<VALUE> [POINTER]
%5 = getelementptr inbounds i8* %1, i32 0   ;4001f8: addu $10<POINTER>,$0<INTEGER>,$5<POINTER> [POINTER]
%6 = getelementptr inbounds i8* %4, i32 0   ;400200: addu $8<POINTER>,$0<INTEGER>,$29<POINTER> [POINTER]
%7 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400208: lui $7<POINTER>, 4096 [POINTER]
%8 = getelementptr inbounds i8* %7, i32 512   ;400210: addiu $7<POINTER>,$7<POINTER>,512 [POINTER]
%9 = getelementptr inbounds i8* %8, i32 48   ;400218: addiu $9<POINTER>,$7<POINTER>,48 [POINTER]
br label %label-1

label-1:
%10 = phi i8* [ %8 , %entry ], [ %32 , %label-1 ]
%11 = phi i8* [ %6 , %entry ], [ %33 , %label-1 ]
%12 = getelementptr inbounds i8* %10, i32 00
%13 = bitcast i8* %12 to i32*
%14 = load i32* %13   ;400220: lw $2<INTEGER>, 0($7<POINTER>)<VALUE> [POINTER]
%15 = getelementptr inbounds i8* %10, i32 40
%16 = bitcast i8* %15 to i32*
%17 = load i32* %16   ;400228: lw $3<INTEGER>, 4($7<POINTER>)<POINTER> [POINTER]
%18 = getelementptr inbounds i8* %10, i32 80
%19 = bitcast i8* %18 to i32*
%20 = load i32* %19   ;400230: lw $4<INTEGER>, 8($7<POINTER>)<POINTER> [POINTER]
%21 = getelementptr inbounds i8* %10, i32 120
%22 = bitcast i8* %21 to i32*
%23 = load i32* %22   ;400238: lw $5<INTEGER>, 12($7<POINTER>)<POINTER> [POINTER]
%24 = getelementptr inbounds i8* %11, i32 00
%25 = bitcast i8* %24 to i32*
store i32 %14, i32* %25   ;400240: sw $2<INTEGER>, 0($8<POINTER>)<POINTER> [POINTER]
%26 = getelementptr inbounds i8* %11, i32 40
%27 = bitcast i8* %26 to i32*
store i32 %17, i32* %27   ;400248: sw $3<INTEGER>, 4($8<POINTER>)<POINTER> [POINTER]
%28 = getelementptr inbounds i8* %11, i32 80
%29 = bitcast i8* %28 to i32*
store i32 %20, i32* %29   ;400250: sw $4<INTEGER>, 8($8<POINTER>)<POINTER> [POINTER]
%30 = getelementptr inbounds i8* %11, i32 120
%31 = bitcast i8* %30 to i32*
store i32 %23, i32* %31   ;400258: sw $5<INTEGER>, 12($8<POINTER>)<POINTER> [POINTER]
%32 = getelementptr inbounds i8* %10, i32 16   ;400260: addiu $7<POINTER>,$7<POINTER>,16 [POINTER]
%33 = getelementptr inbounds i8* %11, i32 16   ;400268: addiu $8<POINTER>,$8<POINTER>,16 [POINTER]
%34 = icmp ne i8* %32, %9
br i1 %34, label %label-1, label %label-2   ;400270: bne $7<POINTER>,$9<POINTER>,400220 [POINTER]

label-2:
%35 = getelementptr inbounds i8* %32, i32 00
%36 = bitcast i8* %35 to i32*
%37 = load i32* %36   ;400278: lw $2<INTEGER>, 0($7<POINTER>)<POINTER> [POINTER]
%38 = getelementptr inbounds i8* %32, i32 40
%39 = bitcast i8* %38 to i32*
%40 = load i32* %39   ;400280: lw $3<INTEGER>, 4($7<POINTER>)<POINTER> [POINTER]
%41 = getelementptr inbounds i8* %32, i32 80
%42 = bitcast i8* %41 to i32*
%43 = load i32* %42   ;400288: lw $4<INTEGER>, 8($7<POINTER>)<POINTER> [POINTER]
%44 = getelementptr inbounds i8* %33, i32 00
%45 = bitcast i8* %44 to i32*
store i32 %37, i32* %45   ;400290: sw $2<INTEGER>, 0($8<POINTER>)<POINTER> [POINTER]
%46 = getelementptr inbounds i8* %33, i32 40
%47 = bitcast i8* %46 to i32*
store i32 %40, i32* %47   ;400298: sw $3<INTEGER>, 4($8<POINTER>)<POINTER> [POINTER]
%48 = getelementptr inbounds i8* %33, i32 80
%49 = bitcast i8* %48 to i32*
store i32 %43, i32* %49   ;4002a0: sw $4<INTEGER>, 8($8<POINTER>)<POINTER> [POINTER]
%50 = add nsw i32 0, 192   ;4002a8: addiu $2<INTEGER>,$0<INTEGER>,192 [VALUE]
%51 = icmp eq i32 %2, %50
br i1 %51, label %label-3, label %label-4   ;4002b0: beq $6<INTEGER>,$2<INTEGER>,400308 [VALUE]

label-4:
%52 = icmp slt i32 %2, 193   ;4002b8: slti $2<BIT>,$6<INTEGER>,193 [VALUE]
%53 = icmp eq i1 %52, 0
br i1 %53, label %label-5, label %label-6   ;4002c0: beq $2<BIT>,$0<INTEGER>,4002e0 [VALUE]

label-6:
%54 = add nsw i32 0, 128   ;4002c8: addiu $2<INTEGER>,$0<INTEGER>,128 [VALUE]
%55 = icmp eq i32 %2, %54
br i1 %55, label %label-7, label %label-8   ;4002d0: beq $6<INTEGER>,$2<INTEGER>,4002f8 [VALUE]

label-8:
br label %label-9   ;4002d8: j 400378<JUMP> [JUMP]

label-5:
%56 = add nsw i32 0, 256   ;4002e0: addiu $2<INTEGER>,$0<INTEGER>,256 [VALUE]
%57 = icmp eq i32 %2, %56
br i1 %57, label %label-10, label %label-11   ;4002e8: beq $6<INTEGER>,$2<INTEGER>,400318 [VALUE]

label-11:
br label %label-9   ;4002f0: j 400378<JUMP> [JUMP]

label-7:
%58 = add nsw i32 0, 4   ;4002f8: addiu $6<INTEGER>,$0<INTEGER>,4 [VALUE]
br label %label-12   ;400300: j 400320<JUMP> [JUMP]

label-3:
%59 = add nsw i32 0, 6   ;400308: addiu $6<INTEGER>,$0<INTEGER>,6 [VALUE]
br label %label-12   ;400310: j 400320<JUMP> [JUMP]

label-10:
%60 = add nsw i32 0, 8   ;400318: addiu $6<INTEGER>,$0<INTEGER>,8 [VALUE]
br label %label-12

label-12:
%61 = phi i32 [ %58 , %label-7 ], [ %59 , %label-3 ], [ %60 , %label-10 ]
%62 = add nsw i32 0, 0   ;400320: addu $3<INTEGER>,$0<INTEGER>,$0<INTEGER> [VALUE]
%63 = icmp eq i32 %61, 0
br i1 %63, label %label-9, label %label-13   ;400328: beq $6<INTEGER>,$0<INTEGER>,400378 [VALUE]

label-13:
%64 = getelementptr inbounds i8* %5, i32 0   ;400330: addu $5<POINTER>,$0<INTEGER>,$10<POINTER> [POINTER]
%65 = getelementptr inbounds i8* %4, i32 0   ;400338: addu $4<POINTER>,$0<INTEGER>,$29<POINTER> [POINTER]
br label %label-14

label-14:
%66 = phi i32 [ %62 , %label-13 ], [ %72 , %label-14 ]
%67 = phi i8* [ %65 , %label-13 ], [ %76 , %label-14 ]
%68 = phi i8* [ %64 , %label-13 ], [ %75 , %label-14 ]
%69 = getelementptr inbounds i8* %67, i32 -4
%70 = bitcast i8* %69 to i32*
%71 = load i32* %70   ;400340: lw $2<INTEGER>, -4($4<POINTER>)<POINTER><POINTER> [POINTER]
%72 = add nsw i32 %66, 1   ;400348: addiu $3<INTEGER>,$3<INTEGER>,1 [VALUE]
%73 = getelementptr inbounds i8* %68, i32 00
%74 = bitcast i8* %73 to i32*
store i32 %71, i32* %74   ;400350: sw $2<INTEGER>, 0($5<POINTER>)<POINTER> [POINTER]
%75 = getelementptr inbounds i8* %68, i32 4   ;400358: addiu $5<POINTER>,$5<POINTER>,4 [POINTER]
%76 = getelementptr inbounds i8* %67, i32 4   ;400360: addiu $4<POINTER>,$4<POINTER>,4 [POINTER]
%77 = icmp slt i32 %72, %61   ;400368: slt $2<BIT>,$3<INTEGER>,$6<INTEGER> [VALUE]
%78 = icmp ne i1 %77, 0
br i1 %78, label %label-14, label %label-9   ;400370: bne $2<BIT>,$0<INTEGER>,400340 [VALUE]

label-9:
%79 = getelementptr inbounds i8* %4, i32 72   ;400378: addiu $29<POINTER>,$29<POINTER>,72 [POINTER]
br label %return

return:
ret void   ;400380: jr $31<VALUE><JUMP> [JUMP]
}

define void @main() nounwind {
entry:
%0 = getelementptr inbounds [721 x i8]* @stack, i32 0, i32 720

%1 = getelementptr inbounds i8* %0, i32 -648   ;400388: addiu $29<POINTER>,$29<POINTER>,-648<VALUE> [POINTER]
%2 = load i32* @zero, align 4
%3 = getelementptr inbounds i8* %1, i32 6440
%4 = bitcast i8* %3 to i32*
store i32 %2, i32* %4   ;400390: sw $31<VALUE>, 644($29<POINTER>)<POINTER> [POINTER]
%5 = load i32* @zero, align 4
%6 = getelementptr inbounds i8* %1, i32 6400
%7 = bitcast i8* %6 to i32*
store i32 %5, i32* %7   ;400398: sw $16<VALUE>, 640($29<POINTER>)<POINTER> [POINTER]
   ;4003a0: jal 400bd8 <main><null> [null]
%8 = getelementptr inbounds i8* %1, i32 32   ;4003a8: addiu $9<POINTER>,$29<POINTER>,32 [POINTER]
%9 = getelementptr inbounds i8* %1, i32 576   ;4003b0: addiu $8<POINTER>,$29<POINTER>,576 [POINTER]
%10 = getelementptr inbounds i8* %9, i32 0   ;4003b8: addu $7<POINTER>,$0<INTEGER>,$8<POINTER> [POINTER]
%11 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4003c0: lui $6<POINTER>, 4096 [POINTER]
%12 = getelementptr inbounds i8* %11, i32 512   ;4003c8: addiu $6<POINTER>,$6<POINTER>,512 [POINTER]
%13 = getelementptr inbounds i8* %12, i32 48   ;4003d0: addiu $10<POINTER>,$6<POINTER>,48 [POINTER]
%14 = add nsw i32 0, 10   ;4003d8: addiu $2<INTEGER>,$0<INTEGER>,10 [VALUE]
%15 = getelementptr inbounds i8* %1, i32 160
%16 = trunc i32 %14 to i8
store i8 %16, i8* %15   ;4003e0: sb $2<INTEGER>, 16($29<POINTER>)<POINTER> [POINTER]
%17 = add nsw i32 0, 16   ;4003e8: addiu $2<INTEGER>,$0<INTEGER>,16 [VALUE]
%18 = getelementptr inbounds i8* %1, i32 170
%19 = trunc i32 %17 to i8
store i8 %19, i8* %18   ;4003f0: sb $2<INTEGER>, 17($29<POINTER>)<POINTER> [POINTER]
%20 = add nsw i32 0, 32   ;4003f8: addiu $2<INTEGER>,$0<INTEGER>,32 [VALUE]
%21 = getelementptr inbounds i8* %1, i32 180
%22 = trunc i32 %20 to i8
store i8 %22, i8* %21   ;400400: sb $2<INTEGER>, 18($29<POINTER>)<POINTER> [POINTER]
%23 = add nsw i32 0, 35   ;400408: addiu $2<INTEGER>,$0<INTEGER>,35 [VALUE]
%24 = getelementptr inbounds i8* %1, i32 190
%25 = trunc i32 %23 to i8
store i8 %25, i8* %24   ;400410: sb $2<INTEGER>, 19($29<POINTER>)<POINTER> [POINTER]
%26 = add nsw i32 0, 103   ;400418: addiu $2<INTEGER>,$0<INTEGER>,103 [VALUE]
%27 = getelementptr inbounds i8* %1, i32 200
%28 = trunc i32 %26 to i8
store i8 %28, i8* %27   ;400420: sb $2<INTEGER>, 20($29<POINTER>)<POINTER> [POINTER]
%29 = add nsw i32 0, 84   ;400428: addiu $2<INTEGER>,$0<INTEGER>,84 [VALUE]
%30 = getelementptr inbounds i8* %1, i32 210
%31 = trunc i32 %29 to i8
store i8 %31, i8* %30   ;400430: sb $2<INTEGER>, 21($29<POINTER>)<POINTER> [POINTER]
%32 = add nsw i32 0, 163   ;400438: addiu $2<INTEGER>,$0<INTEGER>,163 [VALUE]
%33 = getelementptr inbounds i8* %1, i32 220
%34 = trunc i32 %32 to i8
store i8 %34, i8* %33   ;400440: sb $2<INTEGER>, 22($29<POINTER>)<POINTER> [POINTER]
%35 = add nsw i32 0, 228   ;400448: addiu $2<INTEGER>,$0<INTEGER>,228 [VALUE]
%36 = getelementptr inbounds i8* %1, i32 230
%37 = trunc i32 %35 to i8
store i8 %37, i8* %36   ;400450: sb $2<INTEGER>, 23($29<POINTER>)<POINTER> [POINTER]
%38 = add nsw i32 0, 23   ;400458: addiu $2<INTEGER>,$0<INTEGER>,23 [VALUE]
%39 = getelementptr inbounds i8* %1, i32 240
%40 = trunc i32 %38 to i8
store i8 %40, i8* %39   ;400460: sb $2<INTEGER>, 24($29<POINTER>)<POINTER> [POINTER]
%41 = add nsw i32 0, 165   ;400468: addiu $2<INTEGER>,$0<INTEGER>,165 [VALUE]
%42 = getelementptr inbounds i8* %1, i32 250
%43 = trunc i32 %41 to i8
store i8 %43, i8* %42   ;400470: sb $2<INTEGER>, 25($29<POINTER>)<POINTER> [POINTER]
%44 = add nsw i32 0, 211   ;400478: addiu $2<INTEGER>,$0<INTEGER>,211 [VALUE]
%45 = getelementptr inbounds i8* %1, i32 260
%46 = trunc i32 %44 to i8
store i8 %46, i8* %45   ;400480: sb $2<INTEGER>, 26($29<POINTER>)<POINTER> [POINTER]
%47 = add nsw i32 0, 97   ;400488: addiu $2<INTEGER>,$0<INTEGER>,97 [VALUE]
%48 = getelementptr inbounds i8* %1, i32 270
%49 = trunc i32 %47 to i8
store i8 %49, i8* %48   ;400490: sb $2<INTEGER>, 27($29<POINTER>)<POINTER> [POINTER]
%50 = add nsw i32 0, 33   ;400498: addiu $2<INTEGER>,$0<INTEGER>,33 [VALUE]
%51 = getelementptr inbounds i8* %1, i32 280
%52 = trunc i32 %50 to i8
store i8 %52, i8* %51   ;4004a0: sb $2<INTEGER>, 28($29<POINTER>)<POINTER> [POINTER]
%53 = add nsw i32 0, 36   ;4004a8: addiu $2<INTEGER>,$0<INTEGER>,36 [VALUE]
%54 = getelementptr inbounds i8* %1, i32 290
%55 = trunc i32 %53 to i8
store i8 %55, i8* %54   ;4004b0: sb $2<INTEGER>, 29($29<POINTER>)<POINTER> [POINTER]
%56 = add nsw i32 0, 112   ;4004b8: addiu $2<INTEGER>,$0<INTEGER>,112 [VALUE]
%57 = getelementptr inbounds i8* %1, i32 300
%58 = trunc i32 %56 to i8
store i8 %58, i8* %57   ;4004c0: sb $2<INTEGER>, 30($29<POINTER>)<POINTER> [POINTER]
%59 = add nsw i32 0, 69   ;4004c8: addiu $2<INTEGER>,$0<INTEGER>,69 [VALUE]
%60 = getelementptr inbounds i8* %1, i32 310
%61 = trunc i32 %59 to i8
store i8 %61, i8* %60   ;4004d0: sb $2<INTEGER>, 31($29<POINTER>)<POINTER> [POINTER]
br label %label-1

label-1:
%62 = phi i8* [ %12 , %entry ], [ %84 , %label-1 ]
%63 = phi i8* [ %10 , %entry ], [ %85 , %label-1 ]
%64 = getelementptr inbounds i8* %62, i32 00
%65 = bitcast i8* %64 to i32*
%66 = load i32* %65   ;4004d8: lw $2<INTEGER>, 0($6<POINTER>)<VALUE> [POINTER]
%67 = getelementptr inbounds i8* %62, i32 40
%68 = bitcast i8* %67 to i32*
%69 = load i32* %68   ;4004e0: lw $3<INTEGER>, 4($6<POINTER>)<POINTER> [POINTER]
%70 = getelementptr inbounds i8* %62, i32 80
%71 = bitcast i8* %70 to i32*
%72 = load i32* %71   ;4004e8: lw $4<INTEGER>, 8($6<POINTER>)<POINTER> [POINTER]
%73 = getelementptr inbounds i8* %62, i32 120
%74 = bitcast i8* %73 to i32*
%75 = load i32* %74   ;4004f0: lw $5<INTEGER>, 12($6<POINTER>)<POINTER> [POINTER]
%76 = getelementptr inbounds i8* %63, i32 00
%77 = bitcast i8* %76 to i32*
store i32 %66, i32* %77   ;4004f8: sw $2<INTEGER>, 0($7<POINTER>)<POINTER> [POINTER]
%78 = getelementptr inbounds i8* %63, i32 40
%79 = bitcast i8* %78 to i32*
store i32 %69, i32* %79   ;400500: sw $3<INTEGER>, 4($7<POINTER>)<POINTER> [POINTER]
%80 = getelementptr inbounds i8* %63, i32 80
%81 = bitcast i8* %80 to i32*
store i32 %72, i32* %81   ;400508: sw $4<INTEGER>, 8($7<POINTER>)<POINTER> [POINTER]
%82 = getelementptr inbounds i8* %63, i32 120
%83 = bitcast i8* %82 to i32*
store i32 %75, i32* %83   ;400510: sw $5<INTEGER>, 12($7<POINTER>)<POINTER> [POINTER]
%84 = getelementptr inbounds i8* %62, i32 16   ;400518: addiu $6<POINTER>,$6<POINTER>,16 [POINTER]
%85 = getelementptr inbounds i8* %63, i32 16   ;400520: addiu $7<POINTER>,$7<POINTER>,16 [POINTER]
%86 = icmp ne i8* %84, %13
br i1 %86, label %label-1, label %label-2   ;400528: bne $6<POINTER>,$10<POINTER>,4004d8 [POINTER]

label-2:
%87 = getelementptr inbounds i8* %84, i32 00
%88 = bitcast i8* %87 to i32*
%89 = load i32* %88   ;400530: lw $2<INTEGER>, 0($6<POINTER>)<POINTER> [POINTER]
%90 = getelementptr inbounds i8* %84, i32 40
%91 = bitcast i8* %90 to i32*
%92 = load i32* %91   ;400538: lw $3<INTEGER>, 4($6<POINTER>)<POINTER> [POINTER]
%93 = getelementptr inbounds i8* %84, i32 80
%94 = bitcast i8* %93 to i32*
%95 = load i32* %94   ;400540: lw $4<INTEGER>, 8($6<POINTER>)<POINTER> [POINTER]
%96 = getelementptr inbounds i8* %85, i32 00
%97 = bitcast i8* %96 to i32*
store i32 %89, i32* %97   ;400548: sw $2<INTEGER>, 0($7<POINTER>)<POINTER> [POINTER]
%98 = getelementptr inbounds i8* %85, i32 40
%99 = bitcast i8* %98 to i32*
store i32 %92, i32* %99   ;400550: sw $3<INTEGER>, 4($7<POINTER>)<POINTER> [POINTER]
%100 = getelementptr inbounds i8* %85, i32 80
%101 = bitcast i8* %100 to i32*
store i32 %95, i32* %101   ;400558: sw $4<INTEGER>, 8($7<POINTER>)<POINTER> [POINTER]
%102 = add nsw i32 0, 4   ;400560: addiu $6<INTEGER>,$0<INTEGER>,4 [VALUE]
%103 = add nsw i32 0, 0   ;400568: addu $5<INTEGER>,$0<INTEGER>,$0<INTEGER> [VALUE]
%104 = getelementptr inbounds i8* %8, i32 0   ;400570: addu $4<POINTER>,$0<INTEGER>,$9<POINTER> [POINTER]
%105 = getelementptr inbounds i8* %9, i32 0   ;400578: addu $3<POINTER>,$0<INTEGER>,$8<POINTER> [POINTER]
br label %label-3

label-3:
%106 = phi i8* [ %105 , %label-2 ], [ %116 , %label-3 ]
%107 = phi i8* [ %104 , %label-2 ], [ %115 , %label-3 ]
%108 = phi i32 [ %103 , %label-2 ], [ %112 , %label-3 ]
%109 = getelementptr inbounds i8* %106, i32 -4
%110 = bitcast i8* %109 to i32*
%111 = load i32* %110   ;400580: lw $2<INTEGER>, -4($3<POINTER>)<POINTER><POINTER> [POINTER]
%112 = add nsw i32 %108, 1   ;400588: addiu $5<INTEGER>,$5<INTEGER>,1 [VALUE]
%113 = getelementptr inbounds i8* %107, i32 00
%114 = bitcast i8* %113 to i32*
store i32 %111, i32* %114   ;400590: sw $2<INTEGER>, 0($4<POINTER>)<POINTER> [POINTER]
%115 = getelementptr inbounds i8* %107, i32 4   ;400598: addiu $4<POINTER>,$4<POINTER>,4 [POINTER]
%116 = getelementptr inbounds i8* %106, i32 4   ;4005a0: addiu $3<POINTER>,$3<POINTER>,4 [POINTER]
%117 = icmp slt i32 %112, %102   ;4005a8: slt $2<BIT>,$5<INTEGER>,$6<INTEGER> [VALUE]
%118 = icmp ne i1 %117, 0
br i1 %118, label %label-3, label %label-4   ;4005b0: bne $2<BIT>,$0<INTEGER>,400580 [VALUE]

label-4:
%119 = getelementptr inbounds i8* %1, i32 320
%120 = bitcast i8* %119 to i32*
%121 = load i32* %120   ;4005b8: lw $5<INTEGER>, 32($29<POINTER>)<POINTER> [POINTER]
; $gp iincrement was skipped.   ;4005c0: addiu $16<VALUE>,$28<null>,-32768<VALUE> [VALUE]
%122 = add nsw i32 0, %null   ;4005c8: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%123 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %121) nounwind   ;4005d0: jal 400e40 <printf><null> [null]
%124 = getelementptr inbounds i8* %1, i32 360
%125 = bitcast i8* %124 to i32*
%126 = load i32* %125   ;4005d8: lw $5<INTEGER>, 36($29<POINTER>)<POINTER> [POINTER]
%127 = add nsw i32 0, %null   ;4005e0: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%128 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %126) nounwind   ;4005e8: jal 400e40 <printf><null> [null]
%129 = getelementptr inbounds i8* %1, i32 400
%130 = bitcast i8* %129 to i32*
%131 = load i32* %130   ;4005f0: lw $5<INTEGER>, 40($29<POINTER>)<POINTER> [POINTER]
%132 = add nsw i32 0, %null   ;4005f8: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%133 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %131) nounwind   ;400600: jal 400e40 <printf><null> [null]
%134 = getelementptr inbounds i8* %1, i32 440
%135 = bitcast i8* %134 to i32*
%136 = load i32* %135   ;400608: lw $5<INTEGER>, 44($29<POINTER>)<POINTER> [POINTER]
%137 = add nsw i32 0, %null   ;400610: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%138 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %136) nounwind   ;400618: jal 400e40 <printf><null> [null]
%139 = getelementptr inbounds i8* %1, i32 480
%140 = bitcast i8* %139 to i32*
%141 = load i32* %140   ;400620: lw $5<INTEGER>, 48($29<POINTER>)<POINTER> [POINTER]
%142 = add nsw i32 0, %null   ;400628: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%143 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %141) nounwind   ;400630: jal 400e40 <printf><null> [null]
%144 = getelementptr inbounds i8* %1, i32 520
%145 = bitcast i8* %144 to i32*
%146 = load i32* %145   ;400638: lw $5<INTEGER>, 52($29<POINTER>)<POINTER> [POINTER]
%147 = add nsw i32 0, %null   ;400640: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%148 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %146) nounwind   ;400648: jal 400e40 <printf><null> [null]
%149 = getelementptr inbounds i8* %1, i32 560
%150 = bitcast i8* %149 to i32*
%151 = load i32* %150   ;400650: lw $5<INTEGER>, 56($29<POINTER>)<POINTER> [POINTER]
%152 = add nsw i32 0, %null   ;400658: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%153 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %151) nounwind   ;400660: jal 400e40 <printf><null> [null]
%154 = getelementptr inbounds i8* %1, i32 600
%155 = bitcast i8* %154 to i32*
%156 = load i32* %155   ;400668: lw $5<INTEGER>, 60($29<POINTER>)<POINTER> [POINTER]
%157 = add nsw i32 0, %null   ;400670: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%158 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %156) nounwind   ;400678: jal 400e40 <printf><null> [null]
%159 = getelementptr inbounds i8* %1, i32 640
%160 = bitcast i8* %159 to i32*
%161 = load i32* %160   ;400680: lw $5<INTEGER>, 64($29<POINTER>)<POINTER> [POINTER]
%162 = add nsw i32 0, %null   ;400688: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%163 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %161) nounwind   ;400690: jal 400e40 <printf><null> [null]
%164 = getelementptr inbounds i8* %1, i32 680
%165 = bitcast i8* %164 to i32*
%166 = load i32* %165   ;400698: lw $5<INTEGER>, 68($29<POINTER>)<POINTER> [POINTER]
%167 = add nsw i32 0, %null   ;4006a0: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%168 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %166) nounwind   ;4006a8: jal 400e40 <printf><null> [null]
%169 = getelementptr inbounds i8* %1, i32 720
%170 = bitcast i8* %169 to i32*
%171 = load i32* %170   ;4006b0: lw $5<INTEGER>, 72($29<POINTER>)<POINTER> [POINTER]
%172 = add nsw i32 0, %null   ;4006b8: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%173 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %171) nounwind   ;4006c0: jal 400e40 <printf><null> [null]
%174 = getelementptr inbounds i8* %1, i32 760
%175 = bitcast i8* %174 to i32*
%176 = load i32* %175   ;4006c8: lw $5<INTEGER>, 76($29<POINTER>)<POINTER> [POINTER]
%177 = add nsw i32 0, %null   ;4006d0: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%178 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %176) nounwind   ;4006d8: jal 400e40 <printf><null> [null]
%179 = getelementptr inbounds i8* %1, i32 800
%180 = bitcast i8* %179 to i32*
%181 = load i32* %180   ;4006e0: lw $5<INTEGER>, 80($29<POINTER>)<POINTER> [POINTER]
%182 = add nsw i32 0, %null   ;4006e8: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%183 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %181) nounwind   ;4006f0: jal 400e40 <printf><null> [null]
%184 = getelementptr inbounds i8* %1, i32 840
%185 = bitcast i8* %184 to i32*
%186 = load i32* %185   ;4006f8: lw $5<INTEGER>, 84($29<POINTER>)<POINTER> [POINTER]
%187 = add nsw i32 0, %null   ;400700: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%188 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %186) nounwind   ;400708: jal 400e40 <printf><null> [null]
%189 = getelementptr inbounds i8* %1, i32 880
%190 = bitcast i8* %189 to i32*
%191 = load i32* %190   ;400710: lw $5<INTEGER>, 88($29<POINTER>)<POINTER> [POINTER]
%192 = add nsw i32 0, %null   ;400718: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%193 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %191) nounwind   ;400720: jal 400e40 <printf><null> [null]
%194 = getelementptr inbounds i8* %1, i32 920
%195 = bitcast i8* %194 to i32*
%196 = load i32* %195   ;400728: lw $5<INTEGER>, 92($29<POINTER>)<POINTER> [POINTER]
%197 = add nsw i32 0, %null   ;400730: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%198 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %196) nounwind   ;400738: jal 400e40 <printf><null> [null]
%199 = getelementptr inbounds i8* %1, i32 960
%200 = bitcast i8* %199 to i32*
%201 = load i32* %200   ;400740: lw $5<INTEGER>, 96($29<POINTER>)<POINTER> [POINTER]
%202 = add nsw i32 0, %null   ;400748: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%203 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %201) nounwind   ;400750: jal 400e40 <printf><null> [null]
%204 = getelementptr inbounds i8* %1, i32 1000
%205 = bitcast i8* %204 to i32*
%206 = load i32* %205   ;400758: lw $5<INTEGER>, 100($29<POINTER>)<POINTER> [POINTER]
%207 = add nsw i32 0, %null   ;400760: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%208 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %206) nounwind   ;400768: jal 400e40 <printf><null> [null]
%209 = getelementptr inbounds i8* %1, i32 1040
%210 = bitcast i8* %209 to i32*
%211 = load i32* %210   ;400770: lw $5<INTEGER>, 104($29<POINTER>)<POINTER> [POINTER]
%212 = add nsw i32 0, %null   ;400778: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%213 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %211) nounwind   ;400780: jal 400e40 <printf><null> [null]
%214 = getelementptr inbounds i8* %1, i32 1080
%215 = bitcast i8* %214 to i32*
%216 = load i32* %215   ;400788: lw $5<INTEGER>, 108($29<POINTER>)<POINTER> [POINTER]
%217 = add nsw i32 0, %null   ;400790: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%218 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %216) nounwind   ;400798: jal 400e40 <printf><null> [null]
%219 = getelementptr inbounds i8* %1, i32 1120
%220 = bitcast i8* %219 to i32*
%221 = load i32* %220   ;4007a0: lw $5<INTEGER>, 112($29<POINTER>)<POINTER> [POINTER]
%222 = add nsw i32 0, %null   ;4007a8: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%223 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %221) nounwind   ;4007b0: jal 400e40 <printf><null> [null]
%224 = getelementptr inbounds i8* %1, i32 1160
%225 = bitcast i8* %224 to i32*
%226 = load i32* %225   ;4007b8: lw $5<INTEGER>, 116($29<POINTER>)<POINTER> [POINTER]
%227 = add nsw i32 0, %null   ;4007c0: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%228 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %226) nounwind   ;4007c8: jal 400e40 <printf><null> [null]
%229 = getelementptr inbounds i8* %1, i32 1200
%230 = bitcast i8* %229 to i32*
%231 = load i32* %230   ;4007d0: lw $5<INTEGER>, 120($29<POINTER>)<POINTER> [POINTER]
%232 = add nsw i32 0, %null   ;4007d8: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%233 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %231) nounwind   ;4007e0: jal 400e40 <printf><null> [null]
%234 = getelementptr inbounds i8* %1, i32 1240
%235 = bitcast i8* %234 to i32*
%236 = load i32* %235   ;4007e8: lw $5<INTEGER>, 124($29<POINTER>)<POINTER> [POINTER]
%237 = add nsw i32 0, %null   ;4007f0: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%238 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %236) nounwind   ;4007f8: jal 400e40 <printf><null> [null]
%239 = getelementptr inbounds i8* %1, i32 1280
%240 = bitcast i8* %239 to i32*
%241 = load i32* %240   ;400800: lw $5<INTEGER>, 128($29<POINTER>)<POINTER> [POINTER]
%242 = add nsw i32 0, %null   ;400808: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%243 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %241) nounwind   ;400810: jal 400e40 <printf><null> [null]
%244 = getelementptr inbounds i8* %1, i32 1320
%245 = bitcast i8* %244 to i32*
%246 = load i32* %245   ;400818: lw $5<INTEGER>, 132($29<POINTER>)<POINTER> [POINTER]
%247 = add nsw i32 0, %null   ;400820: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%248 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %246) nounwind   ;400828: jal 400e40 <printf><null> [null]
%249 = getelementptr inbounds i8* %1, i32 1360
%250 = bitcast i8* %249 to i32*
%251 = load i32* %250   ;400830: lw $5<INTEGER>, 136($29<POINTER>)<POINTER> [POINTER]
%252 = add nsw i32 0, %null   ;400838: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%253 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %251) nounwind   ;400840: jal 400e40 <printf><null> [null]
%254 = getelementptr inbounds i8* %1, i32 1400
%255 = bitcast i8* %254 to i32*
%256 = load i32* %255   ;400848: lw $5<INTEGER>, 140($29<POINTER>)<POINTER> [POINTER]
%257 = add nsw i32 0, %null   ;400850: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%258 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %256) nounwind   ;400858: jal 400e40 <printf><null> [null]
%259 = getelementptr inbounds i8* %1, i32 1440
%260 = bitcast i8* %259 to i32*
%261 = load i32* %260   ;400860: lw $5<INTEGER>, 144($29<POINTER>)<POINTER> [POINTER]
%262 = add nsw i32 0, %null   ;400868: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%263 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %261) nounwind   ;400870: jal 400e40 <printf><null> [null]
%264 = getelementptr inbounds i8* %1, i32 1480
%265 = bitcast i8* %264 to i32*
%266 = load i32* %265   ;400878: lw $5<INTEGER>, 148($29<POINTER>)<POINTER> [POINTER]
%267 = add nsw i32 0, %null   ;400880: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%268 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %266) nounwind   ;400888: jal 400e40 <printf><null> [null]
%269 = getelementptr inbounds i8* %1, i32 1520
%270 = bitcast i8* %269 to i32*
%271 = load i32* %270   ;400890: lw $5<INTEGER>, 152($29<POINTER>)<POINTER> [POINTER]
%272 = add nsw i32 0, %null   ;400898: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%273 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %271) nounwind   ;4008a0: jal 400e40 <printf><null> [null]
%274 = getelementptr inbounds i8* %1, i32 1560
%275 = bitcast i8* %274 to i32*
%276 = load i32* %275   ;4008a8: lw $5<INTEGER>, 156($29<POINTER>)<POINTER> [POINTER]
%277 = add nsw i32 0, %null   ;4008b0: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%278 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %276) nounwind   ;4008b8: jal 400e40 <printf><null> [null]
%279 = getelementptr inbounds i8* %1, i32 1600
%280 = bitcast i8* %279 to i32*
%281 = load i32* %280   ;4008c0: lw $5<INTEGER>, 160($29<POINTER>)<POINTER> [POINTER]
%282 = add nsw i32 0, %null   ;4008c8: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%283 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %281) nounwind   ;4008d0: jal 400e40 <printf><null> [null]
%284 = getelementptr inbounds i8* %1, i32 1640
%285 = bitcast i8* %284 to i32*
%286 = load i32* %285   ;4008d8: lw $5<INTEGER>, 164($29<POINTER>)<POINTER> [POINTER]
%287 = add nsw i32 0, %null   ;4008e0: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%288 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %286) nounwind   ;4008e8: jal 400e40 <printf><null> [null]
%289 = getelementptr inbounds i8* %1, i32 1680
%290 = bitcast i8* %289 to i32*
%291 = load i32* %290   ;4008f0: lw $5<INTEGER>, 168($29<POINTER>)<POINTER> [POINTER]
%292 = add nsw i32 0, %null   ;4008f8: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%293 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %291) nounwind   ;400900: jal 400e40 <printf><null> [null]
%294 = getelementptr inbounds i8* %1, i32 1720
%295 = bitcast i8* %294 to i32*
%296 = load i32* %295   ;400908: lw $5<INTEGER>, 172($29<POINTER>)<POINTER> [POINTER]
%297 = add nsw i32 0, %null   ;400910: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%298 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %296) nounwind   ;400918: jal 400e40 <printf><null> [null]
%299 = getelementptr inbounds i8* %1, i32 1760
%300 = bitcast i8* %299 to i32*
%301 = load i32* %300   ;400920: lw $5<INTEGER>, 176($29<POINTER>)<POINTER> [POINTER]
%302 = add nsw i32 0, %null   ;400928: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%303 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %301) nounwind   ;400930: jal 400e40 <printf><null> [null]
%304 = getelementptr inbounds i8* %1, i32 1800
%305 = bitcast i8* %304 to i32*
%306 = load i32* %305   ;400938: lw $5<INTEGER>, 180($29<POINTER>)<POINTER> [POINTER]
%307 = add nsw i32 0, %null   ;400940: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%308 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %306) nounwind   ;400948: jal 400e40 <printf><null> [null]
%309 = getelementptr inbounds i8* %1, i32 1840
%310 = bitcast i8* %309 to i32*
%311 = load i32* %310   ;400950: lw $5<INTEGER>, 184($29<POINTER>)<POINTER> [POINTER]
%312 = add nsw i32 0, %null   ;400958: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%313 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %311) nounwind   ;400960: jal 400e40 <printf><null> [null]
%314 = getelementptr inbounds i8* %1, i32 1880
%315 = bitcast i8* %314 to i32*
%316 = load i32* %315   ;400968: lw $5<INTEGER>, 188($29<POINTER>)<POINTER> [POINTER]
%317 = add nsw i32 0, %null   ;400970: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%318 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %316) nounwind   ;400978: jal 400e40 <printf><null> [null]
%319 = getelementptr inbounds i8* %1, i32 1920
%320 = bitcast i8* %319 to i32*
%321 = load i32* %320   ;400980: lw $5<INTEGER>, 192($29<POINTER>)<POINTER> [POINTER]
%322 = add nsw i32 0, %null   ;400988: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%323 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %321) nounwind   ;400990: jal 400e40 <printf><null> [null]
%324 = getelementptr inbounds i8* %1, i32 1960
%325 = bitcast i8* %324 to i32*
%326 = load i32* %325   ;400998: lw $5<INTEGER>, 196($29<POINTER>)<POINTER> [POINTER]
%327 = add nsw i32 0, %null   ;4009a0: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%328 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %326) nounwind   ;4009a8: jal 400e40 <printf><null> [null]
%329 = getelementptr inbounds i8* %1, i32 2000
%330 = bitcast i8* %329 to i32*
%331 = load i32* %330   ;4009b0: lw $5<INTEGER>, 200($29<POINTER>)<POINTER> [POINTER]
%332 = add nsw i32 0, %null   ;4009b8: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%333 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %331) nounwind   ;4009c0: jal 400e40 <printf><null> [null]
%334 = getelementptr inbounds i8* %1, i32 2040
%335 = bitcast i8* %334 to i32*
%336 = load i32* %335   ;4009c8: lw $5<INTEGER>, 204($29<POINTER>)<POINTER> [POINTER]
%337 = add nsw i32 0, %null   ;4009d0: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%338 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %336) nounwind   ;4009d8: jal 400e40 <printf><null> [null]
%339 = getelementptr inbounds i8* %1, i32 2080
%340 = bitcast i8* %339 to i32*
%341 = load i32* %340   ;4009e0: lw $5<INTEGER>, 208($29<POINTER>)<POINTER> [POINTER]
%342 = add nsw i32 0, %null   ;4009e8: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%343 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %341) nounwind   ;4009f0: jal 400e40 <printf><null> [null]
%344 = getelementptr inbounds i8* %1, i32 2120
%345 = bitcast i8* %344 to i32*
%346 = load i32* %345   ;4009f8: lw $5<INTEGER>, 212($29<POINTER>)<POINTER> [POINTER]
%347 = add nsw i32 0, %null   ;400a00: addu $4<INTEGER>,$0<INTEGER>,$16<VALUE> [VALUE]
%348 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %346) nounwind   ;400a08: jal 400e40 <printf><null> [null]
%349 = getelementptr inbounds i8* %1, i32 6440
%350 = bitcast i8* %349 to i32*
%351 = load i32* %350   ;400a10: lw $31<INTEGER>, 644($29<POINTER>)<POINTER> [POINTER]
%352 = getelementptr inbounds i8* %1, i32 6400
%353 = bitcast i8* %352 to i32*
%354 = load i32* %353   ;400a18: lw $16<INTEGER>, 640($29<POINTER>)<POINTER> [POINTER]
%355 = getelementptr inbounds i8* %1, i32 648   ;400a20: addiu $29<POINTER>,$29<POINTER>,648 [POINTER]
br label %return

return:
ret void   ;400a28: jr $31<VALUE><JUMP> [JUMP]
}

declare void @exit(i32) noreturn nounwind
declare i32 @printf(i8* noalias, ...) nounwind
