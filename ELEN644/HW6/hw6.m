%% Devon Quaternik
% ELEN 644
% HW 6

%% Problem 1
close all;
clear; 

%Get images and downscale to reasonable size and display the images
[cclose,closemap] = imread('Photos/centerclose.jpg');
cclose = imrotate(cclose,-90);
cclose = imresize(cclose,[256,256]);
[cfar,farmap] = imread('Photos/centerfar.jpg');
cfar = imrotate(cfar,-90);
cfar = imresize(cfar,[256,256]);
[slim,slmap] = imread('Photos/shiftleft.jpg');
slim = imrotate(slim,-90);
slim = imresize(slim,[256,256]);
[srim,srmap] = imread('Photos/shiftright.jpg');
srim = imrotate(srim,-90);
srim = imresize(srim,[256,256]);
[rrim,rrmap] = imread('Photos/rotateright.jpg');
rrim = imrotate(rrim,-90);
rrim = imresize(rrim,[256,256]);
[rlim,rlmap] = imread('Photos/rotateleft.jpg');
rlim = imrotate(rlim,-90);
rlim = imresize(rlim,[256,256]);

figure;
subplot(3,2,1),imshow(cclose,closemap);
title('Center image close');
subplot(3,2,2),imshow(cfar,farmap);
title('Center image far');
subplot(3,2,3),imshow(slim,slmap);
title('Shift Left');
subplot(3,2,4),imshow(srim,srmap);
title('Shift Right');
subplot(3,2,5),imshow(rrim,rrmap);
title('Rotate Right');
subplot(3,2,6),imshow(rlim,rlmap);
title('Rotate Left');


%% Problem 2

[oc,ocmap] = imread('Outdoor/oc.jpg');
oc = imrotate(oc,-90);
oc = imresize(oc,[256,256]);
[orl,orlmap]=imread('Outdoor/orl.jpg');
orl = imrotate(orl,-90);
orl = imresize(orl,[256,256]);
[orr,orrmap]=imread('Outdoor/orr.jpg');
orr = imrotate(orr,-90);
orr = imresize(orr,[256,256]);
[osl,oslmap]=imread('Outdoor/osl.jpg');
osl = imrotate(osl,-90);
osl = imresize(osl,[256,256]);
[osr,osrmap]=imread('Outdoor/osr.jpg');
osr = imrotate(osr,-90);
osr = imresize(osr,[256,256]);

figure;
subplot(3,2,1),imshow(oc,ocmap);
title('Center Image');
subplot(3,2,2),imshow(orl,orlmap);
title('Rotate Left');
subplot(3,2,3),imshow(orr,orrmap);
title('Rotate Right');
subplot(3,2,4),imshow(osl,oslmap);
title('Shift Left');
subplot(3,2,5),imshow(osr,osrmap);
title('Shift Right');

%% Problem 3
%Points selected
%The indoor image
manualp1 = [50 182; 152 126; 153 103; 79 92; 67 121; 57 77; 192 187; 181 187; 208 105; 193 87; 190 102; 204 124; 14 116; 29 92; 28 78; 23 44; 216 70; 196 4; 246 124; 238 107];
manp1 = cornerPoints(manualp1);
%The outdoor image
manualp2 = [169 137; 173 116; 222 139; 221 116; 77 193; 220 232; 122 54; 125 37; 202 67; 127 66; 29 96; 138 103; 5 21; 58 166; 64 45; 36 79; 252 73; 108 11; 101 117; 233 92];
manp2 = cornerPoints(manualp2);

%Display points
figure;
subplot(2,1,1),imshow(cclose,closemap); hold on;
plot(manp1);
subplot(2,1,2),imshow(oc,ocmap); hold on;
plot(manp2);


%% Problem 4
%Create gray images for detectHarrisFeatures and downsampling
ccloseg = rgb2gray(cclose);
cfarg = rgb2gray(cfar);
slimg = rgb2gray(slim);
srimg = rgb2gray(srim);
rlimg = rgb2gray(rlim);
rrimg = rgb2gray(rrim);

ocg = rgb2gray(oc);
orlg = rgb2gray(orl);
orrg = rgb2gray(orr);
oslg = rgb2gray(osl);
osrg = rgb2gray(osr);

