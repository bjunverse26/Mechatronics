clear;

numP = 20;
denP = [1 10 0];

Kp = 10;
Kd = 0.89;
Ki = 0;


tfP = tf(numP, denP);

tfPID = Kp + tf([Kd 0],[1/10000, 1]) + tf(Ki, [1 0]);

tfLoop = feedback(tfPID * tfP, 1);
figure(1);
step(tfLoop);

axis([0 1 0 1.4]);

tfPID2 = pid(Kp,Ki,Kd,1/10000);

tfLoop2 = feedback(tfPID2 * tfP, 1);
figure(2);
step(tfLoop2);

axis([0 1 0 1.4]);