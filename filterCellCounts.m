clearvars, clc
startFolder = 'D:\proj_PNN-Atlas\MARE_PV';
THRESHOLD = 0.55;


%% Filter all CSV files inside startFolder

fP = listfiles(startFolder, '.csv');
numFiles = length(fP);

for i = 1:numFiles
    fprintf('Processing file (%u/%u)... ', i, numFiles)
    t = readtable(fP{i});
    
    % Select rows with score less than THRESHOLD and remove them
    rowsToRemove = t.rescore <= THRESHOLD;
    t(rowsToRemove,:) = [];
    fprintf('removed %u rows... ', sum(rowsToRemove))

    % Save the updated table
    writetable(t, fP{i})
    fprintf('done.\n')
end


