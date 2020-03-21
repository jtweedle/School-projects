% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
%Lab 4 in class
%Due Date: 10/18/2017
%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than from the instructor

clc
clear
 
%prompt user to enter temperature in celsius
 temp = input('enter the  maximum temperature in celsius: ');
 
 %display output in for loop
 fprintf('Celsius\t Farenheit\t (For Loop)\n');
 for t = 0:5:temp
     fahrenheit = 9/5 * t + 32;
     fprintf('%d\t\t %d\n', t,fahrenheit);
 end
 
 fprintf('\n');
 
 %display output in while loop
 fprintf('Celsius\t Farenheit\t (While Loop)\n');
 t1=0;
 while t1 <= temp
      fahrenheit = 9/5 * t1 + 32;
      fprintf('%d\t\t %d\n', t1, fahrenheit);
      t1= t1+5;
 end
 
