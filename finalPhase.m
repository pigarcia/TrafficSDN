function [ finalMatrix, offNodes ] = finalPhase( percentageList, capMatrix ,nodes, trafficMatrix, sdnMatrix, numSDN, netLink, mapCost, mapCost2, SPTMatrix, useSPT)
%FINALPHASE Summary of this function goes here
%   Detailed explanation goes here
finalMatrix = zeros(nodes);
offNodes = 0;

%sort percentage list
sortedPercentageList = sortrows(percentageList,3);
disp(percentageList)
disp("=========== sorted percentage list ==========")
disp(sortedPercentageList)



index = 1;
for fil = 1:nodes
    for col = 1:nodes
        if sortedPercentageList(index, 3) ~= 0
            capacity = capMatrix(sortedPercentageList(index, 1), sortedPercentageList(index, 2));
            capMatrix(sortedPercentageList(index, 1), sortedPercentageList(index, 2)) = 0;
            [finalMatrix, errors] = solutionShortestPath(capMatrix,nodes, trafficMatrix, sdnMatrix, numSDN, netLink, mapCost, mapCost2, SPTMatrix, useSPT);
            disp("--------- errors ------ ");
            disp(errors);
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

disp("=========== sorted FINAL percentage list ==========")
disp(sortedPercentageList)

end

