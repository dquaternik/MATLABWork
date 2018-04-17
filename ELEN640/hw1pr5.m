a=0.01;
m0=128;
n0=m0;
C=zeros(256);

for k=[2,4,5,6,8]
    figure;
    for m=1:256
        for n=1:256
            C(m,n)=round(( (2^k)-1) * ( exp( (-a^2)*( (m-m0)^2 + (n-n0)^2 ))));
        end
    end
    image(C);
    title(['k =' num2str(k)]);
end