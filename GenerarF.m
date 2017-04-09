function [ F ] = GenerarF(n)
%GenerarF función que se encarga de generar una matriz de nxn
%con la especificación dada.
%Se inicializa la matriz F como una matriz de ceros
F=zeros(n);
%Se recorre la matriz asignando los valores de la diagonal como 2 y los adyacentes como -1.
for i = 1:n
	for j=1:n
		if i==j
			F(i,j)=2;
		else if i==j+1 || i==j-1
			F(i,j)=-1;
		end
	end
end
end