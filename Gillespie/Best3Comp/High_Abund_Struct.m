%just extracts the high abundance structures...

%firstcomp
high_abund_1={}
Direct=dir('FirstCompFreq')
high_abund_1={};
for i=4:68
    fileName=Direct(i).name;
    load(['FirstCompFreq/',fileName])
    C=cell2mat(FrequencyPlot(:,3));
    ix=find(C>=10);
    high_abund_1=[high_abund_1;FrequencyPlot(ix,1)];
    high_abund_1=unique(high_abund_1);
end

%second comp
Direct=dir('SecondCompFreq')
high_abund_2={};
for i=4:68
    fileName=Direct(i).name;
    load(['SecondCompFreq/',fileName])
    C=cell2mat(FrequencyPlot(:,3));
    ix=find(C>=10);
    high_abund_2=[high_abund_2;FrequencyPlot(ix,1)];
    high_abund_2=unique(high_abund_2);
end

%third_comp
Direct=dir('Frequencies')
high_abund_3={};
for i=3:68
    fileName=Direct(i).name;
    load(['Frequencies/',fileName])
    C=cell2mat(Freq(:,3));
    ix=find(C>=10);
    high_abund_3=[high_abund_3;Freq(ix,1)];
    high_abund_3=unique(high_abund_3);
end
high_abund=unique([high_abund_1; high_abund_2;high_abund_3]);