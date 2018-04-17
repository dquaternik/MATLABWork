
Fs=50;
w0=(12*2*pi)/Fs;
p=0.9;
a=[1 -2*p*cos(w0) p^2];

figure(1);
b=[1 -2*cos(w0) 1];
[H,W]=freqz(b,1,2000,'whole');
plot(W,abs(H));


Fs1=11000;
w1=(1000*2*pi)/Fs1;
b1=[1 -2*cos(w1) 1];
figure(2)
[H2,W2]=freqz(b1,1,2000,'whole');
plot(W2,abs(H2));

figure(3);
[H3,W3]=freqz(b,a,2000,'whole');
plot(W3,abs(H3));

a1=[1 -2*p*cos(w1) p^2];
figure(4);
[H4,W4]=freqz(b1,a1,2000,'whole');
plot(W4,abs(H4));