%Detect Harris features of the gray images
cclosep = detectHarrisFeatures(ccloseg);
cfarp = detectHarrisFeatures(cfarg);
rlimp = detectHarrisFeatures(rlimg);
rrimp = detectHarrisFeatures(rrimg);
slimp = detectHarrisFeatures(slimg);
srimp= detectHarrisFeatures(srimg);

ocp = detectHarrisFeatures(ocg);
orlp = detectHarrisFeatures(orlg);
orrp = detectHarrisFeatures(orrg);
oslp = detectHarrisFeatures(oslg);
osrp = detectHarrisFeatures(osrg);

%Downsample
h = (1/16)*[1 4 6 4 1];
dclose = dscale2(ccloseg,h,3);
dfar = dscale2(cfarg,h,3);
drlim = dscale2(rlimg,h,3);
drrim = dscale2(rrimg,h,3);
dslim = dscale2(slimg,h,3);
dsrim = dscale2(srimg,h,3);

doc1 = dscale2(ocg,h,3);
dorl = dscale2(orlg,h,3);
dorr = dscale2(orrg,h,3);
dosl = dscale2(oslg,h,3);
dosr = dscale2(osrg,h,3);

%Detect Harris Features of downsampled images
dclosep1 = detectHarrisFeatures(dclose(:,:,1));
dclosep2 = detectHarrisFeatures(dclose(:,:,2));
dclosep3 = detectHarrisFeatures(dclose(:,:,3));
dfarp1 = detectHarrisFeatures(dfar(:,:,1));
dfarp2 = detectHarrisFeatures(dfar(:,:,2));
dfarp3 = detectHarrisFeatures(dfar(:,:,3));
drlimp1 = detectHarrisFeatures(drlim(:,:,1));
drlimp2 = detectHarrisFeatures(drlim(:,:,2));
drlimp3 = detectHarrisFeatures(drlim(:,:,3));
drrimp1 = detectHarrisFeatures(drrim(:,:,1));
drrimp2 = detectHarrisFeatures(drrim(:,:,2));
drrimp3 = detectHarrisFeatures(drrim(:,:,3));
dslimp1 = detectHarrisFeatures(dslim(:,:,1));
dslimp2 = detectHarrisFeatures(dslim(:,:,2));
dslimp3 = detectHarrisFeatures(dslim(:,:,3));
dsrimp1 = detectHarrisFeatures(dsrim(:,:,1));
dsrimp2 = detectHarrisFeatures(dsrim(:,:,2));
dsrimp3 = detectHarrisFeatures(dsrim(:,:,3));

docp1 = detectHarrisFeatures(doc1(:,:,1));
docp2 = detectHarrisFeatures(doc1(:,:,2));
docp3 = detectHarrisFeatures(doc1(:,:,3));
dorlp1 = detectHarrisFeatures(dorl(:,:,1));
dorlp2 = detectHarrisFeatures(dorl(:,:,2));
dorlp3 = detectHarrisFeatures(dorl(:,:,3));
dorrp1 = detectHarrisFeatures(dorr(:,:,1));
dorrp2 = detectHarrisFeatures(dorr(:,:,2));
dorrp3 = detectHarrisFeatures(dorr(:,:,3));
doslp1 = detectHarrisFeatures(dosl(:,:,1));
doslp2 = detectHarrisFeatures(dosl(:,:,2));
doslp3 = detectHarrisFeatures(dosl(:,:,3));
dosrp1 = detectHarrisFeatures(dosr(:,:,1));
dosrp2 = detectHarrisFeatures(dosr(:,:,2));
dosrp3 = detectHarrisFeatures(dosr(:,:,3));

