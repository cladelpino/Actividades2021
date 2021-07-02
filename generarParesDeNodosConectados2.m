function pares = generarParesDeNodosConectados2(matrizUbicacionesNodos)
  % Deben proveer una implementación de esta funcion, llenando la variable "pares" con una matriz de p filas y 2 columnas.
  % Cada una de sus filas, representa un par de nodos que está conectado.
  % Los nodos se representan por su índice dentro de las matrices generadas en las funciones anteriores.
  % Recibe como argumento la matriz de ubicaciones para poder indicar las conexiones en función de ello.
  
  % Este ejemplo es un algoritmo que conecta una grilla de nodos de tamaño prefijado, 
  % que debe coincidir con la generada en el archivo generarMatrizUbicacionesNodos.
  %n columnas
  n=2;
  %m filas
  m=3;
  k=1;
  l=1;
  for i=1:n
    for j=1:m
      if i<n
       if j<m
          pares(k,:)=[l,l+1];
          pares(k+1,:)=[l,l+m];
          k=k+2;
          l=l+1;
      else
          pares(k,:)=[l,l+m];
          k=k+1;
          l=l+1;
      endif
    else
      if j<m
          pares(k,:)=[l,l+1];
          k=k+1;
          l=l+1;
      endif
      endif
    endfor
  endfor
  endfunction