Direct=dir('ThirdCompFreq');
for i=57:68
    fileName=Direct(i).name;
    load(['ThirdCompFreq/',fileName])
    id=[];
    for j=missingCopy
        if B(j,45)==0
        else
            dup=find(B(:,45)==B(j,45));
            if ~isequal(length(dup),1)
                ix=[];
                for k=1:length(dup)
                    if ~ismember(Struct_Obs,Freq{dup(k),1})
                        ix=[ix,k];
                        if isequal(length(ix),1)
                            s=dup(ix)                
                            Struct_Obs{j,1}=Freq{s,1};
                            id=[id,find(missingCopy==j)]
                        end
                    end
                end
            end
        end
    end         