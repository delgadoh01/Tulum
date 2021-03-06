%% Borrar datos
clear;
clc;
close all;

%% Lectura de datos del primer archivo

datos = importdata('Simulacion1.txt');

x=datos(:,1);
y1=datos(:,2);
y2=datos(:,3);
y3=datos(:,4);
y4=datos(:,5);
y5=datos(:,6);


hold on

%% Graficas con los datos del primer archivo
%%figure()
subplot(2,3,1)
plot(x,y1)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Precio por noche vs VPN en Tulum','FontName','Times New Roman','FontSize', 12)
xlabel('Precio por noche ($)','FontName','Times New Roman','FontSize', 12)
ylabel('VPN ($)','FontName','Times New Roman','FontSize', 12)


%figure()
subplot(2,3,2)
plot(x,y2)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Precio por noche vs Periodo de recuperacion en Tulum (years)','FontName','Times New Roman','FontSize', 12)
xlabel('Precio por noche ($)','FontName','Times New Roman','FontSize', 12)
ylabel('Tiempo de recuperacion (years)','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,3)
plot(x,y3)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Precio por noche vs Relacion Beneficio/Costo','FontName','Times New Roman','FontSize', 12)
xlabel('Precio por noche ($)','FontName','Times New Roman','FontSize', 12)
ylabel('Relacion Beneficio/Costo','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,4)
plot(x,y4)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Precio por noche vs Valor de Reventa','FontName','Times New Roman','FontSize', 12)
xlabel('Precio por noche ($)','FontName','Times New Roman','FontSize', 12)
ylabel('Valor de Reventa','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,5)
plot(x,y5)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Precio por noche vs Retorno de la Inversion','FontName','Times New Roman','FontSize', 12)
xlabel('Precio por noche ($)','FontName','Times New Roman','FontSize', 12)
ylabel('Retorno de la Inversion','FontName','Times New Roman','FontSize', 12)

hold off

%% Lectura de datos del segundo archivo

datos2 = importdata('Simulacion2.txt');

xx=datos2(:,1);
yy1=datos2(:,2);
yy2=datos2(:,3);
yy3=datos2(:,4);
yy4=datos2(:,5);
yy5=datos2(:,6);

%% Graficas con los datos del segundo archivo

hold on

figure()
subplot(2,3,1)
plot(xx,yy1)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Evaluacion en Plataforma vs VPN en Tulum','FontName','Times New Roman','FontSize', 12)
xlabel('Evaluacion en Plataforma','FontName','Times New Roman','FontSize', 12)
ylabel('VPN ($)','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,2)
plot(xx,yy2)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Evaluacion en Plataforma vs Periodo de recuperacion en Tulum (years)','FontName','Times New Roman','FontSize', 12)
xlabel('Evaluacion en Plataforma','FontName','Times New Roman','FontSize', 12)
ylabel('Tiempo de recuperacion (years)','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,3)
plot(xx,yy3)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Evaluacion en Plataforma vs Relacion Beneficio/Costo','FontName','Times New Roman','FontSize', 12)
xlabel('Evaluacion en Plataforma','FontName','Times New Roman','FontSize', 12)
ylabel('Relacion Beneficio/Costo','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,4)
plot(xx,yy4)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Evaluacion en Plataforma vs Valor de Reventa','FontName','Times New Roman','FontSize', 12)
xlabel('Evaluacion en Plataforma','FontName','Times New Roman','FontSize', 12)
ylabel('Valor de Reventa','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,5)
plot(xx,yy5)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Evaluacion en Plataforma vs Retorno de la Inversion','FontName','Times New Roman','FontSize', 12)
xlabel('Evaluacion en Plataforma','FontName','Times New Roman','FontSize', 12)
ylabel('Retorno de la Inversion','FontName','Times New Roman','FontSize', 12)

hold off

%% Lectura de datos del tercer archivo

datos3 = importdata('Simulacion3.txt');

xxx=datos3(:,1);
yyy1=datos3(:,2);
yyy2=datos3(:,3);
yyy3=datos3(:,4);
yyy4=datos3(:,5);
yyy5=datos3(:,6);

%% Graficas con los datos del segundo archivo

hold on

figure()
subplot(2,3,1)
plot(xxx,yyy1)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Costo inicial de la propiedad vs VPN en Tulum','FontName','Times New Roman','FontSize', 12)
xlabel('Costo inicial de la propiedad','FontName','Times New Roman','FontSize', 12)
ylabel('VPN ($)','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,2)
plot(xxx,yyy2)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Costo inicial de la propiedad vs Periodo de recuperacion en Tulum (years)','FontName','Times New Roman','FontSize', 12)
xlabel('Costo inicial de la propiedad','FontName','Times New Roman','FontSize', 12)
ylabel('Tiempo de recuperacion (years)','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,3)
plot(xxx,yyy3)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Costo inicial de la propiedad vs Relacion Beneficio/Costo','FontName','Times New Roman','FontSize', 12)
xlabel('Costo inicial de la propiedad','FontName','Times New Roman','FontSize', 12)
ylabel('Relacion Beneficio/Costo','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,4)
plot(xxx,yyy4)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Costo inicial de la propiedad vs Valor de Reventa','FontName','Times New Roman','FontSize', 12)
xlabel('Costo inicial de la propiedad','FontName','Times New Roman','FontSize', 12)
ylabel('Valor de Reventa','FontName','Times New Roman','FontSize', 12)

%figure()
subplot(2,3,5)
plot(xxx,yyy5)
grid minor
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Costo inicial de la propiedad vs Retorno de la Inversion','FontName','Times New Roman','FontSize', 12)
xlabel('Costo inicial de la propiedad','FontName','Times New Roman','FontSize', 12)
ylabel('Retorno de la Inversion','FontName','Times New Roman','FontSize', 12)

hold off