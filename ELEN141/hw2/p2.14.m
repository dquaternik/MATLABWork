sig=.25;
t=-10:0.01:10;
x=(1/sqrt(2*pi*sig))*exp(-t^2/(2*pi^2));
plot(t,x);