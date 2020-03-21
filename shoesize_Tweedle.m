clc
clear

%prompt user for input
ftIn = input('enter foot size in inches: ');

%calculate 
INCH_TO_CM = 2.54;
footCm = ftIn * INCH_TO_CM;
euroSize = 3/2 * (footCm + 1.5);

%display output
fprintf('Your european show size is %d\n', round(euroSize));

