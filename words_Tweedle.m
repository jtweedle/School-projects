function equal = words_Tweedle(word1,word2)
    equal = true;
    if length(word1) ~= length(word2)
        equal = false;
    else
        for i = 1:length(word1)
            if word1(i) ~= word2(i)
                equal = false;
            end
        end
    end
end

