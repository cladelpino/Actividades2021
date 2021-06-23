function tasaDeTransferencia = difusionNodoAANodoB(coeficiente,resistencia,concentracionNodoA,concentracionNodoB)
    % Esta fución debe dar positivo cuando la transferencia sea del nodo A al B y negativo
    % cuando sea del B al A.
    tasaDeTransferencia = coeficiente * resistencia * (concentracionNodoA-concentracionNodoB);
end