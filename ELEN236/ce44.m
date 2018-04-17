%% ELEN 236 Project 1.4
%% Devon Quaternik

%Previous work
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

%% 4.4b

%previous work that creates the Controllable canonical form. Since
%Observable canonical form is the transpose of CCF, this is easier than
%redoing everything.
P=ctrb(sys);
[num, den]=ss2tf(a,B,c,d)
Pc1=[0 0 0 1; 0 0 1 0; 0 1 0 0; 1 0 0 0];
Tc=P*Pc1;
Tc1=inv(Tc);

Ac1=Tc1*a;
Ac=Ac1*Tc;
Bc=Tc1*B;
Cc=c*Tc;
Dc=d;

%Create transpose matrices
Ao=Ac.'
Bo=Cc.'
Co=Bc.'
Do=Dc.'

A2=a*a;
A3=A2*a;
Q=[c; c*a; c*A2; c*A3];
y=rank(Q);
if y==length(a)
    disp('Observable');
else
    disp('Not Observable');
end
%The OCF shows that this is an observable system, which agrees with what
%you find in the observability matrix.