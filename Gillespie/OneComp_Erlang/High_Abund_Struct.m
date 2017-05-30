%just extracts the high abundance structures...

%firstcomp
high_abund_1={}
Direct=dir('FirstCompFreq')
high_abund_1={};
for i=3:68
    fileName=Direct(i).name;
    load(['FirstCompFreq/',fileName])
    C=cell2mat(Freq(:,2));
    ix=find(C>=10);
    high_abund_1=[high_abund_1;Freq(ix,1)];
    high_abund_1=unique(high_abund_1);
end

%second comp
Direct=dir('SecondCompFreq')
high_abund_2={};
for i=3:68
    fileName=Direct(i).name;
    load(['SecondCompFreq/',fileName])
    C=cell2mat(Freq(:,2));
    ix=find(C>=10);
    high_abund_2=[high_abund_2;Freq(ix,1)];
    high_abund_2=unique(high_abund_2);
end

%third_comp
Direct=dir('ThirdCompFreq')
high_abund_3={};
for i=3:68
    fileName=Direct(i).name;
    load(['ThirdCompFreq/',fileName])
    C=cell2mat(Freq(:,2));
    ix=find(C>=10);
    high_abund_3=[high_abund_3;Freq(ix,1)];
    high_abund_3=unique(high_abund_3);
end