.clc
clear
num = input('guess a number between 1-20: ');
ranNum = randi([1,20]);
while num ~= ranNum
    if num < ranNum
        fprintf('your guess was too low\n');
    else
        fprintf('your guess was too high\n');
    end
    num = input('guess a number between 1-20: ');
      
end
fprintf('Your guess is correct\n');


    