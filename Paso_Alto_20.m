% Filtro paso alto
% Frecuencia de corte igual a 20Hz
function Salida = Paso_Alto_20(Entrada)
fNMenos1 = 0;
fNMenos2 = 0;

a1 = 1.996;
a2 = -0.996;
b0 = 0.998;
b1 = -1.996;
b2 = 0.998;

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
