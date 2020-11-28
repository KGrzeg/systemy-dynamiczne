% close all;
clear;
x_per = [0 1 2 3 4];
x = [x_per x_per x_per x_per x_per x_per];
y = srednia_ruchoma(5,x);
Nx = length(x);
kx = 0:Nx-1;
% figure;
stem(kx,x);hold on;stem(kx,y,'r');grid on;hold off;
