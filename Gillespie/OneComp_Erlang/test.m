dirData = dir('Simulations');
for i=3:size(dirData,1)
    fileName=[dirData(i).name]
    load(['Simulations/',fileName]);
    time=fileName(11:end-4); 
    Freq={};
    Un=unique(glycans(:,1));
    for j=1:length(Un)
       Freq{j,1}=Un{j};
       Lo=ismember(glycans(:,1),Un{j});
       no=sum(Lo);
       Freq{j,2}=no;
    end
    save(['ThirdCompFreq/Frequency_',time,'.mat'],'Freq');   
end

        