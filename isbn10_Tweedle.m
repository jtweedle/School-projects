%Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
%Program 3 in class
%Due date-10/4/17
%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than from the instructor

clc
clear

%prompt user for input
d1 = input('Enter the first ISBN digit: ');
d2 = input('Enter the second ISBN digit: ');
d3 = input('Enter the third ISBN digit: ');
d4 = input('Enter the fourth ISBN digit: ');
d5 = input('Enter the fifth ISBN digit: ');
d6 = input('Enter the sixth ISBN digit: ');
d7 = input('Enter the seventh ISBN digit: ');
d8 = input('Enter the eight ISBN digit: ');
d9 = input('Enter the ninth ISBN digit: ');

%calculate output
d10 = (d1 * 1 + d2 * 2 + d3 * 3 + d4 * 4 + d5 * 5 + d6 * 6 + d7 * 7 + d8 * 8 + d9 * 9)
if d10 <= 9
    d10=d10;
else if d10 >=10
        d10=X;
        


