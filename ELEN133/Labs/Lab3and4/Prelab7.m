
Fs=8000;
w0=(2000*2*pi)/Fs;
p=0.9;

b1=[1 -2*cos(w0) 1];
a1=[1 -2*p*cos(w0) p^2];

figure(1);
[H,W]=freqz(b1,a1,2000,'whole');
plot(W,abs(H));
figure(2);
zplane(b1,a1);

extra0=nthroot(2*cos(w0),6);
extra1=nthroot(2*p*cos(w0),6);

b2=[1 0 0 1i*extra0 0 0 1];
a2=[1 0 0 1i*extra1 0 0 nthroot(p^2,6)];

figure(3);
[H2,W2]=freqz(b2,a2,2000,'whole');
plot(W2,abs(H2));
figure(4);
zplane(b2,a2);

extra2=nthroot(2*cos(w0),8);
extra3=nthroot(2*p*cos(w0),8);

b3=[1 0 0 0 1i*extra2 0 0 0 1];
a3=[1 0 0 0 1i*extra3 0 0 0 nthroot(p^2,8)];

figure(5);
[H3,W3]=freqz(b3,a3,2000,'whole');
plot(W3,abs(H3));
figure(6);
zplane(b3,a3);


w1=(666.67*2*pi)/Fs;

b4=[1 -2*cos(w1) 1];
a4=[1 -2*p*cos(w1) p^2];

figure(7);
[H4,W4]=freqz(b4,a4,2000,'whole');
plot(W4,abs(H4));
figure(8);
zplane(b4,a4);