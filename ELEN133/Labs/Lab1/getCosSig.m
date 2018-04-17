N1=input('Enter number of samples: ');
freq1=input('Enter normalized frequency in cycles/sample: ');
phase=0.0;
svec1=0:(N1-1);
sig1=cos(2*pi*freq1*svec1+phase);