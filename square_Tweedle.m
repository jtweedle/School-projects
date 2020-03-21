clc
clear

minNum = input('enter the minimum integer: ');
maxNum = input('enter the maxium integer: ');
for i = minNum:1:maxNum
    fprintf('%d\t%d\n', i, i^2);
end
    