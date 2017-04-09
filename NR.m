function [ x ] = NR( f,x,J )
%NR función que realiza una iteración de Newton-Rapshon multdimensional
%   Para hacer la iteración de N-R se halla la solución al sistema lineal
%   Jy=f finalmente se genera el nuevo valor de x teniendo en cuneta que
%   este sera x=x+y^T
y=linsolve(J,f);
x=x+y.';
end

