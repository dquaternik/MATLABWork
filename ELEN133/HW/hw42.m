Fs=5;
Ts=1/Fs;
n1=0:63;
t1=Ts*n1;
x1=cos(2*pi*2*t1);
x2=[x1 zeros(1, 192)];

n3=0:255;
t3=Ts*n3;
x3=cos(2*pi*2*t3);

n4=0:1023;
t4=Ts*n4;
x4=cos(2*pi*2*t4);

X1=fft(x1);
X2=fft(x2);
X3=fft(x3);
X4=fft(x4);

fv1=(0:length(X1)-1)*Fs/length(X1);
fv2=(0:length(X2)-1)*Fs/length(X2);
fv3=(0:length(X3)-1)*Fs/length(X3);
fv4=(0:length(X4)-1)*Fs/length(X4);

subplot(2,2,1), plot(fv1-(Fs/2),fftshift(abs(X1)));
title('X1');
subplot(2,2,2), plot(fv2-(Fs/2),fftshift(abs(X2)));
title('X2');
subplot(2,2,3), plot(fv3-(Fs/2),fftshift(abs(X3)));
title('X3');
subplot(2,2,4), plot(fv4-(Fs/2),fftshift(abs(X4)));
title('X4');
