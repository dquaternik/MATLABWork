function [centers,radii] = houghc(im,diamRange,sensitivity,edgethresh,polarity,titleStr,param3)
% Finds the circular hough transform for an image and returns the found
% centers and radii. Has 7 inputs as follows
%     im: the image to find circles in
%     diamRange: the range of diameters for the hough transform
%     sensitivity: Higher finds more circles but increases false positives.
%     edgethresh: Lower finds more circles but increases false positives.
%     polarrity: Look for objects brighter or darker than the background
%     titleStr: A title string
%     param3: the image you want to show the circles found on. Must be
%     color

if ~exist('param3','var')
     % third parameter does not exist, so default it to something
      param3 = im;
 end

[len,wid,num] = size(im);

if num > 1
    subx = ceil(num/2);
    suby = 2;
else
    subx = 1;
    suby = 1;
end

figure;

disp(titleStr);

for i = 1:num
    [centers,radii] = imfindcircles(im(:,:,i),diamRange,'Sensitivity',sensitivity,'Edgethreshold',edgethresh,'ObjectPolarity',polarity);
    
    str = sprintf('Image #%d', i);
    disp(str);
    centers
    radii 
    
    subplot(subx,suby,i), imshow(param3)
    title(['Image' num2str(i)])
    viscircles(centers,radii);
end

suptitle(titleStr);