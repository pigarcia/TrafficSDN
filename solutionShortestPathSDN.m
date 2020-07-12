function [ solMatrixAux, errors] = solutionShortestPathSDN(capMatrix, solMatrix, totalTraffic, sdn, prev, mapCost2, destiny, netLink, SPTMatrix, useSPT, errors)
%SOLUTIONSHORTESTPATHSDN Calculates the traffic between an SDN node and the
%destiny.
% capMatrix: matrix that indicates de capacity of each node.
% solMatrix: matrix containing the solution.
% totalTraffic: value of the traffic.
% sdn: current source sdn node.
% prev: previous node.
% mapCost2: normalized map cost matrix.
% destiny: the receiver node.
% netLink: matrix of links and their nodes.
% SPTMatrix: Matrix of K shortest paths.
% useSPT: Indicates if users wants to use the Shortest Path Tree phase.
% errors: Number of routing errors.
% [solMatrixAux]: new matrix containing the solution.
% [errors]: Number of routing errors.

solMatrixAux = solMatrix;
SDNLinks =  getSDNLinks(sdn, netLink);
min=100;
nShortestPaths=0;
shortestPaths=cell(1, length(SDNLinks));
linkIsDestiny = 0;
%If one of the SDN links goes to the destiny node send traffic through it.
for x=1:length(SDNLinks)
    if SDNLinks(x) == destiny
        linkIsDestiny = 1;
        if(totalTraffic < capMatrix(sdn, SDNLinks(x)))
            solMatrixAux(sdn, SDNLinks(x)) =  totalTraffic;
        end
    end
end
if linkIsDestiny == 0
    %Get shortest paths
    for x=1:length(SDNLinks)
        if SDNLinks(x) ~= prev
            if(useSPT == 1)
                sol = SPTMatrix(SDNLinks(x), destiny);
            else
                sol =  kShortestPath(mapCost2, SDNLinks(x), destiny, 3);
            end
            for y=1:(length(sol))
                mapCapacity = cell2mat(sol(y));
                valid = 1;
                if ~isempty(mapCapacity)
                    for i=1:length(mapCapacity)
                        if mapCapacity(i) == sdn
                            valid = 0;
                        end
                        if mapCapacity(i) == prev
                            valid = 0;
                        end
                    end
                else
                    valid = 0;
                end
                if valid == 1
                    if(length(mapCapacity) == min)
                        nShortestPaths=nShortestPaths +1;
                        shortestPaths(1,x)=sol(y);
                    else
                        if (length(mapCapacity) < min)
                            min = length(mapCapacity);
                            nShortestPaths=1;
                            shortestPaths(1,x)=sol(y);
                            cont = 1;
                            number = x;
                            while (cont < number)
                                shortestPaths(1,cont)=num2cell(0);
                                cont = cont + 1;
                            end
                        end
                    end
                end
                
            end
        end
    end
    
    %If there's only one shortest path.
    if nShortestPaths==1
        shortestPath=1;
        for x=1:length(SDNLinks)
            sol = cell2mat(shortestPaths(1,x));
            if (sol ~= 0)
                shortestPath=SDNLinks(x);
                mapCapacity = cell2mat(shortestPaths(1,x));
            end
        end
        currentTraffic =  solMatrixAux(sdn, shortestPath) + totalTraffic;
        if(currentTraffic < capMatrix(sdn, shortestPath))
            solMatrixAux(sdn, shortestPath) =  totalTraffic;
            for j=1:length(mapCapacity)-1
                currentTraffic =  solMatrix(mapCapacity(j),mapCapacity(j+1)) + totalTraffic;
                if(currentTraffic < capMatrix(mapCapacity(j),mapCapacity(j+1)))
                    solMatrixAux(mapCapacity(j),mapCapacity(j+1)) =  currentTraffic;
                end
            end
        end
    else
        %If there's more than one shortest path: divide traffic.
        traffic = totalTraffic / nShortestPaths;
        for x=1:length(shortestPaths)
            sol = cell2mat(shortestPaths(1,x));
            if (sol ~= 0)
                currentTraffic =  solMatrixAux(sdn, SDNLinks(x)) + traffic;
                if(currentTraffic < capMatrix(sdn, SDNLinks(x)))
                    solMatrixAux(sdn, SDNLinks(x)) =  traffic;
                    mapCapacity = cell2mat(shortestPaths(1,x));
                    for j=1:length(mapCapacity)-1
                        currentTraffic =  solMatrix(mapCapacity(j),mapCapacity(j+1)) + traffic;
                        if(currentTraffic < capMatrix(mapCapacity(j),mapCapacity(j+1)))
                            solMatrixAux(mapCapacity(j),mapCapacity(j+1)) =  currentTraffic;
                        end
                    end
                    
                end
            end
        end
    end
end



