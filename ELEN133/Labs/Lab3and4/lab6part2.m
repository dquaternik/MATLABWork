N1=200;
[yb,fsb,nbitsb]=wavread('ghostbusters.wav');
figure(1);
spectrogram(yb,2048,1024,2048,fsb,'yaxis');

Wn1=[200,500]/(fsb/2);
b1=fir1(N1,Wn1,rectwin(N1+1));

Wn2=[800,1000]/(fsb/2);
b2=fir1(N1,Wn2,rectwin(N1+1));

Wn3=[2000,3000]/(fsb/2);
b3=fir1(N1,Wn3,rectwin(N1+1));

y1=filter(b1,1,yb);
y2=filter(b2,1,yb);
y3=filter(b3,1,yb);


figure(2);
subplot(1,3,1),plot(y1);
subplot(1,3,2),plot(y2);
subplot(1,3,3),plot(y3);