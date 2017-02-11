spacings=zeros(length(HeatM2),1);
lengths=unique(HeatM2(7,:));

for i=1:length(lengths)
    [ix]=find(HeatM2(7,:)==lengths(i))
    nostruct=length(ix);
    for j=1:length(ix);
        spacings(ix(j))=lengths(i)+ (j-1)*1/nostruct;
    end
end
