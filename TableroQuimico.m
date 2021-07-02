classdef TableroQuimico
  properties
    nowTime;
    listaUbicacionesNodos;
    concentracion;
    transferencia;
    maxConc;
    minConc;
    paresDeNodos;
    resistencias;
    figureHandle;
    handlePlot;
    linePlotHandles;
    edgesTextHandle;
    nodesTextHandle;
    timeLabelHandle;
    baseLineWidth;
    addLineWidth;
    baseNodeSize;
    addNodeSize;
    labelOffset;
  endproperties

  methods
    function actualizarGrafico(obj)
      try
          maxTran = max(abs(obj.transferencia));
          currEdgeLabels = get(obj.edgesTextHandle,'string');
          for i=1:size(currEdgeLabels,1)
            currCell = currEdgeLabels{i};
            currCell{3,1} = ['Transmisión: ',num2str(obj.transferencia(i))];
            set(obj.edgesTextHandle(i),'string',currCell);
            set(obj.linePlotHandles{i},'linewidth',obj.baseLineWidth+abs(obj.transferencia(i)/maxTran)*obj.addLineWidth);
          end
          currNodeLabels = get(obj.nodesTextHandle,'string');
          for i=1:size(currNodeLabels,1)
            currCell = currNodeLabels{i};
            currCell{2,1} = ['Valor: ',num2str(obj.concentracion(i))];
            set(obj.nodesTextHandle(i),'string',currCell);
          end
          nodesC = mapaDeColor(obj.concentracion,obj.minConc,obj.maxConc);
          %nodesC = obj.concentracion;
          set(obj.handlePlot,'cdata',nodesC);
          set(obj.handlePlot,'sizedata',obj.baseNodeSize + obj.addNodeSize*(obj.concentracion/obj.maxConc));
          set(obj.timeLabelHandle,'string',['Tiempo: ',num2str(obj.nowTime)]);
      catch
        error('No existe más el gráfico');
      end
    end
    
    function obtenerIndiceNodo(coordenadas)
        % Esta funcion devuelve el �ndice de un nodo cuyas coordenadas correspondan con
        % un vector de coordenadas que recibe como argumento, si hay alguno.
    end
    
    function obtenerNodoMasCercano(coordenadas)
       % Esta funcion devuelve el �ndice de un nodo que es el m�s cercano a 
       % un vector de coordenadas que recibe como argumento.
    end
    
    function agregarQuimico(cantidad,nodo)
      concentracion(nodo) = concentracion(nodo) + cantidad;
    endfunction
    
    function t = TableroQuimico()
      t.nowTime = 0;
      % Cada nodo tiene asociada una ubicaci�n.
      % listaUbicacionesNodos es entonces una matriz de k x d
      % Donde k es la cantidad de nodos y d es la cantidad de dimensiones del sistema de coordenadas.
      
      t.listaUbicacionesNodos = generarMatrizUbicacionesNodos();
      % t.listaUbicacionesNodos = generarMatrizUbicacionesNodos2();
      % t.listaUbicacionesNodos = generarMatrizUbicacionesNodos3();
      
      % concentracion es un vector de k elementos, que contiene la concentracion de cada uno de los nodos.
      t.concentracion = inicializarValorPropiedad(t.listaUbicacionesNodos);
      % t.concentracion = inicializarValorPropiedad2(t.listaUbicacionesNodos);
      % t.concentracion = inicializarValorPropiedad3(t.listaUbicacionesNodos);
      
      % paresDeNodos es una matriz de p x 2, donde cada fila corresponde a un par de nodos conectados
      % y las columnas son los �ndices de dichos nodos.
      %t.paresDeNodos = generarParesDeNodosConectados(t.listaUbicacionesNodos);
      % t.paresDeNodos = generarParesDeNodosConectados2(t.listaUbicacionesNodos);
      t.paresDeNodos = generarParesDeNodosConectados3(t.listaUbicacionesNodos);

      % resistencias es un vector de p elementos, que contiene la resistencia a la transferencia para cada
      % par de nodos.
      t.resistencias = inicializarResistencias(t.paresDeNodos,t.listaUbicacionesNodos);
      % t.resistencias = inicializarResistencias2(t.paresDeNodos,t.listaUbicacionesNodos);
      % t.resistencias = inicializarResistencias3(t.paresDeNodos,t.listaUbicacionesNodos);

      t.maxConc = max(t.concentracion);
      t.minConc = min(t.concentracion);
      if size(t.listaUbicacionesNodos,2)~=2
          error("La matriz de ubicaciones de nodos generada por la funci�n generarMatrizUbicacionesNodos no tiene 2 columnas, como debe tener");
      end
      t.figureHandle = figure(1,'position',[0,0,1200,600]);
      axis off;
      hold on;
      t.baseLineWidth = 1;
      t.addLineWidth = 10;
      t.baseNodeSize = 100;
      t.addNodeSize = 1000;
      t.labelOffset = 0.01;
      xEdgeLabels = NaN(size(t.paresDeNodos,1),1);
      yEdgeLabels = NaN(size(t.paresDeNodos,1),1);
      edgeLabels = cell(size(t.paresDeNodos,1),1);
      t.linePlotHandles = cell(size(t.paresDeNodos,1));
      for i=1:size(t.paresDeNodos,1)
        xLineas = [t.listaUbicacionesNodos(t.paresDeNodos(i,1),1);t.listaUbicacionesNodos(t.paresDeNodos(i,2),1)];
        yLineas =[t.listaUbicacionesNodos(t.paresDeNodos(i,1),2);t.listaUbicacionesNodos(t.paresDeNodos(i,2),2)];
        t.linePlotHandles{i} = plot(xLineas,yLineas,'b');
        xEdgeLabels(i) = mean(xLineas)+t.labelOffset;
        yEdgeLabels(i) = mean(yLineas)+t.labelOffset;
        edgeLabels{i} = {['Par (',num2str(t.paresDeNodos(i,1)),',',num2str(t.paresDeNodos(i,2)),')'];
                         ['Resistencia: ',num2str(t.resistencias(i))];'Transmisión: 0'};
      end
      t.edgesTextHandle = text(xEdgeLabels,yEdgeLabels,edgeLabels);
      nodesSize = t.baseNodeSize + t.addNodeSize*(t.concentracion / t.maxConc);
      nodesColor = mapaDeColor(t.concentracion,t.minConc,t.maxConc);
      %nodesColor = t.concentracion;
      t.handlePlot = scatter(t.listaUbicacionesNodos(:,1),t.listaUbicacionesNodos(:,2),nodesSize,nodesColor,"filled");
      nodeLabels = cell(size(t.listaUbicacionesNodos,1),1);
      for i=1:size(t.listaUbicacionesNodos,1)
        nodeLabels{i} = {['Nodo: ',num2str(i),' en ',num2str(t.listaUbicacionesNodos(i,1)),' , ',num2str(t.listaUbicacionesNodos(i,2))],['Valor: ',num2str(t.concentracion(i))]};
      end
      disp(nodeLabels);
      t.nodesTextHandle = text(t.listaUbicacionesNodos(:,1)+t.labelOffset,t.listaUbicacionesNodos(:,2)+t.labelOffset,nodeLabels);
      t.timeLabelHandle = text(1,max(t.listaUbicacionesNodos(:,2)+t.labelOffset)+5*t.labelOffset,['Tiempo: ',num2str(0)]);
      hold off;
    endfunction
    endmethods
endclassdef