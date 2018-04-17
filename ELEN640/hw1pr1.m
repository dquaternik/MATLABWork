C1=zeros(256,1);
C2=zeros(256,1);
D1=zeros(256,1);
D2=zeros(256,1);

for m=0:255
    a=m;
    b=m+1;
    C1(m+1)=32+ (32/(b-(a-1)))*(1.51365*sin(0.2*pi*b) - 0.491816*cos(0.2*pi*b)-(1.51365*sin(0.2*pi*a) - 0.491816*cos(0.2*pi*a)));
end

for m=0:255
        C2(m+1)=32*(1+cos(0.2*pi*m));
end

for m=0:255
    D1(m+1)=32*(1+cos(5*pi*(m+0.4)));
end

for a=1:256
    for b=1:256
        D2(a,b)=0;
    end
end



image(C1)
colorbar
title('Part c non-ideal')

figure;

image(C2)
colorbar
title('Part c ideal')