function conc = inicializarValorPropiedad(matrizUbicacionesNodos)
       % Deben proveer una implementación de esta funcion, llenando la variable "propVector" con un vector de k filas.
       % Cada fila representa el valor inicial de cada nodo.
       % Para implementar que el valor de sea función de la posición del nodo, o detectar algún nodo especial,
       % recibe como argumento la matrizUbicacionesNodos que se genera a partir de la función anterior.
       
       % Este ejemplo establece el valor de 0.1 para todos los nodos, excepto para el primero, para el cual se establece un valor de 2.
       conc = 0.1*ones(size(matrizUbicacionesNodos,1),1);
       conc(1) = 2;
endfunction