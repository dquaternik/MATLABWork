[yb,fsb,nbitsb]=wavread('tone_1026.wav');

w0=1000*2*pi/fsb;
yint=.5.*yb+.5*cos(w0);

p=.9;
b=[1 -2*cos(w0) 1];
a=[1 -2*p*cos(w0) p^2];

y1=filter(b,1,yint);
y2=filter(b,a,yint);

figure(1);
spectrogram(yb,2048,1024,2048,fsb,'yaxis');
sound(yb,fsb);

pause(5);
figure(2);
sound(yint,fsb);
spectrogram(yint,2048,1024,2048,fsb,'yaxis');

pause(5)
figure(3);
spectrogram(y1,2048,1024,2048,fsb,'yaxis');
sound(y1,fsb);

pause(5);
figure(4);
spectrogram(y2,2048,1024,2048,fsb,'yaxis');
sound(y2,fsb);