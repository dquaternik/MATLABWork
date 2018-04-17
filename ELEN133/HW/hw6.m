b1=[zeros(1,9),1];
b2=[.27 -.46 .27];
b3=[.8 -1];
a1=1;
a2=1;
a3=[1 -.8];

[H1,w1]=freqz(b1,a1,512,'whole');
[H2,w2]=freqz(b2,a2,512,'whole');
[H3,w3]=freqz(b3,a3,512,'whole');

figure(1);
subplot(1,3,1), plot(w1,abs(H1));
title('H1');
subplot(1,3,2), plot(w2,abs(H2));
title('H2');
subplot(1,3,3), plot(w3,abs(H3));
title('H3');