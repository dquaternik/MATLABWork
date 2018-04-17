n1=4801;
n2=8800;
sig3b=testSig3(n1:n2);
S3b=fft(sig3b);
fvb=(0:length(S3b)-1)*fs/length(S3b);

n3=2401;
n4=6400;
sig3c=testSig3(n3:n4);
S3c=fft(sig3c);
fvc=(0:length(S3c)-1)*fs/length(S3c);

n5=1901;
n6=2100;
sig3d=testSig3(n5:n6);
S3d=fft(sig3d);
fvd=(0:length(S3d)-1)*fs/length(S3d);

figure(1);
plot(fvb,abs(S3b));
figure(2);
plot(fvc,abs(S3c));
figure(3);
plot(fvd,abs(S3d));