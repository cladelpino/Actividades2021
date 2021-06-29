close all;
clear all;

tiempoFinal = 2100;
coeficiente = 0.08;
mostrarValores = true;
tiempoPausa = 0.01; 

t = TableroQuimico();
for i = 1:tiempoFinal
  t.concentracion = difundirQuimico(t,coeficiente);
  if mostrarValores
    disp("==============");
    disp("Paso")
    disp(i);
    disp("==============");
    disp(t.concentracion);
    disp("\\\\\\");
  end
  actualizarGrafico(t);
  pause(tiempoPausa);
endfor