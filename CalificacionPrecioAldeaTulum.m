%% Limpiar Datos
clear;
close all;
clc;

%% Datos de Booking para calificacion global y precio promedio en un anio
% Todo es para Aldea Tulum 

PreciosTulum=[
   8 409;
   9 1400;
   7.3 1100 ;
   4.3 962;
   2.5 795;
   1.3 958;
   7.9 758;
   6.2 940;
   6.7 1500;
   3 1523;
   8.8 1254];
    
x=PreciosTulum(:,1);
y=PreciosTulum(:,2);

%% Regresion Gaussiana

f1 = fit(x,y,'smoothingspline')
f2 = fit(x,y, 'poly1')

%% Grafica del modelo de pronostico
figure()
plot(x,y,'ok')
hold on
plot(f1, '-b')
plot(f2, 'k')
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Evaluacion vs Precios en Tulum ','FontName','Times New Roman','FontSize', 12)
xlabel('Evaluacion (0-10)','FontName','Times New Roman','FontSize', 12)
ylabel('Precios en Tulum (% MXN)','FontName','Times New Roman','FontSize', 12)
legend('Booking', 'Modelo de Suavizacion', 'Modelo Lineal')
grid minor
hold off;


%% Pronostico de precio por calificacion

calificacion=8;
pronosticoPrecios1=f1(calificacion);
pronosticoPrecios2=f2(calificacion);

%% Imprime resultado

fprintf(['\n\n Los precios en Tulum para un hospedaje con %i de calificacion seran de: $ \n' ...
    '%7.0f MXN por el metodo de suavizacion, y $ \n' ...
    '%7.0f MXN por regresion lineal.  \n'], calificacion, pronosticoPrecios1, pronosticoPrecios2);


