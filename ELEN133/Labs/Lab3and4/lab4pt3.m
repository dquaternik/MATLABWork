N1=100;
w=40;
%N2=1024;
fs=8000;
fc1=852;
fc2=770;
fc3=1209;
fc4=1336;
Wn1=[fc1-w,fc1+w]/(fs/2);
Wn2=[fc2-w,fc2+w]/(fs/2);
Wn3=[fc3-w,fc3+w]/(fs/2);
Wn4=[fc4-w,fc4+2]/(fs/2);
b852=fir1(N1,Wn1,rectwin(N1+1));
b770=fir1(N1,Wn2,rectwin(N1+1));
b1209=fir1(N1,Wn3,rectwin(N1+1));
b1336=fir1(N1,Wn4,rectwin(N1+1));
%[H852, fv]=freqz(b852,1,N2,fs);
%[H770, fv2]=freqz(b770,1,N2,fs);
%[H1209, fv3]=freqz(b1209,1,N2,fs);
%[H1336, fv4]=freqz(b1336,1,N2,fs);;