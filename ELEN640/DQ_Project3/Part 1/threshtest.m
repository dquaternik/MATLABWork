function threshtest(im,thresh)
%   threshtest(im)
%   Creates 2 figures of 4 images for 8 total cases.
%   Cases are 1) Normal Image
%   2) Smoothing then thresh   3) Opening then thresh
%   4) Closing then thresh     5) Smoothing, opening then thresh
%   6) Smoothing, closing then thresh 7) Opening, smoothing, then thresh
%   8) Closing, smoothing then thresh


% Create structuring element for morphological filtering
se = strel('disk',3,0);
smfil = fspecial('average');
str = sprintf('Threshold = %d', thresh);

smoothim    =   filter2(smfil,im);
openim      =   imopen(im,se);
closeim     =   imclose(im,se);
smopim      =   imopen(smoothim,se);
smclim      =   imclose(smoothim,se);
opsmim      =   filter2(smfil,openim);
clsmim      =   filter2(smfil,closeim);

% Case 1

im1 = threshold(im,thresh);

% Case 2

im2 = threshold(smoothim,thresh);

% Case 3 

im3 = threshold(openim,thresh);

% Case 4

im4 = threshold(closeim,thresh);

% Case 5

im5 = threshold(smopim,thresh);

% Case 6

im6 = threshold(smclim,thresh);

% Case 7

im7 = threshold(opsmim,thresh);

% Case 8

im8 = threshold(clsmim,thresh);

figure;
subplot(2,2,1), imshow(im1);
title('Original');
subplot(2,2,2), imshow(im2);
title('Smoothed');
subplot(2,2,3), imshow(im3);
title('Opened');
subplot(2,2,4), imshow(im4);
title('Closed');
suptitle(str);

figure;
subplot(2,2,1), imshow(im5);
title('Smooth, Open');
subplot(2,2,2), imshow(im6);
title('Smooth, Close');
subplot(2,2,3), imshow(im7);
title('Open, Smooth');
subplot(2,2,4), imshow(im8);
title('Close, Smooth');
suptitle(str);