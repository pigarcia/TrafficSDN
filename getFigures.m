load SimulationResults.csv

%FIGURE 1 : TM1
x = SimulationResults(1:18, 3);
y = zeros(18, 1);
for fil = 1:18
    y(fil,1) = SimulationResults(1, 4);
end
y1 = SimulationResults(1:18, 4);
y2 = SimulationResults(19:36, 4);
y3 = SimulationResults(37:54, 4);

figure
plot(x, y, x, y1, x, y2, x, y3)
title('FIGURA1: TM1')
xlabel('#Nodos SDN')
ylabel('%Carga MAX de los enlaces')



%FIGURE 1 : TM2
x = SimulationResults(55:72, 3);
y = zeros(18, 1);
for fil = 1:18
    y(fil,1) = SimulationResults(55, 4);
end
y1 = SimulationResults(55:72, 4);
y2 = SimulationResults(73:90, 4);
y3 = SimulationResults(91:108, 4);

figure
plot(x, y, x, y1, x, y2, x, y3)
title('FIGURA1: TM2')
xlabel('#Nodos SDN')
ylabel('%Carga MAX de los enlaces')



%FIGURE 1 : TM3
x = SimulationResults(109:126, 3);
y = zeros(18, 1);
for fil = 1:18
    y(fil,1) = SimulationResults(109, 4);
end
y1 = SimulationResults(109:126, 4);
y2 = SimulationResults(127:144, 4);
y3 = SimulationResults(145:162, 4);

figure
plot(x, y, x, y1, x, y2, x, y3)
title('FIGURA1: TM3')
xlabel('#Nodos SDN')
ylabel('%Carga MAX de los enlaces')



%FIGURE 1 : TM4
x = SimulationResults(163:180, 3);
y = zeros(18, 1);
for fil = 1:18
    y(fil,1) = SimulationResults(163, 4);
end
y1 = SimulationResults(163:180, 4);
y2 = SimulationResults(181:198, 4);
y3 = SimulationResults(199:216, 4);

figure
plot(x, y, x, y1, x, y2, x, y3)
title('FIGURA1: TM4')
xlabel('#Nodos SDN')
ylabel('%Carga MAX de los enlaces')



%FIGURE 1 : TM5
x = SimulationResults(217:234, 3);
y = zeros(18, 1);
for fil = 1:18
    y(fil,1) = SimulationResults(217, 4);
end
y1 = SimulationResults(217:234, 4);
y2 = SimulationResults(235:252, 4);
y3 = SimulationResults(253:270, 4);

figure
plot(x, y, x, y1, x, y2, x, y3)
title('FIGURA1: TM5')
xlabel('#Nodos SDN')
ylabel('%Carga MAX de los enlaces')



%FIGURE 2

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
    
    
%FIGURE 4

%FIGURE 5: TM1

x = SimulationResults(1:18, 3);
y1 = SimulationResults(1:18, 12);
y2 = SimulationResults(19:36, 12);
y3 = SimulationResults(37:54, 12);

figure
plot(x, y1, x, y2, x, y3)
title('FIGURA5: TM1')
xlabel('#Nodos SDN')
ylabel('Tº Cómputo medio')



%FIGURE 5 : TM2
x = SimulationResults(55:72, 3);
y1 = SimulationResults(55:72, 12);
y2 = SimulationResults(73:90, 12);
y3 = SimulationResults(91:108, 12);

figure
plot(x, y1, x, y2, x, y3)
title('FIGURA5: TM2')
xlabel('#Nodos SDN')
ylabel('Tº Cómputo medio')



%FIGURE 5 : TM3
x = SimulationResults(109:126, 3);
y1 = SimulationResults(109:126, 12);
y2 = SimulationResults(127:144, 12);
y3 = SimulationResults(145:162, 12);

figure
plot(x, y1, x, y2, x, y3)
title('FIGURA5: TM3')
xlabel('#Nodos SDN')
ylabel('Tº Cómputo medio')



%FIGURE 5 : TM4
x = SimulationResults(163:180, 3);
y1 = SimulationResults(163:180, 12);
y2 = SimulationResults(181:198, 12);
y3 = SimulationResults(199:216, 12);

figure
plot(x, y1, x, y2, x, y3)
title('FIGURA5: TM4')
xlabel('#Nodos SDN')
ylabel('Tº Cómputo medio')



%FIGURE 5 : TM5
x = SimulationResults(217:234, 3);
y1 = SimulationResults(217:234, 12);
y2 = SimulationResults(235:252, 12);
y3 = SimulationResults(253:270, 12);

figure
plot(x, y1, x, y2, x, y3)
title('FIGURA5: TM5')
xlabel('#Nodos SDN')
ylabel('Tº Cómputo medio')



%FIGURE 6
