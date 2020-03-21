clc
clear

sentence = input('enter a sentence: ','s');
sentence = lower(sentence);
vowels=0;

for i = 1:length(sentence)
    if  sentence(i)=='a' || sentence(i)=='e' || sentence(i)=='i' ||sentence(i)=='o' ||sentence(i)=='u'
        vowels = vowels + 1;
    end
end
fprintf('There are %d vowels in the sentence\n', vowels);
    