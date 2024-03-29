function lista = generarMatrizUbicacionesNodos()
  % Deben proveer una implementación de esta funcion, llenando la variable "lista" con una matriz de k filas y 2 columnas.
  % Cada una de sus filas representa un nodo del sistema.
  % La primera columna representa la coordenada en X del nodo, y la segunda columna representa la coordenada en Y del nodo.
  % La cantidad de nodos y sus coordenadas debe determinarse dentro de la función.
  
  % Este ejemplo genera una grilla de nodos
  x=1:2;
  y=1:3;
  lista=zeros(length(x)*length(y),2);
  k=1;
  for i=1:length(x)
    for j=1:length(y)
      lista(k,1)=x(i);
      lista(k,2)=y(j);
      k=k+1;
    endfor
  endfor
endfunction