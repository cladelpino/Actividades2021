function pares = generarParesDeNodosConectados(matrizUbicacionesNodos)
  % Deben proveer una implementación de esta funcion, llenando la variable "pares" con una matriz de p filas y 2 columnas.
  % Cada una de sus filas, representa un par de nodos que está conectado.
  % Los nodos se representan por su índice dentro de las matrices generadas en las funciones anteriores.
  % Recibe como argumento la matriz de ubicaciones para poder indicar las conexiones en función de ello.
  
  % Este ejemplo conecta cada nodo con el próximo.
  for i=1:size(matrizUbicacionesNodos,1)-1
    pares(i,:)=[i,i+1];
  end
endfunction