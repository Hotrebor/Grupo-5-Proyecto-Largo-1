function [] = Rampa(limup,limdown)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%D = 12;
%F = 6; 'samples_dec_condicionado.txt'


data_out = fopen('rampa.txt', 'w' );

data = limdown:.1:limup;

for i=1:((-limdown+limup)/(0.1))
    fprintf(data_out,'%f\n',data(i));  
end


fclose(data_out);
end
