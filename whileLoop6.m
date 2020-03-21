clc
clear
num = input('enter a number: ');
while num ~= -1
    if mod(num,2) = 0
        fprintf('%d is even\n',num);
    else 
        fprintf('%d is odd\n',num);
    end
    num = input('enter a number: ');
end
