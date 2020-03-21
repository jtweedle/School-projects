% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Studetn ID:10668036
%LAB 0
%Due Date: 01/01/17

%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than the instructor

%Program Description: Given 2 sides of a triangle and the angle between
%them this program will calculate length for 3rd side and area
%





clc
clear

%prompt the user for the input
firstside  = input('Enter length for firstside: ');
secondside = input('Enter length for secondside: ');
angledegree = input('Enter the angle between them: ');



%calculate length of third side, radian of angle, and area of triangle
angle = angledegree*(pi/180)
thirdside =  sqrt(firstside ^ 2 + secondside ^2 - 2 * firstside * secondside *cos(angledegree));
area = .5 * firstside * secondside *sin(angle radian);

%display output
fprintf('the length of 3rd side is: %.2f and the area is: %.3f\n', thirdside, area);