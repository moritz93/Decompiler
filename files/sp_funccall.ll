@stack = common global [9 x i8] zeroinitializer, align 32
@base = common global i32 0
@ret = common global i32 0

define i32 @main() nounwind {
entry:
%retval = alloca i32
%0 = getelementptr inbounds [9 x i8]* @stack, i32 0, i32 8

%1 = getelementptr inbounds i8* %0, i32 -8
%2 = getelementptr inbounds i8* %1, i32 0
%3 = bitcast i8* %2 to i32*
%4 = load i32* @base, align 4
store i32 %4, i32* %3
%5 = getelementptr inbounds i8* %1, i32 %0
%cmp = icmp eq i1 %5, false
br i1 %cmp, label %label-1, label %label-2

label-2:
%6 = getelementptr inbounds i8* %1, i32 %0
%cmp = icmp eq i1 %6, false
br i1 %cmp, label %label-3, label %label-4

label-4:
%7 = getelementptr inbounds i8* %1, i32 %0
br label %label-1

label-3:
%8 = getelementptr inbounds i8* %1, i32 %0
br label %label-1

label-1:
%9 = phi i32 [ %5 , %label-0 ], [ %8 , %label-3 ], [ %7 , %label-4 ]
%10 = getelementptr inbounds i8* %9, i32 %null
br label %return

return:
%retvall = load i32* %retval
ret i32 %retvall
}

