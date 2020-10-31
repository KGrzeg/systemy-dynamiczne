% Sprawdzenie poprawno�ci obliczania DFT algorytmem brute-force 
% (por�wnanie wynik�w uzyskanych funkcj� brute i fft)
% Komentarz: Aproksymacja sygna�u prostok�tnego szeregiem Fouriera w
% punktach nieci�g�o�ci jest r�wna �redniej arytmetycznej granicy lewo- i
% prawostronnej sygna�u sekwencja 1 nie jest �ci�le nieparzysta 
% (wyst�puje warto�� 1 zamiast 0.5 w zerze i w drugim �punkcie nieci�g�o�ci�),
% wi�c harmoniczna nie jest �ci�le urojona (jest drobna cz�� rzeczywista)
close all; clear;
N=2048;         %liczba pr�bek sygna�u analizowanego
sygnal = 2;     %wyb�r sygna�u
%Sekwencja 1
if (sygnal==1) x=[ones(1,N/2) zeros(1,N/2)]; end
%Sekwencja 2
if (sygnal==2) x=[0.5 ones(1,N/2-1) 0.5 zeros(1,N/2-1)]; end
plot(0:N-1,x,'bo-');grid on;title('Sygna� analizowany');
%Algorytm brute-force 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% w tym miejscu wywo�a� w�asn� funkcj� brute(x)
t1 = tic; X_brute=brute(x); czas_obliczenia_brute = toc(t1) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Algorytm szybkiej transformaty Fouriera
t2 = tic; X_fft=fft(x); czas_obliczenia_fft = toc(t2)       
czas_obl_brute__przez__czas_obl_fft = czas_obliczenia_brute/czas_obliczenia_fft

%Prezentacja widm uzyskanych algorytmem brute i fft
figure;
subplot(221); stem(0:N-1,real(X_brute));grid on
title('DFT - algorytm brute-force (cz�� rzeczywista)');
subplot(222); stem(0:N-1,imag(X_brute)); grid on
title('DFT - algorytm brute-force (cz�� urojona)');
subplot(223); stem(0:N-1,real(X_fft));grid on
title('DFT - algorytm FFT (cz�� rzeczywista)');
subplot(224); stem(0:N-1,imag(X_fft)); grid on
title('DFT - algorytm FFT (cz�� urojona)');

%Sprawdzenie zgodno�ci wynik�w uzyskanych dla brute i fft
figure;
subplot(211);stem(0:N-1,real(X_brute)-real(X_fft)); grid on
title('DFT (brute-force) - DFT (fft) (cz�� rzeczywista)');
subplot(212);stem(0:N-1,imag(X_brute)-imag(X_fft)); grid on
title('DFT (brute-force) - DFT (fft) (cz�� urojona)');
max_blad_real = max(abs(real(X_brute-X_fft)))
max_blad_imag = max(abs(imag(X_brute-X_fft)))
