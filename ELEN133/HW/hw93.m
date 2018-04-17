[b1,a1]=cheby1(6,2,[.15 .3],'stop');
[h1,w1]=freqz(b1,a1,2000,'whole');

[b2,a2]=ellip(6,2,40,.2,'high');
[h2,w2]=freqz(b2,a2,2000,'whole');

[b3,a3]=cheby2(6,40,[.2 .275]);
[h3,w3]=freqz(b3,a3,2000,'whole');


figure(1);
subplot(1,3,1),plot(w1,abs(h1));
title('6a');
subplot(1,3,2),plot(w2,abs(h2));
title('6b');
subplot(1,3,3),plot(w3,abs(h3));
title('6c');