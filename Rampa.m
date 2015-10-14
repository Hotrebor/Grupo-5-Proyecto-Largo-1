function [] = Rampa(limdat,ini)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%D = 12;
%F = 6; 'samples_dec_condicionado.txt'


data_out = fopen('rampa.txt', 'w' );
T= 0:(1/44100) :(1/44100)*limdat;
fun= T*0.5+ini;

for i=1:limdat
    fprintf(data_out,'%s\n',bin(fi(fun(i), 1, 25,14)));
end


fclose(data_out);
end
