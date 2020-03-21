clc
clear

maxNum = input('enter the max integer: ');
product = 1;

for i = 1:maxNum
    if mod(i,2)==1
        product = product *i;
    end
end
fprintf('The product of odd numbers between 1 and %d is %d\n', maxNum, product);

for i = 1:2:maxNum
    product = product *i;
end
