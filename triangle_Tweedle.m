% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Studetn ID:10668036
%LAB 5
%Due Date: 11/03/17
%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than the instructor
%Program Description:this program is a function to calculate the
%length of the third side of  a triangle and the area given the first two
%sides and the angle between them


function [side3,area]=triangle_Tweedle(side1,side2,angle)
    th = angle * pi/180;
    side3 = (side1^2 + side2^2 - 2 * side1 * side2 * cos(th))^(1/2);
    area = side1 * side2 * sin(th) / 2;
end
    
  

