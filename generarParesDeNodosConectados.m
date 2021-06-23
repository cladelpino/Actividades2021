function pares = generarParesDeNodosConectados(lista)
  for i=1:size(lista,1)-1
    pares(i,:)=[i,i+1];
  end
endfunction