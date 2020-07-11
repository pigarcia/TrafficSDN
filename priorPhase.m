function [ SPTMatrix, error ] = priorPhase( nodes, mapCost)
%PRIORPHASE This phase calculates the topology's shortest path trees.
% nodes: nodes: Number of total nodes
% mapCost: Matrix of topology's costs.
% [SPTMatrix]: Matrix of shortest path trees.
% [error]: Number of nodes without connection.

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
end
