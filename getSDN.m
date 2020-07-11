function [ sdnMatrix] = getSDN( nodes, netLink, numSDN, heuristic, pathMatrix)
%GETSDN Get SDN nodes based on selected heuristic.
%nodes: Number of total nodes
%netLink: Total links information.
%numSDN: number of desired SDN nodes.
%huristic: Name of selected heuristic.
%pathMatrix: Matrix of links capacities.
%[sdnMatrix]: Matrix of SDN nodes with their number of links.

sdnMatrix= zeros(2,numSDN);
switch (heuristic)
    case "HDF"
        %Count number of links and order them
        for x = 1:numSDN
            max = 0;
            for i = 1:nodes
                cont = 0;
                for j = 1:length(netLink)
                    if (i == netLink(j,2))
                        cont = cont+1;
                    end
                end
                if(cont >= max)
                    if (0 == isSDN(i, numSDN, sdnMatrix))
                        if cont == max
                            num = rand;
                            if(num > 0.5)
                                sdn = i;
                                max = cont;
                            end
                        else
                            sdn = i;
                            max = cont;
                        end
                    end
                end
            end
            sdnMatrix(1, x) = sdn;
            sdnMatrix(2, x) = max;
        end
        
    case "HCC"
        %Get number of shortests paths
        shortestPathsEdges = zeros(1,nodes);
        for fil = 1:nodes
            for col = 1:nodes
                if fil ~= col
                    sol =  kShortestPath(pathMatrix, fil, col, 1);
                    minPath = cell2mat(sol(1));
                    shortestPathsEdges(1,fil) = shortestPathsEdges(1,fil) + length(minPath) - 1;
                end
            end
        end
        
        %Order HCC nodes
        for x = 1:numSDN
            min = 1000;
            for i = 1:nodes
                cont = shortestPathsEdges(1,i);
                if(cont <= min)
                    if (0 == isSDN(i, numSDN, sdnMatrix))
                        if cont == min
                            num = rand;
                            if(num > 0.5)
                                sdn = i;
                                min = cont;
                            end
                        else
                            sdn = i;
                            min = cont;
                        end
                    end
                end
            end
            links = 0;
            for j = 1:length(netLink)
                if(netLink(j,2) == sdn)
                    links = links + 1;
                end
            end
            sdnMatrix(1, x) = sdn;
            sdnMatrix(2, x) = links;
        end
        
    case "HBC"
        %Get number of shortest paths edges
        shortestPathsEdges = zeros(1,nodes);
        for fil = 1:nodes
            for col = 1:nodes
                if fil ~= col
                    sol =  kShortestPath(pathMatrix, fil, col, 1);
                    minPath = cell2mat(sol(1));
                    for i=2:length(minPath)
                        shortestPathsEdges(1,minPath(i)) = shortestPathsEdges(1,minPath(i)) + 1;
                    end
                end
            end
        end
        
        %Order HBC nodes
        for x = 1:numSDN
            max = 0;
            for i = 1:nodes
                cont = shortestPathsEdges(1,i);
                if(cont >= max)
                    if (0 == isSDN(i, numSDN, sdnMatrix))
                        if cont == max
                            num = rand;
                            if(num > 0.5)
                                sdn = i;
                                max = cont;
                            end
                        else
                            sdn = i;
                            max = cont;
                        end
                        
                    end
                end
            end
            links = 0;
            for j = 1:length(netLink)
                if(netLink(j,2) == sdn)
                    links = links + 1;
                end
            end
            sdnMatrix(1, x) = sdn;
            sdnMatrix(2, x) = links;
        end
end

end

