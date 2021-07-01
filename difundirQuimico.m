  function [rVal,transferencia] = difundirQuimico(obj,coeficiente)
      concentracionOriginal = obj.concentracion;
      delta = zeros(size(obj.concentracion));
      transferencia = NaN(size(obj.paresDeNodos),1);
      rVal = concentracionOriginal;
      for k = 1:size(obj.paresDeNodos,1)
        concentracionNodoA = concentracionOriginal(obj.paresDeNodos(k,1));
        concentracionNodoB = concentracionOriginal(obj.paresDeNodos(k,2));
        %disp("Calculando difusi�n");
        %disp(concentracionNodoA);
        %disp(concentracionNodoB);
        %disp(coeficiente);
        %disp(obj.resistencias(k));
        transferencia(k) = difusionNodoAANodoB(coeficiente,obj.resistencias(k),concentracionNodoA,concentracionNodoB);
        %disp(transferencia);
        %disp("Calculada Difusi�n!");

        delta(obj.paresDeNodos(k,1)) -= transferencia(k);
        delta(obj.paresDeNodos(k,2)) += transferencia(k);
        
        %disp("Proximo delta so far");
        %disp(delta);
        %disp("XXXXX");
      end
      rVal += delta;
      rVal(rVal<0) = zeros(sum(rVal<0),1);
    endfunction