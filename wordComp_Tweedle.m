clc
clear

word1 = input('enter first word: ', 's');
word2 = input('enter second word: ', 's');
if length(word1) ~= length(word2)
    fprintf('the difference of their lengths is %d\n', abs(length(word1)-length(word2)));
else
    
    mismatch =0;
    for i = 1:length(word1)
        if word1(i) ~= word2(i)
            mismatch = mismatch + 1;
        
        end
    end
    fprintf('There are %d mismatches in %s and %s\n', mismatch,word1,word2);
end

