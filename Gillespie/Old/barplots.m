
Trials=10000;


%[ProbDist,Freq]=SimulationProbs(glycans,Trials);
indices=find(cell2mat(Freq(:,3))/Trials>0.001);
Freq=Freq(indices,:);


Freq=sortrows(Freq,5);
ProbDist=cell2mat(Freq(:,3))/Trials

figure
bar(ProbDist);

lengths=unique(cell2mat(Freq(:,5)));
structures={};




for i=1:length(lengths)
    indices=find(cell2mat(Freq(:,5))==lengths(i));
    structures=[structures;indices,{length(indices)}]
end
max=max(cell2mat(structures(:,2)))
barplot=zeros(size(structures,1),max)
for i=1:size(structures,1)
    g=structures(i,1);
    for j=1:length(structures{i,1})
        barplot(i,j)=cell2mat(Freq(g{1}(j),3))/Trials;
    end
end

figure
bar(barplot,'stacked')


