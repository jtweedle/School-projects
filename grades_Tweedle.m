clc
clear

score = input('enter a test score: ');
if score < 0 || score > 100
    fprintf('score is invalid\n');
elseif score >= 0 && score < 60
        fprintf('score is an f and student failed\n');
elseif score >= 60 && score < 70
    fprintf('The score is a D and student passed\n');
elseif score >= 70 && score < 80
    fprintf('the score is a C and student passed\n');
elseif score >= 80 && score < 90
    fprintf('the score is a B and student passed\n');
elseif score >= 90 &&  score < 100
    fprintf('the score is an A and student passed\n');
end

    