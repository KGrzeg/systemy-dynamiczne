function [sk] = skutecznaKosinusy( A )
    A(1) = A(1)^2;
    A(2:end) = A(2:end).^2./2;
    P = sum(A);
    sk = sqrt(P);
end

