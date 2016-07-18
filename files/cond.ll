@stack = common global [21 x i8] zeroinitializer, align 32
@zero = common global i32 0
@low = common global i32 0
@high = common global i32 0

define void@main() nounwind {
entry:
%retval = alloca i32
%0 = getelementptr inbounds [21 x i8]* @stack, i32 0, i32 20

%1 = load i32* @zero, align 4
%2 = getelementptr inbounds i8* %0, i32 28
%3 = bitcast i8* %2 to i32*
store i32 %1, i32* %3

%4 = add nsw i32 0, 20
%5 = getelementptr inbounds i8* %null, i32 16
%5 = bitcast i8* %4 to i32*
%6 = load i32* %5, align 4
%7 = getelementptr inbounds i8* %null, i32 20
%7 = bitcast i8* %6 to i32*
%8 = load i32* %7, align 4
br label %label--1
%9 = add nsw i32 0, 0
%10 = getelementptr inbounds i8* %0, i32 28
%11 = bitcast i8* %10 to i32*
%12 = load i32* %11, align 4
br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

