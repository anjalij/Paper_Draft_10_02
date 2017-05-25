dirData=dir('FirstCompFreq')
EN_1=[0,0];
EN_2=[0,0];
for i=3:68
    fileName=dirData(i).name;
    load(['FirstCompFreq/',fileName]);
    time=str2num(fileName(11:end-4));
    F=cell2mat(Freq(:,2))/10000
    EN_1(i-2,1)=time;
    EN_1(i-2,2)=-sum(F.*log2(F));
end

dirData=dir('SecondCompFreq')
for i=3:68
    fileName=dirData(i).name;
    load(['SecondCompFreq/',fileName]);
    time=str2num(fileName(11:end-4));
    F=cell2mat(Freq(:,2))/10000
    EN_2(i-2,1)=time;
    EN_2(i-2,2)=-sum(F.*log2(F));
end