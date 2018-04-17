a=1/pi.^2;


f=-1000:1000;
sig=.25;
g1=a./(1+1j*sig*2*pi*f-4*sig.^2*pi.^2*f.^2);
db1=10*log10(g1);
subplot(3,1,1), plot(f,db1);
title('sig=.25');

sig2=1;
g2=a./(1+1j*sig2*2*pi*f-4*sig2.^2*pi.^2*f.^2);
db2=10*log10(g2);
subplot(3,1,2), plot(f,db2);
title('sig=1');

sig3=4;
g3=a./(1+1j*sig3*2*pi*f-4*sig3.^2*pi.^2*f.^2);
db3=10*log10(g3);
subplot(3,1,3), plot(f,db3);
title('sig=4');
