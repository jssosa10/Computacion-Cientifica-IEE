%%Inicialización
%Se inicializan la variables simbolicas a utilizar
syms theta2 theta3 theta4 theta5 V4 V5;
%Se crea el vector que tendra las fases de cada nodo
theta=[0,theta2,theta3,theta4,theta5];
%Se crea el vector que guarda la magnitud de los voltajes de cada nodo en
%p.u.
V=[1,1,1,V4,V5];
%Se crea el vector que se utlizara como incognitas del sistema
x=[theta2,theta3,theta4,theta5,V4,V5];
%Se establecen las condiciones del sistema
P=[0.883;0.1076;-1.7137;-1.7355;0.4017;0.2504];
% Matriz de Admitancias del sistema
Y=[2-20i,-1+10i,0,-1+10i,0;
  -1+10i,3-30i,-1+10i,-1+10i,0;
   0,-1+10i,2-20i,0,-1+10i;
   -1+10i,-1+10i,0,3-30i,-1+10i;
   0,0,-1+10i,-1+10i,2-20i
    ];
% vector que representa las funciones P2(x),...,P5(x),Q4(x),Q5(x)
Z=[0;0;0;0;0;0];
Z=sym(Z);
% se agregan los valores correspondinetes a P2..P5
for i=2:5
    for j=1:5
        k=V(i)*V(j)*(real(Y(i,j))*cos(theta(i)-theta(j))+imag(Y(i,j))*sin(theta(i)-theta(j)));
        Z(i-1)=Z(i-1)+k;
    end
end
%Se agregan los valores correspondientes a Q4 y Q5
for i=4:5
    for j=1:5
        k=V(i)*V(j)*(real(Y(i,j))*sin(theta(i)-theta(j))-imag(Y(i,j))*cos(theta(i)-theta(j)));
        Z(i+1)=Z(i+1)+k;
    end
end
% vector que representa las funciones P1(x),...,P5(x)
Ps=[0;0;0;0;0];
Ps=sym(Ps);
for i=1:5
    for j=1:5
        k=V(i)*V(j)*(real(Y(i,j))*cos(theta(i)-theta(j))+imag(Y(i,j))*sin(theta(i)-theta(j)));
        Ps(i)=Ps(i)+k;
    end
end
% vector que representa las funciones Q1(x),...,Q5(x)
Q=[0;0;0;0;0];
Q=sym(Q);
for i=1:5
    for j=1:5
        k=V(i)*V(j)*(real(Y(i,j))*sin(theta(i)-theta(j))-imag(Y(i,j))*cos(theta(i)-theta(j)));
        Q(i)=Q(i)+k;
    end
end
%Se halla el jacobiano asociado a la funcion f=Z-P. como P es constante
%este solo depende de Z
J=jacobian(Z,x);

%% Criterio de parada según norma
%valores iniciales 
x=[0,0,0,0,1,1];
%numero de iteraciones para poder comparar con el otro criterio
it=0;
%se establece el valor de parada
min=10^-6;
%se inicializa la norma infinito del vector x
norm=1;
%se ejecuta hasta que se cumpla la condición de parada
while norm>min
    %se evalua J en el valor actual de x
    J0=double(subs(J,{theta2,theta3,theta4,theta5,V4,V5},x));
    %se evalua Z en el valor actual de x
    P0=double(subs(Z,{theta2,theta3,theta4,theta5,V4,V5},x));
    %se define la función f sin embargo por comodidad esta se define como
    %-f
    f=P-P0;
    %se halla el proximo valor de x utilizando la iteración de Newton
    %multidimensional.
    x1=NR(f,x,J0);
    %Se halla la norma de la diferencia de los vectores de solución
    norm=max(abs(x1-x));
    %se actualiza el valor de x
    x=x1;
    %se actualiza el numero de iteraciones.
    it=it+1;
end
%%
%Criterio según iteraciones
%se establce el valor inicial.
x=[0,0,0,0,1,1];
%se realiza 7 veces la iteración de Newton
for it=1:7
J1=double(subs(J,{theta2,theta3,theta4,theta5,V4,V5},x));
P1=double(subs(Z,{theta2,theta3,theta4,theta5,V4,V5},x));
f=P-P1;
x=NR(f,x,J1);
end
%%
%Calculos finales
%Se hallan los valores para los P y Q teniendo en cuneta la solución x
Ps=double(subs(Ps,{theta2,theta3,theta4,theta5,V4,V5},x));
Q=double(subs(Q,{theta2,theta3,theta4,theta5,V4,V5},x));
Ploss=0;
%se hallan las perdidas del sistema.
for i=1:5
    Ploss=Ploss+Ps(i);
end
