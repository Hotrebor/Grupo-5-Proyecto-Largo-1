function [] = Sumador(A,B,n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Muestras1 = fopen(A, 'r' );
Muestras2 = fopen(B, 'r' );
data_out = fopen('DatosResultantesSuma.txt', 'w' );
data1 = fscanf(Muestras1, '%f',n)';
data2 = fscanf(Muestras2, '%f',n)';
fclose(Muestras1);
fclose(Muestras2);

for i=1:n
   fprintf(data_out,'%f\n',(data1+data2));  
end

fclose(data_out);

end

