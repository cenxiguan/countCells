function sep = separate(bw)
%% Function name: separate
%
% This function separetes the connected cells 
%
% Input arguments: a binary image
%
% Output argument: a binary image 
%
% Format of call: separate(binary_image)
%
% Authors: Amauris Ferreira, Rong Guan
% Date: May 2, 2017

% Distance trasnform of bw
D = -bwdist(~bw);

% Watershed transformation of Dß
Ld = watershed(D);

% Use ridge lines found in watershed variable to segment connecting cells
bw2 = bw;
bw2(Ld == 0) = 0;

% Find center spots of cells
mask = imextendedmin(D,2);

% Use these newfound centers, along with watershedding, to create new
% segmented lines in original image
D2 = imimposemin(D, mask);
Ld2 = watershed(D2);
sep = bw;
sep(Ld2 == 0) = 0;

end