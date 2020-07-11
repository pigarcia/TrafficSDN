function [ percentageMatrix ] = getPercentage( solMatrix, capacities, nodes )
%GETPORCENTAGE Gets traffic percentage list.
% solMatrix: Matrix of routed traffic.
% capacities: Matrix of link's capacities.
% nodes: number of nodes.
% [percentageMatrix]: Matrix of routed traffic in percentages.

percentageMatrix =zeros(nodes);
for i=1:nodes
    for j=1:nodes
        if(solMatrix(i,j) > 0 )
        percentageMatrix(i,j)= (solMatrix(i,j) * 100)/capacities(i,j);
        end
    end
end
end

