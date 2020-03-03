load SimulationResults.csv

%FIGURE 2 
x = zeros(270, 1);
y = zeros(270, 1);
for fil = 1:270
    x(fil,1) = fil;
    offNodes = SimulationResults(fil, 11);
    y(fil, 1) = (offNodes/17) * 100;
end
figure
plot(x, y)
title('FIGURA2')
xlabel('TM1 - TM5')
ylabel('% Ahorro')
