close all;
clear;
clc;
s=365; %Numero de simulaciones por 1 anos  

%% Datos de precios de las ultima semana de cada mes, terminando el primer dia del mes siguiente
% 19 Hospedajes en Aldea Tulum, iniciando ultima seman de mayo de 2022
% (1) May22, (2) Jun22, (3) Jul22, (4)Ago22, (5)Sep22, (6)Oct22, (7)Nov22,
% (8)Dic22, (9)Ene23, (10)Feb23, (11)Mar23, (12)Abr23, (13)May23

Datos=[
362	362	418	418	418	418	418	418	418	418	418	418	418	;
644	644	644	644	644	644	644	644	644	644	644	644	644	;
1400	1400	1400	1400	1400	1400	1400	1400	1400	1400	1400	1400	1400	;
1400	1400	1400	1400	1400	1400	1400	1400	1400	1400	1400	1400	1400	;
1200	1200	1200	1200	1200	1200	1200	1200	1200	1200	1200	1200	1200	;
1100	1100	1100	1100	1100	1100	1100	1100	1100	1100	1100	1100	1100	;
962	962	962	962	962	962	962	962	962	962	962	962	962	;
795	795	795	795	795	795	795	795	795	795	795	795	795	;
554	554	946	946	946	1100	1100	1100	1100	1100	1100	954	954	;
608	608	608	608	608	716	716	716	1800	716	716	716	716	;
636	636	636	636	636	636	636	636	636	636	636	636	636	;
940	940	940	940	940	940	940	940	940	940	940	940	940	;
573	573	573	573	573	573	573	573	573	573	573	573	573	;
1500	1500	1500	1500	1500	1500	1500	1500	1500	1500	1500	1500	1500	;
999	999	999	999	999	999	999	999	999	999	999	999	999	;
1000	938	938	938	938	938	1100	1100	1100	1100	1100	1100	1100	;
1600	1600	1600	1600	1600	1600	1600	1600	1600	1600	1600	1600	1600	;
902	902	902	902	902	902	902	902	902	902	902	902	902	;
765	765	833	833	714	714	714	714	714	714	714	714	714	;
1400	2200	2200	1400	1400	1400	1400	1400	1400	1400	1400	1400	1400	;
1200	1200	1200	1200	1200	1200	1300	1300	1300	1300	1300	1300	1300	;    
];


%% Arreglo de datos para el mes completo por ano
%x=Datos(:,8);

x=[3.57; 3.97; 4.08; 2.13; 3.36; 6.77; 4.83; 2.83; 3.15; 7.36 ];
y=[1:1:length(x)]';


%% Grafica del comportamiento de los datos

figure();
plot(x,'k');
set(gca, 'FontName','Times New Roman','fontsize', 12);
title('Costo por noche vs Departamentos','FontName','Times New Roman','FontSize', 12);
xlabel('Departamentos','FontName','Times New Roman','FontSize', 12);
ylabel('Costo por noche','FontName','Times New Roman','FontSize', 12);
grid minor;

figure();
%hist(x,10, 'k');
histogram(x,'FaceColor','k')
set(gca, 'FontName','Times New Roman','fontsize', 12);
title('Precio por noche','FontName','Times New Roman','FontSize', 12);
xlabel('Precio por noche','FontName','Times New Roman','FontSize', 12);
ylabel('Frecuencia','FontName','Times New Roman','FontSize', 12);
grid on;

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

