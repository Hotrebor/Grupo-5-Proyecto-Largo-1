%Definición de constantes
F1 = 22.05e3; %mitad de la frecuencia de muestreo
F2 = 2*F1; %frecuencia de muestreo: 44,1 kHz
lim_sup_T = 100; %entre mayor sea el número, más ondas se ven en el gráfico
T = (0:(1/F2):(lim_sup_T*(1/F1))); %período de muestreo, inicia en cero, cambia cada 22,6757 us                                                       
frec_prueba = 1000; %se modifica esta frecuencia para comprobar el funcionamiento de distintos los filtros

%Señal senoidal de entrada (resultado en radianes)
signal = sin(2*pi*frec_prueba*T);
rampa = 0.001*T;

%Descripción de los filtros:
frec_bajas = filtro(rampa,-1.96,0.9605,199e-6,397.9e-6,199e-6);
frec_medias = filtro(filtro(signal,-1.96,0.9605,1,-2,1),-1.035,0.3678,0.08316,0.1663,0.08316);
frec_altas = filtro(filtro(signal,-1.035,0.3678,0.6007,-1.201,0.6007),1.591,0.6617,0.8132,1.626,0.8132);

%Graficación

%Banda Baja
ax1 = subplot(3,1,1);
plot(T,frec_bajas);
title('Filtro Banda-Baja');
xlabel('Tiempo(s)');
grid(ax1,'on')

%Banda Media
ax2 = subplot(3,1,2);
plot(T,frec_medias);
title('Filtro Banda-Media');
xlabel('Tiempo(s)');
grid(ax2,'on')

%Banada Alta
ax3 = subplot(3,1,3);
plot(T,frec_altas);
title('Filtro Banda-Alta');
xlabel('Tiempo(s)');
grid(ax3,'on')

datacursormode on

%Generación de estímulos para filtros
output = fopen('Estimulos_filtros.txt','wt');
for i=1:length(signal)
    fprintf(output, '%s \n',dec2bin(signal(i)));
end

fclose(output);
    



