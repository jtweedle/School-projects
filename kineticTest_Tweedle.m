clc 
clear
m= input('enter the mass of the object: ');
v= input('enter the velocity of the object: ');
e = kinetic_Tweedle(m,v);
fprintf('the kinetic energy is %.2f\n',e);
