function res = inicializarResistencias3(paresDeNodos,matrizUbicacionesNodos)
  % Deben proveer una implementación de esta funcion, llenando la variable "res" con un vector de p filas.
  % Cada fila representa un par de nodos conectado, de acuerdo a la fila de dicho par en la matriz de pares de nodos generada en la función anterior.
  % El valor de la función se considera la resistencia a la transferencia en dicho par de nodos.
  % Recibe como argumento las matrices que hayan generado las funciones anteriores.

  % Este ejemplo establece el valor de todas las resistencias en 1.
  res = ones(size(paresDeNodos,1),1);

  % Aquí pueden implementar su función ...

endfunction