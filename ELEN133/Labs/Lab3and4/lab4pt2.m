y770=filter(b770,1,testB);
y852=filter(b852,1,testB);

t=1:length(y770);

subplot(3,1,1), plot(t,testB);
title('Input testB');
subplot(3,1,2), plot(t,y770);
title('Output y770');
subplot(3,1,3), plot(t,y852);
title('Output y852');