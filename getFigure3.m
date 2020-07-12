load SimulationResults.csv

%FIGURE TYPE 3
Z = zeros(5,17);
for i = 1:270
    x = SimulationResults(i, 1);
    y = SimulationResults(i, 3) + 1;
    z = SimulationResults(i, 4);
    Z(x, y) = z;
end

bar3(Z)
xlabel('# Nodos SDN')
ylabel('% Carga de la matriz')
zlabel('%Carga MAX de los enlaces')

xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18])
xticklabels({ '0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})

savefig('figures/figure3.fig')
saveas(gcf,'figures/figure3','epsc')