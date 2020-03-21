% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
%LAB 6(in class)
%Due Date: 11/10/2017
%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than the instructor
%Program Description:this program will determine the lines of code in a
%matlab file

clc
clear

%prompt user for the file 
file = input('enter file name: ','s');
fid = fopen(file);

%read the lines in the file
count = 0;
while ~feof(fid) 
    line = fgets(fid);
    if (~isempty(line)) && (line(1) ~= '%')
        count = count + 1;
    end
end
%display the lines of code
fprintf('the number of lines in %s are %d\n', file,count);
%close the file
fclose(fid);

    