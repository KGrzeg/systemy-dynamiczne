close all;
clear;
clc;

S = 248;
N = 32;
Np = 32;
k = 1:1:Np*10;

x_per = S+S*sin(2*pi*k/Np)+0.5*S*sin(4*pi*k/Np)+S*randn(size(k));
x = repmat(x_per, 1, Np*10);

y = srednia_ruchoma(N,x);
y0 = S*ones(size(k));

Nx = length(x);
kx = 0:Nx-1;

% figure;
figure;
grid on;
plot(kx,x);hold on;
plot(kx,y,'r');hold on;
plot(y0,'g'); hold off;
xlim([0 300])