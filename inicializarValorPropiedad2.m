function propVector = inicializarValorPropiedad2(matrizUbicacionesNodos)
       % Deben proveer una implementación de esta funcion, llenando la variable "propVector" con un vector de k filas.
       % Cada fila representa el valor inicial de la propiedad de cada nodo.
       % Para implementar que el valor de la propiedad sea función de la posición del nodo, o detectar algún nodo especial,
       % recibe como argumento la matrizUbicacionesNodos que se genera a partir de la función anterior.
       
       % Este ejemplo establece el valor de la propiedad en función del valor de x e y.

       maximaSumaCoordenadasDeNodos = max(sum(matrizUbicacionesNodos,2));

       propVector = NaN(size(matrizUbicacionesNodos,1),1);
       valorBase = 0.1;
       valorASumar = 10;
       for i=1:size(matrizUbicacionesNodos,1)
              coordenadaXNodo = matrizUbicacionesNodos(i,1);
              coordenadaYNodo = matrizUbicacionesNodos(i,2);
              propVector(i) = valorBase + valorASumar * (coordenadaXNodo+coordenadaYNodo)/maximaSumaCoordenadasDeNodos;
       end
endfunction