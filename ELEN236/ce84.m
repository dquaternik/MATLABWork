%% Devon Quaternik
%% Project 1.6

%% CE 8.4

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

sys=ss(a,B,c,d)

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

Pc=[Bc Ac*Bc (Ac^2)*Bc (Ac^3)*Bc];
Pc1=inv(Pc);
I=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
d=(Ac^4)+45*(Ac^3)+590*(Ac^2)+1949*(Ac)+2763*I;
K=[0 0 0 1]*Pc1*d;

Adc=Ac-Bc*K;
eig(Adc)
[num,den]=ss2tf(Adc,Bc,Cc,Dc);
sys1=tf(num,den);

%% New work

%Desired 2% Peak overshoot, 2s settling time
%Chosen eigen values were -20, -21 in the last step
%For this step -200 and -210 are chosen. 
%desired eqn
%s^4+414s^3+43646.57s^2+170693.7s+275940

p=[-2+1.6061*j -2-1.6061*j -200 -210];
L=place(Ac',Cc',p)'
Adl=Adc-L*Cc;
[num1,den1]=ss2tf(Adl,Bc,Cc,Dc);
sys2=tf(num1,den1);

%Plots all system
figure(1);
subplot(3,1,1),impulse(sys);
title('Open loop impulse response');
subplot(3,1,2),impulse(sys1);
title('Closed loop impulse response');
subplot(3,1,3),stepplot(sys2);
title('Closed loop impulse response with observer');

%As you can see, the observer speeds up the response by a lot. It also
%leaves it very close to zero, considering the scale of the y axis is of
%the order 10^-6