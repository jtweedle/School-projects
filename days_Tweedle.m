% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
%Program 3(hw)
%Due date:10/11/17
%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than from the instructor

clc
clear

%prompt user to enter the month as a number
month = input('enter the month: ');
January = 1;
February=2;
March=3;
April=4;
May=5;
June=6;
July=7;
August=8;
September=9;
October=10;
Novemember=11;
December=12;

%Output
switch month
    case {1,3,5,7,8,10,12}
        fprintf('Days in that month:31\n');
    case {4,6,9,11}
        fprintf('Days in that month:30\n');
    case 2
        year = input('enter the year: ');
        if mod(year,4) == 0
            fprintf('%d is a leap year, days in February : 29\n' ,year);
        else
            fprintf('%d is not a leap year, days in February:28\n' ,year);
        end
    otherwise 
        fprintf('invalid month entered!\n');
end


