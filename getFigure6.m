load SimulationResults.csv
load SimulationResultsGeant.csv

%FIGURE 6 : NOBEL - HDF

%FIGURE 2 AXES.
fig = figure;
left_color = [0 0 1];
right_color = [1 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

idle_array = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17];

alpha_array_HDF_1 = SimulationResults(1:18, 4);
alpha_array_HDF_2 = SimulationResults(55:72, 4);
alpha_array_HDF_3 = SimulationResults(109:126, 4);
alpha_array_HDF_4 = SimulationResults(163:180, 4);
alpha_array_HDF_5 = SimulationResults(217:234, 4);

gamma_array_HDF_1 = SimulationResults(1:18, 11);
gamma_array_HDF_2 = SimulationResults(55:72, 11);
gamma_array_HDF_3 = SimulationResults(109:126, 11);
gamma_array_HDF_4 = SimulationResults(163:180, 11);
gamma_array_HDF_5 = SimulationResults(217:234, 11);

grid on
set(gca,'FontSize',20);

x=idle_array;

yyaxis left
plot(x,alpha_array_HDF_1,'-bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HDF_2,'--bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HDF_3,':bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HDF_4,'-.bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HDF_5,'-b*','LineWidth',2,'MarkerSize',10);
xlabel('idle time (s.)')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% PS','Color','r')
hold on
plot(x,gamma_array_HDF_1,'-rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HDF_2,'--rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HDF_3,':rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HDF_4,'-.rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HDF_5,'-rd','LineWidth',2,'MarkerSize',10);

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northoutside','orientation','horizontal')
hold off

savefig('figure6_Nobel_HDF.fig')
saveas(gcf,'figure6_Nobel_HDF','epsc')

%FIGURE 6 : NOBEL - HCC

%FIGURE 2 AXES.
fig = figure;
left_color = [0 0 1];
right_color = [1 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

idle_array = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17];

alpha_array_HCC_1 = SimulationResults(19:36, 4);
alpha_array_HCC_2 = SimulationResults(73:90, 4);
alpha_array_HCC_3 = SimulationResults(127:144, 4);
alpha_array_HCC_4 = SimulationResults(181:198, 4);
alpha_array_HCC_5 = SimulationResults(235:252, 4);

gamma_array_HCC_1 = SimulationResults(19:36, 11);
gamma_array_HCC_2 = SimulationResults(73:90, 11);
gamma_array_HCC_3 = SimulationResults(127:144, 11);
gamma_array_HCC_4 = SimulationResults(181:198, 11);
gamma_array_HCC_5 = SimulationResults(235:252, 11);

grid on
set(gca,'FontSize',20);

x=idle_array;

yyaxis left
plot(x,alpha_array_HCC_1,'-bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HCC_2,'--bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HCC_3,':bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HCC_4,'-.bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HCC_5,'-b*','LineWidth',2,'MarkerSize',10);
xlabel('idle time (s.)')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% PS','Color','r')
hold on
plot(x,gamma_array_HCC_1,'-rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HCC_2,'--rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HCC_3,':rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HCC_4,'-.rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HCC_5,'-rd','LineWidth',2,'MarkerSize',10);

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northoutside','orientation','horizontal')
hold off

savefig('figure6_Nobel_HCC.fig')
saveas(gcf,'figure6_Nobel_HCC','epsc')


%FIGURE 6 : NOBEL - HBC

%FIGURE 2 AXES.
fig = figure;
left_color = [0 0 1];
right_color = [1 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

idle_array = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17];

alpha_array_HBC_1 = SimulationResults(37:54, 4);
alpha_array_HBC_2 = SimulationResults(91:108, 4);
alpha_array_HBC_3 = SimulationResults(145:162, 4);
alpha_array_HBC_4 = SimulationResults(199:216, 4);
alpha_array_HBC_5 = SimulationResults(253:270, 4);

gamma_array_HBC_1 = SimulationResults(37:54, 11);
gamma_array_HBC_2 = SimulationResults(91:108, 11);
gamma_array_HBC_3 = SimulationResults(145:162, 11);
gamma_array_HBC_4 = SimulationResults(199:216, 11);
gamma_array_HBC_5 = SimulationResults(253:270, 11);

grid on
set(gca,'FontSize',20);

x=idle_array;

yyaxis left
plot(x,alpha_array_HBC_1,'-bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HBC_2,'--bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HBC_3,':bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HBC_4,'-.bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HBC_5,'-b*','LineWidth',2,'MarkerSize',10);
xlabel('idle time (s.)')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% PS','Color','r')
hold on
plot(x,gamma_array_HBC_1,'-rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HBC_2,'--rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HBC_3,':rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HBC_4,'-.rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HBC_5,'-rd','LineWidth',2,'MarkerSize',10);

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northoutside','orientation','horizontal')
hold off

savefig('figure6_Nobel_HBC.fig')
saveas(gcf,'figure6_Nobel_HBC','epsc')

%=================================================================================

%FIGURE 6 : GEANT - HDF

%FIGURE 2 AXES.
fig = figure;
left_color = [0 0 1];
right_color = [1 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

idle_array = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22];

