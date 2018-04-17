function [centers, radii] = circmatch(im,h1,titleStr)
%   Creates a heatmapt of circle correlations for an image to find the
%   cirlces. Returns found centers and radii. Inputs are 
%     im: the image to process
%     h1: the filter to match. Set to 0 for a disk of size 7.
%     titleStr: a title string.

if h1 == 0
    h1 = fspecial('disk',3);
end
    
g1 = normxcorr2(h1,im);

figure;
imshow(g1);
title(titleStr);
hold on
[b1,l1] = bwboundaries(g1);
% imshow(label2rgb(l1,@jet,[.5 .5 .5]))
    for k = 1:length(b1)
        boundary = b1{k};
        plot(boundary(:,2),boundary(:,1),'w','LineWidth',2)
    end

stats = regionprops('table',l1,'Centroid','MajorAxisLength','MinorAxisLength');

centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;

hold on
viscircles(centers,radii);
hold off 


