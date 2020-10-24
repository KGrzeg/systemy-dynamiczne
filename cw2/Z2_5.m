clc;
close all;
clear;

S = 248;
A = [S/pi S/2];
Phi = [0 -pi/2];

N = 20;
P = 1;
f = 1/P;

for n=1:N
    a = -2*S/pi * (1/(4*n^2-1));
    phi = 2*n * 2 * pi;
    
    h = 2*n+1;
    
    A(h) = a;
    Phi(h) = phi;
end

t = 0:0.001:P*2;
y = kosinusy(A,Phi,f,t);

figure;
title('Z2.5');
grid on;
plot(t, y);