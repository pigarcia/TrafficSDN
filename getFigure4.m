load SimulationResults.csv
    
%FIGURE 4
Z = zeros(5,17);
for i = 1:270
    x = SimulationResults(i, 1);
    y = SimulationResults(i, 3);
    offNodes = SimulationResults(i, 11);
    z = offNodes/17;
    z = z * 100;
    if y > 0
        Z(x, y) = z;
    end
end
    bar3(Z)
    title('FIGURA4')
    xlabel('# Nodos SDN')
    ylabel('% Carga de la matrix')
    zlabel('% Ahorro')
