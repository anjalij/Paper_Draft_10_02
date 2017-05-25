dirData=dir('FirstCompFreq');
for i=3:68
    fileName=[dirData(i).name];
    load(['FirstCompFreq/',fileName])
    time=str2num(fileName(11:end-4));
    F=cell2mat(FrequencyPlot(:,3))/10000;
    EN_1(i-2,1)=time;
    EN_1(i-2,2)=-sum(F.*log2(F));
end

dirData=dir('SecondCompFreq');
for i=3:68
    fileName=[dirData(i).name];
    load(['SecondCompFreq/',fileName])
    time=str2num(fileName(11:end-4));
    F=cell2mat(FrequencyPlot(:,3))/10000;
    EN_2(i-2,1)=time;
    EN_2(i-2,2)=-sum(F.*log2(F));
end

dirData=dir('Freq');
for i=3:68
    fileName=[dirData(i).name];
    load(['Freq/',fileName])
    time=str2num(fileName(23:end-4));
    F=cell2mat(Freq(:,3))/10000;
    EN_3(i-2,1)=time;
    EN_3(i-2,2)=-sum(F.*log2(F));
end
