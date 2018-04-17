f=[-40:0.1:40];
plot(f,10*log10((1/pi)*sinc(f).^2),f,-40*ones(size(f)));
axis([-40,40,-50,0]);
title('2.5a');