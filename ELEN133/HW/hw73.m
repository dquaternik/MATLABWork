[h,w]=freqz(b,1,2000,'whole');
[h1,w1]=freqz(b1,1,2000,'whole');

subplot(2,2,1),plot(w,abs(h));
title('magnitude plot');
subplot(2,2,2),plot(w,20*log10(abs(h)));
title('20log10 magnitude plot');
subplot(2,2,3),plot(w1,abs(h1));
title('magnitude plot 2');
subplot(2,2,4),plot(w1,20*log10(abs(h1)));