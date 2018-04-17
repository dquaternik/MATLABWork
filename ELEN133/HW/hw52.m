b=[1 3 5 5 3 1];
[H,W]=freqz(b,1,2000,'whole');
plot(W,abs(H));
