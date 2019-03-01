function [ percentageMatrix ] = getPercentage( solMatrix, capacities, nodes )
%GETPORCENTAGE Summary of this function goes here
%   Detailed explanation goes here

percentageMatrix =zeros(nodes);
for i=1:nodes
    for j=1:nodes
        if(solMatrix(i,j) > 0 )
        percentageMatrix(i,j)= (solMatrix(i,j) * 100)/capacities(i,j);
        end
    end
end
end

