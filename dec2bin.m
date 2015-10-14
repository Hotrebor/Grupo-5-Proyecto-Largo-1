function resultado = dec2bin(dec)
a = fi(dec,1,25,14); %25 bits totales; 1 bit signo; 10 bit parte entera, 14 bits parte fraccionaria
resultado = bin(a);
end





