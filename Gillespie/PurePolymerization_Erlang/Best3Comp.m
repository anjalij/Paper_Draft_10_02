%This just generates the entropy curve for  pure polymerization

Trials=10000
EntropyGr=[];
load('Best3Comp.mat')
ENZ={ENZ}
a=0;
Error=10;
%for j=1:Error
    for i=0.1:0.5:33
        a=a+1;
        ResidenceTime=i
        glycans=Compartmentalization2(Trials,ResidenceTime,ENZ,[],[],3);
        fileName=['Simulations/glycanSim_',mat2str(ResidenceTime),'.mat'];
        save(fileName,'glycans');
        [ProbDist,Freq]=SimulationProbs(glycans, Trials);
        Entropy=-sum(ProbDist.*log(ProbDist));
        EntropyGr(a,1)=[Entropy];
    end
    save('EntropyGr2.mat','EntropyGr');
%end