alpha_array_HDF_1 = SimulationResultsGeant(1:23, 4);
alpha_array_HDF_2 = SimulationResultsGeant(70:92, 4);
alpha_array_HDF_3 = SimulationResultsGeant(139:161, 4);
alpha_array_HDF_4 = SimulationResultsGeant(208:230, 4);
alpha_array_HDF_5 = SimulationResultsGeant(277:299, 4);

gamma_array_HDF_1 = SimulationResultsGeant(1:23, 11);
gamma_array_HDF_2 = SimulationResultsGeant(70:92, 11);
gamma_array_HDF_3 = SimulationResultsGeant(139:161, 11);
gamma_array_HDF_4 = SimulationResultsGeant(208:230, 11);
gamma_array_HDF_5 = SimulationResultsGeant(277:299, 11);

grid on
set(gca,'FontSize',20);

x=idle_array;

yyaxis left
plot(x,alpha_array_HDF_1,'-bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HDF_2,'--bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HDF_3,':bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HDF_4,'-.bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HDF_5,'-b*','LineWidth',2,'MarkerSize',10);
xlabel('idle time (s.)')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% PS','Color','r')
hold on
plot(x,gamma_array_HDF_1,'-rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HDF_2,'--rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HDF_3,':rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HDF_4,'-.rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HDF_5,'-rd','LineWidth',2,'MarkerSize',10);

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northoutside','orientation','horizontal')
hold off
savefig('figure6_Geant_HDF.fig')
saveas(gcf,'figure6_Geant_HDF','epsc')


%FIGURE 6 : GEANT - HCC

%FIGURE 2 AXES.
fig = figure;
left_color = [0 0 1];
right_color = [1 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

idle_array = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22];

alpha_array_HCC_1 = SimulationResultsGeant(24:46, 4);
alpha_array_HCC_2 = SimulationResultsGeant(93:115, 4);
alpha_array_HCC_3 = SimulationResultsGeant(162:184, 4);
alpha_array_HCC_4 = SimulationResultsGeant(231:253, 4);
alpha_array_HCC_5 = SimulationResultsGeant(300:322, 4);

gamma_array_HCC_1 = SimulationResultsGeant(24:46, 11);
gamma_array_HCC_2 = SimulationResultsGeant(93:115, 11);
gamma_array_HCC_3 = SimulationResultsGeant(162:184, 11);
gamma_array_HCC_4 = SimulationResultsGeant(231:253, 11);
gamma_array_HCC_5 = SimulationResultsGeant(300:322, 11);

grid on
set(gca,'FontSize',20);

x=idle_array;

yyaxis left
plot(x,alpha_array_HCC_1,'-bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HCC_2,'--bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HCC_3,':bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HCC_4,'-.bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HCC_5,'-b*','LineWidth',2,'MarkerSize',10);
xlabel('idle time (s.)')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% PS','Color','r')
hold on
plot(x,gamma_array_HCC_1,'-rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HCC_2,'--rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HCC_3,':rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HCC_4,'-.rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HCC_5,'-rd','LineWidth',2,'MarkerSize',10);

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northoutside','orientation','horizontal')
hold off
savefig('figure6_Geant_HCC.fig')
saveas(gcf,'figure6_Geant_HCC','epsc')

%FIGURE 6 : GEANT - HBC

%FIGURE 2 AXES.
fig = figure;
left_color = [0 0 1];
right_color = [1 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);

idle_array = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22];

alpha_array_HBC_1 = SimulationResultsGeant(47:69, 4);
alpha_array_HBC_2 = SimulationResultsGeant(116:138, 4);
alpha_array_HBC_3 = SimulationResultsGeant(185:207, 4);
alpha_array_HBC_4 = SimulationResultsGeant(254:276, 4);
alpha_array_HBC_5 = SimulationResultsGeant(323:345, 4);

gamma_array_HBC_1 = SimulationResultsGeant(47:69, 11);
gamma_array_HBC_2 = SimulationResultsGeant(116:138, 11);
gamma_array_HBC_3 = SimulationResultsGeant(185:207, 11);
gamma_array_HBC_4 = SimulationResultsGeant(254:276, 11);
gamma_array_HBC_5 = SimulationResultsGeant(323:345, 11);

grid on
set(gca,'FontSize',20);

x=idle_array;

yyaxis left
plot(x,alpha_array_HBC_1,'-bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HBC_2,'--bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HBC_3,':bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HBC_4,'-.bo','LineWidth',2,'MarkerSize',10);
hold on
plot(x,alpha_array_HBC_5,'-b*','LineWidth',2,'MarkerSize',10);
xlabel('idle time (s.)')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% PS','Color','r')
hold on
plot(x,gamma_array_HBC_1,'-rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HBC_2,'--rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HBC_3,':rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HBC_4,'-.rs','LineWidth',2,'MarkerSize',10);
hold on
plot(x,gamma_array_HBC_5,'-rd','LineWidth',2,'MarkerSize',10);

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northoutside','orientation','horizontal')
hold off
savefig('figure6_Geant_HBC.fig')
saveas(gcf,'figure6_Geant_HBC','epsc')

