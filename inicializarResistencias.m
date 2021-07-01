function res = inicializarResistencias(pares)
  res = NaN(size(pares,1),1);
  for i=1:size(pares,1)
    if(pares(i,1)==3 && pares(i,2)==4)
      res(i)=10;
    else
      res(i)=0.1;
    end
  end
endfunction