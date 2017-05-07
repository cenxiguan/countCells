function [] = totalCell(image, radius)

%% Function name: totalCell
%
% This function reports how many total cells as well as how many livng cells
% in the cell image. 
%
% Input arguments: a char array as the image name and the redius of a 
% disk that can cover a cell.
%
% Output argument: N/A 
%
% Format of call: TotalCell(image, radius)
%
% Authors: Amauris Ferreira, Rong Guan
% Date: May 2, 2017

%% Step1: Read Image

% Read the cell image and rescale it to double since imaging processing
% toobox normally take floating point arrays want them in [0 1] 
img = im2double(imread(image));

% Convert RGB images to grayscale by eliminating the hue and saturation 
% information while retaining the luminance (Y of YCbCr)
I = rgb2gray(img);

% Check the step 1 output
figure(1);
subplot(2,2,1); 
imshow(I); 
title ('Step 1: Original Image in grayscale');

%% Step 2: Subtract the Background Image from the Original Image

% Use morhpological opening to estimate the background
bg = imopen(I, strel('disk', radius));

% Subtract background
I2 = I - bg;

subplot(2,2,2); 
imshow(I2);
title ('Step 2: Image Substract Background');

%% Step 3: Increase the Image Contrast

I3 = imadjust(I2);
% bw = graythresh(I3);

subplot(2,2,3); 
imshow(I3);
title ('Step 3: Image Increased Contrast');

%% Step 4: Threshold the Image (Count all cells)

% Create new binary image
% Get rid of background noise
bw = im2bw(I3);

% Fill any gaps within cells
bw2 = fillGaps(bw);

% Call function separate(bw) to connected cells for accurate counting
bw3 = separate(bw2);

% Remove objects on border FIX
bw3 = imclearborder(bw3, 4);

% Find objects in image
cc = bwconncomp(bw3, 4);

%% Step 5: Count all living cells

liv = getLiving(img);
bw_liv = fillGaps(liv);
bw_liv= separate(bw_liv);
bw_liv = imclearborder(bw_liv, 4);
cc_liv = bwconncomp(bw_liv,4);

%%
%Get list of detected cells and count them
cells = cc.PixelIdxList;

cell = false(size(bw3));
for num = drange(1, length(cells))
    cell(cc.PixelIdxList{num})= true;
    subplot(2,2,4); 
    imshow(cell);
    title ('Step 4: Count all the cells');
    pause(1);
    cell(cc.PixelIdxList{num})= false;
end

totalCellNumber = length(cells);
fprintf('Total Number of cells in the image is %d.\n', totalCellNumber );

cells_liv = cc_liv.PixelIdxList;
livingCellNumber = length(cells_liv);
fprintf('Number of living cells in the image is %d.\n', livingCellNumber);

fprintf('The viability of the cell culture is %.2f%%. \n', double(livingCellNumber) / totalCellNumber * 100.);

end
