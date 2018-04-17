%% Devon Quaternik
% ELEN 644 



%% Problem 4

clear;
close all;

% Part a
im1 = imread('viprectification_deskLeft.png');
im2 = imread('viprectification_deskRight.png');
im1g = rgb2gray(im1);
im2g = rgb2gray(im2);


figure;
subplot(1,2,1),imshow(im1);
title('Original Left Image');
subplot(1,2,2),imshow(im2);
title('Original Right Image');

% Part b
im1p = detectMinEigenFeatures(im1g, 'MinQuality', 0.1);
im2p = detectMinEigenFeatures(im2g, 'MinQuality', 0.1);

figure;
subplot(1,2,1),imshow(im1); hold on;
plot(im1p.selectStrongest(100));
title('Strongest 100 Eigen Points L');
subplot(1,2,2),imshow(im2); hold on;
plot(im2p.selectStrongest(100));
title('Strongest 100 Eigen Points R');

% Part c
tracker = vision.PointTracker('MaxBidirectionalError',1,'NumPyramidLevels',5);

im1p = im1p.Location;
initialize(tracker, im1p, im1);

[im2p, validIdx] = step(tracker, im2);
mp1 = im1p(validIdx,:);
mp2 = im2p(validIdx,:);

figure;
showMatchedFeatures(im1,im2,mp1, mp2);
title('Tracked Features');

% Part d
[m,n] = size(im1p);

Jx = [1 0; 0 1];
A = m*Jx;

% 1 dx, only 1 set of points
dx = im2p - im1p;

b = Jx'*(sum(dx))'

p = inv(A)*b

t = [1 0 p(1); 0 1 p(2)];

for i = 1:m
    im1p(i,3) = 1;
    xe(i,:) = t*im1p(i,:)';
end

err = xe - im2p;

mse = mean(err.^2)
maxerr = max(err)
disp('NOTE: maxerr is given separately for x and y.');

% Part e

fundmatmed = estimateFundamentalMatrix(mp1,mp2, 'Method', 'LMedS')
fundmatran = estimateFundamentalMatrix(mp1,mp2, 'Method', 'RANSAC')

[medV,medD] = eig(fundmatmed);
[ranV,ranD] = eig(fundmatran);
disp('Eigenvalues along diagonals');
medD
ranD

rankmed = rank(fundmatmed)
rankran = rank(fundmatran)

%% Problem 5

% Since this is stereo I will be using the center and right images of each
% set
[cfar,farmap] = imread('Photos/centerfar.jpg');
cfar = imrotate(cfar,-90);
cfar = imresize(cfar,[256,256]);
[srim,srmap] = imread('Photos/shiftright.jpg');
srim = imrotate(srim,-90);
srim = imresize(srim,[256,256]);

cfarg = rgb2gray(cfar);
srimg = rgb2gray(srim);

[oc,ocmap] = imread('Outdoor/oc.jpg');
oc = imrotate(oc,-90);
oc = imresize(oc,[256,256]);
[osr,osrmap]=imread('Outdoor/osr.jpg');
osr = imrotate(osr,-90);
osr = imresize(osr,[256,256]);

ocg = rgb2gray(oc);
osrg = rgb2gray(osr);

figure;
subplot(2,2,1),imshow(cfar,farmap);
title('Inside Left');
subplot(2,2,2),imshow(srim,srmap);
title('Inside Right');
subplot(2,2,3),imshow(oc,ocmap);
title('Outside Left');
subplot(2,2,4),imshow(osr,osrmap);
title('Outside Right');

iim1p = detectMinEigenFeatures(cfarg,'MinQuality',0.1);
iim2p = detectMinEigenFeatures(srimg,'MinQuality',0.1);
oim1p = detectMinEigenFeatures(ocg,'MinQuality',0.1);
oim2p = detectMinEigenFeatures(osrg,'MinQuality',0.1);

figure;
subplot(2,2,1),imshow(cfar,farmap); hold on;
plot(iim1p.selectStrongest(100));
title('Inside Left');
subplot(2,2,2),imshow(srim,srmap); hold on;
plot(iim2p.selectStrongest(100));
title('Inside Right');
subplot(2,2,3),imshow(oc,ocmap); hold on;
plot(oim1p.selectStrongest(100));
title('Outside Left');
subplot(2,2,4),imshow(osr,osrmap); hold on;
plot(oim2p.selectStrongest(100));
title('Outside Right');

% Inside shots
trackeri = vision.PointTracker('MaxBidirectionalError',1,'NumPyramidLevels',5);

iim1p = iim1p.Location;
initialize(trackeri, iim1p, cfar);

[iim2p, validIdxi] = step(trackeri, srim);
mpi1 = iim1p(validIdxi,:);
mpi2 = iim2p(validIdxi,:);

figure;
showMatchedFeatures(cfar,srim,mpi1,mpi2);
title('Inside Tracked Features');

[mi, ni] = size(iim1p);

Ai = mi*Jx;

dxi = iim2p - iim1p;

bi = Jx'*(sum(dxi))'

ip = inv(Ai)*bi

ti = [1 0 ip(1); 0 1 ip(2)];

for i = 1:mi
    iim1p(i,3) = 1;
    xie(i,:) = ti*iim1p(i,:)';
end

erri = xie - iim2p;

msei = mean(erri.^2)
maxerri = max(erri)
disp('NOTE: maxerr is given separately for x and y.');

disp('Unable to find LMedS fundamental matrix as not enough points were matched');
% fundmatmedi = estimateFundamentalMatrix(mpi1,mpi2, 'Method', 'LMedS')
 fundmatrani = estimateFundamentalMatrix(mpi1,mpi2, 'Method', 'RANSAC')
% 
% [medV,medDi] = eig(fundmatmedi);
 [ranV,ranDi] = eig(fundmatrani);
 disp('Eigenvalues along diagonals');
% medDi
 ranDi
% 
% rankmedi = rank(fundmatmedi)
 rankrani = rank(fundmatrani)

% Outside Shots
trackero = vision.PointTracker('MaxBidirectionalError',1,'NumPyramidLevels',5);

oim1p = oim1p.Location;
initialize(trackero, oim1p, oc);

[oim2p, validIdxo] = step(trackero, osr);
mpo1 = oim1p(validIdxo,:);
mpo2 = oim2p(validIdxo,:);

figure;
showMatchedFeatures(oc,osr,mpo1,mpo2);
title('Outside Tracked Features');

[mo, no] = size(oim1p);

Ao = mo*Jx;

dxo = oim2p - oim1p;

bo = Jx'*(sum(dxo))'

op = inv(Ao)*bo

to = [1 0 op(1); 0 1 op(2)];

for i = 1:mo
    oim1p(i,3) = 1;
    xoe(i,:) = to*oim1p(i,:)';
end

erro = xoe - oim2p;

mseo = mean(erro.^2)
maxerro = max(erro)
disp('NOTE: maxerr is given separately for x and y.');

fundmatmedo = estimateFundamentalMatrix(mpo1,mpo2, 'Method', 'LMedS')
fundmatrano = estimateFundamentalMatrix(mpo1,mpo2, 'Method', 'RANSAC')

[medV,medDo] = eig(fundmatmedo);
[ranV,ranDo] = eig(fundmatrano);
disp('Eigenvalues along diagonals');
medDo
ranDo

rankmedo = rank(fundmatmedo)
rankrano = rank(fundmatrano)
