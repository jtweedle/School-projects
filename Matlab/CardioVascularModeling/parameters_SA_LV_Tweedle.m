
%This Model has been adapted from the MATLAB code presented in Hoppensteadt
%and Peskin "Modling and Simulation in Medicine and the Life Sciences

%Time parameters
T = 0.0125;                      %Duration of heartbeat: min
Ts = 0.0050;                     %Duration of systole: min
% Stroke_volume = 70e-3;           %Volume ejected by 1 heart beat: L
% Tmax = 0.0020;                   %Time at which flow is max: min
% Qmax= Stroke_volume/(0.5*Ts);    %Max flow through aortic valve: L/min
dt = .00005*T;                   %This choice implies 20,000 timesteps per 
                                 %cardiac cycle

%Compliance and resistance parameters. Note that valve resistances are not
%supposed to be realistic, just small enough to be negligible
Csa = .00175;                    %Systemic arterial compliance: L/mmHg
Rs = 17.86;                      %Systemic resistance: mmHg/(L/min)
Rmi = 0.01;                       %mitral valve resistance: mmHg/(L/min)
RAo = 0.01;                       %Aortic valve resistance: mmHg/(L/min)


Vlvd = .027;                     %Left ventricular volume when Plv=0: L
Vsad = .825;                     %Systemic arterial volume when Psa=0: L
Pla = 5;                         %Left atrial pressure: mmHg

%Parameters for Clv(t)
CLVD = .0146;                   %Max (diastolic) value of CLV: L/mmHg
CLVS = .00003;                  %Min (systolic) value of CLV: L/mmHg
tauS = .0025;                   %CLV time constant during systole: min
tauD = .001;                    %CLV time constant during diastole: min

%Initialization parameters
Plvi = 5;                       %Initial value of Plv: mmHg
Psai = 80;                      %initial value of Psa: mmHg

%Don't forget to plot VSA vs. PSA and VLV vs. PLV! The values have
%been exported into the matlab workspace so you can plot them.
