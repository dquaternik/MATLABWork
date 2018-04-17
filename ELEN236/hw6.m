%% Problem 3

A=[-5 1 0; 0 -2 1; 0 0 -1]; 
B=[0;0;1];
C=[-1 1 0];
D=0;
n=length(A);

sys=ss(A,B,C,D);
P=ctrb(sys);

if rank(P)==n
    disp('Controllable')
else
    disp('Not controllable')
end

[num, den]=ss2tf(A,B,C,D);
Pc1=[17 8 1; 8 1 0; 1 0 0];
T=P*Pc1;
T1=inv(T);

%a= actual
%d= desired
syms x;
a=charpoly(A,x);
d=expand((x+4)*(x+1+2*j)*(x+1-2*j));

acoef=coeffs(a);
dcoef=coeffs(d);

len=length(acoef)-1;
kc=zeros(1,len);

for i=1:len
    kc(i)=dcoef(i)-acoef(i);
end

K=kc*T1

%% Problem 4

%Yes it is possible to find a state feedback gain for this system that will
%get you to the desired location. The system is in controllable canonical
%form, which guarentees controllablility. 

A=[0 1 0; 0 0 1; -2 -5 -6];
B=[0; 0; 1];

d=[-2+4j -2-4j -19];

P=ctrb(A,B);
len=length(A);

if rank(P)==len
    disp('Controllable')
    K=acker(A,B,d)
else
    disp('Not Controllable');
end

%% CME 7.4b
%Uses minimal realization from CME 5.4
num1=[0 0 10]
den1=[1 4 68]

%minimal form state-space realization
[a,b,c,d]=tf2ss(num1,den1)

sys=ss(a,b,c,d);
ts=2;
PO=2/100;

z=sqrt((log(PO))^2/(pi^2+(log(PO))^2));
wn=4/(z*ts);

eq=[1 2*z*wn wn^2];

%desired eigenvalues
ev=roots(eq)
ev1=ev';
K=acker(a,b,ev1)

a1=a-b*K;
b1=b;
c1=c;
d1=d;

sys2=ss(a1,b1,c1,d1);

sys1=ss(a,b,c,d);
subplot(2,1,1),stepplot(sys1);
title('Open loop step response');
subplot(2,1,2),stepplot(sys2);
title('Closed loop step response');

stepinfo(sys2)

%as you can see from the stepinfo, all design goals were met

