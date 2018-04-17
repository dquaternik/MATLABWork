N=2;
Wn=1200/4000;
[b,a]=butter(N,Wn);
[H,w]=freqz(b,a,2000,'whole');

figure(1);
zplane(b,a);

figure(2);
plot(w,abs(H));

a1=[a(1) 0 0 a(2) 0 0 a(3)];
b1=[b(1) 0 0 b(2) 0 0 b(3)];
[H1,w1]=freqz(b1,a1,2000,'whole');
figure(3);
plot(w1,abs(H1));
figure(4);
zplane(b1,a1);