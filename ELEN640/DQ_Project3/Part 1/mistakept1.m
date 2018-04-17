function prjpart1(im)
%% Devon Quaternik
% ELEN 640
% Project Part 1

%% Part one objective
% In several images of coins, separate the coins from the background and
% for each coin find the boundary, the diameter, the center , and the mean
% and variance of the gray level values. This information, along with
% scaling data, could be used to classify the coins.

%% Initizialization

figure;
imshow(im);
title('Original Image');


[rows,cols]=size(im);
imsize = [rows,cols];
sgt = zeros(imsize);
thresh = max(max(im))/2;


%% Function definitions

    

    function diam = finddiam(image)
        
    end

    function cent = findcent(image)
        
    end

%% Simple Global Threshold

% Threshold the image at (256-1)/2=127.5
for i = 1:rows
    for j = 1:cols
        if im(i,j) >= thresh
            sgt(i,j) = 255;
        end
    end
end

figure;
imshow(sgt);
title('Simple Threshold Image');

%Find coins

%% Edge Detection



%% Smoothing followed by Edge Detection



%% Morphological filtering applied to results of previous methods



end