clear;
clc;
close all;

%% Cargar datos de Booking para 
% El precio por noche en $MXN del 31/Dic/22 al 1/Ene/23
% El puntaje del anfitrion, se asume 6 para ausencia de dato 
% La distancia al centro en m y 
% Las habitaciones que quedan (x) [Se toma 10 por default] 

Datos=[
720     10      150     10;
727     6.0     7100    10;
4518    8.5    1100     10;
4844    9.3     2400    1;
6830    8.5     1400    10;
3826    8.0     1800    4;
5268    9.6     9700    1;
6972    8.9     1100    5;
32800   8.7     900     10;
989     7.7     1700    4;
7248    9.0     1200    6;
7670    7.5     7300    10;
50750   9.2     6000    2;
8215    8.3     1500    2;
2600    8.4     6700    2;
19216   7.5     3300    10;
3561    8.0     2300    10;
28763   8.6     7600    5;
7687    8.5     1500    10;
12805   7.6     8100    4;
4095    5.8     1200    10;
3695    8.7     1300    10;
7186    7.6     600     10;
26086   7.5   3700      10;
8245    7.6     1100    10;
3300    6.8     350        2;
18166   7.8     5100    2;
14048   8.7     1500    10;
2018    8.6     800     6;
8729    9.2     2200    4;
8720    9.0     1500    4;
8951    8.5     9600    2;
8437    8.9     1600    10;
6300    8.7     800     3;
2983    8.2     2400    5;
11276   8.2     8000    5;
5450    7.9     250     10;
29003   9.2     3000    5;
5037    7.3     700     3;
3326    7.8     800     4;
1200    8.3     1100    1;
8629    8.7     300     10;
4032    8.6     1600    4;
3633    8.8     600     1;
12699   7.1     5200    10;
28157   7.9     4800    10;
25273   8.5     7100    3;
10309   8.5     3100    3;
10088   8.8     1700    1;
5124    9.2     2100    1;
2500    7.3     300     10;
3052    6.0     1500    1;
2119    9.2     500      1;
1377    8.4     350     2;
46596   8.6     5100    1;
43498   9.2     7200    2;
6552    8.7     200     1;
3500    9.1     800     4;
12943   8.1     10700   6;
10537   9.0     9700    6;
5850    8.8     2100    3;
4037    8.6     900     1;
20164   7.7     1900    3;
3068    9.2     250     5;
8255    8.5     6100    2;
13080   9.2     1500    6;
4597    9.3     600     4;
7947    9.2     9500    3;
7218    9.3     2400    2;
3046    8.1     300     1;
2882    8.8     800     2;
4500    8.5     400     6;
25735   7.2   3900    10;
10173   9.1     1300    3;
3088    6.9     4100    10;
6229    8.9     1300    7;
6661    8.9     500     10;
1346    8.3     1200    5;
7412    8.6     600     1;
10949   9.2     1600    2;
1942    7.7     1600    4;
2753    8.5     1000    7;
6996    8.7     1300    2;
7250    7.6     5500    7;
8074    8.7     8900    7;
1756    8.2     200     10;
4542    8.4     1000    10;
3997    7.3     600     10;
7312    7.5     1100    1;
13533   8.0     8100    1;
7560    6.8     1100    10;
11535   9.0     1800    2;
3174    8.0     1200    1;
23616   8.3     1500    6;
1009    8.7     2900    1;
21708  9.7   10500     1;
6055    7.0   7700      6;
1532    8.7    15300    7;
1817    6       1400    10;
4905    6.2     1400    10;
% Competencia Aldea Tulum
380	7.10	20400	1.00	;
399	8.00	1300	2.00	;
484	8.10	200	10.00	;
527	7.80	600	10.00	;
532	6.40	1900	4.00	;
536	7.30	2900	10.00	;
542	8.60	1500	10.00	;
560	6.90	4100	10.00	;
560	7.90	250	10.00	;
600	9.20	800	1.00	;
600	6.70	100	1.00	;
600	8.70	2900	5.00	;
653	7.30	300	7.00	;
675	8.50	400	6.00	;
680	7.70	5800	10.00	;
689	9.00	700	7.00	;
700	7.40	50	2.00	;
700	8.00	600	10.00	;
718	7.10	600	10.00	;
719	8.60	400	1.00	;
734	9.20	19500	1.00	;
740	8.70	800	6.00	;
764	7.20	2900	3.00	;
794	8.10	900	10.00	;
799	8.40	100	1.00	;
799	8.10	2800	1.00	;
799	7.60	1400	4.00	;
809	7.40	600	10.00	;
809	8.00	1500	1.00	;
855	8.30	11000	2.00	;
859	6.80	350	5.00	;
859	9.10	250	10.00	;
867	8.60	800	10.00	;
884	8.00	1000	6.00	;
886	8.00	1800	4.00	;
899	9.20	500	1.00	;
899	7.60	600	4.00	;
899	8.90	500	10.00	;
899	7.80	250	1.00	;
911	9.00	350	10.00	;
911	9.30	350	10.00	;
927	5.00	1500	10.00	;
928	6.00	50	6.00	;
938	7.40	1400	1.00	;
950	6.70	3000	3.00	;
951	1.30	7100	10.00	;
964	8.50	1000	7.00	;
971	7.00	800	10.00	;
977	4.30	7200	10.00	;
979	6.70	1200	10.00	;
989	9.00	1500	1.00	;
993	8.40	1600	2.00	;
999	8.50	800	1.00	;
999	8.70	2900	4.00	;
999	7.90	1300	6.00	;
1000	8.30	1100	2.00	;
1000	8.00	200	1.00	;
1013	8.70	800	2.00	;
1019	8.30	450	2.00	;
1019	9.40	18900	10.00	;
];

