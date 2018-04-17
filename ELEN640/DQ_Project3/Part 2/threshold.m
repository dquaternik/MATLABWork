function threshim = threshold(im, thresh)
%   threshim = threshold(im,thresh)
%   Creates thresholded image, threshim, at given threshold, thresh. 


imsize  =   size(im);

rows    =   imsize(1);
cols    =   imsize(2);

threshim = zeros(imsize);
for i = 1:rows
    for j = 1:cols
        if im(i,j) >= thresh
            threshim(i,j) = 255;
        end
    end
end

end