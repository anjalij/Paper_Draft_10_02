
clearvars

noTrials=100000;
compartments=2;
maxlen1=4;
maxlen2=1;
%ResidenceTime=20;
noProducts=10;
Residence_Times=[1.70715];
%Residence_Times=[0.1,0.5,1,2,3,4,5,10,15,20];
L=zeros(noTrials,2,length(Residence_Times));
%L=zeros(noTrials,2,1);
Prob_Dist=zeros(noProducts,3,length(Residence_Times));

for j=1:length(Residence_Times)
    for i=1:noTrials
        L(i,:,j)=TwoLengthGillespie(maxlen1,maxlen2,compartments,Residence_Times(j));
    end
    [structures,x,indices]=unique(L(:,:,j),'rows');
    Prob_Dist(1:size(structures,1),:,j)=[structures,ones(size(structures,1),1)];
    for i=1:noProducts
        Prob_Dist(i,3,j)=size(find(indices==i),1)/noTrials;
    end
end