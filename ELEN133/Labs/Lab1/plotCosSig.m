subplot(2,1,1)
plot(svec1,sig1)
xlabel('sample number')
title([ 'cosine at normalized frequency = ' num2str(freq1) ' cycles/sample'])
%
subplot(2,1,2)
Ts=input('Enter sample time interval in seconds: ')
plot(svec1*Ts, sig1)
xlabel('time in seconds')
title([ 'Cosine at frequency = ' num2str(freq1/Ts) ...
' Hz with Ts = ' num2str(1000*Ts) ' ms']);