%%Glucose control in healthy adult
syms s
C = [1 0];
A = [-2.92 -4.34; 0.208 -0.78];
B= [70; 0];
D=0;
[num,den]=ss2tf(A,B,C,D,1);
X1=tf(num,den);
 %70 s + 204.4
 % ------------------
  %s^2 + 3.7 s + 3.18
 %{
 subplot(3,2,1);
 stepplot(X1,10);
 title('Glucose:Healthy');
 %}
subplot(3,2,1); 
rlocus(X1);
title('Glucose:Healthy');
 
%%peak=20.4
%%settling=3.25
%%ss=17.2

%%Insulin control in healthy adult
C = [0 1];
A = [-2.92 -4.34; 0.208 -0.78];
B= [0; 70];
D=0;
[num,den]=ss2tf(A,B,C,D,1);
X2=tf(num,den);
% 70 s + 204.4
 % ------------------
  %s^2 + 3.7 s + 3.18
%{
subplot(3,2,2);
stepplot(X2,10);
title('Insulin:Healthy');
%}
subplot(3,2,2);
rlocus(X2);
title('Insulin:Healthy');
%%peak=64.3
%%settling=3.05
%%ss=64.3

%Modeling Type 1
%%Glucose response

C = [1 0];
A = [-2.92 -4.34; 0.0416 -0.78];
B= [70; 0];
D=0;
[num,den]=ss2tf(A,B,C,D,1);
X3=tf(num,den);

  %    70 s + 54.6
  %-------------------
  %s^2 + 3.7 s + 2.458
 %{
  subplot(3,2,3);
 stepplot(X3,10);
 title('Glucose:Type 1');
 %}
subplot(3,2,3);
 rlocus(X3);
 title('Glucose:Type 1');
 %%settling time=2.33
 
%Insulin response 
C = [0 1];
A = [-2.92 -4.34; 0.0416 -0.78];
B= [0; 70];
D=0;
[num,den]=ss2tf(A,B,C,D,1);
X4=tf(num,den);

%{    
    70 s + 204.4
  -------------------
  s^2 + 3.7 s + 2.458
%}
%{
subplot(3,2,4);
stepplot(X4,10);
title('Insulin:Type 1');
%}
%peak response=83.1
%settling time=4.52
%steady state=83.1
subplot(3,2,4);
rlocus(X4);
title('Insulin:Type 1');

% Modeling Type 2 
 %Glucose response
C = [1 0];
A = [-2.92 -0.868; 0.208 -0.78];
B= [70; 0];
D=0;
[num,den]=ss2tf(A,B,C,D,1);
X5=tf(num,den);
%{ 
 70 s + 54.6
  -------------------
  s^2 + 3.7 s + 2.458
%} 
%{
subplot(3,2,5);
stepplot(X5,10);
title('Glucose:Type 2');
%}
subplot(3,2,5);
rlocus(X5);
title('Glucose:Type 2');

%%Insulin response
C = [0 1];
A = [-2.92 -0.868; 0.208 -0.78];
B= [0;70];
D=0;
[num,den]=ss2tf(A,B,C,D,1);
X6=tf(num,den);
%{

     70 s + 204.4
  -------------------
  s^2 + 3.7 s + 2.458
%}
%{
subplot(3,2,6);
stepplot(X6,10);
title('Insulin:Type 2');
%}

subplot(3,2,6);
rlocus(X6);
title('Insulin:Type 2');
