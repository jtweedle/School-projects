clc
clear
 
%to find average sum/length(array)

num = input('enter a positive interger(enter-1 to exit): ');
array = [];
while num ~= -1
    array = [array num];
    num = input('enter a positive interger(enter-1 to exit): ');
end
sum = array_Tweedle(array);
fprintf('the sum of the numbers in the array is %d\n', sum);

    