Trials=10000
EntropyGr=[];
load('Best3Comp.mat')
Error=10;
for j=1:Error
a=0
    for i=20.1:0.5:33
        a=a+1;
        ResidenceTime=i
        glycans=Compartmentalization(Trials,ResidenceTime,ENZ);
        fileName=['glycanSim_',mat2str(ResidenceTime),'.mat'];
        save(fileName,'glycans');
        ProbDist=SimulationProbs(glycans, Trials);
        Entropy=-sum(ProbDist.*log(ProbDist));
        EntropyGr(a,3+j)=Entropy;
    end
    %save('EntropyGrBest3.mat','EntropyGr')
end