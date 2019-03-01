function [ solMatrix] = solutionShortestPathSDN(capMatrix, solMatrix, totalTraffic, sdnMatrix, sdn, numSDN, mapCost2, destiny, netLink, nodes, visitedSDN)
%SOLUTIONSHORTESTPATHSDN Calculates the traffic between an SDN node and the
%destiny.
% solMatrix: matrix containing the solution.
% capMatrix: matrix that indicates de capacity of each link.
% totalTraffic: value of the traffic.
% nodes: number of total nodes.
% sdnMatrix: matrix that indicates de SDN nodes used and the number of
% links of each one.
% numSDN: number of SDN nodes.
% netLink: matrix of links and their nodes.
% mapCost2: normalized map cost matrix.
% sdn: current source sdn link.
% destiny: the receiver link.
% visitedSDN: previous visited SDSN links.

%Calcular Tráfico y repartirlo entre las conexiones SDN
SDNLinks =  getSDNLinks(sdn, netLink);
visitedSDN(1, sdn) = 1;
calculated = false;
validLink = ones(1, length(SDNLinks));
totalLinks = length(SDNLinks);
disp("Repartir trafico entre los links de sdn")
sdn
SDNLinks
% visitedSDN
while (calculated == false)
    disp("----- Recalculate -------");
    
    traffic = totalTraffic/totalLinks;
    solMatrixAux = solMatrix;
    recalculate = false;
    exit = false;
    while exit == false
        for x=1:length(SDNLinks)
            if validLink(1, x) == 1
                currentTraffic =  traffic + solMatrixAux(sdn, SDNLinks(x));
                if(currentTraffic < capMatrix(sdn,SDNLinks(x)))
                    if false == isSDN(SDNLinks(x), numSDN, sdnMatrix)
                        solMatrixAux(sdn, SDNLinks(x)) = currentTraffic;
                    else
                        %disp("El link es SDN")
                        if visitedSDN(1, SDNLinks(x)) == 1
                            disp("El link es SDN y ha sido visitado");
                            validLink(1, x)= 0;
                            totalLinks = totalLinks - 1;
                            recalculate = true;
                            exit = true;
                        else
                            if SDNLinks(x) == destiny
                                %disp("El nodo es SDN pero es el destino")
                                solMatrixAux(sdn, SDNLinks(x)) = currentTraffic;
                            else
                                %disp("El nodo es SDN")
                                solMatrixAux(sdn, SDNLinks(x)) = currentTraffic;
                                newSDN = SDNLinks(x);
                                solMatrixAux = solutionShortestPathSDN(capMatrix, solMatrixAux, traffic, sdnMatrix, newSDN, numSDN, mapCost2, destiny, netLink, nodes, visitedSDN);
                            end
                        end
                    end
                else
                    disp("El trafico supera la capacidad del link:");
                    %                 currentTraffic
                    %                 capMatrix(sdn,SDNLinks(x))
                    %                 sdn
                    %                 SDNLinks(x)
                    %                 capMatrix
                    validLink(1, x)= 0;
                    totalLinks = totalLinks - 1;
                    recalculate = true;
                    exit = true;
                end
            end
        end
        if(recalculate == false)
            disp("Tráfico calculado y repartido entre las conexiones SDN");
            %solMatrixAux
            
            %Calcular los caminos desde los nodos repartidos hasta el destino
            for x=1:length(SDNLinks)
                if SDNLinks(x) ~= destiny
                    if false == isSDN(SDNLinks(x), numSDN, sdnMatrix)
                        if validLink(1, x) == 1
                            %disp("Calcular tráfico desde los nodos hasta el destino");
                            [valid , solMatrixAux] = calculateSDNSolution(capMatrix,nodes,  solMatrixAux, traffic, SDNLinks(x), sdn, sdnMatrix, numSDN, mapCost2, destiny, netLink, visitedSDN );
                            if(valid == false)
                                disp("El link no era válido:");
                                SDNLinks(x)
                                validLink(1, x)= 0;
                                totalLinks = totalLinks - 1;
                                recalculate = true;
                                exit = true;
                            end
                        end
                    end
                end
            end
            
            %comprobar que hacer si no hay ningun link valido
        end
        
        if(recalculate == false)
            %If everything is correct
            disp("Solucion calculada correctamente");
            solMatrixAux
            exit = true;
            calculated = true;
        end
    end
end

%Volcar matriz de solución
solMatrix = solMatrixAux;

%end

% if done == false
%     disp("Nodo SDN: Sin solución");
% end


