@stack_AddRoundKey = common global i8* null
@stack_SubBytes = common global i8* null
@stack_ShiftRows = common global i8* null
@stack_MixColumns = common global i8* null
@stack_SubWord = common global i8* null
@stack_KeyExpansion = common global i8* null
@stack_aesencrypt = common global i8* null
@stack = global [777 x i8] zeroinitializer, align 32
@zero = common global i32 0
@low = common global i32 0
@high = common global i32 0

define void @AddRoundKey(i8* %a, i8* %b) nounwind {
entry:
%a_addr = alloca i8*, align 4
store i8* %a, i8** %a_addr
%0 = load i8** %a_addr, align 4
%b_addr = alloca i8*, align 4
store i8* %b, i8** %b_addr
%1 = load i8** %b_addr, align 4
%2 = load i8** @stack_AddRoundKey, align 4

%3 = getelementptr inbounds i8* %1, i32 3
%4 = load i8* %3, align 4   ;4001f0: lbu $3<BYTE>, 3($5<POINTER>)<POINTER> [POINTER]
%5 = getelementptr inbounds i8* %2, i32 -8   ;4001f8: addiu $29<POINTER>,$29<POINTER>,-8<VALUE> [POINTER]
%6 = getelementptr inbounds i8* %5, i32 0
store i8 %4, i8* %6   ;400200: sb $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%7 = getelementptr inbounds i8* %1, i32 2
%8 = bitcast i8* %7 to i16*
%9 = load i16* %8, align 4   ;400208: lhu $2<SHORT>, 2($5<POINTER>)<POINTER> [POINTER]
%10 = getelementptr inbounds i8* %5, i32 1
%11 = trunc i16 %9 to i8
store i8 %11, i8* %10   ;400210: sb $2<SHORT>, 1($29<POINTER>)<POINTER> [POINTER]
%12 = getelementptr inbounds i8* %1, i32 0
%13 = bitcast i8* %12 to i32*
%14 = load i32* %13, align 4   ;400218: lw $2<INTEGER>, 0($5<POINTER>)<POINTER> [POINTER]
%15 = lshr i32 %14, 8   ;400220: srl $2<INTEGER>,$2<INTEGER>,0x08 [VALUE]
%16 = getelementptr inbounds i8* %5, i32 2
%17 = trunc i32 %15 to i8
store i8 %17, i8* %16   ;400228: sb $2<INTEGER>, 2($29<POINTER>)<POINTER> [POINTER]
%18 = getelementptr inbounds i8* %1, i32 0
%19 = bitcast i8* %18 to i32*
%20 = load i32* %19, align 4   ;400230: lw $2<INTEGER>, 0($5<POINTER>)<POINTER> [POINTER]
%21 = getelementptr inbounds i8* %5, i32 3
%22 = trunc i32 %20 to i8
store i8 %22, i8* %21   ;400238: sb $2<INTEGER>, 3($29<POINTER>)<POINTER> [POINTER]
%23 = getelementptr inbounds i8* %0, i32 0
%24 = load i8* %23, align 4   ;400240: lbu $2<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%25 = xor i8 %24, %4   ;400248: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%26 = getelementptr inbounds i8* %0, i32 0
store i8 %25, i8* %26   ;400250: sb $2<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%27 = getelementptr inbounds i8* %0, i32 4
%28 = load i8* %27, align 4   ;400258: lbu $2<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%29 = getelementptr inbounds i8* %5, i32 1
%30 = load i8* %29, align 4   ;400260: lbu $3<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%31 = xor i8 %28, %30   ;400268: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%32 = getelementptr inbounds i8* %0, i32 4
store i8 %31, i8* %32   ;400270: sb $2<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%33 = getelementptr inbounds i8* %0, i32 8
%34 = load i8* %33, align 4   ;400278: lbu $2<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%35 = getelementptr inbounds i8* %5, i32 2
%36 = load i8* %35, align 4   ;400280: lbu $3<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%37 = xor i8 %34, %36   ;400288: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%38 = getelementptr inbounds i8* %0, i32 8
store i8 %37, i8* %38   ;400290: sb $2<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%39 = getelementptr inbounds i8* %0, i32 12
%40 = load i8* %39, align 4   ;400298: lbu $2<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%41 = getelementptr inbounds i8* %5, i32 3
%42 = load i8* %41, align 4   ;4002a0: lbu $3<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%43 = xor i8 %40, %42   ;4002a8: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%44 = getelementptr inbounds i8* %0, i32 12
store i8 %43, i8* %44   ;4002b0: sb $2<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%45 = getelementptr inbounds i8* %1, i32 7
%46 = load i8* %45, align 4   ;4002b8: lbu $3<BYTE>, 7($5<POINTER>)<POINTER> [POINTER]
%47 = getelementptr inbounds i8* %5, i32 0
store i8 %46, i8* %47   ;4002c0: sb $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%48 = getelementptr inbounds i8* %1, i32 6
%49 = bitcast i8* %48 to i16*
%50 = load i16* %49, align 4   ;4002c8: lhu $2<SHORT>, 6($5<POINTER>)<POINTER> [POINTER]
%51 = getelementptr inbounds i8* %5, i32 1
%52 = trunc i16 %50 to i8
store i8 %52, i8* %51   ;4002d0: sb $2<SHORT>, 1($29<POINTER>)<POINTER> [POINTER]
%53 = getelementptr inbounds i8* %1, i32 4
%54 = bitcast i8* %53 to i32*
%55 = load i32* %54, align 4   ;4002d8: lw $2<INTEGER>, 4($5<POINTER>)<POINTER> [POINTER]
%56 = lshr i32 %55, 8   ;4002e0: srl $2<INTEGER>,$2<INTEGER>,0x08 [VALUE]
%57 = getelementptr inbounds i8* %5, i32 2
%58 = trunc i32 %56 to i8
store i8 %58, i8* %57   ;4002e8: sb $2<INTEGER>, 2($29<POINTER>)<POINTER> [POINTER]
%59 = getelementptr inbounds i8* %1, i32 4
%60 = bitcast i8* %59 to i32*
%61 = load i32* %60, align 4   ;4002f0: lw $2<INTEGER>, 4($5<POINTER>)<POINTER> [POINTER]
%62 = getelementptr inbounds i8* %5, i32 3
%63 = trunc i32 %61 to i8
store i8 %63, i8* %62   ;4002f8: sb $2<INTEGER>, 3($29<POINTER>)<POINTER> [POINTER]
%64 = getelementptr inbounds i8* %0, i32 1
%65 = load i8* %64, align 4   ;400300: lbu $2<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%66 = xor i8 %65, %46   ;400308: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%67 = getelementptr inbounds i8* %0, i32 1
store i8 %66, i8* %67   ;400310: sb $2<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%68 = getelementptr inbounds i8* %0, i32 5
%69 = load i8* %68, align 4   ;400318: lbu $2<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%70 = getelementptr inbounds i8* %5, i32 1
%71 = load i8* %70, align 4   ;400320: lbu $3<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%72 = xor i8 %69, %71   ;400328: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%73 = getelementptr inbounds i8* %0, i32 5
store i8 %72, i8* %73   ;400330: sb $2<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%74 = getelementptr inbounds i8* %0, i32 9
%75 = load i8* %74, align 4   ;400338: lbu $2<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%76 = getelementptr inbounds i8* %5, i32 2
%77 = load i8* %76, align 4   ;400340: lbu $3<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%78 = xor i8 %75, %77   ;400348: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%79 = getelementptr inbounds i8* %0, i32 9
store i8 %78, i8* %79   ;400350: sb $2<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%80 = getelementptr inbounds i8* %0, i32 13
%81 = load i8* %80, align 4   ;400358: lbu $2<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%82 = getelementptr inbounds i8* %5, i32 3
%83 = load i8* %82, align 4   ;400360: lbu $3<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%84 = xor i8 %81, %83   ;400368: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%85 = getelementptr inbounds i8* %0, i32 13
store i8 %84, i8* %85   ;400370: sb $2<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%86 = getelementptr inbounds i8* %1, i32 11
%87 = load i8* %86, align 4   ;400378: lbu $3<BYTE>, 11($5<POINTER>)<POINTER> [POINTER]
%88 = getelementptr inbounds i8* %5, i32 0
store i8 %87, i8* %88   ;400380: sb $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%89 = getelementptr inbounds i8* %1, i32 10
%90 = bitcast i8* %89 to i16*
%91 = load i16* %90, align 4   ;400388: lhu $2<SHORT>, 10($5<POINTER>)<POINTER> [POINTER]
%92 = getelementptr inbounds i8* %5, i32 1
%93 = trunc i16 %91 to i8
store i8 %93, i8* %92   ;400390: sb $2<SHORT>, 1($29<POINTER>)<POINTER> [POINTER]
%94 = getelementptr inbounds i8* %1, i32 8
%95 = bitcast i8* %94 to i32*
%96 = load i32* %95, align 4   ;400398: lw $2<INTEGER>, 8($5<POINTER>)<POINTER> [POINTER]
%97 = lshr i32 %96, 8   ;4003a0: srl $2<INTEGER>,$2<INTEGER>,0x08 [VALUE]
%98 = getelementptr inbounds i8* %5, i32 2
%99 = trunc i32 %97 to i8
store i8 %99, i8* %98   ;4003a8: sb $2<INTEGER>, 2($29<POINTER>)<POINTER> [POINTER]
%100 = getelementptr inbounds i8* %1, i32 8
%101 = bitcast i8* %100 to i32*
%102 = load i32* %101, align 4   ;4003b0: lw $2<INTEGER>, 8($5<POINTER>)<POINTER> [POINTER]
%103 = getelementptr inbounds i8* %5, i32 3
%104 = trunc i32 %102 to i8
store i8 %104, i8* %103   ;4003b8: sb $2<INTEGER>, 3($29<POINTER>)<POINTER> [POINTER]
%105 = getelementptr inbounds i8* %0, i32 2
%106 = load i8* %105, align 4   ;4003c0: lbu $2<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%107 = xor i8 %106, %87   ;4003c8: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%108 = getelementptr inbounds i8* %0, i32 2
store i8 %107, i8* %108   ;4003d0: sb $2<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%109 = getelementptr inbounds i8* %0, i32 6
%110 = load i8* %109, align 4   ;4003d8: lbu $2<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%111 = getelementptr inbounds i8* %5, i32 1
%112 = load i8* %111, align 4   ;4003e0: lbu $3<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%113 = xor i8 %110, %112   ;4003e8: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%114 = getelementptr inbounds i8* %0, i32 6
store i8 %113, i8* %114   ;4003f0: sb $2<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%115 = getelementptr inbounds i8* %0, i32 10
%116 = load i8* %115, align 4   ;4003f8: lbu $2<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%117 = getelementptr inbounds i8* %5, i32 2
%118 = load i8* %117, align 4   ;400400: lbu $3<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%119 = xor i8 %116, %118   ;400408: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%120 = getelementptr inbounds i8* %0, i32 10
store i8 %119, i8* %120   ;400410: sb $2<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%121 = getelementptr inbounds i8* %0, i32 14
%122 = load i8* %121, align 4   ;400418: lbu $2<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%123 = getelementptr inbounds i8* %5, i32 3
%124 = load i8* %123, align 4   ;400420: lbu $3<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%125 = xor i8 %122, %124   ;400428: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%126 = getelementptr inbounds i8* %0, i32 14
store i8 %125, i8* %126   ;400430: sb $2<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%127 = getelementptr inbounds i8* %1, i32 15
%128 = load i8* %127, align 4   ;400438: lbu $3<BYTE>, 15($5<POINTER>)<POINTER> [POINTER]
%129 = getelementptr inbounds i8* %5, i32 0
store i8 %128, i8* %129   ;400440: sb $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%130 = getelementptr inbounds i8* %1, i32 14
%131 = bitcast i8* %130 to i16*
%132 = load i16* %131, align 4   ;400448: lhu $2<SHORT>, 14($5<POINTER>)<POINTER> [POINTER]
%133 = getelementptr inbounds i8* %5, i32 1
%134 = trunc i16 %132 to i8
store i8 %134, i8* %133   ;400450: sb $2<SHORT>, 1($29<POINTER>)<POINTER> [POINTER]
%135 = getelementptr inbounds i8* %1, i32 12
%136 = bitcast i8* %135 to i32*
%137 = load i32* %136, align 4   ;400458: lw $2<INTEGER>, 12($5<POINTER>)<POINTER> [POINTER]
%138 = lshr i32 %137, 8   ;400460: srl $2<INTEGER>,$2<INTEGER>,0x08 [VALUE]
%139 = getelementptr inbounds i8* %5, i32 2
%140 = trunc i32 %138 to i8
store i8 %140, i8* %139   ;400468: sb $2<INTEGER>, 2($29<POINTER>)<POINTER> [POINTER]
%141 = getelementptr inbounds i8* %1, i32 12
%142 = bitcast i8* %141 to i32*
%143 = load i32* %142, align 4   ;400470: lw $2<INTEGER>, 12($5<POINTER>)<POINTER> [POINTER]
%144 = getelementptr inbounds i8* %5, i32 3
%145 = trunc i32 %143 to i8
store i8 %145, i8* %144   ;400478: sb $2<INTEGER>, 3($29<POINTER>)<POINTER> [POINTER]
%146 = getelementptr inbounds i8* %0, i32 3
%147 = load i8* %146, align 4   ;400480: lbu $2<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%148 = xor i8 %147, %128   ;400488: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%149 = getelementptr inbounds i8* %0, i32 3
store i8 %148, i8* %149   ;400490: sb $2<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%150 = getelementptr inbounds i8* %0, i32 7
%151 = load i8* %150, align 4   ;400498: lbu $2<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%152 = getelementptr inbounds i8* %5, i32 1
%153 = load i8* %152, align 4   ;4004a0: lbu $3<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%154 = xor i8 %151, %153   ;4004a8: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%155 = getelementptr inbounds i8* %0, i32 7
store i8 %154, i8* %155   ;4004b0: sb $2<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%156 = getelementptr inbounds i8* %0, i32 11
%157 = load i8* %156, align 4   ;4004b8: lbu $2<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%158 = getelementptr inbounds i8* %5, i32 2
%159 = load i8* %158, align 4   ;4004c0: lbu $3<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%160 = xor i8 %157, %159   ;4004c8: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%161 = getelementptr inbounds i8* %0, i32 11
store i8 %160, i8* %161   ;4004d0: sb $2<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%162 = getelementptr inbounds i8* %0, i32 15
%163 = load i8* %162, align 4   ;4004d8: lbu $2<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%164 = getelementptr inbounds i8* %5, i32 3
%165 = load i8* %164, align 4   ;4004e0: lbu $3<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%166 = xor i8 %163, %165   ;4004e8: xor $2<BYTE>,$2<BYTE>,$3<BYTE> [VALUE]
%167 = getelementptr inbounds i8* %0, i32 15
store i8 %166, i8* %167   ;4004f0: sb $2<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%168 = getelementptr inbounds i8* %5, i32 8   ;4004f8: addiu $29<POINTER>,$29<POINTER>,8 [POINTER]
br label %return

return:
ret void   ;400500: jr $31<VALUE><JUMP> [JUMP]
}

