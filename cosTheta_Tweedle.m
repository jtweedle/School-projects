% Course: CSCI 251, Section 4
%Student Name:James Tweedle
%Student ID:10668036
%Lab 6 hw
%Due Date: 11/15/17
%In keeping with the honor code of UM, I have neither given nor recieved
%any assistance other than from the instructor

%this program will plot 6 functions of cosine in the same plot

clc
clear
clf

%for loop that plots the graph
th = linspace(-2*pi,2*pi);
for i =1:6
    subplot(3,2,i);
    plot(th,cos(i*th));
    title(sprintf('plot of cos(%d*th)',i));
    xlabel('theta');
    ylabel(sprintf('cos(%d*th)',i));
end