close all;
clear;
clc;

S = 248;
N = 32;
Np = 128;
k = 1:1:Np*5;

x_per = S*sin(2*pi*k/Np);
x = repmat(x_per, 1, Np*5);

y = srednia_ruchoma(N,x);

Nx = length(x);
kx = 0:Nx-1;

% figure;
stem(kx,x);
hold on;
stem(kx,y,'r');
grid on;
hold off;
xlim([0 300])
ylim([-S S])