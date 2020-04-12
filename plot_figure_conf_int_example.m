

    %AVG RSRP VS NUMBER OF DISTINCT BS ID
    %TMC - TIM
    figure
    hold on
    grid on
    
    avg_rsrp_dist_bs_tmc_tim_conf_int=cell(max(dist_bs_tmc_tim),1);
    
    for i=1:length(avg_rsrp_tmc_tim)
        conf_int_array = cell2mat(avg_rsrp_dist_bs_tmc_tim_conf_int(dist_bs_tmc_tim(i)));
        conf_int_array = [conf_int_array,avg_rsrp_tmc_tim(i)];
        avg_rsrp_dist_bs_tmc_tim_conf_int{dist_bs_tmc_tim(i)} = conf_int_array;
    end
    
      avg_rsrp_dist_bs_tmc_tim_conf_int
%     
%     avg_rsrp_vs_bs_tmc_tim = [];
%     err_tmc_tim = [];
%     for i=1:length(avg_rsrp_dist_bs_tmc_tim_conf_int)
%         array_rsrp = avg_rsrp_dist_bs_tmc_tim_conf_int{i};
%         N = length(array_rsrp);                                      
%         yMean = mean(array_rsrp);
%         avg_rsrp_vs_bs_tmc_tim = [avg_rsrp_vs_bs_tmc_tim,yMean];
%         ySEM = std(array_rsrp)/sqrt(N);
%         CI95 = tinv([0.025 0.975], N-1);
%         yCI95 = bsxfun(@times, ySEM, CI95(:));
%         err_tmc_tim = [err_tmc_tim,yCI95(2)];
%     end
%     
% %    avg_rsrp_vs_bs_tmc_tim
%     %err_tmc_tim
%     
%     errorbar(avg_rsrp_vs_bs_tmc_tim,err_tmc_tim,'bo-','LineWidth',2,'MarkerSize',12)
% 
%     hold on
% 
%     %TMC - Vodafone
%     avg_rsrp_dist_bs_tmc_vodafone_conf_int=cell(max(dist_bs_tmc_vodafone),1);
%     
%     for i=1:length(avg_rsrp_tmc_vodafone)
%         conf_int_array = cell2mat(avg_rsrp_dist_bs_tmc_vodafone_conf_int(dist_bs_tmc_vodafone(i)));
%         conf_int_array = [conf_int_array,avg_rsrp_tmc_vodafone(i)];
%         avg_rsrp_dist_bs_tmc_vodafone_conf_int{dist_bs_tmc_vodafone(i)} = conf_int_array;
%     end
%     
%     avg_rsrp_vs_bs_tmc_vodafone = [];
%     err_tmc_vodafone = [];
%     for i=1:length(avg_rsrp_dist_bs_tmc_vodafone_conf_int)
%         avg_rsrp_dist_bs_tmc_vodafone_conf_int{i}
%         array_rsrp = avg_rsrp_dist_bs_tmc_vodafone_conf_int{i};
%         N = length(array_rsrp);                                 
%         yMean = mean(array_rsrp);
%         avg_rsrp_vs_bs_tmc_vodafone = [avg_rsrp_vs_bs_tmc_vodafone,yMean];
%         ySEM = std(array_rsrp)/sqrt(N);
%         CI95 = tinv([0.025 0.975], N-1);
%         yCI95 = bsxfun(@times, ySEM, CI95(:));
%         err_tmc_vodafone = [err_tmc_vodafone,yCI95(2)];
%     end
%     
%     errorbar(avg_rsrp_vs_bs_tmc_vodafone,err_tmc_vodafone,'-.g*','LineWidth',2,'MarkerSize',12)
%     
%     hold on
% 
%     %TMC - Wind
%     avg_rsrp_dist_bs_tmc_wind_conf_int=cell(max(dist_bs_tmc_wind),1);
%     
%     for i=1:length(avg_rsrp_tmc_wind)
%         conf_int_array = cell2mat(avg_rsrp_dist_bs_tmc_wind_conf_int(dist_bs_tmc_wind(i)));
%         conf_int_array = [conf_int_array,avg_rsrp_tmc_wind(i)];
%         avg_rsrp_dist_bs_tmc_wind_conf_int{dist_bs_tmc_wind(i)} = conf_int_array;
%     end
%     
%     avg_rsrp_vs_bs_tmc_wind = [];
%     err_tmc_wind = [];
%     for i=1:length(avg_rsrp_dist_bs_tmc_wind_conf_int)
%         array_rsrp = avg_rsrp_dist_bs_tmc_wind_conf_int{i};
%         N = length(array_rsrp);                                  
%         yMean = mean(array_rsrp);
%         avg_rsrp_vs_bs_tmc_wind = [avg_rsrp_vs_bs_tmc_wind,yMean];
%         ySEM = std(array_rsrp)/sqrt(N);
%         CI95 = tinv([0.025 0.975], N-1);
%         yCI95 = bsxfun(@times, ySEM, CI95(:));
%         err_tmc_wind = [err_tmc_wind,yCI95(2)];
%     end
%     
%     errorbar(avg_rsrp_vs_bs_tmc_wind,err_tmc_wind,':rs','LineWidth',2,'MarkerSize',12)
%     
%     set(gca,'FontSize',20);
%     legend({'TMC - TIM','TMC - Vodafone','TMC - Wind Tre'},'FontSize',16)
%     view(0,90)
%     xlim([1 12])
%     ylim([-120 -90])
%     xlabel('Number of Distinct BS IDs')
%     ylabel('Avg RSRP [dBm]')
%     
    
    hold off

    savefig('2d-conf-int.fig')
    saveas(gcf,'2d-conf-int','epsc')
   