% Synteza przebiegu okresowego prostok¹tnego lub pi³okszta³tnego ("ci¹g³ego")
% na podstawie 10 wspó³czyników cm_a rozwiniêcia sygna³u ci¹g³ego
% w kosinusowy szereg Fouriera.
% "Spróbkowanie" w/w sygna³u z trzema ró¿nymi czêstotliwoœciami próbkowania fs:
% 1) fs > 2*fmax; 2) fs = 2*fmax; 3) fs < 2*fmax; 
% gdzie fmax - maksymalna czêstotliowœæ wystêpuj¹ca w sygnale
% Analiza sygna³ów okresowych dyskretnych - wyznaczenie wspó³czynników cm_d
% rozwiniêcia sygna³u w dyskretny szereg Fouriera - wykorzystanie funkcji
% fft programu Matlab.
% Synteza przebiegu okresowego prostok¹tnego lub trójk¹tnego dyskretnego i
% "ci¹g³ego" na podstawie wspó³czyników cm_d 

clear; close all;
sygnal = 1;         %wybór sygna³u 1 - prostok¹t, 2 - pi³a
probkowanie = 1;    %wybór czêstotliwoœci próbkowania
A=1;                %zmiana amplitudy sygna³u
% Parametry sygna³ów (nie modyfikowaæ!)
M=10;       %liczba harmonicznych  
gamma=0.5;
f1=100;     %czêstotliwoœæ sygna³u [Hz]
fs = 24*M*f1;   %fs = 24000Hz => 240 próbek na`okres P=1/f1
Ts = 1/fs;      %odstêp miêdzy próbkami sygna³u "analogowego" 
t=0:Ts:(10e-3 - Ts); 
N = length(t);

%Obliczenie wspó³czynników rozwiniêcia sygna³u ci¹g³ego w zespolony szereg Fouriera
md=1:M;     %indeksy dodatnie
mu=-M:-1;   %indeksy ujemne
m=[mu 0 md];
if (sygnal==1)
    % Wspó³czynniki dla przebiegu prostok¹tnego
    cmd=A*sin(md*pi*gamma)./(md*pi);   %wsp³. dla dodatnich indeksów m
    cmu=A*sin(mu*pi*gamma)./(mu*pi);   %wsp³. dla ujemnych indeksów m
    c0 = A*gamma;                     %wsp³. dla zerowego indeksu m
elseif (sygnal==2)
% Wspó³czynniki dla przebiegu pi³okszta³tnego
    cmd=A*1i./(2*md*pi);   
    cmu=A*1i./(2*mu*pi);   
    c0 = A*0.5;
end
cm_a = [cmu c0 cmd];
cm_a_mod = abs(cm_a);   %widmo amplitudowe
phi_a = angle(cm_a);    %widmo fazowe

% Wygenerowanie aproksymacji sygna³u ci¹g³ego
%(postaæ kosinusowa szeregu Fouriera)
Ad=2*abs(cmd); 
Am=[c0 Ad];    
phi_0d=phi_a(M+1:2*M+1); 
y = kosinusy(Am,phi_0d,f1,t);

%Wybór czêstotliwoœci prókowania fs sygna³u dyskretnego
%1) fs=2400Hz; 2) fs=2000Hz; 3) fs=1600Hz; 4) fs=1200Hz;
switch probkowanie
    case 1
        td = t(1:10:N);      %Ts1=10*Ts => fs1=2400Hz
        yd = y(1:10:N);      %fs1/f1=24 próbki na okres P=1/f1
    case 2
        td = t(1:12:N);      %Ts2=12*Ts => fs2=2000Hz
        yd = y(1:12:N);      %fs2/f1=20 próbek na okres P=1/f1
    case 3
        td = t(1:15:N);      %Ts3=15*Ts => fs2=1600Hz
        yd = y(1:15:N);      %fs3/f1=16 próbek na okres P=1/f1
%     case 4
%         td = t(1:20:N);      %10 próbek na okres
%         yd = y(1:20:N);     %10 próbek na okres
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%do uzupe³nienia
Nd = length(yd);                  %d³ugoœæ sekwencji dyskretnej
cm_d = fft(yd)/Nd;                 %wspó³czynniki DTFS
cm_d_mod = abs(cm_d);             %widmo amplitudowe 
cm_d_arg = angle(cm_d);           %widmo fazowe 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Rysunek - przebiegi czasowe
figure;plot(t,y,'b');hold on;stem(td,yd,'b');grid on
set(gca,'FontName','Times New Roman CE','FontSize',14); 
title({'Aproksymacja sygna³u okresowego 10 harmonicznymi';'sygna³ ci¹g³y i dyskretny (pr¹¿ki)'});
xlabel('\itt\rm [s]');

%Rysunek - widmo amplitudowe sygna³u ci¹g³ego i dyskretnego
cm_a_mod=cm_a_mod(M+1:2*M+1);
% cm_a_mod=real(cm_a(M+1:2*M+1));
indeksy_a = 0:M;
indeksy_d = 0:Nd-1;
figure;h1=subplot(211);
stem(indeksy_a,cm_a_mod);grid on
title('Widmo amplitudowe sygna³u analogowego: \mid\itc_m^a\rm\mid');
h2=subplot(212);
stem(indeksy_d,cm_d_mod); grid on; axis([0 Nd-1 0 0.5*A+0.1]);
g=axis;axis(h1,g);
title('Widmo amplitudowe sygna³u dyskretnego: \mid\itc_m^d\rm\mid');
xlabel(['\itf\rm [Hz], ',num2str(M),' harmonicznych']);

ydo = Nd*ifft(cm_d);
% Wygenerowanie aproksymacji  sygna³u ci¹g³ego na podstawie
% wspó³czynników rozwiniêcia w dyskretny szereg Fouriera
Amo=2*cm_d_mod(2:(Nd/2));
Amo=[cm_d_mod(1) Amo];  
phi_o = cm_d_arg(1:(Nd/2));
yo = kosinusy(Amo,phi_o,f1,t);

% Rysunek - przebiegi czasowe
figure;plot(t,y,'b');hold on;plot(t,yo,'r');stem(td,yd,'b');plot(td,ydo,'ro');grid on
set(gca,'FontName','Times New Roman CE','FontSize',14); 
title({'sygna³y oryginalne (niebieskie): ci¹g³y i dyskretny (pr¹¿ki)';'sygna³y odtworzone (czerwone): ci¹g³y i dyskretny (pr¹¿ki)'});
xlabel('\itt\rm [s]');

if (sygnal == 1) && (probkowanie == 3) 
    c7_a_d = cmd(7)
    c7_a_u = cmu(4)
    c9_a_d = cmd(9)
    c9_a_u = cmu(2)
    c7_d_d = c7_a_d + c9_a_u
    c9_d_d = c9_a_d + c7_a_u
end
if (sygnal == 2) && (probkowanie == 2) 
    c10_a_d = cmd(10)
    c10_a_u = cmu(1)
    c10_d_d = c10_a_d + c10_a_u
end
if (sygnal == 2) && (probkowanie == 3) 
    c6_a_d = cmd(6)
    c7_a_d = cmd(7)
    c8_a_d = cmd(8)
    c9_a_d = cmd(9)
    c10_a_d = cmd(10)
    c10_a_u = cmu(1)   
    c9_a_u = cmu(2) 
    c8_a_u = cmu(3)
    c7_a_u = cmu(4)
    c6_a_u = cmu(5)

    c6_d_d = c6_a_d + c10_a_u
    c7_d_d = c7_a_d + c9_a_u
    c8_d_d = c8_a_d + c8_a_u
    c9_d_d = c9_a_d + c7_a_u
    c10_d_d = c10_a_d + c6_a_u
end    
