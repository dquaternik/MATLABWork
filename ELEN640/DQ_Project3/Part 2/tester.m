im6 = imread('Color/DSCN0632Color2_C1.png');
im6bw = rgb2gray(im6);
se = strel('disk',3,0);
smfil       =   fspecial('average');
thresh = 127;
clim6 = imclose(im6bw,se);
thclim6  = threshold(clim6,thresh);
opim6    = imerode(im6bw,se);
opsmim6  = filter2(smfil,opim6);
edim6    = edge(opim6,'Sobel');
clopim6  = imopen(clim6,se);
thclopim6 = threshold(clopim6,thresh);

figure;
imshow(edim6,[]);

diamRange = [50 90];
sensitivity = .95;
edgethresh = 0.1;
[centers6h,radii6h] = houghc(edim6,diamRange,sensitivity,edgethresh,'bright','edge image 6',im6);