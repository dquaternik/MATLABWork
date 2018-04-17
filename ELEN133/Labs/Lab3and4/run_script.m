% Project run script

% Lab 3
fs=8000;
tt=.5;
qt=.1;
number=[6 5 2 8 4 1 9 8 5];

testSig1=my_dtmf(tt,qt,fs,number);

[out1,b,Wn,ex1] = mydetector(testSig1);

% Lab 4