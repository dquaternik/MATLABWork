function [threshim1, thresh1, threshim2, thresh2, threshim3, thresh3,...
    threshim4, thresh4, threshim5, thresh5, threshim6, thresh6] = thresh6(im)
%   Creates four thresholded images and plots them all in one subplot
%   Thresh1 is thresholded to half of the full range (256-0)/2
%   Thresh2 is thresholded to the median value of the image
%   Thresh3 is opened then thresholded to half full range
%   Thresh4 is closed then thresholded to half full range
%   Thresh5 is opened then thresholded to median value of image
%   Thresh6 is closed then thresholded to median value of image


% Initialize
% Create structuring element for morphological filtering
se = strel('disk',11,0);

% Thresh 1

thresh1 = (256/2)-1;

threshim1 = threshold(im,thresh1);

figure;
subplot(2,1,1), imshow(threshim1);
title('Thresholded to 127');

% Thresh 2 

thresh2 = median(median(im));
threshim2 = threshold(im,thresh2);

subplot(2,1,2), imshow(threshim2);
title('Thresholded to median value');

% Thresh 3 

imex = imopen(im,se);

thresh3 = thresh1;
threshim3 = threshold(imex,thresh3);

figure;
subplot(2,2,1), imshow(threshim3);
title('Opened then thresholded to 127');

% Thresh 4 

imex = imclose(im,se);

thresh4 = thresh1;
threshim4 = threshold(imex, thresh4);

subplot(2,2,2), imshow(threshim4);
title('Closed then thresholded to 127');

% Thresh 5 

imex = imopen(im,se);

thresh5 = median(median(imex));
threshim5 = threshold(imex, thresh5);

subplot(2,2,3), imshow(threshim5);
title('Opened then thresholded to median');

% Thresh 6

imex = imclose(im,se);

thresh6 = median(median(imex));
threshim6 = threshold(imex, thresh6);

subplot(2,2,4), imshow(threshim5);
title('Closed then thresholded to median');
