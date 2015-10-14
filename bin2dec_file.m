q = quantizer([25 14]);
datos_in = fopen('resp_bin.txt','r');
datos_out = fopen('resp_dec.txt','wt');
intro = textscan(datos_in,'%s',1001,'Delimiter','\n');
dec = bin2num(q,intro{1});
xx=dec;
yy=cell2mat(xx);
fprintf(datos_out,'%s\n',yy);
