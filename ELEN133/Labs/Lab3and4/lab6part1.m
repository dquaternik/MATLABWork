figure(1);
spectrogram(testSig3, 1024, 512, 1024, fs, 'yaxis');
figure(2);
spectrogram(testSig3,512,256,512,fs,'yaxis');
figure(3);
spectrogram(testSig3,200,100,512,fs,'yaxis');