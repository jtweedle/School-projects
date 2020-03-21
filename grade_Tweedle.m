clc 
clear

 score = input('enter a grade between 0 and 100: ');
 
 if score >= 0 && < 60
      fprintf('Fail\n');
      
  elseif score >= 60 && <= 100
      fprintf('Pass\n');
      
  else 
      fprintf('Invalid score entered\n');