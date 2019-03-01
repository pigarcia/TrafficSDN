function [valid, solMatrixAux ] = calculateSDNSolution(capMatrix, nodes,  solMatrix, traffic, origin, sdn, sdnMatrix, numSDN, mapCost2, destiny, netLink, visitedSDN )
%VALIDATESOLUTION calculates the solution when sending traffic from the
%origin node to the destiny.
% solMatrix: matrix containing the solution.
% valid: indicates if a valid solution was found.
% capMatrix: matrix that indicates de capacity of each link.
% traffic: value of the traffic.
% origin: sender node.
% nodes: number of total nodes.
% sdnMatrix: matrix that indicates de SDN nodes used and the number of
% links of each one.
% numSDN: number of SDN nodes.
% netLink: matrix of links and their nodes.
% mapCost2: normalized map cost matrix.
% sdn: current source sdn link.
% destiny: the receiver link.
% visitedSDN: previous visited SDSN links.

solMatrixAux = solMatrix;
valid = false;
done = false;
sol =  kShortestPath(mapCost2, origin, destiny, 20);
%nSoluciones
while done == false
    for i=1:(length(sol))
        mapCapacity = cell2mat(sol(i));
        validSolution = true;
        if done == false
            for m=1:length(mapCapacity)-1
                %disp("Comprobar si es snd");
                %mapCapacity(m+1)
                %sdn
                if mapCapacity(m+1) ~= sdn
                    currentTraffic =  traffic + solMatrixAux(mapCapacity(m),mapCapacity(m+1));
                    if currentTraffic < capMatrix(mapCapacity(m),mapCapacity(m+1))
                        if false == isSDN(mapCapacity(m+1), numSDN, sdnMatrix)
                            solMatrixAux(mapCapacity(m),mapCapacity(m+1)) =  currentTraffic;
                            node = mapCapacity(m+1);
                            %disp("Nodo y destino");
                            %                         node
                            %                         destiny
                            if node == destiny
                                %disp("Ha llegado al destino");
                                if validSolution == true
                                    mapCapacity
                                    done = true;
                                    valid = true;
                                end
                            end
                        else
                            node = mapCapacity(m+1);
                            if node == destiny
                                %disp("El nodo sdn era el destino");
                                solMatrixAux(mapCapacity(m),mapCapacity(m+1)) =  currentTraffic;
                                if validSolution == true
                                    mapCapacity
                                    done = true;
                                    valid = true;
                                end
                            else
                                if visitedSDN(1,node) == 0
                                    %disp("El nodo es SDN y se llama a solutionShortestPathSDN")
                                    solMatrixAux = solutionShortestPathSDN(capMatrix, solMatrix, traffic, sdnMatrix, sdn, numSDN, mapCost2, destiny, netLink, nodes, visitedSDN);
                                else
                                    %disp("El nodo es SDN pero ya ha sido visitado")
                                    validSolution = false;
                                end
                            end
                        end
                    else
                        %disp("Capacidad superada");
                        validSolution = false;
                    end
                else
                    validSolution = false;
                    %disp("la solucion es invalida porque vuelve para atras");
                end
            end
        end
    end
    done =  true;
end

if valid == false
    disp("La solucion es invalida :(((");
end


