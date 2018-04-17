[n1,wp1]=buttord(.15,.25,1,40);
[n2,wp2]=cheb1ord(.15,.25,1,40);
[n3,wp3]=cheb2ord(.15,.25,1,40);
[n4,wp4]=ellipord(.15,.25,1,40);

[b1,a1]=butter(n1,wp1,'low');
[b2,a2]=cheby1(n2,1,wp2,'low');
[b3,a3]=cheby2(n3,40,wp3,'low');
[b4,a4]=ellip(n3,1,40,wp4,'low');

[h1,w1]=freqz(b1,a1,2000,'whole');
[h2,w2]=freqz(b2,a2,2000,'whole');
[h3,w3]=freqz(b3,a3,2000,'whole');
[h4,w4]=freqz(b4,a4,2000,'whole');

figure(1);
subplot(2,2,1),plot(w1,abs(h1));
title('butter');
subplot(2,2,2),plot(w2,abs(h2));
title('cheby1');
subplot(2,2,3),plot(w3,abs(h3));
title('cheby2');
subplot(2,2,4),plot(w4,abs(h4));
title('ellip');