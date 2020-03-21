clc 
clear

fruit = input('enter type of fruit:', 's');
weight = input('enter the weight of produce: ');


switch fruit
    case 'orange'
        price = .59 * weight;
    case 'apple'
        price = .48 * weight;
    case 'cherry'
        price = 4.19 * weight;
    case {'mango', 'papaya'}
        price = 3.79 * weight;
end
fprintf('the price is $%.2f\n', price);


   