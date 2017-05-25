dirData= dir('Simulations');
for k=3:68
    B=dirData(k).name
    fileName=['Simulations/',B];
    load(fileName);
    time=fileName(23:end-4)
    Comp2CondDist=glycans(:,7);
    Comp2CondDist=[Comp2CondDist,glycans(:,8)];
    for i=1:10000
        Cprs{i,1}=[Comp2CondDist{i,1},Comp2CondDist{i,2}];
    end

    [Un,B]=unique(Cprs);

    FrequencyPlot={};

    for i=1:size(Un,1)
        X=Comp2CondDist{B(i),1};
        Y=Comp2CondDist{B(i),2};
        noOcc=sum(ismember(Cprs,Un{i}));
        FrequencyPlot=[FrequencyPlot;{X,Y,noOcc}];
    end
    save(['ConditionDist2/Comp2CondDist_',time,'.mat'],'FrequencyPlot');
    
    Comp3CondDist=glycans(:,8);
    Comp3CondDist=[Comp3CondDist,glycans(:,1)];
    for i=1:10000
        Cprs{i,1}=[Comp3CondDist{i,1},Comp3CondDist{i,2}];
    end

    [Un,B]=unique(Cprs);

    FrequencyPlot={};

    for i=1:size(Un,1)
        X=Comp3CondDist{B(i),1};
        Y=Comp3CondDist{B(i),2};
        noOcc=sum(ismember(Cprs,Un{i}));
        FrequencyPlot=[FrequencyPlot;{X,Y,noOcc}];
    end
    save(['ConditionDist3/Comp3CondDist_',time,'.mat'],'FrequencyPlot');
end