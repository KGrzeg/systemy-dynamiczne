%Fragment skryptu do zadania ZL3.4
close all;clear;   
A = 248;      %amplituda
f1 = 48;     %cz�stotliwo�� sygna�u
P = 1/f1;   %okres sygna�u 
fs = 16*f1; %cz�stotliwo�� pr�bkowania
T = 1/fs;   %okres pr�bkowania

%wektor warto�ci czasu dyskretnego dla jednego okresu sekwencji dyskretnej
% t = 0:T:1*P-T;  %nale�y zadba� aby koniec przedzia�u czasu = P-T
% % lub alternatywnie
N = 16; % bo z danych zadania N = fs/f1 = 16
k=0:N-1;    
t=k*T;

%Wygenerowanie warto�ci sygna�u okresowego dyskretnego
%y = A*sin(2*pi*f1*t)
%y = A*sin(2*pi*f1*t) + A;
y = A*sin(2*pi*f1*t) - A;

% Obliczenie Dyskretnej Transformaty Fouriera sygna�u y
% (DFT - Discrete Fourier Transform) poprzes u�ycie funkcji fft 
% (FFT - Fast Fourier Transform - szybkiego algorytmu wyznaczania DFT)
N=length(y);        %d�ugo�� analizowanej sekwencji dyskretnej
DFT_Y = fft(y,N);   %DFT sygna�u - N warto�ci zespolonych

% Wsp�czynniki zespolonej postaci szeregu Fouriera
% sygna�u dyskretnego okresowego y 
% (DTFS - Discrete-Time Fourier Series)
cm_Y = DFT_Y / N;
cm_Y_mod = abs(cm_Y);    %widmo amplitudowe sygna�u dyskretnego
cm_Y_arg = angle(cm_Y);  %widmo fazowe sygna�u dyskretnego [rad]
cm_Y_arg_deg = cm_Y_arg*180/pi;  %widmo fazowe sygna�u dyskretnego [stopnie]
% Wyznaczenie warto�ci cz�stotliwo�ci (Hz),
% dla kt�rych wyznaczono warto�ci DFT 
f = (0:N-1)*fs/N;

% Obliczenia parametr�w sygna�u y o d�ugo�ci N pr�bek
% Warto�� �rednia sygna�u y obliczona w dziedzinie czasu
Y0_t = sum(y)/N;     % mean(y)
% Warto�� �rednia sygna�u y obliczona w dziedzinie cz�stotliwo�ci
Y0_f = cm_Y(1);
% Moc sygna�u y obliczona w dziedzinie czasu
YP_t = sum(cm_Y_arg.^2)/N;   %(do uzupe�nienia)
% Moc sygna�u y obliczona w dziedzinie cz�stotliwo�ci
YP_f = sum(y.^2);    %(do uzupe�nienia)
% Warto�� skuteczna sygna�u y obliczona w dziedzinie czasu
Yrms_t = sqrt(YP_t);  %(do uzupe�nienia)
% Moc sygna�u y obliczona w dziedzinie cz�stotliwo�ci
Yrms_f = sqrt(YP_f);  %(do uzupe�nienia)
% Amplituda podstawowej harmonicznej
Y1_f = 124;   %(do uzupe�nienia)
% Warto�� skuteczna podstawowej harmonicznej
Y1rms_f = sqrt(Y1_f); %(do uzupe�nienia)
% Faza pocz�tkowa podstawowej harmonicznej (stopnie) 
fi1_f = -90;

table(Y0_t,Y0_f, YP_t, YP_f, Yrms_t, Yrms_f, Y1rms_f, Y1_f)

%Prezentacja przebiegu i widma sygna�u (DTFS)
figure;
subplot(311);plot(t,y,'b.-');grid on
title(['sygna� okresowy dyskretny, y_s_r = ',num2str(Y0_t),...
    ', y_R_M_S = ',num2str(Yrms_t)],'FontName','Times New Roman CE')
ylabel('y(kT)')
xlabel('czas [s]')
subplot(312);stem(f,cm_Y_mod);grid on
title(['widmo amplitudowe, y_s_r = ',num2str(Y0_f),...
    ', y_R_M_S = ',num2str(Yrms_f),', y1_R_M_S = ',num2str(Y1rms_f)])
ylabel('\midY(m))\mid/N')
xlabel('cz�stotliwo�� [Hz]','FontName','Times New Roman CE')
subplot(313);stem(f,cm_Y_arg_deg);grid on
title('widmo fazowe (stopnie)')
ylabel('arg(Y(m))')
xlabel('cz�stotliwo�� [Hz]','FontName','Times New Roman CE')
