t=0:.01:10;
xi=12*cos(6*pi*t)+3*cos(10*pi*t);
xq=2*sin(6*pi*t)+3*sin(10*pi*t);

xi2=xi.^2;
xq2=xq.^2;

xa=sqrt(xi2+xq2);


xp=atan(xq./xi);

subplot(2,1,1), plot(t,xa);
title('xa');
subplot(2,1,2), plot(t,xp);
title('xp');