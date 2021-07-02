function lista = generarMatrizUbicacionesNodos2()
  % Deben proveer una implementación de esta funcion, llenando la variable "lista" con una matriz de k filas y 2 columnas.
  % Cada una de sus filas representa un nodo del sistema.
  % La primera columna representa la coordenada en X del nodo, y la segunda columna representa la coordenada en Y del nodo.
  % La cantidad de nodos y sus coordenadas debe determinarse dentro de la función.
  
  % Este ejemplo genera una columna de nodos
  x = ones(5,1);
  y = transpose(1:5);
  lista = [x,y];
endfunction