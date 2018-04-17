% project part 2 run script - color image set 1

disp('WARNING: Running this will take a long period of time and will generate a lot of image figures. Okay to run?');
pause;

close all;

% Read the images and get one of each coin. Same coins are used for all
% imagess.
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

pene = im1(170:270,634:739,:);
penex = rgb2gray(pene);
nice = im1(528:645,630:745,:);
nicex = rgb2gray(nice);
dime1 = im1(362:458,758:850,:);
dimex = rgb2gray(dime1);
quae = im1(187:320,292:427,:);
quaex = rgb2gray(quae);

se = strel('disk',3,0);
smfil       =   fspecial('average');
thresh = 127;

clim1 = imclose(im1bw,se);
thclim1  = threshold(clim1,thresh);
opim1    = imopen(im1bw,se);
opsmim1  = filter2(smfil,opim1);
edim1    = edge(opsmim1,'Sobel');
clopim1  = imopen(clim1,se);
thclopim1 = threshold(clopim1,thresh);

clim2 = imclose(im2bw,se);
thclim2  = threshold(clim2,thresh);
opim2    = imopen(im2bw,se);
opsmim2  = filter2(smfil,opim2);
edim2    = edge(opsmim2,'Sobel');
clopim2  = imopen(clim2,se);
thclopim2 = threshold(clopim2,thresh);

clim3 = imclose(im3bw,se);
thclim3  = threshold(clim3,thresh);
opim3    = imopen(im3bw,se);
opsmim3  = filter2(smfil,opim3);
edim3    = edge(opsmim3,'Sobel');
clopim3  = imopen(clim3,se);
thclopim3 = threshold(clopim3,thresh);

clim4 = imclose(im4bw,se);
thclim4  = threshold(clim4,thresh);
opim4    = imopen(im4bw,se);
opsmim4  = filter2(smfil,opim4);
edim4    = edge(opsmim4,'Sobel');
clopim4  = imopen(clim4,se);
thclopim4 = threshold(clopim4,thresh);

clim5 = imclose(im5bw,se);
thclim5  = threshold(clim5,thresh);
opim5    = imopen(im5bw,se);
opsmim5  = filter2(smfil,opim5);
edim5    = edge(opsmim5,'Sobel');
clopim5  = imopen(clim5,se);
thclopim5 = threshold(clopim5,thresh);

clim6 = imclose(im6bw,se);
thclim6  = threshold(clim6,thresh);
opim6    = imerode(im6bw,se);
opsmim6  = filter2(smfil,opim6);
edim6    = edge(opsmim6,'Sobel');
clopim6  = imopen(clim6,se);
thclopim6 = threshold(clopim6,thresh);


% Test images; please ignore
% figure;
% subplot(3,2,1),imshow(im1);
% subplot(3,2,2),imshow(im2);
% subplot(3,2,3),imshow(im3);
% subplot(3,2,4),imshow(im4);
% subplot(3,2,5),imshow(im5);
% subplot(3,2,6),imshow(im6);



% Matched filter
% [centers1m,radii1m] = circmatch(im1bw,penex,'color');
% [centers2m,radii2m] = circmatch(im2bw,penex,'color');
% [centers3m,radii3m] = circmatch(im3bw,penex,'color');
% [centers4m,radii4m] = circmatch(im4bw,penex,'color');
% [centers5m,radii5m] = circmatch(im5bw,penex,'color');
% [centers6m,radii6m] = circmatch(im6bw,penex,'color');
% 
% [centers1m,radii1m] = circmatch(thclopim1,0,'Thresholded image 1');
% [centers2m,radii2m] = circmatch(thclopim2,0,'Thresholded image 2');
% [centers3m,radii3m] = circmatch(thclopim3,0,'Thresholded image 3');
% [centers4m,radii4m] = circmatch(thclopim4,0,'Thresholded image 4');
% [centers5m,radii5m] = circmatch(thclopim5,0,'Thresholded image 5');
% [centers6m,radii6m] = circmatch(thclopim6,0,'Thresholded image 6');
% 
% [centers1m,radii1m] = circmatch(edim1,0,'Edge image 1');
% [centers2m,radii2m] = circmatch(edim2,0,'Edge image 2');
% [centers3m,radii3m] = circmatch(edim3,0,'Edge image 3');
% [centers4m,radii4m] = circmatch(edim4,0,'Edge image 4');
% [centers5m,radii5m] = circmatch(edim5,0,'Edge image 5');
% [centers6m,radii6m] = circmatch(edim6,0,'Edge image 6');


