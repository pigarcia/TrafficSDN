load SimulationResults.csv
    
%FIGURE TYPE 4
Z = zeros(5,17);
for i = 1:270
    x = SimulationResults(i, 1);
    y = SimulationResults(i, 3) + 1;
    offNodes = SimulationResults(i, 11);
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
    
    savefig('figures/figure4.fig')
    saveas(gcf,'figures/figure4','epsc')
