% Project part 2 run script - color image set 2
% Tested only with regular and edge for hough transform. Reasons given in
% report. 

close all;
clear;

im1 = imread('Color2/DSCN0582Color4_C1.png');
im2 = imread('Color2/DSCN0585Color4_C1.png');
im3 = imread('Color2/DSCN0588Color4_C1.png');
im4 = imread('Color2/DSCN0595Color4_C1.png');
im5 = imread('Color2/DSCN0598Color4_C1.png');
im6 = imread('Color2/DSCN0601Color4_C1.png');
im7 = imread('Color2/DSCN0604Color4_C1.png');
im8 = imread('Color2/DSCN0607Color4_C1.png');
im9 = imread('Color2/DSCN0610Color4_C1.png');
im10 = imread('Color2/DSCN0613Color4_C1.png');


im1bw = rgb2gray(im1);
im2bw = rgb2gray(im2);
im3bw = rgb2gray(im3);
im4bw = rgb2gray(im4);
im5bw = rgb2gray(im5);
im6bw = rgb2gray(im6);
im7bw = rgb2gray(im7);
im8bw = rgb2gray(im8);
im9bw = rgb2gray(im9);
im10bw = rgb2gray(im10);

se = strel('disk',7,0);
smfil       =   fspecial('average');

opim1    = imopen(im1bw,se);
opsmim1  = filter2(smfil,opim1);
edim1    = edge(opsmim1,'Sobel');

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

opim7    = imopen(im7bw,se);
opsmim7  = filter2(smfil,opim7);
edim7    = edge(opsmim7,'Sobel');

opim8    = imopen(im8bw,se);
opsmim8  = filter2(smfil,opim8);
edim8    = edge(opsmim8,'Sobel');

opim9    = imopen(im9bw,se);
opsmim9  = filter2(smfil,opim9);
edim9    = edge(opsmim9,'Sobel');

opim10    = imopen(im10bw,se);
opsmim10  = filter2(smfil,opim10);
edim10    = edge(opsmim10,'Sobel');


diamRange = [40 80];
sensitivity = .95;
edgethresh = 0.2;
[centers1h,radii1h] = houghc(edim1,diamRange,sensitivity,edgethresh,'bright','edge image 1',im1);
[centers2h,radii2h] = houghc(edim2,diamRange,sensitivity,edgethresh,'bright','edge image 2',im2);
[centers3h,radii3h] = houghc(edim3,diamRange,sensitivity,edgethresh,'bright','edge image 3',im3);
[centers4h,radii4h] = houghc(edim4,diamRange,sensitivity,edgethresh,'bright','edge image 4',im4);
[centers5h,radii5h] = houghc(edim5,diamRange,sensitivity,edgethresh,'bright','edge image 5',im5);
[centers6h,radii6h] = houghc(edim6,diamRange,sensitivity,edgethresh,'bright','edge image 6',im6);
[centers7h,radii7h] = houghc(edim7,diamRange,sensitivity,edgethresh,'bright','edge image 7',im7);
[centers8h,radii8h] = houghc(edim8,diamRange,sensitivity,edgethresh,'bright','edge image 8',im8);
[centers9h,radii9h] = houghc(edim9,diamRange,sensitivity,edgethresh,'bright','edge image 9',im9);
[centers10h,radii10h] = houghc(edim10,diamRange,sensitivity,edgethresh,'bright','edge image 10',im10);

% Good way to improve performace - test centers for color to ensure it
% matches to known coin color. May not remove all but will help. 
