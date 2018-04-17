%% Devon Quaternik
% ELEN 644
% HW 2

clear;
close all;
%% Problem 3

im = imread('5.1.09.tiff');

h1 = fspecial('gaussian',[7 7],1);
h2 = fspecial('gaussian',[15 15],2);
h3 = fspecial('gaussian',[31 31],4);

x1 = filter2(h1,im);
x2 = filter2(h2,im);
x3 = filter2(h3,im);

[m n] = size(im);

x1d = im(1:2:m,1:2:n);
x1df = filter2(h1,x1d);

figure;
subplot(2,3,1),imshow(im,[]);
title('Original Image');
subplot(2,3,2),imshow(x1,[]);
title('X1, Part a');
subplot(2,3,3),imshow(x2,[]);
title('X2, Part b');
subplot(2,3,4),imshow(x3,[]);
title('X3, Part c');
subplot(2,3,5),imshow(x1d,[]);
title('X1D, Part d');
subplot(2,3,6),imshow(x1df,[]);
title('X1D filtered, Part d');
suptitle('Problem 3');

% Part a 
% Comparing x1 to the original, the finer details are much less apparent.
% Small craters have been smoothed out, and the pock marks on the hills
% disappear. 
% Part b
% X2 is significantly blurred, compared to x1 and the original. Many of the
% small craters are lost and only the large structures remain. 
% Part c
% X3 is almost unrecognizable. Everything is severly blurred, as if you are
% squinting at the original image. Small craters are wiped out, and even
% large details are hard to make out. X2 is somewhere in the middle of x1
% and x3, in terms of blurring. 
% Part d
% The filtered image looks closest to x2, but slightly grainier. This has
% to do with the size being equalized in MATLAB, as in reality x1d is half
% the size of x2. It is still more detailed than x3, however, as you can
% see large structures fairly easily. 


%% Problem 4

h1l = fspecial('log',[7 7],1);
h2l = fspecial('log',[15 15],2);
h3l = fspecial('log',[31 31],4);

y1 = filter2(h1l,im);
y2 = filter2(h2l,im);
y3 = filter2(h3l,im);
y1d = x2-x1;
y1df = x3-x2;

figure;
subplot(2,3,1),imshow(im,[]);
title('Original Image');
subplot(2,3,2),imshow(x1,[]);
title('Y1, Part a');
subplot(2,3,3),imshow(x2,[]);
title('Y2, Part b');
subplot(2,3,4),imshow(x3,[]);
title('Y3, Part c');
subplot(2,3,5),imshow(y1d,[]);
title('X2-X1, Part d');
subplot(2,3,6),imshow(y1df,[]);
title('X3-X2, Part d');
suptitle('Problem 4');

% Part a
% Y1 is very similar to the original, but looks almost as if the image was
% slightly out of focus. Only the smallest of craters are lost, but most
% remain. 
% Part b
% Y2 begins to see a larger degredation of quality. The image looks as if
% you took a chalk eraser lightly to it. Large structures remain in tact.
% Part c
% Y3, like X3, is nearly unrecognizable. The large structures are difficult
% to make out, and small craters are lost. The shadows also are exagerated,
% making it difficult to tell exactly where things end. 
% Part d
% These two images look like what would happen if the LoG images were made
% into a 3D model, then you took an imprint of the model. x2-x1 looks
% similar to y1, and x3-x2 is similar to y2. Increasing the size of the
% filter causes the imprint to come out stronger, seemingly because you
% lose it in the LoG image. 





