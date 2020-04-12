load SimulationResults.csv


%FIGURE 1 : TM1
%MAX load VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(1:18, 3);
y = zeros(18, 1);
for fil = 1:18
    y(fil,1) = SimulationResults(1, 4);
end

plot(x, y)

num_sdn_hdf=simulationResultsMat(1:18, 4);

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
num_sdn_hcc=simulationResultsMat(19:36, 4);

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
num_sdn_hbc=simulationResultsMat(37:54, 4);

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
legend({'TMC - IP','TMC - HDF','TMC - HCC','TMC - HBC'},'FontSize',16)
view(0,90)
xlim([1 18])
ylim([0 100])
xlabel('Number of SND Nodes')
ylabel('MAX load')


hold off

savefig('figure1_TM1.fig')
saveas(gcf,'figure1_TM1','epsc')

%===========================================================================

%FIGURE 1 : TM2
%MAX load VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(55:72, 3);
y = zeros(18, 1);
for fil = 1:18
    y(fil,1) = SimulationResults(55, 4);
end

plot(x, y)

num_sdn_hdf=simulationResultsMat(55:72, 4);

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
num_sdn_hcc=simulationResultsMat(73:90, 4);

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
num_sdn_hbc=simulationResultsMat(91:108, 4);

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
legend({'TMC - IP','TMC - HDF','TMC - HCC','TMC - HBC'},'FontSize',16)
view(0,90)
xlim([1 18])
ylim([0 100])
xlabel('Number of SND Nodes')
ylabel('MAX load')


hold off

savefig('figure1_TM2.fig')
saveas(gcf,'figure1_TM2','epsc')

%===========================================================================
%FIGURE 1 : TM3
%MAX load VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(109:126, 3);
y = zeros(18, 1);
for fil = 1:18
    y(fil,1) = SimulationResults(109, 4);
end

plot(x, y)

num_sdn_hdf=simulationResultsMat(109:126, 4);

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
num_sdn_hcc=simulationResultsMat(127:144, 4);

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
num_sdn_hbc=simulationResultsMat(145:162, 4);

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
legend({'TMC - IP','TMC - HDF','TMC - HCC','TMC - HBC'},'FontSize',16)
view(0,90)
xlim([1 18])
ylim([0 100])
xlabel('Number of SND Nodes')
ylabel('MAX load')


hold off

savefig('figure1_TM3.fig')
saveas(gcf,'figure1_TM3','epsc')

%===========================================================================
%FIGURE 1 : TM4
%MAX load VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(163:180, 3);
y = zeros(18, 1);
for fil = 1:18
    y(fil,1) = SimulationResults(163, 4);
end

plot(x, y)

num_sdn_hdf=simulationResultsMat(163:180, 4);

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
num_sdn_hcc=simulationResultsMat(181:198, 4);

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
num_sdn_hbc=simulationResultsMat(199:216, 4);

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
legend({'TMC - IP','TMC - HDF','TMC - HCC','TMC - HBC'},'FontSize',16)
view(0,90)
xlim([1 18])
ylim([0 100])
xlabel('Number of SND Nodes')
ylabel('MAX load')


hold off

savefig('figure1_TM4.fig')
saveas(gcf,'figure1_TM4','epsc')

%===========================================================================
%FIGURE 1 : TM5
%MAX load VS NUMBER OF SDN Nodes
%TMC - HDF
figure
hold on
grid on

x = SimulationResults(217:234, 3);
y = zeros(18, 1);
for fil = 1:18
    y(fil,1) = SimulationResults(217, 4);
end

plot(x, y)

num_sdn_hdf=simulationResultsMat(217:234, 4);

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
num_sdn_hcc=simulationResultsMat(235:252, 4);

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
num_sdn_hbc=simulationResultsMat(253:270, 4);

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
legend({'TMC - IP','TMC - HDF','TMC - HCC','TMC - HBC'},'FontSize',16)
view(0,90)
xlim([1 18])
ylim([0 100])
xlabel('Number of SND Nodes')
ylabel('MAX load')


hold off

savefig('figure1_TM5.fig')
saveas(gcf,'figure1_TM5','epsc')

