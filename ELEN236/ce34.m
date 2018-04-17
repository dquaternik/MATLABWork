%% ELEN 236 Project 1.2


%% Devon Quaternik

%% Previous work
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

%% 3.4b

% CCF transformation matrix
% Transfer function used to build inverted Pccf matrix
P=ctrb(sys);
[num, den]=ss2tf(a,B,c,d)
Pc1=[0 0 0 1; 0 0 1 0; 0 1 0 0; 1 0 0 0];
Tc=P*Pc1;
Tc1=inv(Tc);

Ac1=Tc1*a;
Ac=Ac1*Tc
Bc=Tc1*B
Cc=c*Tc
Dc=d