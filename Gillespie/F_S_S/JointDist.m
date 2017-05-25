dirData= dir('Simulations');
for k=3:68
    B=dirData(k).name
    fileName=['Simulations/',B];
    load(fileName);
    time=fileName(23:end-4)
    Comp2JointDist=glycans(:,7);
    Comp2JointDist=[Comp2JointDist,glycans(:,8)];
    for i=1:10000
        Cprs{i,1}=[Comp2JointDist{i,1},Comp2JointDist{i,2}];
    end

    [Un,B]=unique(Cprs);

    FrequencyPlot={};

    for i=1:size(Un,1)
        X=Comp2JointDist{B(i),1};
        Y=Comp2JointDist{B(i),2};
        noOcc=sum(ismember(Cprs,Un{i}));
        FrequencyPlot=[FrequencyPlot;{X,Y,noOcc}];
    end
    save(['JointDist2/Comp2JtDist_',time,'.mat'],'FrequencyPlot');
    
    Comp3JointDist=glycans(:,8);
    Comp3JointDist=[Comp3JointDist,glycans(:,1)];
    for i=1:10000
        Cprs{i,1}=[Comp3JointDist{i,1},Comp3JointDist{i,2}];
    end

    [Un,B]=unique(Cprs);

    FrequencyPlot={};

    for i=1:size(Un,1)
        X=Comp3JointDist{B(i),1};
        Y=Comp3JointDist{B(i),2};
        noOcc=sum(ismember(Cprs,Un{i}));
        FrequencyPlot=[FrequencyPlot;{X,Y,noOcc}];
    end
    save(['JointDist3/Comp3JtDist_',time,'.mat'],'FrequencyPlot');
end