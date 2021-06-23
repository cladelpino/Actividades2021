function salida = miPropioMapa(vector)
% salida debe ser una matriz de kx3 donde k es el número de elementos en el argumento de entrada vector, con las componentes entre 0 y 1 de R G B en cada una de las columnas respectivas.
% ej
salida = horzcat(vector,zeros(length(vector),1),1-vector);
end