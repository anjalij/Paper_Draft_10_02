%gets the structures from intermediate compartments
dirData = dir('glycanSimulations');
EN=[];
for j=3:68
    B=dirData(j).name;
    fileName=['glycanSimulations/',dirData(j).name]
    load(fileName)
    firstcomp={};
    for i=1:10000
        firstcomp{i}=glycans{i,3}{1,1};
    end


    firstcomp2={};
    for i=1:10000
    Products=firstcomp{i};
     A=[];
        if isempty(Products)
            A=' ';
        end
        Products=sort(Products);
        for j=1:length(Products)
            A=[A,Products{j}];
        end
        firstcomp2{i}=A;
    end

    UniqueStructs=unique(firstcomp2);
    FrequencyPlot={};
    for i=1:length(UniqueStructs)
        indices=find(ismember(firstcomp2,UniqueStructs(i)));
        if length(glycans{indices(1),6})>1
            noRx=glycans{indices(1),6}(1);
        else
            noRx=glycans{indices(1),6}(1);
        end
        FrequencyPlot=[FrequencyPlot;{UniqueStructs{i}}, {firstcomp2{indices(1)}},length(indices),{indices},noRx];
    end
    dirData(j).name
   
    SaveFile=['FirstCompFreq/',B]
    save(SaveFile,'FrequencyPlot');
    entropy=-sum(cell2mat(FrequencyPlot(:,3))/10000.*log2(cell2mat(FrequencyPlot(:,3))/10000));
    EN=[EN,entropy];
end
