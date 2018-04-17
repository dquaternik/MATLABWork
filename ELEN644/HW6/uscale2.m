function res = uscale2(im, h, lev)

for i = 1:lev    
    res(:,:,i) = uscale(im(:,:,i),h,i);
end

