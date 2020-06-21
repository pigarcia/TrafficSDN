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
xlabel('TM1 - TM5')
ylabel('% Ahorro')

savefig('figure2.fig')
saveas(gcf,'figure2','epsc')

%FIGURE 2: TM1

x = SimulationResults(1:18, 3);
y1 = zeros(18, 1);
y2 = zeros(18, 1);
y3 = zeros(18, 1);
for fil = 1:18
    offNodes = SimulationResults(fil, 11);
    y1(fil, 1) = (offNodes/17) * 100;
end

cont=1;
for fil = 19:36
    offNodes = SimulationResults(fil, 11);
    y2(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end

cont=1;
for fil = 37:54
    offNodes = SimulationResults(fil, 11);
    y3(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end
figure
plot(x, y1, x, y2, x, y3)
xlabel('#Nodos SDN')
ylabel('%Ahorro')
legend({'HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')

savefig('figure2_TM1.fig')
saveas(gcf,'figure2_TM1','epsc')

%FIGURE 2: TM2

x = SimulationResults(1:18, 3);
y1 = zeros(18, 1);
y2 = zeros(18, 1);
y3 = zeros(18, 1);
cont=1;
for fil = 55:72
    offNodes = SimulationResults(fil, 11);
    y1(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end

cont=1;
for fil = 73:90
    offNodes = SimulationResults(fil, 11);
    y2(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end

cont=1;
for fil = 91:108
    offNodes = SimulationResults(fil, 11);
    y3(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end
figure
plot(x, y1, x, y2, x, y3)
xlabel('#Nodos SDN')
ylabel('%Ahorro')
legend({'HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')

savefig('figure2_TM2.fig')
saveas(gcf,'figure2_TM2','epsc')

%FIGURE 2: TM3

x = SimulationResults(1:18, 3);
y1 = zeros(18, 1);
y2 = zeros(18, 1);
y3 = zeros(18, 1);
cont=1;
for fil = 109:126
    offNodes = SimulationResults(fil, 11);
    y1(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end

cont=1;
for fil = 127:144
    offNodes = SimulationResults(fil, 11);
    y2(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end

cont=1;
for fil = 145:162
    offNodes = SimulationResults(fil, 11);
    y3(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end
figure
plot(x, y1, x, y2, x, y3)
xlabel('#Nodos SDN')
ylabel('%Ahorro')
legend({'HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')

savefig('figure2_TM3.fig')
saveas(gcf,'figure2_TM3','epsc')

%FIGURE 2: TM4

x = SimulationResults(1:18, 3);
y1 = zeros(18, 1);
y2 = zeros(18, 1);
y3 = zeros(18, 1);
cont=1;
for fil = 163:180
    offNodes = SimulationResults(fil, 11);
    y1(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end

cont=1;
for fil = 181:198
    offNodes = SimulationResults(fil, 11);
    y2(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end

cont=1;
for fil = 199:216
    offNodes = SimulationResults(fil, 11);
    y3(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end
figure
plot(x, y1, x, y2, x, y3)
xlabel('#Nodos SDN')
ylabel('%Ahorro')
legend({'HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')

savefig('figure2_TM4.fig')
saveas(gcf,'figure2_TM4','epsc')


%FIGURE 2: TM5

x = SimulationResults(1:18, 3);
y1 = zeros(18, 1);
y2 = zeros(18, 1);
y3 = zeros(18, 1);
cont=1;
for fil = 217:234
    offNodes = SimulationResults(fil, 11);
    y1(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end

cont=1;
for fil = 235:252
    offNodes = SimulationResults(fil, 11);
    y2(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end

cont=1;
for fil = 253:270
    offNodes = SimulationResults(fil, 11);
    y3(cont, 1) = (offNodes/17) * 100;
    cont = cont + 1;
end
figure
plot(x, y1, x, y2, x, y3)
xlabel('#Nodos SDN')
ylabel('%Ahorro')
legend({'HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')

savefig('figure2_TM5.fig')
saveas(gcf,'figure2_TM5','epsc')



