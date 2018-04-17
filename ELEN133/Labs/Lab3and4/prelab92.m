A=220;
B=246.94;
C=261.63;
D=293.66;
E=329.63;
F=349.23;
G=392;
a=440;
b=493.88;
c=523.25;
d=587.33;
e=659.26;
f=698.46;
g=783.99;
aa=880;

tone_list=[440];
N=256;
sn=sin((0:N-1)*2*pi/N);
Fs=8000;
tone_d=.5;
M=tone_d*Fs;
out=0;
for tindex=1:length(tone_list)
    fout=tone_list(tindex);
    f_step=round(fout*N/Fs);
    for t=1:M
        index(t)=mod(f_step*t,N)+1;
        extra=sn(index);
    end
    out=[out extra];
end

t=1:M;
plot(out);
sound(out,Fs);