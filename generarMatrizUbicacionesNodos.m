function lista = generarMatrizUbicacionesNodos()
       % Genera una linea de nodos ubicados a lo largo de la recta y = x
       vectorFila = 1:5
       vectorColumna = transpose(vectorFila);
       lista = [vectorColumna , vectorColumna];
endfunction