define void @SubBytes(i8* %a) nounwind {
entry:
%a_addr = alloca i8*, align 4
store i8* %a, i8** %a_addr
%0 = load i8** %a_addr, align 4
%1 = load i8** @stack_SubBytes, align 4

%2 = getelementptr inbounds i8* %0, i32 0
%3 = load i8* %2, align 4   ;400508: lbu $3<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%4 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400510: lui $5<POINTER>, 4096 [POINTER]
%5 = getelementptr inbounds i8* %4, i32 0   ;400518: addiu $5<POINTER>,$5<POINTER>,0 [POINTER]
%6 = and i8 %3, 240   ;400520: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%7 = getelementptr inbounds i8* %5, i8 %6   ;400528: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%8 = and i8 %3, 15   ;400530: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%9 = getelementptr inbounds i8* %7, i8 %8   ;400538: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%10 = getelementptr inbounds i8* %9, i32 0
%11 = load i8* %10, align 4   ;400540: lbu $2<BYTE>, 0($2<POINTER>)<VALUE> [POINTER]
%12 = getelementptr inbounds i8* %0, i32 1
%13 = load i8* %12, align 4   ;400548: lbu $3<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%14 = getelementptr inbounds i8* %0, i32 0
store i8 %11, i8* %14   ;400550: sb $2<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%15 = and i8 %13, 240   ;400558: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%16 = getelementptr inbounds i8* %5, i8 %15   ;400560: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%17 = and i8 %13, 15   ;400568: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%18 = getelementptr inbounds i8* %16, i8 %17   ;400570: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%19 = getelementptr inbounds i8* %18, i32 0
%20 = load i8* %19, align 4   ;400578: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%21 = getelementptr inbounds i8* %0, i32 2
%22 = load i8* %21, align 4   ;400580: lbu $3<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%23 = getelementptr inbounds i8* %0, i32 1
store i8 %20, i8* %23   ;400588: sb $2<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%24 = and i8 %22, 240   ;400590: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%25 = getelementptr inbounds i8* %5, i8 %24   ;400598: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%26 = and i8 %22, 15   ;4005a0: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%27 = getelementptr inbounds i8* %25, i8 %26   ;4005a8: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%28 = getelementptr inbounds i8* %27, i32 0
%29 = load i8* %28, align 4   ;4005b0: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%30 = getelementptr inbounds i8* %0, i32 3
%31 = load i8* %30, align 4   ;4005b8: lbu $3<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%32 = getelementptr inbounds i8* %0, i32 2
store i8 %29, i8* %32   ;4005c0: sb $2<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%33 = and i8 %31, 240   ;4005c8: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%34 = getelementptr inbounds i8* %5, i8 %33   ;4005d0: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%35 = and i8 %31, 15   ;4005d8: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%36 = getelementptr inbounds i8* %34, i8 %35   ;4005e0: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%37 = getelementptr inbounds i8* %36, i32 0
%38 = load i8* %37, align 4   ;4005e8: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%39 = getelementptr inbounds i8* %0, i32 4
%40 = load i8* %39, align 4   ;4005f0: lbu $3<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%41 = getelementptr inbounds i8* %0, i32 3
store i8 %38, i8* %41   ;4005f8: sb $2<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%42 = and i8 %40, 240   ;400600: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%43 = getelementptr inbounds i8* %5, i8 %42   ;400608: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%44 = and i8 %40, 15   ;400610: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%45 = getelementptr inbounds i8* %43, i8 %44   ;400618: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%46 = getelementptr inbounds i8* %45, i32 0
%47 = load i8* %46, align 4   ;400620: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%48 = getelementptr inbounds i8* %0, i32 5
%49 = load i8* %48, align 4   ;400628: lbu $3<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%50 = getelementptr inbounds i8* %0, i32 4
store i8 %47, i8* %50   ;400630: sb $2<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%51 = and i8 %49, 240   ;400638: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%52 = getelementptr inbounds i8* %5, i8 %51   ;400640: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%53 = and i8 %49, 15   ;400648: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%54 = getelementptr inbounds i8* %52, i8 %53   ;400650: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%55 = getelementptr inbounds i8* %54, i32 0
%56 = load i8* %55, align 4   ;400658: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%57 = getelementptr inbounds i8* %0, i32 6
%58 = load i8* %57, align 4   ;400660: lbu $3<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%59 = getelementptr inbounds i8* %0, i32 5
store i8 %56, i8* %59   ;400668: sb $2<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%60 = and i8 %58, 240   ;400670: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%61 = getelementptr inbounds i8* %5, i8 %60   ;400678: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%62 = and i8 %58, 15   ;400680: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%63 = getelementptr inbounds i8* %61, i8 %62   ;400688: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%64 = getelementptr inbounds i8* %63, i32 0
%65 = load i8* %64, align 4   ;400690: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%66 = getelementptr inbounds i8* %0, i32 7
%67 = load i8* %66, align 4   ;400698: lbu $3<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%68 = getelementptr inbounds i8* %0, i32 6
store i8 %65, i8* %68   ;4006a0: sb $2<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%69 = and i8 %67, 240   ;4006a8: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%70 = getelementptr inbounds i8* %5, i8 %69   ;4006b0: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%71 = and i8 %67, 15   ;4006b8: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%72 = getelementptr inbounds i8* %70, i8 %71   ;4006c0: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%73 = getelementptr inbounds i8* %72, i32 0
%74 = load i8* %73, align 4   ;4006c8: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%75 = getelementptr inbounds i8* %0, i32 8
%76 = load i8* %75, align 4   ;4006d0: lbu $3<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%77 = getelementptr inbounds i8* %0, i32 7
store i8 %74, i8* %77   ;4006d8: sb $2<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%78 = and i8 %76, 240   ;4006e0: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%79 = getelementptr inbounds i8* %5, i8 %78   ;4006e8: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%80 = and i8 %76, 15   ;4006f0: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%81 = getelementptr inbounds i8* %79, i8 %80   ;4006f8: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%82 = getelementptr inbounds i8* %81, i32 0
%83 = load i8* %82, align 4   ;400700: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%84 = getelementptr inbounds i8* %0, i32 9
%85 = load i8* %84, align 4   ;400708: lbu $3<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%86 = getelementptr inbounds i8* %0, i32 8
store i8 %83, i8* %86   ;400710: sb $2<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%87 = and i8 %85, 240   ;400718: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%88 = getelementptr inbounds i8* %5, i8 %87   ;400720: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%89 = and i8 %85, 15   ;400728: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%90 = getelementptr inbounds i8* %88, i8 %89   ;400730: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%91 = getelementptr inbounds i8* %90, i32 0
%92 = load i8* %91, align 4   ;400738: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%93 = getelementptr inbounds i8* %0, i32 10
%94 = load i8* %93, align 4   ;400740: lbu $3<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%95 = getelementptr inbounds i8* %0, i32 9
store i8 %92, i8* %95   ;400748: sb $2<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%96 = and i8 %94, 240   ;400750: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%97 = getelementptr inbounds i8* %5, i8 %96   ;400758: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%98 = and i8 %94, 15   ;400760: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%99 = getelementptr inbounds i8* %97, i8 %98   ;400768: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%100 = getelementptr inbounds i8* %99, i32 0
%101 = load i8* %100, align 4   ;400770: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%102 = getelementptr inbounds i8* %0, i32 11
%103 = load i8* %102, align 4   ;400778: lbu $3<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%104 = getelementptr inbounds i8* %0, i32 10
store i8 %101, i8* %104   ;400780: sb $2<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%105 = and i8 %103, 240   ;400788: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%106 = getelementptr inbounds i8* %5, i8 %105   ;400790: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%107 = and i8 %103, 15   ;400798: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%108 = getelementptr inbounds i8* %106, i8 %107   ;4007a0: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%109 = getelementptr inbounds i8* %108, i32 0
%110 = load i8* %109, align 4   ;4007a8: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%111 = getelementptr inbounds i8* %0, i32 11
store i8 %110, i8* %111   ;4007b0: sb $2<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%112 = getelementptr inbounds i8* %0, i32 12
%113 = load i8* %112, align 4   ;4007b8: lbu $3<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%114 = and i8 %113, 240   ;4007c0: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%115 = getelementptr inbounds i8* %5, i8 %114   ;4007c8: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%116 = and i8 %113, 15   ;4007d0: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%117 = getelementptr inbounds i8* %115, i8 %116   ;4007d8: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%118 = getelementptr inbounds i8* %117, i32 0
%119 = load i8* %118, align 4   ;4007e0: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%120 = getelementptr inbounds i8* %0, i32 13
%121 = load i8* %120, align 4   ;4007e8: lbu $3<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%122 = getelementptr inbounds i8* %0, i32 12
store i8 %119, i8* %122   ;4007f0: sb $2<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%123 = and i8 %121, 240   ;4007f8: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%124 = getelementptr inbounds i8* %5, i8 %123   ;400800: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%125 = and i8 %121, 15   ;400808: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%126 = getelementptr inbounds i8* %124, i8 %125   ;400810: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%127 = getelementptr inbounds i8* %126, i32 0
%128 = load i8* %127, align 4   ;400818: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%129 = getelementptr inbounds i8* %0, i32 14
%130 = load i8* %129, align 4   ;400820: lbu $3<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%131 = getelementptr inbounds i8* %0, i32 13
store i8 %128, i8* %131   ;400828: sb $2<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%132 = and i8 %130, 240   ;400830: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%133 = getelementptr inbounds i8* %5, i8 %132   ;400838: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%134 = and i8 %130, 15   ;400840: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%135 = getelementptr inbounds i8* %133, i8 %134   ;400848: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%136 = getelementptr inbounds i8* %135, i32 0
%137 = load i8* %136, align 4   ;400850: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%138 = getelementptr inbounds i8* %0, i32 15
%139 = load i8* %138, align 4   ;400858: lbu $3<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%140 = getelementptr inbounds i8* %0, i32 14
store i8 %137, i8* %140   ;400860: sb $2<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%141 = and i8 %139, 240   ;400868: andi $2<BYTE>,$3<BYTE>,240 [VALUE]
%142 = getelementptr inbounds i8* %5, i8 %141   ;400870: addu $2<POINTER>,$2<BYTE>,$5<POINTER> [POINTER]
%143 = and i8 %139, 15   ;400878: andi $3<BYTE>,$3<BYTE>,15 [VALUE]
%144 = getelementptr inbounds i8* %142, i8 %143   ;400880: addu $2<POINTER>,$2<POINTER>,$3<BYTE> [POINTER]
%145 = getelementptr inbounds i8* %144, i32 0
%146 = load i8* %145, align 4   ;400888: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%147 = getelementptr inbounds i8* %0, i32 15
store i8 %146, i8* %147   ;400890: sb $2<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
br label %return

return:
ret void   ;400898: jr $31<VALUE><JUMP> [JUMP]
}

define void @ShiftRows(i8* %a) nounwind {
entry:
%a_addr = alloca i8*, align 4
store i8* %a, i8** %a_addr
%0 = load i8** %a_addr, align 4
%1 = load i8** @stack_ShiftRows, align 4

%2 = getelementptr inbounds i8* %0, i32 4
%3 = load i8* %2, align 4   ;4008a0: lbu $11<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%4 = getelementptr inbounds i8* %0, i32 7
%5 = load i8* %4, align 4   ;4008a8: lbu $9<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%6 = getelementptr inbounds i8* %0, i32 10
%7 = load i8* %6, align 4   ;4008b0: lbu $10<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%8 = getelementptr inbounds i8* %0, i32 11
%9 = load i8* %8, align 4   ;4008b8: lbu $8<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%10 = getelementptr inbounds i8* %0, i32 5
%11 = load i8* %10, align 4   ;4008c0: lbu $2<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%12 = getelementptr inbounds i8* %0, i32 6
%13 = load i8* %12, align 4   ;4008c8: lbu $3<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%14 = getelementptr inbounds i8* %0, i32 15
%15 = load i8* %14, align 4   ;4008d0: lbu $7<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%16 = getelementptr inbounds i8* %0, i32 14
%17 = load i8* %16, align 4   ;4008d8: lbu $5<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%18 = getelementptr inbounds i8* %0, i32 13
%19 = load i8* %18, align 4   ;4008e0: lbu $6<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%20 = getelementptr inbounds i8* %0, i32 7
store i8 %3, i8* %20   ;4008e8: sb $11<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%21 = getelementptr inbounds i8* %0, i32 8
%22 = load i8* %21, align 4   ;4008f0: lbu $11<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%23 = getelementptr inbounds i8* %0, i32 10
store i8 %22, i8* %23   ;4008f8: sb $11<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%24 = getelementptr inbounds i8* %0, i32 9
%25 = load i8* %24, align 4   ;400900: lbu $11<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%26 = getelementptr inbounds i8* %0, i32 11
store i8 %25, i8* %26   ;400908: sb $11<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%27 = getelementptr inbounds i8* %0, i32 12
%28 = load i8* %27, align 4   ;400910: lbu $11<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%29 = getelementptr inbounds i8* %0, i32 4
store i8 %11, i8* %29   ;400918: sb $2<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%30 = getelementptr inbounds i8* %0, i32 5
store i8 %13, i8* %30   ;400920: sb $3<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%31 = getelementptr inbounds i8* %0, i32 6
store i8 %5, i8* %31   ;400928: sb $9<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%32 = getelementptr inbounds i8* %0, i32 15
store i8 %17, i8* %32   ;400930: sb $5<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%33 = getelementptr inbounds i8* %0, i32 14
store i8 %19, i8* %33   ;400938: sb $6<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%34 = getelementptr inbounds i8* %0, i32 8
store i8 %7, i8* %34   ;400940: sb $10<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%35 = getelementptr inbounds i8* %0, i32 9
store i8 %9, i8* %35   ;400948: sb $8<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%36 = getelementptr inbounds i8* %0, i32 12
store i8 %15, i8* %36   ;400950: sb $7<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%37 = getelementptr inbounds i8* %0, i32 13
store i8 %28, i8* %37   ;400958: sb $11<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
br label %return

return:
ret void   ;400960: jr $31<VALUE><JUMP> [JUMP]
}

