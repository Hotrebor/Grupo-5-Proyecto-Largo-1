% Filtro paso bajo
% Frecuencia de corte igual a 5kHz
function Salida = Paso_Bajo_5k(Entrada)
fNMenos1 = 0;
fNMenos2 = 0;

a1 = 1.035;
a2 = -0.3678;
b0 = 0.08316;
b1 = 0.1663;
b2 = 0.08316;

n = length(Entrada);
cero = 0; 
y = cero;
for i = 1:1:n
    f = Entrada(i) + a1*fNMenos1 + a2*fNMenos2;
    y(i) = b0*f + b1*fNMenos1 + b2*fNMenos2;
    fNMenos2 = fNMenos1;
    fNMenos1 = f;
end
 
Salida = y;