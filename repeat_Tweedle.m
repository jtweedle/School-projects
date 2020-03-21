clc
clear
 
digit1 = input('enter first digit: ');
digit2 = input('emter second digit: ');
digit3 = input('enter third digit: ');
digit4 = input('enter fourth digit: ');
nthDigit = input('enter n to find out the digit: ');

switch mod(nthDigit,4)
    case 1
        fprintf('the %dth  digit is %d\n', nthDigit,digit1);
    case 2
        fprintf('the %dth digit is %d\n', nthDigit,digit2);
    case 3
        fprintf('the %dth digit is %d\n', nthDigit,digit3);
    case 0
        fprintf('the %dth digit is %d\n', nthDigit,digit4);
end