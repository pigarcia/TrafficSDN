function [ sdnLinks ] = getSDNLinks( sdn, netLink )
%GETSDNLINKS obtener todos los links de un nodo SDN
%   Detailed explanation goes here
sdnLinks = [];
if sdn == 2
 %   sdn
 %   netLink
end
for j = 1:length(netLink)
    %disp("-- Matriz SDN --");
    %netLink(j,2)
    %sdn
    if(netLink(j,2) == sdn)
        sdnLinks = [sdnLinks, netLink(j,3)];
    end
end

end

