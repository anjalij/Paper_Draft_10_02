%Best Three Compartment Organization

load('CompleteLinkageMap.mat');

Trials=10000;
ResidenceTime=1;
ENZ1={'1','3','4','6','9'};%had to put in fake colors, wherever enzyme implied one
ENZ2={'2','0','8','9'};
ENZ3={'7','0','5'};

LINKAGE1={};
LINKAGE2={};
LINKAGE3={};
for i=1:size(CompleteLinkageMap,1)
    if ismember(CompleteLinkageMap{i,1},ENZ1)
        if ismember(CompleteLinkageMap{i,2},ENZ1)
            LINKAGE1=[LINKAGE1;CompleteLinkageMap(i,:)];
        end
    end
    if ismember(CompleteLinkageMap(i,2),ENZ2)
        if ismember(CompleteLinkageMap(i,1),[ENZ1,ENZ2])
            LINKAGE2=[LINKAGE2;CompleteLinkageMap(i,:)];
        end
    end
    if ismember(CompleteLinkageMap(i,2),ENZ3)
        if ismember(CompleteLinkageMap(i,1),[ENZ1,ENZ2,ENZ3])
            LINKAGE3=[LINKAGE3;CompleteLinkageMap(i,:)];
        end
    end
end
tic
glycans={};
for i=1:1
    [Glycan1,Ends1,Time1,NoReactions1]=OneCompartmentSim(ResidenceTime,LINKAGE1,{},{},0);
    Glycan1
    if ~isempty(Glycan1)
       [Glycan2,Ends2,Time2,NoReactions2]=OneCompartmentSim(ResidenceTime,LINKAGE2,Glycan1,Ends1,0);
       Glycan2
       [Glycan3,Ends3,Time3,NoReactions3]=OneCompartmentSim(ResidenceTime,LINKAGE3,Glycan2,Ends2,0);
       Glycan3
    else
        Glycan2=Glycan1;
        Ends2=Ends1;
        Glycan3=Glycan1;
        Ends3=Ends1;
    end
    A=[];
    if isempty(Glycan3)
        A=' ';
    end
    Glycan3=sort(Glycan3);
    for j=1:length(Glycan3)
        A=[A,Glycan3{j}];
    end
    glycans=[glycans; {A},{Glycan1},{Glycan2},{Glycan3},{Ends1},{Ends2},{Ends3},[Time1,Time2,Time3],[NoReactions1,NoReactions2,NoReactions3]];
end

UniqueStructs=unique(glycans(:,1));
FrequencyPlot={};
for i=1:length(UniqueStructs)
    indices=find(ismember(glycans(:,1),UniqueStructs(i)));
    FrequencyPlot=[FrequencyPlot;{UniqueStructs{i}}, {glycans{indices(1),4}},length(indices),{indices}];
end
toc