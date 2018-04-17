figure(1);
a=[0 1 0 0; 0 0 1 0; 0 0 0 1; -680 -176 -86 -6];
b=[0;0;0;1];
c=[ 100 20 10 0];
d=0;

sys=ss(a,b,c,d);

[k,t1]=impulse(sys);

subplot(2,1,1), plot(t1,k);
title('impulse response');

[l,t2]=step(sys);

subplot(2,1,2), plot(t2,l);
title('step response');

figure(2)
x0=[1;2;3;4];
initial(sys,x0);
