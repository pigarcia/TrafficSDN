load SimulationResults.csv
load SimulationResults.mat

%FIGURE TYPE 2: TM1
%POWER SAVING VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(2:18, 3);
y = zeros(17, 1);
for fil = 1:17
    y(fil,1) = SimulationResults(1, 11);
end
plot(x, y, 'LineWidth',2,'Color', 'k')
cont=1;
num_sdn_hdf=cell(1, 17);
for fil = 2:18
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hdf(1, cont) = {nodeMatrix};
    cont = cont + 1;
end

interval_hdf = [];
err_hdf = [];
for i=1:length(num_sdn_hdf)
    array_rsrp = num_sdn_hdf{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hdf = [interval_hdf,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hdf = [err_hdf,yCI95(2)];
end

errorbar(interval_hdf,err_hdf,'bo-','LineWidth',2,'MarkerSize',12)

hold on

%TMC - HCC
num_sdn_hcc=cell(1, 17);
cont=1;
for fil = 20:36
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hcc(1, cont) ={nodeMatrix};
    cont = cont + 1;
end

interval_hcc = [];
err_hcc = [];
for i=1:length(num_sdn_hcc)
    array_rsrp = num_sdn_hcc{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hcc = [interval_hcc,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hcc = [err_hcc,yCI95(2)];
end

errorbar(interval_hcc,err_hcc,'-.g*','LineWidth',2,'MarkerSize',12)

hold on

%TMC - HBC
num_sdn_hbc=cell(1, 17);
cont=1;
for fil = 38:54
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hbc(1, cont) = {nodeMatrix};
    cont = cont + 1;
end

interval_hbc = [];
err_hbc = [];
for i=1:length(num_sdn_hbc)
    array_rsrp = num_sdn_hbc{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hbc = [interval_hbc,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hbc = [err_hbc,yCI95(2)];
end

errorbar(interval_hbc,err_hbc,':rs','LineWidth',2,'MarkerSize',12)

set(gca,'FontSize',20);
legend({'IP','HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')
view(0,90)
xlim([1 17])
ylim([0 60])
xlabel('Número de nodos SDN')
ylabel('%Ahorro')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
hold off

savefig('figures/figure2_TM1.fig')
saveas(gcf,'figures/figure2_TM1','epsc')

%FIGURE TYPE 2: TM2
%POWER SAVING VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(2:18, 3);
y = zeros(17, 1);
for fil = 1:17
    y(fil,1) = SimulationResults(1, 11);
end
plot(x, y, 'LineWidth',2,'Color', 'k')
cont=1;
num_sdn_hdf=cell(1, 17);
for fil = 56:72
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hdf(1, cont) = {nodeMatrix};
    cont = cont + 1;
end

interval_hdf = [];
err_hdf = [];
for i=1:length(num_sdn_hdf)
    array_rsrp = num_sdn_hdf{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hdf = [interval_hdf,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hdf = [err_hdf,yCI95(2)];
end

errorbar(interval_hdf,err_hdf,'bo-','LineWidth',2,'MarkerSize',12)

hold on

%TMC - HCC
num_sdn_hcc=cell(1, 17);
cont=1;
for fil = 74:90
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hcc(1, cont) ={nodeMatrix};
    cont = cont + 1;
end

interval_hcc = [];
err_hcc = [];
for i=1:length(num_sdn_hcc)
    array_rsrp = num_sdn_hcc{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hcc = [interval_hcc,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hcc = [err_hcc,yCI95(2)];
end

errorbar(interval_hcc,err_hcc,'-.g*','LineWidth',2,'MarkerSize',12)

hold on

%TMC - HBC
num_sdn_hbc=cell(1, 17);
cont=1;
for fil = 92:108
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hbc(1, cont) = {nodeMatrix};
    cont = cont + 1;
end

interval_hbc = [];
err_hbc = [];
for i=1:length(num_sdn_hbc)
    array_rsrp = num_sdn_hbc{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hbc = [interval_hbc,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hbc = [err_hbc,yCI95(2)];
end

errorbar(interval_hbc,err_hbc,':rs','LineWidth',2,'MarkerSize',12)

set(gca,'FontSize',20);
legend({'IP','HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')
view(0,90)
xlim([1 17])
ylim([0 70])
xlabel('Número de nodos SDN')
ylabel('%Ahorro')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
hold off

savefig('figures/figure2_TM2.fig')
saveas(gcf,'figures/figure2_TM2','epsc')

%FIGURE TYPE 2: TM3
%POWER SAVING VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(2:18, 3);
y = zeros(17, 1);
for fil = 1:17
    y(fil,1) = SimulationResults(1, 11);
end
plot(x, y, 'LineWidth',2,'Color', 'k')
cont=1;
num_sdn_hdf=cell(1, 17);
for fil = 110:126
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hdf(1, cont) = {nodeMatrix};
    cont = cont + 1;
end

interval_hdf = [];
err_hdf = [];
for i=1:length(num_sdn_hdf)
    array_rsrp = num_sdn_hdf{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hdf = [interval_hdf,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hdf = [err_hdf,yCI95(2)];
end

errorbar(interval_hdf,err_hdf,'bo-','LineWidth',2,'MarkerSize',12)

hold on

%TMC - HCC
num_sdn_hcc=cell(1, 17);
cont=1;
for fil = 128:144
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hcc(1, cont) ={nodeMatrix};
    cont = cont + 1;
end

interval_hcc = [];
err_hcc = [];
for i=1:length(num_sdn_hcc)
    array_rsrp = num_sdn_hcc{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hcc = [interval_hcc,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hcc = [err_hcc,yCI95(2)];
end

errorbar(interval_hcc,err_hcc,'-.g*','LineWidth',2,'MarkerSize',12)

hold on

%TMC - HBC
num_sdn_hbc=cell(1, 17);
cont=1;
for fil = 146:162
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hbc(1, cont) = {nodeMatrix};
    cont = cont + 1;
end

interval_hbc = [];
err_hbc = [];
for i=1:length(num_sdn_hbc)
    array_rsrp = num_sdn_hbc{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hbc = [interval_hbc,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hbc = [err_hbc,yCI95(2)];
end

errorbar(interval_hbc,err_hbc,':rs','LineWidth',2,'MarkerSize',12)

set(gca,'FontSize',20);
legend({'IP','HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')
view(0,90)
xlim([1 17])
ylim([0 60])
xlabel('Número de nodos SDN')
ylabel('%Ahorro')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
hold off

savefig('figures/figure2_TM3.fig')
saveas(gcf,'figures/figure2_TM3','epsc')

%FIGURE TYPE 2: TM4
%POWER SAVING VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(2:18, 3);
y = zeros(17, 1);
for fil = 1:17
    y(fil,1) = SimulationResults(1, 11);
end
plot(x, y, 'LineWidth',2,'Color', 'k')
cont=1;
num_sdn_hdf=cell(1, 17);
for fil = 164:180
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hdf(1, cont) = {nodeMatrix};
    cont = cont + 1;
end

interval_hdf = [];
err_hdf = [];
for i=1:length(num_sdn_hdf)
    array_rsrp = num_sdn_hdf{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hdf = [interval_hdf,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hdf = [err_hdf,yCI95(2)];
end

errorbar(interval_hdf,err_hdf,'bo-','LineWidth',2,'MarkerSize',12)

hold on

%TMC - HCC
num_sdn_hcc=cell(1, 17);
cont=1;
for fil = 182:198
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hcc(1, cont) ={nodeMatrix};
    cont = cont + 1;
end

interval_hcc = [];
err_hcc = [];
for i=1:length(num_sdn_hcc)
    array_rsrp = num_sdn_hcc{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hcc = [interval_hcc,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hcc = [err_hcc,yCI95(2)];
end

errorbar(interval_hcc,err_hcc,'-.g*','LineWidth',2,'MarkerSize',12)

hold on

%TMC - HBC
num_sdn_hbc=cell(1, 17);
cont=1;
for fil = 200:216
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hbc(1, cont) = {nodeMatrix};
    cont = cont + 1;
end

interval_hbc = [];
err_hbc = [];
for i=1:length(num_sdn_hbc)
    array_rsrp = num_sdn_hbc{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hbc = [interval_hbc,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hbc = [err_hbc,yCI95(2)];
end

errorbar(interval_hbc,err_hbc,':rs','LineWidth',2,'MarkerSize',12)

set(gca,'FontSize',20);
legend({'IP','HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')
view(0,90)
xlim([1 17])
ylim([0 70])
xlabel('Número de nodos SDN')
ylabel('%Ahorro')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
hold off

savefig('figures/figure2_TM4.fig')
saveas(gcf,'figures/figure2_TM4','epsc')

%FIGURE TYPE 2: TM5
%POWER SAVING VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(2:18, 3);
y = zeros(17, 1);
for fil = 1:17
    y(fil,1) = SimulationResults(1, 11);
end
plot(x, y, 'LineWidth',2,'Color', 'k')
cont=1;
num_sdn_hdf=cell(1, 17);
for fil = 218:234
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hdf(1, cont) = {nodeMatrix};
    cont = cont + 1;
end

interval_hdf = [];
err_hdf = [];
for i=1:length(num_sdn_hdf)
    array_rsrp = num_sdn_hdf{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hdf = [interval_hdf,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hdf = [err_hdf,yCI95(2)];
end

errorbar(interval_hdf,err_hdf,'bo-','LineWidth',2,'MarkerSize',12)

hold on

%TMC - HCC
num_sdn_hcc=cell(1, 17);
cont=1;
for fil = 236:252
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hcc(1, cont) ={nodeMatrix};
    cont = cont + 1;
end

interval_hcc = [];
err_hcc = [];
for i=1:length(num_sdn_hcc)
    array_rsrp = num_sdn_hcc{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hcc = [interval_hcc,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hcc = [err_hcc,yCI95(2)];
end

errorbar(interval_hcc,err_hcc,'-.g*','LineWidth',2,'MarkerSize',12)

hold on

%TMC - HBC
num_sdn_hbc=cell(1, 17);
cont=1;
for fil = 254:270
    offNodes = SimulationResultsMat(fil, 11);
    nodeMatrix = cell2mat(offNodes);
    for i = 1:5
        nodeMatrix(i) = (nodeMatrix(i)/26) * 100;
    end
    num_sdn_hbc(1, cont) = {nodeMatrix};
    cont = cont + 1;
end

interval_hbc = [];
err_hbc = [];
for i=1:length(num_sdn_hbc)
    array_rsrp = num_sdn_hbc{i};
    N = length(array_rsrp);
    yMean = mean(array_rsrp);
    interval_hbc = [interval_hbc,yMean];
    ySEM = std(array_rsrp)/sqrt(N);
    CI95 = tinv([0.025 0.975], N-1);
    yCI95 = bsxfun(@times, ySEM, CI95(:));
    err_hbc = [err_hbc,yCI95(2)];
end

errorbar(interval_hbc,err_hbc,':rs','LineWidth',2,'MarkerSize',12)

set(gca,'FontSize',20);
legend({'IP','HDF','HCC','HBC'},'FontSize',16,'location','northeastoutside','orientation','vertical')
view(0,90)
xlim([1 17])
ylim([0 60])
xlabel('Número de nodos SDN')
ylabel('%Ahorro')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
hold off

savefig('figures/figure2_TM5.fig')
saveas(gcf,'figures/figure2_TM5','epsc')




