clc
clear

num = input('enter number between 0 and 9: ');
switch num
    case 0
        fprintf('category is zero');
    case 2
        fprintf('category is prime number and even number');
    case {3, 5, 7}
        fprintf('category is prime number');
    case {4, 6, 8}
        fprintf('category is even number');
    case {1, 9}
        fprintf('category is perfect square');
    otherwise
        fprintf('error');
end


