function res = uscale(im, h, lev)

[nh,mh] = size(h);
if nh == 1
    fil = 2*(h'*h);
else
    fil = 2*h;
end

[om, on] = size(im);
ex = zeros(om,on);

m = ceil(om/(lev+1));
n = ceil(on/(lev+1));

ex(1:2:2*m,1:2:2*n) = im(1:m,1:n);

res = filter2(fil,ex);

