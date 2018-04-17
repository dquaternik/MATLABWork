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