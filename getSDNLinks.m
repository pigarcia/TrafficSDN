function [ sdnLinks ] = getSDNLinks( sdn, netLink )
%GETSDNLINKS Get all links from one SDN node.
% sdn: SDN node.
% netLink: matrix of links and their nodes.
% [sdnLinks]: Returns node's links.

sdnLinks = [];
for j = 1:length(netLink)
    if(netLink(j,2) == sdn)
        sdnLinks = [sdnLinks, netLink(j,3)];
    end
end

end

