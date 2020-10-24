%Synteza przebiegu prostok¹tnego i pi³okszta³tnego
clear; close all; clc;
A=248;
sygnal = 2; %wybór sygna³u do analizy 1 - prostok¹t, 2 - pi³a
M=10;       %liczba harmonicznych 

f1=100;     %czêstotliwoœæ sygna³u [Hz]
fs = 100*M*f1;  %fs = M*10000Hz 
Ts = 1/fs;      %odstêp miêdzy próbkami sygna³u "analogowego"
t=0:Ts:(20e-3 - Ts);  
N = length(t);
N1 = N/2;

if (sygnal==1)
    % Generacja sygna³u prostok¹tnego  
    gamma=0.5;   
    ile_jed = round(N1*gamma);
    ile_zer = N1-ile_jed;
    pol_jed = round(ile_jed*0.5);
    yp = [A*ones(1,pol_jed) zeros(1,ile_zer) A*ones(1,(ile_jed-pol_jed))];
elseif (sygnal==2)
    % Generacja sygna³u pi³okszta³tnego  
    yp = A/N1*(0:N1-1);
end
yp2 = [yp yp];  %dwa okresy sygna³u

%Obliczenie wspó³czynników rozwiniêcia sygna³u ci¹g³ego w zesp. sz. Fouriera
md=1:M;     %indeksy dodatnie
mu=-M:-1;   %indeksy ujemne
m=[mu 0 md];
if (sygnal==1)
    % Wspó³czynniki dla przebiegu prostok¹tnego
    cd=A*sin(md*pi*gamma)./(md*pi);   %wsp³. dla dodatnich indeksów m
    cu=A*sin(mu*pi*gamma)./(mu*pi);   %wsp³. dla ujemnych indeksów m
    c0 = A*gamma;                     %wsp³. dla zerowego indeksu m
elseif (sygnal==2)
% Wspó³czynniki dla przebiegu trójk¹tnego
    cd=A*1i./(2*md*pi);   
    cu=A*1i./(2*mu*pi);   
    c0 = A*0.5;
end
cm = [cu c0 cd];
cm_mod = abs(cm);   %widmo amplitudowe
phi = angle(cm);    %widmo fazowe
X_P=sum(cm_mod.^2) %moc sygna³u aproksymuj¹cego w dziedzinie czêstotliwoœci

% Wygenerowanie aproksymacji sygna³u prostok¹tnego
%(postaæ kosinusowa szeregu Fouriera)
Ad=2*abs(cd); %lub 2*abs(cu);
Am=[c0 Ad];    
phi_0d=phi(M+1:2*M+1); 
y = kosinusy(Am,phi_0d,f1,t);
sk = skutecznaKosinusy(Am)

Am1 = zeros(length(Am));
Am2 = zeros(length(Am));
Am3 = zeros(length(Am));

Am1(2) = Am(2);
Am2(3) = Am(3);
Am3(4) = Am(4);

yy1 = kosinusy(Am1,phi_0d,f1,t);
yy2 = kosinusy(Am2,phi_0d,f1,t);
yy3 = kosinusy(Am3,phi_0d,f1,t);

figure;plot(t,yy1,'b',t,y,'r'); grid on
set(gca,'FontName','Times New Roman CE','FontSize',14); 
title('Pierwsza Harmoniczna');
xlabel('\itt\rm [s]');

figure;plot(t,yy2,'b',t,y,'r'); grid on
set(gca,'FontName','Times New Roman CE','FontSize',14); 
title('Druga Harmoniczna');
xlabel('\itt\rm [s]');

figure;plot(t,yy3,'b',t,y,'r'); grid on
set(gca,'FontName','Times New Roman CE','FontSize',14); 
title('Trzecia Harmoniczna');
xlabel('\itt\rm [s]');


if (0)
% Rysunek - przebiegi czasowe
figure;plot(t,yp2,'b',t,y,'r'); grid on
set(gca,'FontName','Times New Roman CE','FontSize',14); 
title('Sygna³ syntetyzowany i jego aproksymacja szeregiem Fouriera');
xlabel('\itt\rm [s]');

%Obliczenie czêstotliwoœci poszczególnych harmonicznych
fa=m*f1;
%Rysunek - widmo amplitudowe i fazowe
figure;subplot(211);
stem(fa,cm_mod);grid on
title(['Widmo amplitudowe: \mid\itc_m\rm\mid, \itP\rm_a_v = ',num2str(X_P,'%15.5f')]);
subplot(212);
phi_skal = phi/pi;
% stem(fad,phi);grid on
stem(fa,phi_skal);grid on
title('Widmo fazowe: \it\phi_m \rm(krotnoœæ liczby \pi [rad])');
xlabel(['\itf\rm [Hz], ',num2str(M),' harmonicznych']);

%Rysunek - widmo rzeczywiste i urojone
figure;subplot(211);
stem(fa,real(cm)); grid on
title('Widmo rzeczywiste: Re\{\itc_m\rm\}');
subplot(212);
stem(fa,imag(cm)); grid on
title('Widmo urojone: Im\{\itc_m\rm\}');
xlabel(['\itf\rm [Hz], ',num2str(M),' harmonicznych']);
end