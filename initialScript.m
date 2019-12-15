function initialScript(topologyPath)
%PROCESSTRAFFIC Summary of this function goes here
%   Detailed explanation goes here

matrixCount = 1;
heuristicCount = 3;
sdnCount = 0;


simulationResults = zeros((matrixCount*matrixCount*(sdnCount+1)), 8);

dataVars = {'A','C','N','netLink','T1','T2','T3','T4','T5'};
S = load(topologyPath,dataVars{:});
nodes = S.N;

fil = 0;
for matrix = 1:matrixCount
    switch (matrix)
        case 1
            trafficMatrix = S.T1;
            trafficMatrixName = "S.T1";
        case 2
            trafficMatrix =  S.T2;
            trafficMatrixName = "S.T2";
        case 3
            trafficMatrix =  S.T3;
            trafficMatrixName = "S.T3";
        case 4
            trafficMatrix =  S.T4;
            trafficMatrixName = "S.T3";
        case 5
            trafficMatrix =  S.T5;
            trafficMatrixName = "S.T4";
    end
    for  heuristic = 0:heuristicCount-1
        switch(heuristic)
            case 0
                heuristicName = "HDF";
            case 1
                heuristicName = "HCC";
            case 2
                heuristicName = "HBC";
        end
        
        
        for sdn = 0:sdnCount
            fil = fil + 1;
            disp(fil);
            simulationResults(fil, 1) = matrix;
            simulationResults(fil, 2) = heuristic;
            simulationResults(fil, 3) = sdn;
            
            [percentageList, finalMatrix, offNodes, errors] = mogaSDN('nobel_tfg.mat',heuristicName, sdn, 1, trafficMatrix);
            
            %GetMax
            max = 0;
            for x = 1:nodes*nodes
                cont = percentageList(x);
                if(cont >= max)
                    max = cont;
                end
            end
            simulationResults(fil, 4)=max;
            
            %GetAvg
            cont = 0;
            for x = 1:nodes*nodes
                cont = cont + percentageList(x);
            end
            avg = cont/(nodes*nodes);
            simulationResults(fil, 5)=avg;
            
            %GetMin
            min = 100;
            for x = 1:nodes*nodes
                cont = percentageList(x);
                if cont ~= 0
                    if(cont <= min)
                        min = cont;
                    end
                end
            end
            simulationResults(fil, 6)=min;
            
            simulationResults(fil, 7)= errors;
            
             simulationResults(fil, 8)= offNodes;
        end
    end
end

csvwrite("SimulationResults.csv",simulationResults);

disp("======== End of simulation =========");

end