define void @MixColumns(i8* %a) nounwind {
entry:
%a_addr = alloca i8*, align 4
store i8* %a, i8** %a_addr
%0 = load i8** %a_addr, align 4
%1 = load i8** @stack_MixColumns, align 4

%2 = getelementptr inbounds i8* %0, i32 0
%3 = load i8* %2, align 4   ;400968: lbu $3<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%4 = getelementptr inbounds i8* %1, i32 -8   ;400970: addiu $29<POINTER>,$29<POINTER>,-8<VALUE> [POINTER]
%5 = getelementptr inbounds i8* %4, i32 0
store i8 %3, i8* %5   ;400978: sb $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%6 = getelementptr inbounds i8* %0, i32 4
%7 = load i8* %6, align 4   ;400980: lbu $2<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%8 = getelementptr inbounds i8* %4, i32 1
store i8 %7, i8* %8   ;400988: sb $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%9 = getelementptr inbounds i8* %0, i32 8
%10 = load i8* %9, align 4   ;400990: lbu $2<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%11 = getelementptr inbounds i8* %4, i32 2
store i8 %10, i8* %11   ;400998: sb $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%12 = getelementptr inbounds i8* %0, i32 12
%13 = load i8* %12, align 4   ;4009a0: lbu $2<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%14 = getelementptr inbounds i8* %4, i32 3
store i8 %13, i8* %14   ;4009a8: sb $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%15 = zext i8 %3 to i32
%16 = shl i32 %15, 1   ;4009b0: sll $2<INTEGER>,$3<BYTE>,0x01 [VALUE]
%17 = zext i8 %3 to i32
%18 = add nsw i32 %16, %17   ;4009b8: addu $2<INTEGER>,$2<INTEGER>,$3<BYTE> [VALUE]
%19 = shl i32 %18, 1   ;4009c0: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%20 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4009c8: lui $3<POINTER>, 4096 [POINTER]
%21 = getelementptr inbounds i8* %20, i32 %19   ;4009d0: addu $3<POINTER>,$3<POINTER>,$2<INTEGER> [POINTER]
%22 = getelementptr inbounds i8* %21, i32 704
%23 = load i8* %22, align 4   ;4009d8: lbu $3<BYTE>, 704($3<POINTER>)<VALUE> [POINTER]
%24 = getelementptr inbounds i8* %0, i32 0
store i8 %23, i8* %24   ;4009e0: sb $3<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%25 = getelementptr inbounds i8* %4, i32 1
%26 = load i8* %25, align 4   ;4009e8: lbu $5<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%27 = zext i8 %26 to i32
%28 = shl i32 %27, 1   ;4009f0: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%29 = zext i8 %26 to i32
%30 = add nsw i32 %28, %29   ;4009f8: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%31 = shl i32 %30, 1   ;400a00: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%32 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400a08: lui $1<POINTER>, 4096 [POINTER]
%33 = getelementptr inbounds i8* %32, i32 %31   ;400a10: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%34 = getelementptr inbounds i8* %33, i32 705
%35 = load i8* %34, align 4   ;400a18: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%36 = xor i8 %23, %35   ;400a20: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%37 = getelementptr inbounds i8* %0, i32 0
store i8 %36, i8* %37   ;400a28: sb $3<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%38 = getelementptr inbounds i8* %4, i32 2
%39 = load i8* %38, align 4   ;400a30: lbu $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%40 = xor i8 %36, %39   ;400a38: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%41 = getelementptr inbounds i8* %0, i32 0
store i8 %40, i8* %41   ;400a40: sb $3<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%42 = getelementptr inbounds i8* %4, i32 3
%43 = load i8* %42, align 4   ;400a48: lbu $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%44 = xor i8 %40, %43   ;400a50: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%45 = getelementptr inbounds i8* %0, i32 0
store i8 %44, i8* %45   ;400a58: sb $3<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%46 = getelementptr inbounds i8* %4, i32 0
%47 = load i8* %46, align 4   ;400a60: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%48 = getelementptr inbounds i8* %0, i32 4
store i8 %47, i8* %48   ;400a68: sb $3<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%49 = getelementptr inbounds i8* %4, i32 1
%50 = load i8* %49, align 4   ;400a70: lbu $5<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%51 = zext i8 %50 to i32
%52 = shl i32 %51, 1   ;400a78: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%53 = zext i8 %50 to i32
%54 = add nsw i32 %52, %53   ;400a80: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%55 = shl i32 %54, 1   ;400a88: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%56 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400a90: lui $1<POINTER>, 4096 [POINTER]
%57 = getelementptr inbounds i8* %56, i32 %55   ;400a98: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%58 = getelementptr inbounds i8* %57, i32 704
%59 = load i8* %58, align 4   ;400aa0: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%60 = xor i8 %47, %59   ;400aa8: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%61 = getelementptr inbounds i8* %0, i32 4
store i8 %60, i8* %61   ;400ab0: sb $3<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%62 = getelementptr inbounds i8* %4, i32 2
%63 = load i8* %62, align 4   ;400ab8: lbu $5<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%64 = zext i8 %63 to i32
%65 = shl i32 %64, 1   ;400ac0: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%66 = zext i8 %63 to i32
%67 = add nsw i32 %65, %66   ;400ac8: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%68 = shl i32 %67, 1   ;400ad0: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%69 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400ad8: lui $1<POINTER>, 4096 [POINTER]
%70 = getelementptr inbounds i8* %69, i32 %68   ;400ae0: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%71 = getelementptr inbounds i8* %70, i32 705
%72 = load i8* %71, align 4   ;400ae8: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%73 = xor i8 %60, %72   ;400af0: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%74 = getelementptr inbounds i8* %0, i32 4
store i8 %73, i8* %74   ;400af8: sb $3<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%75 = getelementptr inbounds i8* %4, i32 3
%76 = load i8* %75, align 4   ;400b00: lbu $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%77 = xor i8 %73, %76   ;400b08: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%78 = getelementptr inbounds i8* %0, i32 4
store i8 %77, i8* %78   ;400b10: sb $3<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%79 = getelementptr inbounds i8* %4, i32 0
%80 = load i8* %79, align 4   ;400b18: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%81 = getelementptr inbounds i8* %0, i32 8
store i8 %80, i8* %81   ;400b20: sb $3<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%82 = getelementptr inbounds i8* %4, i32 1
%83 = load i8* %82, align 4   ;400b28: lbu $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%84 = xor i8 %80, %83   ;400b30: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%85 = getelementptr inbounds i8* %0, i32 8
store i8 %84, i8* %85   ;400b38: sb $3<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%86 = getelementptr inbounds i8* %4, i32 2
%87 = load i8* %86, align 4   ;400b40: lbu $5<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%88 = zext i8 %87 to i32
%89 = shl i32 %88, 1   ;400b48: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%90 = zext i8 %87 to i32
%91 = add nsw i32 %89, %90   ;400b50: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%92 = shl i32 %91, 1   ;400b58: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%93 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400b60: lui $1<POINTER>, 4096 [POINTER]
%94 = getelementptr inbounds i8* %93, i32 %92   ;400b68: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%95 = getelementptr inbounds i8* %94, i32 704
%96 = load i8* %95, align 4   ;400b70: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%97 = xor i8 %84, %96   ;400b78: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%98 = getelementptr inbounds i8* %0, i32 8
store i8 %97, i8* %98   ;400b80: sb $3<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%99 = getelementptr inbounds i8* %4, i32 3
%100 = load i8* %99, align 4   ;400b88: lbu $5<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%101 = zext i8 %100 to i32
%102 = shl i32 %101, 1   ;400b90: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%103 = zext i8 %100 to i32
%104 = add nsw i32 %102, %103   ;400b98: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%105 = shl i32 %104, 1   ;400ba0: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%106 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400ba8: lui $1<POINTER>, 4096 [POINTER]
%107 = getelementptr inbounds i8* %106, i32 %105   ;400bb0: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%108 = getelementptr inbounds i8* %107, i32 705
%109 = load i8* %108, align 4   ;400bb8: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%110 = xor i8 %97, %109   ;400bc0: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%111 = getelementptr inbounds i8* %0, i32 8
store i8 %110, i8* %111   ;400bc8: sb $3<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%112 = getelementptr inbounds i8* %4, i32 0
%113 = load i8* %112, align 4   ;400bd0: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%114 = zext i8 %113 to i32
%115 = shl i32 %114, 1   ;400bd8: sll $2<INTEGER>,$3<BYTE>,0x01 [VALUE]
%116 = zext i8 %113 to i32
%117 = add nsw i32 %115, %116   ;400be0: addu $2<INTEGER>,$2<INTEGER>,$3<BYTE> [VALUE]
%118 = shl i32 %117, 1   ;400be8: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%119 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400bf0: lui $3<POINTER>, 4096 [POINTER]
%120 = getelementptr inbounds i8* %119, i32 %118   ;400bf8: addu $3<POINTER>,$3<POINTER>,$2<INTEGER> [POINTER]
%121 = getelementptr inbounds i8* %120, i32 705
%122 = load i8* %121, align 4   ;400c00: lbu $3<BYTE>, 705($3<POINTER>)<VALUE> [POINTER]
%123 = getelementptr inbounds i8* %0, i32 12
store i8 %122, i8* %123   ;400c08: sb $3<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%124 = getelementptr inbounds i8* %4, i32 1
%125 = load i8* %124, align 4   ;400c10: lbu $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%126 = xor i8 %122, %125   ;400c18: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%127 = getelementptr inbounds i8* %0, i32 12
store i8 %126, i8* %127   ;400c20: sb $3<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%128 = getelementptr inbounds i8* %4, i32 2
%129 = load i8* %128, align 4   ;400c28: lbu $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%130 = xor i8 %126, %129   ;400c30: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%131 = getelementptr inbounds i8* %0, i32 12
store i8 %130, i8* %131   ;400c38: sb $3<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%132 = getelementptr inbounds i8* %4, i32 3
%133 = load i8* %132, align 4   ;400c40: lbu $5<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%134 = zext i8 %133 to i32
%135 = shl i32 %134, 1   ;400c48: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%136 = zext i8 %133 to i32
%137 = add nsw i32 %135, %136   ;400c50: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%138 = shl i32 %137, 1   ;400c58: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%139 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400c60: lui $1<POINTER>, 4096 [POINTER]
%140 = getelementptr inbounds i8* %139, i32 %138   ;400c68: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%141 = getelementptr inbounds i8* %140, i32 704
%142 = load i8* %141, align 4   ;400c70: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%143 = getelementptr inbounds i8* %0, i32 1
%144 = load i8* %143, align 4   ;400c78: lbu $5<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%145 = xor i8 %130, %142   ;400c80: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%146 = getelementptr inbounds i8* %0, i32 12
store i8 %145, i8* %146   ;400c88: sb $3<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%147 = getelementptr inbounds i8* %4, i32 0
store i8 %144, i8* %147   ;400c90: sb $5<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%148 = getelementptr inbounds i8* %0, i32 5
%149 = load i8* %148, align 4   ;400c98: lbu $2<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%150 = getelementptr inbounds i8* %4, i32 1
store i8 %149, i8* %150   ;400ca0: sb $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%151 = getelementptr inbounds i8* %0, i32 9
%152 = load i8* %151, align 4   ;400ca8: lbu $2<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%153 = getelementptr inbounds i8* %4, i32 2
store i8 %152, i8* %153   ;400cb0: sb $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%154 = getelementptr inbounds i8* %0, i32 13
%155 = load i8* %154, align 4   ;400cb8: lbu $2<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%156 = getelementptr inbounds i8* %4, i32 3
store i8 %155, i8* %156   ;400cc0: sb $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%157 = zext i8 %144 to i32
%158 = shl i32 %157, 1   ;400cc8: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%159 = zext i8 %144 to i32
%160 = add nsw i32 %158, %159   ;400cd0: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%161 = shl i32 %160, 1   ;400cd8: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%162 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400ce0: lui $3<POINTER>, 4096 [POINTER]
%163 = getelementptr inbounds i8* %162, i32 %161   ;400ce8: addu $3<POINTER>,$3<POINTER>,$2<INTEGER> [POINTER]
%164 = getelementptr inbounds i8* %163, i32 704
%165 = load i8* %164, align 4   ;400cf0: lbu $3<BYTE>, 704($3<POINTER>)<VALUE> [POINTER]
%166 = getelementptr inbounds i8* %0, i32 1
store i8 %165, i8* %166   ;400cf8: sb $3<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%167 = getelementptr inbounds i8* %4, i32 1
%168 = load i8* %167, align 4   ;400d00: lbu $5<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%169 = zext i8 %168 to i32
%170 = shl i32 %169, 1   ;400d08: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%171 = zext i8 %168 to i32
%172 = add nsw i32 %170, %171   ;400d10: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%173 = shl i32 %172, 1   ;400d18: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%174 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400d20: lui $1<POINTER>, 4096 [POINTER]
%175 = getelementptr inbounds i8* %174, i32 %173   ;400d28: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%176 = getelementptr inbounds i8* %175, i32 705
%177 = load i8* %176, align 4   ;400d30: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%178 = xor i8 %165, %177   ;400d38: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%179 = getelementptr inbounds i8* %0, i32 1
store i8 %178, i8* %179   ;400d40: sb $3<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%180 = getelementptr inbounds i8* %4, i32 2
%181 = load i8* %180, align 4   ;400d48: lbu $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%182 = xor i8 %178, %181   ;400d50: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%183 = getelementptr inbounds i8* %0, i32 1
store i8 %182, i8* %183   ;400d58: sb $3<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%184 = getelementptr inbounds i8* %4, i32 3
%185 = load i8* %184, align 4   ;400d60: lbu $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%186 = xor i8 %182, %185   ;400d68: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%187 = getelementptr inbounds i8* %0, i32 1
store i8 %186, i8* %187   ;400d70: sb $3<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%188 = getelementptr inbounds i8* %4, i32 0
%189 = load i8* %188, align 4   ;400d78: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%190 = getelementptr inbounds i8* %0, i32 5
store i8 %189, i8* %190   ;400d80: sb $3<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%191 = getelementptr inbounds i8* %4, i32 1
%192 = load i8* %191, align 4   ;400d88: lbu $5<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%193 = zext i8 %192 to i32
%194 = shl i32 %193, 1   ;400d90: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%195 = zext i8 %192 to i32
%196 = add nsw i32 %194, %195   ;400d98: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%197 = shl i32 %196, 1   ;400da0: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%198 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400da8: lui $1<POINTER>, 4096 [POINTER]
%199 = getelementptr inbounds i8* %198, i32 %197   ;400db0: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%200 = getelementptr inbounds i8* %199, i32 704
%201 = load i8* %200, align 4   ;400db8: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%202 = xor i8 %189, %201   ;400dc0: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%203 = getelementptr inbounds i8* %0, i32 5
store i8 %202, i8* %203   ;400dc8: sb $3<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%204 = getelementptr inbounds i8* %4, i32 2
%205 = load i8* %204, align 4   ;400dd0: lbu $5<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%206 = zext i8 %205 to i32
%207 = shl i32 %206, 1   ;400dd8: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%208 = zext i8 %205 to i32
%209 = add nsw i32 %207, %208   ;400de0: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%210 = shl i32 %209, 1   ;400de8: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%211 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400df0: lui $1<POINTER>, 4096 [POINTER]
%212 = getelementptr inbounds i8* %211, i32 %210   ;400df8: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%213 = getelementptr inbounds i8* %212, i32 705
%214 = load i8* %213, align 4   ;400e00: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%215 = xor i8 %202, %214   ;400e08: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%216 = getelementptr inbounds i8* %0, i32 5
store i8 %215, i8* %216   ;400e10: sb $3<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%217 = getelementptr inbounds i8* %4, i32 3
%218 = load i8* %217, align 4   ;400e18: lbu $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%219 = xor i8 %215, %218   ;400e20: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%220 = getelementptr inbounds i8* %0, i32 5
store i8 %219, i8* %220   ;400e28: sb $3<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%221 = getelementptr inbounds i8* %4, i32 0
%222 = load i8* %221, align 4   ;400e30: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%223 = getelementptr inbounds i8* %0, i32 9
store i8 %222, i8* %223   ;400e38: sb $3<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%224 = getelementptr inbounds i8* %4, i32 1
%225 = load i8* %224, align 4   ;400e40: lbu $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%226 = xor i8 %222, %225   ;400e48: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%227 = getelementptr inbounds i8* %0, i32 9
store i8 %226, i8* %227   ;400e50: sb $3<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%228 = getelementptr inbounds i8* %4, i32 2
%229 = load i8* %228, align 4   ;400e58: lbu $5<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%230 = zext i8 %229 to i32
%231 = shl i32 %230, 1   ;400e60: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%232 = zext i8 %229 to i32
%233 = add nsw i32 %231, %232   ;400e68: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%234 = shl i32 %233, 1   ;400e70: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%235 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400e78: lui $1<POINTER>, 4096 [POINTER]
%236 = getelementptr inbounds i8* %235, i32 %234   ;400e80: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%237 = getelementptr inbounds i8* %236, i32 704
%238 = load i8* %237, align 4   ;400e88: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%239 = xor i8 %226, %238   ;400e90: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%240 = getelementptr inbounds i8* %0, i32 9
store i8 %239, i8* %240   ;400e98: sb $3<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%241 = getelementptr inbounds i8* %4, i32 3
%242 = load i8* %241, align 4   ;400ea0: lbu $5<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%243 = zext i8 %242 to i32
%244 = shl i32 %243, 1   ;400ea8: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%245 = zext i8 %242 to i32
%246 = add nsw i32 %244, %245   ;400eb0: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%247 = shl i32 %246, 1   ;400eb8: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%248 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400ec0: lui $1<POINTER>, 4096 [POINTER]
%249 = getelementptr inbounds i8* %248, i32 %247   ;400ec8: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%250 = getelementptr inbounds i8* %249, i32 705
%251 = load i8* %250, align 4   ;400ed0: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%252 = xor i8 %239, %251   ;400ed8: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%253 = getelementptr inbounds i8* %0, i32 9
store i8 %252, i8* %253   ;400ee0: sb $3<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%254 = getelementptr inbounds i8* %4, i32 0
%255 = load i8* %254, align 4   ;400ee8: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%256 = zext i8 %255 to i32
%257 = shl i32 %256, 1   ;400ef0: sll $2<INTEGER>,$3<BYTE>,0x01 [VALUE]
%258 = zext i8 %255 to i32
%259 = add nsw i32 %257, %258   ;400ef8: addu $2<INTEGER>,$2<INTEGER>,$3<BYTE> [VALUE]
%260 = shl i32 %259, 1   ;400f00: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%261 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400f08: lui $3<POINTER>, 4096 [POINTER]
%262 = getelementptr inbounds i8* %261, i32 %260   ;400f10: addu $3<POINTER>,$3<POINTER>,$2<INTEGER> [POINTER]
%263 = getelementptr inbounds i8* %262, i32 705
%264 = load i8* %263, align 4   ;400f18: lbu $3<BYTE>, 705($3<POINTER>)<VALUE> [POINTER]
%265 = getelementptr inbounds i8* %0, i32 13
store i8 %264, i8* %265   ;400f20: sb $3<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%266 = getelementptr inbounds i8* %4, i32 1
%267 = load i8* %266, align 4   ;400f28: lbu $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%268 = xor i8 %264, %267   ;400f30: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%269 = getelementptr inbounds i8* %0, i32 13
store i8 %268, i8* %269   ;400f38: sb $3<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%270 = getelementptr inbounds i8* %4, i32 2
%271 = load i8* %270, align 4   ;400f40: lbu $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%272 = xor i8 %268, %271   ;400f48: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%273 = getelementptr inbounds i8* %0, i32 13
store i8 %272, i8* %273   ;400f50: sb $3<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%274 = getelementptr inbounds i8* %4, i32 3
%275 = load i8* %274, align 4   ;400f58: lbu $5<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%276 = zext i8 %275 to i32
%277 = shl i32 %276, 1   ;400f60: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%278 = zext i8 %275 to i32
%279 = add nsw i32 %277, %278   ;400f68: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%280 = shl i32 %279, 1   ;400f70: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%281 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400f78: lui $1<POINTER>, 4096 [POINTER]
%282 = getelementptr inbounds i8* %281, i32 %280   ;400f80: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%283 = getelementptr inbounds i8* %282, i32 704
%284 = load i8* %283, align 4   ;400f88: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%285 = getelementptr inbounds i8* %0, i32 2
%286 = load i8* %285, align 4   ;400f90: lbu $5<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%287 = xor i8 %272, %284   ;400f98: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%288 = getelementptr inbounds i8* %0, i32 13
store i8 %287, i8* %288   ;400fa0: sb $3<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%289 = getelementptr inbounds i8* %4, i32 0
store i8 %286, i8* %289   ;400fa8: sb $5<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%290 = getelementptr inbounds i8* %0, i32 6
%291 = load i8* %290, align 4   ;400fb0: lbu $2<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%292 = getelementptr inbounds i8* %4, i32 1
store i8 %291, i8* %292   ;400fb8: sb $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%293 = getelementptr inbounds i8* %0, i32 10
%294 = load i8* %293, align 4   ;400fc0: lbu $2<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%295 = getelementptr inbounds i8* %4, i32 2
store i8 %294, i8* %295   ;400fc8: sb $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%296 = getelementptr inbounds i8* %0, i32 14
%297 = load i8* %296, align 4   ;400fd0: lbu $2<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%298 = getelementptr inbounds i8* %4, i32 3
store i8 %297, i8* %298   ;400fd8: sb $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%299 = zext i8 %286 to i32
%300 = shl i32 %299, 1   ;400fe0: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%301 = zext i8 %286 to i32
%302 = add nsw i32 %300, %301   ;400fe8: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%303 = shl i32 %302, 1   ;400ff0: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%304 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400ff8: lui $3<POINTER>, 4096 [POINTER]
%305 = getelementptr inbounds i8* %304, i32 %303   ;401000: addu $3<POINTER>,$3<POINTER>,$2<INTEGER> [POINTER]
%306 = getelementptr inbounds i8* %305, i32 704
%307 = load i8* %306, align 4   ;401008: lbu $3<BYTE>, 704($3<POINTER>)<VALUE> [POINTER]
%308 = getelementptr inbounds i8* %0, i32 2
store i8 %307, i8* %308   ;401010: sb $3<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%309 = getelementptr inbounds i8* %4, i32 1
%310 = load i8* %309, align 4   ;401018: lbu $5<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%311 = zext i8 %310 to i32
%312 = shl i32 %311, 1   ;401020: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%313 = zext i8 %310 to i32
%314 = add nsw i32 %312, %313   ;401028: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%315 = shl i32 %314, 1   ;401030: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%316 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401038: lui $1<POINTER>, 4096 [POINTER]
%317 = getelementptr inbounds i8* %316, i32 %315   ;401040: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%318 = getelementptr inbounds i8* %317, i32 705
%319 = load i8* %318, align 4   ;401048: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%320 = xor i8 %307, %319   ;401050: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%321 = getelementptr inbounds i8* %0, i32 2
store i8 %320, i8* %321   ;401058: sb $3<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%322 = getelementptr inbounds i8* %4, i32 2
%323 = load i8* %322, align 4   ;401060: lbu $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%324 = xor i8 %320, %323   ;401068: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%325 = getelementptr inbounds i8* %0, i32 2
store i8 %324, i8* %325   ;401070: sb $3<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%326 = getelementptr inbounds i8* %4, i32 3
%327 = load i8* %326, align 4   ;401078: lbu $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%328 = xor i8 %324, %327   ;401080: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%329 = getelementptr inbounds i8* %0, i32 2
store i8 %328, i8* %329   ;401088: sb $3<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%330 = getelementptr inbounds i8* %4, i32 0
%331 = load i8* %330, align 4   ;401090: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%332 = getelementptr inbounds i8* %0, i32 6
store i8 %331, i8* %332   ;401098: sb $3<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%333 = getelementptr inbounds i8* %4, i32 1
%334 = load i8* %333, align 4   ;4010a0: lbu $5<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%335 = zext i8 %334 to i32
%336 = shl i32 %335, 1   ;4010a8: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%337 = zext i8 %334 to i32
%338 = add nsw i32 %336, %337   ;4010b0: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%339 = shl i32 %338, 1   ;4010b8: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%340 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4010c0: lui $1<POINTER>, 4096 [POINTER]
%341 = getelementptr inbounds i8* %340, i32 %339   ;4010c8: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%342 = getelementptr inbounds i8* %341, i32 704
%343 = load i8* %342, align 4   ;4010d0: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%344 = xor i8 %331, %343   ;4010d8: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%345 = getelementptr inbounds i8* %0, i32 6
store i8 %344, i8* %345   ;4010e0: sb $3<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%346 = getelementptr inbounds i8* %4, i32 2
%347 = load i8* %346, align 4   ;4010e8: lbu $5<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%348 = zext i8 %347 to i32
%349 = shl i32 %348, 1   ;4010f0: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%350 = zext i8 %347 to i32
%351 = add nsw i32 %349, %350   ;4010f8: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%352 = shl i32 %351, 1   ;401100: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%353 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401108: lui $1<POINTER>, 4096 [POINTER]
%354 = getelementptr inbounds i8* %353, i32 %352   ;401110: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%355 = getelementptr inbounds i8* %354, i32 705
%356 = load i8* %355, align 4   ;401118: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%357 = xor i8 %344, %356   ;401120: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%358 = getelementptr inbounds i8* %0, i32 6
store i8 %357, i8* %358   ;401128: sb $3<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%359 = getelementptr inbounds i8* %4, i32 3
%360 = load i8* %359, align 4   ;401130: lbu $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%361 = xor i8 %357, %360   ;401138: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%362 = getelementptr inbounds i8* %0, i32 6
store i8 %361, i8* %362   ;401140: sb $3<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%363 = getelementptr inbounds i8* %4, i32 0
%364 = load i8* %363, align 4   ;401148: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%365 = getelementptr inbounds i8* %0, i32 10
store i8 %364, i8* %365   ;401150: sb $3<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%366 = getelementptr inbounds i8* %4, i32 1
%367 = load i8* %366, align 4   ;401158: lbu $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%368 = xor i8 %364, %367   ;401160: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%369 = getelementptr inbounds i8* %0, i32 10
store i8 %368, i8* %369   ;401168: sb $3<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%370 = getelementptr inbounds i8* %4, i32 2
%371 = load i8* %370, align 4   ;401170: lbu $5<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%372 = zext i8 %371 to i32
%373 = shl i32 %372, 1   ;401178: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%374 = zext i8 %371 to i32
%375 = add nsw i32 %373, %374   ;401180: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%376 = shl i32 %375, 1   ;401188: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%377 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401190: lui $1<POINTER>, 4096 [POINTER]
%378 = getelementptr inbounds i8* %377, i32 %376   ;401198: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%379 = getelementptr inbounds i8* %378, i32 704
%380 = load i8* %379, align 4   ;4011a0: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%381 = xor i8 %368, %380   ;4011a8: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%382 = getelementptr inbounds i8* %0, i32 10
store i8 %381, i8* %382   ;4011b0: sb $3<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%383 = getelementptr inbounds i8* %4, i32 3
%384 = load i8* %383, align 4   ;4011b8: lbu $5<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%385 = zext i8 %384 to i32
%386 = shl i32 %385, 1   ;4011c0: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%387 = zext i8 %384 to i32
%388 = add nsw i32 %386, %387   ;4011c8: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%389 = shl i32 %388, 1   ;4011d0: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%390 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4011d8: lui $1<POINTER>, 4096 [POINTER]
%391 = getelementptr inbounds i8* %390, i32 %389   ;4011e0: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%392 = getelementptr inbounds i8* %391, i32 705
%393 = load i8* %392, align 4   ;4011e8: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%394 = xor i8 %381, %393   ;4011f0: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%395 = getelementptr inbounds i8* %0, i32 10
store i8 %394, i8* %395   ;4011f8: sb $3<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%396 = getelementptr inbounds i8* %4, i32 0
%397 = load i8* %396, align 4   ;401200: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%398 = zext i8 %397 to i32
%399 = shl i32 %398, 1   ;401208: sll $2<INTEGER>,$3<BYTE>,0x01 [VALUE]
%400 = zext i8 %397 to i32
%401 = add nsw i32 %399, %400   ;401210: addu $2<INTEGER>,$2<INTEGER>,$3<BYTE> [VALUE]
%402 = shl i32 %401, 1   ;401218: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%403 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401220: lui $3<POINTER>, 4096 [POINTER]
%404 = getelementptr inbounds i8* %403, i32 %402   ;401228: addu $3<POINTER>,$3<POINTER>,$2<INTEGER> [POINTER]
%405 = getelementptr inbounds i8* %404, i32 705
%406 = load i8* %405, align 4   ;401230: lbu $3<BYTE>, 705($3<POINTER>)<VALUE> [POINTER]
%407 = getelementptr inbounds i8* %0, i32 14
store i8 %406, i8* %407   ;401238: sb $3<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%408 = getelementptr inbounds i8* %4, i32 1
%409 = load i8* %408, align 4   ;401240: lbu $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%410 = xor i8 %406, %409   ;401248: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%411 = getelementptr inbounds i8* %0, i32 14
store i8 %410, i8* %411   ;401250: sb $3<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%412 = getelementptr inbounds i8* %4, i32 2
%413 = load i8* %412, align 4   ;401258: lbu $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%414 = xor i8 %410, %413   ;401260: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%415 = getelementptr inbounds i8* %0, i32 14
store i8 %414, i8* %415   ;401268: sb $3<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%416 = getelementptr inbounds i8* %4, i32 3
%417 = load i8* %416, align 4   ;401270: lbu $5<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%418 = zext i8 %417 to i32
%419 = shl i32 %418, 1   ;401278: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%420 = zext i8 %417 to i32
%421 = add nsw i32 %419, %420   ;401280: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%422 = shl i32 %421, 1   ;401288: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%423 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401290: lui $1<POINTER>, 4096 [POINTER]
%424 = getelementptr inbounds i8* %423, i32 %422   ;401298: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%425 = getelementptr inbounds i8* %424, i32 704
%426 = load i8* %425, align 4   ;4012a0: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%427 = getelementptr inbounds i8* %0, i32 3
%428 = load i8* %427, align 4   ;4012a8: lbu $5<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%429 = xor i8 %414, %426   ;4012b0: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%430 = getelementptr inbounds i8* %0, i32 14
store i8 %429, i8* %430   ;4012b8: sb $3<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%431 = getelementptr inbounds i8* %4, i32 0
store i8 %428, i8* %431   ;4012c0: sb $5<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%432 = getelementptr inbounds i8* %0, i32 7
%433 = load i8* %432, align 4   ;4012c8: lbu $2<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%434 = getelementptr inbounds i8* %4, i32 1
store i8 %433, i8* %434   ;4012d0: sb $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%435 = getelementptr inbounds i8* %0, i32 11
%436 = load i8* %435, align 4   ;4012d8: lbu $2<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%437 = getelementptr inbounds i8* %4, i32 2
store i8 %436, i8* %437   ;4012e0: sb $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%438 = getelementptr inbounds i8* %0, i32 15
%439 = load i8* %438, align 4   ;4012e8: lbu $2<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%440 = getelementptr inbounds i8* %4, i32 3
store i8 %439, i8* %440   ;4012f0: sb $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%441 = zext i8 %428 to i32
%442 = shl i32 %441, 1   ;4012f8: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%443 = zext i8 %428 to i32
%444 = add nsw i32 %442, %443   ;401300: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%445 = shl i32 %444, 1   ;401308: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%446 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401310: lui $3<POINTER>, 4096 [POINTER]
%447 = getelementptr inbounds i8* %446, i32 %445   ;401318: addu $3<POINTER>,$3<POINTER>,$2<INTEGER> [POINTER]
%448 = getelementptr inbounds i8* %447, i32 704
%449 = load i8* %448, align 4   ;401320: lbu $3<BYTE>, 704($3<POINTER>)<VALUE> [POINTER]
%450 = getelementptr inbounds i8* %0, i32 3
store i8 %449, i8* %450   ;401328: sb $3<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%451 = getelementptr inbounds i8* %4, i32 1
%452 = load i8* %451, align 4   ;401330: lbu $5<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%453 = zext i8 %452 to i32
%454 = shl i32 %453, 1   ;401338: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%455 = zext i8 %452 to i32
%456 = add nsw i32 %454, %455   ;401340: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%457 = shl i32 %456, 1   ;401348: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%458 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401350: lui $1<POINTER>, 4096 [POINTER]
%459 = getelementptr inbounds i8* %458, i32 %457   ;401358: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%460 = getelementptr inbounds i8* %459, i32 705
%461 = load i8* %460, align 4   ;401360: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%462 = xor i8 %449, %461   ;401368: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%463 = getelementptr inbounds i8* %0, i32 3
store i8 %462, i8* %463   ;401370: sb $3<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%464 = getelementptr inbounds i8* %4, i32 2
%465 = load i8* %464, align 4   ;401378: lbu $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%466 = xor i8 %462, %465   ;401380: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%467 = getelementptr inbounds i8* %0, i32 3
store i8 %466, i8* %467   ;401388: sb $3<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%468 = getelementptr inbounds i8* %4, i32 3
%469 = load i8* %468, align 4   ;401390: lbu $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%470 = xor i8 %466, %469   ;401398: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%471 = getelementptr inbounds i8* %0, i32 3
store i8 %470, i8* %471   ;4013a0: sb $3<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%472 = getelementptr inbounds i8* %4, i32 0
%473 = load i8* %472, align 4   ;4013a8: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%474 = getelementptr inbounds i8* %0, i32 7
store i8 %473, i8* %474   ;4013b0: sb $3<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%475 = getelementptr inbounds i8* %4, i32 1
%476 = load i8* %475, align 4   ;4013b8: lbu $5<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%477 = zext i8 %476 to i32
%478 = shl i32 %477, 1   ;4013c0: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%479 = zext i8 %476 to i32
%480 = add nsw i32 %478, %479   ;4013c8: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%481 = shl i32 %480, 1   ;4013d0: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%482 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4013d8: lui $1<POINTER>, 4096 [POINTER]
%483 = getelementptr inbounds i8* %482, i32 %481   ;4013e0: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%484 = getelementptr inbounds i8* %483, i32 704
%485 = load i8* %484, align 4   ;4013e8: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%486 = xor i8 %473, %485   ;4013f0: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%487 = getelementptr inbounds i8* %0, i32 7
store i8 %486, i8* %487   ;4013f8: sb $3<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%488 = getelementptr inbounds i8* %4, i32 2
%489 = load i8* %488, align 4   ;401400: lbu $5<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%490 = zext i8 %489 to i32
%491 = shl i32 %490, 1   ;401408: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%492 = zext i8 %489 to i32
%493 = add nsw i32 %491, %492   ;401410: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%494 = shl i32 %493, 1   ;401418: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%495 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401420: lui $1<POINTER>, 4096 [POINTER]
%496 = getelementptr inbounds i8* %495, i32 %494   ;401428: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%497 = getelementptr inbounds i8* %496, i32 705
%498 = load i8* %497, align 4   ;401430: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%499 = xor i8 %486, %498   ;401438: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%500 = getelementptr inbounds i8* %0, i32 7
store i8 %499, i8* %500   ;401440: sb $3<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%501 = getelementptr inbounds i8* %4, i32 3
%502 = load i8* %501, align 4   ;401448: lbu $2<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%503 = xor i8 %499, %502   ;401450: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%504 = getelementptr inbounds i8* %0, i32 7
store i8 %503, i8* %504   ;401458: sb $3<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%505 = getelementptr inbounds i8* %4, i32 0
%506 = load i8* %505, align 4   ;401460: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%507 = getelementptr inbounds i8* %0, i32 11
store i8 %506, i8* %507   ;401468: sb $3<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%508 = getelementptr inbounds i8* %4, i32 1
%509 = load i8* %508, align 4   ;401470: lbu $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%510 = xor i8 %506, %509   ;401478: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%511 = getelementptr inbounds i8* %0, i32 11
store i8 %510, i8* %511   ;401480: sb $3<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%512 = getelementptr inbounds i8* %4, i32 2
%513 = load i8* %512, align 4   ;401488: lbu $5<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%514 = zext i8 %513 to i32
%515 = shl i32 %514, 1   ;401490: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%516 = zext i8 %513 to i32
%517 = add nsw i32 %515, %516   ;401498: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%518 = shl i32 %517, 1   ;4014a0: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%519 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4014a8: lui $1<POINTER>, 4096 [POINTER]
%520 = getelementptr inbounds i8* %519, i32 %518   ;4014b0: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%521 = getelementptr inbounds i8* %520, i32 704
%522 = load i8* %521, align 4   ;4014b8: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%523 = xor i8 %510, %522   ;4014c0: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%524 = getelementptr inbounds i8* %0, i32 11
store i8 %523, i8* %524   ;4014c8: sb $3<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%525 = getelementptr inbounds i8* %4, i32 3
%526 = load i8* %525, align 4   ;4014d0: lbu $5<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%527 = zext i8 %526 to i32
%528 = shl i32 %527, 1   ;4014d8: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%529 = zext i8 %526 to i32
%530 = add nsw i32 %528, %529   ;4014e0: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%531 = shl i32 %530, 1   ;4014e8: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%532 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4014f0: lui $1<POINTER>, 4096 [POINTER]
%533 = getelementptr inbounds i8* %532, i32 %531   ;4014f8: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%534 = getelementptr inbounds i8* %533, i32 705
%535 = load i8* %534, align 4   ;401500: lbu $2<BYTE>, 705($1<POINTER>)<VALUE> [POINTER]
%536 = xor i8 %523, %535   ;401508: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%537 = getelementptr inbounds i8* %0, i32 11
store i8 %536, i8* %537   ;401510: sb $3<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%538 = getelementptr inbounds i8* %4, i32 0
%539 = load i8* %538, align 4   ;401518: lbu $3<BYTE>, 0($29<POINTER>)<POINTER> [POINTER]
%540 = zext i8 %539 to i32
%541 = shl i32 %540, 1   ;401520: sll $2<INTEGER>,$3<BYTE>,0x01 [VALUE]
%542 = zext i8 %539 to i32
%543 = add nsw i32 %541, %542   ;401528: addu $2<INTEGER>,$2<INTEGER>,$3<BYTE> [VALUE]
%544 = shl i32 %543, 1   ;401530: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%545 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401538: lui $3<POINTER>, 4096 [POINTER]
%546 = getelementptr inbounds i8* %545, i32 %544   ;401540: addu $3<POINTER>,$3<POINTER>,$2<INTEGER> [POINTER]
%547 = getelementptr inbounds i8* %546, i32 705
%548 = load i8* %547, align 4   ;401548: lbu $3<BYTE>, 705($3<POINTER>)<VALUE> [POINTER]
%549 = getelementptr inbounds i8* %0, i32 15
store i8 %548, i8* %549   ;401550: sb $3<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%550 = getelementptr inbounds i8* %4, i32 1
%551 = load i8* %550, align 4   ;401558: lbu $2<BYTE>, 1($29<POINTER>)<POINTER> [POINTER]
%552 = xor i8 %548, %551   ;401560: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%553 = getelementptr inbounds i8* %0, i32 15
store i8 %552, i8* %553   ;401568: sb $3<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%554 = getelementptr inbounds i8* %4, i32 2
%555 = load i8* %554, align 4   ;401570: lbu $2<BYTE>, 2($29<POINTER>)<POINTER> [POINTER]
%556 = xor i8 %552, %555   ;401578: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%557 = getelementptr inbounds i8* %0, i32 15
store i8 %556, i8* %557   ;401580: sb $3<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%558 = getelementptr inbounds i8* %4, i32 3
%559 = load i8* %558, align 4   ;401588: lbu $5<BYTE>, 3($29<POINTER>)<POINTER> [POINTER]
%560 = zext i8 %559 to i32
%561 = shl i32 %560, 1   ;401590: sll $2<INTEGER>,$5<BYTE>,0x01 [VALUE]
%562 = zext i8 %559 to i32
%563 = add nsw i32 %561, %562   ;401598: addu $2<INTEGER>,$2<INTEGER>,$5<BYTE> [VALUE]
%564 = shl i32 %563, 1   ;4015a0: sll $2<INTEGER>,$2<INTEGER>,0x01 [VALUE]
%565 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4015a8: lui $1<POINTER>, 4096 [POINTER]
%566 = getelementptr inbounds i8* %565, i32 %564   ;4015b0: addu $1<POINTER>,$1<POINTER>,$2<INTEGER> [POINTER]
%567 = getelementptr inbounds i8* %566, i32 704
%568 = load i8* %567, align 4   ;4015b8: lbu $2<BYTE>, 704($1<POINTER>)<VALUE> [POINTER]
%569 = xor i8 %556, %568   ;4015c0: xor $3<BYTE>,$3<BYTE>,$2<BYTE> [VALUE]
%570 = getelementptr inbounds i8* %0, i32 15
store i8 %569, i8* %570   ;4015c8: sb $3<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%571 = getelementptr inbounds i8* %4, i32 8   ;4015d0: addiu $29<POINTER>,$29<POINTER>,8 [POINTER]
br label %return

return:
ret void   ;4015d8: jr $31<VALUE><JUMP> [JUMP]
}

