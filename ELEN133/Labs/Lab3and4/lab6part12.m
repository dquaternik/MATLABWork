[ya, fsa, nbitsa]=wavread('tone_1026.wav');
sound(ya,fsa);

spectrogram(ya,2048,1024,2048,fsa,'yaxis');

figure(2);
[yb,fsb,nbitsb]=wavread('xtheme.wav');
sound(yb,fsb);
spectrogram(yb,2048,1024,2048,fsb,'yaxis');

figure(3);
[yc,fsc,nbitsc]=wavread('ghostbusters.wav');
sound(yc,fsc);
spectrogram(yc,2048,1024,2048,fsc,'yaxis');