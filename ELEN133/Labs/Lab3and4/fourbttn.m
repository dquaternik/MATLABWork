y770=mydetector(y770,100);
y1209=mydetector(y1209,100);

fourbutton=y770.*y1209;
t=1:length(y770);

subplot(4,1,1), plot(t,testD);
title('TestD');
subplot(4,1,2), plot(t,y770);
title('y770');
subplot(4,1,3), plot(t,y1209);
title('y1209');
subplot(4,1,4), plot(t,fourbutton);
title('4 button');