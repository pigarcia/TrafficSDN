load SimulationResults.csv

%FIGURE 5: TM1

x = SimulationResults(1:18, 3);
y1 = SimulationResults(1:18, 12);
y2 = SimulationResults(19:36, 12);
y3 = SimulationResults(37:54, 12);

figure
plot(x, y1, x, y2, x, y3)
xlabel('#Nodos SDN')
ylabel('Tº Cómputo medio')
legend({'HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')
savefig('figure5_TM1.fig')
saveas(gcf,'figure5_TM1','epsc')


%FIGURE 5 : TM2
x = SimulationResults(55:72, 3);
y1 = SimulationResults(55:72, 12);
y2 = SimulationResults(73:90, 12);
y3 = SimulationResults(91:108, 12);

figure
plot(x, y1, x, y2, x, y3)
xlabel('#Nodos SDN')
ylabel('Tº Cómputo medio')
legend({'HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')
savefig('figure5_TM2.fig')
saveas(gcf,'figure5_TM2','epsc')


%FIGURE 5 : TM3
x = SimulationResults(109:126, 3);
y1 = SimulationResults(109:126, 12);
y2 = SimulationResults(127:144, 12);
y3 = SimulationResults(145:162, 12);

figure
plot(x, y1, x, y2, x, y3)
xlabel('#Nodos SDN')
ylabel('Tº Cómputo medio')
legend({'HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')
savefig('figure5_TM3.fig')
saveas(gcf,'figure5_TM3','epsc')


%FIGURE 5 : TM4
x = SimulationResults(163:180, 3);
y1 = SimulationResults(163:180, 12);
y2 = SimulationResults(181:198, 12);
y3 = SimulationResults(199:216, 12);

figure
plot(x, y1, x, y2, x, y3)
xlabel('#Nodos SDN')
ylabel('Tº Cómputo medio')
legend({'HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')
savefig('figure5_TM4.fig')
saveas(gcf,'figure5_TM4','epsc')



%FIGURE 5 : TM5
x = SimulationResults(217:234, 3);
y1 = SimulationResults(217:234, 12);
y2 = SimulationResults(235:252, 12);
y3 = SimulationResults(253:270, 12);

figure
plot(x, y1, x, y2, x, y3)
xlabel('#Nodos SDN')
ylabel('Tº Cómputo medio')
legend({'HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')
savefig('figure5_TM6.fig')
saveas(gcf,'figure5_TM6','epsc')
