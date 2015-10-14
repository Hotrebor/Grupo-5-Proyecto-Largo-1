
T = (0:1/44.1e3:1000*1/44.1e3); %Muestreo a 1/44.1kHz

f1=2.*pi.*(150./100000); %frecuencia a 150Hz
f2=2.*pi.*(1000./100000); %frecuencia a 1kHz
f3=2.*pi.*(10000./100000); %frecuencia a 10kHz

%Señales de estímulo (resultado en radianes)
signal = 0.001*sin(f1*T);
rampa = 22.2*T;

load resp_dec.txt


%Descripción de los filtros:
%ideal = filtro(rampa,-1.96,0.9605,0.000199,0.0003979,0.000199); %pasabajas 200
%ideal1 = filtro(rampa,-1.035,0.3678,0.08316,0.1663,0.08316); %pasabajas 5k
%ideal2 = filtro(rampa,1.591,0.6617,0.8132,1.626,0.8132); %pasabajas 20k
ideal = filtro(rampa,-1.96,0.996,0.998,-1.996,0.998); %pasoalto 20

%Graficación

%Banda Baja
%ax1 = subplot(3,1,1);
%plot(T(1:15),ideal1(1:15),'k',T(1:15),resp_dec(1:15),'r');
plot(T,ideal,'b',T,resp_dec,'r',T,rampa,'k');
title('Filtro Paso Alto 20Hz');
xlabel('Tiempo(s)');
%grid(ax1,'on')


datacursormode on

%Generación de estímulos para filtros reales

output = fopen('estimulac_bin.txt','wt');

for i=1:length(rampa)
    fprintf(output,'%s\n',dec2bin(rampa(i)));
end

fclose(output);
    



