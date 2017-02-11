function [ glycan,ends,time,k ] = OneCompartmentSim( ResidenceTime,LinkageMap, glycan,ends,Init_Time, compartments )
%This draws easy compartmental time from a Erlang distribution (c=3)....Takes in a set of enzymes, a starting substrate and a residence time and
%outputs a structure and the time it took to make it. It also gives an
%initial time so that I can string these together into a series of
%compartments. 

%The input competing enzymes contains a list of the enzymes that compete
%with eachother so that when I am checking a branching reaction, I make
%sure that the structure does not yet have 


time=Init_Time; %This is set to zero if this is the first compartment, otherwise it is updated.
k=0;

if isempty(glycan)
    %if FirstComp==1
        ER=exprnd(3,1);
        WT1=[exprnd(ResidenceTime),exprnd(1)];
        if WT1(2)>WT1(1)
            time=time+WT1(1);
            return
        else
            time=time+WT1(2);
            glycan={['1'],['1','3']};%The 3 is a blank color indicating right branching. If 3 is present it indicates that 4 or 5 can act. 
            ends={'1','3'};
            k=k+1;
        end
    %else
    %    time=time+exprnd(ResidenceTime)
    %end
        
end


export=0;

%defining the tips of the glycan structure where the enzymes can act.
%Instead of recounting the ends each time the structure is updated, the
%ends will be updated along with the structure. This just initializes the
%ends based on the input structure. 


while export==0
    %I probably do not need to search for the Active Enzymes everytime if I
    %save the structures that I have updated. But this seems slightly
    %easier than coming up with a scheme to update the active enzymes along
    %with the ends. 
    EnzSub=unique(ends); %the set of unique tips/enzyme substrates
    ActiveLinks={};
    WT=[];
    for j=1:length(EnzSub)
        %for each end I find out what can act after it, but I save the
        %whole linkage
        ActiveLinks=[ActiveLinks;LinkageMap(find(ismember(LinkageMap(:,1),EnzSub{j})),:)];
    end
    %UniqueLinks=unique(ActiveLinks,'rows');
    UniqueActiveEnzymes=unique(ActiveLinks(:,2));
    if isempty(UniqueActiveEnzymes) %If no enzymes can act
        export=export+1;
        time=time+exprnd(ResidenceTime);
        break
    else
        WT=[exprnd(1),exprnd(ResidenceTime)];
    end
        minWT=min(WT); %finds the minimum waiting time export or reaction
        if minWT==WT(2) %the minimum time equals the export index
            time=time+WT(end);
            export=1;
            break
        else %otherwise an enzyme acts
            k=k+1;
            ActiveEnzyme=UniqueActiveEnzymes{randi(length(UniqueActiveEnzymes))}; %picks a random       time=time+WT(EnzInd); %time update
            time=time+WT(1); %updates the time
            ActiveIndex=find(ismember(ActiveLinks(:,2),ActiveEnzyme)); %find all the index instances where it could have acted
            ActiveEndIndices=[];
            for i=1:length(ActiveIndex)
                ActiveEndIndices=[ActiveEndIndices,find(ismember(ends,ActiveLinks(ActiveIndex(i))))]; %finds all of the ends that can be acted on by this enzyme
            end
            ActiveEndIndices=unique(ActiveEndIndices);%should already be unique!
            RandI=randi(length(ActiveEndIndices)); %picks an end at random
            UpdateIndex=ActiveEndIndices(RandI); %indexing of glycans and ends should be the same
            %UpdateEnd=ends{UpdateIndex}; %identifies the correct end to update
            if isequal(ActiveEnzyme,'5')
                glycan{UpdateIndex}(end)=ActiveEnzyme; %Replace fake color 3 with 5
                ends{UpdateIndex}=ActiveEnzyme; %updates the ends
            elseif isequal(ActiveEnzyme,'4')
                glycan{UpdateIndex}(end)=ActiveEnzyme; %Replace fake color 3 with 4
                glycan=[glycan,[glycan{UpdateIndex},'9']]; %Add fake color 9 to 4 to indicate potential branching
                ends{UpdateIndex}=ActiveEnzyme;
                ends=[ends,'9'];
            elseif isequal(ActiveEnzyme,'8')
                glycan{UpdateIndex}=[glycan{UpdateIndex},'8']; %update the chain with 11
                glycan=[glycan,[glycan{UpdateIndex},'9']];
                ends{UpdateIndex}=ActiveEnzyme;%add fake color 9 to 11 to indicate potential 7 branching
                ends=[ends,'9'];
            elseif isequal(ActiveEnzyme,'7')
                glycan{UpdateIndex}(end)=ActiveEnzyme;
                ends{UpdateIndex}=ActiveEnzyme;
            else
                glycan{UpdateIndex}=[glycan{UpdateIndex},ActiveEnzyme]; %Update chain with new enzyme
                ends{UpdateIndex}=ActiveEnzyme;
            end
        end
end
%if ~isempty(glycan)
    %glycan=sort(glycan);
    %ends=sort(ends);
%end
end

