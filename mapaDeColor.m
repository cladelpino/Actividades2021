function salida = mapaDeColor(vector,minRef,maxRef)
% salida debe ser una matriz de kx3 donde k es el número de elementos en el argumento de entrada vector, con las componentes entre 0 y 1 de R G B en cada una de las columnas respectivas.
% ej
salida = ones(length(vector),3);
deltaRef = maxRef - minRef;
for i=1:length(vector)
    val = vector(i);
    if val < (minRef + deltaRef/4)
        salida(i,1) = 0;
        salida(i,2) = 4 * (val-minRef)/deltaRef;
    elseif val < (minRef + deltaRef/2)
        salida(i,1) = 0;
        salida(i,3) = 1 + 4  * (minRef + 0.25 * deltaRef - val) / deltaRef;
    elseif val < (minRef + 0.75*deltaRef)
        salida(i,1) = 4 * (val - minRef - deltaRef/2)/deltaRef;
        salida(i,3) = 0;
    else
        salida(i,2) = 1 + 4 * (minRef + 0.75 * deltaRef - val) / deltaRef;
        salida(i,3) = 0;
    end
end