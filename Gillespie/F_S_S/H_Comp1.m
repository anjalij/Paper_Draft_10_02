dirData = dir('FirstCompFreq');
for i=3:size(dirData,1)
    fileName=['FirstCompFreq/',dirData(i).name];
    EN_1(i-2,1)=str2num(fileName(25:end-4));
    load(fileName)
    F=cell2mat(FrequencyPlot(:,3))/10000;
    EN_1(i-2,2)=-sum(F.*log2(F));
end
EN_1=sortrows(EN_1,1);