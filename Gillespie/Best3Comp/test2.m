Direct=dir('ThirdCompFreq');
wrong=[];
for i=3:68
    fileName=Direct(i).name;
    load(['ThirdCompFreq/',fileName])
    no=str2num(fileName(11:end-4));
    for j=2:157
        struct=Struct_Obs{i,1};
        ix=find(ismember(Freq(:,1),struct));
        col=find(B(1,:)==no;
        if ~isequal(cell2mat(Freq(ix,2))/10000,B(j,col))
            wrong=[wrong;j,no];
            break
        end
    end
end    