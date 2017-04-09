function [ d ] = hallar_d( b,p,q )
%hallar_d Halla los valores d_i dados losvalores b_i, p y q, y los almacena
%en el vector d.
n = length(b);
d = b;
d(1) = 0;
if n>1
    d(2) = -1;
end
i =3;
while(i<=n)
    d(i)= -b(i-2)-p*d(i-1)-q*d(i-2);
    i = i+1;
end
end

