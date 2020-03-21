% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
%Lab 1(in class)
%Due Date: 09/08/17
%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than from the instructor

%Program description:this program will calculate a person's BMI from height
%and weight

clc 
clear

%prompt the user for the input
heightFt = input('enter height in feet:');
heightIn = input('enter  additional height in inches:');
weight = input('enter weight in pounds:');

%calculate total height in inches and bmi
heighttotal = heightFt * 12 + heightIn;
bmi = (703 * weight)/heighttotal^2;

%display output
fprintf('the height is %d feet %d inches, the weight is %d pounds, bmi is %.2f\n', heightFt, heightIn, weight, bmi);