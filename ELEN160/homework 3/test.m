clear;
clc;
clf;

t=1;
for p=.1:.1:10;
    x=((-p-1)+sqrt(p^2-2*p+1))/2;
    J=3*x^2+2*(p+1)*x+p;
    E(t)=eig(J);
    t=t+1;
end

plot(E)