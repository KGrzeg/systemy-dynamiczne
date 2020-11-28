close all;
clear;
clc;

S = 248;
N = 10;
x_per = [S];
x = [x_per zeros(1,30)];
y = srednia_ruchoma(N,x);

Nx = length(x);
disp(Nx);
kx = 0:Nx-1;

% figure;
stem(kx,x);
hold on;
stem(kx,y,'r');
grid on;
hold off;
