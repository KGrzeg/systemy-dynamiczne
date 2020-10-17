function y=kosinusy(A,phi,f1,t)
% generuje dyskretny sygna³ y z³o¿ony ze sk³adowej sta³ej oraz M-1 
% funkcji kosinus;
% implementacja zale¿noœci (2.10) z instrukcji laboratoryjnej
% t – wektor wartoœci czasu, dla których obliczany jest sygna³ y, 
%     odstêp pomiêdzy próbkami jest sta³y, równy okresowi próbk. T,
% f1 – wartoœæ czêstotliwoœci podstawowej sygna³u wyra¿ona w Hz,
% A – wektor zawieraj¹cy sk³adow¹ sta³¹ i amplitudy kolejnych harmonicznych, 
%     pierwszym elementem wektora jest wartoœæ sk³adowej sta³ej,
%     drugim amplituda podstawowej harmonicznej itd.,
% phi – wektor faz pocz¹tkowych poszczególnych harmonicznych, pierwszy 
%       element wektora okreœla znak sk³adowej sta³ej, 
%       drugi fazê pierwszej harmonicznej itd.,
% M – liczba harmonicznych + sk³adowa sta³a, d³ugoœæ A = d³ugoœæ phi = M
% y – wartoœci sygna³u y obliczone dla dyskretnych wartoœci czasu zawartych
%     w wektorze t
% Sk³adowa sta³a mo¿e byæ okreœlona na dwa sposoby:
% (1) - pierwszy element wektora A zawiera wartoœæ sk³adowej sta³ej (mo¿e
%       byæ ona dodatnia lub ujemna), a pierwszy element wektora phi
%       powinien mieæ wartoœæ 0;
% (2) - pierwszy element wektora A zawiera wartoœæ bezwzglêdn¹ sk³adowej
%       sta³ej (modu³), a pierwszy element wektora phi powinien mieæ 
%       wartoœæ 0 dla dodatniej sk³adowej sta³ej i wartoœæ pi dla ujemnej
%       sk³adowej sta³ej;

M=length(A);    %d³ugoœæ wektora amplitud (liczba harmonicznych)
Omega1 = 2*pi*f1;
y=A(1)*cos(phi(1))*ones(size(t));
for m=1:M-1
    y = y + A(m+1)*cos(m*Omega1*t + phi(m+1));
end

