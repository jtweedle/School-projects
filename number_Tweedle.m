clc
clear

number = input('enter a number: ');

if number > 0
    fprintf('%d is positive\n', number);
elseif number < 0
    frprintf('%d is negative and its absolute vale is %d\n', number, -number);
else
    