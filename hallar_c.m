function [ c ] = hallar_c( b,p,q )
%hallar_c Halla los valores c_i dados losvalores b_i, p y q, y los almacena
%en el vector c. 
n = length(b);
c = b;
c(1) = -1;
if(n>1)
    c(2) = -b(1)+p;
end
i =3;
while(i<=n)
    c(i) = -b(i-1)-p*c(i-1)-q*c(i-2);
    i = i+1;
end

end

