Trials=10000
EntropyGr=[];
a=0;
    for i=0.1:0.5:33
        a=a+1
        ResidenceTime=i
        glycans=Compartmentalization2(Trials,ResidenceTime,ENZ,[],[]);
        fileName=['glycanSimulations/glycanSim_',mat2str(ResidenceTime),'.mat'];
        save(fileName,'glycans');
        [ProbDist,Freq]=SimulationProbs(glycans, Trials);
        fileName=['Freq/Freq_',mat2str(i),'.mat'];
        save(fileName,'Freq');
        Entropy=-sum(ProbDist.*log(ProbDist));    
        EntropyGr(a,1)=Entropy;
        save('EntropyGrFinal.mat','EntropyGr')
    end
