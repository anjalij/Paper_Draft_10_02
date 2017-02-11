dirData = dir('Simulations');
for i=3:size(dirData,1)
    fileName=['Simulations/',dirData(i).name]
    load(fileName)
    if size(glycans,1)==10000
        [Prob,Freq]=SimulationProbs(glycans,10000);
    else
        i
    end
    fileName2=['Frequencies/Frequencies_',dirData(i).name];
    save(fileName2,'Freq')
    AllStruct=[AllStruct;Freq(:,[1,5])];
end

        