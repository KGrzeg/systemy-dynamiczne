function X=brute(x)
% Obliczenie Dyskretnej Transformaty Fouriera (DFT) sygnału
% wprost z równania definicyjnego
% x - wektor zawierający próbki analizowanego sygnału
% X - wektorem zawierający wartości DFT (na podstawie N próbek sygnału x 
% wyznaczanych jest N wartosci widma X)

N=length(x);    % określenie liczby próbek sygnału x
W=exp(-1i*2*pi/N);  
k=0:N-1;    % numery próbek sygnalu x oraz sygnałów exp(-1i*m*2*pi*k/N)
X=zeros(size(x)); %inicjalizacja (zerowanie) wektora przechowującego wartości DFT
% Oblicznie DFT według zależności (3.80) ze skryptu
% gdzie exp(-1i*m*2*pi*k/N) = (W^m).^k
for m=0:N-1
    X(m+1)=sum(x.*(W^m).^k);
end