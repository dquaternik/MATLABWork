%% Devon Quaternik
% ELEN 640
% HW 8

clear;
close all;

%% Problem 1

cam = imread('cameraman.tif');
cel = imread('cell.tif');
eig = imread('eight.tif');

cam0 = createodd(cam);
cel0 = createodd(cel);
eig0 = createodd(eig);

% Part a
cam1 = impyramid(cam0,'reduce');
cam2 = impyramid(cam1,'reduce');
cam3 = impyramid(cam2,'reduce');

cel1 = impyramid(cel0,'reduce');
cel2 = impyramid(cel1,'reduce');
cel3 = impyramid(cel2,'reduce');

eig1 = impyramid(eig0,'reduce');
eig2 = impyramid(eig1,'reduce');
eig3 = impyramid(eig2,'reduce');

% Part b

figure;
subplot(2,2,1),imshow(cam0);
title('No reduction');
subplot(2,2,2),imshow(cam1);
title('1 reduction');
subplot(2,2,3),imshow(cam2);
title('2 reductions');
subplot(2,2,4),imshow(cam3);
title('3 reductions');
suptitle('Cameraman');

figure;
subplot(2,2,1),imshow(cel0);
title('No reduction');
subplot(2,2,2),imshow(cel1);
title('1 reduction');
subplot(2,2,3),imshow(cel2);
title('2 reductions');
subplot(2,2,4),imshow(cel3);
title('3 reductions');
suptitle('Cell');

figure;
subplot(2,2,1),imshow(eig0);
title('No reduction');
subplot(2,2,2),imshow(eig1);
title('1 reduction');
subplot(2,2,3),imshow(eig2);
title('2 reductions');
subplot(2,2,4),imshow(eig3);
title('3 reductions');
suptitle('Eight');

disp('All images show more blocky due to a reduced number of pixels covering the same area. The backgrounds are also blurred, with the smallest details being entirely removed as you reduce further.');

disp('When zooming, it seems like the higher resolution zoom further in. This probably has to do with number of pixels being displayed. Looking at each you quickly lose details. The face of the man is unrecognizable and you cannot read the words of the coins after 1 reduction. The structures of the cell are also lost.');

% Part c

cam1r = impyramid(cam1,'expand');
cel1r = impyramid(cel1,'expand');
eig1r = impyramid(eig1,'expand');

difcam = im2double(cam0) - im2double(cam1r);
difcel = im2double(cel0) - im2double(cel1r);
difeig = im2double(eig0) - im2double(eig1r);

camVmax = max(difcam(:))
celVmax = max(difcel(:))
eigVmax = max(difeig(:))

% Part d

figure;
subplot(2,2,1),imshow(cam0);
title('Original');
subplot(2,2,2),imshow(cam1);
title('1 reduction');
subplot(2,2,3),imshow(cam1r);
title('Reduced then expanded');
subplot(2,2,4),imshow(difcam,[-camVmax camVmax]);
title('Difference Image');
suptitle('Cameraman');

figure;
subplot(2,2,1),imshow(cel0);
title('Original');
subplot(2,2,2),imshow(cel1);
title('1 reduction');
subplot(2,2,3),imshow(cel1r);
title('Reduced then expanded');
subplot(2,2,4),imshow(difcel,[-celVmax celVmax]);
title('Difference Image');
suptitle('Cell');

figure;
subplot(2,2,1),imshow(eig0);
title('Original');
subplot(2,2,2),imshow(eig1);
title('1 reduction');
subplot(2,2,3),imshow(eig1r);
title('Reduced then expanded');
subplot(2,2,4),imshow(difeig,[-eigVmax eigVmax]);
title('Difference Image');
suptitle('Eight');

disp('The difference image seems to show the high frequency areas of the image. This would be the edges and small details such as the face of the cameraman and details of the camera. These almost look like an imprint of the image into metal');

%% Problem 4
hs = [1/3; 1/3; 1/3];
ha = [1/3 1/3 1/3];
h1 = hs*ha; 

u1 = -0.5:0.01:0.5;
u2 = -2.5:0.01:0.5;
Hu1 = (1/3)*exp(2*pi*j*u1)+(1/3)+(1/3)*exp(-2*pi*j*u1);
Hu2 = (1/3)*exp(2*pi*j*u2)+(1/3)+(1/3)*exp(-2*pi*j*u2);

figure;
subplot(3,2,1),plot(abs(Hu1))
title('Hu, u = -0.5:0.5');
subplot(3,2,2),plot(abs(Hu2))
title('Hu, u = -2.5:2.5');

display('Hu is one cycle of the filter. Extending it causes you to see the cyclical nature');

% Part b

g1 = fft(ha);

subplot(3,2,3),plot(abs(g1));
title('Part b, FFT');
subplot(3,2,4),plot(fftshift(abs(g1)));
title('Part b, FFT shift');

disp('The fft is triangular, which is similar to Hu. This is due to the low sample size of the filter. The fftshift shows the negative side and a full triangle. Similar to the last one, it is low resolution but in the same shape as the continuous filter. These are not cyclical due to the specification that hs/ha are 0 outside of defined space.');

% Part c
g2 = fft(ha,256);

subplot(3,2,5),plot(abs(g2));
title('Part c, FFT');
subplot(3,2,6),plot(fftshift(abs(g2)));
title('Part c, FFT shift');

disp('These results are much closer to part a, especially the shifted FFT. This is due to allowing much more sampling in the same space, forming a more continuous graph.');

% Part d

% delta(u) = k/(m*delta(x))

%% Problem 6 
flag = 0;
n = 1;

while flag == 0
    % n must b greater than 1 because of the way matlab calculates
    % arbitrary base logarithms
    n = n+1;
    fn = n*log(n)/log(2);
    gn = n^2/30;
    
    if fn <= gn
        flag = 1;
    end   
end

disp(['To improve by a factor of 30 N=' num2str(n)]);
    
n = 1;
flag = 0; 

while flag == 0
    % n must b greater than 1 because of the way matlab calculates
    % arbitrary base logarithms
    n = n+1;
    fn = n*log(n)/log(2);
    gn = n^2/100;
    
    if fn <= gn
        flag = 1;
    end
end

disp(['To improve by a factor of 100 N=' num2str(n)]);














