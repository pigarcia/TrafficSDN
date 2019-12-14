function [ SPTMatrix ] = priorPhase( nodes, mapCost, trafficMatrix )
%INITIALPHASE Summary of this function goes here
%   Detailed explanation goes here

SPTMatrix = cell(nodes);
for fil = 1:nodes 
    for col = 1:nodes
        if(trafficMatrix(fil, col) ~= 0)
            sol =  kShortestPath(mapCost, fil, col, 1);
            SPTMatrix(fil, col) = sol(1);
        end
    end
end
disp("SPTMatrix");
disp(SPTMatrix);
end

% SPTCellArray = cell(1,nodes);
% for fil = 1:nodes 
%     SPCellArray = cell(1,nodes);
%     for col = 1:nodes
%         if(trafficMatrix(fil, col) ~= 0)
%             sol =  kShortestPath(mapCost, fil, col, 1);
%             SPCellArray(col) = sol(1);
%         end
%     end
%     SPTCellArray(fil) = SPCellArray;
% end
% disp("SPTMatrix");
% disp(SPTCellArray);
% end