syms t sig y
% sig=.25;
% t=-15:0.01:15;
x1=(1/sqrt(2*pi*sig))*exp(-(power(t,2))/(2*power(sig,2)));

sig2=1;
x2=(1/sqrt(2*pi*sig2))*exp(-(power(t,2))/(2*power(sig2,2)));

sig3=4;
x3=(1/sqrt(2*pi*sig3))*exp(-(power(t,2))/(2*power(sig3,2)));
fourier(x1);
