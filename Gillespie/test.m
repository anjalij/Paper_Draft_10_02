for i=1:174
    ix=find(ismember(AllStruct(:,1),high_abund{i,1}));
    high_abund{i,2}=AllStruct{ix,2};
end