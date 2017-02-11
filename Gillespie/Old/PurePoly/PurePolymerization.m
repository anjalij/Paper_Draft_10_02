%This just generates the entropy curve for  pure polymerization

Trials=10000
EntropyGr=[];
load('PolyEnz.mat')
ENZ=ENZ
a=0;
Error=10;
for j=1:Error
    for i=0.1:0.5:20.1
        a=a+1;
        ResidenceTime=3*i
        glycans=Compartmentalization2(Trials,ResidenceTime,ENZ,{'7'},{'7'});
        %fileName=['glycanSim_',mat2str(ResidenceTime),'.mat'];
        %save(fileName,'glycans');
        [ProbDist,Freq]=SimulationProbs(glycans, Trials);
        Entropy=-sum(ProbDist.*log(ProbDist));
        EntropyGr(a,2+j)=[Entropy];
    end
    save('EntropyGr.mat','EntropyGr');
end