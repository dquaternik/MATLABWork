syms n
N = 10;
theta=2*pi*randn(1,1);
vn=sqrt(0.5)*randn(1,N);

xn = vn+cos(0.3*pi*n+theta);

xbar=zeros(1,N);

rxx=mean(xn(2:end).*xn(1:(end-1)))


for i=1:N
    for n=0:(1-N)
        
end

input=xbar.';

