function [] = CONV_DEC_BIN(AN,n,D,F)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%D = 12;
%F = 6; 'samples_dec_condicionado.txt'

Muestras = fopen(AN, 'r' );
data_out = fopen('DatosResultantes.txt', 'w' );

data = fscanf(Muestras, '%f',n)';
fclose(Muestras);

for i=1:n
    fprintf(data_out,'%s\n',bin(fi(data(i), 1, D,F)));  
end


fclose(data_out);
end

