% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Studetn ID:10668036
%LAB 5
%Due Date: 11/03/17
%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than the instructor
%Program Description:this program will use a function to calculate the
%length of the third side of  a triangle and the area given the first two
%sides and the angle between them

clc
clear

%prompt user for the inputs
s1 = input('enter the first side of triangle: ');
s2 = input('enter the second side of triangle: ');
ang = input('enter the angle between the two sides in degrees: ');

%call the function
[s3,area] = triangle_Tweedle(s1,s2,ang);

%display the outputs
fprintf('the length of the third side is %.2f and the area is %.2f\n',s3,area);

