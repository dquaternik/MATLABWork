% Project part 2 - report pictures run script. 

close all;
clear;

% Gray image setup
im(:,:,1) = imread('Gray/DSCN0563Gray4_C1.png');
im(:,:,2) = imread('Gray/DSCN0566Gray4_C1.png');
im(:,:,3) = imread('Gray/DSCN0569Gray4_C1.png');
im(:,:,4) = imread('Gray/DSCN0572Gray4_C1.png');
im(:,:,5) = imread('Gray/DSCN0576Gray4_C1.png');
im(:,:,6) = imread('Gray/DSCN0579Gray4_C1.png');

% Color image setup - set one
im1 = imread('Color/DSCN0616Color2_C1.png');
im2 = imread('Color/DSCN0619Color2_C1.png');
im3 = imread('Color/DSCN0622Color2_C1.png');
im4 = imread('Color/DSCN0625Color2_C1.png');
im5 = imread('Color/DSCN0629Color2_C1.png');
im6 = imread('Color/DSCN0632Color2_C1.png');

im1bw = rgb2gray(im1);
im2bw = rgb2gray(im2);
im3bw = rgb2gray(im3);
im4bw = rgb2gray(im4);
im5bw = rgb2gray(im5);
im6bw = rgb2gray(im6);

se = strel('disk',7,0);
smfil       =   fspecial('average');
thresh = 127;

clim1 = imclose(im1bw,se);
thclim1  = threshold(clim1,thresh);
opim1    = imopen(im1bw,se);
opsmim1  = filter2(smfil,opim1);
edim1    = edge(opsmim1,'Sobel');
clopim1  = imopen(clim1,se);
thclopim1 = threshold(clopim1,thresh);

opim2    = imopen(im2bw,se);
opsmim2  = filter2(smfil,opim2);
edim2    = edge(opsmim2,'Sobel');

opim3    = imopen(im3bw,se);
opsmim3  = filter2(smfil,opim3);
edim3    = edge(opsmim3,'Sobel');

opim4    = imopen(im4bw,se);
opsmim4  = filter2(smfil,opim4);
edim4    = edge(opsmim4,'Sobel');

opim5    = imopen(im5bw,se);
opsmim5  = filter2(smfil,opim5);
edim5    = edge(opsmim5,'Sobel');

opim6    = imopen(im6bw,se);
opsmim6  = filter2(smfil,opim6);
edim6    = edge(opsmim6,'Sobel');


% Hough transform of grayscale images. 

diamRange = [35 60];
sensitivity = 0.96;
edgeThresh = 0.3;

[centers1,radii1] = hough(im,diamRange,sensitivity,edgeThresh,'dark','Hough transform on original gray images');

% Matched filter for color image

pene = im1(170:270,634:739,:);
penex = rgb2gray(pene);

[centers1m,radii1m] = circmatch(im1bw,penex,'color');
[centers1m,radii1m] = circmatch(thclopim1,0,'Thresholded image 1');
[centers1m,radii1m] = circmatch(edim1,0,'Edge image 1');

% Example of poor performance of image pyramid on threshold. 

[centers1p,radii1p] = contcircfind(thclopim1,'Image 1');

% Color images using hough transform no preprocessing
diamRange = [50 90];
sensitivity = .94;
edgethresh = 0.4;

[centers1h,radii1h] = houghc(im1bw,diamRange,sensitivity,edgethresh,'dark','color im 1',im1);
[centers5h,radii5h] = houghc(im5bw,diamRange,sensitivity,edgethresh,'dark','color im 5',im5);
[centers6h,radii6h] = houghc(im6bw,diamRange,sensitivity,edgethresh,'dark','color im 6',im6);



% Color images using hough transform and edge images- shows improved
% performance

diamRange = [50 90];
sensitivity = .95;
edgethresh = 0.2;
[centers1h,radii1h] = houghc(edim1,diamRange,sensitivity,edgethresh,'bright','edge image 1',im1);
[centers5h,radii5h] = houghc(edim5,diamRange,sensitivity,edgethresh,'bright','edge image 5',im5);
[centers6h,radii6h] = houghc(edim6,diamRange,sensitivity,edgethresh,'bright','edge image 6',im6);
















