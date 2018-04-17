%% Problem 3/CME 4.4

A=[0 1 0 0; 0 0 1 0; 0 0 0 1; -680 -176 -86 -6];
B=[0;0;0;1];
C=[100 20 10 0];
D=0;

sys=ss(A,B,C,D);
P=ctrb(sys);

Q=obsv(sys);
y=rank(Q);
if y==length(a)
    disp('Observable');
else
    disp('Not Observable');
end

%Previous work to find CCF
Pc1=[176 86 6 1; 86 6 1 0; 6 1 0 0; 1 0 0 0];
T=P*Pc1;
T1=inv(T);
Ac1=T1*A;
Ac=Ac1*T
Bc=T1*B
Cc=C*T
Dc=D

%Determining OCF. Comparing the two they are transpose of each other
Ao=Ac.'
Bo=Bc.'
Co=Cc.'
Do=Dc.'

%% Problem 4

A=[-5 -5 4; 2 0 -2; 0 -2 -1];
B=[-1; 2; -2];
C=[-1 1 2];
D=0;

sys=ss(A,B,C,D);
Q=obsv(sys);
y=rank(Q);
if y==length(a)
    disp('Observable');
else
    disp('Not Observable');
end

[num,den]=ss2tf(A,B,C,D)

syms s
frac=(-(s^2)+5*s-18)/(s^3+6*s^2+11*s+6)
frac1=simplifyFraction(frac)

if frac1==frac
    disp('Minimal form')
else
    disp('non-minimal')
end

%% Problem 5/CME 5.4

A=[0 1 0 0; 0 0 1 0; 0 0 0 1; -680 -176 -86 -6];
B=[0;0;0;1];
C=[100 20 10 0];
D=0;

[num,den]=ss2tf(A,B,C,D)

frac=(10*s^2+20*s+100)/(s^4+6*s^3+86*s^2+176*s+680)

%This is the minimal form of transfer function
frac1=simplifyFraction(frac)

%displays if minimal or not
if frac1==frac
    disp('Minimal form')
else
    disp('non-minimal')
end


num1=[0 0 10]
den1=[1 4 68]

%minimal form state-space realization
[A,B,C,D]=tf2ss(num1,den1)

