a=60;
b=40;
Ts=1.1;
x=log(8/100);
xi=sqrt(x^2/(pi^2+x^2));
omega=-(log(0.02)/(xi*Ts));
Kp=omega^2/a;
Kd=(2*xi*omega-b)/a;