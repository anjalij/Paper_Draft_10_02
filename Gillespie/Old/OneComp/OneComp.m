Trials=10000
load('OneCompEnz.mat')
ENZ={ENZ}
%for j=1:10
    a=0
    for i=0.6:0.5:33
        a=a+1
        ResidenceTime=3*i
        glycans=Compartmentalization2(Trials,ResidenceTime,ENZ,[],[]);
        fileName=['glycanSimulations/glycanSim_',mat2str(ResidenceTime),'.mat'];
        save(fileName,'glycans');
        [ProbDist,Freq]=SimulationProbs(glycans, Trials);
        Entropy=-sum(ProbDist.*log(ProbDist));    
        EntropyGr(a,1)=Entropy;
        save('EntropyGrFinal2.mat','EntropyGr')
    end
