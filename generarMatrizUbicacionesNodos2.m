function lista = generarMatrizUbicacionesNodos2()

  x=1:10;
  y=1:10;
  lista=zeros(length(x)*length(y),2);
  k=1;
  for i=1:length(x)
    for j=1:length(y)
      lista(k,1)=x(i);
      lista(k,2)=y(j);
      k=k+1;
    endfor
  endfor
endfunction