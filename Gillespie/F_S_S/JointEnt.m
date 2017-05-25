dirData=dir('JointDist2');
JointH2=[];
for i=3:68
    fileName=[dirData(i).name]
    load(fileName)
    time=str2num(fileName(13:end-4));
    JointH2(i-2,1)=time;
    F=cell2mat(FrequencyPlot(:,3))/10000;
    JointH2(i-2,2)=-sum(F.*log2(F));
end
JointH2=sortrows(JointH2,1);

dirData=dir('JointDist3');
JointH3=[];
for i=3:68
    fileName=[dirData(i).name]
    load(fileName)
    time=str2num(fileName(13:end-4));
    JointH3(i-2,1)=time;
    F=cell2mat(FrequencyPlot(:,3))/10000;
    JointH3(i-2,2)=-sum(F.*log2(F));
end
JointH3=sortrows(JointH3,1);