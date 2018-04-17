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