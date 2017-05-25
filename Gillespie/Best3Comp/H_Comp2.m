dirData = dir('SecondCompFreq');
for i=3:size(dirData,1)
    fileName=['SecondCompFreq/',dirData(i).name];
    EN_2(i-2,1)=str2num(fileName(26:end-4));
    load(fileName)
    F=cell2mat(FrequencyPlot(:,3))/10000;
    EN_2(i-2,2)=-sum(F.*log2(F));
end
EN_2=sortrows(EN_2,1);