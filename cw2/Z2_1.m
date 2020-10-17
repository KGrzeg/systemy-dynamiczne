clc;
close all;
clear;

S = 248;
S = 100; % debug

% kosinusy(A,phi,f1,t)

% 1)
t1 = 0:.1:1;
y1 = kosinusy([-3*S], [0], 1, t1);

figure;
subplot(3,2,1);
plot(t1, y1);
title('Z2.1.1');
grid on;

% 2)
t2 = 0:.001:2;
y2 = kosinusy([S 2*S], [0 0], 1, t2);

subplot(3,2,2);
plot(t2, y2);
title('Z2.1.2');
grid on;

% 3)
t3 = 0:.01:1/.5;
y3 = kosinusy([0 S], [0 -pi/3], 0.5, t3);

subplot(3,2,3);
plot(t3, y3);
title('Z2.1.3');
grid on;

% 4)
t4 = 0:1/3000:1/(50);
y4 = kosinusy([-S 3*S S], [0 pi+pi/4 -pi/4], 100, t4);

subplot(3,2,4);
plot(t4, y4);
title('Z2.1.4');
grid on;

% 5)
t5 = 0:1/3500:1/25;
y5 = kosinusy([0 10*S S S], [0 pi pi pi], 50, t5);

subplot(3,2,5);
plot(t5, y5);
title('Z2.1.5');
grid on;

% 6)
t6 = 0:0.001:2/S;
y6 = kosinusy([0 2*S S], [0 0 pi], S, t6);

subplot(3,2,6);
plot(t6, y6);
title('Z2.1.6');
grid on;




