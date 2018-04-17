% Project Part 2 run script - gray images

clear;
close all;

% Import images and prepare for circle detection using previously
% determined methods

im(:,:,1) = imread('Gray/DSCN0563Gray4_C1.png');
im(:,:,2) = imread('Gray/DSCN0566Gray4_C1.png');
im(:,:,3) = imread('Gray/DSCN0569Gray4_C1.png');
im(:,:,4) = imread('Gray/DSCN0572Gray4_C1.png');
im(:,:,5) = imread('Gray/DSCN0576Gray4_C1.png');
im(:,:,6) = imread('Gray/DSCN0579Gray4_C1.png');


[len,wid,num] = size(im);

se = strel('disk',3,0);
smfil       =   fspecial('average');
thresh = 127; 

clim = zeros(size(im)); 
thclim = zeros(size(im)); 
opim = zeros(size(im));
opsmim = zeros(size(im)); 
edim = zeros(size(im));
clopim = zeros(size(im));
thclopim = zeros(size(im));

graytitle = 'Gray Image Set';
cltitle = 'Closed, Thresholded at 127 Image Set';
opsmtitle = 'Opened, Smoothed Image Set';

for i = 1:num
    clim(:,:,i) = imclose(im(:,:,i),se);
    clopim(:,:,i) = imopen(clim(:,:,i),se);
    thclim(:,:,i) = threshold(clim(:,:,i),thresh);
    opim(:,:,i) = imopen(im(:,:,i),se);
    opsmim(:,:,i) = filter2(smfil,im(:,:,i));
    edim(:,:,i) = edge(opsmim(:,:,i),'Sobel');
    thclopim(:,:,i) = threshold(clopim(:,:,i),thresh);
end

% Test match filtering on regular and filtered images

for i = 1:num
    [nocent1,norad1] = circmatch(im2bw(im(:,:,i),.5),0,graytitle);
    [clcent1,clrad1] = circmatch(thclim(:,:,i),0,cltitle);
    [edcent1,edrad1] = circmatch(edim(:,:,i),0,opsmtitle);
end

% Test circular hough transform on regular and filtered images
diamRange = [35 60];
sensitivity = 0.96;
edgeThresh = 0.1;


[centers1,radii1] = hough(im,diamRange,sensitivity,edgeThresh,'dark',graytitle);
[centers2,radii2] = hough(thclopim,diamRange,sensitivity,edgeThresh,'dark',cltitle);
[centers3,radii3] = hough(edim,diamRange,sensitivity,edgeThresh,'bright',opsmtitle);

% Test image pyramid/difference image
for i = 1:num
    % grayscale image required for bwboundaries
    [nocent1,norad1] = contcircfind(im2bw(im(:,:,i),.5),graytitle);
    [clcent1,clrad1] = contcircfind(thclim(:,:,i),cltitle);
    [edcent1,edrad1] = contcircfind(edim(:,:,i),opsmtitle);
end