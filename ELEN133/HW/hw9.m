[N0,Wn0]=buttord(.2,.4,1,40);
[N1,Wn1]=buttord(.2,.4,.5,60);
[N2,Wn2]=buttord(.2,.3,.5,60);

[b0,a0]=butter(N0,Wn0,'low');
[b1,a1]=butter(N1,Wn1,'low');
[b2,a2]=butter(N2,Wn2,'low');

[H0,w0]=freqz(b0,a0,2000,'whole');
[H1,w1]=freqz(b1,a1,2000,'whole');
[H2,w2]=freqz(b2,a2,2000,'whole');

figure(1);
plot(w0,abs(H0));
figure(2);
plot(w1,abs(H1));
figure(3);
plot(w2,abs(H2));