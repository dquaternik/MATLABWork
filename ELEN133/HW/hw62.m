b1=[zeros(1,9),1];
b2=[.27 -.46 .27];
b3=[.8 -1];
a1=1;
a2=1;
a3=[1 -.8];

w=pi/8;
n=-20:60;
xn=sin(w*n)+(sin(3*w*n))/3+sin(5*w*n)/5;

Y1=filter(b1,a1,xn);
Y2=filter(b2,a2,xn);
Y3=filter(b3,a3,xn);

figure(2);
subplot(2,2,1),plot(xn);
title('xn');
subplot(2,2,2),plot(Y1);
title('Y1');
subplot(2,2,3),plot(Y2);
title('Y2');
subplot(2,2,4),plot(Y3);
title('Y3');