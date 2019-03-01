function mogaSDN (topology, topologyPath, initialPopulationPath, trafficMatrix, alpha, wildcards, generations, population, outputDir)

    global nvars; %Number of variables considered in the problem
    global mapCapacity;
    global nodes;
    global interval;
    global capMatrix;
    global sdDemand;
    global maxRules;
    global useWildcards;

    warning('OFF');
    
    strFileName = strcat ('',topology);
    strFileName = strcat (strFileName,'-');
    strFileName = strcat (strFileName,trafficMatrix);
    strFileName = strcat (strFileName,'-');
    strFileName = strcat (strFileName,alpha);
    strFileName = strcat (strFileName,'-');
    strFileName = strcat (strFileName,wildcards);
    strFileName = strcat (strFileName,'-');
    strFileName = strcat (strFileName,generations);
    strFileName = strcat (strFileName,'-');
    strFileName = strcat (strFileName,population);
    
    strFileResults = strcat (outputDir,strFileName);
    strFileResults = strcat (strFileResults,'.csv');
    
    [arch1,error1] = fopen(strFileResults,'w');
    if (arch1 > -1)
        n1 = fprintf(arch1,'TopoID,Interval,Generations,Population,ActiveLinks,EnergySavings,AvgRules,ComputationTime\n');
    else
        err1 = 1;
        disp('Output file could not be created');
    end   
    
    strFileSolution = strcat (outputDir,strFileName);
    strFileSolution = strcat (strFileSolution,'-solution.csv');
    
    [arch2,error2] = fopen(strFileSolution,'w');

    %Import capacities and traffic matrices
    dataVars = {'A','C','C_cap','N','netLink','T1','T2','T3','T4','T5'};    
    S = load(topologyPath,dataVars{:});

    %Links
    nvars = size(S.netLink,1);
    %Nodes
    nodes = S.N;

    %Capacities matrix
    capMatrix = S.A;
    for i = 1:nvars
        capMatrix(S.netLink(i,2),S.netLink(i,3))=S.C_cap(S.netLink(i,1));
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
    
    %Initial array (full array) with all the links powered on
    fullArray = [];
    
    for i=1:nvars
        fullArray = [fullArray,1];
    end
    
    %Energy consumption assessment in case of no EE techniques availables
    energyConsumptionBefore = assessEnergyConsumptionCurrentConfigurationSDN(fullArray);
    
    interval.minutes = 1;
    interval.energyConsumption = 0;
    interval.energySavings = 0;
    interval.solution = [];
    interval.finalPopulation = [];
    interval.nodesFlowTables = [];

    switch str2num(trafficMatrix)
        case 1
            sdDemand = S.T1;
        case 2
            sdDemand = S.T2;
        case 3
            sdDemand = S.T3;
        case 4
            sdDemand = S.T4;
        case 5
            sdDemand = S.T5;
        otherwise
            disp('Incorrect traffic matrix')
    end

    totalDemands = 0;
    for j=1:nodes
        for k=1:nodes
            if (sdDemand(j,k) > 0)               
                totalDemands = totalDemands+1;
            end
        end
    end 

    maxRules = round(str2num(alpha)*totalDemands)
    useWildcards = str2num(wildcards);

    interval.minutes = i;
    
    %{
    [linkFlows, capMatrixSolution, delta] = getLinkFlowsSDN (fullArray);

    AM = linkFlows';
    CM = capMatrixSolution';

    arrayLinkLoad = assessLinkLoad(CM,AM);
    arrayLinkLoad_sorted = sortrows(arrayLinkLoad,3)
    length(arrayLinkLoad_sorted)

    initialPopulation = fullArray;

    for j=1:length(arrayLinkLoad_sorted)
        srcNode = arrayLinkLoad_sorted(j,1)
        dstNode = arrayLinkLoad_sorted(j,2)

        for k=1:length(mapCapacity)
            if ((srcNode == mapCapacity(k).fromNode) && (dstNode == mapCapacity(k).toNode))
                probability = arrayLinkLoad_sorted(j,3)
                r = rand
                if (r > probability+0.8)
                    initialPopulation(k) = 0;
                    arrayLinkLoad_sorted(j,:)
                end
            end
        end
    end
    }

    initialActiveLinks = csvread(initialPopulationPath)

    initialPopulation = [];

    for j=1:length(mapCapacity)
        srcNode = mapCapacity(j).fromNode;
        dstNode = mapCapacity(j).toNode;
        link = [srcNode dstNode];

        if (ismember(link,initialActiveLinks,'rows'))
            initialPopulation = [initialPopulation, 1];
        else
            initialPopulation = [initialPopulation, 0];
        end
    end
    %}
    startTime = datenum(now)
    %Initial population is set to ones only for the first iteration.

    initialPopulation = ones(str2num(population),nvars);

    initialPopulation
    %if (pepe == 1)
    %end

    [x fval exitflag output] = optimizeSDN(str2num(generations),str2num(population),initialPopulation);

    endTime = datenum(now);
    computationTime = etime(datevec(endTime),datevec(startTime));
    energyConsumptionBefore
    energyConsumptionAfter = fval(1,1)

    %Energy savings assessment
    energySavings = 100 - (energyConsumptionAfter*100)/energyConsumptionBefore

    %File outputs
    if (arch1 > -1)
        n1 = fprintf(arch1,'%s,%d,%s,%s,%d,%d,%.2f,%.2f\n',topology,i,generations,population,energyConsumptionAfter,energySavings,fval(1,2),computationTime);
    else
        err1 = 1;
        disp('Output file could not be created');
    end

    sol = x(1,:);

    for j=1:length(sol)
        if (sol(j) == 1)
            if (arch2 > -1)
                n2 = fprintf(arch2,'%d,%d\n',mapCapacity(j).fromNode,mapCapacity(j).toNode);
            else
                err2 = 1;
                disp('Output file could not be created');
            end
        end
    end

    interval.energyConsumption = energyConsumptionAfter;
    interval.energySavings = energySavings;
    interval.solution = x;
end