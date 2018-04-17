function im1 = createodd(im)
%   Finds size of an image and removes first row/col if even. 


[imm,imn] = size(im);

if mod(imm,2) == 0
    im1 = im(2:imm,:);
else
    im1 = im;
end

if mod(imn,2) == 0
    im1 = im1(:,2:imn);
end

end