function y=kosinusy(A,phi,f1,t)
% generuje dyskretny sygna� y z�o�ony ze sk�adowej sta�ej oraz M-1 
% funkcji kosinus;
% implementacja zale�no�ci (2.10) z instrukcji laboratoryjnej
% t � wektor warto�ci czasu, dla kt�rych obliczany jest sygna� y, 
%     odst�p pomi�dzy pr�bkami jest sta�y, r�wny okresowi pr�bk. T,
% f1 � warto�� cz�stotliwo�ci podstawowej sygna�u wyra�ona w Hz,
% A � wektor zawieraj�cy sk�adow� sta�� i amplitudy kolejnych harmonicznych, 
%     pierwszym elementem wektora jest warto�� sk�adowej sta�ej,
%     drugim amplituda podstawowej harmonicznej itd.,
% phi � wektor faz pocz�tkowych poszczeg�lnych harmonicznych, pierwszy 
%       element wektora okre�la znak sk�adowej sta�ej, 
%       drugi faz� pierwszej harmonicznej itd.,
% M � liczba harmonicznych + sk�adowa sta�a, d�ugo�� A = d�ugo�� phi = M
% y � warto�ci sygna�u y obliczone dla dyskretnych warto�ci czasu zawartych
%     w wektorze t
% Sk�adowa sta�a mo�e by� okre�lona na dwa sposoby:
% (1) - pierwszy element wektora A zawiera warto�� sk�adowej sta�ej (mo�e
%       by� ona dodatnia lub ujemna), a pierwszy element wektora phi
%       powinien mie� warto�� 0;
% (2) - pierwszy element wektora A zawiera warto�� bezwzgl�dn� sk�adowej
%       sta�ej (modu�), a pierwszy element wektora phi powinien mie� 
%       warto�� 0 dla dodatniej sk�adowej sta�ej i warto�� pi dla ujemnej
%       sk�adowej sta�ej;

M=length(A);    %d�ugo�� wektora amplitud (liczba harmonicznych)
Omega1 = 2*pi*f1;
y=A(1)*cos(phi(1))*ones(size(t));
for m=1:M-1
    y = y + A(m+1)*cos(m*Omega1*t + phi(m+1));
end

