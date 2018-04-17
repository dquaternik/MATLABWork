function out = dscale(im, h)

[n,m] = size(im);
out = zeros(n,m);

[nh,mh] = size(h);
if nh == 1
    fil = h'*h;
else
    fil = h;
end

ex = filter2(fil,im);
ex1 = ex(1:2:n,1:2:m);

fm = floor(m/2);
fn = floor(n/2);

out(1:fm,1:fn) = ex1;