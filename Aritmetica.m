function [] = Aritmetica(A,B,C,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Muestras1 = fopen(A, 'r' );
Muestras2 = fopen(B, 'r' );
Muestras3 = fopen(C, 'r' );
data_out = fopen('Aritmetica_Res.txt', 'w' );
data1 = fscanf(Muestras1, '%f',n)';
data2 = fscanf(Muestras2, '%f',n)';
data3 = fscanf(Muestras3, '%f',n)';
fclose(Muestras1);
fclose(Muestras2);
fclose(Muestras3);

for i=1:n
   fprintf(data_out,'%f\n',(data1*data2)+data3);  
end

fclose(data_out);

end

