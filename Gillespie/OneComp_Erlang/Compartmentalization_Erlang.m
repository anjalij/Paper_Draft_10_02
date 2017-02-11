function [ glycans ] = Compartmentalization_Erlang( Trials,ResidenceTime, ENZ,inputSub,tip,compartments )

%this runs a compartmental simulation from Trials times. and outputs the
%glycans. however, it draws the random wt for compartmental exit from an
%erlang distribution. the number of compartments needs to be put in as an
%extra parameter!



%UCompartmentalization3 is different because it has an inputSub and a tip
%input, so that the starting substrate does not have to be empty unlike
%Compartmentalization. It is different from 3 because it allows c different
%residence times in each compartment

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
    [GlycanSim{1},Ends{1},Times(1),NoReactions(1)]=OneCompartmentSimER(ResidenceTime(1),LINKAGES{1},inputSub,tip,0,compartments);
    if ~isempty(GlycanSim{1})
        for j=2:noComp
            [GlycanSim{j},Ends{j},Times(j),NoReactions(j)]=OneCompartmentSimER(ResidenceTime(j),LINKAGES{j},GlycanSim{j-1},Ends{j-1},0,compartments);
        end
    else
        for j=2:noComp
            'hi'
            Times(j)=exprnd(ResidenceTime(j));
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