function [x,iter] = SOR(n,p,omega,norma)
%SOR funcion encargada de hallar una solucion al sistema Fx=b
%con una precision de p utilizando el algoritmo SOR.
%Se genera la matriz F.
F=GenerarF(n);
%Se genera el vector b 
b=ones(n,1);
%Se genera un vector inicial de soluciones.
x=ones(n,1);
%Se inicializa el numero de iteraciones.
iter=0;
%Se mira que tipo de norma se decidio escoger.
if norma==1
%Si se escoge la norma infinito se realizara las operaciones siguientes.
%Se inicializa el error.
	epsilon=1;
	%se itera mintras que el error se mayor al deseado
	while(epsilon>=p)
	%Se inicializa el maximo 	
		maxi=0;
	%Se aumneta el numero de iteraciones
		iter=iter+1;
	%Se calcula el nuevo x	
		for i=1:n
			ant = x(i);
			sigma = 0;
			for j=1:n
				if i~=j
					sigma = sigma+F(i,j)*x(j);
				end
			end
			x(i)=x(i)+omega*(((b(i)-sigma)/F(i,i))-x(i));
			Se revisa si la diferencia entre el nuevo x_i y el anterior en valor absoluto es mayor que le maximo
			if abs(x(i)-ant)>maxi
				%Se asigna el nuevo maximo.
				maxi=abs(x(i)-ant);
			end
		end
		%epsilon se calcula como el maximo de las diferencias dividido entre la norma infinito de el nuevo x.
		epsilon=maxi/max(abs(x));
	end
else
	%Este procedimento es muy similar al anterior solo se diferncia en la forma de calcular el epsilon.
	epsilon=1;
	while(epsilon>=p)
		iter=iter+1;
	%Es necesario guardar todo el vector anterior.
		ant = x;
		for i=1:n
			sigma = 0;
			for j=1:n
				if i~=j
					sigma = sigma+F(i,j)*x(j);
				end
			end
			x(i)=x(i)+omega*(((b(i)-sigma)/F(i,i))-x(i));
		end
		%se calcula epsilon como norma infinito de la resta del nuevo x y el anterior dividida entre la norma de el nuevo vector x. 
		epsilon=norm(x-ant)/norm(x);
	end
end
end