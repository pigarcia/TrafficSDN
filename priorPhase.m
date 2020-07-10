function [ SPTMatrix, error ] = priorPhase( nodes, mapCost)
%INITIALPHASE Summary of this function goes here
%   Detailed explanation goes here

error = 0;
SPTMatrix = cell(nodes);
for fil = 1:nodes
    for col = 1:nodes
        if fil ~= col
            sol =  kShortestPath(mapCost, fil, col, 1);
            if ~isempty(sol)
                SPTMatrix(fil, col) = sol(1);
            else
                error = 1;
            end
        end
    end
end
% disp("SPTMatrix");
% disp(SPTMatrix);
end
