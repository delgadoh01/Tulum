clear;
clc;
close all;

%% Cargar datos de Booking para 
% El precio por noche en $MXN del 31/Dic/22 al 1/Ene/23
% El puntaje del anfitrion, se asume 6 para ausencia de dato 
% La distancia al centro en m y 
% Las habitaciones que quedan (x) [Se toma 10 por default] 

Datos=[
380	20400	7.10	7.30	6.90	7.20	7.40	7.80	6.60	7.10	1.00	;
399	1300	8.00	8.40	8.20	7.80	7.80	8.00	8.50	8.60	2.00	;
484	200	8.10	8.60	8.30	8.30	7.80	8.50	9.10	8.10	10.00	;
527	600	7.80	8.70	7.60	7.40	7.50	8.20	8.60	7.20	10.00	;
532	1900	6.40	6.30	6.60	7.30	7.10	6.90	6.20	7.50	4.00	;
536	2900	7.30	8.30	7.50	8.30	8.30	7.50	7.10	7.30	10.00	;
542	1500	8.60	9.40	8.60	9.10	8.70	8.80	7.60	7.60	10.00	;
560	4100	6.90	8.00	7.00	7.50	7.40	7.40	8.60	9.00	10.00	;
560	250	7.90	8.80	8.20	8.50	8.50	8.30	9.20	8.40	10.00	;
600	800	9.20	9.60	9.00	9.40	9.30	9.20	8.70	9.10	1.00	;
600	100	6.70	8.10	6.40	7.10	7.00	7.00	8.70	6.70	1.00	;
600	2900	8.70	9.30	8.70	8.70	8.50	9.10	8.60	8.40	5.00	;
653	300	7.30	8.40	6.90	7.70	7.40	7.60	8.90	7.40	7.00	;
675	400	8.50	8.90	8.40	8.90	8.80	8.80	8.90	7.90	6.00	;
680	5800	7.70	8.60	7.50	8.50	7.40	8.20	7.10	7.50	10.00	;
689	700	9.00	9.20	9.00	8.90	8.90	8.70	8.90	8.60	7.00	;
700	50	7.40	8.70	6.90	7.60	7.40	7.40	9.30	6.50	2.00	;
700	600	8.00	9.30	8.00	8.00	8.20	8.30	8.70	7.80	10.00	;
718	600	7.10	7.90	6.80	7.20	7.30	7.50	8.50	7.30	10.00	;
719	400	8.60	9.10	8.70	9.10	9.00	8.70	9.00	9.30	1.00	;
734	19500	9.20	9.50	9.10	9.30	9.20	9.30	8.70	7.50	1.00	;
740	800	8.70	9.80	9.60	9.40	9.00	9.40	8.50	8.60	6.00	;
764	2900	7.20	9.10	6.80	7.10	6.90	7.30	8.30	7.40	3.00	;
794	900	8.10	10.00	8.60	8.20	8.20	8.90	6.40	8.10	10.00	;
799	100	8.40	9.20	7.90	8.40	8.40	8.60	9.40	8.80	1.00	;
799	2800	8.10	9.30	7.70	8.20	8.00	8.20	8.20	8.30	1.00	;
799	1400	7.60	8.80	9.10	9.40	9.10	8.60	5.30	10.00	4.00	;
809	600	7.40	8.60	7.80	8.10	8.50	7.60	8.10	6.20	10.00	;
809	1500	8.00	8.80	8.80	8.80	9.40	8.80	7.50	8.00	1.00	;
855	11000	8.30	8.20	8.10	8.40	8.40	8.60	8.50	7.80	2.00	;
859	350	6.80	8.00	6.70	7.50	7.40	7.10	8.50	5.60	5.00	;
859	250	9.10	9.70	9.00	9.4	9.40	9.30	9.60	9.40	10.00	;
867	800	8.60	9.30	8.80	8.80	8.80	8.70	9.10	8.10	10.00	;
884	1000	8.00	8.70	8.10	8.30	8.20	7.90	7.70	7.10	6.00	;
886	1800	8.00	8.60	8.10	8.50	8.50	8.20	7.10	6.70	4.00	;
899	500	9.20	9.70	9.40	9.60	9.40	9.30	9.10	7.90	1.00	;
899	600	7.60	8.40	7.50	8.10	7.70	7.80	8.60	9.00	4.00	;
899	500	8.90	9.50	8.70	9.00	9.00	8.80	9.20	7.90	10.00	;
899	250	7.80	9.00	7.50	7.90	7.60	7.90	8.80	7.30	1.00	;
911	350	9.00	9.60	8.30	9.20	9.20	9.20	9.20	7.50	10.00	;
911	350	9.30	9.60	8.90	9.30	8.90	8.90	9.30	9.30	10.00	;
927	1500	5.00	5.00	8.80	6.20	7.50	6.20	6.20	5.00	10.00	;
928	50	6.00	8.50	6.20	6.80	6.50	6.70	7.50	10.00	6.00	;
938	1400	7.40	8.00	7.50	8.50	8.00	7.50	7.50	7.50	1.00	;
950	3000	6.70	7.10	6.50	6.90	6.90	6.60	7.60	5.60	3.00	;
951	7100	1.30	2.50	2.50	2.50	2.50	3.30	3.30	1.30	10.00	;
964	1000	8.50	9.00	8.80	8.80	9.00	8.80	8.80	8.50	7.00	;
971	800	7.00	8.40	7.30	7.10	7.30	7.40	8.50	8.00	10.00	;
977	7200	4.30	5.00	5.00	5.30	4.40	4.70	4.70	4.30	10.00	;
979	1200	6.70	7.60	6.90	7.10	7.20	7.00	7.30	9.30	10.00	;
989	1500	9.00	9.50	9.00	9.30	9.30	9.00	8.00	8.90	1.00	;
993	1600	8.40	8.90	8.50	8.60	8.60	7.80	7.80	6.90	2.00	;
999	800	8.50	9.10	8.50	8.50	9.00	8.60	8.60	6.20	1.00	;
999	2900	8.70	9.40	8.80	9.20	9.10	9.00	7.30	8.20	4.00	;
999	1300	7.90	8.90	7.70	7.90	7.90	8.00	6.50	7.00	6.00	;
1000	1100	8.30	9.10	7.80	8.30	8.10	8.00	8.50	7.50	2.00	;
1000	200	8.00	9.00	7.80	8.20	8.00	8.00	8.90	7.30	1.00	;
1013	800	8.70	8.30	8.60	9.10	9.10	8.60	9.10	9.40	2.00	;
1019	450	8.30	8.50	8.30	8.30	8.60	8.50	8.90	8.30	2.00	;
1019	18900	9.40	9.70	9.60	9.70	9.70	9.50	8.30	7.30	10.00	;
];

