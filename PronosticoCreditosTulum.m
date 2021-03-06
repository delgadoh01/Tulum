%% Borrar variables
clear;
close all;
clc;

%% Datos historicos infonavit

% CreditosTulum=[
%     2014 31;
%     2015 170;
%     2016 299;
%     2017 658;
%     2018 2107;
%     2020 1791;
%     2021 1619
%     ]

CreditosTulum=[2020 500; 2021 500; 2022 1000; 2023 2000; 2024 2000; 2025 2000];

    
x=CreditosTulum(:,1);
y=CreditosTulum(:,2);

%% Regresion Gaussiana

f1 = fit(x,y,'gauss1')

f2 = fit(x,y, 'poly1')

%% Grafica del modelo de pronostico
plot(x,y,'ok')
hold on
plot(f1, '-b')
plot(f2, 'k')
set(gca, 'FontName','Times New Roman','fontsize', 12)
% title('Tiempo vs Creditos en Tulum de INFONAVIT','FontName','Times New Roman','FontSize', 12)
% xlabel('Tiempo','FontName','Times New Roman','FontSize', 12)
% ylabel('Creditos','FontName','Times New Roman','FontSize', 12)
% legend('INFONAVIT', 'Modelo Gaussiano', 'Modelo Lineal')
title('Tiempo vs Departamentos en Aldea Tulum','FontName','Times New Roman','FontSize', 12)
xlabel('Tiempo','FontName','Times New Roman','FontSize', 12)
ylabel('Departamentos','FontName','Times New Roman','FontSize', 12)
legend('CADU', 'Modelo Gaussiano', 'Modelo Lineal')
grid minor
hold off;

%% Pronostico de creditos a futuro

year=2023;
pronostico=f2(year);
%% Imprime resultado

fprintf(['\n\n Los creditos de Tulum para el %i sera de: \n' ...
    '%7.1f prestamos por parte de INFONAVIT, y \n' ...
    'seran %7.1f prestamos incluyendo los de bancos.  \n'], year, pronostico, pronostico*1.087);
