function [imOut, xEdges, yEdges] = extractSubImage(sourceImage, XYpos, outSize, channel)
% [imOut, xEdges, yEdges] = extractSubImage(sourceImage, XYpos, outSize)
% [imOut, xEdges, yEdges] = extractSubImage(sourceImage, XYpos, outSize, channel)
% 
% INPUT
% sourceImage - Input image (2D or 3D)
% XYpos - 2D vector containing the XY position of the imOut center
% outSize - size of the square image imOut
% channel (default:1) - Image channel from which to extract imOut

if nargin < 4
    channel = 1;
end

% Borders of the output image
xPoints = [XYpos(1)-(outSize/2)+1 XYpos(1)+(outSize/2)];
yPoints = [XYpos(2)-(outSize/2)+1 XYpos(2)+(outSize/2)];

% Resolve possible border effects
if xPoints(1)<1
    xPoints = [1 outSize];
end
if xPoints(2)>size(sourceImage,2)
    xPoints = [size(sourceImage,2)-outSize+1 size(sourceImage,2)];
end
if yPoints(1)<1
    yPoints = [1 outSize];
end
if yPoints(2)>size(sourceImage,1)
    yPoints = [size(sourceImage,1)-outSize+1 size(sourceImage,1)];
end

% extract the output image
imOut = sourceImage(yPoints(1):yPoints(2) , xPoints(1):xPoints(2), channel);
xEdges = xPoints;
yEdges = yPoints;