define i32 @SubWord(i32 %a) nounwind {
entry:
%a_addr = alloca i32, align 4
store i32 %a, i32* %a_addr
%0 = load i32* %a_addr, align 4
%1 = load i8** @stack_SubWord, align 4

%2 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4015e0: lui $6<POINTER>, 4096 [POINTER]
%3 = getelementptr inbounds i8* %2, i32 0   ;4015e8: addiu $6<POINTER>,$6<POINTER>,0 [POINTER]
%4 = and i32 %0, 240   ;4015f0: andi $5<INTEGER>,$4<INTEGER>,240 [VALUE]
%5 = getelementptr inbounds i8* %3, i32 %4   ;4015f8: addu $5<POINTER>,$5<INTEGER>,$6<POINTER> [POINTER]
%6 = and i32 %0, 15   ;401600: andi $2<INTEGER>,$4<INTEGER>,15 [VALUE]
%7 = getelementptr inbounds i8* %5, i32 %6   ;401608: addu $5<POINTER>,$5<POINTER>,$2<INTEGER> [POINTER]
%8 = lshr i32 %0, 8   ;401610: srl $2<INTEGER>,$4<INTEGER>,0x08 [VALUE]
%9 = and i32 %8, 240   ;401618: andi $2<INTEGER>,$2<INTEGER>,240 [VALUE]
%10 = getelementptr inbounds i8* %3, i32 %9   ;401620: addu $2<POINTER>,$2<INTEGER>,$6<POINTER> [POINTER]
%11 = lshr i32 %0, 8   ;401628: srl $3<INTEGER>,$4<INTEGER>,0x08 [VALUE]
%12 = and i32 %11, 15   ;401630: andi $3<INTEGER>,$3<INTEGER>,15 [VALUE]
%13 = getelementptr inbounds i8* %10, i32 %12   ;401638: addu $2<POINTER>,$2<POINTER>,$3<INTEGER> [POINTER]
%14 = getelementptr inbounds i8* %13, i32 0
%15 = load i8* %14, align 4   ;401640: lbu $2<BYTE>, 0($2<POINTER>)<VALUE> [POINTER]
%16 = getelementptr inbounds i8* %7, i32 0
%17 = load i8* %16, align 4   ;401648: lbu $5<BYTE>, 0($5<POINTER>)<POINTER> [POINTER]
%18 = lshr i32 %0, 16   ;401650: srl $3<INTEGER>,$4<INTEGER>,0x010 [VALUE]
%19 = and i32 %18, 15   ;401658: andi $3<INTEGER>,$3<INTEGER>,15 [VALUE]
%20 = zext i8 %15 to i32
%21 = shl i32 %20, 8   ;401660: sll $2<INTEGER>,$2<BYTE>,0x08 [VALUE]
%22 = zext i8 %17 to i32
%23 = add nsw i32 %22, %21   ;401668: addu $5<INTEGER>,$5<BYTE>,$2<INTEGER> [VALUE]
%24 = lshr i32 %0, 16   ;401670: srl $2<INTEGER>,$4<INTEGER>,0x010 [VALUE]
%25 = and i32 %24, 240   ;401678: andi $2<INTEGER>,$2<INTEGER>,240 [VALUE]
%26 = getelementptr inbounds i8* %3, i32 %25   ;401680: addu $2<POINTER>,$2<INTEGER>,$6<POINTER> [POINTER]
%27 = getelementptr inbounds i8* %26, i32 %19   ;401688: addu $2<POINTER>,$2<POINTER>,$3<INTEGER> [POINTER]
%28 = getelementptr inbounds i8* %27, i32 0
%29 = load i8* %28, align 4   ;401690: lbu $3<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%30 = lshr i32 %0, 28   ;401698: srl $2<INTEGER>,$4<INTEGER>,0x01c [VALUE]
%31 = shl i32 %30, 4   ;4016a0: sll $2<INTEGER>,$2<INTEGER>,0x04 [VALUE]
%32 = getelementptr inbounds i8* %3, i32 %31   ;4016a8: addu $2<POINTER>,$2<INTEGER>,$6<POINTER> [POINTER]
%33 = lshr i32 %0, 24   ;4016b0: srl $4<INTEGER>,$4<INTEGER>,0x018 [VALUE]
%34 = and i32 %33, 15   ;4016b8: andi $4<INTEGER>,$4<INTEGER>,15 [VALUE]
%35 = getelementptr inbounds i8* %32, i32 %34   ;4016c0: addu $2<POINTER>,$2<POINTER>,$4<INTEGER> [POINTER]
%36 = getelementptr inbounds i8* %35, i32 0
%37 = load i8* %36, align 4   ;4016c8: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%38 = zext i8 %29 to i32
%39 = shl i32 %38, 16   ;4016d0: sll $3<INTEGER>,$3<BYTE>,0x010 [VALUE]
%40 = add nsw i32 %23, %39   ;4016d8: addu $5<INTEGER>,$5<INTEGER>,$3<INTEGER> [VALUE]
%41 = zext i8 %37 to i32
%42 = shl i32 %41, 24   ;4016e0: sll $2<INTEGER>,$2<BYTE>,0x018 [VALUE]
%43 = add nsw i32 %40, %42   ;4016e8: addu $2<INTEGER>,$5<INTEGER>,$2<INTEGER> [VALUE]
br label %return

return:
%retvall = alloca i32
store i32 %43, i32* %retvall
%retval = load i32* %retvall
ret i32 %retval   ;4016f0: jr $31<VALUE><JUMP> [JUMP]
}

