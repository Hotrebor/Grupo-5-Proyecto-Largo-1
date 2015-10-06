function [] = CONV_BIN_DEC(AN,n,columnas,C)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Solo funciona para 24 bits con 20 bits de parte fraccion
% 'samples_dec_condicionado.txt'

%columnas=5;%depende del numero de bits
Muestras = fopen(AN, 'r' );
data_out = fopen('DatosResultantesFiltro200bajas.txt', 'w' );
data = fscanf(Muestras, '%s', [columnas, n])';
fclose(Muestras);

DatosDEC = [];
m = 0;
for j=1:n
    m=m+1;
    num_dec=0;
    for i = 1: columnas
        num_dec = num_dec + bin2dec(data(m,i))*2^(C-i);
    end
         %%num_dec = num_dec + -10*bin2dec(data(m,1));
        num_dec = num_dec + -2048*bin2dec(data(m,1)); %%Para 25
        %%bits
      %% num_dec = num_dec + -256*bin2dec(data(m,1));
        DatosDEC = [DatosDEC, num_dec];
 
end
    
for i=1:n
    fprintf(data_out,'%f\n',DatosDEC(i));  
end


fclose(data_out);
end
