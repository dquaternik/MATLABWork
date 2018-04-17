%ELEN 640 HW 2

%% Problem 1
M=8;
N=8;
f1=zeros(M,N);
f2=zeros(M,N);
F1=zeros(M,N);
F2=zeros(M,N);


for m=1:M
    for n=1:N
        f1(m,n)=round(16+10*cos(2*pi*m/2)*cos(2*pi*n/2));
        f2(m,n)=round(16+10*cos(2*pi*m/4)*cos(2*pi*n/8));
    end
end

f1
f2

%5 bits of gray = 32 total levels
F1=mod(f1,32);
F2=mod(f2,32);

tick=zeros(1,g);
for g=1:32
    tick(g)=g;
end

figure(1);
image(f1,'CDataMapping','scaled')
h1=colorbar('Ticks',tick);
h1.Limits = [1 32];
title('Image of f1 in 5 bits total')

figure(2);
image(f2,'CDataMapping','scaled')
h2=colorbar('Ticks',tick);
h2.Limits = [1 32];
title('Image of f2 in 5 bits total')

figure(3);
histogram(F1)
title('Histogram of f1 for 5 bits')
axis([1 32 0 32])

figure(4);
histogram(F2)
title('Histogram of f2 for 5 bits')
axis([1 32 0 32])

%% Problem 2

M=512;
N=512;

fa=zeros(m,n);
fb=zeros(m,n);
fc=zeros(m,n);
fd=zeros(m,n);

for m=1:M
    for n=1:N;
        fa(m,n)=round(64+40*cos(2*pi*m/128)*cos(2*pi*n/128)); %7 bits of gray
        fb(m,n)=round(64+40*cos(2*pi*m/256)*cos(2*pi*n/512));
        fc(m,n)=round(8+5*cos(2*pi*m/128)*cos(2*pi*n/128));   %4 bits of gray
        fd(m,n)=round(8+5*cos(2*pi*m/256)*cos(2*pi*n/512));
    end
end

figure(5);
image(fa,'CDataMapping','scaled')
colorbar
title('Image of part a')

figure(6);
image(fb,'CDataMapping','scaled')
colorbar
title('Image of part b')

figure(7);
image(fc,'CDataMapping','scaled')
colorbar
title('Image of part c')

figure(8);
image(fd,'CDataMapping','scaled')
colorbar
title('Image of part d')

