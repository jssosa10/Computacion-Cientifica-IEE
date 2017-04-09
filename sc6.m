om%%Script para pruebas.
%polinomios a utilizar en forma de vector de coeficientes.
polA=[1,-4,25,30,-185,428,-257,870];
polB=[1,0,-1,1,0,0,1];
polC=[1,-16,4,8,-10];
syms x;
%polinomios a utilizar escritos simbolicamente
PSA=x^7-4*x^6+25*x^5+30*x^4-185*x^3+428*x^2-257*x+870;
PSB=x^6-x^4-x^3-1;
PSC=x^4-16*x^3+4*x^2+x-10;
%Medicion de los tiempos de ejecucion.
f1 = @() funcionPractica6(polA);
t1 = timeit(f1,2);
f2 = @() funcionPractica6(polB);
t2 = timeit(f2,2);
f3 = @() funcionPractica6(polC);
t3 = timeit(f3,2);
fr1= @() roots(polA);
tr1= timeit(fr1);
fr2= @() roots(polB);
tr2= timeit(fr2);
fr3= @() roots(polC);
tr3= timeit(fr3);
ff1 = @() factor(PSA);
tf1 = timeit(ff1);
ff2 = @() factor(PSB);
tf2 = timeit(ff2);
ff3 = @() factor(PSC);
tf3 = timeit(ff3);
%Matriz con los timepos de ejecución
times = [t1,tr1,tf1;t2,tr2,tf2;t3,tr3,tf3];
%hallar resultados utilizando la funcion implementada y las nativas de matlab
[A1,B1]=funcionPractica6(polA);
r1=roots(polA);
f1=factor(PSA);
[A2,B2]=funcionPractica6(polB);
r2=roots(polB);
f2=factor(PSB);
[A3,B3]=funcionPractica6(polC);
r3=roots(polC);
f3=factor(PSC);
f=factor(x^6-1)