clc
clear

%prompt user for input
a = input('enter value for a');
b = input('enter value for b');
c = input('enter value for c');
d = input('enter value for d');
e = input('enter value for e');
f = input('enter value for f');

%calculate x and y
x = (e*d-b*f)/(a*d-b*c)
y = (a*f-e*c)/(a*d-b*c)

%display output
fprintf('%.1fx + %.1fy = %.1f\n%.1fx + %.1fy = %.1f\n x = %.1f\n y =%.1f\n', a, b, e, c, d, f, x, y);