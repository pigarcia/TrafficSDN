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

num_sdn_hdf=cell(max(SimulationResults(1:18, 3)),1);

for i=1:18
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hdf(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hdf{SimulationResults(i, 3)} = conf_int_array;
    end
end

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
num_sdn_hcc=cell(max(SimulationResults(1:18, 3)),1);

for i=19:36
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hcc(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hcc{SimulationResults(i, 3)} = conf_int_array;
    end
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

%TMC - Wind
num_sdn_hbc=cell(max(SimulationResults(1:18, 3)),1);

for i=37:54
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hbc(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hbc{SimulationResults(i, 3)} = conf_int_array;
    end
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

num_sdn_hdf=cell(max(SimulationResults(55:72, 3)),1);

for i=55:72
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hdf(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hdf{SimulationResults(i, 3)} = conf_int_array;
    end
end

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
num_sdn_hcc=cell(max(SimulationResults(73:90, 3)),1);

for i=73:90
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hcc(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hcc{SimulationResults(i, 3)} = conf_int_array;
    end
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

%TMC - Wind
num_sdn_hbc=cell(max(SimulationResults(91:108, 3)),1);

for i=91:108
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hbc(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hbc{SimulationResults(i, 3)} = conf_int_array;
    end
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

num_sdn_hdf=cell(max(SimulationResults(109:126, 3)),1);

for i=109:126
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hdf(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hdf{SimulationResults(i, 3)} = conf_int_array;
    end
end

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
num_sdn_hcc=cell(max(SimulationResults(127:144, 3)),1);

for i=127:144
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hcc(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hcc{SimulationResults(i, 3)} = conf_int_array;
    end
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

%TMC - Wind
num_sdn_hbc=cell(max(SimulationResults(145:162, 3)),1);

for i=145:162
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hbc(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hbc{SimulationResults(i, 3)} = conf_int_array;
    end
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

num_sdn_hdf=cell(max(SimulationResults(163:180, 3)),1);

for i=163:180
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hdf(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hdf{SimulationResults(i, 3)} = conf_int_array;
    end
end

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
num_sdn_hcc=cell(max(SimulationResults(181:198, 3)),1);

for i=181:198
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hcc(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hcc{SimulationResults(i, 3)} = conf_int_array;
    end
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

%TMC - Wind
num_sdn_hbc=cell(max(SimulationResults(199:216, 3)),1);

for i=199:216
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hbc(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hbc{SimulationResults(i, 3)} = conf_int_array;
    end
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

num_sdn_hdf=cell(max(SimulationResults(217:234, 3)),1);

for i=217:234
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hdf(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hdf{SimulationResults(i, 3)} = conf_int_array;
    end
end

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
num_sdn_hcc=cell(max(SimulationResults(235:252, 3)),1);

for i=235:252
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hcc(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hcc{SimulationResults(i, 3)} = conf_int_array;
    end
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

%TMC - Wind
num_sdn_hbc=cell(max(SimulationResults(253:270, 3)),1);

for i=253:270
    sdn_nodes = SimulationResults(i, 3);
    if(sdn_nodes > 0)
        conf_int_array = cell2mat(num_sdn_hbc(SimulationResults(i, 3)));
        conf_int_array = [conf_int_array,SimulationResults(i, 4)];
        num_sdn_hbc{SimulationResults(i, 3)} = conf_int_array;
    end
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
legend({'TMC - IP','TMC - HDF','TMC - HCC','TMC - HBC'},'FontSize',16)
view(0,90)
xlim([1 18])
ylim([0 100])
xlabel('Number of SND Nodes')
ylabel('MAX load')


hold off

savefig('figure1_TM5.fig')
saveas(gcf,'figure1_TM5','epsc')

