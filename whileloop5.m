clc
clear
total = 0;
count=1;
while count <= 10
    grades = input('enter a grade: ');
    total = total + grades;
    count = count + 1;
end
fprintf('the total is %d and the average is %.2f\n', total, (total/count));

    