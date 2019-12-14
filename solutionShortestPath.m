function [ solMatrix, errors ] = solutionShortestPath(capMatrix ,nodes, trafficMatrix, sdnMatrix, numSDN, netLink, mapCost, mapCost2, SPTMatrix, useSPT)
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
errors = 0;
for fil = 1:nodes
    for col = 1:nodes
        if(trafficMatrix(fil, col) ~= 0)
            
            
            
            %Obtener los caminos míminos
            nShortestPaths=1;
            if(useSPT == 1)
                disp("use Shortest Path tree");
                sol = SPTMatrix(fil, col);
            else
                sol =  kShortestPath(mapCost, fil, col, 5);
                min=length(cell2mat(sol(1)));
                shortestPaths=zeros(1, length(sol));
                shortestPaths(1,1)=1;
                cell2mat(sol(1))
                for i=2:(length(sol))
                    mapCapacity = cell2mat(sol(i));
                    mapCapacity
                    if(length(mapCapacity) == min)
                        nShortestPaths= nShortestPaths +1;
                        shortestPaths(1,i)=1;
                    end
                end
                disp("The number of shortest paths is");
                nShortestPaths
                shortestPaths
            end
            
            if nShortestPaths==1
                %Si solo hay un camino mínimo
                disp("Solo hay un camino mínimo");
                shortestPath=1;
            else
                %si hay varios caminos minimos
                disp("Hay varios caminos mínimos");
                MLU=nodes*100;
                shortestPath=1;
                for i=1:length(sol)
                    if(shortestPaths(1,i)== 1)
                        mapCapacity = cell2mat(sol(i));
                        solMatrixAux=solMatrix;
                        %Repartimos el trafico
                        for j=1:length(mapCapacity)-1
                            totalTraffic =  solMatrixAux(mapCapacity(j),mapCapacity(j+1)) + trafficMatrix(fil, col);
                            if(totalTraffic < capMatrix(mapCapacity(j),mapCapacity(j+1)))
                                if(false == isSDN(mapCapacity(j), numSDN, sdnMatrix))
                                    solMatrixAux(mapCapacity(j),mapCapacity(j+1)) =  totalTraffic;
                                else
                                    %disp("El nodo es sdn");
                                end
                            else
                                disp("---- Capacidad superarda superada ----");
                            end
                        end
                        
                        solMatrixAux
                        %Calculamos el porcentaje de carga
                        percentageMatrix = getPercentage(solMatrixAux, capMatrix, nodes);
                        %Calculamos el MLU
                        disp("Calculating totalPercentage");
                        maxPercentage=0;
                        for j=1:length(mapCapacity)-1
                            if maxPercentage < percentageMatrix(mapCapacity(j),mapCapacity(j+1))
                                maxPercentage = percentageMatrix(mapCapacity(j),mapCapacity(j+1));
                            end
                        end
                        percentageMatrix
                        maxPercentage
                        
                        if (maxPercentage < MLU)
                            shortestPath = i;
                            MLU = maxPercentage;
                        end
                        disp("MLU");
                        MLU
                        shortestPath
                    end
                end
                
                
            end
            
            %Guardar solución en la matriz
            mapCapacity = cell2mat(sol(shortestPath));
            for j=1:length(mapCapacity)-1
                totalTraffic =  solMatrix(mapCapacity(j),mapCapacity(j+1)) + trafficMatrix(fil, col);
                if(totalTraffic < capMatrix(mapCapacity(j),mapCapacity(j+1)))
                    if(false == isSDN(mapCapacity(j), numSDN, sdnMatrix))
                        solMatrix(mapCapacity(j),mapCapacity(j+1)) =  totalTraffic;
                        if(j== length(mapCapacity)-1)
                            disp("encontrada solucion");
                        end
                    else
                        disp("El nodo es sdn");
                        sdn = mapCapacity(j);
                        totalTraffic = trafficMatrix(fil, col);
                        [solMatrix, errors] = solutionShortestPathSDN(capMatrix, solMatrix, totalTraffic, sdn, mapCost2, col, netLink, SPTMatrix, useSPT, errors);
                    end
                else
                    errors = errors + 1;
                    disp("---- Capacidad superarda superada ----");
                end
            end
            
        
        end
    end
end


end


