function [ probDist,FrequencyPlot ] = SimulationProbs( glycans,noTrials )
%Takes in the glycan structures and outputs counts the frequencies of each
%structure, outputing a probability of finding each structure. 

UniqueStructs=unique(glycans(:,1));
FrequencyPlot={};
for i=1:length(UniqueStructs)
    indices=find(ismember(glycans(:,1),UniqueStructs(i)));
    noRx=sum(glycans{indices(1),6});
    FrequencyPlot=[FrequencyPlot;{UniqueStructs{i}}, {glycans{indices(1),2}},length(indices),{indices},noRx];
end

probDist=cell2mat(FrequencyPlot(:,3))./noTrials;

end

