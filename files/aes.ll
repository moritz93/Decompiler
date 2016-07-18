@stack_AddRoundKey = common global i32* null
@stack_SubBytes = common global i32* null
@stack_InvSubBytes = common global i32* null
@stack_ShiftRows = common global i32* null
@stack_InvShiftRows = common global i32* null
@stack_MixColumns = common global i32* null
@stack_InvMixColumns = common global i32* null
@stack_SubWord = common global i32* null
@stack_KeyExpansion = common global i32* null
@stack_aesencrypt = common global i32* null
@stack_aesdecrypt = common global i32* null
@stack = common global [1041 x i32] zeroinitializer, align 32
@global = common global [4000 x i32] zeroinitializer, align 32
@base = common global i32 0
@ret = common global i32 0

define i32 @AddRoundKey() nounwind {
entry:
%retval = alloca i32
%0 = load i32** @stack_AddRoundKey, align 4

%1 = getelementptr inbounds i32* %null, i32 3
%1 = load i32* %0, align 4
%2 = getelementptr inbounds i32* %0, i32 -8



%3 = getelementptr inbounds i32* %null, i32 0
%3 = load i32* %2, align 4


%4 = getelementptr inbounds i32* %null, i32 0
%4 = load i32* %3, align 4

%5 = getelementptr inbounds i32* %null, i32 0
%5 = load i32* %4, align 4


%6 = getelementptr inbounds i32* %null, i32 4
%6 = load i32* %5, align 4
%7 = getelementptr inbounds i32* %2, i32 1
%8 = load i32* %7, align 4


%9 = getelementptr inbounds i32* %null, i32 8
%9 = load i32* %8, align 4
%10 = getelementptr inbounds i32* %2, i32 2
%11 = load i32* %10, align 4


%12 = getelementptr inbounds i32* %null, i32 12
%12 = load i32* %11, align 4
%13 = getelementptr inbounds i32* %2, i32 3
%14 = load i32* %13, align 4


%15 = getelementptr inbounds i32* %null, i32 7
%15 = load i32* %14, align 4



%16 = getelementptr inbounds i32* %null, i32 4
%16 = load i32* %15, align 4


%17 = getelementptr inbounds i32* %null, i32 4
%17 = load i32* %16, align 4

%18 = getelementptr inbounds i32* %null, i32 1
%18 = load i32* %17, align 4


%19 = getelementptr inbounds i32* %null, i32 5
%19 = load i32* %18, align 4
%20 = getelementptr inbounds i32* %2, i32 1
%21 = load i32* %20, align 4


%22 = getelementptr inbounds i32* %null, i32 9
%22 = load i32* %21, align 4
%23 = getelementptr inbounds i32* %2, i32 2
%24 = load i32* %23, align 4


%25 = getelementptr inbounds i32* %null, i32 13
%25 = load i32* %24, align 4
%26 = getelementptr inbounds i32* %2, i32 3
%27 = load i32* %26, align 4


%28 = getelementptr inbounds i32* %null, i32 11
%28 = load i32* %27, align 4



%29 = getelementptr inbounds i32* %null, i32 8
%29 = load i32* %28, align 4


%30 = getelementptr inbounds i32* %null, i32 8
%30 = load i32* %29, align 4

%31 = getelementptr inbounds i32* %null, i32 2
%31 = load i32* %30, align 4


%32 = getelementptr inbounds i32* %null, i32 6
%32 = load i32* %31, align 4
%33 = getelementptr inbounds i32* %2, i32 1
%34 = load i32* %33, align 4


%35 = getelementptr inbounds i32* %null, i32 10
%35 = load i32* %34, align 4
%36 = getelementptr inbounds i32* %2, i32 2
%37 = load i32* %36, align 4


%38 = getelementptr inbounds i32* %null, i32 14
%38 = load i32* %37, align 4
%39 = getelementptr inbounds i32* %2, i32 3
%40 = load i32* %39, align 4


%41 = getelementptr inbounds i32* %null, i32 15
%41 = load i32* %40, align 4



%42 = getelementptr inbounds i32* %null, i32 12
%42 = load i32* %41, align 4


%43 = getelementptr inbounds i32* %null, i32 12
%43 = load i32* %42, align 4

%44 = getelementptr inbounds i32* %null, i32 3
%44 = load i32* %43, align 4


%45 = getelementptr inbounds i32* %null, i32 7
%45 = load i32* %44, align 4
%46 = getelementptr inbounds i32* %2, i32 1
%47 = load i32* %46, align 4


%48 = getelementptr inbounds i32* %null, i32 11
%48 = load i32* %47, align 4
%49 = getelementptr inbounds i32* %2, i32 2
%50 = load i32* %49, align 4


%51 = getelementptr inbounds i32* %null, i32 15
%51 = load i32* %50, align 4
%52 = getelementptr inbounds i32* %2, i32 3
%53 = load i32* %52, align 4


%54 = getelementptr inbounds i32* %2, i32 8
br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

define i32 @SubBytes() nounwind {
entry:
%retval = alloca i32
%0 = load i32** @stack_SubBytes, align 4

%1 = getelementptr inbounds i32* %null, i32 0
%1 = load i32* %0, align 4
%2 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%3 = getelementptr inbounds i32* %2, i32 0

%4 = getelementptr inbounds i32* %3, i32 %null

%5 = getelementptr inbounds i32* %1, i32 %4
%6 = getelementptr inbounds i32* %5, i32 0
%7 = load i32* %6, align 4
%8 = getelementptr inbounds i32* %null, i32 1
%8 = load i32* %7, align 4


%9 = getelementptr inbounds i32* %6, i32 %7

%10 = getelementptr inbounds i32* %8, i32 %9
%11 = getelementptr inbounds i32* %10, i32 0
%12 = load i32* %11, align 4
%13 = getelementptr inbounds i32* %null, i32 2
%13 = load i32* %12, align 4


%14 = getelementptr inbounds i32* %6, i32 %12

%15 = getelementptr inbounds i32* %13, i32 %14
%16 = getelementptr inbounds i32* %15, i32 0
%17 = load i32* %16, align 4
%18 = getelementptr inbounds i32* %null, i32 3
%18 = load i32* %17, align 4


%19 = getelementptr inbounds i32* %6, i32 %17

%20 = getelementptr inbounds i32* %18, i32 %19
%21 = getelementptr inbounds i32* %20, i32 0
%22 = load i32* %21, align 4
%23 = getelementptr inbounds i32* %null, i32 4
%23 = load i32* %22, align 4


%24 = getelementptr inbounds i32* %6, i32 %22

%25 = getelementptr inbounds i32* %23, i32 %24
%26 = getelementptr inbounds i32* %25, i32 0
%27 = load i32* %26, align 4
%28 = getelementptr inbounds i32* %null, i32 5
%28 = load i32* %27, align 4


%29 = getelementptr inbounds i32* %6, i32 %27

%30 = getelementptr inbounds i32* %28, i32 %29
%31 = getelementptr inbounds i32* %30, i32 0
%32 = load i32* %31, align 4
%33 = getelementptr inbounds i32* %null, i32 6
%33 = load i32* %32, align 4


%34 = getelementptr inbounds i32* %6, i32 %32

%35 = getelementptr inbounds i32* %33, i32 %34
%36 = getelementptr inbounds i32* %35, i32 0
%37 = load i32* %36, align 4
%38 = getelementptr inbounds i32* %null, i32 7
%38 = load i32* %37, align 4


%39 = getelementptr inbounds i32* %6, i32 %37

%40 = getelementptr inbounds i32* %38, i32 %39
%41 = getelementptr inbounds i32* %40, i32 0
%42 = load i32* %41, align 4
%43 = getelementptr inbounds i32* %null, i32 8
%43 = load i32* %42, align 4


%44 = getelementptr inbounds i32* %6, i32 %42

%45 = getelementptr inbounds i32* %43, i32 %44
%46 = getelementptr inbounds i32* %45, i32 0
%47 = load i32* %46, align 4
%48 = getelementptr inbounds i32* %null, i32 9
%48 = load i32* %47, align 4


%49 = getelementptr inbounds i32* %6, i32 %47

%50 = getelementptr inbounds i32* %48, i32 %49
%51 = getelementptr inbounds i32* %50, i32 0
%52 = load i32* %51, align 4
%53 = getelementptr inbounds i32* %null, i32 10
%53 = load i32* %52, align 4


%54 = getelementptr inbounds i32* %6, i32 %52

%55 = getelementptr inbounds i32* %53, i32 %54
%56 = getelementptr inbounds i32* %55, i32 0
%57 = load i32* %56, align 4
%58 = getelementptr inbounds i32* %null, i32 11
%58 = load i32* %57, align 4


%59 = getelementptr inbounds i32* %6, i32 %57

%60 = getelementptr inbounds i32* %58, i32 %59
%61 = getelementptr inbounds i32* %60, i32 0
%62 = load i32* %61, align 4

%63 = getelementptr inbounds i32* %null, i32 12
%63 = load i32* %62, align 4

%64 = getelementptr inbounds i32* %6, i32 %62

%65 = getelementptr inbounds i32* %63, i32 %64
%66 = getelementptr inbounds i32* %65, i32 0
%67 = load i32* %66, align 4
%68 = getelementptr inbounds i32* %null, i32 13
%68 = load i32* %67, align 4


%69 = getelementptr inbounds i32* %6, i32 %67

%70 = getelementptr inbounds i32* %68, i32 %69
%71 = getelementptr inbounds i32* %70, i32 0
%72 = load i32* %71, align 4
%73 = getelementptr inbounds i32* %null, i32 14
%73 = load i32* %72, align 4


%74 = getelementptr inbounds i32* %6, i32 %72

%75 = getelementptr inbounds i32* %73, i32 %74
%76 = getelementptr inbounds i32* %75, i32 0
%77 = load i32* %76, align 4
%78 = getelementptr inbounds i32* %null, i32 15
%78 = load i32* %77, align 4


%79 = getelementptr inbounds i32* %6, i32 %77

%80 = getelementptr inbounds i32* %78, i32 %79
%81 = getelementptr inbounds i32* %80, i32 0
%82 = load i32* %81, align 4

br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

define i32 @InvSubBytes() nounwind {
entry:
%retval = alloca i32
%0 = load i32** @stack_InvSubBytes, align 4

%1 = getelementptr inbounds i32* %null, i32 0
%1 = load i32* %0, align 4
%2 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%3 = getelementptr inbounds i32* %2, i32 256

%4 = getelementptr inbounds i32* %3, i32 %null

%5 = getelementptr inbounds i32* %1, i32 %4
%6 = getelementptr inbounds i32* %5, i32 0
%7 = load i32* %6, align 4
%8 = getelementptr inbounds i32* %null, i32 1
%8 = load i32* %7, align 4


%9 = getelementptr inbounds i32* %6, i32 %7

%10 = getelementptr inbounds i32* %8, i32 %9
%11 = getelementptr inbounds i32* %10, i32 0
%12 = load i32* %11, align 4
%13 = getelementptr inbounds i32* %null, i32 2
%13 = load i32* %12, align 4


%14 = getelementptr inbounds i32* %6, i32 %12

%15 = getelementptr inbounds i32* %13, i32 %14
%16 = getelementptr inbounds i32* %15, i32 0
%17 = load i32* %16, align 4
%18 = getelementptr inbounds i32* %null, i32 3
%18 = load i32* %17, align 4


%19 = getelementptr inbounds i32* %6, i32 %17

%20 = getelementptr inbounds i32* %18, i32 %19
%21 = getelementptr inbounds i32* %20, i32 0
%22 = load i32* %21, align 4
%23 = getelementptr inbounds i32* %null, i32 4
%23 = load i32* %22, align 4


%24 = getelementptr inbounds i32* %6, i32 %22

%25 = getelementptr inbounds i32* %23, i32 %24
%26 = getelementptr inbounds i32* %25, i32 0
%27 = load i32* %26, align 4
%28 = getelementptr inbounds i32* %null, i32 5
%28 = load i32* %27, align 4


%29 = getelementptr inbounds i32* %6, i32 %27

%30 = getelementptr inbounds i32* %28, i32 %29
%31 = getelementptr inbounds i32* %30, i32 0
%32 = load i32* %31, align 4
%33 = getelementptr inbounds i32* %null, i32 6
%33 = load i32* %32, align 4


%34 = getelementptr inbounds i32* %6, i32 %32

%35 = getelementptr inbounds i32* %33, i32 %34
%36 = getelementptr inbounds i32* %35, i32 0
%37 = load i32* %36, align 4
%38 = getelementptr inbounds i32* %null, i32 7
%38 = load i32* %37, align 4


%39 = getelementptr inbounds i32* %6, i32 %37

%40 = getelementptr inbounds i32* %38, i32 %39
%41 = getelementptr inbounds i32* %40, i32 0
%42 = load i32* %41, align 4
%43 = getelementptr inbounds i32* %null, i32 8
%43 = load i32* %42, align 4


%44 = getelementptr inbounds i32* %6, i32 %42

%45 = getelementptr inbounds i32* %43, i32 %44
%46 = getelementptr inbounds i32* %45, i32 0
%47 = load i32* %46, align 4
%48 = getelementptr inbounds i32* %null, i32 9
%48 = load i32* %47, align 4


%49 = getelementptr inbounds i32* %6, i32 %47

%50 = getelementptr inbounds i32* %48, i32 %49
%51 = getelementptr inbounds i32* %50, i32 0
%52 = load i32* %51, align 4
%53 = getelementptr inbounds i32* %null, i32 10
%53 = load i32* %52, align 4


%54 = getelementptr inbounds i32* %6, i32 %52

%55 = getelementptr inbounds i32* %53, i32 %54
%56 = getelementptr inbounds i32* %55, i32 0
%57 = load i32* %56, align 4
%58 = getelementptr inbounds i32* %null, i32 11
%58 = load i32* %57, align 4


%59 = getelementptr inbounds i32* %6, i32 %57

%60 = getelementptr inbounds i32* %58, i32 %59
%61 = getelementptr inbounds i32* %60, i32 0
%62 = load i32* %61, align 4

%63 = getelementptr inbounds i32* %null, i32 12
%63 = load i32* %62, align 4

%64 = getelementptr inbounds i32* %6, i32 %62

%65 = getelementptr inbounds i32* %63, i32 %64
%66 = getelementptr inbounds i32* %65, i32 0
%67 = load i32* %66, align 4
%68 = getelementptr inbounds i32* %null, i32 13
%68 = load i32* %67, align 4


%69 = getelementptr inbounds i32* %6, i32 %67

%70 = getelementptr inbounds i32* %68, i32 %69
%71 = getelementptr inbounds i32* %70, i32 0
%72 = load i32* %71, align 4
%73 = getelementptr inbounds i32* %null, i32 14
%73 = load i32* %72, align 4


%74 = getelementptr inbounds i32* %6, i32 %72

%75 = getelementptr inbounds i32* %73, i32 %74
%76 = getelementptr inbounds i32* %75, i32 0
%77 = load i32* %76, align 4
%78 = getelementptr inbounds i32* %null, i32 15
%78 = load i32* %77, align 4


%79 = getelementptr inbounds i32* %6, i32 %77

%80 = getelementptr inbounds i32* %78, i32 %79
%81 = getelementptr inbounds i32* %80, i32 0
%82 = load i32* %81, align 4

br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

define i32 @ShiftRows() nounwind {
entry:
%retval = alloca i32
%0 = load i32** @stack_ShiftRows, align 4

%1 = getelementptr inbounds i32* %null, i32 4
%1 = load i32* %0, align 4
%2 = getelementptr inbounds i32* %null, i32 7
%2 = load i32* %1, align 4
%3 = getelementptr inbounds i32* %null, i32 10
%3 = load i32* %2, align 4
%4 = getelementptr inbounds i32* %null, i32 11
%4 = load i32* %3, align 4
%5 = getelementptr inbounds i32* %null, i32 5
%5 = load i32* %4, align 4
%6 = getelementptr inbounds i32* %null, i32 6
%6 = load i32* %5, align 4
%7 = getelementptr inbounds i32* %null, i32 15
%7 = load i32* %6, align 4
%8 = getelementptr inbounds i32* %null, i32 14
%8 = load i32* %7, align 4
%9 = getelementptr inbounds i32* %null, i32 13
%9 = load i32* %8, align 4

%10 = getelementptr inbounds i32* %null, i32 8
%10 = load i32* %9, align 4

%11 = getelementptr inbounds i32* %null, i32 9
%11 = load i32* %10, align 4

%12 = getelementptr inbounds i32* %null, i32 12
%12 = load i32* %11, align 4









br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

define i32 @InvShiftRows() nounwind {
entry:
%retval = alloca i32
%0 = load i32** @stack_InvShiftRows, align 4

%1 = getelementptr inbounds i32* %null, i32 7
%1 = load i32* %0, align 4
%2 = getelementptr inbounds i32* %null, i32 4
%2 = load i32* %1, align 4
%3 = getelementptr inbounds i32* %null, i32 9
%3 = load i32* %2, align 4
%4 = getelementptr inbounds i32* %null, i32 8
%4 = load i32* %3, align 4
%5 = getelementptr inbounds i32* %null, i32 6
%5 = load i32* %4, align 4
%6 = getelementptr inbounds i32* %null, i32 5
%6 = load i32* %5, align 4
%7 = getelementptr inbounds i32* %null, i32 12
%7 = load i32* %6, align 4
%8 = getelementptr inbounds i32* %null, i32 13
%8 = load i32* %7, align 4
%9 = getelementptr inbounds i32* %null, i32 14
%9 = load i32* %8, align 4

%10 = getelementptr inbounds i32* %null, i32 11
%10 = load i32* %9, align 4

%11 = getelementptr inbounds i32* %null, i32 10
%11 = load i32* %10, align 4

%12 = getelementptr inbounds i32* %null, i32 15
%12 = load i32* %11, align 4









br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

define i32 @MixColumns() nounwind {
entry:
%retval = alloca i32
%0 = load i32** @stack_MixColumns, align 4

%1 = getelementptr inbounds i32* %null, i32 0
%1 = load i32* %0, align 4
%2 = getelementptr inbounds i32* %0, i32 -8

%3 = getelementptr inbounds i32* %null, i32 4
%3 = load i32* %2, align 4

%4 = getelementptr inbounds i32* %null, i32 8
%4 = load i32* %3, align 4

%5 = getelementptr inbounds i32* %null, i32 12
%5 = load i32* %4, align 4

%6 = shl i32 %1, 1
%7 = add nsw i32 %6, %1
%8 = shl i32 %7, 1
%9 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%10 = getelementptr inbounds i32* %8, i32 %9
%11 = getelementptr inbounds i32* %10, i32 688
%12 = load i32* %11, align 4

%13 = getelementptr inbounds i32* %2, i32 1
%14 = load i32* %13, align 4
%15 = shl i32 %14, 1
%16 = add nsw i32 %15, %14
%17 = shl i32 %16, 1
%18 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%19 = getelementptr inbounds i32* %17, i32 %18
%20 = getelementptr inbounds i32* %19, i32 689
%21 = load i32* %20, align 4


%22 = getelementptr inbounds i32* %2, i32 2
%23 = load i32* %22, align 4


%24 = getelementptr inbounds i32* %2, i32 3
%25 = load i32* %24, align 4


%26 = getelementptr inbounds i32* %2, i32 0
%27 = load i32* %26, align 4

%28 = getelementptr inbounds i32* %2, i32 1
%29 = load i32* %28, align 4
%30 = shl i32 %29, 1
%31 = add nsw i32 %30, %29
%32 = shl i32 %31, 1
%33 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%34 = getelementptr inbounds i32* %32, i32 %33
%35 = getelementptr inbounds i32* %34, i32 688
%36 = load i32* %35, align 4


%37 = getelementptr inbounds i32* %2, i32 2
%38 = load i32* %37, align 4
%39 = shl i32 %38, 1
%40 = add nsw i32 %39, %38
%41 = shl i32 %40, 1
%42 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%43 = getelementptr inbounds i32* %41, i32 %42
%44 = getelementptr inbounds i32* %43, i32 689
%45 = load i32* %44, align 4


%46 = getelementptr inbounds i32* %2, i32 3
%47 = load i32* %46, align 4


%48 = getelementptr inbounds i32* %2, i32 0
%49 = load i32* %48, align 4

%50 = getelementptr inbounds i32* %2, i32 1
%51 = load i32* %50, align 4


%52 = getelementptr inbounds i32* %2, i32 2
%53 = load i32* %52, align 4
%54 = shl i32 %53, 1
%55 = add nsw i32 %54, %53
%56 = shl i32 %55, 1
%57 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%58 = getelementptr inbounds i32* %56, i32 %57
%59 = getelementptr inbounds i32* %58, i32 688
%60 = load i32* %59, align 4


%61 = getelementptr inbounds i32* %2, i32 3
%62 = load i32* %61, align 4
%63 = shl i32 %62, 1
%64 = add nsw i32 %63, %62
%65 = shl i32 %64, 1
%66 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%67 = getelementptr inbounds i32* %65, i32 %66
%68 = getelementptr inbounds i32* %67, i32 689
%69 = load i32* %68, align 4


%70 = getelementptr inbounds i32* %2, i32 0
%71 = load i32* %70, align 4
%72 = shl i32 %71, 1
%73 = add nsw i32 %72, %71
%74 = shl i32 %73, 1
%75 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%76 = getelementptr inbounds i32* %74, i32 %75
%77 = getelementptr inbounds i32* %76, i32 689
%78 = load i32* %77, align 4

%79 = getelementptr inbounds i32* %2, i32 1
%80 = load i32* %79, align 4


%81 = getelementptr inbounds i32* %2, i32 2
%82 = load i32* %81, align 4


%83 = getelementptr inbounds i32* %2, i32 3
%84 = load i32* %83, align 4
%85 = shl i32 %84, 1
%86 = add nsw i32 %85, %84
%87 = shl i32 %86, 1
%88 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%89 = getelementptr inbounds i32* %87, i32 %88
%90 = getelementptr inbounds i32* %89, i32 688
%91 = load i32* %90, align 4
%92 = getelementptr inbounds i32* %null, i32 1
%92 = load i32* %91, align 4



%93 = getelementptr inbounds i32* %null, i32 5
%93 = load i32* %92, align 4

%94 = getelementptr inbounds i32* %null, i32 9
%94 = load i32* %93, align 4

%95 = getelementptr inbounds i32* %null, i32 13
%95 = load i32* %94, align 4

%96 = shl i32 %92, 1
%97 = add nsw i32 %96, %92
%98 = shl i32 %97, 1
%99 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%100 = getelementptr inbounds i32* %98, i32 %99
%101 = getelementptr inbounds i32* %100, i32 688
%102 = load i32* %101, align 4

%103 = getelementptr inbounds i32* %2, i32 1
%104 = load i32* %103, align 4
%105 = shl i32 %104, 1
%106 = add nsw i32 %105, %104
%107 = shl i32 %106, 1
%108 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%109 = getelementptr inbounds i32* %107, i32 %108
%110 = getelementptr inbounds i32* %109, i32 689
%111 = load i32* %110, align 4


%112 = getelementptr inbounds i32* %2, i32 2
%113 = load i32* %112, align 4


%114 = getelementptr inbounds i32* %2, i32 3
%115 = load i32* %114, align 4


%116 = getelementptr inbounds i32* %2, i32 0
%117 = load i32* %116, align 4

%118 = getelementptr inbounds i32* %2, i32 1
%119 = load i32* %118, align 4
%120 = shl i32 %119, 1
%121 = add nsw i32 %120, %119
%122 = shl i32 %121, 1
%123 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%124 = getelementptr inbounds i32* %122, i32 %123
%125 = getelementptr inbounds i32* %124, i32 688
%126 = load i32* %125, align 4


%127 = getelementptr inbounds i32* %2, i32 2
%128 = load i32* %127, align 4
%129 = shl i32 %128, 1
%130 = add nsw i32 %129, %128
%131 = shl i32 %130, 1
%132 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%133 = getelementptr inbounds i32* %131, i32 %132
%134 = getelementptr inbounds i32* %133, i32 689
%135 = load i32* %134, align 4


%136 = getelementptr inbounds i32* %2, i32 3
%137 = load i32* %136, align 4


%138 = getelementptr inbounds i32* %2, i32 0
%139 = load i32* %138, align 4

%140 = getelementptr inbounds i32* %2, i32 1
%141 = load i32* %140, align 4


%142 = getelementptr inbounds i32* %2, i32 2
%143 = load i32* %142, align 4
%144 = shl i32 %143, 1
%145 = add nsw i32 %144, %143
%146 = shl i32 %145, 1
%147 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%148 = getelementptr inbounds i32* %146, i32 %147
%149 = getelementptr inbounds i32* %148, i32 688
%150 = load i32* %149, align 4


%151 = getelementptr inbounds i32* %2, i32 3
%152 = load i32* %151, align 4
%153 = shl i32 %152, 1
%154 = add nsw i32 %153, %152
%155 = shl i32 %154, 1
%156 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%157 = getelementptr inbounds i32* %155, i32 %156
%158 = getelementptr inbounds i32* %157, i32 689
%159 = load i32* %158, align 4


%160 = getelementptr inbounds i32* %2, i32 0
%161 = load i32* %160, align 4
%162 = shl i32 %161, 1
%163 = add nsw i32 %162, %161
%164 = shl i32 %163, 1
%165 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%166 = getelementptr inbounds i32* %164, i32 %165
%167 = getelementptr inbounds i32* %166, i32 689
%168 = load i32* %167, align 4

%169 = getelementptr inbounds i32* %2, i32 1
%170 = load i32* %169, align 4


%171 = getelementptr inbounds i32* %2, i32 2
%172 = load i32* %171, align 4


%173 = getelementptr inbounds i32* %2, i32 3
%174 = load i32* %173, align 4
%175 = shl i32 %174, 1
%176 = add nsw i32 %175, %174
%177 = shl i32 %176, 1
%178 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%179 = getelementptr inbounds i32* %177, i32 %178
%180 = getelementptr inbounds i32* %179, i32 688
%181 = load i32* %180, align 4
%182 = getelementptr inbounds i32* %null, i32 2
%182 = load i32* %181, align 4



%183 = getelementptr inbounds i32* %null, i32 6
%183 = load i32* %182, align 4

%184 = getelementptr inbounds i32* %null, i32 10
%184 = load i32* %183, align 4

%185 = getelementptr inbounds i32* %null, i32 14
%185 = load i32* %184, align 4

%186 = shl i32 %182, 1
%187 = add nsw i32 %186, %182
%188 = shl i32 %187, 1
%189 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%190 = getelementptr inbounds i32* %188, i32 %189
%191 = getelementptr inbounds i32* %190, i32 688
%192 = load i32* %191, align 4

%193 = getelementptr inbounds i32* %2, i32 1
%194 = load i32* %193, align 4
%195 = shl i32 %194, 1
%196 = add nsw i32 %195, %194
%197 = shl i32 %196, 1
%198 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%199 = getelementptr inbounds i32* %197, i32 %198
%200 = getelementptr inbounds i32* %199, i32 689
%201 = load i32* %200, align 4


%202 = getelementptr inbounds i32* %2, i32 2
%203 = load i32* %202, align 4


%204 = getelementptr inbounds i32* %2, i32 3
%205 = load i32* %204, align 4


%206 = getelementptr inbounds i32* %2, i32 0
%207 = load i32* %206, align 4

%208 = getelementptr inbounds i32* %2, i32 1
%209 = load i32* %208, align 4
%210 = shl i32 %209, 1
%211 = add nsw i32 %210, %209
%212 = shl i32 %211, 1
%213 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%214 = getelementptr inbounds i32* %212, i32 %213
%215 = getelementptr inbounds i32* %214, i32 688
%216 = load i32* %215, align 4


%217 = getelementptr inbounds i32* %2, i32 2
%218 = load i32* %217, align 4
%219 = shl i32 %218, 1
%220 = add nsw i32 %219, %218
%221 = shl i32 %220, 1
%222 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%223 = getelementptr inbounds i32* %221, i32 %222
%224 = getelementptr inbounds i32* %223, i32 689
%225 = load i32* %224, align 4


%226 = getelementptr inbounds i32* %2, i32 3
%227 = load i32* %226, align 4


%228 = getelementptr inbounds i32* %2, i32 0
%229 = load i32* %228, align 4

%230 = getelementptr inbounds i32* %2, i32 1
%231 = load i32* %230, align 4


%232 = getelementptr inbounds i32* %2, i32 2
%233 = load i32* %232, align 4
%234 = shl i32 %233, 1
%235 = add nsw i32 %234, %233
%236 = shl i32 %235, 1
%237 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%238 = getelementptr inbounds i32* %236, i32 %237
%239 = getelementptr inbounds i32* %238, i32 688
%240 = load i32* %239, align 4


%241 = getelementptr inbounds i32* %2, i32 3
%242 = load i32* %241, align 4
%243 = shl i32 %242, 1
%244 = add nsw i32 %243, %242
%245 = shl i32 %244, 1
%246 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%247 = getelementptr inbounds i32* %245, i32 %246
%248 = getelementptr inbounds i32* %247, i32 689
%249 = load i32* %248, align 4


%250 = getelementptr inbounds i32* %2, i32 0
%251 = load i32* %250, align 4
%252 = shl i32 %251, 1
%253 = add nsw i32 %252, %251
%254 = shl i32 %253, 1
%255 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%256 = getelementptr inbounds i32* %254, i32 %255
%257 = getelementptr inbounds i32* %256, i32 689
%258 = load i32* %257, align 4

%259 = getelementptr inbounds i32* %2, i32 1
%260 = load i32* %259, align 4


%261 = getelementptr inbounds i32* %2, i32 2
%262 = load i32* %261, align 4


%263 = getelementptr inbounds i32* %2, i32 3
%264 = load i32* %263, align 4
%265 = shl i32 %264, 1
%266 = add nsw i32 %265, %264
%267 = shl i32 %266, 1
%268 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%269 = getelementptr inbounds i32* %267, i32 %268
%270 = getelementptr inbounds i32* %269, i32 688
%271 = load i32* %270, align 4
%272 = getelementptr inbounds i32* %null, i32 3
%272 = load i32* %271, align 4



%273 = getelementptr inbounds i32* %null, i32 7
%273 = load i32* %272, align 4

%274 = getelementptr inbounds i32* %null, i32 11
%274 = load i32* %273, align 4

%275 = getelementptr inbounds i32* %null, i32 15
%275 = load i32* %274, align 4

%276 = shl i32 %272, 1
%277 = add nsw i32 %276, %272
%278 = shl i32 %277, 1
%279 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%280 = getelementptr inbounds i32* %278, i32 %279
%281 = getelementptr inbounds i32* %280, i32 688
%282 = load i32* %281, align 4

%283 = getelementptr inbounds i32* %2, i32 1
%284 = load i32* %283, align 4
%285 = shl i32 %284, 1
%286 = add nsw i32 %285, %284
%287 = shl i32 %286, 1
%288 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%289 = getelementptr inbounds i32* %287, i32 %288
%290 = getelementptr inbounds i32* %289, i32 689
%291 = load i32* %290, align 4


%292 = getelementptr inbounds i32* %2, i32 2
%293 = load i32* %292, align 4


%294 = getelementptr inbounds i32* %2, i32 3
%295 = load i32* %294, align 4


%296 = getelementptr inbounds i32* %2, i32 0
%297 = load i32* %296, align 4

%298 = getelementptr inbounds i32* %2, i32 1
%299 = load i32* %298, align 4
%300 = shl i32 %299, 1
%301 = add nsw i32 %300, %299
%302 = shl i32 %301, 1
%303 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%304 = getelementptr inbounds i32* %302, i32 %303
%305 = getelementptr inbounds i32* %304, i32 688
%306 = load i32* %305, align 4


%307 = getelementptr inbounds i32* %2, i32 2
%308 = load i32* %307, align 4
%309 = shl i32 %308, 1
%310 = add nsw i32 %309, %308
%311 = shl i32 %310, 1
%312 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%313 = getelementptr inbounds i32* %311, i32 %312
%314 = getelementptr inbounds i32* %313, i32 689
%315 = load i32* %314, align 4


%316 = getelementptr inbounds i32* %2, i32 3
%317 = load i32* %316, align 4


%318 = getelementptr inbounds i32* %2, i32 0
%319 = load i32* %318, align 4

%320 = getelementptr inbounds i32* %2, i32 1
%321 = load i32* %320, align 4


%322 = getelementptr inbounds i32* %2, i32 2
%323 = load i32* %322, align 4
%324 = shl i32 %323, 1
%325 = add nsw i32 %324, %323
%326 = shl i32 %325, 1
%327 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%328 = getelementptr inbounds i32* %326, i32 %327
%329 = getelementptr inbounds i32* %328, i32 688
%330 = load i32* %329, align 4


%331 = getelementptr inbounds i32* %2, i32 3
%332 = load i32* %331, align 4
%333 = shl i32 %332, 1
%334 = add nsw i32 %333, %332
%335 = shl i32 %334, 1
%336 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%337 = getelementptr inbounds i32* %335, i32 %336
%338 = getelementptr inbounds i32* %337, i32 689
%339 = load i32* %338, align 4


%340 = getelementptr inbounds i32* %2, i32 0
%341 = load i32* %340, align 4
%342 = shl i32 %341, 1
%343 = add nsw i32 %342, %341
%344 = shl i32 %343, 1
%345 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%346 = getelementptr inbounds i32* %344, i32 %345
%347 = getelementptr inbounds i32* %346, i32 689
%348 = load i32* %347, align 4

%349 = getelementptr inbounds i32* %2, i32 1
%350 = load i32* %349, align 4


%351 = getelementptr inbounds i32* %2, i32 2
%352 = load i32* %351, align 4


%353 = getelementptr inbounds i32* %2, i32 3
%354 = load i32* %353, align 4
%355 = shl i32 %354, 1
%356 = add nsw i32 %355, %354
%357 = shl i32 %356, 1
%358 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%359 = getelementptr inbounds i32* %357, i32 %358
%360 = getelementptr inbounds i32* %359, i32 688
%361 = load i32* %360, align 4


%362 = getelementptr inbounds i32* %2, i32 8
br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

define i32 @InvMixColumns() nounwind {
entry:
%retval = alloca i32
%0 = load i32** @stack_InvMixColumns, align 4

%1 = getelementptr inbounds i32* %null, i32 0
%1 = load i32* %0, align 4
%2 = getelementptr inbounds i32* %0, i32 -8

%3 = getelementptr inbounds i32* %null, i32 4
%3 = load i32* %2, align 4

%4 = getelementptr inbounds i32* %null, i32 8
%4 = load i32* %3, align 4

%5 = getelementptr inbounds i32* %null, i32 12
%5 = load i32* %4, align 4

%6 = shl i32 %1, 1
%7 = add nsw i32 %6, %1
%8 = shl i32 %7, 1
%9 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%10 = getelementptr inbounds i32* %8, i32 %9
%11 = getelementptr inbounds i32* %10, i32 693
%12 = load i32* %11, align 4

%13 = getelementptr inbounds i32* %2, i32 1
%14 = load i32* %13, align 4
%15 = shl i32 %14, 1
%16 = add nsw i32 %15, %14
%17 = shl i32 %16, 1
%18 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%19 = getelementptr inbounds i32* %17, i32 %18
%20 = getelementptr inbounds i32* %19, i32 691
%21 = load i32* %20, align 4


%22 = getelementptr inbounds i32* %2, i32 2
%23 = load i32* %22, align 4
%24 = shl i32 %23, 1
%25 = add nsw i32 %24, %23
%26 = shl i32 %25, 1
%27 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%28 = getelementptr inbounds i32* %26, i32 %27
%29 = getelementptr inbounds i32* %28, i32 692
%30 = load i32* %29, align 4


%31 = getelementptr inbounds i32* %2, i32 3
%32 = load i32* %31, align 4
%33 = shl i32 %32, 1
%34 = add nsw i32 %33, %32
%35 = shl i32 %34, 1
%36 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%37 = getelementptr inbounds i32* %35, i32 %36
%38 = getelementptr inbounds i32* %37, i32 690
%39 = load i32* %38, align 4


%40 = getelementptr inbounds i32* %2, i32 0
%41 = load i32* %40, align 4
%42 = shl i32 %41, 1
%43 = add nsw i32 %42, %41
%44 = shl i32 %43, 1
%45 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%46 = getelementptr inbounds i32* %44, i32 %45
%47 = getelementptr inbounds i32* %46, i32 690
%48 = load i32* %47, align 4

%49 = getelementptr inbounds i32* %2, i32 1
%50 = load i32* %49, align 4
%51 = shl i32 %50, 1
%52 = add nsw i32 %51, %50
%53 = shl i32 %52, 1
%54 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%55 = getelementptr inbounds i32* %53, i32 %54
%56 = getelementptr inbounds i32* %55, i32 693
%57 = load i32* %56, align 4


%58 = getelementptr inbounds i32* %2, i32 2
%59 = load i32* %58, align 4
%60 = shl i32 %59, 1
%61 = add nsw i32 %60, %59
%62 = shl i32 %61, 1
%63 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%64 = getelementptr inbounds i32* %62, i32 %63
%65 = getelementptr inbounds i32* %64, i32 691
%66 = load i32* %65, align 4


%67 = getelementptr inbounds i32* %2, i32 3
%68 = load i32* %67, align 4
%69 = shl i32 %68, 1
%70 = add nsw i32 %69, %68
%71 = shl i32 %70, 1
%72 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%73 = getelementptr inbounds i32* %71, i32 %72
%74 = getelementptr inbounds i32* %73, i32 692
%75 = load i32* %74, align 4


%76 = getelementptr inbounds i32* %2, i32 0
%77 = load i32* %76, align 4
%78 = shl i32 %77, 1
%79 = add nsw i32 %78, %77
%80 = shl i32 %79, 1
%81 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%82 = getelementptr inbounds i32* %80, i32 %81
%83 = getelementptr inbounds i32* %82, i32 692
%84 = load i32* %83, align 4

%85 = getelementptr inbounds i32* %2, i32 1
%86 = load i32* %85, align 4
%87 = shl i32 %86, 1
%88 = add nsw i32 %87, %86
%89 = shl i32 %88, 1
%90 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%91 = getelementptr inbounds i32* %89, i32 %90
%92 = getelementptr inbounds i32* %91, i32 690
%93 = load i32* %92, align 4


%94 = getelementptr inbounds i32* %2, i32 2
%95 = load i32* %94, align 4
%96 = shl i32 %95, 1
%97 = add nsw i32 %96, %95
%98 = shl i32 %97, 1
%99 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%100 = getelementptr inbounds i32* %98, i32 %99
%101 = getelementptr inbounds i32* %100, i32 693
%102 = load i32* %101, align 4


%103 = getelementptr inbounds i32* %2, i32 3
%104 = load i32* %103, align 4
%105 = shl i32 %104, 1
%106 = add nsw i32 %105, %104
%107 = shl i32 %106, 1
%108 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%109 = getelementptr inbounds i32* %107, i32 %108
%110 = getelementptr inbounds i32* %109, i32 691
%111 = load i32* %110, align 4


%112 = getelementptr inbounds i32* %2, i32 0
%113 = load i32* %112, align 4
%114 = shl i32 %113, 1
%115 = add nsw i32 %114, %113
%116 = shl i32 %115, 1
%117 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%118 = getelementptr inbounds i32* %116, i32 %117
%119 = getelementptr inbounds i32* %118, i32 691
%120 = load i32* %119, align 4

%121 = getelementptr inbounds i32* %2, i32 1
%122 = load i32* %121, align 4
%123 = shl i32 %122, 1
%124 = add nsw i32 %123, %122
%125 = shl i32 %124, 1
%126 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%127 = getelementptr inbounds i32* %125, i32 %126
%128 = getelementptr inbounds i32* %127, i32 692
%129 = load i32* %128, align 4


%130 = getelementptr inbounds i32* %2, i32 2
%131 = load i32* %130, align 4
%132 = shl i32 %131, 1
%133 = add nsw i32 %132, %131
%134 = shl i32 %133, 1
%135 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%136 = getelementptr inbounds i32* %134, i32 %135
%137 = getelementptr inbounds i32* %136, i32 690
%138 = load i32* %137, align 4


%139 = getelementptr inbounds i32* %2, i32 3
%140 = load i32* %139, align 4
%141 = shl i32 %140, 1
%142 = add nsw i32 %141, %140
%143 = shl i32 %142, 1
%144 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%145 = getelementptr inbounds i32* %143, i32 %144
%146 = getelementptr inbounds i32* %145, i32 693
%147 = load i32* %146, align 4
%148 = getelementptr inbounds i32* %null, i32 1
%148 = load i32* %147, align 4



%149 = getelementptr inbounds i32* %null, i32 5
%149 = load i32* %148, align 4

%150 = getelementptr inbounds i32* %null, i32 9
%150 = load i32* %149, align 4

%151 = getelementptr inbounds i32* %null, i32 13
%151 = load i32* %150, align 4

%152 = shl i32 %148, 1
%153 = add nsw i32 %152, %148
%154 = shl i32 %153, 1
%155 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%156 = getelementptr inbounds i32* %154, i32 %155
%157 = getelementptr inbounds i32* %156, i32 693
%158 = load i32* %157, align 4

%159 = getelementptr inbounds i32* %2, i32 1
%160 = load i32* %159, align 4
%161 = shl i32 %160, 1
%162 = add nsw i32 %161, %160
%163 = shl i32 %162, 1
%164 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%165 = getelementptr inbounds i32* %163, i32 %164
%166 = getelementptr inbounds i32* %165, i32 691
%167 = load i32* %166, align 4


%168 = getelementptr inbounds i32* %2, i32 2
%169 = load i32* %168, align 4
%170 = shl i32 %169, 1
%171 = add nsw i32 %170, %169
%172 = shl i32 %171, 1
%173 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%174 = getelementptr inbounds i32* %172, i32 %173
%175 = getelementptr inbounds i32* %174, i32 692
%176 = load i32* %175, align 4


%177 = getelementptr inbounds i32* %2, i32 3
%178 = load i32* %177, align 4
%179 = shl i32 %178, 1
%180 = add nsw i32 %179, %178
%181 = shl i32 %180, 1
%182 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%183 = getelementptr inbounds i32* %181, i32 %182
%184 = getelementptr inbounds i32* %183, i32 690
%185 = load i32* %184, align 4


%186 = getelementptr inbounds i32* %2, i32 0
%187 = load i32* %186, align 4
%188 = shl i32 %187, 1
%189 = add nsw i32 %188, %187
%190 = shl i32 %189, 1
%191 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%192 = getelementptr inbounds i32* %190, i32 %191
%193 = getelementptr inbounds i32* %192, i32 690
%194 = load i32* %193, align 4

%195 = getelementptr inbounds i32* %2, i32 1
%196 = load i32* %195, align 4
%197 = shl i32 %196, 1
%198 = add nsw i32 %197, %196
%199 = shl i32 %198, 1
%200 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%201 = getelementptr inbounds i32* %199, i32 %200
%202 = getelementptr inbounds i32* %201, i32 693
%203 = load i32* %202, align 4


%204 = getelementptr inbounds i32* %2, i32 2
%205 = load i32* %204, align 4
%206 = shl i32 %205, 1
%207 = add nsw i32 %206, %205
%208 = shl i32 %207, 1
%209 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%210 = getelementptr inbounds i32* %208, i32 %209
%211 = getelementptr inbounds i32* %210, i32 691
%212 = load i32* %211, align 4


%213 = getelementptr inbounds i32* %2, i32 3
%214 = load i32* %213, align 4
%215 = shl i32 %214, 1
%216 = add nsw i32 %215, %214
%217 = shl i32 %216, 1
%218 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%219 = getelementptr inbounds i32* %217, i32 %218
%220 = getelementptr inbounds i32* %219, i32 692
%221 = load i32* %220, align 4


%222 = getelementptr inbounds i32* %2, i32 0
%223 = load i32* %222, align 4
%224 = shl i32 %223, 1
%225 = add nsw i32 %224, %223
%226 = shl i32 %225, 1
%227 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%228 = getelementptr inbounds i32* %226, i32 %227
%229 = getelementptr inbounds i32* %228, i32 692
%230 = load i32* %229, align 4

%231 = getelementptr inbounds i32* %2, i32 1
%232 = load i32* %231, align 4
%233 = shl i32 %232, 1
%234 = add nsw i32 %233, %232
%235 = shl i32 %234, 1
%236 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%237 = getelementptr inbounds i32* %235, i32 %236
%238 = getelementptr inbounds i32* %237, i32 690
%239 = load i32* %238, align 4


%240 = getelementptr inbounds i32* %2, i32 2
%241 = load i32* %240, align 4
%242 = shl i32 %241, 1
%243 = add nsw i32 %242, %241
%244 = shl i32 %243, 1
%245 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%246 = getelementptr inbounds i32* %244, i32 %245
%247 = getelementptr inbounds i32* %246, i32 693
%248 = load i32* %247, align 4


%249 = getelementptr inbounds i32* %2, i32 3
%250 = load i32* %249, align 4
%251 = shl i32 %250, 1
%252 = add nsw i32 %251, %250
%253 = shl i32 %252, 1
%254 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%255 = getelementptr inbounds i32* %253, i32 %254
%256 = getelementptr inbounds i32* %255, i32 691
%257 = load i32* %256, align 4


%258 = getelementptr inbounds i32* %2, i32 0
%259 = load i32* %258, align 4
%260 = shl i32 %259, 1
%261 = add nsw i32 %260, %259
%262 = shl i32 %261, 1
%263 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%264 = getelementptr inbounds i32* %262, i32 %263
%265 = getelementptr inbounds i32* %264, i32 691
%266 = load i32* %265, align 4

%267 = getelementptr inbounds i32* %2, i32 1
%268 = load i32* %267, align 4
%269 = shl i32 %268, 1
%270 = add nsw i32 %269, %268
%271 = shl i32 %270, 1
%272 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%273 = getelementptr inbounds i32* %271, i32 %272
%274 = getelementptr inbounds i32* %273, i32 692
%275 = load i32* %274, align 4


%276 = getelementptr inbounds i32* %2, i32 2
%277 = load i32* %276, align 4
%278 = shl i32 %277, 1
%279 = add nsw i32 %278, %277
%280 = shl i32 %279, 1
%281 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%282 = getelementptr inbounds i32* %280, i32 %281
%283 = getelementptr inbounds i32* %282, i32 690
%284 = load i32* %283, align 4


%285 = getelementptr inbounds i32* %2, i32 3
%286 = load i32* %285, align 4
%287 = shl i32 %286, 1
%288 = add nsw i32 %287, %286
%289 = shl i32 %288, 1
%290 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%291 = getelementptr inbounds i32* %289, i32 %290
%292 = getelementptr inbounds i32* %291, i32 693
%293 = load i32* %292, align 4
%294 = getelementptr inbounds i32* %null, i32 2
%294 = load i32* %293, align 4



%295 = getelementptr inbounds i32* %null, i32 6
%295 = load i32* %294, align 4

%296 = getelementptr inbounds i32* %null, i32 10
%296 = load i32* %295, align 4

%297 = getelementptr inbounds i32* %null, i32 14
%297 = load i32* %296, align 4

%298 = shl i32 %294, 1
%299 = add nsw i32 %298, %294
%300 = shl i32 %299, 1
%301 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%302 = getelementptr inbounds i32* %300, i32 %301
%303 = getelementptr inbounds i32* %302, i32 693
%304 = load i32* %303, align 4

%305 = getelementptr inbounds i32* %2, i32 1
%306 = load i32* %305, align 4
%307 = shl i32 %306, 1
%308 = add nsw i32 %307, %306
%309 = shl i32 %308, 1
%310 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%311 = getelementptr inbounds i32* %309, i32 %310
%312 = getelementptr inbounds i32* %311, i32 691
%313 = load i32* %312, align 4


%314 = getelementptr inbounds i32* %2, i32 2
%315 = load i32* %314, align 4
%316 = shl i32 %315, 1
%317 = add nsw i32 %316, %315
%318 = shl i32 %317, 1
%319 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%320 = getelementptr inbounds i32* %318, i32 %319
%321 = getelementptr inbounds i32* %320, i32 692
%322 = load i32* %321, align 4


%323 = getelementptr inbounds i32* %2, i32 3
%324 = load i32* %323, align 4
%325 = shl i32 %324, 1
%326 = add nsw i32 %325, %324
%327 = shl i32 %326, 1
%328 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%329 = getelementptr inbounds i32* %327, i32 %328
%330 = getelementptr inbounds i32* %329, i32 690
%331 = load i32* %330, align 4


%332 = getelementptr inbounds i32* %2, i32 0
%333 = load i32* %332, align 4
%334 = shl i32 %333, 1
%335 = add nsw i32 %334, %333
%336 = shl i32 %335, 1
%337 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%338 = getelementptr inbounds i32* %336, i32 %337
%339 = getelementptr inbounds i32* %338, i32 690
%340 = load i32* %339, align 4

%341 = getelementptr inbounds i32* %2, i32 1
%342 = load i32* %341, align 4
%343 = shl i32 %342, 1
%344 = add nsw i32 %343, %342
%345 = shl i32 %344, 1
%346 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%347 = getelementptr inbounds i32* %345, i32 %346
%348 = getelementptr inbounds i32* %347, i32 693
%349 = load i32* %348, align 4


%350 = getelementptr inbounds i32* %2, i32 2
%351 = load i32* %350, align 4
%352 = shl i32 %351, 1
%353 = add nsw i32 %352, %351
%354 = shl i32 %353, 1
%355 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%356 = getelementptr inbounds i32* %354, i32 %355
%357 = getelementptr inbounds i32* %356, i32 691
%358 = load i32* %357, align 4


%359 = getelementptr inbounds i32* %2, i32 3
%360 = load i32* %359, align 4
%361 = shl i32 %360, 1
%362 = add nsw i32 %361, %360
%363 = shl i32 %362, 1
%364 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%365 = getelementptr inbounds i32* %363, i32 %364
%366 = getelementptr inbounds i32* %365, i32 692
%367 = load i32* %366, align 4


%368 = getelementptr inbounds i32* %2, i32 0
%369 = load i32* %368, align 4
%370 = shl i32 %369, 1
%371 = add nsw i32 %370, %369
%372 = shl i32 %371, 1
%373 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%374 = getelementptr inbounds i32* %372, i32 %373
%375 = getelementptr inbounds i32* %374, i32 692
%376 = load i32* %375, align 4

%377 = getelementptr inbounds i32* %2, i32 1
%378 = load i32* %377, align 4
%379 = shl i32 %378, 1
%380 = add nsw i32 %379, %378
%381 = shl i32 %380, 1
%382 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%383 = getelementptr inbounds i32* %381, i32 %382
%384 = getelementptr inbounds i32* %383, i32 690
%385 = load i32* %384, align 4


%386 = getelementptr inbounds i32* %2, i32 2
%387 = load i32* %386, align 4
%388 = shl i32 %387, 1
%389 = add nsw i32 %388, %387
%390 = shl i32 %389, 1
%391 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%392 = getelementptr inbounds i32* %390, i32 %391
%393 = getelementptr inbounds i32* %392, i32 693
%394 = load i32* %393, align 4


%395 = getelementptr inbounds i32* %2, i32 3
%396 = load i32* %395, align 4
%397 = shl i32 %396, 1
%398 = add nsw i32 %397, %396
%399 = shl i32 %398, 1
%400 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%401 = getelementptr inbounds i32* %399, i32 %400
%402 = getelementptr inbounds i32* %401, i32 691
%403 = load i32* %402, align 4


%404 = getelementptr inbounds i32* %2, i32 0
%405 = load i32* %404, align 4
%406 = shl i32 %405, 1
%407 = add nsw i32 %406, %405
%408 = shl i32 %407, 1
%409 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%410 = getelementptr inbounds i32* %408, i32 %409
%411 = getelementptr inbounds i32* %410, i32 691
%412 = load i32* %411, align 4

%413 = getelementptr inbounds i32* %2, i32 1
%414 = load i32* %413, align 4
%415 = shl i32 %414, 1
%416 = add nsw i32 %415, %414
%417 = shl i32 %416, 1
%418 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%419 = getelementptr inbounds i32* %417, i32 %418
%420 = getelementptr inbounds i32* %419, i32 692
%421 = load i32* %420, align 4


%422 = getelementptr inbounds i32* %2, i32 2
%423 = load i32* %422, align 4
%424 = shl i32 %423, 1
%425 = add nsw i32 %424, %423
%426 = shl i32 %425, 1
%427 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%428 = getelementptr inbounds i32* %426, i32 %427
%429 = getelementptr inbounds i32* %428, i32 690
%430 = load i32* %429, align 4


%431 = getelementptr inbounds i32* %2, i32 3
%432 = load i32* %431, align 4
%433 = shl i32 %432, 1
%434 = add nsw i32 %433, %432
%435 = shl i32 %434, 1
%436 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%437 = getelementptr inbounds i32* %435, i32 %436
%438 = getelementptr inbounds i32* %437, i32 693
%439 = load i32* %438, align 4
%440 = getelementptr inbounds i32* %null, i32 3
%440 = load i32* %439, align 4



%441 = getelementptr inbounds i32* %null, i32 7
%441 = load i32* %440, align 4

%442 = getelementptr inbounds i32* %null, i32 11
%442 = load i32* %441, align 4

%443 = getelementptr inbounds i32* %null, i32 15
%443 = load i32* %442, align 4

%444 = shl i32 %440, 1
%445 = add nsw i32 %444, %440
%446 = shl i32 %445, 1
%447 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%448 = getelementptr inbounds i32* %446, i32 %447
%449 = getelementptr inbounds i32* %448, i32 693
%450 = load i32* %449, align 4

%451 = getelementptr inbounds i32* %2, i32 1
%452 = load i32* %451, align 4
%453 = shl i32 %452, 1
%454 = add nsw i32 %453, %452
%455 = shl i32 %454, 1
%456 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%457 = getelementptr inbounds i32* %455, i32 %456
%458 = getelementptr inbounds i32* %457, i32 691
%459 = load i32* %458, align 4


%460 = getelementptr inbounds i32* %2, i32 2
%461 = load i32* %460, align 4
%462 = shl i32 %461, 1
%463 = add nsw i32 %462, %461
%464 = shl i32 %463, 1
%465 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%466 = getelementptr inbounds i32* %464, i32 %465
%467 = getelementptr inbounds i32* %466, i32 692
%468 = load i32* %467, align 4


%469 = getelementptr inbounds i32* %2, i32 3
%470 = load i32* %469, align 4
%471 = shl i32 %470, 1
%472 = add nsw i32 %471, %470
%473 = shl i32 %472, 1
%474 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%475 = getelementptr inbounds i32* %473, i32 %474
%476 = getelementptr inbounds i32* %475, i32 690
%477 = load i32* %476, align 4


%478 = getelementptr inbounds i32* %2, i32 0
%479 = load i32* %478, align 4
%480 = shl i32 %479, 1
%481 = add nsw i32 %480, %479
%482 = shl i32 %481, 1
%483 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%484 = getelementptr inbounds i32* %482, i32 %483
%485 = getelementptr inbounds i32* %484, i32 690
%486 = load i32* %485, align 4

%487 = getelementptr inbounds i32* %2, i32 1
%488 = load i32* %487, align 4
%489 = shl i32 %488, 1
%490 = add nsw i32 %489, %488
%491 = shl i32 %490, 1
%492 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%493 = getelementptr inbounds i32* %491, i32 %492
%494 = getelementptr inbounds i32* %493, i32 693
%495 = load i32* %494, align 4


%496 = getelementptr inbounds i32* %2, i32 2
%497 = load i32* %496, align 4
%498 = shl i32 %497, 1
%499 = add nsw i32 %498, %497
%500 = shl i32 %499, 1
%501 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%502 = getelementptr inbounds i32* %500, i32 %501
%503 = getelementptr inbounds i32* %502, i32 691
%504 = load i32* %503, align 4


%505 = getelementptr inbounds i32* %2, i32 3
%506 = load i32* %505, align 4
%507 = shl i32 %506, 1
%508 = add nsw i32 %507, %506
%509 = shl i32 %508, 1
%510 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%511 = getelementptr inbounds i32* %509, i32 %510
%512 = getelementptr inbounds i32* %511, i32 692
%513 = load i32* %512, align 4


%514 = getelementptr inbounds i32* %2, i32 0
%515 = load i32* %514, align 4
%516 = shl i32 %515, 1
%517 = add nsw i32 %516, %515
%518 = shl i32 %517, 1
%519 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%520 = getelementptr inbounds i32* %518, i32 %519
%521 = getelementptr inbounds i32* %520, i32 692
%522 = load i32* %521, align 4

%523 = getelementptr inbounds i32* %2, i32 1
%524 = load i32* %523, align 4
%525 = shl i32 %524, 1
%526 = add nsw i32 %525, %524
%527 = shl i32 %526, 1
%528 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%529 = getelementptr inbounds i32* %527, i32 %528
%530 = getelementptr inbounds i32* %529, i32 690
%531 = load i32* %530, align 4


%532 = getelementptr inbounds i32* %2, i32 2
%533 = load i32* %532, align 4
%534 = shl i32 %533, 1
%535 = add nsw i32 %534, %533
%536 = shl i32 %535, 1
%537 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%538 = getelementptr inbounds i32* %536, i32 %537
%539 = getelementptr inbounds i32* %538, i32 693
%540 = load i32* %539, align 4


%541 = getelementptr inbounds i32* %2, i32 3
%542 = load i32* %541, align 4
%543 = shl i32 %542, 1
%544 = add nsw i32 %543, %542
%545 = shl i32 %544, 1
%546 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%547 = getelementptr inbounds i32* %545, i32 %546
%548 = getelementptr inbounds i32* %547, i32 691
%549 = load i32* %548, align 4


%550 = getelementptr inbounds i32* %2, i32 0
%551 = load i32* %550, align 4
%552 = shl i32 %551, 1
%553 = add nsw i32 %552, %551
%554 = shl i32 %553, 1
%555 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%556 = getelementptr inbounds i32* %554, i32 %555
%557 = getelementptr inbounds i32* %556, i32 691
%558 = load i32* %557, align 4

%559 = getelementptr inbounds i32* %2, i32 1
%560 = load i32* %559, align 4
%561 = shl i32 %560, 1
%562 = add nsw i32 %561, %560
%563 = shl i32 %562, 1
%564 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%565 = getelementptr inbounds i32* %563, i32 %564
%566 = getelementptr inbounds i32* %565, i32 692
%567 = load i32* %566, align 4


%568 = getelementptr inbounds i32* %2, i32 2
%569 = load i32* %568, align 4
%570 = shl i32 %569, 1
%571 = add nsw i32 %570, %569
%572 = shl i32 %571, 1
%573 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%574 = getelementptr inbounds i32* %572, i32 %573
%575 = getelementptr inbounds i32* %574, i32 690
%576 = load i32* %575, align 4


%577 = getelementptr inbounds i32* %2, i32 3
%578 = load i32* %577, align 4
%579 = shl i32 %578, 1
%580 = add nsw i32 %579, %578
%581 = shl i32 %580, 1
%582 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%583 = getelementptr inbounds i32* %581, i32 %582
%584 = getelementptr inbounds i32* %583, i32 693
%585 = load i32* %584, align 4


%586 = getelementptr inbounds i32* %2, i32 8
br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

define i32 @SubWord() nounwind {
entry:
%retval = alloca i32
%0 = load i32** @stack_SubWord, align 4

%1 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%2 = getelementptr inbounds i32* %1, i32 0

%3 = getelementptr inbounds i32* %2, i32 %null

%4 = getelementptr inbounds i32* %null, i32 %3


%5 = getelementptr inbounds i32* %2, i32 %null


%6 = getelementptr inbounds i32* %null, i32 %5
%7 = getelementptr inbounds i32* %6, i32 0
%8 = load i32* %7, align 4
%9 = getelementptr inbounds i32* %4, i32 0
%10 = load i32* %9, align 4


%11 = shl i32 %8, 8
%12 = add nsw i32 %10, %11


%13 = getelementptr inbounds i32* %7, i32 %11
%14 = getelementptr inbounds i32* %null, i32 %13
%15 = getelementptr inbounds i32* %14, i32 0
%16 = load i32* %15, align 4

%17 = shl i32 %14, 4
%18 = getelementptr inbounds i32* %7, i32 %17


%19 = getelementptr inbounds i32* %9, i32 %18
%20 = getelementptr inbounds i32* %19, i32 0
%21 = load i32* %20, align 4
%22 = shl i32 %16, 16
%23 = add nsw i32 %12, %22
%24 = shl i32 %21, 24
%25 = add nsw i32 %23, %24
br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

define i32 @KeyExpansion(i32 %a, i32 %b, i32 %c) nounwind {
entry:
%retval = alloca i32
%a_addr = alloca i32, align 4
store i32 %a, i32* %a_addr
%0 = load i32* %a_addr, align 4
%b_addr = alloca i32, align 4
store i32 %b, i32* %b_addr
%1 = load i32* %b_addr, align 4
%c_addr = alloca i32, align 4
store i32 %c, i32* %c_addr
%2 = load i32* %c_addr, align 4
%3 = load i32** @stack_KeyExpansion, align 4

%4 = getelementptr inbounds i32* %3, i32 -80
%5 = getelementptr inbounds i32* %0, i32 0
%6 = add nsw i32 0, %1
%7 = add nsw i32 0, 4
%8 = getelementptr inbounds i32* %4, i32 0
%9 = getelementptr inbounds [4000 x i32]* @global, i32 0, i32 3999
%10 = getelementptr inbounds i32* %9, i32 512
%11 = getelementptr inbounds i32* %10, i32 48
br label %label-2

label-2:
%12 = phi i32 [ %10 , %label-0 ], [ %null , %label-2 ]
%13 = getelementptr inbounds i32* %12, i32 0
%14 = load i32* %13, align 4
%15 = phi i32 [ %10 , %label-0 ], [ %12 , %label-2 ]
%16 = getelementptr inbounds i32* %15, i32 4
%17 = load i32* %16, align 4
%18 = phi i32 [ %10 , %label-0 ], [ %15 , %label-2 ]
%19 = getelementptr inbounds i32* %18, i32 8
%20 = load i32* %19, align 4
%21 = phi i32 [ %10 , %label-0 ], [ %18 , %label-2 ]
%22 = getelementptr inbounds i32* %21, i32 12
%23 = load i32* %22, align 4
%24 = phi i32 [ %8 , %label-0 ], [ %null , %label-2 ]
%25 = getelementptr inbounds i32* %24, i32 0
store i32 %14, i32* %25
%26 = phi i32 [ %8 , %label-0 ], [ %24 , %label-2 ]
%27 = getelementptr inbounds i32* %26, i32 4
store i32 %17, i32* %27
%28 = phi i32 [ %8 , %label-0 ], [ %26 , %label-2 ]
%29 = getelementptr inbounds i32* %28, i32 8
store i32 %20, i32* %29
%30 = phi i32 [ %8 , %label-0 ], [ %28 , %label-2 ]
%31 = getelementptr inbounds i32* %30, i32 12
store i32 %23, i32* %31
%32 = phi i32 [ %10 , %label-0 ], [ %21 , %label-2 ]
%33 = getelementptr inbounds i32* %32, i32 16
%34 = phi i32 [ %8 , %label-0 ], [ %30 , %label-2 ]
%35 = getelementptr inbounds i32* %34, i32 16
%cmp = icmp ne i1 %33, false
br i1 %cmp, label %label-2, label %label-3

label-3:
%36 = getelementptr inbounds i32* %33, i32 0
%37 = load i32* %36, align 4
%38 = getelementptr inbounds i32* %33, i32 4
%39 = load i32* %38, align 4
%40 = getelementptr inbounds i32* %33, i32 8
%41 = load i32* %40, align 4
%42 = getelementptr inbounds i32* %35, i32 0
store i32 %37, i32* %42
%43 = getelementptr inbounds i32* %35, i32 4
store i32 %39, i32* %43
%44 = getelementptr inbounds i32* %35, i32 8
store i32 %41, i32* %44
%45 = add nsw i32 0, 192
%cmp = icmp eq i1 %null, false
br i1 %cmp, label %label-4, label %label-5

label-5:
%46 = icmp slt i32 %null, 193
%cmp = icmp eq i1 %46, false
br i1 %cmp, label %label-6, label %label-7

label-7:
%47 = add nsw i32 0, 128
%cmp = icmp eq i1 %null, false
br i1 %cmp, label %label-8, label %label-9

label-9:
br label %label-10

label-6:
%48 = add nsw i32 0, 256
%cmp = icmp eq i1 %null, false
br i1 %cmp, label %label-11, label %label-12

label-12:
br label %label-10

label-8:
%49 = add nsw i32 0, 10
%50 = add nsw i32 0, 4
br label %label-13

label-4:
%51 = add nsw i32 0, 12
%52 = add nsw i32 0, 6
br label %label-13

label-11:
%53 = add nsw i32 0, 14
%54 = add nsw i32 0, 8
br label %label-13

label-13:
%55 = add nsw i32 0, 0
%56 = phi i32 [ %52 , %label-4 ], [ %50 , %label-8 ], [ %54 , %label-11 ]
%cmp = icmp eq i1 %56, false
br i1 %cmp, label %label-14, label %label-15

label-15:
%57 = add nsw i32 0, %6
%58 = getelementptr inbounds i32* %5, i32 0
br label %label-16

label-16:
%59 = phi i32 [ %58 , %label-15 ], [ %null , %label-16 ]
%60 = getelementptr inbounds i32* %59, i32 0
%61 = load i32* %60, align 4
%62 = phi i32 [ %58 , %label-15 ], [ %59 , %label-16 ]
%63 = getelementptr inbounds i32* %62, i32 1
%64 = load i32* %63, align 4
%65 = phi i32 [ %55 , %label-13 ], [ %null , %label-16 ]
%66 = add nsw i32 %65, 1
%67 = phi i32 [ %58 , %label-15 ], [ %62 , %label-16 ]
%68 = getelementptr inbounds i32* %67, i32 2
%69 = load i32* %68, align 4
%70 = shl i32 %61, 24
%71 = shl i32 %64, 16

%72 = phi i32 [ %58 , %label-15 ], [ %67 , %label-16 ]
%73 = getelementptr inbounds i32* %72, i32 3
%74 = load i32* %73, align 4
%75 = shl i32 %69, 8


%76 = phi i32 [ %57 , %label-15 ], [ %null , %label-16 ]
%77 = getelementptr inbounds i32* %76, i32 0
store i32 %70, i32* %77
%78 = phi i32 [ %57 , %label-15 ], [ %76 , %label-16 ]
%79 = getelementptr inbounds i32* %78, i32 4
%80 = phi i32 [ %58 , %label-15 ], [ %72 , %label-16 ]
%81 = getelementptr inbounds i32* %80, i32 4
%82 = phi i32 [ %52 , %label-4 ], [ %50 , %label-8 ], [ %54 , %label-11 ]
%83 = icmp slt i32 %66, %82
%cmp = icmp ne i1 %83, false
br i1 %cmp, label %label-16, label %label-14

label-14:
%84 = phi i32 [ %51 , %label-4 ], [ %49 , %label-8 ], [ %53 , %label-11 ]
%85 = add nsw i32 %84, 1


%86 = phi i32 [ %52 , %label-4 ], [ %50 , %label-8 ], [ %54 , %label-11 ]
%87 = add nsw i32 0, %86
%88 = phi i32 [ %39 , %label-3 ], [ %75 , %label-16 ]
%89 = icmp slt i32 %87, %88
%cmp = icmp eq i1 %89, false
br i1 %cmp, label %label-10, label %label-17

label-17:

%90 = add nsw i32 %null, 0
%91 = phi i32 [ %39 , %label-3 ], [ %75 , %label-16 ]
%92 = add nsw i32 0, %91
%93 = shl i32 %87, 2
%94 = add nsw i32 %93, %6
br label %label-33

label-33:

%95 = phi i32 [ %52 , %label-4 ], [ %50 , %label-8 ], [ %54 , %label-11 ]
%cmp = icmp ne i1 %95, false
br i1 %cmp, label %label-18, label %label-19

label-19:
null
br label %label-18

label-18:
%96 = getelementptr inbounds i32* %0, i32 -1
%97 = phi i32 [ %52 , %label-4 ], [ %50 , %label-8 ], [ %54 , %label-11 ]
%cmp = icmp ne i1 %97, false
br i1 %cmp, label %label-20, label %label-21

label-21:

%98 = phi i32 [ %87 , %label-14 ], [ %null , %label-30 ]
%cmp = icmp ne i1 %98, false
br i1 %cmp, label %label-20, label %label-22

label-22:
null
br label %label-20

label-20:

%99 = phi i32 [ %94 , %label-17 ], [ %null , %label-30 ]
-%100 = getelementptr inbounds i32* %99, i32 4
%101 = load i32* %100, align 4
%102 = phi i32 [ %39 , %label-3 ], [ %75 , %label-16 ], [ %null , %label-27 ], [ %null , %label-32 ]
%cmp = icmp ne i1 %102, false
br i1 %cmp, label %label-23, label %label-24

label-24:
%103 = phi i32 [ %87 , %label-14 ], [ %null , %label-30 ]
%104 = add nsw i32 %103, -1

%105 = phi i32 [ %52 , %label-4 ], [ %50 , %label-8 ], [ %54 , %label-11 ]
%cmp = icmp ne i1 %105, false
br i1 %cmp, label %label-25, label %label-26

label-26:
null
br label %label-25

label-25:
%106 = getelementptr inbounds i32* %0, i32 -1
%107 = phi i32 [ %52 , %label-4 ], [ %50 , %label-8 ], [ %54 , %label-11 ]
%cmp = icmp ne i1 %107, false
br i1 %cmp, label %label-27, label %label-28

label-28:

%cmp = icmp ne i1 %104, false
br i1 %cmp, label %label-27, label %label-29

label-29:
null
br label %label-27

label-27:

%108 = shl i32 %101, 8



%109 = add nsw i32 %null, %90

%110 = add nsw i32 %109, %null
%111 = getelementptr inbounds i32* %110, i32 0
%112 = load i32* %111, align 4


%113 = add nsw i32 %null, %90
%114 = shl i32 %104, 2


%115 = add nsw i32 %113, %110
%116 = getelementptr inbounds i32* %115, i32 0
%117 = load i32* %116, align 4




%118 = add nsw i32 %115, %90
%119 = add nsw i32 %118, %110
%120 = getelementptr inbounds i32* %119, i32 0
%121 = load i32* %120, align 4
%122 = shl i32 %117, 8
%123 = add nsw i32 %112, %122
%124 = shl i32 %121, 16
%125 = add nsw i32 %123, %124

%126 = shl i32 %124, 4
%127 = add nsw i32 %126, %90


%128 = add nsw i32 %127, %108
%129 = getelementptr inbounds i32* %128, i32 0
%130 = load i32* %129, align 4
%131 = getelementptr inbounds i32* %4, i32 %114
%132 = getelementptr inbounds i32* %131, i32 0
%133 = load i32* %132, align 4
%134 = shl i32 %130, 24
%135 = add nsw i32 %125, %134

br label %label-30

label-23:
%136 = phi i32 [ %52 , %label-4 ], [ %50 , %label-8 ], [ %54 , %label-11 ]
%137 = icmp slt i32 %136, 7
%cmp = icmp ne i1 %137, false
br i1 %cmp, label %label-30, label %label-31

label-31:
%138 = getelementptr inbounds i32* %0, i32 4
%139 = phi i32 [ %39 , %label-3 ], [ %75 , %label-16 ], [ %133 , %label-27 ], [ %null , %label-32 ]
%cmp = icmp ne i1 %139, false
br i1 %cmp, label %label-30, label %label-32

label-32:

%140 = add nsw i32 %null, %90

%141 = add nsw i32 %140, %null


%142 = add nsw i32 %null, %90


%143 = add nsw i32 %142, %null
%144 = getelementptr inbounds i32* %143, i32 0
%145 = load i32* %144, align 4
%146 = getelementptr inbounds i32* %141, i32 0
%147 = load i32* %146, align 4
%148 = shl i32 %145, 8
%149 = add nsw i32 %147, %148


%150 = add nsw i32 %143, %90


%151 = add nsw i32 %150, %148
%152 = getelementptr inbounds i32* %151, i32 0
%153 = load i32* %152, align 4



%154 = shl i32 %151, 4
%155 = add nsw i32 %154, %90
%156 = add nsw i32 %155, %148
%157 = getelementptr inbounds i32* %156, i32 0
%158 = load i32* %157, align 4
%159 = shl i32 %153, 16
%160 = add nsw i32 %149, %159
%161 = shl i32 %158, 24
%162 = add nsw i32 %160, %161
br label %label-30

label-30:

%163 = shl i32 %null, 2
%164 = getelementptr inbounds i32* %6, i32 %163
%165 = getelementptr inbounds i32* %164, i32 0
%166 = load i32* %165, align 4
%167 = phi i32 [ %87 , %label-14 ], [ %null , %label-30 ]
%168 = add nsw i32 %167, 1

%169 = phi i32 [ %94 , %label-17 ], [ %null , %label-30 ]
%170 = getelementptr inbounds i32* %169, i32 0
store i32 %166, i32* %170
%171 = phi i32 [ %94 , %label-17 ], [ %169 , %label-30 ]
%172 = getelementptr inbounds i32* %171, i32 4
%173 = icmp slt i32 %168, %92
%cmp = icmp ne i1 %173, false
br i1 %cmp, label %label-33, label %label-10

label-10:
%174 = getelementptr inbounds i32* %4, i32 80
br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

define i32 @aesencrypt() nounwind {
entry:
%retval = alloca i32
%0 = load i32** @stack_aesencrypt, align 4

%1 = getelementptr inbounds i32* %0, i32 -48
%2 = load i32* @ret, align 4
%3 = getelementptr inbounds i32* %1, i32 44
store i32 %2, i32* %3
%5 = getelementptr inbounds i32* %1, i32 40
store i32 %4, i32* %5
%7 = getelementptr inbounds i32* %1, i32 36
store i32 %6, i32* %7
%9 = getelementptr inbounds i32* %1, i32 32
store i32 %8, i32* %9
%10 = getelementptr inbounds i32* %null, i32 0
%10 = load i32* %9, align 4

%11 = getelementptr inbounds i32* %null, i32 1
%11 = load i32* %10, align 4

%12 = getelementptr inbounds i32* %null, i32 2
%12 = load i32* %11, align 4

%13 = getelementptr inbounds i32* %null, i32 3
%13 = load i32* %12, align 4

%14 = getelementptr inbounds i32* %null, i32 4
%14 = load i32* %13, align 4

%15 = getelementptr inbounds i32* %null, i32 5
%15 = load i32* %14, align 4

%16 = getelementptr inbounds i32* %null, i32 6
%16 = load i32* %15, align 4

%17 = getelementptr inbounds i32* %null, i32 7
%17 = load i32* %16, align 4

%18 = getelementptr inbounds i32* %null, i32 8
%18 = load i32* %17, align 4

%19 = getelementptr inbounds i32* %null, i32 9
%19 = load i32* %18, align 4

%20 = getelementptr inbounds i32* %null, i32 10
%20 = load i32* %19, align 4

%21 = getelementptr inbounds i32* %null, i32 11
%21 = load i32* %20, align 4

%22 = getelementptr inbounds i32* %null, i32 12
%22 = load i32* %21, align 4

%23 = getelementptr inbounds i32* %null, i32 13
%23 = load i32* %22, align 4

%24 = getelementptr inbounds i32* %null, i32 14
%24 = load i32* %23, align 4
%25 = getelementptr inbounds i32* %null, i32 0

%26 = getelementptr inbounds i32* %null, i32 15
%26 = load i32* %25, align 4
%27 = getelementptr inbounds i32* %null, i32 0
%28 = getelementptr inbounds i32* %27, i32 0
%29 = getelementptr inbounds i32* %1, i32 16

store i32* %1, i32** @stack_AddRoundKey
%30 = call i32 @AddRoundKey(i32 %29, i32 %28) nounwind
%31 = getelementptr inbounds i32* %1, i32 16
store i32* %1, i32** @stack_SubBytes
%32 = call i32 @SubBytes(i32 %31) nounwind
%33 = getelementptr inbounds i32* %1, i32 20
%34 = load i32* %33, align 4
%35 = getelementptr inbounds i32* %1, i32 23
%36 = load i32* %35, align 4
%37 = getelementptr inbounds i32* %1, i32 26
%38 = load i32* %37, align 4
%39 = getelementptr inbounds i32* %1, i32 27
%40 = load i32* %39, align 4
%41 = getelementptr inbounds i32* %1, i32 21
%42 = load i32* %41, align 4
%43 = getelementptr inbounds i32* %1, i32 22
%44 = load i32* %43, align 4
%45 = getelementptr inbounds i32* %1, i32 31
%46 = load i32* %45, align 4
%47 = getelementptr inbounds i32* %1, i32 30
%48 = load i32* %47, align 4
%49 = getelementptr inbounds i32* %1, i32 29
%50 = load i32* %49, align 4

%51 = getelementptr inbounds i32* %1, i32 24
%52 = load i32* %51, align 4

%53 = getelementptr inbounds i32* %1, i32 25
%54 = load i32* %53, align 4

%55 = getelementptr inbounds i32* %1, i32 28
%56 = load i32* %55, align 4
%57 = getelementptr inbounds i32* %1, i32 16
%58 = getelementptr inbounds i32* %57, i32 0









store i32* %1, i32** @stack_MixColumns
%59 = call i32 @MixColumns(i32 %58, i32 %48, i32 %50, i32 %46) nounwind
%60 = getelementptr inbounds i32* %57, i32 0
%61 = getelementptr inbounds i32* %27, i32 16
store i32* %1, i32** @stack_AddRoundKey
%62 = call i32 @AddRoundKey(i32 %60, i32 %61) nounwind
%63 = getelementptr inbounds i32* %57, i32 0
store i32* %1, i32** @stack_SubBytes
%64 = call i32 @SubBytes(i32 %63) nounwind
%65 = getelementptr inbounds i32* %1, i32 20
%66 = load i32* %65, align 4
%67 = getelementptr inbounds i32* %1, i32 23
%68 = load i32* %67, align 4
%69 = getelementptr inbounds i32* %1, i32 26
%70 = load i32* %69, align 4
%71 = getelementptr inbounds i32* %1, i32 27
%72 = load i32* %71, align 4
%73 = getelementptr inbounds i32* %1, i32 21
%74 = load i32* %73, align 4
%75 = getelementptr inbounds i32* %1, i32 22
%76 = load i32* %75, align 4
%77 = getelementptr inbounds i32* %1, i32 31
%78 = load i32* %77, align 4
%79 = getelementptr inbounds i32* %1, i32 30
%80 = load i32* %79, align 4
%81 = getelementptr inbounds i32* %1, i32 29
%82 = load i32* %81, align 4

%83 = getelementptr inbounds i32* %1, i32 24
%84 = load i32* %83, align 4

%85 = getelementptr inbounds i32* %1, i32 25
%86 = load i32* %85, align 4

%87 = getelementptr inbounds i32* %1, i32 28
%88 = load i32* %87, align 4
%89 = getelementptr inbounds i32* %57, i32 0









store i32* %1, i32** @stack_MixColumns
%90 = call i32 @MixColumns(i32 %89, i32 %80, i32 %82, i32 %78) nounwind
%91 = getelementptr inbounds i32* %57, i32 0
%92 = getelementptr inbounds i32* %27, i32 32
store i32* %1, i32** @stack_AddRoundKey
%93 = call i32 @AddRoundKey(i32 %91, i32 %92) nounwind
%94 = getelementptr inbounds i32* %57, i32 0
store i32* %1, i32** @stack_SubBytes
%95 = call i32 @SubBytes(i32 %94) nounwind
%96 = getelementptr inbounds i32* %1, i32 20
%97 = load i32* %96, align 4
%98 = getelementptr inbounds i32* %1, i32 23
%99 = load i32* %98, align 4
%100 = getelementptr inbounds i32* %1, i32 26
%101 = load i32* %100, align 4
%102 = getelementptr inbounds i32* %1, i32 27
%103 = load i32* %102, align 4
%104 = getelementptr inbounds i32* %1, i32 21
%105 = load i32* %104, align 4
%106 = getelementptr inbounds i32* %1, i32 22
%107 = load i32* %106, align 4
%108 = getelementptr inbounds i32* %1, i32 31
%109 = load i32* %108, align 4
%110 = getelementptr inbounds i32* %1, i32 30
%111 = load i32* %110, align 4
%112 = getelementptr inbounds i32* %1, i32 29
%113 = load i32* %112, align 4

%114 = getelementptr inbounds i32* %1, i32 24
%115 = load i32* %114, align 4

%116 = getelementptr inbounds i32* %1, i32 25
%117 = load i32* %116, align 4

%118 = getelementptr inbounds i32* %1, i32 28
%119 = load i32* %118, align 4
%120 = getelementptr inbounds i32* %57, i32 0









store i32* %1, i32** @stack_MixColumns
%121 = call i32 @MixColumns(i32 %120, i32 %111, i32 %113, i32 %109) nounwind
%122 = getelementptr inbounds i32* %57, i32 0
%123 = getelementptr inbounds i32* %27, i32 48
store i32* %1, i32** @stack_AddRoundKey
%124 = call i32 @AddRoundKey(i32 %122, i32 %123) nounwind
%125 = getelementptr inbounds i32* %57, i32 0
store i32* %1, i32** @stack_SubBytes
%126 = call i32 @SubBytes(i32 %125) nounwind
%127 = getelementptr inbounds i32* %1, i32 20
%128 = load i32* %127, align 4
%129 = getelementptr inbounds i32* %1, i32 23
%130 = load i32* %129, align 4
%131 = getelementptr inbounds i32* %1, i32 26
%132 = load i32* %131, align 4
%133 = getelementptr inbounds i32* %1, i32 27
%134 = load i32* %133, align 4
%135 = getelementptr inbounds i32* %1, i32 21
%136 = load i32* %135, align 4
%137 = getelementptr inbounds i32* %1, i32 22
%138 = load i32* %137, align 4
%139 = getelementptr inbounds i32* %1, i32 31
%140 = load i32* %139, align 4
%141 = getelementptr inbounds i32* %1, i32 30
%142 = load i32* %141, align 4
%143 = getelementptr inbounds i32* %1, i32 29
%144 = load i32* %143, align 4

%145 = getelementptr inbounds i32* %1, i32 24
%146 = load i32* %145, align 4

%147 = getelementptr inbounds i32* %1, i32 25
%148 = load i32* %147, align 4

%149 = getelementptr inbounds i32* %1, i32 28
%150 = load i32* %149, align 4
%151 = getelementptr inbounds i32* %57, i32 0









store i32* %1, i32** @stack_MixColumns
%152 = call i32 @MixColumns(i32 %151, i32 %142, i32 %144, i32 %140) nounwind
%153 = getelementptr inbounds i32* %57, i32 0
%154 = getelementptr inbounds i32* %27, i32 64
store i32* %1, i32** @stack_AddRoundKey
%155 = call i32 @AddRoundKey(i32 %153, i32 %154) nounwind
%156 = getelementptr inbounds i32* %57, i32 0
store i32* %1, i32** @stack_SubBytes
%157 = call i32 @SubBytes(i32 %156) nounwind
%158 = getelementptr inbounds i32* %1, i32 20
%159 = load i32* %158, align 4
%160 = getelementptr inbounds i32* %1, i32 23
%161 = load i32* %160, align 4
%162 = getelementptr inbounds i32* %1, i32 26
%163 = load i32* %162, align 4
%164 = getelementptr inbounds i32* %1, i32 27
%165 = load i32* %164, align 4
%166 = getelementptr inbounds i32* %1, i32 21
%167 = load i32* %166, align 4
%168 = getelementptr inbounds i32* %1, i32 22
%169 = load i32* %168, align 4
%170 = getelementptr inbounds i32* %1, i32 31
%171 = load i32* %170, align 4
%172 = getelementptr inbounds i32* %1, i32 30
%173 = load i32* %172, align 4
%174 = getelementptr inbounds i32* %1, i32 29
%175 = load i32* %174, align 4

%176 = getelementptr inbounds i32* %1, i32 24
%177 = load i32* %176, align 4

%178 = getelementptr inbounds i32* %1, i32 25
%179 = load i32* %178, align 4

%180 = getelementptr inbounds i32* %1, i32 28
%181 = load i32* %180, align 4
%182 = getelementptr inbounds i32* %57, i32 0









store i32* %1, i32** @stack_MixColumns
%183 = call i32 @MixColumns(i32 %182, i32 %173, i32 %175, i32 %171) nounwind
%184 = getelementptr inbounds i32* %57, i32 0
%185 = getelementptr inbounds i32* %27, i32 80
store i32* %1, i32** @stack_AddRoundKey
%186 = call i32 @AddRoundKey(i32 %184, i32 %185) nounwind
%187 = getelementptr inbounds i32* %57, i32 0
store i32* %1, i32** @stack_SubBytes
%188 = call i32 @SubBytes(i32 %187) nounwind
%189 = getelementptr inbounds i32* %1, i32 20
%190 = load i32* %189, align 4
%191 = getelementptr inbounds i32* %1, i32 23
%192 = load i32* %191, align 4
%193 = getelementptr inbounds i32* %1, i32 26
%194 = load i32* %193, align 4
%195 = getelementptr inbounds i32* %1, i32 27
%196 = load i32* %195, align 4
%197 = getelementptr inbounds i32* %1, i32 21
%198 = load i32* %197, align 4
%199 = getelementptr inbounds i32* %1, i32 22
%200 = load i32* %199, align 4
%201 = getelementptr inbounds i32* %1, i32 31
%202 = load i32* %201, align 4
%203 = getelementptr inbounds i32* %1, i32 30
%204 = load i32* %203, align 4
%205 = getelementptr inbounds i32* %1, i32 29
%206 = load i32* %205, align 4

%207 = getelementptr inbounds i32* %1, i32 24
%208 = load i32* %207, align 4

%209 = getelementptr inbounds i32* %1, i32 25
%210 = load i32* %209, align 4

%211 = getelementptr inbounds 
