function [ flag ] = isDNS( node, numSDN, sdnMatrix)
%ISDNS Summary of this function goes here
%   Detailed explanation goes here

flag = 0;
for i=1:numSDN
    if(node == sdnMatrix(1,i))
        flag = true;
    end
end

end

