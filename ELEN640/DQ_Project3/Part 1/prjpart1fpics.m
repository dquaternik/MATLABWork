%% Devon Quaternik
% ELEN 640 
% Project Part 1 Chosen Pictures

close all;
clear;

im1 = imread('DSCN0563Gray4_C1.png');
im2 = imread('DSCN0566Gray4_C1.png');
im3 = imread('DSCN0569Gray4_C1.png');
im4 = imread('DSCN0572Gray4_C1.png');
im5 = imread('DSCN0576Gray4_C1.png');
im6 = imread('DSCN0579Gray4_C1.png');

thresh = 256/2-1;

smfil       =   fspecial('average');
se = strel('disk',3,0);

% Image 1
clim1 = imclose(im1,se);
threshim1 = threshold(clim1,thresh);
opim1 = imopen(im1,se);
smopim1 = filter2(smfil,opim1);
edgeim1 = edge(smopim1,'Sobel');

figure;
subplot(2,1,1), imshow(threshim1);
title('Closed, thresholded at 127');
subplot(2,1,2), imshow(edgeim1);
title('Opened, smoothed, Sobel edge detection');
suptitle('Image 1');

% Image 2
clim2 = imclose(im2,se);
threshim2 = threshold(clim2,thresh);
opim2 = imopen(im2,se);
smopim2 = filter2(smfil,opim2);
edgeim2 = edge(smopim2,'Sobel');

figure;
subplot(2,1,1), imshow(threshim2);
title('Closed, thresholded at 127');
subplot(2,1,2), imshow(edgeim2);
title('Opened, smoothed, Sobel edge detection');
suptitle('Image 2');

% Image 3
clim3 = imclose(im3,se);
threshim3 = threshold(clim3,thresh);
opim3 = imopen(im3,se);
smopim3 = filter2(smfil,opim3);
edgeim3 = edge(smopim3,'Sobel');

figure;
subplot(2,1,1), imshow(threshim3);
title('Closed, thresholded at 127');
subplot(2,1,2), imshow(edgeim3);
title('Opened, smoothed, Sobel edge detection');
suptitle('Image 3');

% Image 4
clim4 = imclose(im4,se);
threshim4 = threshold(clim4,thresh);
opim4 = imopen(im4,se);
smopim4 = filter2(smfil,opim4);
edgeim4 = edge(smopim4,'Sobel');

figure;
subplot(2,1,1), imshow(threshim4);
title('Closed, thresholded at 127');
subplot(2,1,2), imshow(edgeim4);
title('Opened, smoothed, Sobel edge detection');
suptitle('Image 4');

% Image 5
clim5 = imclose(im5,se);
threshim5 = threshold(clim5,thresh);
opim5 = imopen(im5,se);
smopim5 = filter2(smfil,opim5);
edgeim5 = edge(smopim5,'Sobel');

figure;
subplot(2,1,1), imshow(threshim5);
title('Closed, thresholded at 127');
subplot(2,1,2), imshow(edgeim5);
title('Opened, smoothed, Sobel edge detection');
suptitle('Image 5');

% Image 6
clim6 = imclose(im6,se);
threshim6 = threshold(clim6,thresh);
opim6 = imopen(im6,se);
smopim6 = filter2(smfil,opim6);
edgeim6 = edge(smopim6,'Sobel');

figure;
subplot(2,1,1), imshow(threshim6);
title('Closed, thresholded at 127');
subplot(2,1,2), imshow(edgeim6);
title('Opened, smoothed, Sobel edge detection');
suptitle('Image 6');

