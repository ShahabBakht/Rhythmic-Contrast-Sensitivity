clear all;clc;

TestName = '16072104';
DataFolder = 'D:\Data\Psychophysics\Rhythmic Contrast Sensitivity';
load([DataFolder, '\',TestName, '.mat']);

monitorRefreshRate = 85; % Hz

targetLocation = S.targetLocation;
Response = S.Response;
stimulusTimes = S.stimulusTimes;
stimulusOrder = round(stimulusTimes*monitorRefreshRate);

ResponseMatrix = nan(size(Response));
for samplecount = 1:length(Response);
    ResponseMatrix(stimulusOrder(samplecount)) = strcmp(targetLocation{samplecount},Response{samplecount});
end

save([DataFolder, '\','Response_',TestName, '.mat'],'ResponseMatrix');