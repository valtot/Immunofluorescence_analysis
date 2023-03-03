p = 'D:\proj_PNNreporter_IF\DATASET\PV_032\rawRGB';

path = fileparts(p);

channelFolder = [path filesep 'hiRes'];

if ~isfolder(channelFolder)
    mkdir(channelFolder)
end

rgbImgs = string(listfiles(p, '.tif'))';




for i = 1:length(rgbImgs)
    rawim = imread(rgbImgs(i));

    [~, f,~] = fileparts(rgbImgs(i));
    im_r = rawim(:,:,1);
    im_g = rawim(:,:,2);
    im_b = rawim(:,:,3);
    imwrite(im_r, [channelFolder filesep replace(char(f), '_c1-3', '-C1') '.tif']);
    imwrite(im_g, [channelFolder filesep replace(char(f), '_c1-3', '-C2') '.tif']);
    imwrite(im_b, [channelFolder filesep replace(char(f), '_c1-3', '-C3') '.tif']);

end