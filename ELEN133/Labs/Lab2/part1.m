n_in=256;
freq1=0.01;
freq2=0.1;
freq3=0.4;

in=zeros(1,n_in);
for i=1:256
    if(i>(n_in/2))
        in(i)=1;
    end
end
tv=0:(n_in-1);
x1=[1 zeros(1,n_in-1)];
x2=[zeros(1,(n_in/2)) ones(1,(n_in/2))];
x3=cos(2*pi*freq1*tv);
x4=cos(2*pi*freq2*tv);
x5=cos(2*pi*freq3*tv);

subplot(2,3,1), plot(tv,x1);
subplot(2,3,2), plot(tv,x2);
subplot(2,3,3), plot(tv,x3);
subplot(2,3,4), plot(tv,x4);
subplot(2,3,5), plot(tv,x5);
