function lista = generarMatrizUbicacionesNodos2()
  % Genera una grilla de nodos
  x=1:4;
  y=1:4;
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