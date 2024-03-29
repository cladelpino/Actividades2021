function res = inicializarResistencias(paresDeNodos,matrizUbicacionesNodos)
  % Deben proveer una implementación de esta funcion, llenando la variable "res" con un vector de p filas.
  % Cada fila representa un par de nodos conectado, de acuerdo a la fila de dicho par en la matriz de pares de nodos generada en la función anterior.
  % El valor de la función se considera la resistencia a la transferencia en dicho par de nodos.
  % Recibe como argumento las matrices que hayan generado las funciones anteriores.

  % Este ejemplo establece el valor de todas las resistencias en 0.1, 
  % Excepto por, si existe, la conexión entre el nodo 3 y el 4, para la cual establece un valor de 10.
  res = NaN(size(paresDeNodos,1),1);
  for i=1:size(paresDeNodos,1)
    if(paresDeNodos(i,1)==3 && paresDeNodos(i,2)==4)
      res(i)=10;
    else
      res(i)=0.1;
    end
  end
endfunction