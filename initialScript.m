function initialScript(topologyPath)
%INITIALSCRIPT Launches all possible simulations for one topology and
%returns the simulation's results. 
%   topologyPath: Topology's filename.

matrixCount = 5;
heuristicCount = 3;

dataVars = {'A','C','N','netLink','T1','T2','T3','T4','T5'};
S = load(topologyPath,dataVars{:});
nodes = S.N;
sdnCount = S.N;

SimulationResults = zeros((matrixCount*matrixCount*(sdnCount+1)), 12);
SimulationResultsMat= cell((matrixCount*matrixCount*(sdnCount+1)), 12);

disp("======== Start simulation =========");

fil = 0;
for matrix = 1:matrixCount
    switch (matrix)
        case 1
            disp("--------- Traffic Matrix 1 ---------");
            trafficMatrix = S.T1;
        case 2
            disp("--------- Traffic Matrix 2 ---------");
            trafficMatrix =  S.T2;
        case 3
            disp("--------- Traffic Matrix 3 ---------");
            trafficMatrix =  S.T3;
        case 4
            disp("--------- Traffic Matrix 4 ---------");
            trafficMatrix =  S.T4;
        case 5
            disp("--------- Traffic Matrix 5 ---------");
            trafficMatrix =  S.T5;
    end
    for  heuristic = 0:heuristicCount-1
        switch(heuristic)
            case 0
                disp("- Heuristic 0: HDF");
                heuristicName = "HDF";
            case 1
                disp("- Heuristic 1: HCC");
                heuristicName = "HCC";
            case 2
                disp("- Heuristic 2: HBC");
                heuristicName = "HBC";
        end
        
        
        for sdn = 0:sdnCount
            
            disp(sdn);
            auxMatrix = zeros(5, 12);
            fil = fil + 1;
            for it = 1:5
                auxMatrix(it, 1) = matrix;
                auxMatrix(it, 2) = heuristic;
                auxMatrix(it, 3) = sdn;
                
                SimulationResults(fil, 1) = matrix;
                SimulationResults(fil, 2) = heuristic;
                SimulationResults(fil, 3) = sdn;
                
                [percentageList, finalPercentageList, offLinks, errors, processingTime] = trafficSDN(topologyPath,heuristicName, sdn, 1, trafficMatrix);
                
 
                %GetMax
                max = 0;
                for x = 1:nodes*nodes
                    cont = percentageList(x);
                    if(cont >= max)
                        max = cont;
                    end
                end
                auxMatrix(it, 4)=max;
                SimulationResults(fil, 4) = max;
                
                %GetAvg
                cont = 0;
                for x = 1:nodes*nodes
                    cont = cont + percentageList(x);
                end
                avg = cont/(nodes*nodes);
                auxMatrix(it, 5)=avg;
                SimulationResults(fil, 5) = avg;
                
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
                auxMatrix(it, 6)=min;
                SimulationResults(fil, 6) = min;
                
                auxMatrix(it, 7)= errors;
                SimulationResults(fil, 7) = errors;
                
                %Get final phase results
                
                %GetMax
                max = 0;
                for x = 1:nodes*nodes
                    cont = finalPercentageList(x);
                    if(cont >= max)
                        max = cont;
                    end
                end
                auxMatrix(it, 8)=max;
                SimulationResults(fil, 8) = max;
                
                %GetAvg
                cont = 0;
                for x = 1:nodes*nodes
                    cont = cont + finalPercentageList(x);
                end
                avg = cont/(nodes*nodes);
                auxMatrix(it, 9)=avg;
                SimulationResults(fil, 9) = avg;
                
                %GetMin
                min = 100;
                for x = 1:nodes*nodes
                    cont = finalPercentageList(x);
                    if cont ~= 0
                        if(cont <= min)
                            min = cont;
                        end
                    end
                end
                auxMatrix(it, 10)=min;
                SimulationResults(fil, 10) = min;
                
                auxMatrix(it, 11)= offLinks;
                SimulationResults(fil, 11) = offLinks;
                
                auxMatrix(it, 12)= processingTime;
                SimulationResults(fil, 12) = processingTime;
            end
            
            for count = 1:12
                valMatrix = zeros(1, 5);
                for it = 1:5
                    valMatrix(1, it) = auxMatrix(it, count);
                end
                valCell = mat2cell(valMatrix, 1);
                SimulationResultsMat(fil, count) = valCell;
            end
        end
    end
end

csvwrite("SimulationResults.csv",SimulationResults);
save("SimulationResults.mat", 'SimulationResultsMat','-mat');

disp("======== End of simulation =========");

end

