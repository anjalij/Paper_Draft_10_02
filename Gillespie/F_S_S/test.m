dirData = dir('glycanSimulations');
for i=3:size(dirData,1)
    fileName=['glycanSimulations/',dirData(i).name]
    load(fileName)
    if size(glycans,1)==10000
        [Prob,Freq]=SimulationProbs(glycans,10000);
    else
        i
    end
    fileName=['Freq/Frequencies_',dirData(i).name];
    save(fileName,'Freq')
    AllStruct=[AllStruct;Freq(:,[1,5])];
end

        