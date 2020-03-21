clc 
clear

sales = input('enter annual sales: ');
years = input('enter years of service: ');

if sales >= 10000 && years>= 5
    fprintf('your employment level is 2\n');
else 
    fprintf('YOur employment level is 1\n');
end
