% Sprawdzenie poprawnoœci obliczania DFT algorytmem brute-force 
% (porównanie wyników uzyskanych funkcj¹ brute i fft)
% Komentarz: Aproksymacja sygna³u prostok¹tnego szeregiem Fouriera w
% punktach nieci¹g³oœci jest równa œredniej arytmetycznej granicy lewo- i
% prawostronnej sygna³u sekwencja 1 nie jest œciœle nieparzysta 
% (wystêpuje wartoœæ 1 zamiast 0.5 w zerze i w drugim „punkcie nieci¹g³oœci”),
% wiêc harmoniczna nie jest œciœle urojona (jest drobna czêœæ rzeczywista)
close all; clear;
N=2048;         %liczba próbek sygna³u analizowanego
sygnal = 2;     %wybór sygna³u
%Sekwencja 1
if (sygnal==1) x=[ones(1,N/2) zeros(1,N/2)]; end
%Sekwencja 2
if (sygnal==2) x=[0.5 ones(1,N/2-1) 0.5 zeros(1,N/2-1)]; end
plot(0:N-1,x,'bo-');grid on;title('Sygna³ analizowany');
%Algorytm brute-force 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% w tym miejscu wywo³aæ w³asn¹ funkcjê brute(x)
t1 = tic; X_brute=brute(x); czas_obliczenia_brute = toc(t1) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Algorytm szybkiej transformaty Fouriera
t2 = tic; X_fft=fft(x); czas_obliczenia_fft = toc(t2)       
czas_obl_brute__przez__czas_obl_fft = czas_obliczenia_brute/czas_obliczenia_fft

%Prezentacja widm uzyskanych algorytmem brute i fft
figure;
subplot(221); stem(0:N-1,real(X_brute));grid on
title('DFT - algorytm brute-force (czêœæ rzeczywista)');
subplot(222); stem(0:N-1,imag(X_brute)); grid on
title('DFT - algorytm brute-force (czêœæ urojona)');
subplot(223); stem(0:N-1,real(X_fft));grid on
title('DFT - algorytm FFT (czêœæ rzeczywista)');
subplot(224); stem(0:N-1,imag(X_fft)); grid on
title('DFT - algorytm FFT (czêœæ urojona)');

%Sprawdzenie zgodnoœci wyników uzyskanych dla brute i fft
figure;
subplot(211);stem(0:N-1,real(X_brute)-real(X_fft)); grid on
title('DFT (brute-force) - DFT (fft) (czêœæ rzeczywista)');
subplot(212);stem(0:N-1,imag(X_brute)-imag(X_fft)); grid on
title('DFT (brute-force) - DFT (fft) (czêœæ urojona)');
max_blad_real = max(abs(real(X_brute-X_fft)))
max_blad_imag = max(abs(imag(X_brute-X_fft)))
