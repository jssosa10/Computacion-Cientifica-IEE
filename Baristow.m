function [ V ] = Baristow( P )
%Baristow Halla la factorización por el método de Baristow de P. 
%Halla la factorizacón del polinomio P en terminos cuadráticos,
%salvo posiblemente uno que es lineal. En el vector P se encuetran los
%coeficientes del polinomio en orden descendente de exponente, es decir
%si el grado del polinomio es n, este esta dado por
%P(1)x^n+P(2)x^(n-1)+...+P(n-1)x+P(n). Se asume además que P(1) = 1. V es
%una matriz en la que cada fila corresponde a los coeficientes de uno de
%los fatores. La función halla los coeficientes p y q de uno de los 
%factores y se llama recursivamente sobre Q =P/(x^2+px+q) hasta que el 
%grado de Q sea menor o igual a 2.

%Se halla el grao del polinomio
n = length(P)-1;

%Si el grado del polinomio es menor o igual a 2, ya se encuentra en forma
%factorizada.
if(n<=2)
    if(n==1)
        %Si además es un factor lineal se agrga un cero al princpio para
        %que todas las filas de la matriz sean de tamaño 3.
    P = [0,P];    
    end
    %Se asigna el polinomio a la respuesta
    V = P;
else
%Se establece una cota para el error.
max  = 10e-6;

%Se dan valores iniciales a los coeficientes p y q.
p=1;
q=1;

%Se calculan los arreglos de coeficientes a_i y b_i.
a = P(2:n+1);
b = hallar_b(a,p,q);

%Se calculan R y S.
R = a(n-1)-p*b(n-2);
if(n>3)
    R = R-q*b(n-3);
elseif(n==3)
    R = R-q;
end
S = a(n)-q*b(n-2);

%Se tera hasta obtener la precisión deseada.
while((abs(R)>=max)||(abs(S)>=max))
    %Se caluculan los valores de los distintos c_i's y d_i's.
    c = hallar_c(b,p,q);
    d = hallar_d(b,p,q);
    
    %Se calculan as deirvadas parciales de R y S en funcion de p y q.
    dpR = -b(n-2)-p*c(n-2);
    dpS = -q*c(n-2);
    dqR = -p*d(n-2);
    dqS = -b(n-2)-q*d(n-2);
    if(n>3)
        dpR = dpR -q*c(n-3);
        dqR = dqR-b(n-3)-q*d(n-3);
    elseif(n==3)
        dqR=-1;
    end
    
    %Se calucula J.
    J = dpR*dqS-dpS*dqR;
    
    %Se actualizan os valores de p y q.
    p = p-((R*dqS-S*dqR)/J);
    q = q+((R*dpS-S*dpR)/J);
    
    %Se calculan nuevamente los coeficientes b_i
    b = hallar_b(a,p,q);
    
    %Se recalculan R y S
    R = a(n-1)-p*b(n-2);
    if(n>3)
        R = R-q*b(n-3);
    elseif(n==3)
        R=R-q;
    end
    S = a(n)-q*b(n-2);
end
%Se ecriben los coeficiendes del polinomio cociente Q=P/(x^2+px+q).
Q = [1,b];

%Se llama recursivamente la funcion sobre Q, pues oslo se a hallado un
%factor.
V = Baristow(Q);

%Se añaden los factores hallados a la matris respuesta.
factor = [1,p,q];
V = [factor;V];
end

