% Detection script

fs=8000;
tt=.5;
qt=.1;
number=[9 5 1 5 7 0 8 6 9 5];
my_phone=my_dtmf(tt,qt,fs,number);
sig5=my_dtmf(tt,qt,fs,5);

tt1=.25;
qt1=.05;
dial_vals1=[3 5 7 11];
testSig1=my_dtmf(tt1,qt1,fs,dial_vals1);

tt2=.1;
qt2=.02;
dial_vals2=[3 5 7 11];
testSig2=my_dtmf(tt2,qt2,fs,dial_vals2);

tt3=.5;
qt3=.1;
dial_vals3=[3 5 7 11];
testSig3=my_dtmf(tt3,qt3,fs,dial_vals3);

tt4=.25;
qt4=.05;
dial_vals4=1:12;
testSig4=my_dtmf(tt4,qt4,fs,dial_vals4);

testSign=testSig3+.1*randn(1,length(testSig3));

dial_valsA=[5,8,11,7,8,9];
dial_valsB=[5,8,11,7,8,9];
dial_valsC=[5,8,11,7,8,9];
dial_valsD=1:12;

ttA=.25;
ttB=.1;
ttC=.5;
ttD=.25;

qtA=.05;
qtB=.02;
qtC=1;
qtD=.05;

fs=8000;

testA=my_dtmf(ttA,qtA,fs,dial_valsA);
testB=my_dtmf(ttB,qtB,fs,dial_valsB);
testC=my_dtmf(ttC,qtC,fs,dial_valsC);
testD=my_dtmf(ttD,qtD,fs,dial_valsD);

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

y770=filter(b770,1,testB);
y852=filter(b852,1,testB);

t=1:length(y770);

subplot(3,1,1), plot(t,testB);
title('Input testB');
subplot(3,1,2), plot(t,y770);
title('Output y770');
subplot(3,1,3), plot(t,y852);
title('Output y852');

y770=filter(b770,1,testD);
y852=filter(b852,1,testD);
y1209=filter(b1209,1,testD);
y1336=filter(b1336,1,testD);

N=length(testSign);
seg_width=100;
seg_step=0.5*(seg_width);
freq_step=fs/seg_width;

n_seg=floor(N/seg_step)-1;

time_center=zeros(1,n_seg);
avg_mag=zeros(1,n_seg);
mags_row1=zeros(1,n_seg);
mags_row2=zeros(1,n_seg);
mags_col1=zeros(1,n_seg);
mags_col2=zeros(1,n_seg);

nstart=1;

for t=1:n_seg
    n1=nstart;
    n2=nstart+seg_width-1;
    sig=testSign(n1:n2);
    
    fft1=fft(sig,2*seg_width);
    fv=(0:length(fft1)-1)*fs/length(fft1);  
    mags_fft=abs(fft1);
    
    
    
    loc697=round(697/(freq_step/2))+1;
    loc770=round(770/(freq_step/2))+1;
    loc1209=round(1209/(freq_step/2))+1;
    loc1336=round(1336/(freq_step/2))+1;
    
    nstart=seg_step+nstart;
    
    time_center(1,t)=((n1+n2)/2)/8000;
    avg_mag(1,t)=mean(mags_fft);
    mags_row1(1,t)=mags_fft(loc697);
    mags_row2(1,t)=mags_fft(loc770);
    mags_col1(1,t)=mags_fft(loc1209);
    mags_col2(1,t)=mags_fft(loc1336);
end
  
  figure();
  subplot(3,2,1), plot(time_center,avg_mag);
  title('average magnitude');
  subplot(3,2,2), plot(time_center,mags_row1);
  title('magnitudes row 1');
  subplot(3,2,3), plot(time_center,mags_row2);
  title('magnitudes row 2');
  subplot(3,2,4), plot(time_center,mags_col1);
  title('magnitudes column 1');
  subplot(3,2,5), plot(time_center,mags_col2);
  title('magnitudes column 1');
  extra=1:N;
  extra1=1/fs.*extra;
  subplot(3,2,6), plot(extra1,testSign);
  title('entire signal');
  
  actual697=(loc697-1)*freq_step;
  actual770=(loc770-1)*freq_step;
  actual1209=(loc1209-1)*freq_step;
  actual1336=(loc1336-1)*freq_step;
  
  fivebttn=mags_row2.*mags_col2;
  figure();
  plot(fivebttn);