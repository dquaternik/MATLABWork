function res = dscale2(im,h,lev)

for i = 1:lev
    if i == 1
        prev = im;
    else
        prev = res(:,:,i-1);
    end
    
    res(:,:,i) = dscale(prev,h);
end