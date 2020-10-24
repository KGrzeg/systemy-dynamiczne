clc;
close all;
clear;

S = 248;
wartosci_skuteczne = [];

% 1)
t1 = 0:.1:1;
A1 = [-3*S];
y1 = kosinusy(A1, [0], 1, t1);
wartosci_skuteczne(1) = skutecznaKosinusy(A1);

figure;
%subplot(3,2,1);
plot(t1, y1);
title('Z2.1.1');
grid on;

% 2)
f2 = 20;
t2 = 0:.001:0.1;
A2 = [S 2*S];
y2 = kosinusy(A2, [0 0], f2, t2);
wartosci_skuteczne(2) = skutecznaKosinusy(A2);

figure;
%subplot(3,2,2);
plot(t2, y2);
title('Z2.1.2');
grid on;

% 3)
f3 = 0.5;
t3 = 0:.01:2;
A3 = [0 S];
y3 = kosinusy(A3, [0 -pi/2-pi/3], f3, t3);
wartosci_skuteczne(3) = skutecznaKosinusy(A3);

figure;
%subplot(3,2,3);
plot(t3, y3);
title('Z2.1.3');
grid on;

% 4)
f4 = 50;
t4 = 0:1/3000:(1/f4*2);
A4 = [-S 3*S 0 S];
y4 = kosinusy(A4, [0 -pi/2+pi/4 0 -pi/4], f4, t4);
wartosci_skuteczne(4) = skutecznaKosinusy(A4);

figure;
%subplot(3,2,4);
plot(t4, y4);
title('Z2.1.4');
grid on;

% 5)
f5 = 50;
t5 = 0:1/3500:(1/f5*2);
A5 = [0 10*S 0 0 0 S 0 S];
y5 = kosinusy(A5, [0 -pi/2 0 0 0 -pi/2 0 -pi/2], f5, t5);
wartosci_skuteczne(5) = skutecznaKosinusy(A5);

figure;
%subplot(3,2,5);
plot(t5, y5);
title('Z2.1.5');
grid on;

% 6)
f6 = S;
t6 = 0:(1/(32*S)):1/f6*2;
A6 = [0 2*S S];
y6 = kosinusy(A6, [0 0 -pi/2], f6, t6);
wartosci_skuteczne(6) = skutecznaKosinusy(A6);

figure;
%subplot(3,2,6);
plot(t6, y6);
title('Z2.1.6');
grid on;

for i=1:length(wartosci_skuteczne)
  fprintf('%d) SK = %f\n', i ,wartosci_skuteczne(i));
end




