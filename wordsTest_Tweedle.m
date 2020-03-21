clc
clear

w1 = input('enter the first word:','s');
w2 = input('enter the second word:','s');
e = words_Tweedle(w1,w2);
if e== 1
    fprintf('%s and %s are equal\n', w1,w2);
else 
    fprintf('%s and %s are not equal\n', w1,w2);
end
