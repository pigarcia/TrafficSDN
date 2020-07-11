function [percentageList, finalPercentageList, offLinks, errors, processingTime] = trafficSDN (topologyPath, heuristic, numSDN, useSPT, trafficMatrix)
%TRAFFICSDN Starts algorith based on parameters.
% topologyPath: Topology's filename.
% heuristic: Sets the SDN selection method.
% numSDN: Number of desired SDN nodes.
% useSPT: Indicates if users wants to use the Shortest Path Tree phase.
% trafficMatrix: Indicates the traffic that needs to be routed in a mtrix form.
% [percentageList]: List of links final traffic (%).
% [percentageList]: List of links final traffic after power saving phase (%).
% [offLinks]: Number of links switch off.
% [errors]: Number of routing errors.
% [processingTime]: Algorithm processing time.

global nvars; %Number of variables considered in the problem
global mapCapacity;
global nodes;
global capMatrix;
global solMatrix;
global sdnMatrix;

%Import capacities and traffic matrices
dataVars = {'A','C','N','netLink','T1','T2','T3','T4','T5'};
S = load(topologyPath,dataVars{:});

%Links
nvars = size(S.netLink,1);
%Nodes
nodes = S.N;

%Capacities matrix
capMatrix = S.A;
for i = 1:nvars
    capMatrix(S.netLink(i,2),S.netLink(i,3))=S.C(S.netLink(i,1));
end

%Process of mapping of capacities matrix to array (mapCapacity).
link.capacity = 0;
link.fromNode = 0;
link.toNode = 0;

mapCapacity = [];
for i = 1:nodes
    for j = 1:nodes
        if (capMatrix(i,j) > 0) %Links are only considered if capacity is > 0
            link.capacity = capMatrix(i,j);
            link.fromNode = i;
            link.toNode = j;
            mapCapacity=[mapCapacity,link];
        end
    end
end

%Calculate SDN nodes and properties.
pathMatrix = ones(nodes);
for i = 1:nodes
    for j = 1:nodes
        if (S.A(i,j) == 0) %Links are only considered if capacity is > 0
            pathMatrix(i,j)=inf;
        end
    end
end

if numSDN >= 1 
    sdnMatrix = getSDN(nodes, S.netLink, numSDN, heuristic, pathMatrix);
end



%Generate map cost matrix
mapCost= ones(nodes);
for i = 1:nodes
    for j = 1:nodes
        if (S.A(i,j) == 0) %Links are only considered if capacity is > 0
            mapCost(i,j)=inf;
        else
            for m = 1:numSDN
                if (i == sdnMatrix(1, m) || j == sdnMatrix(1, m))
                    mapCost(i,j)=1/sdnMatrix(2,m); %Calculating cost of SND nodes
                end
            end
        end
    end
end


%Generate map cost matrix with normalized values
mapCost2 = ones(nodes);
for i = 1:nodes
    for j = 1:nodes
        if (S.A(i,j) == 0) %Links are only considered if capacity is > 0
            mapCost2(i,j)=inf;
        end
    end
end
%Initial array of Shortest Path Trees
if(useSPT == 1)
    [sptMatrix, error]= priorPhase(nodes, mapCost);
    if error == 1
        useSPT = 0;
    end
else
    sptMatrix = cell(nodes);
end

tic;
%Call shortest path algorithm
[solMatrix, errors] = solutionShortestPath(capMatrix,nodes, trafficMatrix, sdnMatrix, numSDN, S.netLink, mapCost, mapCost2, sptMatrix, useSPT);

processingTime = toc;
%Calculate solution in percentages
percentageMatrix = getPercentage(solMatrix, capMatrix, nodes);


percentageList = ones(nodes*nodes, 3);

cont = 0;
for x = 1:nodes
    for y = 1:nodes
        cont = cont +1;
        percentageList(cont, 1) = x;
        percentageList(cont, 2) = y;
        percentageList(cont, 3) =  percentageMatrix(x, y);
    end
end

finalMatrix = zeros(nodes);
offLinks = 0;

%Call power saving pahse
if errors == 0
    [finalMatrix, offLinks] = finalPhase(percentageList, capMatrix, nodes, trafficMatrix, sdnMatrix, numSDN, S.netLink, mapCost, mapCost2, solMatrix, useSPT);
    
end

%Order results
finalPercentageMatrix = getPercentage(finalMatrix, capMatrix, nodes);
finalPercentageList = ones(nodes*nodes, 1);
cont = 0;
for x = 1:nodes
    for y = 1:nodes
        cont = cont +1;
        finalPercentageList(cont, 1) =  finalPercentageMatrix(x, y);
    end
end


percentageList = ones(nodes*nodes, 1);
cont = 0;
for x = 1:nodes
    for y = 1:nodes
        cont = cont +1;
        percentageList(cont, 1) =  percentageMatrix(x, y);
    end
end

end

