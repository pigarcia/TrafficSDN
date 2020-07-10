load SimulationResults.csv
    
%FIGURE 4
Z = zeros(5,17);
for i = 1:270
    x = simulationResults2(i, 1);
    y = simulationResults2(i, 3) + 1;
    offNodes = simulationResults2(i, 11);
    z = offNodes/26;
    z = z * 100;
    Z(x, y) = z;
end
    
    bar3(Z)
    xlabel('# Nodos SDN')
    ylabel('% Carga máxima de la matriz')
    zlabel('% Ahorro')
    
    xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18])
    xticklabels({ '0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
    
    savefig('figure4.fig')
    saveas(gcf,'figure4','epsc')
