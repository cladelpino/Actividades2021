close all;
clear all;

tiempoFinal = 2100;
coeficiente = 1/200;
mostrarValores = false;
tiempoPausa = 1/100;

t = TableroQuimico();
for i = 1:tiempoFinal
  t.nowTime = i;
  [t.concentracion,t.transferencia] = difundirQuimico(t,coeficiente);
  if mostrarValores
    disp("==============");
    disp("Paso")
    disp(t.nowTime);
    disp("==============");
    disp(t.concentracion);
    disp("\\\\\\");
  end
  actualizarGrafico(t);
  pause(tiempoPausa);
endfor