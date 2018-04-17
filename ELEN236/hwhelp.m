a=[0 1 0;0 0 1;-15 -17 -7];
b=[0; 0; 1];
c=[3 1 0];
d=0;

sys=ss(a,b,c,d);
[num,den]=ss2tf(a,b,c,d)

ans=roots(den)
syms s
ans1=(s+2+j)*(s+2-j)
num1=[0 0 1];
den1=[1 4 5];

[a1,b1,c1,d1]=tf2ss(num1,den1)