define void @KeyExpansion(i8* %a, i8* %b, i32 %c) nounwind {
entry:
%a_addr = alloca i8*, align 4
store i8* %a, i8** %a_addr
%0 = load i8** %a_addr, align 4
%b_addr = alloca i8*, align 4
store i8* %b, i8** %b_addr
%1 = load i8** %b_addr, align 4
%c_addr = alloca i32, align 4
store i32 %c, i32* %c_addr
%2 = load i32* %c_addr, align 4
%3 = load i8** @stack_KeyExpansion, align 4

%4 = getelementptr inbounds i8* %3, i32 -128   ;4016f8: addiu $29<POINTER>,$29<POINTER>,-128<VALUE> [POINTER]
%5 = getelementptr inbounds i8* %0, i32 0   ;401700: addu $10<POINTER>,$0<INTEGER>,$4<POINTER> [POINTER]
%6 = load i32* @zero, align 4
%7 = getelementptr inbounds i8* %4, i32 100
%8 = bitcast i8* %7 to i32*
store i32 %6, i32* %8   ;401708: sw $19<VALUE>, 100($29<POINTER>)<POINTER> [POINTER]
%9 = getelementptr inbounds i8* %1, i32 0   ;401710: addu $19<POINTER>,$0<INTEGER>,$5<POINTER> [POINTER]
%10 = add nsw i32 0, 4   ;401718: addiu $11<INTEGER>,$0<INTEGER>,4 [VALUE]
%11 = getelementptr inbounds i8* %4, i32 16   ;401720: addiu $8<POINTER>,$29<POINTER>,16 [POINTER]
%12 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401728: lui $7<POINTER>, 4096 [POINTER]
%13 = getelementptr inbounds i8* %12, i32 512   ;401730: addiu $7<POINTER>,$7<POINTER>,512 [POINTER]
%14 = getelementptr inbounds i8* %13, i32 48   ;401738: addiu $9<POINTER>,$7<POINTER>,48 [POINTER]
%15 = load i32* @zero, align 4
%16 = getelementptr inbounds i8* %4, i32 120
%17 = bitcast i8* %16 to i32*
store i32 %15, i32* %17   ;401740: sw $31<VALUE>, 120($29<POINTER>)<POINTER> [POINTER]
%18 = load i32* @zero, align 4
%19 = getelementptr inbounds i8* %4, i32 116
%20 = bitcast i8* %19 to i32*
store i32 %18, i32* %20   ;401748: sw $23<VALUE>, 116($29<POINTER>)<POINTER> [POINTER]
%21 = load i32* @zero, align 4
%22 = getelementptr inbounds i8* %4, i32 112
%23 = bitcast i8* %22 to i32*
store i32 %21, i32* %23   ;401750: sw $22<VALUE>, 112($29<POINTER>)<POINTER> [POINTER]
%24 = load i32* @zero, align 4
%25 = getelementptr inbounds i8* %4, i32 108
%26 = bitcast i8* %25 to i32*
store i32 %24, i32* %26   ;401758: sw $21<VALUE>, 108($29<POINTER>)<POINTER> [POINTER]
%27 = load i32* @zero, align 4
%28 = getelementptr inbounds i8* %4, i32 104
%29 = bitcast i8* %28 to i32*
store i32 %27, i32* %29   ;401760: sw $20<VALUE>, 104($29<POINTER>)<POINTER> [POINTER]
%30 = load i32* @zero, align 4
%31 = getelementptr inbounds i8* %4, i32 96
%32 = bitcast i8* %31 to i32*
store i32 %30, i32* %32   ;401768: sw $18<VALUE>, 96($29<POINTER>)<POINTER> [POINTER]
%33 = load i32* @zero, align 4
%34 = getelementptr inbounds i8* %4, i32 92
%35 = bitcast i8* %34 to i32*
store i32 %33, i32* %35   ;401770: sw $17<VALUE>, 92($29<POINTER>)<POINTER> [POINTER]
%36 = load i32* @zero, align 4
%37 = getelementptr inbounds i8* %4, i32 88
%38 = bitcast i8* %37 to i32*
store i32 %36, i32* %38   ;401778: sw $16<VALUE>, 88($29<POINTER>)<POINTER> [POINTER]
br label %label-1

label-1:
%39 = phi i8* [ %13 , %entry ], [ %61 , %label-1 ]
%40 = phi i8* [ %11 , %entry ], [ %62 , %label-1 ]
%41 = getelementptr inbounds i8* %39, i32 0
%42 = bitcast i8* %41 to i32*
%43 = load i32* %42, align 4   ;401780: lw $2<INTEGER>, 0($7<POINTER>)<VALUE> [POINTER]
%44 = getelementptr inbounds i8* %39, i32 4
%45 = bitcast i8* %44 to i32*
%46 = load i32* %45, align 4   ;401788: lw $3<INTEGER>, 4($7<POINTER>)<POINTER> [POINTER]
%47 = getelementptr inbounds i8* %39, i32 8
%48 = bitcast i8* %47 to i32*
%49 = load i32* %48, align 4   ;401790: lw $4<INTEGER>, 8($7<POINTER>)<POINTER> [POINTER]
%50 = getelementptr inbounds i8* %39, i32 12
%51 = bitcast i8* %50 to i32*
%52 = load i32* %51, align 4   ;401798: lw $5<INTEGER>, 12($7<POINTER>)<POINTER> [POINTER]
%53 = getelementptr inbounds i8* %40, i32 0
%54 = bitcast i8* %53 to i32*
store i32 %43, i32* %54   ;4017a0: sw $2<INTEGER>, 0($8<POINTER>)<POINTER> [POINTER]
%55 = getelementptr inbounds i8* %40, i32 4
%56 = bitcast i8* %55 to i32*
store i32 %46, i32* %56   ;4017a8: sw $3<INTEGER>, 4($8<POINTER>)<POINTER> [POINTER]
%57 = getelementptr inbounds i8* %40, i32 8
%58 = bitcast i8* %57 to i32*
store i32 %49, i32* %58   ;4017b0: sw $4<INTEGER>, 8($8<POINTER>)<POINTER> [POINTER]
%59 = getelementptr inbounds i8* %40, i32 12
%60 = bitcast i8* %59 to i32*
store i32 %52, i32* %60   ;4017b8: sw $5<INTEGER>, 12($8<POINTER>)<POINTER> [POINTER]
%61 = getelementptr inbounds i8* %39, i32 16   ;4017c0: addiu $7<POINTER>,$7<POINTER>,16 [POINTER]
%62 = getelementptr inbounds i8* %40, i32 16   ;4017c8: addiu $8<POINTER>,$8<POINTER>,16 [POINTER]
%63 = icmp ne i8* %61, %14
br i1 %63, label %label-1, label %label-2   ;4017d0: bne $7<POINTER>,$9<POINTER>,401780 [POINTER]

label-2:
%64 = getelementptr inbounds i8* %61, i32 0
%65 = bitcast i8* %64 to i32*
%66 = load i32* %65, align 4   ;4017d8: lw $2<INTEGER>, 0($7<POINTER>)<POINTER> [POINTER]
%67 = getelementptr inbounds i8* %61, i32 4
%68 = bitcast i8* %67 to i32*
%69 = load i32* %68, align 4   ;4017e0: lw $3<INTEGER>, 4($7<POINTER>)<POINTER> [POINTER]
%70 = getelementptr inbounds i8* %61, i32 8
%71 = bitcast i8* %70 to i32*
%72 = load i32* %71, align 4   ;4017e8: lw $4<INTEGER>, 8($7<POINTER>)<POINTER> [POINTER]
%73 = getelementptr inbounds i8* %62, i32 0
%74 = bitcast i8* %73 to i32*
store i32 %66, i32* %74   ;4017f0: sw $2<INTEGER>, 0($8<POINTER>)<POINTER> [POINTER]
%75 = getelementptr inbounds i8* %62, i32 4
%76 = bitcast i8* %75 to i32*
store i32 %69, i32* %76   ;4017f8: sw $3<INTEGER>, 4($8<POINTER>)<POINTER> [POINTER]
%77 = getelementptr inbounds i8* %62, i32 8
%78 = bitcast i8* %77 to i32*
store i32 %72, i32* %78   ;401800: sw $4<INTEGER>, 8($8<POINTER>)<POINTER> [POINTER]
%79 = add nsw i32 0, 192   ;401808: addiu $2<INTEGER>,$0<INTEGER>,192 [VALUE]
%80 = icmp eq i32 %2, %79
br i1 %80, label %label-3, label %label-4   ;401810: beq $6<INTEGER>,$2<INTEGER>,401870 [VALUE]

label-4:
%81 = icmp slt i32 %2, 193   ;401818: slti $2<BIT>,$6<INTEGER>,193 [VALUE]
%82 = icmp eq i1 %81, 0
br i1 %82, label %label-5, label %label-6   ;401820: beq $2<BIT>,$0<INTEGER>,401840 [VALUE]

label-6:
%83 = add nsw i32 0, 128   ;401828: addiu $2<INTEGER>,$0<INTEGER>,128 [VALUE]
%84 = icmp eq i32 %2, %83
br i1 %84, label %label-7, label %label-8   ;401830: beq $6<INTEGER>,$2<INTEGER>,401858 [VALUE]

label-8:
br label %label-9   ;401838: j 401af8<JUMP> [JUMP]

label-5:
%85 = add nsw i32 0, 256   ;401840: addiu $2<INTEGER>,$0<INTEGER>,256 [VALUE]
%86 = icmp eq i32 %2, %85
br i1 %86, label %label-10, label %label-11   ;401848: beq $6<INTEGER>,$2<INTEGER>,401888 [VALUE]

label-11:
br label %label-9   ;401850: j 401af8<JUMP> [JUMP]

label-7:
%87 = add nsw i32 0, 10   ;401858: addiu $7<INTEGER>,$0<INTEGER>,10 [VALUE]
%88 = add nsw i32 0, 4   ;401860: addiu $17<INTEGER>,$0<INTEGER>,4 [VALUE]
br label %label-12   ;401868: j 401898<JUMP> [JUMP]

label-3:
%89 = add nsw i32 0, 12   ;401870: addiu $7<INTEGER>,$0<INTEGER>,12 [VALUE]
%90 = add nsw i32 0, 6   ;401878: addiu $17<INTEGER>,$0<INTEGER>,6 [VALUE]
br label %label-12   ;401880: j 401898<JUMP> [JUMP]

label-10:
%91 = add nsw i32 0, 14   ;401888: addiu $7<INTEGER>,$0<INTEGER>,14 [VALUE]
%92 = add nsw i32 0, 8   ;401890: addiu $17<INTEGER>,$0<INTEGER>,8 [VALUE]
br label %label-12

label-12:
%93 = phi i32 [ %88 , %label-7 ], [ %90 , %label-3 ], [ %92 , %label-10 ]
%94 = phi i32 [ %87 , %label-7 ], [ %89 , %label-3 ], [ %91 , %label-10 ]
%95 = add nsw i32 0, 0   ;401898: addu $16<INTEGER>,$0<INTEGER>,$0<INTEGER> [VALUE]
%96 = icmp eq i32 %93, 0
br i1 %96, label %label-13, label %label-14   ;4018a0: beq $17<INTEGER>,$0<INTEGER>,401938 [VALUE]

label-14:
%97 = getelementptr inbounds i8* %9, i32 0   ;4018a8: addu $6<POINTER>,$0<INTEGER>,$19<POINTER> [POINTER]
%98 = getelementptr inbounds i8* %5, i32 0   ;4018b0: addu $5<POINTER>,$0<INTEGER>,$10<POINTER> [POINTER]
br label %label-15

label-15:
%99 = phi i32 [ %95 , %label-14 ], [ %106 , %label-15 ]
%100 = phi i8* [ %98 , %label-14 ], [ %124 , %label-15 ]
%101 = phi i8* [ %97 , %label-14 ], [ %123 , %label-15 ]
%102 = getelementptr inbounds i8* %100, i32 0
%103 = load i8* %102, align 4   ;4018b8: lbu $2<BYTE>, 0($5<POINTER>)<POINTER> [POINTER]
%104 = getelementptr inbounds i8* %100, i32 1
%105 = load i8* %104, align 4   ;4018c0: lbu $4<BYTE>, 1($5<POINTER>)<POINTER> [POINTER]
%106 = add nsw i32 %99, 1   ;4018c8: addiu $16<INTEGER>,$16<INTEGER>,1 [VALUE]
%107 = getelementptr inbounds i8* %100, i32 2
%108 = load i8* %107, align 4   ;4018d0: lbu $3<BYTE>, 2($5<POINTER>)<POINTER> [POINTER]
%109 = zext i8 %103 to i32
%110 = shl i32 %109, 24   ;4018d8: sll $2<INTEGER>,$2<BYTE>,0x018 [VALUE]
%111 = zext i8 %105 to i32
%112 = shl i32 %111, 16   ;4018e0: sll $4<INTEGER>,$4<BYTE>,0x010 [VALUE]
%113 = or i32 %110, %112   ;4018e8: or $2<INTEGER>,$2<INTEGER>,$4<INTEGER> [VALUE]
%114 = getelementptr inbounds i8* %100, i32 3
%115 = load i8* %114, align 4   ;4018f0: lbu $4<BYTE>, 3($5<POINTER>)<POINTER> [POINTER]
%116 = zext i8 %108 to i32
%117 = shl i32 %116, 8   ;4018f8: sll $3<INTEGER>,$3<BYTE>,0x08 [VALUE]
%118 = or i32 %113, %117   ;401900: or $2<INTEGER>,$2<INTEGER>,$3<INTEGER> [VALUE]
%119 = zext i8 %115 to i32
%120 = or i32 %118, %119   ;401908: or $2<INTEGER>,$2<INTEGER>,$4<BYTE> [VALUE]
%121 = getelementptr inbounds i8* %101, i32 0
%122 = bitcast i8* %121 to i32*
store i32 %120, i32* %122   ;401910: sw $2<INTEGER>, 0($6<POINTER>)<POINTER> [POINTER]
%123 = getelementptr inbounds i8* %101, i32 4   ;401918: addiu $6<POINTER>,$6<POINTER>,4 [POINTER]
%124 = getelementptr inbounds i8* %100, i32 4   ;401920: addiu $5<POINTER>,$5<POINTER>,4 [POINTER]
%125 = icmp slt i32 %106, %93   ;401928: slt $2<BIT>,$16<INTEGER>,$17<INTEGER> [VALUE]
%126 = icmp ne i1 %125, 0
br i1 %126, label %label-15, label %label-13   ;401930: bne $2<BIT>,$0<INTEGER>,4018b8 [VALUE]

label-13:
%127 = add nsw i32 %94, 1   ;401938: addiu $2<INTEGER>,$7<INTEGER>,1 [VALUE]
%128 = zext i32 %10 to i64
%129 = zext i32 %127 to i64
%130 = mul i64 %128, %129
%131 = trunc i64 %130 to i32
store i32 %131, i32* @low
%132 = lshr i64 %130, 32
%133 = trunc i64 %132 to i32
store i32 %133, i32* @high   ;401940: mult $11<INTEGER>, $2<INTEGER> [POINTER]
%134 = load i32* @low, align 4   ;401948: mflo $3<INTEGER><VALUE> [VALUE]
%135 = add nsw i32 0, %93   ;401950: addu $16<INTEGER>,$0<INTEGER>,$17<INTEGER> [VALUE]
%136 = icmp slt i32 %135, %134   ;401958: slt $2<BIT>,$16<INTEGER>,$3<INTEGER> [VALUE]
%137 = icmp eq i1 %136, 0
br i1 %137, label %label-9, label %label-16   ;401960: beq $2<BIT>,$0<INTEGER>,401af8 [VALUE]

label-16:
%138 = getelementptr inbounds i8* %4, i32 16   ;401968: addiu $22<POINTER>,$29<POINTER>,16 [POINTER]
%139 = icmp slt i32 %135, 7   ;401970: slti $21<BIT>,$16<INTEGER>,7 [VALUE]
%140 = add nsw i32 0, 4   ;401978: addiu $23<INTEGER>,$0<INTEGER>,4 [VALUE]
%141 = add nsw i32 0, %134   ;401980: addu $20<INTEGER>,$0<INTEGER>,$3<INTEGER> [VALUE]
%142 = shl i32 %135, 2   ;401988: sll $2<INTEGER>,$16<INTEGER>,0x02 [VALUE]
%143 = getelementptr inbounds i8* %9, i32 %142   ;401990: addu $18<POINTER>,$2<INTEGER>,$19<POINTER> [POINTER]
br label %label-32

label-32:
%144 = phi i32 [ %135 , %label-16 ], [ %135 , %label-29 ]
%145 = phi i8* [ %143 , %label-16 ], [ %143 , %label-29 ]
%146 = phi i32 [ %142 , %label-16 ], [ %142 , %label-29 ]
%147 = udiv i32 %144, %93   ;401998: div $0<INTEGER>,$16<INTEGER>,$17<INTEGER> [VALUE]
%148 = icmp ne i32 %93, %147
br i1 %148, label %label-17, label %label-18   ;4019a0: bne $17<INTEGER>,$0<INTEGER>,4019b0 [VALUE]

label-18:
call void @exit(i32 -1) noreturn nounwind 
unreachable   ;4019a8: break [BREAK]
br label %label-17

label-17:
%150 = add nsw i32 %147, -1   ;4019b0: addiu $1<INTEGER>,$0<INTEGER>,-1<VALUE> [VALUE]
%151 = icmp ne i32 %93, %150
br i1 %151, label %label-19, label %label-20   ;4019b8: bne $17<INTEGER>,$1<INTEGER>,4019d8 [VALUE]

label-20:
%152 = shl i32 32768, 16   ;4019c0: lui $1<UNKNOWN>, 32768 [UNKNOWN]
%153 = icmp ne i32 %144, %152
br i1 %153, label %label-19, label %label-21   ;4019c8: bne $16<INTEGER>,$1<UNKNOWN>,4019d8 [VALUE]

label-21:
call void @exit(i32 -1) noreturn nounwind 
unreachable   ;4019d0: break [BREAK]
br label %label-19

label-19:
%155 = load i32* @high, align 4   ;4019d8: mfhi $3<INTEGER><VALUE> [VALUE]
%156 = getelementptr inbounds i8* %145, i32 -4
%157 = bitcast i8* %156 to i32*
%158 = load i32* %157, align 4   ;4019e0: lw $4<INTEGER>, -4($18<POINTER>)<POINTER><POINTER> [POINTER]
%159 = icmp ne i32 %155, %147
br i1 %159, label %label-22, label %label-23   ;4019e8: bne $3<INTEGER>,$0<INTEGER>,401a88 [VALUE]

label-23:
%160 = shl i32 %158, 8   ;4019f0: sll $2<INTEGER>,$4<INTEGER>,0x08 [VALUE]
%161 = lshr i32 %158, 24   ;4019f8: srl $4<INTEGER>,$4<INTEGER>,0x018 [VALUE]
%162 = or i32 %160, %161   ;401a00: or $4<INTEGER>,$2<INTEGER>,$4<INTEGER> [VALUE]
store i8* %4, i8** @stack_SubWord
%163 = call i32 @SubWord(i32 %162) nounwind   ;401a08: jal 4015e0 <SubWord><null> [null]
%164 = add nsw i32 %144, -1   ;401a10: addiu $3<INTEGER>,$16<INTEGER>,-1<VALUE> [VALUE]
%165 = udiv i32 %164, %93   ;401a18: div $0<INTEGER>,$3<INTEGER>,$17<INTEGER> [VALUE]
%166 = icmp ne i32 %93, %165
br i1 %166, label %label-24, label %label-25   ;401a20: bne $17<INTEGER>,$0<INTEGER>,401a30 [VALUE]

label-25:
call void @exit(i32 -1) noreturn nounwind 
unreachable   ;401a28: break [BREAK]
br label %label-24

label-24:
%168 = add nsw i32 %165, -1   ;401a30: addiu $1<INTEGER>,$0<INTEGER>,-1<VALUE> [VALUE]
%169 = icmp ne i32 %93, %168
br i1 %169, label %label-26, label %label-27   ;401a38: bne $17<INTEGER>,$1<INTEGER>,401a58 [VALUE]

label-27:
%170 = shl i32 32768, 16   ;401a40: lui $1<UNKNOWN>, 32768 [UNKNOWN]
%171 = icmp ne i32 %164, %170
br i1 %171, label %label-26, label %label-28   ;401a48: bne $3<INTEGER>,$1<UNKNOWN>,401a58 [VALUE]

label-28:
call void @exit(i32 -1) noreturn nounwind 
unreachable   ;401a50: break [BREAK]
br label %label-26

label-26:
%173 = load i32* @low, align 4   ;401a58: mflo $3<INTEGER><VALUE> [VALUE]
%174 = shl i32 %173, 2   ;401a60: sll $3<INTEGER>,$3<INTEGER>,0x02 [VALUE]
%175 = getelementptr inbounds i8* %138, i32 %174   ;401a68: addu $3<POINTER>,$3<INTEGER>,$22<POINTER> [POINTER]
%176 = getelementptr inbounds i8* %175, i32 0
%177 = bitcast i8* %176 to i32*
%178 = load i32* %177, align 4   ;401a70: lw $3<INTEGER>, 0($3<POINTER>)<POINTER> [POINTER]
%179 = xor i32 %163, %178   ;401a78: xor $4<INTEGER>,$2<INTEGER>,$3<INTEGER> [VALUE]
br label %label-29   ;401a80: j 401aa8<JUMP> [JUMP]

label-22:
%180 = zext i1 %139 to i32
%181 = icmp ne i32 %180, %147
br i1 %181, label %label-29, label %label-30   ;401a88: bne $21<BIT>,$0<INTEGER>,401aa8 [VALUE]

label-30:
%182 = icmp ne i32 %155, %140
br i1 %182, label %label-29, label %label-31   ;401a90: bne $3<INTEGER>,$23<INTEGER>,401aa8 [VALUE]

label-31:
store i8* %4, i8** @stack_SubWord
%183 = call i32 @SubWord(i32 %158) nounwind   ;401a98: jal 4015e0 <SubWord><null> [null]
%184 = add nsw i32 %147, %183   ;401aa0: addu $4<INTEGER>,$0<INTEGER>,$2<INTEGER> [VALUE]
br label %label-29

label-29:
%185 = phi i32 [ %165 , %label-26 ], [ %147 , %label-22 ], [ %147 , %label-30 ], [ %147 , %label-31 ]
%186 = phi i32 [ %179 , %label-26 ], [ %158 , %label-22 ], [ %184 , %label-31 ], [ %158 , %label-30 ]
%187 = sub i32 %144, %93   ;401aa8: subu $2<INTEGER>,$16<INTEGER>,$17<INTEGER> [VALUE]
%188 = shl i32 %187, 2   ;401ab0: sll $2<INTEGER>,$2<INTEGER>,0x02 [VALUE]
%189 = getelementptr inbounds i8* %9, i32 %188   ;401ab8: addu $2<POINTER>,$2<INTEGER>,$19<POINTER> [POINTER]
%190 = getelementptr inbounds i8* %189, i32 0
%191 = bitcast i8* %190 to i32*
%192 = load i32* %191, align 4   ;401ac0: lw $2<INTEGER>, 0($2<POINTER>)<POINTER> [POINTER]
%193 = add nsw i32 %144, 1   ;401ac8: addiu $16<INTEGER>,$16<INTEGER>,1 [VALUE]
%194 = xor i32 %192, %186   ;401ad0: xor $2<INTEGER>,$2<INTEGER>,$4<INTEGER> [VALUE]
%195 = getelementptr inbounds i8* %145, i32 0
%196 = bitcast i8* %195 to i32*
store i32 %194, i32* %196   ;401ad8: sw $2<INTEGER>, 0($18<POINTER>)<POINTER> [POINTER]
%197 = getelementptr inbounds i8* %145, i32 4   ;401ae0: addiu $18<POINTER>,$18<POINTER>,4 [POINTER]
%198 = icmp slt i32 %193, %141   ;401ae8: slt $2<BIT>,$16<INTEGER>,$20<INTEGER> [VALUE]
%199 = zext i1 %198 to i32
%200 = icmp ne i32 %199, %185
br i1 %200, label %label-32, label %label-9   ;401af0: bne $2<BIT>,$0<INTEGER>,401998 [VALUE]

label-9:
%201 = getelementptr inbounds i8* %4, i32 120
%202 = bitcast i8* %201 to i32*
%203 = load i32* %202, align 4   ;401af8: lw $31<INTEGER>, 120($29<POINTER>)<POINTER> [POINTER]
%204 = getelementptr inbounds i8* %4, i32 116
%205 = bitcast i8* %204 to i32*
%206 = load i32* %205, align 4   ;401b00: lw $23<INTEGER>, 116($29<POINTER>)<POINTER> [POINTER]
%207 = getelementptr inbounds i8* %4, i32 112
%208 = bitcast i8* %207 to i32*
%209 = load i32* %208, align 4   ;401b08: lw $22<INTEGER>, 112($29<POINTER>)<POINTER> [POINTER]
%210 = getelementptr inbounds i8* %4, i32 108
%211 = bitcast i8* %210 to i32*
%212 = load i32* %211, align 4   ;401b10: lw $21<INTEGER>, 108($29<POINTER>)<POINTER> [POINTER]
%213 = getelementptr inbounds i8* %4, i32 104
%214 = bitcast i8* %213 to i32*
%215 = load i32* %214, align 4   ;401b18: lw $20<INTEGER>, 104($29<POINTER>)<POINTER> [POINTER]
%216 = getelementptr inbounds i8* %4, i32 100
%217 = bitcast i8* %216 to i32*
%218 = load i32* %217, align 4   ;401b20: lw $19<INTEGER>, 100($29<POINTER>)<POINTER> [POINTER]
%219 = getelementptr inbounds i8* %4, i32 96
%220 = bitcast i8* %219 to i32*
%221 = load i32* %220, align 4   ;401b28: lw $18<INTEGER>, 96($29<POINTER>)<POINTER> [POINTER]
%222 = getelementptr inbounds i8* %4, i32 92
%223 = bitcast i8* %222 to i32*
%224 = load i32* %223, align 4   ;401b30: lw $17<INTEGER>, 92($29<POINTER>)<POINTER> [POINTER]
%225 = getelementptr inbounds i8* %4, i32 88
%226 = bitcast i8* %225 to i32*
%227 = load i32* %226, align 4   ;401b38: lw $16<INTEGER>, 88($29<POINTER>)<POINTER> [POINTER]
%228 = getelementptr inbounds i8* %4, i32 128   ;401b40: addiu $29<POINTER>,$29<POINTER>,128 [POINTER]
br label %return

return:
ret void   ;401b48: jr $31<VALUE><JUMP> [JUMP]
}

