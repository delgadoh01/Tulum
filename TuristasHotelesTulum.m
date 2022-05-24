%% Limpiar Datos
clear;
close all;
clc;

%% Datos historicos Secretaria  de Turismo Quintana Roo
% Se cuenta con datos del ano, numero de turistas, hoteles y habitaciones
% totales

TuristasTulum=[
    2015 4661641 138 6253;
    2016 4790056 144 7082;
    2017 5047861 145 7119;
    2018 6213211 145 7124;
    2019 6516108 152 8138;
    2020 3258054 158 8250;
    2021 5825279 159 8390;
    ]
    
x=TuristasTulum(:,1);
y=TuristasTulum(:,2);
z=TuristasTulum(:,3);
w=TuristasTulum(:,4);

%% Regresion Gaussiana

f1 = fit(x,y,'smoothingspline')
f2 = fit(x,y, 'poly1')
f3 = fit(x,z,'gauss1')
f4 = fit(x,z, 'poly1')
f5 = fit(x,w,'gauss1')
f6 = fit(x,w, 'poly1')

%% Grafica del modelo de pronostico
figure()
plot(x,y,'ok')
hold on
plot(f1, '-b')
plot(f2, 'k')
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Tiempo vs Turistas en Tulum ','FontName','Times New Roman','FontSize', 12)
xlabel('Tiempo','FontName','Times New Roman','FontSize', 12)
ylabel('Turistas','FontName','Times New Roman','FontSize', 12)
legend('SECTUR', 'Modelo de Suavizacion', 'Modelo Lineal')
grid minor
colormap (white)
hold off;

figure()
plot(x,z,'ok')
hold on
plot(f3, '-b')
plot(f4, 'k')
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Tiempo vs Hoteles en Tulum','FontName','Times New Roman','FontSize', 12)
xlabel('Tiempo','FontName','Times New Roman','FontSize', 12)
ylabel('Hoteles','FontName','Times New Roman','FontSize', 12)
legend('SECTUR', 'Modelo Gaussiano', 'Modelo Lineal')
grid minor
colormap (white)
hold off;

figure()
plot(x,w,'ok')
hold on
plot(f5, '-b')
plot(f6, 'k')
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Tiempo vs Habitaciones en Tulum','FontName','Times New Roman','FontSize', 12)
xlabel('Tiempo','FontName','Times New Roman','FontSize', 12)
ylabel('Habitaciones','FontName','Times New Roman','FontSize', 12)
legend('SECTUR', 'Modelo Gaussiano', 'Modelo Lineal')
grid minor
colormap (white)
hold off;

%% Pronostico de turistas a futuro

year=2023;
pronosticoTuristas1=f1(year);
pronosticoTuristas2=f2(year);
pronosticoHoteles3=f3(year);
pronosticoHoteles4=f4(year);
pronosticoHabitaciones5=f5(year);
pronosticoHabitaciones6=f6(year);

%% Imprime resultado

fprintf(['\n\n Los Turistas en Tulum para el %i seran de: \n' ...
    '%7.0f visitantes por el metodo de suavizacion, y \n' ...
    'seran %7.0f visitantes por regresion lineal.  \n'], year, pronosticoTuristas1, pronosticoTuristas2);

fprintf(['\n\n Los Hoteles en Tulum para el %i seran de: \n' ...
    '%7.0f por el metodo de regresion Gaussiana, y \n' ...
    'seran %7.0f por regresion lineal.  \n'], year, pronosticoHoteles3, pronosticoHoteles4);

fprintf(['\n\n Las Habitaciones en Tulum para el %i seran de: \n' ...
    '%7.0f cuartos por el metodo de regresion Gaussiana, y \n' ...
    'seran %7.0f cuartos por regresion lineal.  \n'], year, pronosticoHabitaciones5, pronosticoHabitaciones6);

