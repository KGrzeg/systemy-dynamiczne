clc;
close all;
clear;

S = 248;

% 1)
t1 = 0:.1:1;
y1 = kosinusy([-3*S], [0], 1, t1);

figure;
subplot(3,2,1);
plot(t1, y1);
title('Z2.1.1');
grid on;

% 2)
f2 = 20;
t2 = 0:.001:0.1;
y2 = kosinusy([S 2*S], [0 0], f2, t2);

subplot(3,2,2);
plot(t2, y2);
title('Z2.1.2');
grid on;

% 3)
f3 = 0.5;
t3 = 0:.01:2;
y3 = kosinusy([0 S], [0 -pi/2-pi/3], f3, t3);

subplot(3,2,3);
plot(t3, y3);
title('Z2.1.3');
grid on;

% 4)
f4 = 50;
t4 = 0:1/3000:(1/f4*2);
y4 = kosinusy([-S 3*S 0 S], [0 -pi/2+pi/4 0 -pi/4], f4, t4);

subplot(3,2,4);
plot(t4, y4);
title('Z2.1.4');
grid on;

% 5)
f5 = 50;
t5 = 0:1/3500:(1/f5*2);
y5 = kosinusy([0 10*S 0 0 0 S 0 S], [0 -pi/2 0 0 0 -pi/2 0 -pi/2], f5, t5);

subplot(3,2,5);
plot(t5, y5);
title('Z2.1.5');
grid on;

% 6)
f6 = S;
t6 = 0:(1/(32*S)):1/f6*2;
y6 = kosinusy([0 2*S S], [0 0 -pi/2], f6, t6);

subplot(3,2,6);
plot(t6, y6);
title('Z2.1.6');
grid on;




