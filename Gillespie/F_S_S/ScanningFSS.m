
ResidenceTimes=zeros(3,1);
Total_Res=60.3;
RandTrials=100;
Trials=10000;
DataStore=cell(RandTrials,9);


for i=1:82%RandTrials
    tic
    RT=rand(1,2);
    A=min(RT);
    B=max(RT);
    ResidenceTimes(1)=A*Total_Res;
    ResidenceTimes(2)=B*Total_Res-ResidenceTimes(1);
    ResidenceTimes(3)=Total_Res-ResidenceTimes(1)-ResidenceTimes(2);
    glycans=Compartmentalization3(Trials,ResidenceTimes,ENZ,[],[]);
    [ProbDist,Freq]=SimulationProbs(glycans,10000);
    Entropy=-sum(ProbDist.*log(ProbDist));
    noStruct=size(ProbDist,1);
    indices=find(cell2mat(Freq(:,3))>(0.04*Trials));
    AbundStruct=Freq(indices,:);
    noAbund=size(AbundStruct,1);
    obs=0;
    for j=1:4
        if ismember(ObservedStruct{j},AbundStruct(:,1))
            obs=obs+1;
        end
    end
    DataStore{i,1}=ResidenceTimes(1);
    DataStore{i,2}=ResidenceTimes(2);
    DataStore{i,3}=glycans;
    DataStore{i,4}=Freq;
    DataStore{i,5}=Entropy;
    DataStore{i,6}=noStruct;
    DataStore{i,7}=AbundStruct;
    DataStore{i,8}=noAbund;
    DataStore{i,9}=obs;
    toc
    save('DataStore_60.3_2.mat','DataStore');
end

    
    