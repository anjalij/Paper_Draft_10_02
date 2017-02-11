Trials=10000
load('ENZ.mat')
Error=10;
for j=1:Error
    a=0
    for i=0.1:0.5:20.1
        a=a+1
        ResidenceTime=3*i
        glycans=Compartmentalization2(Trials,ResidenceTime,ENZ,{'7'},{'7'});
        %fileName=['glycanSim_',mat2str(ResidenceTime),'.mat'];
        %save(fileName,'glycans');
        [ProbDist,Freq]=SimulationProbs(glycans, Trials);
        Entropy=-sum(ProbDist.*log(ProbDist));    
        EntropyGr(a,3+j)=Entropy;
    end
    save('EntropyTips.mat','EntropyGr')
end