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

gamma_array_HDF_1 = zeros(18,1);
cont=1;
for fil = 1:18
    offNodes = SimulationResults(fil, 11);
    gamma_array_HDF_1(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HDF_2 = zeros(18,1);
cont=1;
for fil = 55:72
    offNodes = SimulationResults(fil, 11);
    gamma_array_HDF_2(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HDF_3 = zeros(18,1);
cont=1;
for fil = 109:126
    offNodes = SimulationResults(fil, 11);
    gamma_array_HDF_3(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HDF_4 = zeros(18,1);
cont=1;
for fil = 163:180
    offNodes = SimulationResults(fil, 11);
    gamma_array_HDF_4(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HDF_5 = zeros(18,1);
cont=1;
for fil = 217:234
    offNodes = SimulationResults(fil, 11);
    gamma_array_HDF_5(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

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
xlabel('#Nodos SDN')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% Ahorro','Color','r')
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

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northeastoutside','orientation','vertical')
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

gamma_array_HCC_1 = zeros(18,1);
cont=1;
for fil = 19:36
    offNodes = SimulationResults(fil, 11);
    gamma_array_HCC_1(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HCC_2 = zeros(18,1);
cont=1;
for fil = 73:90
    offNodes = SimulationResults(fil, 11);
    gamma_array_HCC_2(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HCC_3 = zeros(18,1);
cont=1;
for fil = 127:144
    offNodes = SimulationResults(fil, 11);
    gamma_array_HCC_3(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HCC_4 = zeros(18,1);
cont=1;
for fil = 181:198
    offNodes = SimulationResults(fil, 11);
    gamma_array_HCC_4(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HCC_5 = zeros(18,1);
cont=1;
for fil = 235:252
    offNodes = SimulationResults(fil, 11);
    gamma_array_HCC_5(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

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
xlabel('#Nodos SDN')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% Ahorro','Color','r')
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

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northeastoutside','orientation','vertical')
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

gamma_array_HBC_1 = zeros(18,1);
cont=1;
for fil = 37:54
    offNodes = SimulationResults(fil, 11);
    gamma_array_HBC_1(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HBC_2 = zeros(18,1);
cont=1;
for fil = 91:108
    offNodes = SimulationResults(fil, 11);
    gamma_array_HBC_2(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HBC_3 = zeros(18,1);
cont=1;
for fil = 145:162
    offNodes = SimulationResults(fil, 11);
    gamma_array_HBC_3(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HBC_4 = zeros(18,1);
cont=1;
for fil = 199:216
    offNodes = SimulationResults(fil, 11);
    gamma_array_HBC_4(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

gamma_array_HBC_5 = zeros(18,1);
cont=1;
for fil = 253:270
    offNodes = SimulationResults(fil, 11);
    gamma_array_HBC_5(cont, 1) = (offNodes/26) * 100;
    cont = cont + 1;
end

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
xlabel('#Nodos SDN')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% Ahorro','Color','r')
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

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northeastoutside','orientation','vertical')
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

gamma_array_HDF_1 = zeros(23,1);
cont=1;
for fil = 1:23
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HDF_1(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HDF_2 = zeros(23,1);
cont=1;
for fil = 70:92
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HDF_2(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HDF_3 = zeros(23,1);
cont=1;
for fil = 139:161
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HDF_3(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HDF_4 = zeros(23,1);
cont=1;
for fil = 208:230
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HDF_4(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HDF_5 = zeros(23,1);
cont=1;
for fil = 277:299
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HDF_5(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

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
xlabel('#Nodos SDN')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% Ahorro','Color','r')
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

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northeastoutside','orientation','vertical')
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

gamma_array_HCC_1 = zeros(23,1);
cont=1;
for fil = 24:46
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HCC_1(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HCC_2 = zeros(23,1);
cont=1;
for fil = 93:115
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HCC_2(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HCC_3 = zeros(23,1);
cont=1;
for fil = 162:184
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HCC_3(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HCC_4 = zeros(23,1);
cont=1;
for fil = 231:253
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HCC_4(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HCC_5 = zeros(23,1);
cont=1;
for fil = 300:322
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HCC_5(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

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
xlabel('#Nodos SDN')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% Ahorro','Color','r')
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

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northeastoutside','orientation','vertical')
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

gamma_array_HBC_1 = zeros(23,1);
cont=1;
for fil = 47:69
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HBC_1(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HBC_2 = zeros(23,1);
cont=1;
for fil = 116:138
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HBC_2(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HBC_3 = zeros(23,1);
cont=1;
for fil = 185:207
    offNodes = SimulationResults(fil, 11);
    gamma_array_HBC_3(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HBC_4 = zeros(23,1);
cont=1;
for fil = 254:276
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HBC_4(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

gamma_array_HBC_5 = zeros(23,1);
cont=1;
for fil = 323:345
    offNodes = SimulationResultsGeant(fil, 11);
    gamma_array_HBC_5(cont, 1) = (offNodes/36) * 100;
    cont = cont + 1;
end

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
xlabel('#Nodos SDN')
xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22])
xticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'})
ylabel('% Carga max','Color','b')
yyaxis right
ylabel('% Ahorro','Color','r')
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

legend({'\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5', '\rho = TM1','\rho = TM2','\rho = TM3','\rho = TM4', '\rho = TM5'},'FontSize',16,'location','northeastoutside','orientation','vertical')
hold off
savefig('figure6_Geant_HBC.fig')
saveas(gcf,'figure6_Geant_HBC','epsc')