define void @aesencrypt(i8* %a, i8* %b, i8* %c) nounwind {
entry:
%a_addr = alloca i8*, align 4
store i8* %a, i8** %a_addr
%0 = load i8** %a_addr, align 4
%b_addr = alloca i8*, align 4
store i8* %b, i8** %b_addr
%1 = load i8** %b_addr, align 4
%c_addr = alloca i8*, align 4
store i8* %c, i8** %c_addr
%2 = load i8** %c_addr, align 4
%3 = load i8** @stack_aesencrypt, align 4

%4 = getelementptr inbounds i8* %3, i32 -48   ;401b50: addiu $29<POINTER>,$29<POINTER>,-48<VALUE> [POINTER]
%5 = load i32* @zero, align 4
%6 = getelementptr inbounds i8* %4, i32 40
%7 = bitcast i8* %6 to i32*
store i32 %5, i32* %7   ;401b58: sw $31<VALUE>, 40($29<POINTER>)<POINTER> [POINTER]
%8 = load i32* @zero, align 4
%9 = getelementptr inbounds i8* %4, i32 36
%10 = bitcast i8* %9 to i32*
store i32 %8, i32* %10   ;401b60: sw $17<VALUE>, 36($29<POINTER>)<POINTER> [POINTER]
%11 = load i32* @zero, align 4
%12 = getelementptr inbounds i8* %4, i32 32
%13 = bitcast i8* %12 to i32*
store i32 %11, i32* %13   ;401b68: sw $16<VALUE>, 32($29<POINTER>)<POINTER> [POINTER]
%14 = getelementptr inbounds i8* %0, i32 0
%15 = load i8* %14, align 4   ;401b70: lbu $2<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%16 = getelementptr inbounds i8* %4, i32 16
store i8 %15, i8* %16   ;401b78: sb $2<BYTE>, 16($29<POINTER>)<POINTER> [POINTER]
%17 = getelementptr inbounds i8* %0, i32 1
%18 = load i8* %17, align 4   ;401b80: lbu $2<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%19 = getelementptr inbounds i8* %4, i32 20
store i8 %18, i8* %19   ;401b88: sb $2<BYTE>, 20($29<POINTER>)<POINTER> [POINTER]
%20 = getelementptr inbounds i8* %0, i32 2
%21 = load i8* %20, align 4   ;401b90: lbu $2<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%22 = getelementptr inbounds i8* %4, i32 24
store i8 %21, i8* %22   ;401b98: sb $2<BYTE>, 24($29<POINTER>)<POINTER> [POINTER]
%23 = getelementptr inbounds i8* %0, i32 3
%24 = load i8* %23, align 4   ;401ba0: lbu $2<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%25 = getelementptr inbounds i8* %4, i32 28
store i8 %24, i8* %25   ;401ba8: sb $2<BYTE>, 28($29<POINTER>)<POINTER> [POINTER]
%26 = getelementptr inbounds i8* %0, i32 4
%27 = load i8* %26, align 4   ;401bb0: lbu $2<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%28 = getelementptr inbounds i8* %4, i32 17
store i8 %27, i8* %28   ;401bb8: sb $2<BYTE>, 17($29<POINTER>)<POINTER> [POINTER]
%29 = getelementptr inbounds i8* %0, i32 5
%30 = load i8* %29, align 4   ;401bc0: lbu $2<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%31 = getelementptr inbounds i8* %4, i32 21
store i8 %30, i8* %31   ;401bc8: sb $2<BYTE>, 21($29<POINTER>)<POINTER> [POINTER]
%32 = getelementptr inbounds i8* %0, i32 6
%33 = load i8* %32, align 4   ;401bd0: lbu $2<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%34 = getelementptr inbounds i8* %4, i32 25
store i8 %33, i8* %34   ;401bd8: sb $2<BYTE>, 25($29<POINTER>)<POINTER> [POINTER]
%35 = getelementptr inbounds i8* %0, i32 7
%36 = load i8* %35, align 4   ;401be0: lbu $2<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%37 = getelementptr inbounds i8* %4, i32 29
store i8 %36, i8* %37   ;401be8: sb $2<BYTE>, 29($29<POINTER>)<POINTER> [POINTER]
%38 = getelementptr inbounds i8* %0, i32 8
%39 = load i8* %38, align 4   ;401bf0: lbu $2<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%40 = getelementptr inbounds i8* %4, i32 18
store i8 %39, i8* %40   ;401bf8: sb $2<BYTE>, 18($29<POINTER>)<POINTER> [POINTER]
%41 = getelementptr inbounds i8* %0, i32 9
%42 = load i8* %41, align 4   ;401c00: lbu $2<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%43 = getelementptr inbounds i8* %4, i32 22
store i8 %42, i8* %43   ;401c08: sb $2<BYTE>, 22($29<POINTER>)<POINTER> [POINTER]
%44 = getelementptr inbounds i8* %0, i32 10
%45 = load i8* %44, align 4   ;401c10: lbu $2<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%46 = getelementptr inbounds i8* %4, i32 26
store i8 %45, i8* %46   ;401c18: sb $2<BYTE>, 26($29<POINTER>)<POINTER> [POINTER]
%47 = getelementptr inbounds i8* %0, i32 11
%48 = load i8* %47, align 4   ;401c20: lbu $2<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%49 = getelementptr inbounds i8* %4, i32 30
store i8 %48, i8* %49   ;401c28: sb $2<BYTE>, 30($29<POINTER>)<POINTER> [POINTER]
%50 = getelementptr inbounds i8* %0, i32 12
%51 = load i8* %50, align 4   ;401c30: lbu $2<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%52 = getelementptr inbounds i8* %4, i32 19
store i8 %51, i8* %52   ;401c38: sb $2<BYTE>, 19($29<POINTER>)<POINTER> [POINTER]
%53 = getelementptr inbounds i8* %0, i32 13
%54 = load i8* %53, align 4   ;401c40: lbu $2<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%55 = getelementptr inbounds i8* %4, i32 23
store i8 %54, i8* %55   ;401c48: sb $2<BYTE>, 23($29<POINTER>)<POINTER> [POINTER]
%56 = getelementptr inbounds i8* %0, i32 14
%57 = load i8* %56, align 4   ;401c50: lbu $2<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%58 = getelementptr inbounds i8* %1, i32 0   ;401c58: addu $16<POINTER>,$0<INTEGER>,$5<POINTER> [POINTER]
%59 = getelementptr inbounds i8* %4, i32 27
store i8 %57, i8* %59   ;401c60: sb $2<BYTE>, 27($29<POINTER>)<POINTER> [POINTER]
%60 = getelementptr inbounds i8* %0, i32 15
%61 = load i8* %60, align 4   ;401c68: lbu $2<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%62 = getelementptr inbounds i8* %2, i32 0   ;401c70: addu $17<POINTER>,$0<INTEGER>,$6<POINTER> [POINTER]
%63 = getelementptr inbounds i8* %62, i32 0   ;401c78: addu $5<POINTER>,$0<INTEGER>,$17<POINTER> [POINTER]
%64 = getelementptr inbounds i8* %4, i32 16   ;401c80: addiu $4<POINTER>,$29<POINTER>,16 [POINTER]
%65 = getelementptr inbounds i8* %4, i32 31
store i8 %61, i8* %65   ;401c88: sb $2<BYTE>, 31($29<POINTER>)<POINTER> [POINTER]
store i8* %4, i8** @stack_AddRoundKey
call void @AddRoundKey(i8* %64, i8* %63) nounwind   ;401c90: jal 4001f0 <AddRoundKey><null> [null]
%66 = getelementptr inbounds i8* %4, i32 16   ;401c98: addiu $4<POINTER>,$29<POINTER>,16 [POINTER]
store i8* %4, i8** @stack_SubBytes
call void @SubBytes(i8* %66) nounwind   ;401ca0: jal 400508 <SubBytes><null> [null]
%67 = getelementptr inbounds i8* %4, i32 16   ;401ca8: addiu $4<POINTER>,$29<POINTER>,16 [POINTER]
store i8* %4, i8** @stack_ShiftRows
call void @ShiftRows(i8* %67) nounwind   ;401cb0: jal 4008a0 <ShiftRows><null> [null]
%68 = getelementptr inbounds i8* %4, i32 16   ;401cb8: addiu $4<POINTER>,$29<POINTER>,16 [POINTER]
store i8* %4, i8** @stack_MixColumns
call void @MixColumns(i8* %68) nounwind   ;401cc0: jal 400968 <MixColumns><null> [null]
%69 = getelementptr inbounds i8* %4, i32 16   ;401cc8: addiu $4<POINTER>,$29<POINTER>,16 [POINTER]
%70 = getelementptr inbounds i8* %62, i32 16   ;401cd0: addiu $5<POINTER>,$17<POINTER>,16 [POINTER]
store i8* %4, i8** @stack_AddRoundKey
call void @AddRoundKey(i8* %69, i8* %70) nounwind   ;401cd8: jal 4001f0 <AddRoundKey><null> [null]
%71 = getelementptr inbounds i8* %4, i32 16
%72 = load i8* %71, align 4   ;401ce0: lbu $2<BYTE>, 16($29<POINTER>)<POINTER> [POINTER]
%73 = getelementptr inbounds i8* %58, i32 0
store i8 %72, i8* %73   ;401ce8: sb $2<BYTE>, 0($16<POINTER>)<POINTER> [POINTER]
%74 = getelementptr inbounds i8* %4, i32 20
%75 = load i8* %74, align 4   ;401cf0: lbu $2<BYTE>, 20($29<POINTER>)<POINTER> [POINTER]
%76 = getelementptr inbounds i8* %58, i32 1
store i8 %75, i8* %76   ;401cf8: sb $2<BYTE>, 1($16<POINTER>)<POINTER> [POINTER]
%77 = getelementptr inbounds i8* %4, i32 24
%78 = load i8* %77, align 4   ;401d00: lbu $2<BYTE>, 24($29<POINTER>)<POINTER> [POINTER]
%79 = getelementptr inbounds i8* %58, i32 2
store i8 %78, i8* %79   ;401d08: sb $2<BYTE>, 2($16<POINTER>)<POINTER> [POINTER]
%80 = getelementptr inbounds i8* %4, i32 28
%81 = load i8* %80, align 4   ;401d10: lbu $2<BYTE>, 28($29<POINTER>)<POINTER> [POINTER]
%82 = getelementptr inbounds i8* %58, i32 3
store i8 %81, i8* %82   ;401d18: sb $2<BYTE>, 3($16<POINTER>)<POINTER> [POINTER]
%83 = getelementptr inbounds i8* %4, i32 17
%84 = load i8* %83, align 4   ;401d20: lbu $2<BYTE>, 17($29<POINTER>)<POINTER> [POINTER]
%85 = getelementptr inbounds i8* %58, i32 4
store i8 %84, i8* %85   ;401d28: sb $2<BYTE>, 4($16<POINTER>)<POINTER> [POINTER]
%86 = getelementptr inbounds i8* %4, i32 21
%87 = load i8* %86, align 4   ;401d30: lbu $2<BYTE>, 21($29<POINTER>)<POINTER> [POINTER]
%88 = getelementptr inbounds i8* %58, i32 5
store i8 %87, i8* %88   ;401d38: sb $2<BYTE>, 5($16<POINTER>)<POINTER> [POINTER]
%89 = getelementptr inbounds i8* %4, i32 25
%90 = load i8* %89, align 4   ;401d40: lbu $2<BYTE>, 25($29<POINTER>)<POINTER> [POINTER]
%91 = getelementptr inbounds i8* %58, i32 6
store i8 %90, i8* %91   ;401d48: sb $2<BYTE>, 6($16<POINTER>)<POINTER> [POINTER]
%92 = getelementptr inbounds i8* %4, i32 29
%93 = load i8* %92, align 4   ;401d50: lbu $2<BYTE>, 29($29<POINTER>)<POINTER> [POINTER]
%94 = getelementptr inbounds i8* %58, i32 7
store i8 %93, i8* %94   ;401d58: sb $2<BYTE>, 7($16<POINTER>)<POINTER> [POINTER]
%95 = getelementptr inbounds i8* %4, i32 18
%96 = load i8* %95, align 4   ;401d60: lbu $2<BYTE>, 18($29<POINTER>)<POINTER> [POINTER]
%97 = getelementptr inbounds i8* %58, i32 8
store i8 %96, i8* %97   ;401d68: sb $2<BYTE>, 8($16<POINTER>)<POINTER> [POINTER]
%98 = getelementptr inbounds i8* %4, i32 22
%99 = load i8* %98, align 4   ;401d70: lbu $2<BYTE>, 22($29<POINTER>)<POINTER> [POINTER]
%100 = getelementptr inbounds i8* %58, i32 9
store i8 %99, i8* %100   ;401d78: sb $2<BYTE>, 9($16<POINTER>)<POINTER> [POINTER]
%101 = getelementptr inbounds i8* %4, i32 26
%102 = load i8* %101, align 4   ;401d80: lbu $2<BYTE>, 26($29<POINTER>)<POINTER> [POINTER]
%103 = getelementptr inbounds i8* %58, i32 10
store i8 %102, i8* %103   ;401d88: sb $2<BYTE>, 10($16<POINTER>)<POINTER> [POINTER]
%104 = getelementptr inbounds i8* %4, i32 30
%105 = load i8* %104, align 4   ;401d90: lbu $2<BYTE>, 30($29<POINTER>)<POINTER> [POINTER]
%106 = getelementptr inbounds i8* %58, i32 11
store i8 %105, i8* %106   ;401d98: sb $2<BYTE>, 11($16<POINTER>)<POINTER> [POINTER]
%107 = getelementptr inbounds i8* %4, i32 19
%108 = load i8* %107, align 4   ;401da0: lbu $2<BYTE>, 19($29<POINTER>)<POINTER> [POINTER]
%109 = getelementptr inbounds i8* %58, i32 12
store i8 %108, i8* %109   ;401da8: sb $2<BYTE>, 12($16<POINTER>)<POINTER> [POINTER]
%110 = getelementptr inbounds i8* %4, i32 23
%111 = load i8* %110, align 4   ;401db0: lbu $2<BYTE>, 23($29<POINTER>)<POINTER> [POINTER]
%112 = getelementptr inbounds i8* %58, i32 13
store i8 %111, i8* %112   ;401db8: sb $2<BYTE>, 13($16<POINTER>)<POINTER> [POINTER]
%113 = getelementptr inbounds i8* %4, i32 27
%114 = load i8* %113, align 4   ;401dc0: lbu $2<BYTE>, 27($29<POINTER>)<POINTER> [POINTER]
%115 = getelementptr inbounds i8* %58, i32 14
store i8 %114, i8* %115   ;401dc8: sb $2<BYTE>, 14($16<POINTER>)<POINTER> [POINTER]
%116 = getelementptr inbounds i8* %4, i32 31
%117 = load i8* %116, align 4   ;401dd0: lbu $2<BYTE>, 31($29<POINTER>)<POINTER> [POINTER]
%118 = getelementptr inbounds i8* %58, i32 15
store i8 %117, i8* %118   ;401dd8: sb $2<BYTE>, 15($16<POINTER>)<POINTER> [POINTER]
%119 = getelementptr inbounds i8* %4, i32 40
%120 = bitcast i8* %119 to i32*
%121 = load i32* %120, align 4   ;401de0: lw $31<INTEGER>, 40($29<POINTER>)<POINTER> [POINTER]
%122 = getelementptr inbounds i8* %4, i32 36
%123 = bitcast i8* %122 to i32*
%124 = load i32* %123, align 4   ;401de8: lw $17<INTEGER>, 36($29<POINTER>)<POINTER> [POINTER]
%125 = getelementptr inbounds i8* %4, i32 32
%126 = bitcast i8* %125 to i32*
%127 = load i32* %126, align 4   ;401df0: lw $16<INTEGER>, 32($29<POINTER>)<POINTER> [POINTER]
%128 = getelementptr inbounds i8* %4, i32 48   ;401df8: addiu $29<POINTER>,$29<POINTER>,48 [POINTER]
br label %return

return:
ret void   ;401e00: jr $31<VALUE><JUMP> [JUMP]
}

