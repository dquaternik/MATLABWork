%% ELEN 236 Project 1.2


%% Devon Quaternik

%% CE 2.4A
L=1;
J=0.0676;
m=0.9048;
r=0.03;
Jb=0.000326;
g=9.81;
p0=.25;

b=m/[(Jb/r^2)+m];

a=[0 1 0 0; 0 0 -b*g 0; 0 0 0 1; -m*g/(m*p0^2+J+Jb) 0 0 0];
B=[0;0;0;1/(m*p0^2+J+Jb)];
c=[1 0 0 0];
d=0;

sys=ss(a,B,c,d);

impulse(sys)

%Comment on constraints

%% CE 2.4B

[T,lam]=eig(a);

T1=inv(T);

%Diagonal Canonical form for each

a1=T1*a;
Ad=a1*T
Bd=T1*B
Cd=c*T
Dd=d

%% CE 3.4A

A2=a*a;
A3=A2*a;
P=[B a*B A2*B A3*B];
y=rank(P);
if y==length(a)
    disp('Controllable');
else
    disp('Not Controllable');
end