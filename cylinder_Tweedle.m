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

%prompt for user
cylinderHeight = input('Enter the cylinderHeight: ');
cylinderRadius = input('Enter the cylinderRadius: ');

%calculate the area and volume of the cyllinder
cylinderArea = pi * cylinderRadius^2;
cylinderVolume =  (cylinderArea * cylinderHeight);

%display output
fprintf('The base area of the cylinder is: %.2f and the volume of the cylinder is %.2f\n', cylinderArea, cylinderVolume);
