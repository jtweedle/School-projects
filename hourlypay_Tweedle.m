clc
clear

%prompt for inputs
payRate = input('Enter pay rate: ');
hours = input('Enter hours worked: ');


if hours >= 0 && hours <= 40
    pay = payRate * hours;
elseif hours > 40 && hours <= 60
    pay = (40*payRate) + (hours -40)*(1.5*payRate);
else 
    pay = 0;
end

fprintf('The total check is: $%.2f\n', pay);

