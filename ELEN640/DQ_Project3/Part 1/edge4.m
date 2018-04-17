function [canny, sobel, log, prewitt] = edge4(im)
%   [canny, sobel, log, prewitt] = edge4(im)
%   Creates single figure with 4 images, each using a different method of 
%   edge detection. Methods are Canny, Sobel, LoG, and Prewitt. 

% Canny

canny = edge(im,'Canny');

figure;
subplot(2,2,1), imshow(canny);
title('Canny');

% Sobel

sobel = edge(im,'Sobel');

subplot(2,2,2), imshow(sobel);
title('Sobel');

% LoG

log = edge(im,'log');

subplot(2,2,3), imshow(log);
title('LoG');

% Prewitt

prewitt = edge(im,'Prewitt');

subplot(2,2,4), imshow(prewitt);
title('Prewitt');