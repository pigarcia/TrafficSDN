function [ solMatrixAux, errors] = solutionShortestPathSDN(capMatrix, solMatrix, totalTraffic, sdn, mapCost2, destiny, netLink, SPTMatrix, useSPT, errors)
%SOLUTIONSHORTESTPATHSDN Calculates the traffic between an SDN node and the
%destiny.
% solMatrix: matrix containing the solution.
% capMatrix: matrix that indicates de capacity of each link.
% totalTraffic: value of the traffic.
% netLink: matrix of links and their nodes.
% mapCost2: normalized map cost matrix.
% sdn: current source sdn link.
% destiny: the receiver link.

solMatrixAux = solMatrix;
SDNLinks =  getSDNLinks(sdn, netLink);
%SDNLinks
min=100;
nShortestPaths=0;
shortestPaths=cell(1, length(SDNLinks));
for x=1:length(SDNLinks)
    %Obtener los caminos míminos
    if(useSPT == 1)
        sol = SPTMatrix(SDNLinks(x), destiny);
        nShortestPaths=nShortestPaths +1;
        shortestPaths(1,x)=sol(1);
    else
        sol =  kShortestPath(mapCost2, SDNLinks(x), destiny, 3);
        for y=1:(length(sol))
            mapCapacity = cell2mat(sol(y));
            %mapCapacity
            valid=true;
            for i=1:length(mapCapacity)
                if mapCapacity(i) == sdn
                    valid= false;
                end
            end
            if valid == true
                if(length(mapCapacity) == min)
                    %disp("Hay otro minimo")
                    nShortestPaths=nShortestPaths +1;
                    shortestPaths(1,x)=sol(y);
                else
                    if (length(mapCapacity) < min)
                        %disp("Hay un nuevo minimo")
                        min = length(mapCapacity);
                        nShortestPaths=1;
                        shortestPaths(1,x)=sol(y);
                        cont = 1;
                        number = x;
                        while (cont < number)
                            shortestPaths(1,cont)=num2cell(0);
                            cont = cont + 1;
                        end
                        %shortestPaths
                    end
                end
            end
            
        end
    end
end
%disp("The number of shortest paths is");
%nShortestPaths
%shortestPaths

if nShortestPaths==1
    %Si solo hay un camino mínimo
    %disp("Solo hay un camino mínimo");
    shortestPath=1;
    for x=1:length(SDNLinks)
        sol = cell2mat(shortestPaths(1,x));
        if (sol ~= 0)
            shortestPath=SDNLinks(x);
            mapCapacity = cell2mat(shortestPaths(1,x));
            %mapCapacity
        end
    end
    currentTraffic =  solMatrixAux(sdn, shortestPath) + totalTraffic;
    if(currentTraffic < capMatrix(sdn, shortestPath))
        solMatrixAux(sdn, shortestPath) =  totalTraffic;
        for j=1:length(mapCapacity)-1
            currentTraffic =  solMatrix(mapCapacity(j),mapCapacity(j+1)) + totalTraffic;
            if(currentTraffic < capMatrix(mapCapacity(j),mapCapacity(j+1)))
                solMatrixAux(mapCapacity(j),mapCapacity(j+1)) =  currentTraffic;
                if(j== length(mapCapacity)-1)
                    %disp("encontrada solucion");
                end
            else
                errors = errors + 1;
            end
        end
    end
else
    %disp("Hay varios caminos minimos");
    traffic = totalTraffic / nShortestPaths;
    for x=1:length(SDNLinks)
        sol = cell2mat(shortestPaths(1,x));
        %sol
        if (sol ~= 0)
            currentTraffic =  solMatrixAux(sdn, SDNLinks(x)) + traffic;
            if(currentTraffic < capMatrix(sdn, SDNLinks(x)))
                solMatrixAux(sdn, SDNLinks(x)) =  traffic;
                mapCapacity = cell2mat(shortestPaths(1,x));
                %mapCapacity
                for j=1:length(mapCapacity)-1
                    currentTraffic =  solMatrix(mapCapacity(j),mapCapacity(j+1)) + traffic;
                    if(currentTraffic < capMatrix(mapCapacity(j),mapCapacity(j+1)))
                        solMatrixAux(mapCapacity(j),mapCapacity(j+1)) =  currentTraffic;
                        if(j== length(mapCapacity)-1)
                            %disp("encontrada solucion");
                        end
                    end
                end
            end
        end
    end
end





