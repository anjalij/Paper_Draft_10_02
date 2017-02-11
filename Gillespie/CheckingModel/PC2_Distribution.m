%This checks the distribution of the perfect clock with two branches

max_len1=4;
max_len2=1;
%Dtime=[0.1,1,2,5,10,20];
Dtime=[1];
noTrials=10000;
noProducts=10;

Trials=zeros(noTrials,3,length(Dtime));
Prob_Dist=zeros(noProducts,3,length(Dtime));

for j=1:length(Dtime)
    for i=1:noTrials
        [glycan,time]=PerfectClock2(Dtime(j),max_len1,max_len2);
        Trials(i,:,j)=[glycan,time];
    end

    %Counting how many times each structure appears
    [structures,x,indices]=unique(Trials(:,1:2,j),'rows');
    Prob_Dist(1:size(structures,1),:,j)=[structures,ones(size(structures,1),1)];

    for i=1:noProducts
            Prob_Dist(i,3,j)=size(find(indices==i),1)/noTrials;
    end
end