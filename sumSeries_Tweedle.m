clc
clear

sum=0;
for i = 1:25
    sum = sum + (i/(25-i+1));
end
fprintf('the sum is %.2f\n', sum);