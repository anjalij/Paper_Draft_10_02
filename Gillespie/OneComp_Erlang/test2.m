%just extracts the high abundance structures...
Direct=dir('ThirdCompFreq')
large_struct={};
for i=3:68
    fileName=Direct(i).name;
    load(['ThirdCompFreq/',fileName])
    C=cell2mat(Freq(:,2));
    ix=find(C>=10);
    large_struct=[large_struct;Freq(ix,1)];
    large_struct=unique(large_struct);
end