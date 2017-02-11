%This just collects the frequencies for each observed structure

load('ObservedStruct.mat')
dirData=dir('Freq')

ObsFreq=zeros(size(dirData,1)-2,5);

for i=3:size(dirData,1)
    fileName=['Freq/',dirData(i).name];
    load(fileName);
    ResidenceTime=str2num(dirData(i).name(23:end-4));
    ObsFreq(i,1)=ResidenceTime
    for j=1:length(ObservedStruct)
        ix=find(ismember(Freq(:,1),ObservedStruct(j)))
        if ~isempty(ix)
            ObsFreq(i,j+1)=cell2mat(Freq(ix,3))/10000
        end
    end
end

ObsFrequencies=ObsFreq(3:end,:)
ObsFrequencies(:,6)=ObsFrequencies(:,2)+ObsFrequencies(:,3)+ObsFrequencies(:,4)+ObsFrequencies(:,5);
ObsFrequencies=sortrows(ObsFrequencies,1);

figure

plot(ObsFrequencies(:,1),ObsFrequencies(:,2),'--ro')
hold on
plot(ObsFrequencies(:,1),ObsFrequencies(:,3),'--go')
plot(ObsFrequencies(:,1),ObsFrequencies(:,4),'--co')
plot(ObsFrequencies(:,1),ObsFrequencies(:,5),'--bo')
plot(ObsFrequencies(:,1),ObsFrequencies(:,6),'--yo')