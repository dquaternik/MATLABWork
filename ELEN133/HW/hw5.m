b1=[1 1 1];
b2=[1 1];
[H1,w1]=freqz(b1,1,2000,'whole');
[H2,w2]=freqz(b2,1,2000,'whole');
figure(1);
plot(w1,abs(H1));
figure(2);
plot(w2,abs(H2));