% This program asks for an age input and then displays the age group.
clc
clear
% input age
age = input('Enter in an age: ');
% if/else statement to determine the age group
if age > 0 && age < 13
    fprintf('%d is a child\n', age);
elseif age >= 13 && age < 18        
    fprintf('%d is a youth\n', age);
elseif age >= 18 && age < 25        
    fprintf('%d is a young adult\n', age);
elseif age >= 25 && age < 60        
    fprintf('%d is an adult\n', age);
elseif age >=60 && age <=115
    fprintf('%d is a senior\n', age);
else
    fprintf('You''ve entered an invalid age!\n');
end