%Scale up the lower level points
dclosep1.Location = dclosep1.Location.*2;
dclosep2.Location = dclosep2.Location.*4;
dclosep3.Location = dclosep3.Location.*8;
dfarp1.Location = dfarp1.Location.*2;
dfarp2.Location = dfarp2.Location.*4;
dfarp3.Location = dfarp3.Location.*8;
drlimp1.Location = drlimp1.Location.*2;
drlimp2.Location = drlimp2.Location.*4;
drlimp3.Location = drlimp3.Location.*8;
drrimp1.Location = drrimp1.Location.*2;
drrimp2.Location = drrimp2.Location.*4;
drrimp3.Location = drrimp3.Location.*8;
dslimp1.Location = dslimp1.Location.*2;
dslimp2.Location = dslimp2.Location.*4;
dslimp3.Location = dslimp3.Location.*8;
dsrimp1.Location = dsrimp1.Location.*2;
dsrimp2.Location = dsrimp2.Location.*4;
dsrimp3.Location = dsrimp3.Location.*8;

docp1.Location = docp1.Location.*2;
docp2.Location = docp2.Location.*4;
docp3.Location = docp3.Location.*8;
dorlp1.Location = dorlp1.Location.*2;
dorlp2.Location = dorlp2.Location.*4;
dorlp3.Location = dorlp3.Location.*8;
dorrp1.Location = dorrp1.Location.*2;
dorrp2.Location = dorrp2.Location.*4;
dorrp3.Location = dorrp3.Location.*8;
doslp1.Location = doslp1.Location.*2;
doslp2.Location = doslp2.Location.*4;
doslp3.Location = doslp3.Location.*8;
dosrp1.Location = dosrp1.Location.*2;
dosrp2.Location = dosrp2.Location.*4;
dosrp3.Location = dosrp3.Location.*8;

disp('Level 1 matches my manual points the best');
%Display level with matching corners (Level 1 is best)

%Uncomment this to see how all the points are mapped
% % Originals
% figure;
% subplot(3,2,1),imshow(cclose,closemap); hold on;
% plot(cclosep.selectStrongest(40));
% title('Center image close');
% subplot(3,2,2),imshow(cfar,farmap); hold on;
% plot(cfarp.selectStrongest(40));
% title('Center image far');
% subplot(3,2,3),imshow(slim,slmap); hold on;
% plot(slimp.selectStrongest(40));
% title('Shift Left');
% subplot(3,2,4),imshow(srim,srmap); hold on;
% plot(srimp.selectStrongest(40));
% title('Shift Right');
% subplot(3,2,5),imshow(rrim,rrmap); hold on;
% plot(rrimp.selectStrongest(40));
% title('Rotate Right');
% subplot(3,2,6),imshow(rlim,rlmap); hold on;
% plot(rlimp.selectStrongest(40));
% title('Rotate Left');
% 
% figure;
% subplot(3,2,1),imshow(oc,ocmap); hold on;
% plot(ocp.selectStrongest(40));
% title('Center Image');
% subplot(3,2,2),imshow(orl,orlmap); hold on;
% plot(orlp.selectStrongest(40));
% title('Rotate Left');
% subplot(3,2,3),imshow(orr,orrmap); hold on;
% plot(orrp.selectStrongest(40));
% title('Rotate Right');
% subplot(3,2,4),imshow(osl,oslmap); hold on;
% plot(oslp.selectStrongest(40));
% title('Shift Left');
% subplot(3,2,5),imshow(osr,osrmap); hold on;
% plot(osrp.selectStrongest(40));
% title('Shift Right');
% 
% Level 1
figure;
subplot(3,2,1),imshow(cclose,closemap); hold on;
plot(dclosep1.selectStrongest(40));
title('Center image close, level 1');
subplot(3,2,2),imshow(cfar,farmap); hold on;
plot(dfarp1.selectStrongest(40));
title('Center image far, level 1');
subplot(3,2,3),imshow(slim,slmap); hold on;
plot(dslimp1.selectStrongest(40));
title('Shift Left, level 1');
subplot(3,2,4),imshow(srim,srmap); hold on;
plot(dsrimp1.selectStrongest(40));
title('Shift Right, level 1');
subplot(3,2,5),imshow(rrim,rrmap); hold on;
plot(drrimp1.selectStrongest(40));
title('Rotate Right, level 1');
subplot(3,2,6),imshow(rlim,rlmap); hold on;
plot(drlimp1.selectStrongest(40));
title('Rotate Left, level 1');

