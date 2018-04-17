function im1 = createodd(im)
%   Finds size of an image and removes first row/col if even. 


[imm,imn,num] = size(im);
im1 = zeros([imm,imn,num]);


for i = 1:num
    if mod(imm,2) == 0
        im1 = im(2:imm,:,i);
    else
        im1 = im;
    end

    if mod(imn,2) == 0
        im1 = im1(:,2:imn,i);
    end
end

end