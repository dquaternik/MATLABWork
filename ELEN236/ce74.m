%% CE 7.4a

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

%% New work

%Desired 2% Peak overshoot, 2s settling time
%Chosen eigen values are -20, -21 for fast response
%s^4+45s^3+590s^2+1949s+2763

Pc=[Bc Ac*Bc (Ac^2)*Bc (Ac^3)*Bc];
Pc1=inv(Pc);
d=(Ac^4)+45*(Ac^3)+590*(Ac^2)+1949*(Ac)+2763*I;
K=[0 0 0 1]*Pc1*d;

Adc=Ac-Bc*K;
eig(Adc)
[num,den]=ss2tf(Adc,Bc,Cc,Dc);
sys1=tf(num,den);

%Plots original system's step response
figure(1);
subplot(2,2,1), step(sys);
title('open loop step response');
subplot(2,2,2), step(sys1);
title('closed loop step response');
subplot(2,2,3), impulse(sys);
title('open loop impulse response');
subplot(2,2,4), impulse(sys1);
title('closed loop impulse response');

stepinfo(sys1)

%All criteria have been met for the system. Overshoot is under 2% and the
%settling time is less than 2s. The system stabilizes to 0 so the bar would
%be straight when it finished balancing. 
