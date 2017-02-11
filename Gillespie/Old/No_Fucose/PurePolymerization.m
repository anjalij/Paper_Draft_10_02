%This just generates the entropy curve for  pure polymerization

Trials=10000
EntropyGr=[];
load('Polymerizing_No_Tips.mat')
ENZ={ENZ}
a=0;
Error=10;
%for j=1:Error
    for i=9.6:0.5:33
        a=a+1;
        ResidenceTime=3*i
        glycans=Compartmentalization_Erlang(Trials,ResidenceTime,ENZ,[],[],3);
        fileName=['glycanSim_',mat2str(ResidenceTime),'.mat'];
        save(fileName,'glycans');
        [ProbDist,Freq]=SimulationProbs(glycans, Trials);
        Entropy=-sum(ProbDist.*log(ProbDist));
        EntropyGr(a,1)=[Entropy];
    end
    save('EntropyGr2.mat','EntropyGr');
%end