%Calculates the entropies from the first and second compartments.

dirData = dir('FirstCompFreq');
for i=3:size(dirData,1)
    fileName=[dirData(i).name];
    EN_1(i-2,1)=str2num(fileName(11:end-4));
    load(['FirstCompFreq/',fileName])
    F=cell2mat(Freq(:,2))/10000;
    EN_1(i-2,2)=-sum(F.*log2(F));
end
EN_1=sortrows(EN_1,1);

dirData = dir('SecondCompFreq');
for i=3:size(dirData,1)
    fileName=[dirData(i).name];
    EN_2(i-2,1)=str2num(fileName(11:end-4));
    load(['SecondCompFreq/',fileName])
    F=cell2mat(Freq(:,2))/10000;
    EN_2(i-2,2)=-sum(F.*log2(F));
end
EN_2=sortrows(EN_2,1);

dirData = dir('ThirdCompFreq');
for i=3:size(dirData,1)
    fileName=[dirData(i).name];
    EN_3(i-2,1)=str2num(fileName(11:end-4));
    load(['ThirdCompFreq/',fileName])
    F=cell2mat(Freq(:,2))/10000;
    EN_3(i-2,2)=-sum(F.*log2(F));
end
EN_3=sortrows(EN_3,1);

