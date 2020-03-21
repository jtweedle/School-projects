clc
clear
 
%user input
 bill = input('enter amount of bill: $');
 rate = input('enter gratuity rate (e.g. enter .15 for 15%): ');
 
 %calculate
 gratuity = bill * rate;
 total = bill + gratuity;
 
 %display output
 fprintf('$%.2f + $%.2f = $%.2f\n', bill, gratuity, total);