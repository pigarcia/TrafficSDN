function [ finalMatrix, offNodes ] = finalPhase( percentageList, capMatrix ,nodes, trafficMatrix, sdnMatrix, numSDN, netLink, mapCost, mapCost2, solMatrix, useSPT)
%FINALPHASE Excutes the power saving phase of the algorithm powering down
%nodes.
% percentageList: List of links traffic after routing the traffic matrix.
% capMatrix: matrix that indicates de capacity of each node.
% nodes: number of total nodes.
% trafficMatrix: matrix containing the traffic that must be processed.
% sdnMatrix: matrix that indicates de SDN nodes used and the number of
% links of each one.
% numSDN: number of SDN nodes.
% netLink: matrix of links and their nodes.
% mapCost: map cost matrix.
% mapCost2: normalized map cost matrix.
% solMatrix: Previous solution matrix.
% useSPT: Indicates if users wants to use the Shortest Path Tree phase.
% [finalMatrix]: Final traffic matrix (after powering down links).
% [offNodes]: Number of powered down links.

finalMatrix = solMatrix;
finalAuxMatrix = zeros(nodes);
offNodes = 0;

%sort percentage list
sortedPercentageList = sortrows(percentageList,3);
index = 1;

%Power down links
if numSDN > 0
    for fil = 1:nodes
        for col = 1:nodes
            if (sortedPercentageList(index, 3) ~= 0) && (sortedPercentageList(index, 3) < 100)
                if ((true == isSDN(sortedPercentageList(index, 1), numSDN, sdnMatrix)) || (true == isSDN(sortedPercentageList(index, 2), numSDN, sdnMatrix)))
                    capacity = capMatrix(sortedPercentageList(index, 1), sortedPercentageList(index, 2));
                    capMatrix(sortedPercentageList(index, 1), sortedPercentageList(index, 2)) = 0;
                    mapCost(sortedPercentageList(index, 1), sortedPercentageList(index, 2))=inf;
                    mapCost2(sortedPercentageList(index, 1), sortedPercentageList(index, 2))=inf;
                    [SPTMatrix, errors] = priorPhase(nodes, mapCost);
                    if errors == 0
                        [finalAuxMatrix, errors] = solutionShortestPath(capMatrix, nodes, trafficMatrix, sdnMatrix, numSDN, netLink, mapCost, mapCost2, SPTMatrix, useSPT);
                    end
                    if errors ~= 0
                        finalMatrix = finalAuxMatrix;
                        capMatrix(sortedPercentageList(index, 1), sortedPercentageList(index, 2)) = capacity;
                    else
                        offNodes = offNodes + 1;
                        sortedPercentageList(index, 3) = 0;
                    end
                end
            end
            index = index + 1;
        end
    end
end

%Sort final percentage list
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

end

