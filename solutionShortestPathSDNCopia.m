function [ solMatrix] = solutionShortestPathSDN(capMatrix, solMatrix, totalTraffic, sdnMatrix, sdn, numSDN, mapCost2, col, capacities, netLink, previousLink, nodes )
%SOLUTIONSHORTESTPATHSDN Summary of this function goes here
%   Detailed explanation goes here
getSDNLinks(sdn, netLink);
sol =  kShortestPath(mapCost2, sdn, col, 50);
done=false;
SDNLinks =  getSDNLinks(sdn, netLink);
begin = 1;
last = 5;
while ((done == false) && (last <=length(sol)))
    connections = [];
    solutions = [];
    %comprobamos que no vuelva para atrás y que no se repita un camino
    disp("Comprobando soluciones...");
    %begin
    %last
    %length(sol)
    %previousLink
    for l=begin:last
        mapCapacity = cell2mat(sol(l));
        %mapCapacity
        invalid = false;
        if find(connections == mapCapacity(2))
            invalid = true;
        else
            for n=2:length(mapCapacity)
                if(mapCapacity(n) == previousLink)
                    invalid = true;
                end
            end
            if (invalid == false)
                connections = [connections, mapCapacity(2)];
                solutions = [solutions, sol(l)];
            end
        end
    end
    disp("Comprobando soluciones disponibles:");
    PrevioustotalTraffic=totalTraffic;
    totalTraffic = totalTraffic/length(solutions);
    %PrevioustotalTraffic
    %totalTraffic
    if(length(solutions) == 0 )
        disp("------------- No se ha encontrado solucion ------------");
    else
        [valid , solMatrixAux] = validateSolution (capMatrix,nodes,  solMatrix, totalTraffic, sdnMatrix, sdn, numSDN, mapCost2, col, capacities, netLink, previousLink, solutions );
        if valid == true
            disp("[  Solucion valida ]");
            %totalTraffic
            solMatrix = solMatrixAux;
            done = true;
            %solMatrix
        else
            disp("[  solucion NO valida  ]");
            %solMatrix
        end
    end
    begin= begin+5;
    last = last+ 5;
end

if done == false
   disp("Nodo SDN: Sin solución"); 
end


