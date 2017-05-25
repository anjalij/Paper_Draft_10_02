dirData=dir('FirstCompFreq');
for i=3:68
    fileName=[dirData(i).name];
    load(['FirstCompFreq',fileName])
    