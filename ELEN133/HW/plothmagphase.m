function [ H w ] = plothmagphase ( h )
% [H w] = plothmagephase(h)
%   This returns the same outputs as freqz, but also plots h, mag and phase

[H,w]=freqz(h,1,128,'whole');
H_mag=abs(H);
H_phase=angle(H);

subplot(3,1,1);
stem(0:length(h)-1,h);
axis([-0.5 (length(h)-0.5) min(h)-0.5 max(h)+0.5])
xlabel('n');
subplot(3,1,2);
plot(w-pi,fftshift(H_mag))
xlabel('w');
subplot(3,1,3);
plot(w-pi,fftshift(H_phase))
xlabel('w');

end
