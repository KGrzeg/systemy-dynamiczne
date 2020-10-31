%Fragment skryptu do zadania ZL3.4
close all;clear;   
A = 248;      %amplituda
f1 = 48;     %czêstotliwoœæ sygna³u
P = 1/f1;   %okres sygna³u 
fs = 16*f1; %czêstotliwoœæ próbkowania
T = 1/fs;   %okres próbkowania

%wektor wartoœci czasu dyskretnego dla jednego okresu sekwencji dyskretnej
% t = 0:T:1*P-T;  %nale¿y zadbaæ aby koniec przedzia³u czasu = P-T
% % lub alternatywnie
N = 16; % bo z danych zadania N = fs/f1 = 16
k=0:N-1;    
t=k*T;

%Wygenerowanie wartoœci sygna³u okresowego dyskretnego
%y = A*sin(2*pi*f1*t)
%y = A*sin(2*pi*f1*t) + A;
y = A*sin(2*pi*f1*t) - A;

% Obliczenie Dyskretnej Transformaty Fouriera sygna³u y
% (DFT - Discrete Fourier Transform) poprzes u¿ycie funkcji fft 
% (FFT - Fast Fourier Transform - szybkiego algorytmu wyznaczania DFT)
N=length(y);        %d³ugoœæ analizowanej sekwencji dyskretnej
DFT_Y = fft(y,N);   %DFT sygna³u - N wartoœci zespolonych

% Wspó³czynniki zespolonej postaci szeregu Fouriera
% sygna³u dyskretnego okresowego y 
% (DTFS - Discrete-Time Fourier Series)
cm_Y = DFT_Y / N;
cm_Y_mod = abs(cm_Y);    %widmo amplitudowe sygna³u dyskretnego
cm_Y_arg = angle(cm_Y);  %widmo fazowe sygna³u dyskretnego [rad]
cm_Y_arg_deg = cm_Y_arg*180/pi;  %widmo fazowe sygna³u dyskretnego [stopnie]
% Wyznaczenie wartoœci czêstotliwoœci (Hz),
% dla których wyznaczono wartoœci DFT 
f = (0:N-1)*fs/N;

% Obliczenia parametrów sygna³u y o d³ugoœci N próbek
% Wartoœæ œrednia sygna³u y obliczona w dziedzinie czasu
Y0_t = sum(y)/N;     % mean(y)
% Wartoœæ œrednia sygna³u y obliczona w dziedzinie czêstotliwoœci
Y0_f = cm_Y(1);
% Moc sygna³u y obliczona w dziedzinie czasu
YP_t = sum(cm_Y_arg.^2)/N;   %(do uzupe³nienia)
% Moc sygna³u y obliczona w dziedzinie czêstotliwoœci
YP_f = sum(y.^2);    %(do uzupe³nienia)
% Wartoœæ skuteczna sygna³u y obliczona w dziedzinie czasu
Yrms_t = sqrt(YP_t);  %(do uzupe³nienia)
% Moc sygna³u y obliczona w dziedzinie czêstotliwoœci
Yrms_f = sqrt(YP_f);  %(do uzupe³nienia)
% Amplituda podstawowej harmonicznej
Y1_f = 124;   %(do uzupe³nienia)
% Wartoœæ skuteczna podstawowej harmonicznej
Y1rms_f = sqrt(Y1_f); %(do uzupe³nienia)
% Faza pocz¹tkowa podstawowej harmonicznej (stopnie) 
fi1_f = -90;

table(Y0_t,Y0_f, YP_t, YP_f, Yrms_t, Yrms_f, Y1rms_f, Y1_f)

%Prezentacja przebiegu i widma sygna³u (DTFS)
figure;
subplot(311);plot(t,y,'b.-');grid on
title(['sygna³ okresowy dyskretny, y_s_r = ',num2str(Y0_t),...
    ', y_R_M_S = ',num2str(Yrms_t)],'FontName','Times New Roman CE')
ylabel('y(kT)')
xlabel('czas [s]')
subplot(312);stem(f,cm_Y_mod);grid on
title(['widmo amplitudowe, y_s_r = ',num2str(Y0_f),...
    ', y_R_M_S = ',num2str(Yrms_f),', y1_R_M_S = ',num2str(Y1rms_f)])
ylabel('\midY(m))\mid/N')
xlabel('czêstotliwoœæ [Hz]','FontName','Times New Roman CE')
subplot(313);stem(f,cm_Y_arg_deg);grid on
title('widmo fazowe (stopnie)')
ylabel('arg(Y(m))')
xlabel('czêstotliwoœæ [Hz]','FontName','Times New Roman CE')