define void @main() nounwind {
entry:
%0 = getelementptr inbounds [777 x i8]* @stack, i32 0, i32 776

%1 = getelementptr inbounds i8* %0, i32 -584   ;401e08: addiu $29<POINTER>,$29<POINTER>,-584<VALUE> [POINTER]
%2 = load i32* @zero, align 4
%3 = getelementptr inbounds i8* %1, i32 580
%4 = bitcast i8* %3 to i32*
store i32 %2, i32* %4   ;401e10: sw $31<VALUE>, 580($29<POINTER>)<POINTER> [POINTER]
%5 = load i32* @zero, align 4
%6 = getelementptr inbounds i8* %1, i32 576
%7 = bitcast i8* %6 to i32*
store i32 %5, i32* %7   ;401e18: sw $16<VALUE>, 576($29<POINTER>)<POINTER> [POINTER]
   ;401e20: jal 402168 <main><null> [null]
%8 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401e28: lui $5<POINTER>, 4096 [POINTER]
%9 = getelementptr inbounds i8* %8, i32 572   ;401e30: addiu $5<POINTER>,$5<POINTER>,572 [POINTER]
%10 = getelementptr inbounds i8* %9, i32 0
%11 = bitcast i8* %10 to i32*
%12 = load i32* %11, align 4
%13 = shl i32 %12, 24
%14 = load i32* @zero, align 4
%15 = and i32 %14, 16777215
%16 = or i32 %13, %15   ;401e38: lwl $2<VALUE>, 3($5<POINTER>)<VALUE> [POINTER]
%17 = getelementptr inbounds i8* %9, i32 0
%18 = bitcast i8* %17 to i32*
%19 = load i32* %18, align 4
%20 = lshr i32 %19, 24
%21 = and i32 %16, 4294967040
%22 = or i32 %20, %21   ;401e40: lwr $2<VALUE>, 0($5<POINTER>)<POINTER> [POINTER]
%23 = getelementptr inbounds i8* %9, i32 4
%24 = bitcast i8* %23 to i32*
%25 = load i32* %24, align 4
%26 = shl i32 %25, 24
%27 = load i32* @zero, align 4
%28 = and i32 %27, 16777215
%29 = or i32 %26, %28   ;401e48: lwl $3<VALUE>, 7($5<POINTER>)<POINTER> [POINTER]
%30 = getelementptr inbounds i8* %9, i32 4
%31 = bitcast i8* %30 to i32*
%32 = load i32* %31, align 4
%33 = lshr i32 %32, 24
%34 = and i32 %29, 4294967040
%35 = or i32 %33, %34   ;401e50: lwr $3<VALUE>, 4($5<POINTER>)<POINTER> [POINTER]
%36 = getelementptr inbounds i8* %9, i32 8
%37 = bitcast i8* %36 to i32*
%38 = load i32* %37, align 4
%39 = shl i32 %38, 24
%40 = load i32* @zero, align 4
%41 = and i32 %40, 16777215
%42 = or i32 %39, %41   ;401e58: lwl $4<VALUE>, 11($5<POINTER>)<POINTER> [POINTER]
%43 = getelementptr inbounds i8* %9, i32 8
%44 = bitcast i8* %43 to i32*
%45 = load i32* %44, align 4
%46 = lshr i32 %45, 24
%47 = and i32 %42, 4294967040
%48 = or i32 %46, %47   ;401e60: lwr $4<VALUE>, 8($5<POINTER>)<POINTER> [POINTER]
%49 = getelementptr inbounds i8* %1, i32 16
%50 = bitcast i8* %49 to i32*
%51 = load i32* %50, align 4
%52 = lshr i32 %22, 24
%53 = and i32 %51, 4294967040
%54 = or i32 %52, %53
store i32 %54, i32* %50   ;401e68: swl $2<VALUE>, 19($29<POINTER>)<POINTER> [POINTER]
%55 = getelementptr inbounds i8* %1, i32 16
%56 = bitcast i8* %55 to i32*
%57 = load i32* %56, align 4
%58 = shl i32 %22, 24
%59 = and i32 %57, 16777215
%60 = or i32 %58, %59
store i32 %60, i32* %56   ;401e70: swr $2<VALUE>, 16($29<POINTER>)<POINTER> [POINTER]
%61 = getelementptr inbounds i8* %1, i32 20
%62 = bitcast i8* %61 to i32*
%63 = load i32* %62, align 4
%64 = lshr i32 %35, 24
%65 = and i32 %63, 4294967040
%66 = or i32 %64, %65
store i32 %66, i32* %62   ;401e78: swl $3<VALUE>, 23($29<POINTER>)<POINTER> [POINTER]
%67 = getelementptr inbounds i8* %1, i32 20
%68 = bitcast i8* %67 to i32*
%69 = load i32* %68, align 4
%70 = shl i32 %35, 24
%71 = and i32 %69, 16777215
%72 = or i32 %70, %71
store i32 %72, i32* %68   ;401e80: swr $3<VALUE>, 20($29<POINTER>)<POINTER> [POINTER]
%73 = getelementptr inbounds i8* %1, i32 24
%74 = bitcast i8* %73 to i32*
%75 = load i32* %74, align 4
%76 = lshr i32 %48, 24
%77 = and i32 %75, 4294967040
%78 = or i32 %76, %77
store i32 %78, i32* %74   ;401e88: swl $4<VALUE>, 27($29<POINTER>)<POINTER> [POINTER]
%79 = getelementptr inbounds i8* %1, i32 24
%80 = bitcast i8* %79 to i32*
%81 = load i32* %80, align 4
%82 = shl i32 %48, 24
%83 = and i32 %81, 16777215
%84 = or i32 %82, %83
store i32 %84, i32* %80   ;401e90: swr $4<VALUE>, 24($29<POINTER>)<POINTER> [POINTER]
%85 = getelementptr inbounds i8* %9, i32 12
%86 = bitcast i8* %85 to i32*
%87 = load i32* %86, align 4
%88 = shl i32 %87, 24
%89 = and i32 %22, 16777215
%90 = or i32 %88, %89   ;401e98: lwl $2<VALUE>, 15($5<POINTER>)<POINTER> [POINTER]
%91 = getelementptr inbounds i8* %9, i32 12
%92 = bitcast i8* %91 to i32*
%93 = load i32* %92, align 4
%94 = lshr i32 %93, 24
%95 = and i32 %90, 4294967040
%96 = or i32 %94, %95   ;401ea0: lwr $2<VALUE>, 12($5<POINTER>)<POINTER> [POINTER]
%97 = getelementptr inbounds i8* %1, i32 28
%98 = bitcast i8* %97 to i32*
%99 = load i32* %98, align 4
%100 = lshr i32 %96, 24
%101 = and i32 %99, 4294967040
%102 = or i32 %100, %101
store i32 %102, i32* %98   ;401ea8: swl $2<VALUE>, 31($29<POINTER>)<POINTER> [POINTER]
%103 = getelementptr inbounds i8* %1, i32 28
%104 = bitcast i8* %103 to i32*
%105 = load i32* %104, align 4
%106 = shl i32 %96, 24
%107 = and i32 %105, 16777215
%108 = or i32 %106, %107
store i32 %108, i32* %104   ;401eb0: swr $2<VALUE>, 28($29<POINTER>)<POINTER> [POINTER]
%109 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401eb8: lui $5<POINTER>, 4096 [POINTER]
%110 = getelementptr inbounds i8* %109, i32 588   ;401ec0: addiu $5<POINTER>,$5<POINTER>,588 [POINTER]
%111 = getelementptr inbounds i8* %110, i32 0
%112 = bitcast i8* %111 to i32*
%113 = load i32* %112, align 4
%114 = shl i32 %113, 24
%115 = and i32 %96, 16777215
%116 = or i32 %114, %115   ;401ec8: lwl $2<VALUE>, 3($5<POINTER>)<VALUE> [POINTER]
%117 = getelementptr inbounds i8* %110, i32 0
%118 = bitcast i8* %117 to i32*
%119 = load i32* %118, align 4
%120 = lshr i32 %119, 24
%121 = and i32 %116, 4294967040
%122 = or i32 %120, %121   ;401ed0: lwr $2<VALUE>, 0($5<POINTER>)<POINTER> [POINTER]
%123 = getelementptr inbounds i8* %110, i32 4
%124 = bitcast i8* %123 to i32*
%125 = load i32* %124, align 4
%126 = shl i32 %125, 24
%127 = and i32 %35, 16777215
%128 = or i32 %126, %127   ;401ed8: lwl $3<VALUE>, 7($5<POINTER>)<POINTER> [POINTER]
%129 = getelementptr inbounds i8* %110, i32 4
%130 = bitcast i8* %129 to i32*
%131 = load i32* %130, align 4
%132 = lshr i32 %131, 24
%133 = and i32 %128, 4294967040
%134 = or i32 %132, %133   ;401ee0: lwr $3<VALUE>, 4($5<POINTER>)<POINTER> [POINTER]
%135 = getelementptr inbounds i8* %110, i32 8
%136 = bitcast i8* %135 to i32*
%137 = load i32* %136, align 4
%138 = shl i32 %137, 24
%139 = and i32 %48, 16777215
%140 = or i32 %138, %139   ;401ee8: lwl $4<VALUE>, 11($5<POINTER>)<POINTER> [POINTER]
%141 = getelementptr inbounds i8* %110, i32 8
%142 = bitcast i8* %141 to i32*
%143 = load i32* %142, align 4
%144 = lshr i32 %143, 24
%145 = and i32 %140, 4294967040
%146 = or i32 %144, %145   ;401ef0: lwr $4<VALUE>, 8($5<POINTER>)<POINTER> [POINTER]
%147 = getelementptr inbounds i8* %1, i32 544
%148 = bitcast i8* %147 to i32*
%149 = load i32* %148, align 4
%150 = lshr i32 %122, 24
%151 = and i32 %149, 4294967040
%152 = or i32 %150, %151
store i32 %152, i32* %148   ;401ef8: swl $2<VALUE>, 547($29<POINTER>)<POINTER> [POINTER]
%153 = getelementptr inbounds i8* %1, i32 544
%154 = bitcast i8* %153 to i32*
%155 = load i32* %154, align 4
%156 = shl i32 %122, 24
%157 = and i32 %155, 16777215
%158 = or i32 %156, %157
store i32 %158, i32* %154   ;401f00: swr $2<VALUE>, 544($29<POINTER>)<POINTER> [POINTER]
%159 = getelementptr inbounds i8* %1, i32 548
%160 = bitcast i8* %159 to i32*
%161 = load i32* %160, align 4
%162 = lshr i32 %134, 24
%163 = and i32 %161, 4294967040
%164 = or i32 %162, %163
store i32 %164, i32* %160   ;401f08: swl $3<VALUE>, 551($29<POINTER>)<POINTER> [POINTER]
%165 = getelementptr inbounds i8* %1, i32 548
%166 = bitcast i8* %165 to i32*
%167 = load i32* %166, align 4
%168 = shl i32 %134, 24
%169 = and i32 %167, 16777215
%170 = or i32 %168, %169
store i32 %170, i32* %166   ;401f10: swr $3<VALUE>, 548($29<POINTER>)<POINTER> [POINTER]
%171 = getelementptr inbounds i8* %1, i32 552
%172 = bitcast i8* %171 to i32*
%173 = load i32* %172, align 4
%174 = lshr i32 %146, 24
%175 = and i32 %173, 4294967040
%176 = or i32 %174, %175
store i32 %176, i32* %172   ;401f18: swl $4<VALUE>, 555($29<POINTER>)<POINTER> [POINTER]
%177 = getelementptr inbounds i8* %1, i32 552
%178 = bitcast i8* %177 to i32*
%179 = load i32* %178, align 4
%180 = shl i32 %146, 24
%181 = and i32 %179, 16777215
%182 = or i32 %180, %181
store i32 %182, i32* %178   ;401f20: swr $4<VALUE>, 552($29<POINTER>)<POINTER> [POINTER]
%183 = getelementptr inbounds i8* %110, i32 12
%184 = bitcast i8* %183 to i32*
%185 = load i32* %184, align 4
%186 = shl i32 %185, 24
%187 = and i32 %122, 16777215
%188 = or i32 %186, %187   ;401f28: lwl $2<VALUE>, 15($5<POINTER>)<POINTER> [POINTER]
%189 = getelementptr inbounds i8* %110, i32 12
%190 = bitcast i8* %189 to i32*
%191 = load i32* %190, align 4
%192 = lshr i32 %191, 24
%193 = and i32 %188, 4294967040
%194 = or i32 %192, %193   ;401f30: lwr $2<VALUE>, 12($5<POINTER>)<POINTER> [POINTER]
%195 = getelementptr inbounds i8* %1, i32 556
%196 = bitcast i8* %195 to i32*
%197 = load i32* %196, align 4
%198 = lshr i32 %194, 24
%199 = and i32 %197, 4294967040
%200 = or i32 %198, %199
store i32 %200, i32* %196   ;401f38: swl $2<VALUE>, 559($29<POINTER>)<POINTER> [POINTER]
%201 = getelementptr inbounds i8* %1, i32 556
%202 = bitcast i8* %201 to i32*
%203 = load i32* %202, align 4
%204 = shl i32 %194, 24
%205 = and i32 %203, 16777215
%206 = or i32 %204, %205
store i32 %206, i32* %202   ;401f40: swr $2<VALUE>, 556($29<POINTER>)<POINTER> [POINTER]
%207 = getelementptr inbounds i8* %1, i32 16   ;401f48: addiu $4<POINTER>,$29<POINTER>,16 [POINTER]
%208 = getelementptr inbounds i8* %1, i32 32   ;401f50: addiu $16<POINTER>,$29<POINTER>,32 [POINTER]
%209 = getelementptr inbounds i8* %208, i32 0   ;401f58: addu $5<POINTER>,$0<INTEGER>,$16<POINTER> [POINTER]
%210 = add nsw i32 0, 128   ;401f60: addiu $6<INTEGER>,$0<INTEGER>,128 [VALUE]
store i8* %1, i8** @stack_KeyExpansion
call void @KeyExpansion(i8* %207, i8* %209, i32 %210) nounwind   ;401f68: jal 4016f8 <KeyExpansion><null> [null]
%211 = getelementptr inbounds i8* %1, i32 544   ;401f70: addiu $4<POINTER>,$29<POINTER>,544 [POINTER]
%212 = getelementptr inbounds i8* %1, i32 560   ;401f78: addiu $5<POINTER>,$29<POINTER>,560 [POINTER]
%213 = getelementptr inbounds i8* %208, i32 0   ;401f80: addu $6<POINTER>,$0<INTEGER>,$16<POINTER> [POINTER]
%214 = add nsw i32 0, 128   ;401f88: addiu $7<INTEGER>,$0<INTEGER>,128 [VALUE]
store i8* %1, i8** @stack_aesencrypt
call void @aesencrypt(i8* %211, i8* %212, i8* %213) nounwind   ;401f90: jal 401b50 <aesencrypt><null> [null]
%215 = getelementptr inbounds i8* %1, i32 580
%216 = bitcast i8* %215 to i32*
%217 = load i32* %216, align 4   ;401f98: lw $31<INTEGER>, 580($29<POINTER>)<POINTER> [POINTER]
%218 = getelementptr inbounds i8* %1, i32 576
%219 = bitcast i8* %218 to i32*
%220 = load i32* %219, align 4   ;401fa0: lw $16<INTEGER>, 576($29<POINTER>)<POINTER> [POINTER]
%221 = getelementptr inbounds i8* %1, i32 584   ;401fa8: addiu $29<POINTER>,$29<POINTER>,584 [POINTER]
br label %return

return:
ret void   ;401fb0: jr $31<VALUE><JUMP> [JUMP]
}

declare void @exit(i32) noreturn nounwind
