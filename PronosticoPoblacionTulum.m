%% Limpia pantalla
clear;
close all;
clc;

%% Datos de INEGI

PoblacionTulum=[
    2000 6733;
    2005 14790;
    2010 28263;
    2015 32715;
    2020 46721]
    
x=PoblacionTulum(:,1);
y=PoblacionTulum(:,2);

%% Regresion Gaussiana

f1 = fit(x,y,'gauss1')

f2 = fit(x,y, 'poly1')

%% Grafica del modelo de pronostico
plot(x,y,'ok')
hold on
plot(f1, '-b')
plot(f2, 'k')
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Tiempo vs Poblacion en Tulum','FontName','Times New Roman','FontSize', 12)
xlabel('Censos','FontName','Times New Roman','FontSize', 12)
ylabel('Habitantes','FontName','Times New Roman','FontSize', 12)
legend('INEGI', 'Modelo Gaussiano', 'Modelo Lineal')
grid minor
hold off;

%% Pronostico de poblacion a futuro

year=2025;
pronostico=f2(year);
%% Imprime resultado

fprintf(['\n\n La poblacion de Tulum para el %i sera de: \n' ...
    '%i habitantes. \n'], year, pronostico);
