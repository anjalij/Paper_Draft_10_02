function [ glycans ] = Compartmentalization( Trials,ResidenceTime, ENZ,inputSub )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

load('CompleteLinkageMap.mat');

%Pulling apart the compartments
noComp=size(ENZ,1);
LINKAGES=cell(3,1);
for i=1:size(CompleteLinkageMap,1)
    for j=1:noComp
        if ismember(CompleteLinkageMap{i,2},ENZ{j})
            if ismember(CompleteLinkageMap{i,1},unique([ENZ{1:j,:}]))
                LINKAGES{j}=[LINKAGES{j};CompleteLinkageMap(i,:)];
            end
        end
    end
end


glycans={};
for i=1:Trials
    %i
    GlycanSim=cell(noComp,1);
    Ends=cell(noComp,1);
    Times=zeros(noComp,1);
    noReactions=zeros(noComp,1);
    [GlycanSim{1},Ends{1},Times(1),NoReactions(1)]=OneCompartmentSim(ResidenceTime,LINKAGES{1},{},{},0);
    if ~isempty(GlycanSim{1})
        for j=2:noComp
            [GlycanSim{j},Ends{j},Times(j),NoReactions(j)]=OneCompartmentSim(ResidenceTime,LINKAGES{j},GlycanSim{j-1},Ends{j-1},0);
        end
    else
        for j=2:noComp
            Times(j)=exprnd(ResidenceTime);
        end
    end
    Products=GlycanSim{end};
    A=[];
    if isempty(Products)
        A=' ';
    end
    Products=sort(Products);
    for j=1:length(Products)
        A=[A,Products{j}];
    end
    glycans=[glycans; {A},{Products},{GlycanSim},{Ends},Times,NoReactions];
end

end