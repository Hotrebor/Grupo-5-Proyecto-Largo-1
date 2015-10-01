% Filtro paso alto
% Frecuencia de corte igual a 200Hz
function Salida = Paso_Alto_200(Entrada)
fNMenos1 = 0;
fNMenos2 = 0;

a1 = 1.96;
a2 = -0.9605;
b0 = 1;
b1 = -2;
b2 = 1;

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