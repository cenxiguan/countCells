function bw_living = getLiving(img)
%% Function name: getLiving
%
% This function reports how many livng cells in the cell image. 
%
% Input arguments: a char array as the image name 
%
% Output argument: a binary image 
%
% Format of call: getLiving(image)
%
% Authors: Amauris Ferreira, Rong Guan
% Date: May 2, 2017

% Convert the image to L*a*b* color space using makecform and applycform
cform = makecform('srgb2lab');
lab = applycform(img, cform);

% Classify the colors in 'a*b*' space using k-means clustering
ab = double(lab(:,:,2:3));
rows = size(ab,1);
cols = size(ab,2);
ab = reshape(ab, rows * cols, 2);
% There are three main colors in the image
ncolors = 3;
% calculate the k-means to get three cluster images, one for each color
[cluster_idx, center] = kmeans(ab,ncolors,'distance','sqEuclidean','Replicates', 3);

% Label every pixel in the image using the results from kMEANS
pixel_labels = reshape(cluster_idx,rows,cols);

% Create images that segment the input image by color
seg = cell(1,3);
rgb_label = repmat(pixel_labels, [1 1 3]);

living_cells = [];
for k = 1:ncolors
    color = img;
    color(rgb_label ~=k) = 0;
    seg{k} = color;
    %Takes mean of each channel in rgb for every 3d matrix
    matrix_mean = @(c, i) mean(mean(color(:,:,i)));
    red = matrix_mean(color, 1);
    green = matrix_mean(color, 2);
    blue = matrix_mean(color, 3);
    
    %k-means will return three images, but there is no specific order in
    %which they are retrieved. We only want the image that contains the
    %living or yellow cells so in every iteration we check each image. If
    %the matrix mean of blue pizels is less than red and green, than this
    %is the image that we want that will have the living cells
    if blue < min(green, red)
        living_cells = seg{k};
    end  
end

bw_living = im2bw(living_cells);
% Remove objects containing fewer than 100 pixels using bwareaopen function
bw_living = bwareaopen(bw_living, 100);

end