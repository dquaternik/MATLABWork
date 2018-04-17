%% Devon Quaternik

%% Problem 1

%desired s=-1+-2j;
%s^2+2s+5=0;

a=[0 0 -2; 1 0 -5; 0 1 -4];
b=[1;1;0];
P=ctrb(a,b)
rnk=rank(P);
if rnk==length(a)
    disp('Controllable');
else
    disp('Not Controllable');
    rnk
end

%assuming 
c=[0 0 1];

pc=ctrb(a',c')
pc1=inv(pc)
T=P*pc1

[num,den]=ss2tf(a,b,c,0)

syms s
frac=(s+1)/(s^3+4*s^2+5*s+2)
frac1=simplifyFraction(frac)
if frac1==frac
    disp('Minimal form')
else
    disp('non-minimal')
end

num1=[0 0 1];
den1=[1 3 2];

[a1,b1,c1,d1]=tf2ss(num1,den1)

p1=ctrb(a1,b1);
if rank(p1)==length(a1)
    disp('Controllable');
else
    disp('Not Controllable');
end

de=[-1+2*j -1-2*j];
K=place(a1,b1,de)

abk=a1-b1*K
bk=b1
ck=c1
dk=d1

%% Problem 5/CME 8.4a
%Uses minimal realization from CME 5.4
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
ev2=10*ev1

L=place(a',c',ev2)'

K=acker(a,b,ev1)

a1=a-b*K;
b1=b;
c1=c;
d1=d;

sys2=ss(a1,b1,c1,d1);

a2=a1-L*c
b2=b;
c2=c;
d2=d;

sys3=ss(a2,b2,c2,d2);


sys1=ss(a,b,c,d);
subplot(3,1,1),stepplot(sys1);
title('Open loop step response');
subplot(3,1,2),stepplot(sys2);
title('Closed loop step response');
subplot(3,1,3),stepplot(sys3);
title('Closed loop step response with observer');

stepinfo(sys2)
stepinfo(sys3)

%You can see from the stepinfo, the observer improves results further than
%just a controller. It reduces overshoot and, more noticibly,  the times it
%takes to reach steady state