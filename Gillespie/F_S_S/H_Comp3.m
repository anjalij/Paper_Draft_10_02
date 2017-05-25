dirData = dir('Freq');
for i=3:size(dirData,1)
    fileName=['Freq/',dirData(i).name];
    EN_3(i-2,1)=str2num(fileName(28:end-4));
    load(fileName)
    F=cell2mat(Freq(:,3))/10000;
    EN_3(i-2,2)=-sum(F.*log2(F));
end
EN_3=sortrows(EN_3,1);