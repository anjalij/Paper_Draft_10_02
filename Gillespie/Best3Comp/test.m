len=unique(cell2mat(high_abund(:,2)));

for j=1:length(len)
    ix=find(cell2mat(high_abund(:,2))==len(j));
    no=length(ix);
    icr=1/no;
    for k=1:length(ix)
        high_abund{ix(k),3}=high_abund{ix(k),2}+(k-1)*icr
    end
end
