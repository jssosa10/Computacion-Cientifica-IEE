function [ b] = hallar_b( X,p,q )
%hallar_b Calcula los valores b_i dados los coeficientes del polinomio, p
%y q, y los lamacena en el vector b. 
n = length(X)-2;
b = zeros(1,n);
b(1) = X(1)-p;
if n>1
    b(2) = X(2)-p*b(1)-q;
    i =3;
    while(i<=n)
        b(i) = X(i)-p*b(i-1)-q*b(i-2);
        i = i+1;
    end
end
end

