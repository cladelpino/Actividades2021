classdef TableroQuimico
  properties
    listaUbicacionesNodos;
    concentracion;
    maxConc;
    paresDeNodos;
    resistencias;
    handlePlot;
  endproperties
    
  methods
    
    function actualizarGrafico(obj)
##          disp(get(obj.handlePlot,'cdata'));
##          disp(obj.concentracion);
          set(obj.handlePlot,'cdata',miPropioMapa(obj.concentracion,obj.maxConc));
    end
    
    function obtenerIndiceNodo(coordenadas)
        % Esta funcion devuelve el índice de un nodo cuyas coordenadas correspondan con
        % un vector de coordenadas que recibe como argumento, si hay alguno.
    end
    
    function obtenerNodoMasCercano(coordenadas)
       % Esta funcion devuelve el índice de un nodo que es el más cercano a 
       % un vector de coordenadas que recibe como argumento.
    end
    
    function agregarQuimico(cantidad,nodo)
      concentracion(nodo) = concentracion(nodo) + cantidad;
    endfunction
    
    function t = TableroQuimico(cantidadNodos)
      
      % Cada nodo tiene asociada una ubicación.
      % listaUbicacionesNodos es entonces una matriz de k x d
      % Donde k es la cantidad de nodos y d es la cantidad de dimensiones del sistema de coordenadas.
      t.listaUbicacionesNodos = generarListaUbicacionesNodos(cantidadNodos);
      
      % concentracion es un vector de k elementos, que contiene la concentracion de cada uno de los nodos.
      t.concentracion = inicializarConcentracion(t.listaUbicacionesNodos);
      
      % paresDeNodos es una matriz de p x 2, donde cada fila corresponde a un par de nodos conectados
      % y las columnas son los índices de dichos nodos.
      t.paresDeNodos = generarParesDeNodosConectados(t.listaUbicacionesNodos);

      % resistencias es un vector de p elementos, que contiene la resistencia a la transferencia para cada
      % par de nodos.     
      t.resistencias = inicializarResistencias(t.paresDeNodos);
      t.maxConc = max(t.concentracion);
      if size(t.listaUbicacionesNodos,2)~=2
          error("La lista de ubicaciones de nodos generada por la función generarListaUbicacionesNodos no tiene 2 columnas, como debe tener");
      end
      disp(miColorMap(t.concentracion,t.maxConc));
      figure;
      t.handlePlot = scatter(t.listaUbicacionesNodos(:,1),t.listaUbicacionesNodos(:,2),300,miPropioMapa(obj.concentracion,obj.maxConc),"filled");
      
    endfunction
    endmethods
endclassdef