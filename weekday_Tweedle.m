clc
clear 

weekDay = input('Enter the day of the week: ', 's');

if strcmpi(weekDay, 'saturday')|| strcmpi (weekDay, 'sunday')
    fprintf('%s is a weekend\n', weekDay);
else 
    fprintf('%s is a weekday\n', weekDay);
end

    