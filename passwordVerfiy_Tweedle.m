% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
%Lab 2(In class)
%Due Date: 09/22/17

%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than the instructor

%Program Description: this program will determine whether two words are
%equilvalent

clc
clear
 
%propmt user
pW1 = input('enter password 1: ','s');
pW2 = input('reenter password 1: ','s');

%result
x = strcmp(pW1, pW2);

%display output
fprintf('1:accepted 0:failed\n %s = %s is %d\n', pW1, pW2, x);
fprintf(' The ASCII equilvalent is %d\n', uint8(pW1));


