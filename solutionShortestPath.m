function [ solMatrix ] = solutionShortestPath(capMatrix ,nodes, trafficMatrix, sdnMatrix, numSDN, netLink, mapCost, mapCost2 )
%SOLUTIONSHORTESTPATH Calculates solution using shortest path algorithm
% solMatrix: matrix containing the solution.
% capMatrix: matrix that indicates de capacity of each link.
% nodes: number of total nodes.
% trafficMatrix: matrix containing the traffic that must be processed.
% sdnMatrix: matrix that indicates de SDN nodes used and the number of
% links of each one.
% numSDN: number of SDN nodes.
% netLink: matrix of links and their nodes.
% mapCost: map cost matrix.
% mapCost2: normalized map cost matrix.

solMatrix= zeros(nodes);
for fil = 1:1
    for col = 1:4
        if(trafficMatrix(fil, col) ~= 0)
            sol =  kShortestPath(mapCost, fil, col, 5);
            done=false;
            %Obtener los caminos míminos
            min=length(cell2mat(sol(1)));
            shortestPath=1;
            cell2mat(sol(1))
            for i=2:(length(sol))
                mapCapacity = cell2mat(sol(i));
                mapCapacity
                if(length(mapCapacity) == min)
                    shortestPath=i;
                end
            end
            disp("The number of shortest paths is");
            shortestPath
            
            if shortestPath==1
                mapCapacity = cell2mat(sol(1));
            end
            for j=1:length(mapCapacity)-1
                totalTraffic =  solMatrix(mapCapacity(j),mapCapacity(j+1)) + trafficMatrix(fil, col);
                if(totalTraffic < capMatrix(mapCapacity(j),mapCapacity(j+1)))
                    if(false == isSDN(mapCapacity(j), numSDN, sdnMatrix))
                        solMatrix(mapCapacity(j),mapCapacity(j+1)) =  totalTraffic;
                        if(j== length(mapCapacity)-1)
                            disp("encontrada solucion");
                        end
                    else
                        %disp("El nodo es sdn");
                        %sdn = mapCapacity(j);
                        %visitedSDN = zeros(1, nodes);
                        %totalTraffic = trafficMatrix(fil, col);
                        %solMatrix = solutionShortestPathSDN(capMatrix, solMatrix, totalTraffic, sdnMatrix, sdn,numSDN, mapCost2, col, netLink, nodes, visitedSDN);
                        %done=true;
                    end
                else
                    disp("---- Capacidad superarda superada ----");
                end
            end
        end
    end
end
end

