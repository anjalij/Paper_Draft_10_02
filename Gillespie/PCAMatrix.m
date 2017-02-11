%This script assigns a vector to each simulation time.

ProgramData=zeros(73811,66);

dirData=dir('Freq')
for i=3:size(dirData,1)
    load(dirData(i).name);
    ResidenceTime=str2num(dirData(i).name(6:end-4));
    ProgramData(1,i-2)=ResidenceTime;
    for j=1:size(Freq,1)
        ix=find(ismember(AllStructures(:,1),Freq(j,1)));
        ProgramData(ix+1,i-2)=cell2mat(Freq(j,3));
    end
end
%A=[0;AllStructures(:,1)]
%ProgramData=[A,ProgramData];
%ProgramData=sortrows(ProgramData',1)