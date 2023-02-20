clc, clearvars
pxSize = 0.312;%um
token = '.tif';

p = 'D:\proj_PNNreporter_IF\DATASET\PV_058\counts_raw';

path = fileparts(p);

targetPxSize = 0.645;
resizeFactor = targetPxSize/pxSize;

savingPath = [path filesep 'counts_resized'];

if ~isfolder(savingPath)
    mkdir(savingPath)
end

counts_raw = string(listfiles(p, '.csv'))';


for i = 1:length(counts_raw)
    rawcount = readtable(counts_raw(i));

    [~, f,~] = fileparts(counts_raw(i));
    count = rawcount;
    count.X = count.X*resizeFactor;
    count.Y = count.Y*resizeFactor;
    writetable(count, [savingPath filesep char(f) '.csv']);
    fprintf("processed %d/%d images\n", i , length(counts_raw))

end