% Hough transform
diamRange = [50 90];
sensitivity = .94;
edgethresh = 0.4;

% [centers1h,radii1h] = houghc(im1bw,diamRange,sensitivity,edgethresh,'dark','color im 1',im1);
% [centers2h,radii2h] = houghc(im2bw,diamRange,sensitivity,edgethresh,'dark','color im 2',im2);
% [centers3h,radii3h] = houghc(im3bw,diamRange,sensitivity,edgethresh,'dark','color im 3',im3);
% [centers4h,radii4h] = houghc(im4bw,diamRange,sensitivity,edgethresh,'dark','color im 4',im4);
% [centers5h,radii5h] = houghc(im5bw,diamRange,sensitivity,edgethresh,'dark','color im 5',im5);
[centers6h,radii6h] = houghc(im6bw,diamRange,sensitivity,edgethresh,'dark','color image 632',im6);


diamRange = [50 90];
sensitivity = .95;
edgethresh = 0.1;
% [centers1h,radii1h] = houghc(edim1,diamRange,sensitivity,edgethresh,'bright','edge image 1',im1);
% [centers2h,radii2h] = houghc(edim2,diamRange,sensitivity,edgethresh,'bright','edge image 2',im2);
% [centers3h,radii3h] = houghc(edim3,diamRange,sensitivity,edgethresh,'bright','edge image 3',im3);
% [centers4h,radii4h] = houghc(edim4,diamRange,sensitivity,edgethresh,'bright','edge image 4',im4);
% [centers5h,radii5h] = houghc(edim5,diamRange,sensitivity,edgethresh,'bright','edge image 5',im5);
[centers6h,radii6h] = houghc(edim6,diamRange,sensitivity,edgethresh,'bright','edge image 632',im6);


diamRange = [50 90];
sensitivity = .98;
edgethresh = 0.1;
% [centers1h,radii1h] = houghc(thclopim1,diamRange,sensitivity,edgethresh,'dark','threshold image 1',im1);
% [centers2h,radii2h] = houghc(thclopim2,diamRange,sensitivity,edgethresh,'dark','threshold image 2',im2);
% [centers3h,radii3h] = houghc(thclopim3,diamRange,sensitivity,edgethresh,'dark','threshold image 3',im3);
% [centers4h,radii4h] = houghc(thclopim4,diamRange,sensitivity,edgethresh,'dark','threshold image 4',im4);
% [centers5h,radii5h] = houghc(thclopim5,diamRange,sensitivity,edgethresh,'dark','threshold image 5',im5);
[centers6h,radii6h] = houghc(thclopim6,diamRange,sensitivity,edgethresh,'dark','threshold image 632',im6);





% Image pyramid
% Edge does not have enough data to get any benefit. 

% [centers1p,radii1p] = contcircfind(im1bw,'Image 1');
% [centers2p,radii2p] = contcircfind(im2bw,'Image 2');
% [centers3p,radii3p] = contcircfind(im3bw,'Image 3');
% [centers4p,radii4p] = contcircfind(im4bw,'Image 4');
% [centers5p,radii5p] = contcircfind(im5bw,'Image 5');
% [centers6p,radii6p] = contcircfind(im6bw,'Image 6');

% [centers1p,radii1p] = contcircfind(thclopim1,'Image 1');
% [centers2p,radii2p] = contcircfind(thclopim2,'Image 2');
% [centers3p,radii3p] = contcircfind(thclopim3,'Image 3');
% [centers4p,radii4p] = contcircfind(thclopim4,'Image 4');
% [centers5p,radii5p] = contcircfind(thclopim5,'Image 5');
% [centers6p,radii6p] = contcircfind(thclopim6,'Image 6');



