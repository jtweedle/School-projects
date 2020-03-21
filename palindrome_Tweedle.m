clc
clear

word = input('enter a word: ', 's');

backward = '';
for i = length(word):-1:1
    backward = strcat(backward, word(i));
    
end

if strcmpi(word, backward)
    fprintf('the word %s is a palindrome\n', word);
else
    fprintf('the word %s is not a palindrome\n',word);
end

