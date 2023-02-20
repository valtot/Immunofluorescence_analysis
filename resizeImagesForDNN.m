pxSize = 0.312;%um
token = '.tif';

p = 'D:\proj_PNNreporter_IF\DATASET\PV_058\hiRes';

path = fileparts(p);

targetPxSize = 0.645;
resizeFactor = pxSize/targetPxSize;

savingPath = [path filesep 'resized'];

if ~isfolder(savingPath)
    mkdir(savingPath)
end

rgbImgs = string(listfiles(p, '.tif'))';




for i = 1:length(rgbImgs)
    rawim = imread(rgbImgs(i));

    [~, f,~] = fileparts(rgbImgs(i));
    im = imresize(rawim, resizeFactor);
    
    imwrite(im, [savingPath filesep char(f) '.tif']);
   

end
