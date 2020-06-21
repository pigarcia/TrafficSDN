load SimulationResults.csv

%FIGURE 3
Z = zeros(5,17);
for i = 1:270
    x = SimulationResults(i, 1);
    y = SimulationResults(i, 3);
    z = SimulationResults(i, 4);
    if y > 0
        Z(x, y) = z;
    end
end

bar3(Z)
title('FIGURA3')
xlabel('# Nodos SDN')
ylabel('% Carga de la matrix')
zlabel('%Carga MAX de los enlaces')

savefig('figure3.fig')
saveas(gcf,'figure3','epsc')