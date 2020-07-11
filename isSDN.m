function [ flag ] = isSDN( node, numSDN, sdnMatrix)
%ISDNS Checks if indicated node is SDN type.
% node: Node that needs to be checked.
% numSDN: Number of SDN nodes.
% sdnMatrix: Matrix of SDN nodes with their number of links.
% [flag]: returns true if it's SDN type or false if it isn't.

flag = 0;
for i=1:numSDN
    if(node == sdnMatrix(1,i))
        flag = true;
    end
end

end

