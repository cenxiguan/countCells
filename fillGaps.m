function filled = fillGaps(bw)
%% Function name: fillGaps
%
% This function fill interior gaps that present in the binary image 
%
% Input arguments: a binary image
%
% Output argument: a binary image 
%
% Format of call: fillGaps(binary_image)
%
% Authors: Amauris Ferreira, Rong Guan
% Date: May 2, 2017

% Fill in linear gaps
se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);

% Dilate the image
bw = imdilate(bw, [se90 se0]);

% Fill interior gaps
bw = imfill(bw, 'holes');

% Remove objects containing fewer than 100 pixels using bwareaopen function.
filled = bwareaopen(bw, 100);

end