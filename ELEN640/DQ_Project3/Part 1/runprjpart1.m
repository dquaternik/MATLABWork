


%% Devon Quaternik
% Elen 640
% Project Part 1 run script.
% Tests edge detection and threshold at 127 (halfway between 0 255) and the
% median value of the image.

disp('WARNING: Creates 13 figures per test image (currently 6). May take over 1 minute to complete. Continue?');
pause;

close all;
clear;

im1 = imread('DSCN0563Gray4_C1.png');
im2 = imread('DSCN0566Gray4_C1.png');
im3 = imread('DSCN0569Gray4_C1.png');
im4 = imread('DSCN0572Gray4_C1.png');
im5 = imread('DSCN0576Gray4_C1.png');
im6 = imread('DSCN0579Gray4_C1.png');

thresh = 256/2-1;
thresh1 = median(median(im1));
thresh2 = median(median(im2));
thresh3 = median(median(im3));
thresh4 = median(median(im4));
thresh5 = median(median(im5));
thresh6 = median(median(im6));

% Image 1
figure;
imshow(im1);
edgetest(im1);              % 8 figures
threshtest(im1,thresh);     % 2 figures
threshtest(im1,thresh1);    % 2 figures

% Image 2
figure;
imshow(im2);
edgetest(im2);
threshtest(im2,thresh);
threshtest(im2,thresh2);

% Image 3
figure;
imshow(im3);
edgetest(im3);
threshtest(im3,thresh);
threshtest(im3,thresh3);

% Image 4
figure;
imshow(im4);
edgetest(im4);
threshtest(im4,thresh);
threshtest(im4,thresh4);

% Image 5
figure;
imshow(im5);
edgetest(im5);
threshtest(im5,thresh);
threshtest(im5,thresh5);

% Image 6
figure;
imshow(im6);
edgetest(im6);
threshtest(im6,thresh);
threshtest(im6,thresh6);