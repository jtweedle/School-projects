% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
%Program 2(hw)
%Due Date: 09/27/17
%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than from the instructor
%this program will  minimize coins by converting total pennies to
%quarters, dimes, nickels, and pennnies.

clc
clear

%prompt user
nPennies = input('enter total pennies: ');
Pennies_Nickels = 5;
Pennies_Dimes = 10;
Pennies_Quarters = 25;

%calculate for quarters, dimes, nickels, and pennies
nQuarters = (nPennies/(Pennies_Quarters));
rQuarters = mod(nPennies,Pennies_Quarters);
fQuarters = floor(nQuarters);
nDimes = rQuarters/Pennies_Dimes;
rDimes = mod(rQuarters,Pennies_Dimes);
fDimes = floor(nDimes);
nNickels = rDimes/Pennies_Nickels;
rNickels = mod(rDimes,Pennies_Nickels);
fNickels = floor(nNickels);
fPennies = floor(rNickels);

%display result
fprintf('Quarters: %d\nDimes: %d\nNickels: %d\nPennies: %d\n' , fQuarters,fDimes,fNickels,fPennies);

