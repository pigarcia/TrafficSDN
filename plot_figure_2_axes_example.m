    close all
    
    %FIGURE 2 AXES.
    fig = figure;
    left_color = [0 0 1];
    right_color = [1 0 0];
    set(fig,'defaultAxesColorOrder',[left_color; right_color]);
    
    idle_array = [1 2 3 4];
    
    alpha_array_rho_0_25 = [0.049619 0.096151 0.11466 0.13346];
    alpha_array_rho_0_5 = [0.2143 0.2471 0.25938 0.27149];
    alpha_array_rho_0_75 = [0.39236 0.4024 0.40689 0.41162];
    
    gamma_array_rho_0_25 = [7.7608 3.5202 2.1625 0.87981];
    gamma_array_rho_0_5 = [7.2747 3.3317 2.0792 0.87981];
    gamma_array_rho_0_75 = [4.6732 2.6653 1.7782 0.87765];
   
    grid on
    set(gca,'FontSize',20);
    
    x=idle_array;
    
    yyaxis left 
    plot(x,alpha_array_rho_0_25,'-bo','LineWidth',2,'MarkerSize',10);
    hold on
    plot(x,alpha_array_rho_0_5,'--bo','LineWidth',2,'MarkerSize',10);
    hold on
    plot(x,alpha_array_rho_0_75,'-.bo','LineWidth',2,'MarkerSize',10);
    xlabel('idle time (s.)')
    xticks([1 2 3 4])
    xticklabels({'1','5','10','30'})
    ylabel('Avg. \alpha','Color','b') 
    yyaxis right 
    ylabel('Avg. \gamma','Color','r')
    hold on
    plot(x,gamma_array_rho_0_25,'-rs','LineWidth',2,'MarkerSize',10);
    hold on
    plot(x,gamma_array_rho_0_5,'--rs','LineWidth',2,'MarkerSize',10);
    hold on
    plot(x,gamma_array_rho_0_75,'-.rs','LineWidth',2,'MarkerSize',10);
    
    legend({'\rho = 0.25','\rho = 0.5','\rho = 0.75','\rho = 0.25','\rho = 0.5','\rho = 0.75'},'FontSize',16,'location','northoutside','orientation','horizontal')
    hold off
    