n=size(Datos);

for i=1:n(1);
     if Datos(i,11)==10;
         Datos(i,11)=1; % No reservado
     else
         Datos(i,11)=2; % Reservado
     end
end

Precio=Datos(:,1);
Distancia=Datos(:,2);
Calificacion=Datos(:,3);
Personal=Datos(:,4);	
Instalaciones=Datos(:,5);	
Limpieza=Datos(:,6);	
Confort=Datos(:,7);	
Calidad=Datos(:,8);	
Ubicacion=Datos(:,9); 	
WiFi=Datos(:,10);
Ocupacion=Datos(:,11);


%% Regresion de polinomio

sf = fit([Datos(:,1),Datos(:,2)],Datos(:,3),'poly52')
plot(sf,[Datos(:,1),Datos(:,2)],Datos(:,3))
set(gca, 'FontName','Times New Roman','fontsize', 12)
title('Precio vs Distancia vs Calificacion','FontName','Times New Roman','FontSize', 12)
xlabel('Precio','FontName','Times New Roman','FontSize', 12)
ylabel('Distancia','FontName','Times New Roman','FontSize', 12)
zlabel('Calificacion','FontName','Times New Roman','FontSize', 12)
colormap white;
[Mn,In]=min(Datos(:,3));
[Mx,Ix]=max(Datos(:,3));

%% Prepara el modelo Logit

X=[Calidad Instalaciones Limpieza];
%X=[Precio Ubicacion Limpieza];
%X=[Precio Ubicacion Calificacion];
%X=[Precio Distancia Calificacion];
%X=[Precio Personal Instalaciones Limpieza Confort Calidad Ubicacion WiFi];
%X=[Precio Distancia Calificacion Personal Instalaciones Limpieza Confort Calidad Ubicacion WiFi];
Y=Ocupacion;
[B,dev,stats] = mnrfit(X,Y);

%% Evalua la probabilidad de ocupacion de un
% alojamiento que cuesta "Precio1" MXN por noche
% con calificacion de satisfaccion de "Evaluacion1" y 
% ubicado a "Ubicacion1" m del centro
% xxx=[Precio1, Evaluacion1, Ubicacion1]

Precio1=700;
Distancia1=7200;
Calificacion1=8.4; 
Personal1=8.2; 
Instalaciones1=8.2;
Limpieza1=8.2;
Confort1=8.2;
Calidad1=8.2; 
Ubicacion1=8.2;
WiFi1=8.2;
Ubicacion1=1200;

xxx = [Precio1 Ubicacion1 Calificacion1];
%xxx = [Precio1 Distancia1 Calificacion1];
%xxx = [Precio1 Personal1 Instalaciones1 Limpieza1 Confort1 Calidad1 Ubicacion1 WiFi1];
%xxx = [Precio1 Distancia1 Calificacion1 Personal1 Instalaciones1 Limpieza1 Confort1 Calidad1 Ubicacion1 WiFi1];
pihat = mnrval(B,xxx);
pihat;

fprintf(['Para un alojamiento que cuesta %i MXN por noche, \n' ...
    'con una Calificacion de %2.1f, \n'...
    'y que esta a %i m del centro, se predice una ocupacion \n' ...
         'con probabilidad: %f\n\n'], Precio1, Calificacion1, Distancia1, pihat(2));

     
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
X=[Precio Distancia];
plotData(X, Ocupacion);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Precio')
ylabel('Distancia')

% Specified in plot order
legend('Reservado', 'No reservado')
hold off;

X=[Precio Calificacion];
plotData(X, Ocupacion);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Precio')
ylabel('Calificacion')

% Specified in plot order
legend('Reservado', 'No reservado')
hold off;

X=[Distancia Calificacion];
plotData(X, Ocupacion);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Distancia')
ylabel('Calificacion')

% Specified in plot order
legend('Reservado', 'No reservado')
hold off;


