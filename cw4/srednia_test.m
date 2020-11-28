close all;
clear;
clc;

S = 248;
N = 10;
x_per = [-S 0 S S*2 S*3];
x = repmat(x_per, 1, N);

y = srednia_ruchoma(length(x_per),x);

Nx = length(x);
kx = 0:Nx-1;

% figure;
stem(kx,x);
hold on;
stem(kx,y,'r');
grid on;
hold off;
