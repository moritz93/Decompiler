@stack_max = common global i8* null
@stack = common global [41 x i8] zeroinitializer, align 32
@zero = common global i32 0
@low = common global i32 0
@high = common global i32 0

define void @max(i32 %a, i32 %b) nounwind {
entry:
%retval = alloca i32
%a_addr = alloca i32, align 4
store i32 %a, i32* %a_addr
%0 = load i32* %a_addr, align 4
%b_addr = alloca i32, align 4
store i32 %b, i32* %b_addr
%1 = load i32* %b_addr, align 4
%2 = load i8** @stack_max, align 4

%3 = getelementptr inbounds i32* %2, i32 -8
%4 = load i32* @zero, align 4
%5 = getelementptr inbounds i8* %3, i32 0
%6 = bitcast i8* %5 to i32*
store i32 %4, i32* %6
%7 = getelementptr inbounds i32* %3, i32 0
%8 = getelementptr inbounds i8* %7, i32 8
%9 = bitcast i8* %8 to i32*
store i32 %0, i32* %9
%10 = getelementptr inbounds i8* %7, i32 12
%11 = bitcast i8* %10 to i32*
store i32 %1, i32* %11
%12 = getelementptr inbounds i8* %7, i32 8
%13 = bitcast i8* %12 to i32*
%14 = load i32* %13, align 4
%15 = getelementptr inbounds i8* %7, i32 12
%16 = bitcast i8* %15 to i32*
%17 = load i32* %16, align 4
%18 = icmp slt i32 %17, %14
%cmp = icmp eq i1 %18, false
br i1 %cmp, label %label-1, label %label-2

label-2:
%19 = getelementptr inbounds i8* %7, i32 8
%20 = bitcast i8* %19 to i32*
%21 = load i32* %20, align 4
br label %label-3

label-1:
%22 = getelementptr inbounds i8* %7, i32 12
%23 = bitcast i8* %22 to i32*
%24 = load i32* %23, align 4
br label %label-3

label-3:
%25 = phi i32 [ %24 , %label-1 ], [ %21 , %label-2 ]
%26 = getelementptr inbounds i32* %7, i32 %25
%27 = getelementptr inbounds i8* %26, i32 0
%28 = bitcast i8* %27 to i32*
%29 = load i32* %28, align 4
%30 = getelementptr inbounds i32* %26, i32 8
br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

define void @main() nounwind {
entry:
%retval = alloca i32
%0 = getelementptr inbounds [41 x i8]* @stack, i32 0, i32 40

%1 = getelementptr inbounds i32* %0, i32 -32
%2 = load i32* @zero, align 4
%3 = getelementptr inbounds i8* %1, i32 28
%4 = bitcast i8* %3 to i32*
store i32 %2, i32* %4
%5 = load i32* @zero, align 4
%6 = getelementptr inbounds i8* %1, i32 24
%7 = bitcast i8* %6 to i32*
store i32 %5, i32* %7
%8 = getelementptr inbounds i32* %1, i32 0

%9 = add nsw i32 0, 5
%10 = add nsw i32 0, 6
store i32* %1, i8** @stack_max
%11 = call i32 @max(i32 %9, i32 %10) nounwind
%12 = getelementptr inbounds i32* %8, i32 0
%13 = getelementptr inbounds i8* %12, i32 28
%14 = bitcast i8* %13 to i32*
%15 = load i32* %14, align 4
%16 = getelementptr inbounds i8* %12, i32 24
%17 = bitcast i8* %16 to i32*
%18 = load i32* %17, align 4
%19 = getelementptr inbounds i32* %12, i32 32
br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

