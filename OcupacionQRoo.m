close all;
clear;
clc;
s=310; %Numero de simulaciones por 10 a?os de 31 dias 

%% Datos de porcentaje de ocupacion en diciembre

x2010=[63.0	64.8	68.1	70.1	71.9	68.0	67.5	66.2	67.4	68.8	67.1	67.6	63.5	62.0	61.1	61.0	63.2	65.3	69.0	71.0	70.6	70.7	71.2	72.3	74.0	77.2	80.9	83.1	84.8	86.7	88.5];
x2011=[65.7	69.2	72.4	73.0	70.5	67.9	67.6	69.3	71.0	72.0	70.3	67.2	64.7	63.9	64.3	65.1	70.0	73.2	75.4	76.6	77.3	78.0	76.3	74.8	75.6	78.2	82.9	85.1	87.3	89.6	91.5];
x2012=[76.7	76.8	72.0	70.1	70.0	72.1	75.8	79.8	80.6	73.4	71.6	70.8	71.6	72.5	74.7	75.6	73.0	74.7	75.7	79.2	81.1	81.6	82.7	81.6	82.1	84.7	88.4	90.8	93.7	95.4	96.0];
x2013=[80.6	73.5	72.8	74.4	76.3	77.2	79.3	78.9	75.0	74.0	72.6	72.3	73.9	76.1	76.7	74.8	74.0	74.0	75.1	77.4	79.6	81.8	82.1	81.8	83.3	85.7	88.1	91.4	93.3	94.3	94.7];
x2014=[73.2	73.6	76.1	80.1	83.7	84.2	79.9	77.9	76.0	77.2	78.9	81.1	80.8	76.8	74.1	73.0	74.8	77.4	76.7	81.1	80.9	81.6	80.2	77.8	77.2	80.2	84.3	86.8	90.4	92.1	93.5];
x2015=[76.4	74.9	74.5	75.7	80.1	82.6	83.1	78.9	79.1	77.9	78.0	79.4	79.4	80.3	78.7	78.9	78.7	77.7	80.2	82.9	84.6	84.3	83.3	82.2	82.4	85.6	88.5	91.0	92.5	95.6	94.9];
x2016=[75.8	79.5	83.1	83.2	80.6	80.4	81.0	81.1	83.5	84.2	82.2	76.9	74.7	73.7	72.3	75.1	78.9	81.5	81.1	83.0	82.9	81.9	79.4	75.5	75.8	80.3	84.0	87.3	89.7	91.7	91.6];
x2017=[78.0	80.4	81.9	78.4	76.2	76.6	78.3	80.6	80.5	82.7	80.3	78.2	75.6	75.9	76.3	77.8	77.2	78.5	78.6	77.6	78.3	79.3	77.8	76.9	77.2	80.8	83.7	86.6	89.8	93.0	94.2];
x2018=[79.4	81.2	78.5	77.3	76.0	78.0	79.8	79.7	79.4	76.6	75.0	73.5	72.0	73.0	74.9	76.7	74.6	73.9	73.5	75.9	77.0	79.4	80.1	78.6	81.6	84.3	85.5	88.0	89.8	92.1	93.0];
x2019=[81.6	78.7	77.4	75.7	78.6	82.9	85.1	85.2	80.1	75.7	73.6	73.4	74.6	78.6	79.1	78.2	76.1	74.3	74.8	77.2	78.3	78.8	76.8	76.0	79.4	82.4	85.6	87.7	90.1	92.6	94.1];
x2020=[27.8	26.9	27.1	29.4	32.8	33.9	29.2	26.1	25.2	25.2	27.5	29.1	29.4	27.4	27.9	27.4	28.4	30.6	32.7	34.5	32.4	30.1	29.0	28.0	29.4	30.6	31.7	32.9	35.1	38.4	40.8];

%% Arreglo de datos para el mes completo por ano
%x=[x2010 x2011 x2012 x2013 x2014 x2015 x2016 x2017 x2018 x2019]';
x=x2019';
y=[1:1:length(x)]';

