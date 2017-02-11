Trials=10000
for j=1%:10
    a=0
    for i=61.8:1.5:99
        a=a+1; 
        ResidenceTimes=zeros(3,1);
        TotalTime=i%Times(i);
        ResidenceTimes(1)=TotalTime/11;
        ResidenceTimes(2)=5*TotalTime/11;
        ResidenceTimes(3)=5*TotalTime/11;
        fileName=['glycanSim_',mat2str(TotalTime),'_',mat2str(ResidenceTimes(1)),'_',mat2str(ResidenceTimes(2)),'.mat'];    
        glycans=Compartmentalization3(Trials,ResidenceTimes,ENZ,[],[]);
        save(fileName,'glycans');

        [ProbDist,Freq]=SimulationProbs(glycans,10000);
        Entropy=-sum(ProbDist.*log(ProbDist));
        Entropy=-sum(ProbDist.*log(ProbDist));
        EntropyGr(a,j)=Entropy;
    end
end
