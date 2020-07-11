function [ solMatrix, errors ] = solutionShortestPath(capMatrix ,nodes, trafficMatrix, sdnMatrix, numSDN, netLink, mapCost, mapCost2, SPTMatrix, useSPT)
%SOLUTIONSHORTESTPATH Calculates solution using shortest path algorithm
% capMatrix: matrix that indicates de capacity of each node.
% nodes: number of total nodes.
% trafficMatrix: matrix containing the traffic that must be processed.
% sdnMatrix: matrix that indicates de SDN nodes used and the number of
% links of each one.
% numSDN: number of SDN nodes.
% netLink: matrix of links and their nodes.
% mapCost: map cost matrix.
% mapCost2: normalized map cost matrix.
% SPTMatrix: Matrix of K shortest paths.
% useSPT: Indicates if users wants to use the Shortest Path Tree phase.
% [solMatrix]: matrix containing the solution.
% [errors]: Number of routing errors.

solMatrix= zeros(nodes);
errors = 0;
for fil = 1:nodes
    for col = 1:nodes
        if(trafficMatrix(fil, col) ~= 0)
            %Obtain shortest paths
            nShortestPaths=1;
            if(useSPT == 1)
                sol = SPTMatrix(fil, col);
            else
                sol =  kShortestPath(mapCost, fil, col, 5);
                min=length(cell2mat(sol(1)));
                shortestPaths=zeros(1, length(sol));
                shortestPaths(1,1)=1;
                for i=2:(length(sol))
                    mapCapacity = cell2mat(sol(i));
                    if(length(mapCapacity) == min)
                        nShortestPaths= nShortestPaths +1;
                        shortestPaths(1,i)=1;
                    end
                end
            end
            
            if nShortestPaths==1
                %If there's only one shortest path.
                shortestPath=1;
            else
                %If there's more than one shortest path. Get the one that
                %has the least maximum link utilization.
                MLU=nodes*100;
                shortestPath=1;
                for i=1:length(sol)
                    if(shortestPaths(1,i)== 1)
                        mapCapacity = cell2mat(sol(i));
                        solMatrixAux=solMatrix;
                        for j=1:length(mapCapacity)-1
                            totalTraffic =  solMatrixAux(mapCapacity(j),mapCapacity(j+1)) + trafficMatrix(fil, col);
                            if(totalTraffic < capMatrix(mapCapacity(j),mapCapacity(j+1)))
                                if(false == isSDN(mapCapacity(j), numSDN, sdnMatrix))
                                    solMatrixAux(mapCapacity(j),mapCapacity(j+1)) =  totalTraffic;
                                end
                            end
                        end
                        
                        %Calculate load percentage
                        percentageMatrix = getPercentage(solMatrixAux, capMatrix, nodes);
                        %Calculate MLU
                        maxPercentage=0;
                        for j=1:length(mapCapacity)-1
                            if maxPercentage < percentageMatrix(mapCapacity(j),mapCapacity(j+1))
                                maxPercentage = percentageMatrix(mapCapacity(j),mapCapacity(j+1));
                            end
                        end
                        
                        if (maxPercentage < MLU)
                            shortestPath = i;
                            MLU = maxPercentage;
                        end
                    end
                end
                
                
            end
            
            %Save solution into Matrix
            mapCapacity = cell2mat(sol(shortestPath));
            exit = 0;
            for j=1:length(mapCapacity)-1
                if exit == 0
                    totalTraffic =  solMatrix(mapCapacity(j),mapCapacity(j+1)) + trafficMatrix(fil, col);
                    if(totalTraffic < capMatrix(mapCapacity(j),mapCapacity(j+1)))
                        if(false == isSDN(mapCapacity(j), numSDN, sdnMatrix))
                            solMatrix(mapCapacity(j),mapCapacity(j+1)) =  totalTraffic;
                        else
                            sdn = mapCapacity(j);
                            prevIndex = j-1;
                            if prevIndex == 0
                                prev = mapCapacity(j);
                            else
                                prev = mapCapacity(prevIndex);
                            end
                            totalTraffic = trafficMatrix(fil, col);
                            [solMatrix, errors] = solutionShortestPathSDN(capMatrix, solMatrix, totalTraffic, sdn, prev, mapCost2, col, netLink, SPTMatrix, useSPT, numSDN, sdnMatrix, errors);
                            exit = 1;
                        end
                    else
                        errors = errors + 1;
                    end
                end
            end
            
        end
    end
end


end


