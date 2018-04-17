%% Devon Quaternik
%ELEN 644
%HW 7

clear;
close all;

%% Problem 2

% Part b
syms a b x1 x2 x3 y1 y2 y3 t1 t2 t3 tx ty

J1 = [1 0 -(sin(t1)*x1)-(cos(t1)*y1); 0 1 (cos(t1)*x1)-(sin(t1)*y1)];
J2 = [1 0 -(sin(t2)*x2)-(cos(t2)*y2); 0 1 (cos(t2)*x2)-(sin(t2)*y2)];
J3 = [1 0 -(sin(t3)*x3)-(cos(t3)*y3); 0 1 (cos(t3)*x3)-(sin(t3)*y3)];
dx1 = [a*x1 - b*y1 + tx; b*x1 + a*y1 + ty];
dx2 = [a*x2 - b*y2 + tx; b*x2 + a*y2 + ty];
dx3 = [a*x3 - b*y3 + tx; b*x3 + a*y3 + ty];


A = (J1'*J1)+(J2'*J2)+(J3'*J3);
rank(A)
b = J1'*dx1 + J2'*dx2 + J3'*dx3;

disp('Since A is a full rank matrix, we are able to find p here, although due to size it is not shown');

%% Problem 3

% From HW5 cleaned up to remove all displays and ;
im1 = checkerboard(20,4,4);
im2 = rgb2gray(imread('4.1.05.tiff'));

% Problem 1
% Part a
ogpoints1 = detectHarrisFeatures(im1);

numpoints = length(ogpoints1);

% Part b
h1 = fspecial('Gaussian',5,1);
h2 = fspecial('Gaussian',15,3);
h3 = fspecial('Gaussian',25,5);
smim1 = filter2(h1,im1);
smim2 = filter2(h2,im1);
smim3 = filter2(h3,im1);

smpts1 = detectHarrisFeatures(smim1);
smptsl1 = length(smpts1);
smpts2 = detectHarrisFeatures(smim2);
smptsl2 = length(smpts2);
smpts3 = detectHarrisFeatures(smim3);
smptsl3 = length(smpts3);




% Part c
h = (1/16)*[1 4 6 4 1];
dim = dscale2(im1,h,3);
dpts1 = detectHarrisFeatures(dim(:,:,1));
dptsl1 = length(dpts1);
dpts2 = detectHarrisFeatures(dim(:,:,2));
dptsl2 = length(dpts2);
dpts3 = detectHarrisFeatures(dim(:,:,3));
dptsl3 = length(dpts3);


% Problem 2
% Part a
ogpoints2 = detectHarrisFeatures(im2);
numpoints = length(ogpoints2);

% Part b
h1 = fspecial('Gaussian',5,1);
h2 = fspecial('Gaussian',15,3);
h3 = fspecial('Gaussian',25,5);
smim1 = filter2(h1,im2);
smim2 = filter2(h2,im2);
smim3 = filter2(h3,im2);

smpts1 = detectHarrisFeatures(smim1);
smptsl1 = length(smpts1);
smpts2 = detectHarrisFeatures(smim2);
smptsl2 = length(smpts2);
smpts3 = detectHarrisFeatures(smim3);
smptsl3 = length(smpts3);


% Part c
h = (1/16)*[1 4 6 4 1];
dim = dscale2(im2,h,3);
dpts1 = detectHarrisFeatures(dim(:,:,1));
dptsl1 = length(dpts1);
dpts2 = detectHarrisFeatures(dim(:,:,2));
dptsl2 = length(dpts2);
dpts3 = detectHarrisFeatures(dim(:,:,3));
dptsl3 = length(dpts3);




% HW7 Work

eigpts1 = detectMinEigenFeatures(im1);
eigpts2 = detectMinEigenFeatures(im2);
fstpts1 = detectFASTFeatures(im1);
fstpts2 = detectFASTFeatures(im2);

figure;
subplot(2,2,1),imshow(im1); hold on;
plot(ogpoints1.selectStrongest(20));
title('detectHarrisFeatures points');
subplot(2,2,2),imshow(im1); hold on;
plot(eigpts1.selectStrongest(20));
title('detectMinEigenFeatures points');
subplot(2,2,3),imshow(im1); hold on;
plot(fstpts1.selectStrongest(20));
title('detectFASTFeatures points');

figure;
subplot(2,2,1),imshow(im2); hold on;
plot(ogpoints2.selectStrongest(20));
title('detectHarrisFeatures points');
subplot(2,2,2),imshow(im2); hold on;
plot(eigpts2.selectStrongest(20));
title('detectMinEigenFeatures points');
subplot(2,2,3),imshow(im2); hold on;
plot(fstpts2.selectStrongest(20));
title('detectFASTFeatures points');

disp('For the checkerboard, Eigen works identically to Harris. FAST, on the other hand, captures none of the points.');
disp('For the house image, the Eigen features detect points that are similar to Harris, but a few points are different. FAST features captures similar, but they tend to be actual corners of the building or its features, rather than near them.');


%% Problem 4

% Part a
% Using original and shifted images from both sets. 
[cfar,farmap] = imread('Photos/centerfar.jpg');
cfar = imrotate(cfar,-90);
cfar = imresize(cfar,[256,256]);
[slim,slmap] = imread('Photos/shiftleft.jpg');
slim = imrotate(slim,-90);
slim = imresize(slim,[256,256]);
[srim,srmap] = imread('Photos/shiftright.jpg');
srim = imrotate(srim,-90);
srim = imresize(srim,[256,256]);

cfarg = rgb2gray(cfar);
slimg = rgb2gray(slim);
srimg = rgb2gray(srim);

[oc,ocmap] = imread('Outdoor/oc.jpg');
oc = imrotate(oc,-90);
oc = imresize(oc,[256,256]);
[osl,oslmap]=imread('Outdoor/osl.jpg');
osl = imrotate(osl,-90);
osl = imresize(osl,[256,256]);
[osr,osrmap]=imread('Outdoor/osr.jpg');
osr = imrotate(osr,-90);
osr = imresize(osr,[256,256]);

ocg = rgb2gray(oc);
oslg = rgb2gray(osl);
osrg = rgb2gray(osr);

clpts = detectFASTFeatures(cfarg);
slpts = detectFASTFeatures(slimg);
srpts = detectFASTFeatures(srimg);

ocpts = detectFASTFeatures(ocg);
oslpts = detectFASTFeatures(oslg);
osrpts = detectFASTFeatures(osrg);

figure;
subplot(2,2,1),imshow(cfar,farmap); hold on;
plot(clpts.selectStrongest(70));
subplot(2,2,2),imshow(slim,slmap); hold on;
plot(slpts.selectStrongest(70));
subplot(2,2,3),imshow(srim,srmap); hold on;
plot(srpts.selectStrongest(70));

figure;
subplot(2,2,1),imshow(oc,ocmap); hold on;
plot(ocpts.selectStrongest(60));
subplot(2,2,2),imshow(osl,oslmap); hold on;
plot(oslpts.selectStrongest(60));
subplot(2,2,3),imshow(osr,osrmap); hold on;
plot(osrpts.selectStrongest(60));

%indoor point pairs
xi1 = [97 123; 103 120; 146 123; 151 126; 156 130; 162 147; 56 203; 172 243; 172 235; 176 189];
xi2 = [149 103; 154 99; 206 101; 213 104; 220 109; 236 132; 102 188; 235 233; 236 225; 248 176];
xi3 = [15 102; 33 98; 87 103; 90 106; 92 112; 81 138; 9 189; 116 244; 117 236; 114 184];

figure;
for i = 1:10
    subplot(2,1,1),plot([xi1(i,1) xi2(i,1)],[xi1(i,2) xi2(i,2)]); hold on;
    plot(xi2(i,1),xi2(i,2),'o');
    title('Image 1 to 2');
    subplot(2,1,2),plot([xi1(i,1) xi3(i,1)],[xi1(i,2) xi3(i,2)]); hold on;
    plot(xi3(i,1),xi3(i,2),'o');
    title('Image 1 to 3');
end
suptitle('Mark on image 2, 3');

%outdoor point pairs
xo1 = [160 114; 202 69; 189 67; 202 42; 108 202; 170 63; 131 25; 215 118; 232 73; 131 33];
xo2 = [176 99; 218 53; 203 48; 221 25; 169 184; 191 48; 143 7; 248 103; 238 56; 143 15];
xo3 = [114 109; 157 67; 144 64; 157 41; 32 192; 119 59; 90 18; 158 115; 191 74; 89 29];

figure; 
for i = 1:10
    subplot(2,1,1),plot([xo1(i,1) xo2(i,1)],[xo1(i,2) xo2(i,2)]); hold on;
    plot(xo2(i,1),xo2(i,2),'o');
    title('Image 1 to 2');
    subplot(2,1,2),plot([xo1(i,1) xo3(i,1)],[xo1(i,2) xo3(i,2)]); hold on;
    plot(xo3(i,1),xo3(i,2),'o');
    title('Image 1 to 3');
end
suptitle('Mark on image 2, 3');

% Part B
% All have same jacobian and therefore A matrix.
Jx = [1 0; 0 1];
A = 10*Jx;

% only 2 sets of dx as we only have 2 sets of points
for i = 1: 10
    %indoors
    dxi1(i,1) = xi2(i,1) - xi1(i,1);
    dxi1(i,2) = xi2(i,2) - xi1(i,2);
    dxi2(i,1) = xi3(i,1) - xi1(i,1);
    dxi2(i,2) = xi3(i,2) - xi1(i,2);
    
    %outdoors
    dxo1(i,1) = xo2(i,1) - xo1(i,1);
    dxo1(i,2) = xo2(i,2) - xo1(i,2);
    dxo2(i,1) = xo3(i,1) - xo1(i,1);
    dxo2(i,2) = xo3(i,2) - xo1(i,2);
end


bi12 = Jx'*(sum(dxi1))'
bi13 = Jx'*(sum(dxi2))'

bo12 = Jx'*(sum(dxo1))'
bo13 = Jx'*(sum(dxo2))'

ip12 = inv(A)*bi12
ip13 = inv(A)*bi13

op12 = inv(A)*bo12
op13 = inv(A)*bo13

ti12 = [1 0 ip12(1); 0 1 ip12(2)];
ti13 = [1 0 ip13(1); 0 1 ip13(2)];

to12 = [1 0 op12(1); 0 1 op12(2)];
to13 = [1 0 op13(1); 0 1 op13(2)];

figure;
for i = 1:10
    xi1(i,3) = 1;
    xei12(i,:) = ti12*xi1(i,:)';
    xei13(i,:) = ti13*xi1(i,:)';
    subplot(2,1,1),plot([xi1(i,1) xi2(i,1)],[xi1(i,2) xi2(i,2)]); hold on;
    plot([xi1(i,1) xei12(i,1)],[xi1(i,2) xei12(i,2)]);
    plot(xei12(i,1),xei12(i,2),'^');
    plot(xi2(i,1),xi2(i,2),'o');
    title('Image 1 to 2');
    subplot(2,1,2),plot([xi1(i,1) xi3(i,1)],[xi1(i,2) xi3(i,2)]); hold on;
    plot([xi1(i,1) xei13(i,1)],[xi1(i,2) xei13(i,2)]);
    plot(xei13(i,1),xei13(i,2),'^');
    plot(xi3(i,1),xi3(i,2),'o');
    title('Image 1 to 3');
end
suptitle('Estimate Mark: ^, Actual Mark: o');

figure; 
for i = 1:10
    xo1(i,3) = 1;
    xeo12(i,:) = to12*xo1(i,:)';
    xeo13(i,:) = to13*xo1(i,:)';
    subplot(2,1,1),plot([xo1(i,1) xo2(i,1)],[xo1(i,2) xo2(i,2)]); hold on;
    plot([xo1(i,1) xeo12(i,1)],[xo1(i,2) xeo12(i,2)]);
    plot(xeo12(i,1),xeo12(i,2),'^');
    plot(xo2(i,1),xo2(i,2),'o');
    title('Image 1 to 2');
    subplot(2,1,2),plot([xo1(i,1) xo3(i,1)],[xo1(i,2) xo3(i,2)]); hold on;
    plot([xo1(i,1) xeo13(i,1)],[xo1(i,2) xeo13(i,2)]);
    plot(xeo13(i,1),xeo13(i,2),'^');
    plot(xo3(i,1),xo3(i,2),'o');
    title('Image 1 to 3');
end
suptitle('Estimate Mark: ^, Actual Mark: o');










