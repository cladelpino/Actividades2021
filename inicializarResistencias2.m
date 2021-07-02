function res = inicializarResistencias2(paresDeNodos,matrizUbicacionesNodos)
  % Deben proveer una implementación de esta funcion, llenando la variable "res" con un vector de p filas.
  % Cada fila representa un par de nodos conectado, de acuerdo a la fila de dicho par en la matriz de pares de nodos generada en la función anterior.
  % El valor de la función se considera la resistencia a la transferencia en dicho par de nodos.
  % Recibe como argumento las matrices que hayan generado las funciones anteriores.

  % Este ejemplo establece el valor de las resistencias en función del promedio entre las dos coordenadas en X del par de nodos.

  maximoEnXDeNodos = max(matrizUbicacionesNodos(:,1));

  res = NaN(size(paresDeNodos,1),1);
  resistenciaBase = 0.1;
  resistenciaASumar = 100;
  for i=1:size(paresDeNodos,1)
    coordenadaXNodoA = matrizUbicacionesNodos(paresDeNodos(i,1),1);
    coordenadaXNodoB = matrizUbicacionesNodos(paresDeNodos(i,2),1);
    res(i) = resistenciaBase + resistenciaASumar * (coordenadaXNodoA+coordenadaXNodoB)/2/maximoEnXDeNodos;
  end
endfunction