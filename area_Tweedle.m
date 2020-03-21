% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
%this program will calculate the area of a triangle with 3 given sides
%using Heron's formula

clc
clear

%prompt the user for input
sideX = input('enter the value of side x in feet: ');
sideY = input('enter the value of side y in feet: ');
sideZ = input('enter the value of side z in feet: ');

%calculate area in square feet and square meters
S = (0.5) * (sideX + sideY + sideZ);
areaFt = (S * (S - sideX) * (S - sideY) * (S - sideZ))^.5;
Feet_TO_Inch = 12;
Inch_TO_Cm = 2.54;
Cm_TO_Meter = 0.01;
xMeter = sideX * Feet_TO_Inch * Inch_TO_Cm * Cm_TO_Meter;
yMeter = sideY * Feet_TO_Inch * Inch_TO_Cm * Cm_TO_Meter;
zMeter = sideZ * Feet_TO_Inch * Inch_TO_Cm * Cm_TO_Meter;
sMeter = (0.5) * (xMeter + yMeter + zMeter);
areaMeter = (sMeter * (sMeter - xMeter) * (sMeter - yMeter) * (sMeter - zMeter)) ^.5;


%display output
fprintf('the area is %.2f square feet or %.2f square meters\n', areaFt, areaMeter);
