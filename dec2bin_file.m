format long
load estimulac_dec.txt
datos_out = fopen('estimulac_bin.txt','wt');
for i = 1:100
    y = estimulac_dec(i);
    yf = dec2bin(y);
    fprintf(datos_out,'%s\n',yf);
end
fclose(datos_out);