%Script de pruebas y recoleccion de datos.
%Inicializacion de las variables de prueba omega y error
omega = 1.25;
error = 0.0001;
%Pruebas para sistemas con n=20 utilizando las dos normas
[x1,it1]=SOR(20,error,omega,1);
[x2,it2]=SOR(20,error,omega,2);
[x1g,it1g]=Gauss_Seidel(20,error,1);
[x2g,it2g]=Gauss_Seidel(20,error,2);
%Se inicializa el vector de omegas sobre el cual se va a iterar no se incluye 2 debido a que para este valor SOR no converge.
omegas = 1:0.05:1.95;
%Se inicializa el vector con las dimensiones de los sitemas de prueba
tamanos = [10 50 100];
%Se obtiene el tamaño de el vector de omegas
n=length(omegas);
%Se inicializa una matriz en la cual se ordenaran los resultados del metodo SOR de la siguiente forma omega,iteraciones n=10,iteraciones n=50 y iteraciones n=100
iters=zeros(n,4);
%Se generan los valores ejecutando multiples veces el metodo SOR
for i=1:n
	iters(i,1)=omegas(i);
	[x,it]=SOR(tamanos(1),error,omegas(i),1);
	iters(i,2)=it;
	[x,it]=SOR(tamanos(2),error,omegas(i),1);
	iters(i,3)=it;
	[x,it]=SOR(tamanos(3),error,omegas(i),1);
	iters(i,4)=it;
end
%Se inicializa una matriz en la cual se ordenaran los resultados del metodo Gauss-Seidel de la siguiente forma iteraciones n=10,iteraciones n=50 y iteraciones n=100
itersG=zeros(1,3);
%Se generan los valores ejecutando tres veces el metodo Gauss-Seidel
[x,it]=Gauss_Seidel(10,error,1);
itersG(1,1)=it;
[x,it]=Gauss_Seidel(50,error,1);
itersG(1,2)=it;
[x,it]=Gauss_Seidel(100,error,1);
itersG(1,3)=it;
%Se grafican los resultados de las iteraciones del metodo SOR
plot(omegas,iters(:,2),'r',omegas,iters(:,3),'b',omegas,iters(:,4),'g')
