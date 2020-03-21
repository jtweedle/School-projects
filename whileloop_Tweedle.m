clc
clear

total=0;
count=0;
grade=input('enter a test grade(enter -1 to exit): ');
while grade ~= -1
    total = total + grade;
    count = count + 1;
    grade=input('enter a test grade(enter -1 to exit): ');
end

average = total/count;
fprintf('the average of %d grades is %.2f\n', count, average);

    