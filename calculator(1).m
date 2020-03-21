% This program uses the switch statement to do basic operations on two
% numbers.
clc
clear
% Input two numbers and the operator
num1 = input('Enter first number: ');
num2 = input('Enter second number: ');
operator = input('Enter operator:\nA: addition\nS: subtraction\nM: multiplication\nD: division\n', 's');
% Switch statement on operator
switch operator
  	 case {'A', 'a'}
       		 fprintf('The result of num1 + num2 is %d\n', (num1 + num2));
 	 case {'S', 's'}
       		 fprintf('The result of num1 - num2 is %d\n', (num1 - num2));
   	 case {'M', 'm'}
     		 fprintf('The result of num1 * num2 is %d\n', (num1 .* num2));
  	 case {'D', 'd'}
   		  if num2 ~= 0
       			 fprintf('The result of num1 / num2 is %d\n', (num1 ./ num2));
  		  else
          			  disp('Divide by zero error!');
       	  end
  	  otherwise
       		 fprintf('%s is an invalid operator', operator);
end
