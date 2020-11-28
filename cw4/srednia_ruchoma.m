function y=srednia_ruchoma(N,x)
%Srednia ruchoma sygnalu x
% N jest okresem usredniania, liczba wspolczynnikow filtru
% x jest sygnalem analizowanym
% y jest wartoscia sredniej sygnalu x za okres N

q = 0; % wartosc poczatkowa sumy q
M = length(x);
cirbuff = zeros(1,N); % inicjalizacja bufora cyklicznego
cirbuff_address = 1; % inicjalizacja adresu bufora cyklicznego
for k=1:M
% 1. pobranie nowej probbki sygnalu (x_new) z wektora x
    x_new = x(k); 
% 2. obliczenie sumy q
    q = q + x_new - cirbuff(cirbuff_address);
% 3. zapisanie x_new do bufora cyklicznego (cirbuff) 
    cirbuff(cirbuff_address) = x_new;
% 4. aktualizacja adresu bufora (cirbuff_address)
    if cirbuff_address == N
        cirbuff_address = 1;
    else
        cirbuff_address = cirbuff_address + 1;
    end
% 5. obliczenie wartości sredniej
    y=q/N;
end