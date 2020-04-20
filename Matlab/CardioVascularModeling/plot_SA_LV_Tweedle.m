%This script will plot the three blood flows, the pressure and volume of
%the LV and SA, the pressure-volume loops and the compliance changes

%Store the arrays for future plotting:
time=BloodFlows.time;
Qmi=BloodFlows.signals.values(:,1);
Vlv=PVClv.signals.values(:,1);
Plv=PVClv.signals.values(:,2);
Clv=PVClv.signals.values(:,3);
QAo=BloodFlows.signals.values(:,2);
Qs=BloodFlows.signals.values(:,3);

%Plot Results
Psa=PVClv.signals.values(:,4);
Vsa=PVClv.signals.values(:,5);


figure(1)
subplot(3,1,1), plot(time,Clv);
title('Clv vs Time');
ylabel('Clv (L/mmHg)');
xlabel('Time (min)');
subplot(3,1,2), plot(time,Plv,time,Psa);
title('Plv and Psa vs Time');
ylabel('Plv and Psa (mmHg)');
xlabel('Time (min)');
legend('Plv','Psa');
subplot(3,1,3), plot(time,Qmi,time,QAo,time,Qs);
title('Qmi,QAo,Qs vs Time');
ylabel('Blood Flows (L/mmHg)');
xlabel('Time (min)');
legend('Qmi','QAo','Qs');

%LV pressure-volume loop
figure(2)
plot(Vlv,Plv);
title('Plv vs Vlv');
ylabel('Plv(mmHg)');
xlabel('Vlv (L)');

%SA pressure-volume loop
figure(3)
plot(Vsa,Psa);
title('Psa vs Vsa');
ylabel('Psa(mmHg)');
xlabel('Vsa (L)');
