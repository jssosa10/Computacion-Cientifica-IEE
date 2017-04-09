function [ factors, roots ] = funcionPractica6( P )
%funcionPractica6 funcion que halla las raices y factores del polinomio cuyos
%coeficiente se espicifican en el vector P.
%   Se utiliza el algoritmo de Baristow para hallar la descomposición de P
%   en producto de polinomios cuadráticos, salvo posiblemente un factor
%   lineal. Luego, se hallan las raices de dichos factores, las cuales
%   corresponden a raices de P. Además, se escribe la descomposición de P
%   en polinomios de grado 1, o dos si las raices son complejas.

%Se normaliza el polinomio para que el primer coeficiente sea 1.
for i=1:length(P)
    P(i) = P(i)/P(1);
end
%Se hallan los coeficientes de la factorizacón dada por el método de
%Baristow.
B = Baristow(P);

%Arreglo en el que se almacenarán las raices de P.
roots=[];

%Cantidad de factores dados por la factorizacón de Baristow.
n = length(B(:,1));

%Arreglo donde se almacenarán las expresones simbólicas de los factores
%cuadráticos.
factors =[];


for i=1:n
    
    %Factor i de la factorización.
    fac = B(i,:);
    %Se revisa que el factor sea un polinomio cuadrático.
    if fac(1)>0        
        %Coeficientes del polinomio.
        a = fac(1);
        b = fac(2);
        c = fac(3);
        %Se calcula e discriminante
        d = b^2-(4*a*c);
        %Se hallan las raices dela ecuación con la fórmula cuadrática.
        r1 = (-1*b-sqrt(d))/(2*a);
        r2 = (-1*b+sqrt(d))/(2*a);
        
        %Se añaden las raices halladas
        roots = [r1,r2,roots];
                
        if(d>=0)
            %Si las raices son reales se agregan a los factores dos teminos
            %lieales.
            factors=[factors;[0,1,-1*r1];[0,1,-1*r2]];
        else
            %Si las raices son complejas se agraga la expresión simbólica
            %del polinomio cuadrático
            factors = [factors;[a,b,c]];
        end
    %Situación en la que el polinomio es lineal
    else
        %Se agrega la expresión simbólica del factor.
        factors = [factors;[0, fac(2),fac(3)]];
        
        %Se calcula y se añade la raiz correspondiente al factor.
        r = -1*fac(3)/fac(2);
        roots = [r,roots];
    end
end
end

