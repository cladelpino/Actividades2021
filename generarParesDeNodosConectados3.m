function pares = generarParesDeNodosConectados3(matrizUbicacionesNodos)
  % Deben proveer una implementación de esta funcion, llenando la variable "pares" con una matriz de p filas y 2 columnas.
  % Cada una de sus filas, representa un par de nodos que está conectado.
  % Los nodos se representan por su índice dentro de las matrices generadas en las funciones anteriores.
  % Recibe como argumento la matriz de ubicaciones para poder indicar las conexiones en función de ello.

    nNodos = size(matrizUbicacionesNodos,1);
    pares = NaN(nNodos,2);
    % Este ejemplo es un algoritmo que conecta todos los nodos entre sí
    k = 1;
    for i=1:nNodos
    for j=1:i
        pares(k,:) = [i,j];
        k = k + 1;
    end
    end

endfunction