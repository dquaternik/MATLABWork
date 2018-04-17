N=16;
sn=sin((0:N-1)*2*pi/N);
Fs=8000;
fout=440;
tone_d=.5;
M=tone_d*Fs;
f_step=fout*N/Fs;


for t=1:M
    index(t)=mod(round(f_step*t),N)+1;
    out=sn(index);
end

t=1:M;
plot(out);
sound(out,Fs);