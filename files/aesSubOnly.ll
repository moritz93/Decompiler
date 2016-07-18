@stack_AddRoundKey = common global i8* null
@stack_SubBytes = common global i8* null
@stack_SubWord = common global i8* null
@stack_KeyExpansion = common global i8* null
@stack_aesencrypt = common global i8* null
@stack = global [761 x i8] zeroinitializer, align 32
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

define i32 @SubWord(i32 %a) nounwind {
entry:
%a_addr = alloca i32, align 4
store i32 %a, i32* %a_addr
%0 = load i32* %a_addr, align 4
%1 = load i8** @stack_SubWord, align 4

%2 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4008a0: lui $6<POINTER>, 4096 [POINTER]
%3 = getelementptr inbounds i8* %2, i32 0   ;4008a8: addiu $6<POINTER>,$6<POINTER>,0 [POINTER]
%4 = and i32 %0, 240   ;4008b0: andi $5<INTEGER>,$4<INTEGER>,240 [VALUE]
%5 = getelementptr inbounds i8* %3, i32 %4   ;4008b8: addu $5<POINTER>,$5<INTEGER>,$6<POINTER> [POINTER]
%6 = and i32 %0, 15   ;4008c0: andi $2<INTEGER>,$4<INTEGER>,15 [VALUE]
%7 = getelementptr inbounds i8* %5, i32 %6   ;4008c8: addu $5<POINTER>,$5<POINTER>,$2<INTEGER> [POINTER]
%8 = lshr i32 %0, 8   ;4008d0: srl $2<INTEGER>,$4<INTEGER>,0x08 [VALUE]
%9 = and i32 %8, 240   ;4008d8: andi $2<INTEGER>,$2<INTEGER>,240 [VALUE]
%10 = getelementptr inbounds i8* %3, i32 %9   ;4008e0: addu $2<POINTER>,$2<INTEGER>,$6<POINTER> [POINTER]
%11 = lshr i32 %0, 8   ;4008e8: srl $3<INTEGER>,$4<INTEGER>,0x08 [VALUE]
%12 = and i32 %11, 15   ;4008f0: andi $3<INTEGER>,$3<INTEGER>,15 [VALUE]
%13 = getelementptr inbounds i8* %10, i32 %12   ;4008f8: addu $2<POINTER>,$2<POINTER>,$3<INTEGER> [POINTER]
%14 = getelementptr inbounds i8* %13, i32 0
%15 = load i8* %14, align 4   ;400900: lbu $2<BYTE>, 0($2<POINTER>)<VALUE> [POINTER]
%16 = getelementptr inbounds i8* %7, i32 0
%17 = load i8* %16, align 4   ;400908: lbu $5<BYTE>, 0($5<POINTER>)<POINTER> [POINTER]
%18 = lshr i32 %0, 16   ;400910: srl $3<INTEGER>,$4<INTEGER>,0x010 [VALUE]
%19 = and i32 %18, 15   ;400918: andi $3<INTEGER>,$3<INTEGER>,15 [VALUE]
%20 = zext i8 %15 to i32
%21 = shl i32 %20, 8   ;400920: sll $2<INTEGER>,$2<BYTE>,0x08 [VALUE]
%22 = zext i8 %17 to i32
%23 = add nsw i32 %22, %21   ;400928: addu $5<INTEGER>,$5<BYTE>,$2<INTEGER> [VALUE]
%24 = lshr i32 %0, 16   ;400930: srl $2<INTEGER>,$4<INTEGER>,0x010 [VALUE]
%25 = and i32 %24, 240   ;400938: andi $2<INTEGER>,$2<INTEGER>,240 [VALUE]
%26 = getelementptr inbounds i8* %3, i32 %25   ;400940: addu $2<POINTER>,$2<INTEGER>,$6<POINTER> [POINTER]
%27 = getelementptr inbounds i8* %26, i32 %19   ;400948: addu $2<POINTER>,$2<POINTER>,$3<INTEGER> [POINTER]
%28 = getelementptr inbounds i8* %27, i32 0
%29 = load i8* %28, align 4   ;400950: lbu $3<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%30 = lshr i32 %0, 28   ;400958: srl $2<INTEGER>,$4<INTEGER>,0x01c [VALUE]
%31 = shl i32 %30, 4   ;400960: sll $2<INTEGER>,$2<INTEGER>,0x04 [VALUE]
%32 = getelementptr inbounds i8* %3, i32 %31   ;400968: addu $2<POINTER>,$2<INTEGER>,$6<POINTER> [POINTER]
%33 = lshr i32 %0, 24   ;400970: srl $4<INTEGER>,$4<INTEGER>,0x018 [VALUE]
%34 = and i32 %33, 15   ;400978: andi $4<INTEGER>,$4<INTEGER>,15 [VALUE]
%35 = getelementptr inbounds i8* %32, i32 %34   ;400980: addu $2<POINTER>,$2<POINTER>,$4<INTEGER> [POINTER]
%36 = getelementptr inbounds i8* %35, i32 0
%37 = load i8* %36, align 4   ;400988: lbu $2<BYTE>, 0($2<POINTER>)<POINTER> [POINTER]
%38 = zext i8 %29 to i32
%39 = shl i32 %38, 16   ;400990: sll $3<INTEGER>,$3<BYTE>,0x010 [VALUE]
%40 = add nsw i32 %23, %39   ;400998: addu $5<INTEGER>,$5<INTEGER>,$3<INTEGER> [VALUE]
%41 = zext i8 %37 to i32
%42 = shl i32 %41, 24   ;4009a0: sll $2<INTEGER>,$2<BYTE>,0x018 [VALUE]
%43 = add nsw i32 %40, %42   ;4009a8: addu $2<INTEGER>,$5<INTEGER>,$2<INTEGER> [VALUE]
br label %return

return:
%retvall = alloca i32
store i32 %43, i32* %retvall
%retval = load i32* %retvall
ret i32 %retval   ;4009b0: jr $31<VALUE><JUMP> [JUMP]
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

%4 = getelementptr inbounds i8* %3, i32 -128   ;4009b8: addiu $29<POINTER>,$29<POINTER>,-128<VALUE> [POINTER]
%5 = getelementptr inbounds i8* %0, i32 0   ;4009c0: addu $10<POINTER>,$0<INTEGER>,$4<POINTER> [POINTER]
%6 = load i32* @zero, align 4
%7 = getelementptr inbounds i8* %4, i32 100
%8 = bitcast i8* %7 to i32*
store i32 %6, i32* %8   ;4009c8: sw $19<VALUE>, 100($29<POINTER>)<POINTER> [POINTER]
%9 = getelementptr inbounds i8* %1, i32 0   ;4009d0: addu $19<POINTER>,$0<INTEGER>,$5<POINTER> [POINTER]
%10 = add nsw i32 0, 4   ;4009d8: addiu $11<INTEGER>,$0<INTEGER>,4 [VALUE]
%11 = getelementptr inbounds i8* %4, i32 16   ;4009e0: addiu $8<POINTER>,$29<POINTER>,16 [POINTER]
%12 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;4009e8: lui $7<POINTER>, 4096 [POINTER]
%13 = getelementptr inbounds i8* %12, i32 512   ;4009f0: addiu $7<POINTER>,$7<POINTER>,512 [POINTER]
%14 = getelementptr inbounds i8* %13, i32 48   ;4009f8: addiu $9<POINTER>,$7<POINTER>,48 [POINTER]
%15 = load i32* @zero, align 4
%16 = getelementptr inbounds i8* %4, i32 120
%17 = bitcast i8* %16 to i32*
store i32 %15, i32* %17   ;400a00: sw $31<VALUE>, 120($29<POINTER>)<POINTER> [POINTER]
%18 = load i32* @zero, align 4
%19 = getelementptr inbounds i8* %4, i32 116
%20 = bitcast i8* %19 to i32*
store i32 %18, i32* %20   ;400a08: sw $23<VALUE>, 116($29<POINTER>)<POINTER> [POINTER]
%21 = load i32* @zero, align 4
%22 = getelementptr inbounds i8* %4, i32 112
%23 = bitcast i8* %22 to i32*
store i32 %21, i32* %23   ;400a10: sw $22<VALUE>, 112($29<POINTER>)<POINTER> [POINTER]
%24 = load i32* @zero, align 4
%25 = getelementptr inbounds i8* %4, i32 108
%26 = bitcast i8* %25 to i32*
store i32 %24, i32* %26   ;400a18: sw $21<VALUE>, 108($29<POINTER>)<POINTER> [POINTER]
%27 = load i32* @zero, align 4
%28 = getelementptr inbounds i8* %4, i32 104
%29 = bitcast i8* %28 to i32*
store i32 %27, i32* %29   ;400a20: sw $20<VALUE>, 104($29<POINTER>)<POINTER> [POINTER]
%30 = load i32* @zero, align 4
%31 = getelementptr inbounds i8* %4, i32 96
%32 = bitcast i8* %31 to i32*
store i32 %30, i32* %32   ;400a28: sw $18<VALUE>, 96($29<POINTER>)<POINTER> [POINTER]
%33 = load i32* @zero, align 4
%34 = getelementptr inbounds i8* %4, i32 92
%35 = bitcast i8* %34 to i32*
store i32 %33, i32* %35   ;400a30: sw $17<VALUE>, 92($29<POINTER>)<POINTER> [POINTER]
%36 = load i32* @zero, align 4
%37 = getelementptr inbounds i8* %4, i32 88
%38 = bitcast i8* %37 to i32*
store i32 %36, i32* %38   ;400a38: sw $16<VALUE>, 88($29<POINTER>)<POINTER> [POINTER]
br label %label-1

label-1:
%39 = phi i8* [ %13 , %entry ], [ %61 , %label-1 ]
%40 = phi i8* [ %11 , %entry ], [ %62 , %label-1 ]
%41 = getelementptr inbounds i8* %39, i32 0
%42 = bitcast i8* %41 to i32*
%43 = load i32* %42, align 4   ;400a40: lw $2<INTEGER>, 0($7<POINTER>)<VALUE> [POINTER]
%44 = getelementptr inbounds i8* %39, i32 4
%45 = bitcast i8* %44 to i32*
%46 = load i32* %45, align 4   ;400a48: lw $3<INTEGER>, 4($7<POINTER>)<POINTER> [POINTER]
%47 = getelementptr inbounds i8* %39, i32 8
%48 = bitcast i8* %47 to i32*
%49 = load i32* %48, align 4   ;400a50: lw $4<INTEGER>, 8($7<POINTER>)<POINTER> [POINTER]
%50 = getelementptr inbounds i8* %39, i32 12
%51 = bitcast i8* %50 to i32*
%52 = load i32* %51, align 4   ;400a58: lw $5<INTEGER>, 12($7<POINTER>)<POINTER> [POINTER]
%53 = getelementptr inbounds i8* %40, i32 0
%54 = bitcast i8* %53 to i32*
store i32 %43, i32* %54   ;400a60: sw $2<INTEGER>, 0($8<POINTER>)<POINTER> [POINTER]
%55 = getelementptr inbounds i8* %40, i32 4
%56 = bitcast i8* %55 to i32*
store i32 %46, i32* %56   ;400a68: sw $3<INTEGER>, 4($8<POINTER>)<POINTER> [POINTER]
%57 = getelementptr inbounds i8* %40, i32 8
%58 = bitcast i8* %57 to i32*
store i32 %49, i32* %58   ;400a70: sw $4<INTEGER>, 8($8<POINTER>)<POINTER> [POINTER]
%59 = getelementptr inbounds i8* %40, i32 12
%60 = bitcast i8* %59 to i32*
store i32 %52, i32* %60   ;400a78: sw $5<INTEGER>, 12($8<POINTER>)<POINTER> [POINTER]
%61 = getelementptr inbounds i8* %39, i32 16   ;400a80: addiu $7<POINTER>,$7<POINTER>,16 [POINTER]
%62 = getelementptr inbounds i8* %40, i32 16   ;400a88: addiu $8<POINTER>,$8<POINTER>,16 [POINTER]
%63 = icmp ne i8* %61, %14
br i1 %63, label %label-1, label %label-2   ;400a90: bne $7<POINTER>,$9<POINTER>,400a40 [POINTER]

label-2:
%64 = getelementptr inbounds i8* %61, i32 0
%65 = bitcast i8* %64 to i32*
%66 = load i32* %65, align 4   ;400a98: lw $2<INTEGER>, 0($7<POINTER>)<POINTER> [POINTER]
%67 = getelementptr inbounds i8* %61, i32 4
%68 = bitcast i8* %67 to i32*
%69 = load i32* %68, align 4   ;400aa0: lw $3<INTEGER>, 4($7<POINTER>)<POINTER> [POINTER]
%70 = getelementptr inbounds i8* %61, i32 8
%71 = bitcast i8* %70 to i32*
%72 = load i32* %71, align 4   ;400aa8: lw $4<INTEGER>, 8($7<POINTER>)<POINTER> [POINTER]
%73 = getelementptr inbounds i8* %62, i32 0
%74 = bitcast i8* %73 to i32*
store i32 %66, i32* %74   ;400ab0: sw $2<INTEGER>, 0($8<POINTER>)<POINTER> [POINTER]
%75 = getelementptr inbounds i8* %62, i32 4
%76 = bitcast i8* %75 to i32*
store i32 %69, i32* %76   ;400ab8: sw $3<INTEGER>, 4($8<POINTER>)<POINTER> [POINTER]
%77 = getelementptr inbounds i8* %62, i32 8
%78 = bitcast i8* %77 to i32*
store i32 %72, i32* %78   ;400ac0: sw $4<INTEGER>, 8($8<POINTER>)<POINTER> [POINTER]
%79 = add nsw i32 0, 192   ;400ac8: addiu $2<INTEGER>,$0<INTEGER>,192 [VALUE]
%80 = icmp eq i32 %2, %79
br i1 %80, label %label-3, label %label-4   ;400ad0: beq $6<INTEGER>,$2<INTEGER>,400b30 [VALUE]

label-4:
%81 = icmp slt i32 %2, 193   ;400ad8: slti $2<BIT>,$6<INTEGER>,193 [VALUE]
%82 = icmp eq i1 %81, 0
br i1 %82, label %label-5, label %label-6   ;400ae0: beq $2<BIT>,$0<INTEGER>,400b00 [VALUE]

label-6:
%83 = add nsw i32 0, 128   ;400ae8: addiu $2<INTEGER>,$0<INTEGER>,128 [VALUE]
%84 = icmp eq i32 %2, %83
br i1 %84, label %label-7, label %label-8   ;400af0: beq $6<INTEGER>,$2<INTEGER>,400b18 [VALUE]

label-8:
br label %label-9   ;400af8: j 400db8<JUMP> [JUMP]

label-5:
%85 = add nsw i32 0, 256   ;400b00: addiu $2<INTEGER>,$0<INTEGER>,256 [VALUE]
%86 = icmp eq i32 %2, %85
br i1 %86, label %label-10, label %label-11   ;400b08: beq $6<INTEGER>,$2<INTEGER>,400b48 [VALUE]

label-11:
br label %label-9   ;400b10: j 400db8<JUMP> [JUMP]

label-7:
%87 = add nsw i32 0, 10   ;400b18: addiu $7<INTEGER>,$0<INTEGER>,10 [VALUE]
%88 = add nsw i32 0, 4   ;400b20: addiu $17<INTEGER>,$0<INTEGER>,4 [VALUE]
br label %label-12   ;400b28: j 400b58<JUMP> [JUMP]

label-3:
%89 = add nsw i32 0, 12   ;400b30: addiu $7<INTEGER>,$0<INTEGER>,12 [VALUE]
%90 = add nsw i32 0, 6   ;400b38: addiu $17<INTEGER>,$0<INTEGER>,6 [VALUE]
br label %label-12   ;400b40: j 400b58<JUMP> [JUMP]

label-10:
%91 = add nsw i32 0, 14   ;400b48: addiu $7<INTEGER>,$0<INTEGER>,14 [VALUE]
%92 = add nsw i32 0, 8   ;400b50: addiu $17<INTEGER>,$0<INTEGER>,8 [VALUE]
br label %label-12

label-12:
%93 = phi i32 [ %88 , %label-7 ], [ %90 , %label-3 ], [ %92 , %label-10 ]
%94 = phi i32 [ %87 , %label-7 ], [ %89 , %label-3 ], [ %91 , %label-10 ]
%95 = add nsw i32 0, 0   ;400b58: addu $16<INTEGER>,$0<INTEGER>,$0<INTEGER> [VALUE]
%96 = icmp eq i32 %93, 0
br i1 %96, label %label-13, label %label-14   ;400b60: beq $17<INTEGER>,$0<INTEGER>,400bf8 [VALUE]

label-14:
%97 = getelementptr inbounds i8* %9, i32 0   ;400b68: addu $6<POINTER>,$0<INTEGER>,$19<POINTER> [POINTER]
%98 = getelementptr inbounds i8* %5, i32 0   ;400b70: addu $5<POINTER>,$0<INTEGER>,$10<POINTER> [POINTER]
br label %label-15

label-15:
%99 = phi i32 [ %95 , %label-14 ], [ %106 , %label-15 ]
%100 = phi i8* [ %98 , %label-14 ], [ %124 , %label-15 ]
%101 = phi i8* [ %97 , %label-14 ], [ %123 , %label-15 ]
%102 = getelementptr inbounds i8* %100, i32 0
%103 = load i8* %102, align 4   ;400b78: lbu $2<BYTE>, 0($5<POINTER>)<POINTER> [POINTER]
%104 = getelementptr inbounds i8* %100, i32 1
%105 = load i8* %104, align 4   ;400b80: lbu $4<BYTE>, 1($5<POINTER>)<POINTER> [POINTER]
%106 = add nsw i32 %99, 1   ;400b88: addiu $16<INTEGER>,$16<INTEGER>,1 [VALUE]
%107 = getelementptr inbounds i8* %100, i32 2
%108 = load i8* %107, align 4   ;400b90: lbu $3<BYTE>, 2($5<POINTER>)<POINTER> [POINTER]
%109 = zext i8 %103 to i32
%110 = shl i32 %109, 24   ;400b98: sll $2<INTEGER>,$2<BYTE>,0x018 [VALUE]
%111 = zext i8 %105 to i32
%112 = shl i32 %111, 16   ;400ba0: sll $4<INTEGER>,$4<BYTE>,0x010 [VALUE]
%113 = or i32 %110, %112   ;400ba8: or $2<INTEGER>,$2<INTEGER>,$4<INTEGER> [VALUE]
%114 = getelementptr inbounds i8* %100, i32 3
%115 = load i8* %114, align 4   ;400bb0: lbu $4<BYTE>, 3($5<POINTER>)<POINTER> [POINTER]
%116 = zext i8 %108 to i32
%117 = shl i32 %116, 8   ;400bb8: sll $3<INTEGER>,$3<BYTE>,0x08 [VALUE]
%118 = or i32 %113, %117   ;400bc0: or $2<INTEGER>,$2<INTEGER>,$3<INTEGER> [VALUE]
%119 = zext i8 %115 to i32
%120 = or i32 %118, %119   ;400bc8: or $2<INTEGER>,$2<INTEGER>,$4<BYTE> [VALUE]
%121 = getelementptr inbounds i8* %101, i32 0
%122 = bitcast i8* %121 to i32*
store i32 %120, i32* %122   ;400bd0: sw $2<INTEGER>, 0($6<POINTER>)<POINTER> [POINTER]
%123 = getelementptr inbounds i8* %101, i32 4   ;400bd8: addiu $6<POINTER>,$6<POINTER>,4 [POINTER]
%124 = getelementptr inbounds i8* %100, i32 4   ;400be0: addiu $5<POINTER>,$5<POINTER>,4 [POINTER]
%125 = icmp slt i32 %106, %93   ;400be8: slt $2<BIT>,$16<INTEGER>,$17<INTEGER> [VALUE]
%126 = icmp ne i1 %125, 0
br i1 %126, label %label-15, label %label-13   ;400bf0: bne $2<BIT>,$0<INTEGER>,400b78 [VALUE]

label-13:
%127 = add nsw i32 %94, 1   ;400bf8: addiu $2<INTEGER>,$7<INTEGER>,1 [VALUE]
%128 = zext i32 %10 to i64
%129 = zext i32 %127 to i64
%130 = mul i64 %128, %129
%131 = trunc i64 %130 to i32
store i32 %131, i32* @low
%132 = lshr i64 %130, 32
%133 = trunc i64 %132 to i32
store i32 %133, i32* @high   ;400c00: mult $11<INTEGER>, $2<INTEGER> [POINTER]
%134 = load i32* @low, align 4   ;400c08: mflo $3<INTEGER><VALUE> [VALUE]
%135 = add nsw i32 0, %93   ;400c10: addu $16<INTEGER>,$0<INTEGER>,$17<INTEGER> [VALUE]
%136 = icmp slt i32 %135, %134   ;400c18: slt $2<BIT>,$16<INTEGER>,$3<INTEGER> [VALUE]
%137 = icmp eq i1 %136, 0
br i1 %137, label %label-9, label %label-16   ;400c20: beq $2<BIT>,$0<INTEGER>,400db8 [VALUE]

label-16:
%138 = getelementptr inbounds i8* %4, i32 16   ;400c28: addiu $22<POINTER>,$29<POINTER>,16 [POINTER]
%139 = icmp slt i32 %135, 7   ;400c30: slti $21<BIT>,$16<INTEGER>,7 [VALUE]
%140 = add nsw i32 0, 4   ;400c38: addiu $23<INTEGER>,$0<INTEGER>,4 [VALUE]
%141 = add nsw i32 0, %134   ;400c40: addu $20<INTEGER>,$0<INTEGER>,$3<INTEGER> [VALUE]
%142 = shl i32 %135, 2   ;400c48: sll $2<INTEGER>,$16<INTEGER>,0x02 [VALUE]
%143 = getelementptr inbounds i8* %9, i32 %142   ;400c50: addu $18<POINTER>,$2<INTEGER>,$19<POINTER> [POINTER]
br label %label-32

label-32:
%144 = phi i32 [ %135 , %label-16 ], [ %135 , %label-29 ]
%145 = phi i8* [ %143 , %label-16 ], [ %143 , %label-29 ]
%146 = phi i32 [ %142 , %label-16 ], [ %142 , %label-29 ]
%147 = udiv i32 %144, %93   ;400c58: div $0<INTEGER>,$16<INTEGER>,$17<INTEGER> [VALUE]
%148 = icmp ne i32 %93, %147
br i1 %148, label %label-17, label %label-18   ;400c60: bne $17<INTEGER>,$0<INTEGER>,400c70 [VALUE]

label-18:
call void @exit(i32 -1) noreturn nounwind 
unreachable   ;400c68: break [BREAK]
br label %label-17

label-17:
%150 = add nsw i32 %147, -1   ;400c70: addiu $1<INTEGER>,$0<INTEGER>,-1<VALUE> [VALUE]
%151 = icmp ne i32 %93, %150
br i1 %151, label %label-19, label %label-20   ;400c78: bne $17<INTEGER>,$1<INTEGER>,400c98 [VALUE]

label-20:
%152 = shl i32 32768, 16   ;400c80: lui $1<UNKNOWN>, 32768 [UNKNOWN]
%153 = icmp ne i32 %144, %152
br i1 %153, label %label-19, label %label-21   ;400c88: bne $16<INTEGER>,$1<UNKNOWN>,400c98 [VALUE]

label-21:
call void @exit(i32 -1) noreturn nounwind 
unreachable   ;400c90: break [BREAK]
br label %label-19

label-19:
%155 = load i32* @high, align 4   ;400c98: mfhi $3<INTEGER><VALUE> [VALUE]
%156 = getelementptr inbounds i8* %145, i32 -4
%157 = bitcast i8* %156 to i32*
%158 = load i32* %157, align 4   ;400ca0: lw $4<INTEGER>, -4($18<POINTER>)<POINTER><POINTER> [POINTER]
%159 = icmp ne i32 %155, %147
br i1 %159, label %label-22, label %label-23   ;400ca8: bne $3<INTEGER>,$0<INTEGER>,400d48 [VALUE]

label-23:
%160 = shl i32 %158, 8   ;400cb0: sll $2<INTEGER>,$4<INTEGER>,0x08 [VALUE]
%161 = lshr i32 %158, 24   ;400cb8: srl $4<INTEGER>,$4<INTEGER>,0x018 [VALUE]
%162 = or i32 %160, %161   ;400cc0: or $4<INTEGER>,$2<INTEGER>,$4<INTEGER> [VALUE]
store i8* %4, i8** @stack_SubWord
%163 = call i32 @SubWord(i32 %162) nounwind   ;400cc8: jal 4008a0 <SubWord><null> [null]
%164 = add nsw i32 %144, -1   ;400cd0: addiu $3<INTEGER>,$16<INTEGER>,-1<VALUE> [VALUE]
%165 = udiv i32 %164, %93   ;400cd8: div $0<INTEGER>,$3<INTEGER>,$17<INTEGER> [VALUE]
%166 = icmp ne i32 %93, %165
br i1 %166, label %label-24, label %label-25   ;400ce0: bne $17<INTEGER>,$0<INTEGER>,400cf0 [VALUE]

label-25:
call void @exit(i32 -1) noreturn nounwind 
unreachable   ;400ce8: break [BREAK]
br label %label-24

label-24:
%168 = add nsw i32 %165, -1   ;400cf0: addiu $1<INTEGER>,$0<INTEGER>,-1<VALUE> [VALUE]
%169 = icmp ne i32 %93, %168
br i1 %169, label %label-26, label %label-27   ;400cf8: bne $17<INTEGER>,$1<INTEGER>,400d18 [VALUE]

label-27:
%170 = shl i32 32768, 16   ;400d00: lui $1<UNKNOWN>, 32768 [UNKNOWN]
%171 = icmp ne i32 %164, %170
br i1 %171, label %label-26, label %label-28   ;400d08: bne $3<INTEGER>,$1<UNKNOWN>,400d18 [VALUE]

label-28:
call void @exit(i32 -1) noreturn nounwind 
unreachable   ;400d10: break [BREAK]
br label %label-26

label-26:
%173 = load i32* @low, align 4   ;400d18: mflo $3<INTEGER><VALUE> [VALUE]
%174 = shl i32 %173, 2   ;400d20: sll $3<INTEGER>,$3<INTEGER>,0x02 [VALUE]
%175 = getelementptr inbounds i8* %138, i32 %174   ;400d28: addu $3<POINTER>,$3<INTEGER>,$22<POINTER> [POINTER]
%176 = getelementptr inbounds i8* %175, i32 0
%177 = bitcast i8* %176 to i32*
%178 = load i32* %177, align 4   ;400d30: lw $3<INTEGER>, 0($3<POINTER>)<POINTER> [POINTER]
%179 = xor i32 %163, %178   ;400d38: xor $4<INTEGER>,$2<INTEGER>,$3<INTEGER> [VALUE]
br label %label-29   ;400d40: j 400d68<JUMP> [JUMP]

label-22:
%180 = zext i1 %139 to i32
%181 = icmp ne i32 %180, %147
br i1 %181, label %label-29, label %label-30   ;400d48: bne $21<BIT>,$0<INTEGER>,400d68 [VALUE]

label-30:
%182 = icmp ne i32 %155, %140
br i1 %182, label %label-29, label %label-31   ;400d50: bne $3<INTEGER>,$23<INTEGER>,400d68 [VALUE]

label-31:
store i8* %4, i8** @stack_SubWord
%183 = call i32 @SubWord(i32 %158) nounwind   ;400d58: jal 4008a0 <SubWord><null> [null]
%184 = add nsw i32 %147, %183   ;400d60: addu $4<INTEGER>,$0<INTEGER>,$2<INTEGER> [VALUE]
br label %label-29

label-29:
%185 = phi i32 [ %165 , %label-26 ], [ %147 , %label-22 ], [ %147 , %label-30 ], [ %147 , %label-31 ]
%186 = phi i32 [ %179 , %label-26 ], [ %158 , %label-22 ], [ %184 , %label-31 ], [ %158 , %label-30 ]
%187 = sub i32 %144, %93   ;400d68: subu $2<INTEGER>,$16<INTEGER>,$17<INTEGER> [VALUE]
%188 = shl i32 %187, 2   ;400d70: sll $2<INTEGER>,$2<INTEGER>,0x02 [VALUE]
%189 = getelementptr inbounds i8* %9, i32 %188   ;400d78: addu $2<POINTER>,$2<INTEGER>,$19<POINTER> [POINTER]
%190 = getelementptr inbounds i8* %189, i32 0
%191 = bitcast i8* %190 to i32*
%192 = load i32* %191, align 4   ;400d80: lw $2<INTEGER>, 0($2<POINTER>)<POINTER> [POINTER]
%193 = add nsw i32 %144, 1   ;400d88: addiu $16<INTEGER>,$16<INTEGER>,1 [VALUE]
%194 = xor i32 %192, %186   ;400d90: xor $2<INTEGER>,$2<INTEGER>,$4<INTEGER> [VALUE]
%195 = getelementptr inbounds i8* %145, i32 0
%196 = bitcast i8* %195 to i32*
store i32 %194, i32* %196   ;400d98: sw $2<INTEGER>, 0($18<POINTER>)<POINTER> [POINTER]
%197 = getelementptr inbounds i8* %145, i32 4   ;400da0: addiu $18<POINTER>,$18<POINTER>,4 [POINTER]
%198 = icmp slt i32 %193, %141   ;400da8: slt $2<BIT>,$16<INTEGER>,$20<INTEGER> [VALUE]
%199 = zext i1 %198 to i32
%200 = icmp ne i32 %199, %185
br i1 %200, label %label-32, label %label-9   ;400db0: bne $2<BIT>,$0<INTEGER>,400c58 [VALUE]

label-9:
%201 = getelementptr inbounds i8* %4, i32 120
%202 = bitcast i8* %201 to i32*
%203 = load i32* %202, align 4   ;400db8: lw $31<INTEGER>, 120($29<POINTER>)<POINTER> [POINTER]
%204 = getelementptr inbounds i8* %4, i32 116
%205 = bitcast i8* %204 to i32*
%206 = load i32* %205, align 4   ;400dc0: lw $23<INTEGER>, 116($29<POINTER>)<POINTER> [POINTER]
%207 = getelementptr inbounds i8* %4, i32 112
%208 = bitcast i8* %207 to i32*
%209 = load i32* %208, align 4   ;400dc8: lw $22<INTEGER>, 112($29<POINTER>)<POINTER> [POINTER]
%210 = getelementptr inbounds i8* %4, i32 108
%211 = bitcast i8* %210 to i32*
%212 = load i32* %211, align 4   ;400dd0: lw $21<INTEGER>, 108($29<POINTER>)<POINTER> [POINTER]
%213 = getelementptr inbounds i8* %4, i32 104
%214 = bitcast i8* %213 to i32*
%215 = load i32* %214, align 4   ;400dd8: lw $20<INTEGER>, 104($29<POINTER>)<POINTER> [POINTER]
%216 = getelementptr inbounds i8* %4, i32 100
%217 = bitcast i8* %216 to i32*
%218 = load i32* %217, align 4   ;400de0: lw $19<INTEGER>, 100($29<POINTER>)<POINTER> [POINTER]
%219 = getelementptr inbounds i8* %4, i32 96
%220 = bitcast i8* %219 to i32*
%221 = load i32* %220, align 4   ;400de8: lw $18<INTEGER>, 96($29<POINTER>)<POINTER> [POINTER]
%222 = getelementptr inbounds i8* %4, i32 92
%223 = bitcast i8* %222 to i32*
%224 = load i32* %223, align 4   ;400df0: lw $17<INTEGER>, 92($29<POINTER>)<POINTER> [POINTER]
%225 = getelementptr inbounds i8* %4, i32 88
%226 = bitcast i8* %225 to i32*
%227 = load i32* %226, align 4   ;400df8: lw $16<INTEGER>, 88($29<POINTER>)<POINTER> [POINTER]
%228 = getelementptr inbounds i8* %4, i32 128   ;400e00: addiu $29<POINTER>,$29<POINTER>,128 [POINTER]
br label %return

return:
ret void   ;400e08: jr $31<VALUE><JUMP> [JUMP]
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

%4 = getelementptr inbounds i8* %3, i32 -40   ;400e10: addiu $29<POINTER>,$29<POINTER>,-40<VALUE> [POINTER]
%5 = load i32* @zero, align 4
%6 = getelementptr inbounds i8* %4, i32 32
%7 = bitcast i8* %6 to i32*
store i32 %5, i32* %7   ;400e18: sw $31<VALUE>, 32($29<POINTER>)<POINTER> [POINTER]
%8 = getelementptr inbounds i8* %0, i32 0
%9 = load i8* %8, align 4   ;400e20: lbu $2<BYTE>, 0($4<POINTER>)<POINTER> [POINTER]
%10 = getelementptr inbounds i8* %4, i32 16
store i8 %9, i8* %10   ;400e28: sb $2<BYTE>, 16($29<POINTER>)<POINTER> [POINTER]
%11 = getelementptr inbounds i8* %0, i32 1
%12 = load i8* %11, align 4   ;400e30: lbu $2<BYTE>, 1($4<POINTER>)<POINTER> [POINTER]
%13 = getelementptr inbounds i8* %4, i32 20
store i8 %12, i8* %13   ;400e38: sb $2<BYTE>, 20($29<POINTER>)<POINTER> [POINTER]
%14 = getelementptr inbounds i8* %0, i32 2
%15 = load i8* %14, align 4   ;400e40: lbu $2<BYTE>, 2($4<POINTER>)<POINTER> [POINTER]
%16 = getelementptr inbounds i8* %4, i32 24
store i8 %15, i8* %16   ;400e48: sb $2<BYTE>, 24($29<POINTER>)<POINTER> [POINTER]
%17 = getelementptr inbounds i8* %0, i32 3
%18 = load i8* %17, align 4   ;400e50: lbu $2<BYTE>, 3($4<POINTER>)<POINTER> [POINTER]
%19 = getelementptr inbounds i8* %4, i32 28
store i8 %18, i8* %19   ;400e58: sb $2<BYTE>, 28($29<POINTER>)<POINTER> [POINTER]
%20 = getelementptr inbounds i8* %0, i32 4
%21 = load i8* %20, align 4   ;400e60: lbu $2<BYTE>, 4($4<POINTER>)<POINTER> [POINTER]
%22 = getelementptr inbounds i8* %4, i32 17
store i8 %21, i8* %22   ;400e68: sb $2<BYTE>, 17($29<POINTER>)<POINTER> [POINTER]
%23 = getelementptr inbounds i8* %0, i32 5
%24 = load i8* %23, align 4   ;400e70: lbu $2<BYTE>, 5($4<POINTER>)<POINTER> [POINTER]
%25 = getelementptr inbounds i8* %4, i32 21
store i8 %24, i8* %25   ;400e78: sb $2<BYTE>, 21($29<POINTER>)<POINTER> [POINTER]
%26 = getelementptr inbounds i8* %0, i32 6
%27 = load i8* %26, align 4   ;400e80: lbu $2<BYTE>, 6($4<POINTER>)<POINTER> [POINTER]
%28 = getelementptr inbounds i8* %4, i32 25
store i8 %27, i8* %28   ;400e88: sb $2<BYTE>, 25($29<POINTER>)<POINTER> [POINTER]
%29 = getelementptr inbounds i8* %0, i32 7
%30 = load i8* %29, align 4   ;400e90: lbu $2<BYTE>, 7($4<POINTER>)<POINTER> [POINTER]
%31 = getelementptr inbounds i8* %4, i32 29
store i8 %30, i8* %31   ;400e98: sb $2<BYTE>, 29($29<POINTER>)<POINTER> [POINTER]
%32 = getelementptr inbounds i8* %0, i32 8
%33 = load i8* %32, align 4   ;400ea0: lbu $2<BYTE>, 8($4<POINTER>)<POINTER> [POINTER]
%34 = getelementptr inbounds i8* %4, i32 18
store i8 %33, i8* %34   ;400ea8: sb $2<BYTE>, 18($29<POINTER>)<POINTER> [POINTER]
%35 = getelementptr inbounds i8* %0, i32 9
%36 = load i8* %35, align 4   ;400eb0: lbu $2<BYTE>, 9($4<POINTER>)<POINTER> [POINTER]
%37 = getelementptr inbounds i8* %4, i32 22
store i8 %36, i8* %37   ;400eb8: sb $2<BYTE>, 22($29<POINTER>)<POINTER> [POINTER]
%38 = getelementptr inbounds i8* %0, i32 10
%39 = load i8* %38, align 4   ;400ec0: lbu $2<BYTE>, 10($4<POINTER>)<POINTER> [POINTER]
%40 = getelementptr inbounds i8* %4, i32 26
store i8 %39, i8* %40   ;400ec8: sb $2<BYTE>, 26($29<POINTER>)<POINTER> [POINTER]
%41 = getelementptr inbounds i8* %0, i32 11
%42 = load i8* %41, align 4   ;400ed0: lbu $2<BYTE>, 11($4<POINTER>)<POINTER> [POINTER]
%43 = getelementptr inbounds i8* %4, i32 30
store i8 %42, i8* %43   ;400ed8: sb $2<BYTE>, 30($29<POINTER>)<POINTER> [POINTER]
%44 = getelementptr inbounds i8* %0, i32 12
%45 = load i8* %44, align 4   ;400ee0: lbu $2<BYTE>, 12($4<POINTER>)<POINTER> [POINTER]
%46 = getelementptr inbounds i8* %4, i32 19
store i8 %45, i8* %46   ;400ee8: sb $2<BYTE>, 19($29<POINTER>)<POINTER> [POINTER]
%47 = getelementptr inbounds i8* %0, i32 13
%48 = load i8* %47, align 4   ;400ef0: lbu $2<BYTE>, 13($4<POINTER>)<POINTER> [POINTER]
%49 = getelementptr inbounds i8* %4, i32 23
store i8 %48, i8* %49   ;400ef8: sb $2<BYTE>, 23($29<POINTER>)<POINTER> [POINTER]
%50 = getelementptr inbounds i8* %0, i32 14
%51 = load i8* %50, align 4   ;400f00: lbu $2<BYTE>, 14($4<POINTER>)<POINTER> [POINTER]
%52 = getelementptr inbounds i8* %4, i32 27
store i8 %51, i8* %52   ;400f08: sb $2<BYTE>, 27($29<POINTER>)<POINTER> [POINTER]
%53 = getelementptr inbounds i8* %0, i32 15
%54 = load i8* %53, align 4   ;400f10: lbu $2<BYTE>, 15($4<POINTER>)<POINTER> [POINTER]
%55 = getelementptr inbounds i8* %2, i32 0   ;400f18: addu $5<POINTER>,$0<INTEGER>,$6<POINTER> [POINTER]
%56 = getelementptr inbounds i8* %4, i32 16   ;400f20: addiu $4<POINTER>,$29<POINTER>,16 [POINTER]
%57 = getelementptr inbounds i8* %4, i32 31
store i8 %54, i8* %57   ;400f28: sb $2<BYTE>, 31($29<POINTER>)<POINTER> [POINTER]
store i8* %4, i8** @stack_AddRoundKey
call void @AddRoundKey(i8* %56, i8* %55) nounwind   ;400f30: jal 4001f0 <AddRoundKey><null> [null]
%58 = getelementptr inbounds i8* %4, i32 16   ;400f38: addiu $4<POINTER>,$29<POINTER>,16 [POINTER]
store i8* %4, i8** @stack_SubBytes
call void @SubBytes(i8* %58) nounwind   ;400f40: jal 400508 <SubBytes><null> [null]
%59 = getelementptr inbounds i8* %4, i32 32
%60 = bitcast i8* %59 to i32*
%61 = load i32* %60, align 4   ;400f48: lw $31<INTEGER>, 32($29<POINTER>)<POINTER> [POINTER]
%62 = getelementptr inbounds i8* %4, i32 40   ;400f50: addiu $29<POINTER>,$29<POINTER>,40 [POINTER]
br label %return

return:
ret void   ;400f58: jr $31<VALUE><JUMP> [JUMP]
}

