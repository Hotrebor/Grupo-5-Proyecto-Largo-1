CONV_BIN_DEC('ResFiltro200Bajas.txt',1000,25,11);
Y = fopen('DatosResultantesFiltro200bajas.txt', 'r' );
data1 = fscanf(Y, '%f', [1000])';


W = fopen('RampaBin.txt', 'r' );
data2 = fscanf(W, '%f', [1000])';
pf = filtro(data2,-1.96,0.9605,199e-6,397.9e-6,199e-6);



T= 0:(1/44100) :(1/44100)*999;
plot(T,data1,T,pf,T,data2);
title('Filtro PasoBajo 200 Hz');
xlabel('Tiempo(s)');