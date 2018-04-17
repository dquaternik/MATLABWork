clear; clc;
a=4/pi;

index=1;

for t=.1:.1:5;
    for k=1:10
        y(k)=(-1).^k/(2*k+1)*cos(10*pi*(2*k+1)*t);
    end;
    z(index)=a*sum(y);
    index=index+1;
end;

t1=1:50;
scatter(t1,z);