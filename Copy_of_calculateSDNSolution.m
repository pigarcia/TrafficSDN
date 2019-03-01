function [valid, solMatrixAux ] = calculateSDNSolution(capMatrix, nodes,  solMatrix, traffic, sdnMatrix, sdn, numSDN, mapCost2, col, capacities, netLink, previousLink, solutions )
%VALIDATESOLUTION Summary of this function goes here
%   Detailed explanation goes here
solMatrixAux = solMatrix;
valid = true;
nSoluciones = length(solutions);
%nSoluciones
for l=1:(length(solutions))
    mapCapacity = cell2mat(solutions(l));
   %mapCapacity
    for m=1:length(mapCapacity)-1
        totalTraffic =  traffic + solMatrixAux(mapCapacity(m),mapCapacity(m+1));
        if(totalTraffic < capacities(netLink(l,1)))
            if(false == isSDN(mapCapacity(m+1), numSDN, sdnMatrix))
                solMatrixAux(mapCapacity(m),mapCapacity(m+1)) =  totalTraffic;
            else
                node = mapCapacity(m+1);
                if(node == col)
                    solMatrixAux(mapCapacity(m),mapCapacity(m+1)) =  totalTraffic;
                else
                    solMatrixAux = solutionShortestPathSDN(capMatrix, solMatrixAux, totalTraffic, sdnMatrix, node, numSDN, mapCost2, col, capacities, netLink, sdn, nodes);
                end
            end
        else
            disp("******* Capacidad superada ********");
            %mapCapacity(m)
            %mapCapacity(m+1)
            %totalTraffic
            %capacities(netLink(l,1))
            percentageMatrix = getPercentage(solMatrixAux, capMatrix, nodes);
           % percentageMatrix
            valid = false;
        end
    end
end



