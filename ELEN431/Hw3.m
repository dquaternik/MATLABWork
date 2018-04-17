%% Devon Quaternik
% ELEN 431
% HW #3 
%% Problem 2
R=0.3.*[3 -2 1; -2 3 -2; 1 -2 3];
p=[-2; 1; -0.5];

%optimum weights
wo = inv(R)*p

sigd = p'*inv(R)*p;

%find minimum point on performance function
Jmin = sigd - wo'*p - p'*wo + wo'*R*wo

%% Problem 3

R=0.25.*[4 3 2 1; 3 4 3 2; 2 3 4 3; 1 2 3 4];
p=[0.5; 0.375; 0.25; 0.175];

wo = inv(R)*p
sigd = p'*inv(R)*p;

Jmin = sigd - wo'*p - p'*wo + wo'*R*wo

%% Problem 4
%Assume abs(alpha)<1, for example here alpha=0.5
n=1000;
m=1;
a=0.5;
u=wgn(m,n,0);

num1=[sqrt(1-a^2) 0];
den1=[1 -a];

x=filter(num1,den1,u);
v=0.1*randn(1,n);

num2=[1 4];
den2=[1];

d=v+filter(num2,den2,x);

[X,R]=corrmtx(x,m);

R
p=[mean(x(1)*conj(d(1)));mean(x(2)*conj(d(2)))]

%Part 2
wo=inv(R)*p;

%Part3
sigd = p'*inv(R)*p;
Jmin = sigd - wo'*p - p'*wo + wo'*R*wo

%% Problem 5 

R=[1 0.5 0.25; 0.5 1 0.5; 0.25 0.5 1];
p=[3; 1; 0];

wo = inv(R)*p

%Part b
sigd = 10;

%Jmin equation
Jmin = sigd + wo'*R*wo

%Part c
[V,D] = eig(R);

VH = V';

for k =1:3
    lam(k)=D(k,k);
    f(k)=(1/lam(k))*V(k,:)*VH(:,k);
end

sum1 = sum(f);

%Filter according to eigenvalues and vectors
wo = sum1*p