%% Arreglo de datos por dia a lo largo de los anos
% dia=1;
% x(1)=x2010(dia);
% x(2)=x2011(dia);
% x(3)=x2012(dia);
% x(4)=x2013(dia);
% x(5)=x2014(dia);
% x(6)=x2015(dia);
% x(7)=x2016(dia);
% x(8)=x2017(dia);
% x(9)=x2018(dia);
% x(10)=x2019(dia);
% x(11)=x2020(dia);
% 
% x=x';
% y=[1:1:length(x)]';


%% Grafica del comportamiento de los datos

figure();
plot(x,'k');
set(gca, 'FontName','Times New Roman','fontsize', 12);
title('Dias vs Porcentaje de Ocupacion','FontName','Times New Roman','FontSize', 12);
xlabel('Dias','FontName','Times New Roman','FontSize', 12);
ylabel('Porcentaje de Ocupacion','FontName','Times New Roman','FontSize', 12);
grid minor;

figure();
%hist(x,10, 'k');
histogram(x,'FaceColor','k')
set(gca, 'FontName','Times New Roman','fontsize', 12);
title('Porcentaje de Ocupacion','FontName','Times New Roman','FontSize', 12);
xlabel('Porcentaje de Ocupacion','FontName','Times New Roman','FontSize', 12);
ylabel('Frecuencia','FontName','Times New Roman','FontSize', 12);
grid on;

%% Ajuste polinomial

figure();
f = fit(y,x,'poly5');
plot(f,y,x,'ok');
set(gca, 'FontName','Times New Roman','fontsize', 12);
title('Dias vs Porcentaje de Ocupacion','FontName','Times New Roman','FontSize', 12);
xlabel('Dias','FontName','Times New Roman','FontSize', 12);
ylabel('Porcentaje de Ocupacion','FontName','Times New Roman','FontSize', 12);
grid minor;
hold on;
p = polyfit(y,x,5);

%% Ajuste a una distribucion de probabilidad del porcentaje de ocupacion

[D PD]=allfitdist(x,'PDF');
C= {'nakagami', 'rayleigh','rician', 'birnbaumsaunders', ...
    'generalized pareto','inversegaussian', 'logistic', ...
    'loglogistic', 'tlocationscale'};
nC = length(C);
nD = length(D);

for k=1:nC
for i=1:nD
  switch D(1,i).DistName 
      case C{k};
      D(i) = [];
      D(nD) = D(1);
  end
end
end

switch D(1,1).DistName
case  'generalized extreme value'
    K=D(1,1).Params(1,1)
    Sigma = D(1,1).Params(1,2)
    Mu=D(1,1).Params(1,3)
    y = gevrnd(K, Mu, Sigma, s, 1);
    save autos.dat y -ascii;
case  'beta'
    a = D(1,1).Params(1,1)
    b=D(1,1).Params(1,2)
    y = betarnd(a,b, s, 1);
    save autos.dat y -ascii;
case  'exponential'
    mu = D(1,1).Params(1,1)
    y = exprnd(mu, s, 1);
    save autos.dat y -ascii;
case   'extreme value'
    Mu=D(1,1).Params(1,1)
    Sigma = D(1,1).Params(1,2)
    y = evrnd(Mu, Sigma, s, 1);
    save autos.dat y -ascii;
case  'gamma'
    a = D(1,1).Params(1,1)
    b=D(1,1).Params(1,2)
    y = gamrnd(a,b, s, 1);
    save autos.dat y -ascii;
case   'lognormal'
    Mu=D(1,1).Params(1,1)
    Sigma = D(1,1).Params(1,2)
    y = lognrnd(Mu, Sigma, s, 1);
    save autos.dat y -ascii;
case   'normal'
    Mu=D(1,1).Params(1,1)
    Sigma = D(1,1).Params(1,2)
    y = normrnd(Mu, Sigma, s, 1);
    save autos.dat y -ascii;
case  'weibull'
    a = D(1,1).Params(1,1)
    b=D(1,1).Params(1,2)
    y = wblrnd(a,b, s, 1);
    save autos.dat y -ascii;
end

D(1)

grid minor
%% Promedio diario

PromedioDiario=mean(x)

%% Ajuste a distribucion normal

pd = fitdist(x,'Normal')

