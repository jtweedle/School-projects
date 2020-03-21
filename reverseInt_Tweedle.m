clc
clear

num = input('enter an integer: ', 's');
backward = '';


for i= length(num):-1:1
    backward = strcat(backward,num(i));
end

fprintf('the backward of the number with reversed digits is %s\n', backward);
