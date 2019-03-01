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
            sol =  kShortestPath(mapCost, fil, col, 3);
            done=false;
            for i=1:(length(sol))
                mapCapacity = cell2mat(sol(i));
                if (done == false)
                    disp("mapCapacity del nodo IP");
                    mapCapacity
                    for j=1:length(mapCapacity)-1
                        totalTraffic =  solMatrix(mapCapacity(j),mapCapacity(j+1)) + trafficMatrix(fil, col);
                        if(totalTraffic < capMatrix(mapCapacity(j),mapCapacity(j+1)))
                            if(false == isSDN(mapCapacity(j), numSDN, sdnMatrix))
                                solMatrix(mapCapacity(j),mapCapacity(j+1)) =  totalTraffic;
                                if(j== length(mapCapacity)-1)
                                    done = true;
                                    disp("encontrada solucion");
                                end
                            else
                                disp("El nodo es sdn");
                                sdn = mapCapacity(j);
                                visitedSDN = zeros(1, nodes);
                                totalTraffic = trafficMatrix(fil, col);
                                solMatrix = solutionShortestPathSDN(capMatrix, solMatrix, totalTraffic, sdnMatrix, sdn,numSDN, mapCost2, col, netLink, nodes, visitedSDN);
                                done=true;
                            end
                        end
                    end
                end
                if(i == length(sol))
                    if (done == false)
                        disp(" <<<<<< No se ha encontrado solucion >>>>>>")
                    end
                end
            end
        end
    end
end


end

