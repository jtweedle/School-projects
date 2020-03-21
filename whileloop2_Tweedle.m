clc 
clear
grades=[90 85 67 38 100 74 54 46];
min = grades(1);
count = 2;
while count <= length(grades)
    if grades(count) < min
    min = grades(count);
    end
    
   count=count +1;
end 
fprintf('the minimum in the array is: %d\n', min);
