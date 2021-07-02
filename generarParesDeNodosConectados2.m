function pares = generarParesDeNodosConectados2(lista)
  %n valores en una direcci�n, por ahora 10 pero deber�a ser input
  %m valores en una direcci�n, por ahora 10 pero deber�a ser input
  n=5;
  m=5;
  %pares=zeros((n-1)*(2*m-1)+(m-1),2); si fuera muy grande y conviene prelocalizar
  k=1;
  l=1;
  for i=1:n
    for j=1:m
      if i<n
       if j<m
          pares(k,:)=[l,l+1];
          pares(k+1,:)=[l,l+m];
          k=k+2;
          l=l+1;
      else
          pares(k,:)=[l,l+m];
          k=k+1;
          l=l+1;
      endif
    else
      if j<m
          pares(k,:)=[l,l+1];
          k=k+1;
          l=l+1;
      endif
      endif
    endfor
  endfor
  endfunction