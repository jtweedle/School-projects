% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
%Program 5(hw)
%Due Date: 11/08/2017
%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than from the instructor
%this program uses a function to compute the average of an array of
%grades

clc
clear

%input the array of grades
g = input('enter a grade(enter -1 to exit): ');
array = [];
while g ~= -1
    array = [array g];
    g = input('enter a grade(enter -1 to exit): ');
end

%display the average 
a = classAverage_Tweedle(array);
if a < 0 || a > 100
    disp('invalid');
elseif a >=0 && a < 60
    disp('the average is: F');
elseif a >= 60 && a < 70
        disp('the average is: D');
elseif a >=70 && a < 80
    disp('the average is: C');
elseif a >= 80 && a < 90
    disp('the average is: B');
elseif a >= 90 && a < 100
    disp('the average is: A');
end

    
    
