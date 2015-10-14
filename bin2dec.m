function [dec] = bin2dec(binary)
q = quantizer([49 28]);
dec = bin2num(q,binary);