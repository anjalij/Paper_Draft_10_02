%extracts abundance matrix

Direct=dir('FirstCompFreq')
abundance_matrix_1=cell(175,68);
abundance_matrix_1(2:end,1:2)=high_abund;
for i=4:68
    fileName=Direct(i).name;
    load(['FirstCompFreq/',fileName])
    no=str2num(fileName(11:end-4));
    abundance_matrix_1{1,i-1}=no;
    for j=1:174
        ix=find(ismember(FrequencyPlot(:,1),high_abund{j,1}));
        if isempty(ix)
            abundance_matrix_1{j+1,i-1}=0;
        else
            f=FrequencyPlot(ix,3);
            abundance_matrix_1{j+1,i-1}=cell2mat(f);
        end
    end
end

Direct=dir('SecondCompFreq')
abundance_matrix_2=cell(175,68);
abundance_matrix_2(2:end,1:2)=high_abund;
for i=3:68
    fileName=Direct(i).name;
    load(['SecondCompFreq/',fileName])
    no=str2num(fileName(11:end-4));
    abundance_matrix_2{1,i-1}=no;
    for j=1:174
        ix=find(ismember(FrequencyPlot(:,1),high_abund{j,1}));
        if isempty(ix)
            abundance_matrix_2{j+1,i-1}=0;
        else
            f=FrequencyPlot(ix,3);
            abundance_matrix_2{j+1,i-1}=cell2mat(f);
        end
    end
end

Direct=dir('Freq')
abundance_matrix_3=cell(175,68);
abundance_matrix_3(2:end,1:2)=high_abund;
for i=3:68
    fileName=Direct(i).name;
    load(['Freq/',fileName])
    no=str2num(fileName(23:end-4));
    abundance_matrix_3{1,i}=no;
    for j=1:174
        ix=find(ismember(Freq(:,1),high_abund{j,1}));
        if isempty(ix)
            abundance_matrix_3{j+1,i}=0;
        else
            f=Freq(ix,3);
            abundance_matrix_3{j+1,i}=cell2mat(f);
        end
    end
end