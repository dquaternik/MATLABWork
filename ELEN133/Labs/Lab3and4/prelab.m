N1=200;
w=20;
N2=1024;
fs=8000;
fc1=852;
fc2=770;
Wn1=[fc1-w,fc1+w]/(fs/2);
Wn2=[fc2-w,fc2+w]/(fs/2);
b852=fir1(N1,Wn1,rectwin(N1+1));
b770=fir1(N1,Wn2,rectwin(N1+1));
[H852, fv]=freqz(b852,1,N2,fs);
[H770, fv2]=freqz(b770,1,N2,fs);

plot(fv,abs(H770),'-r',fv,abs(H852),'-b');