define void @main() nounwind {
entry:
%0 = getelementptr inbounds [761 x i8]* @stack, i32 0, i32 760

%1 = getelementptr inbounds i8* %0, i32 -584   ;400f60: addiu $29<POINTER>,$29<POINTER>,-584<VALUE> [POINTER]
%2 = load i32* @zero, align 4
%3 = getelementptr inbounds i8* %1, i32 580
%4 = bitcast i8* %3 to i32*
store i32 %2, i32* %4   ;400f68: sw $31<VALUE>, 580($29<POINTER>)<POINTER> [POINTER]
%5 = load i32* @zero, align 4
%6 = getelementptr inbounds i8* %1, i32 576
%7 = bitcast i8* %6 to i32*
store i32 %5, i32* %7   ;400f70: sw $16<VALUE>, 576($29<POINTER>)<POINTER> [POINTER]
   ;400f78: jal 4012b8 <main><null> [null]
%8 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;400f80: lui $5<POINTER>, 4096 [POINTER]
%9 = getelementptr inbounds i8* %8, i32 572   ;400f88: addiu $5<POINTER>,$5<POINTER>,572 [POINTER]
%10 = getelementptr inbounds i8* %9, i32 0
%11 = bitcast i8* %10 to i32*
%12 = load i32* %11, align 4
%13 = shl i32 %12, 24
%14 = load i32* @zero, align 4
%15 = and i32 %14, 16777215
%16 = or i32 %13, %15   ;400f90: lwl $2<VALUE>, 3($5<POINTER>)<VALUE> [POINTER]
%17 = getelementptr inbounds i8* %9, i32 0
%18 = bitcast i8* %17 to i32*
%19 = load i32* %18, align 4
%20 = lshr i32 %19, 24
%21 = and i32 %16, 4294967040
%22 = or i32 %20, %21   ;400f98: lwr $2<VALUE>, 0($5<POINTER>)<POINTER> [POINTER]
%23 = getelementptr inbounds i8* %9, i32 4
%24 = bitcast i8* %23 to i32*
%25 = load i32* %24, align 4
%26 = shl i32 %25, 24
%27 = load i32* @zero, align 4
%28 = and i32 %27, 16777215
%29 = or i32 %26, %28   ;400fa0: lwl $3<VALUE>, 7($5<POINTER>)<POINTER> [POINTER]
%30 = getelementptr inbounds i8* %9, i32 4
%31 = bitcast i8* %30 to i32*
%32 = load i32* %31, align 4
%33 = lshr i32 %32, 24
%34 = and i32 %29, 4294967040
%35 = or i32 %33, %34   ;400fa8: lwr $3<VALUE>, 4($5<POINTER>)<POINTER> [POINTER]
%36 = getelementptr inbounds i8* %9, i32 8
%37 = bitcast i8* %36 to i32*
%38 = load i32* %37, align 4
%39 = shl i32 %38, 24
%40 = load i32* @zero, align 4
%41 = and i32 %40, 16777215
%42 = or i32 %39, %41   ;400fb0: lwl $4<VALUE>, 11($5<POINTER>)<POINTER> [POINTER]
%43 = getelementptr inbounds i8* %9, i32 8
%44 = bitcast i8* %43 to i32*
%45 = load i32* %44, align 4
%46 = lshr i32 %45, 24
%47 = and i32 %42, 4294967040
%48 = or i32 %46, %47   ;400fb8: lwr $4<VALUE>, 8($5<POINTER>)<POINTER> [POINTER]
%49 = getelementptr inbounds i8* %1, i32 16
%50 = bitcast i8* %49 to i32*
%51 = load i32* %50, align 4
%52 = lshr i32 %22, 24
%53 = and i32 %51, 4294967040
%54 = or i32 %52, %53
store i32 %54, i32* %50   ;400fc0: swl $2<VALUE>, 19($29<POINTER>)<POINTER> [POINTER]
%55 = getelementptr inbounds i8* %1, i32 16
%56 = bitcast i8* %55 to i32*
%57 = load i32* %56, align 4
%58 = shl i32 %22, 24
%59 = and i32 %57, 16777215
%60 = or i32 %58, %59
store i32 %60, i32* %56   ;400fc8: swr $2<VALUE>, 16($29<POINTER>)<POINTER> [POINTER]
%61 = getelementptr inbounds i8* %1, i32 20
%62 = bitcast i8* %61 to i32*
%63 = load i32* %62, align 4
%64 = lshr i32 %35, 24
%65 = and i32 %63, 4294967040
%66 = or i32 %64, %65
store i32 %66, i32* %62   ;400fd0: swl $3<VALUE>, 23($29<POINTER>)<POINTER> [POINTER]
%67 = getelementptr inbounds i8* %1, i32 20
%68 = bitcast i8* %67 to i32*
%69 = load i32* %68, align 4
%70 = shl i32 %35, 24
%71 = and i32 %69, 16777215
%72 = or i32 %70, %71
store i32 %72, i32* %68   ;400fd8: swr $3<VALUE>, 20($29<POINTER>)<POINTER> [POINTER]
%73 = getelementptr inbounds i8* %1, i32 24
%74 = bitcast i8* %73 to i32*
%75 = load i32* %74, align 4
%76 = lshr i32 %48, 24
%77 = and i32 %75, 4294967040
%78 = or i32 %76, %77
store i32 %78, i32* %74   ;400fe0: swl $4<VALUE>, 27($29<POINTER>)<POINTER> [POINTER]
%79 = getelementptr inbounds i8* %1, i32 24
%80 = bitcast i8* %79 to i32*
%81 = load i32* %80, align 4
%82 = shl i32 %48, 24
%83 = and i32 %81, 16777215
%84 = or i32 %82, %83
store i32 %84, i32* %80   ;400fe8: swr $4<VALUE>, 24($29<POINTER>)<POINTER> [POINTER]
%85 = getelementptr inbounds i8* %9, i32 12
%86 = bitcast i8* %85 to i32*
%87 = load i32* %86, align 4
%88 = shl i32 %87, 24
%89 = and i32 %22, 16777215
%90 = or i32 %88, %89   ;400ff0: lwl $2<VALUE>, 15($5<POINTER>)<POINTER> [POINTER]
%91 = getelementptr inbounds i8* %9, i32 12
%92 = bitcast i8* %91 to i32*
%93 = load i32* %92, align 4
%94 = lshr i32 %93, 24
%95 = and i32 %90, 4294967040
%96 = or i32 %94, %95   ;400ff8: lwr $2<VALUE>, 12($5<POINTER>)<POINTER> [POINTER]
%97 = getelementptr inbounds i8* %1, i32 28
%98 = bitcast i8* %97 to i32*
%99 = load i32* %98, align 4
%100 = lshr i32 %96, 24
%101 = and i32 %99, 4294967040
%102 = or i32 %100, %101
store i32 %102, i32* %98   ;401000: swl $2<VALUE>, 31($29<POINTER>)<POINTER> [POINTER]
%103 = getelementptr inbounds i8* %1, i32 28
%104 = bitcast i8* %103 to i32*
%105 = load i32* %104, align 4
%106 = shl i32 %96, 24
%107 = and i32 %105, 16777215
%108 = or i32 %106, %107
store i32 %108, i32* %104   ;401008: swr $2<VALUE>, 28($29<POINTER>)<POINTER> [POINTER]
%109 = getelementptr inbounds [-1 x i8]* @global, i32 0, i32 0   ;401010: lui $5<POINTER>, 4096 [POINTER]
%110 = getelementptr inbounds i8* %109, i32 588   ;401018: addiu $5<POINTER>,$5<POINTER>,588 [POINTER]
%111 = getelementptr inbounds i8* %110, i32 0
%112 = bitcast i8* %111 to i32*
%113 = load i32* %112, align 4
%114 = shl i32 %113, 24
%115 = and i32 %96, 16777215
%116 = or i32 %114, %115   ;401020: lwl $2<VALUE>, 3($5<POINTER>)<VALUE> [POINTER]
%117 = getelementptr inbounds i8* %110, i32 0
%118 = bitcast i8* %117 to i32*
%119 = load i32* %118, align 4
%120 = lshr i32 %119, 24
%121 = and i32 %116, 4294967040
%122 = or i32 %120, %121   ;401028: lwr $2<VALUE>, 0($5<POINTER>)<POINTER> [POINTER]
%123 = getelementptr inbounds i8* %110, i32 4
%124 = bitcast i8* %123 to i32*
%125 = load i32* %124, align 4
%126 = shl i32 %125, 24
%127 = and i32 %35, 16777215
%128 = or i32 %126, %127   ;401030: lwl $3<VALUE>, 7($5<POINTER>)<POINTER> [POINTER]
%129 = getelementptr inbounds i8* %110, i32 4
%130 = bitcast i8* %129 to i32*
%131 = load i32* %130, align 4
%132 = lshr i32 %131, 24
%133 = and i32 %128, 4294967040
%134 = or i32 %132, %133   ;401038: lwr $3<VALUE>, 4($5<POINTER>)<POINTER> [POINTER]
%135 = getelementptr inbounds i8* %110, i32 8
%136 = bitcast i8* %135 to i32*
%137 = load i32* %136, align 4
%138 = shl i32 %137, 24
%139 = and i32 %48, 16777215
%140 = or i32 %138, %139   ;401040: lwl $4<VALUE>, 11($5<POINTER>)<POINTER> [POINTER]
%141 = getelementptr inbounds i8* %110, i32 8
%142 = bitcast i8* %141 to i32*
%143 = load i32* %142, align 4
%144 = lshr i32 %143, 24
%145 = and i32 %140, 4294967040
%146 = or i32 %144, %145   ;401048: lwr $4<VALUE>, 8($5<POINTER>)<POINTER> [POINTER]
%147 = getelementptr inbounds i8* %1, i32 544
%148 = bitcast i8* %147 to i32*
%149 = load i32* %148, align 4
%150 = lshr i32 %122, 24
%151 = and i32 %149, 4294967040
%152 = or i32 %150, %151
store i32 %152, i32* %148   ;401050: swl $2<VALUE>, 547($29<POINTER>)<POINTER> [POINTER]
%153 = getelementptr inbounds i8* %1, i32 544
%154 = bitcast i8* %153 to i32*
%155 = load i32* %154, align 4
%156 = shl i32 %122, 24
%157 = and i32 %155, 16777215
%158 = or i32 %156, %157
store i32 %158, i32* %154   ;401058: swr $2<VALUE>, 544($29<POINTER>)<POINTER> [POINTER]
%159 = getelementptr inbounds i8* %1, i32 548
%160 = bitcast i8* %159 to i32*
%161 = load i32* %160, align 4
%162 = lshr i32 %134, 24
%163 = and i32 %161, 4294967040
%164 = or i32 %162, %163
store i32 %164, i32* %160   ;401060: swl $3<VALUE>, 551($29<POINTER>)<POINTER> [POINTER]
%165 = getelementptr inbounds i8* %1, i32 548
%166 = bitcast i8* %165 to i32*
%167 = load i32* %166, align 4
%168 = shl i32 %134, 24
%169 = and i32 %167, 16777215
%170 = or i32 %168, %169
store i32 %170, i32* %166   ;401068: swr $3<VALUE>, 548($29<POINTER>)<POINTER> [POINTER]
%171 = getelementptr inbounds i8* %1, i32 552
%172 = bitcast i8* %171 to i32*
%173 = load i32* %172, align 4
%174 = lshr i32 %146, 24
%175 = and i32 %173, 4294967040
%176 = or i32 %174, %175
store i32 %176, i32* %172   ;401070: swl $4<VALUE>, 555($29<POINTER>)<POINTER> [POINTER]
%177 = getelementptr inbounds i8* %1, i32 552
%178 = bitcast i8* %177 to i32*
%179 = load i32* %178, align 4
%180 = shl i32 %146, 24
%181 = and i32 %179, 16777215
%182 = or i32 %180, %181
store i32 %182, i32* %178   ;401078: swr $4<VALUE>, 552($29<POINTER>)<POINTER> [POINTER]
%183 = getelementptr inbounds i8* %110, i32 12
%184 = bitcast i8* %183 to i32*
%185 = load i32* %184, align 4
%186 = shl i32 %185, 24
%187 = and i32 %122, 16777215
%188 = or i32 %186, %187   ;401080: lwl $2<VALUE>, 15($5<POINTER>)<POINTER> [POINTER]
%189 = getelementptr inbounds i8* %110, i32 12
%190 = bitcast i8* %189 to i32*
%191 = load i32* %190, align 4
%192 = lshr i32 %191, 24
%193 = and i32 %188, 4294967040
%194 = or i32 %192, %193   ;401088: lwr $2<VALUE>, 12($5<POINTER>)<POINTER> [POINTER]
%195 = getelementptr inbounds i8* %1, i32 556
%196 = bitcast i8* %195 to i32*
%197 = load i32* %196, align 4
%198 = lshr i32 %194, 24
%199 = and i32 %197, 4294967040
%200 = or i32 %198, %199
store i32 %200, i32* %196   ;401090: swl $2<VALUE>, 559($29<POINTER>)<POINTER> [POINTER]
%201 = getelementptr inbounds i8* %1, i32 556
%202 = bitcast i8* %201 to i32*
%203 = load i32* %202, align 4
%204 = shl i32 %194, 24
%205 = and i32 %203, 16777215
%206 = or i32 %204, %205
store i32 %206, i32* %202   ;401098: swr $2<VALUE>, 556($29<POINTER>)<POINTER> [POINTER]
%207 = getelementptr inbounds i8* %1, i32 16   ;4010a0: addiu $4<POINTER>,$29<POINTER>,16 [POINTER]
%208 = getelementptr inbounds i8* %1, i32 32   ;4010a8: addiu $16<POINTER>,$29<POINTER>,32 [POINTER]
%209 = getelementptr inbounds i8* %208, i32 0   ;4010b0: addu $5<POINTER>,$0<INTEGER>,$16<POINTER> [POINTER]
%210 = add nsw i32 0, 128   ;4010b8: addiu $6<INTEGER>,$0<INTEGER>,128 [VALUE]
store i8* %1, i8** @stack_KeyExpansion
call void @KeyExpansion(i8* %207, i8* %209, i32 %210) nounwind   ;4010c0: jal 4009b8 <KeyExpansion><null> [null]
%211 = getelementptr inbounds i8* %1, i32 544   ;4010c8: addiu $4<POINTER>,$29<POINTER>,544 [POINTER]
%212 = getelementptr inbounds i8* %1, i32 560   ;4010d0: addiu $5<POINTER>,$29<POINTER>,560 [POINTER]
%213 = getelementptr inbounds i8* %208, i32 0   ;4010d8: addu $6<POINTER>,$0<INTEGER>,$16<POINTER> [POINTER]
%214 = add nsw i32 0, 128   ;4010e0: addiu $7<INTEGER>,$0<INTEGER>,128 [VALUE]
store i8* %1, i8** @stack_aesencrypt
call void @aesencrypt(i8* %211, i8* %212, i8* %213) nounwind   ;4010e8: jal 400e10 <aesencrypt><null> [null]
%215 = getelementptr inbounds i8* %1, i32 580
%216 = bitcast i8* %215 to i32*
%217 = load i32* %216, align 4   ;4010f0: lw $31<INTEGER>, 580($29<POINTER>)<POINTER> [POINTER]
%218 = getelementptr inbounds i8* %1, i32 576
%219 = bitcast i8* %218 to i32*
%220 = load i32* %219, align 4   ;4010f8: lw $16<INTEGER>, 576($29<POINTER>)<POINTER> [POINTER]
%221 = getelementptr inbounds i8* %1, i32 584   ;401100: addiu $29<POINTER>,$29<POINTER>,584 [POINTER]
br label %return

return:
ret void   ;401108: jr $31<VALUE><JUMP> [JUMP]
}

declare void @exit(i32) noreturn nounwind
