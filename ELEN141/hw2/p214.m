syms t sig y
% sig=.25;
% t=-15:0.01:15;
x1=(1/sqrt(2*pi*sig))*exp(-(power(t,2))/(2*power(sig,2)));

sig2=1;
x2=(1/sqrt(2*pi*sig2))*exp(-(power(t,2))/(2*power(sig2,2)));

sig3=4;
x3=(1/sqrt(2*pi*sig3))*exp(-(power(t,2))/(2*power(sig3,2)));


l1=fourier(x1, t , y);
subplot(3,1,1), plot(t,x1);
title('sig=.25');
subplot(3,1,2), plot(t,x2);
title('sig=1');
subplot(3,1,3), plot(t,x3);
title('sig=4');