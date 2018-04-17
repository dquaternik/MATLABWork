length=63;
m=(length-1)/2;
n=-m:m;
wrect=ones(1,length);
whann=.5*(1+cos((pi.*n)/m));
whamm=.54+.46*cos((pi.*n)/m);
wblack=.42+.5*cos((pi.*n)/m)+0.08*cos((2*pi.*n)/m);

[h0,w0]=freqz(wrect,1,256,'whole');
[h1,w1]=freqz(whann,1,256,'whole');
[h2,w2]=freqz(whamm,1,256,'whole');
[h3,w3]=freqz(wblack,1,256,'whole');


subplot(4,3,1),plot(n,wrect);
title('wrect');
subplot(4,3,2),plot(n,whann);
title('whann');
subplot(4,3,3),plot(n,whamm);
title('whamm');
subplot(4,3,4),plot(n,wblack);
title('wblack');
subplot(4,3,5),plot(w0,abs(h0));
title('magnitude rectangle');
subplot(4,3,6),plot(w0,20*log10(abs(h0)));
title('20log10 magnitude rectangle');
subplot(4,3,7),plot(w1,abs(h1));
title('magnitude Hann');
subplot(4,3,8),plot(w1,20*log10(abs(h1)));
title('20log10 magnitude Hann');
subplot(4,3,9),plot(w2,abs(h2));
title('magnitude Hamming');
subplot(4,3,10),plot(w2,20*log10(abs(h2)));
title('20log10 magnitude Hamming');
subplot(4,3,11),plot(w3,abs(h3));
title('magnitdue Blackman');
subplot(4,3,12),plot(w3,20*log10(abs(h3)));
title('20log10 magnitude Blackman');