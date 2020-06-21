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
    xlabel('# Nodos SDN')
    ylabel('% Carga máxima de la matrix')
    zlabel('% Ahorro')
    
    savefig('figure4.fig')
    saveas(gcf,'figure4','epsc')
