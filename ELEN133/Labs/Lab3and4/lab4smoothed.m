y770=mydetector(y770,100);
y852=mydetector(y852,100);
y1209=mydetector(y1209,100);
y1336=mydetector(y1336,100);

eghtbttn=y852.*y1336;
t=1:length(eghtbttn);
subplot(4,1,1), plot(t,testD);
title('TestD');
subplot(4,1,2), plot(t,y852);
title('y852');
subplot(4,1,3), plot(t,y1336);
title('y1336');
subplot(4,1,4), plot(t,eghtbttn);
title('8 button');