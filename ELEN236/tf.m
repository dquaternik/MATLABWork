a=[0 -10; 1 -2];
b=[1;2];
c=[0 1];
d=0;

sys=ss(a,b,c,d);
[num,den]=ss2tf(sys)
