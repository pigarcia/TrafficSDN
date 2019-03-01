function [ sdnMatrix] = getSDN( nodes, netLink, numSDN )
%SETSDN Summary of this function goes here
%   Detailed explanation goes here
%Finding the node with the most connections.
sdnMatrix= zeros(2,numSDN);
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

disp('La matriz SDN es:');
sdnMatrix

csvwrite("SDNMatrix.csv", sdnMatrix);

end

