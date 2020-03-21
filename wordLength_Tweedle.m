clc
clear

w1 = input('Enter first word: ', 's');
w2 = input('Enter second word: ', 's');

if length(w1) == length(w2)
    fprintf('%s and %s are of the same length\n', w1, w2);
else
    if length(w1) < length(w2)
        fprintf('%s is shorter than %s in length\n', w1,w2)
    else
        fprintf('%s is longer than %s in length\n',w1,w2)
    end
end