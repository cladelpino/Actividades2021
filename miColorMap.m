function matrizC = miColorMap(concentracion,concMax)
  matrizC = horzcat((concentracion/concMax),zeros(length(concentracion),1),1-(concentracion/concMax))
endfunction