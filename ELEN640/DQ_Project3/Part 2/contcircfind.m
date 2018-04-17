function [centers,radii] = contcircfind(im,titleStr)
% Uses image pyrramids to find and display circles. Returns centers and
% radii. Inputs are im: the image to process and titleStr: a title string.

im0 = createodd(im);

im1 = impyramid(im0,'reduce');

im1r = impyramid(im1,'expand');

difim = im2double(im0) - im2double(im1r);

difim1 = threshold(difim,0);
figure;
imshow(difim1,[]);

[b1,l1] = bwboundaries(difim1);

% imshow(label2rgb(l1,@jet,[.5 .5 .5]))
title(titleStr)
hold on
for k = 1:length(b1)
    boundary = b1{k};
    plot(boundary(:,2),boundary(:,1),'w','LineWidth',2);
end

stats = regionprops('table',l1,'Centroid','MajorAxisLength','MinorAxisLength');

centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;

hold on
viscircles(centers,radii);
hold off 
