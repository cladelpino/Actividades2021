close all;
clear all;

t = TableroQuimico(10);

for i = 1:2100
  t.concentracion = difundirQuimico(t,0.08);
  disp("==============");
  disp(i);
  disp("==============");
  disp(t.concentracion);
  disp("\\\\\\");
  actualizarGrafico(t);
  pause(0.01);
endfor