figure;
subplot(3,2,1),imshow(oc,ocmap); hold on;
plot(docp1.selectStrongest(40));
title('Center Image, level 1');
subplot(3,2,2),imshow(orl,orlmap); hold on;
plot(dorlp1.selectStrongest(40));
title('Rotate Left, level 1');
subplot(3,2,3),imshow(orr,orrmap); hold on;
plot(dorrp1.selectStrongest(40));
title('Rotate Right, level 1');
subplot(3,2,4),imshow(osl,oslmap); hold on;
plot(doslp1.selectStrongest(40));
title('Shift Left, level 1');
subplot(3,2,5),imshow(osr,osrmap); hold on;
plot(dosrp1.selectStrongest(40));
title('Shift Right, level 1');
% 
% % Level 2
% figure;
% subplot(3,2,1),imshow(cclose,closemap); hold on;
% plot(dclosep2.selectStrongest(40));
% title('Center image close, level 2');
% subplot(3,2,2),imshow(cfar,farmap); hold on;
% plot(dfarp2.selectStrongest(40));
% title('Center image far, level 2');
% subplot(3,2,3),imshow(slim,slmap); hold on;
% plot(dslimp2.selectStrongest(40));
% title('Shift Left, level 2');
% subplot(3,2,4),imshow(srim,srmap); hold on;
% plot(dsrimp2.selectStrongest(40));
% title('Shift Right, level 2');
% subplot(3,2,5),imshow(rrim,rrmap); hold on;
% plot(drrimp2.selectStrongest(40));
% title('Rotate Right, level 2');
% subplot(3,2,6),imshow(rlim,rlmap); hold on;
% plot(drlimp2.selectStrongest(40));
% title('Rotate Left, level 2');
% 
% figure;
% subplot(3,2,1),imshow(oc,ocmap); hold on;
% plot(docp2.selectStrongest(40));
% title('Center Image, level 2');
% subplot(3,2,2),imshow(orl,orlmap); hold on;
% plot(dorlp2.selectStrongest(40));
% title('Rotate Left, level 2');
% subplot(3,2,3),imshow(orr,orrmap); hold on;
% plot(dorrp2.selectStrongest(40));
% title('Rotate Right, level 2');
% subplot(3,2,4),imshow(osl,oslmap); hold on;
% plot(doslp2.selectStrongest(40));
% title('Shift Left, level 2');
% subplot(3,2,5),imshow(osr,osrmap); hold on;
% plot(dosrp2.selectStrongest(40));
% title('Shift Right, level 2');
% 
% % Level 3
% figure;
% subplot(3,2,1),imshow(cclose,closemap); hold on;
% plot(dclosep3.selectStrongest(40));
% title('Center image close, level 3');
% subplot(3,2,2),imshow(cfar,farmap); hold on;
% plot(dfarp3.selectStrongest(40));
% title('Center image far, level 3');
% subplot(3,2,3),imshow(slim,slmap); hold on;
% plot(dslimp3.selectStrongest(40));
% title('Shift Left, level 3');
% subplot(3,2,4),imshow(srim,srmap); hold on;
% plot(dsrimp3.selectStrongest(40));
% title('Shift Right, level 3');
% subplot(3,2,5),imshow(rrim,rrmap); hold on;
% plot(drrimp3.selectStrongest(40));
% title('Rotate Right, level 3');
% subplot(3,2,6),imshow(rlim,rlmap); hold on;
% plot(drlimp3.selectStrongest(40));
% title('Rotate Left, level 3');
% 
% figure;
% subplot(3,2,1),imshow(oc,ocmap); hold on;
% plot(docp3.selectStrongest(40));
% title('Center Image, level 3');
% subplot(3,2,2),imshow(orl,orlmap); hold on;
% plot(dorlp3.selectStrongest(40));
% title('Rotate Left, level 3');
% subplot(3,2,3),imshow(orr,orrmap); hold on;
% plot(dorrp3.selectStrongest(40));
% title('Rotate Right, level 3');
% subplot(3,2,4),imshow(osl,oslmap); hold on;
% plot(doslp3.selectStrongest(40));
% title('Shift Left, level 3');
% subplot(3,2,5),imshow(osr,osrmap); hold on;
% plot(dosrp3.selectStrongest(40));
% title('Shift Right, level 3');

disp('The pionts in the other images match up to the points manually selected fairly well. They should be able to be used for feature detection.');
