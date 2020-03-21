clc
clear

max = input('enter an integer greater than 1: ');

ranNum = randi([1,max])

guessNum = input('guess the random number between 1 and max: ');

if guessNum==ranNum
    fprintf('your guess was correct\n');
else
    fprintf('your guess was incorrect\n');
end
