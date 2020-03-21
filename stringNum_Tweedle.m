clc
clear

num = input('enter a number: ','s');


sum = 0;
for i = 1:length(num)
    fprintf('%s ',num(i));
    sum = sum + str2num(num(i));
end
fprintf('\nthe sum of all digits is %d\n',sum);