n=size(Datos);

for i=1:n(1);
     if Datos(i,4)>=10
         Datos(i,4)=1; % No reservad
     else
         Datos(i,4)=2; % Reservado
     end
end

Precio=Datos(:,1);
Evaluacion=Datos(:,2);
Ubicacion=Datos(:,3);
Ocupacion=Datos(:,4);


%% Regresion de polinomio

sf = fit([Datos(:,1),Datos(:,3)],Datos(:,4),'poly52')
plot(sf,[Datos(:,1),Datos(:,3)],Datos(:,4))
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Precio vs Distancia vs Calificacion','FontName','Times New Roman','FontSize', 12)
xlabel('Precio','FontName','Times New Roman','FontSize', 12)
ylabel('Distancia','FontName','Times New Roman','FontSize', 12)
zlabel('Calificacion','FontName','Times New Roman','FontSize', 12)
colormap white;
[Mn,In]=min(Datos(:,3));
[Mx,Ix]=max(Datos(:,3));

%% Prepara el modelo Logit

X=[Precio Evaluacion Ubicacion];
Y=Ocupacion;
[B,dev,stats] = mnrfit(X,Y);

%% Evalua la probabilidad de ocupacion de un
% alojamiento que cuesta "Precio1" MXN por noche
% con calificacion de satisfaccion de "Evaluacion1" y 
% ubicado a "Ubicacion1" m del centro
% xxx=[Precio1, Evaluacion1, Ubicacion1]

Precio1=1500;
Evaluacion1=9.2; 
Ubicacion1=11200;
xxx = [Precio1, Evaluacion1, Ubicacion1];
pihat = mnrval(B,xxx);
pihat;

fprintf(['Para un alojamiento que cuesta %i MXN por noche, \n' ...
    'con una evaluacion de %2.1f, \n'...
    'y que esta a %i m del centro, se predice una ocupacion \n' ...
         'con probabilidad: %f\n\n'], Precio1, Evaluacion1, Ubicacion1, pihat(2));

     
%PorcentajeOcupacion=gevrnd(0.1328, 66.9088, 5.0335, 1, 1); % Distribucion 2010
PorcentajeOcupacion=gevrnd(0.1134, 3.7713, 79.3689, 1, 1); % Distribucion 2015
%PorcentajeOcupacion= gamrnd(129.0840,0.6084, 1, 1);  % Distribucion 2010-2019   
%PorcentajeOcupacion=gevrnd(0.0753, 2.5937, 28.5166, 1, 1); % Distribucion 2020    
%PorcentajeOcupacion=100

if PorcentajeOcupacion>=100;
    PorcentajeOcupacion=100;
elseif PorcentajeOcupacion<=0;
    PorcentajeOcupacion=0;
end

PorcentajeOcupacion

fprintf(['Para un dia en epoca alta, la probabilidad de hospedar huespedes \n' ...
    'en el alojamiento es de: %f, \n\n'], PorcentajeOcupacion*pihat(2)/100);



%% Grafica los alojamientos ocupados
X=[Precio Ubicacion];
plotData(X, Ocupacion);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Precio ($ MXN)')
ylabel('Ubicacion (Km)')

% Specified in plot order
legend('Reservado', 'No reservado')
hold off;

X=[Precio Evaluacion];
plotData(X, Ocupacion);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Precio ($ MXN)')
ylabel('Evaluacion (0-10)')

% Specified in plot order
legend('Reservado', 'No reservado')
hold off;

X=[Ubicacion Evaluacion];
plotData(X, Ocupacion);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Ubicacion (Km)')
ylabel('Evaluacion (0-10)')

% Specified in plot order
legend('Reservado', 'No reservado')
hold off;


