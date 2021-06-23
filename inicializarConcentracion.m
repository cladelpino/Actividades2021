function conc = inicializarConcentracion(lista)
       conc = rand(size(lista,1),1);
       conc(1) = 10*conc(1);
endfunction