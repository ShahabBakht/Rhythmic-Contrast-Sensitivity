TestList = {'16071501',...
            '16071801', ...
            '16071901', ...
            '16071902', ...
            '16071903', ...
            '16071904', ...
            '16072101', ...
            '16072102', ...
            '16072103', ...
            '16072104' ...
            };
        
DataFolder = 'D:\Data\Psychophysics\Rhythmic Contrast Sensitivity';      
SamplingRate = 85; %Hz

for testcount = 1:length(TestList)
    TestName = TestList{testcount};
    load([DataFolder, '\','Response_',TestName, '.mat']);
    Response_all(testcount,:) = ResponseMatrix;
    clear Response_Matrix
end
save([DataFolder, '\','Response_',num2str(SamplingRate), '.mat'],'Response_all');

meanResponse_all = mean(Response_all,1);

%% Downsample

downsamplingRate = 20; % Hz
meanResponse_all_rsmp = resample(meanResponse_all,downsamplingRate,SamplingRate);


%% Plot responses
figure;subplot(3,1,1);
imagesc(Response_all);colormap('jet')
subplot(3,1,2); plot(0:1/SamplingRate:(1-1/SamplingRate),meanResponse_all,'.-b');
subplot(3,1,3); plot(0:1/downsamplingRate:(1-1/downsamplingRate),meanResponse_all_rsmp,'.-b');

    