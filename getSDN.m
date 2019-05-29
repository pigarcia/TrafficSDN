function [ sdnMatrix] = getSDN( nodes, netLink, numSDN, heuristic, pathMatrix)
%SETSDN Summary of this function goes here
%   Detailed explanation goes here
%Finding the node with the most connections.
sdnMatrix= zeros(2,numSDN);
switch (heuristic)
    case "HDF"
        disp("You chose HDF");
        for x = 1:numSDN
            % disp("siguiente SDN");
            max = 0;
            for i = 1:nodes
                cont = 0;
                for j = 1:length(netLink)
                    if (i == netLink(j,2))
                        cont = cont+1;
                    end
                end
                if(cont > max)
                    % disp("el contador es mayor que el max");
                    if (0 == isSDN(i, numSDN, sdnMatrix))
                        % disp("es valido");
                        sdn = i;
                        max = cont;
                    end
                end
            end
            sdnMatrix(1, x) = sdn;
            sdnMatrix(2, x) = max;
        end
        
    case "HCC"
        disp("You chose HCC");
        
    case "HBC"
        disp("You chose HBC");
        shortestPathsEdges = zeros(1,nodes);
        for fil = 1:nodes
            for col = 1:nodes
                if fil ~= col
                    sol =  kShortestPath(pathMatrix, fil, col, 1);
                    minPath = cell2mat(sol(1));
                    %Obtener los caminos míminos
                    for i=2:minPath
                        shortestPathsEdges(1,i) = shortestPathsEdges(1,i) + 1;
                    end
                end
            end
        end
        shortestPathsEdges
        
        %Obtener HBC ordenados
        for x = 1:numSDN
            % disp("siguiente SDN");
            max = 0;
            for i = 1:nodes
                cont = shortestPathsEdges(1,i);
                if(cont > max)
                    % disp("el contador es mayor que el max");
                    if (0 == isSDN(i, numSDN, sdnMatrix))
                        % disp("es valido");
                        sdn = i;
                        max = cont;
                    end
                end
            end
            sdnMatrix(1, x) = sdn;
            sdnMatrix(2, x) = max;
        end
end

disp('La matriz SDN es:');
sdnMatrix

csvwrite("SDNMatrix.csv", sdnMatrix);

end

