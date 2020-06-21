function [ finalMatrix, offNodes ] = finalPhase( percentageList, capMatrix ,nodes, trafficMatrix, sdnMatrix, numSDN, netLink, mapCost, mapCost2, SPTMatrix, useSPT)
%FINALPHASE Summary of this function goes here
%   Detailed explanation goes here
finalMatrix = zeros(nodes);
offNodes = 0;

%sort percentage list
sortedPercentageList = sortrows(percentageList,3);
disp(percentageList)
% disp("=========== sorted percentage list ==========")
% disp(sortedPercentageList)



index = 1;
for fil = 1:nodes
    for col = 1:nodes
        if (sortedPercentageList(index, 3) ~= 0) && (sortedPercentageList(index, 3) < 100)
            capacity = capMatrix(sortedPercentageList(index, 1), sortedPercentageList(index, 2));
            capMatrix(sortedPercentageList(index, 1), sortedPercentageList(index, 2)) = 0;
            mapCost(sortedPercentageList(index, 1), sortedPercentageList(index, 2))=inf;
            mapCost2(sortedPercentageList(index, 1), sortedPercentageList(index, 2))=inf;
            [SPTMatrix, errors] = priorPhase(nodes, mapCost, trafficMatrix);
            if errors == 0 
                [finalMatrix, errors] = solutionShortestPath(capMatrix,nodes, trafficMatrix, sdnMatrix, numSDN, netLink, mapCost, mapCost2, SPTMatrix, useSPT);
            end
%             disp("--------- errors ------ ");
%             disp(errors);
            if errors ~= 0
                capMatrix(sortedPercentageList(index, 1), sortedPercentageList(index, 2)) = capacity;
            else
                offNodes = offNodes + 1;
                sortedPercentageList(index, 3) = 0;
            end
        end
        index = index + 1;
    end
end

% disp("=========== sorted FINAL percentage list ==========")

finalPercentageMatrix = getPercentage(finalMatrix, capMatrix, nodes);
finalPercentageList = ones(nodes*nodes, 1);
cont = 0;
for x = 1:nodes
    for y = 1:nodes
        cont = cont +1;
        finalPercentageList(cont, 1) = x;
        finalPercentageList(cont, 2) = y;
        finalPercentageList(cont, 3) =  finalPercentageMatrix(x, y);
    end
end


sortedPercentageList = sortrows(finalPercentageList,3);
% disp(sortedPercentageList)

end

