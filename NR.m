function [ x ] = NR( f,x,J )
%NR funci�n que realiza una iteraci�n de Newton-Rapshon multdimensional
%   Para hacer la iteraci�n de N-R se halla la soluci�n al sistema lineal
%   Jy=f finalmente se genera el nuevo valor de x teniendo en cuneta que
%   este sera x=x+y^T
y=linsolve(J,f);
x=x+y.';
end

