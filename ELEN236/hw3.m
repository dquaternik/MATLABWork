%% Problem 4
A=[-5 -5 4; 2 0 -2; 0 -2 -1];
B=[-1; 2; -2];
C=[-1 1 2];
D=0;

%Transfer function used to build inverted Pccf matrix
sys=ss(A,B,C,D);
[num, den]=ss2tf(A,B,C,D)
roots(den)

P=ctrb(sys)
Pc1=[11 6 1; 6 1 0; 1 0 0]; 
T=P*Pc1;
T1=inv(T);

Ac1=T1*A;
Ac=Ac1*T
Bc=T1*B
Cc=C*T
Dc=D

%% CME 3.4

A=[0 1 0 0; 0 0 1 0; 0 0 0 1; -680 -176 -86 -6];
B=[0;0;0;1];
C=[100 20 10 0];
D=0;

sys1=ss(A,B,C,D);
P=ctrb(sys1);
if rank(P)==4
    disp('controllable');
else
    disp('not controllable');
end

%Transfer function used to build inverted Pccf matrix
[num, den]=ss2tf(A,B,C,D)
roots(den)

Pc1=[176 86 6 1; 86 6 1 0; 6 1 0 0; 1 0 0 0];

T=P*Pc1;
T1=inv(T);

Ac1=T1*A;
Ac=Ac1*T
Bc=T1*B
Cc=C*T
Dc=D