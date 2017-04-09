function [ retrasoT, inconsistencia, aumentoPotencias] = funcion( Longitud, retrasoAumentado, Potencia )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fragmentos = floor(Longitud/7930);
dif = mod(Longitud,7930);
factorRetraso = ((1-0.9^fragmentos)/(0.1));
retrasoD = 65*1.56*factorRetraso;
retrasoF = 61*0.58*factorRetraso;
colaF = 0.58*dif/130;
colaD = 1.56*dif/122;
retrasoD = retrasoD+colaD;
retrasoF = retrasoF+colaF;
retrasoT = retrasoD+retrasoF;
if(retrasoAumentado)
    retrasoT = retrasoT*1.1;
end   
inconsistencias = floor(Longitud/387);
inconsistencia = 1.35^(inconsistencias);
aumentoPotencias = Potencia*Longitud;
 
end

