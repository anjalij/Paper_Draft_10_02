dirData = dir('Freq');
for i=3:size(dirData,1)
    fileName=[dirData(i).name]
    load(fileName)
    A=[A,length(Freq)]
    AllStruct=[AllStruct;Freq(:,[1,5])];
end

        