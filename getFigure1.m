load SimulationResults.csv
load SimulationResults.mat


%FIGURE TYPE 1 : TM1
%MAX load VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(2:18, 3);
y = zeros(17, 1);
for fil = 1:17
    y(fil,1) = SimulationResults(1, 4);
end

plot(x, y, 'LineWidth',2,'Color', 'k')

num_sdn_hdf=SimulationResultsMat(2:18, 4);

interval_hdf = [];
err_hdf = [];
for i=1:length(num_sdn_hdf)
    num_sdn_hdf{i}
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
num_sdn_hcc=SimulationResultsMat(20:36, 4);

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
num_sdn_hbc=SimulationResultsMat(36:54, 4);

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
ylim([0 100])
xlabel('Número de nodos SDN')
ylabel('% Carga máxima')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})
hold off

savefig('figure1_TM1.fig')
saveas(gcf,'figure1_TM1','epsc')

%===========================================================================

%FIGURE TYPE 1 : TM2
%MAX load VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(56:72, 3);
y = zeros(17, 1);
for fil = 1:17
    y(fil,1) = SimulationResults(55, 4);
end

plot(x, y, 'LineWidth',2,'Color', 'k')

num_sdn_hdf=SimulationResultsMat(56:72, 4);

interval_hdf = [];
err_hdf = [];
for i=1:length(num_sdn_hdf)
    num_sdn_hdf{i}
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
num_sdn_hcc=SimulationResultsMat(74:90, 4);

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
num_sdn_hbc=SimulationResultsMat(92:108, 4);

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
ylim([0 100])
xlabel('Número de nodos SDN')
ylabel('% Carga máxima')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})

hold off

savefig('figure1_TM2.fig')
saveas(gcf,'figure1_TM2','epsc')

%===========================================================================
%FIGURE TYPE 1 : TM3
%MAX load VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(110:126, 3);
y = zeros(17, 1);
for fil = 1:17
    y(fil,1) = SimulationResults(109, 4);
end

plot(x, y, 'LineWidth',2,'Color', 'k')

num_sdn_hdf=SimulationResultsMat(110:126, 4);

interval_hdf = [];
err_hdf = [];
for i=1:length(num_sdn_hdf)
    num_sdn_hdf{i}
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
num_sdn_hcc=SimulationResultsMat(128:144, 4);

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
num_sdn_hbc=SimulationResultsMat(146:162, 4);

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
ylim([0 100])
xlabel('Número de nodos SDN')
ylabel('% Carga máxima')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})


hold off

savefig('figure1_TM3.fig')
saveas(gcf,'figure1_TM3','epsc')

%===========================================================================
%FIGURE TYPE 1 : TM4
%MAX load VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(164:180, 3);
y = zeros(17, 1);
for fil = 1:17
    y(fil,1) = SimulationResults(163, 4);
end

plot(x, y, 'LineWidth',2,'Color', 'k')

num_sdn_hdf=SimulationResultsMat(164:180, 4);

interval_hdf = [];
err_hdf = [];
for i=1:length(num_sdn_hdf)
    num_sdn_hdf{i}
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
num_sdn_hcc=SimulationResultsMat(182:198, 4);

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
num_sdn_hbc=SimulationResultsMat(200:216, 4);

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
ylim([0 100])
xlabel('Número de nodos SDN')
ylabel('% Carga máxima')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})


hold off

savefig('figure1_TM4.fig')
saveas(gcf,'figure1_TM4','epsc')

%===========================================================================
%FIGURE TYPE 1 : TM5
%MAX load VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(218:234, 3);
y = zeros(17, 1);
for fil = 1:17
    y(fil,1) = SimulationResults(217, 4);
end

plot(x, y, 'LineWidth',2,'Color', 'k')

num_sdn_hdf=SimulationResultsMat(218:234, 4);

interval_hdf = [];
err_hdf = [];
for i=1:length(num_sdn_hdf)
    num_sdn_hdf{i}
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
num_sdn_hcc=SimulationResultsMat(236:252, 4);

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
num_sdn_hbc=SimulationResultsMat(254:270, 4);

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
ylim([0 100])
xlabel('Número de nodos SDN')
ylabel('% Carga máxima')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'})

hold off

savefig('figure1_TM5.fig')
saveas(gcf,'figure1_TM5','epsc')

