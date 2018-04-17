n=1:11;
m=4;
w=2*pi*100/600;
x=cos(w*n);
index=mod(n.*m,length(n));
y=x(index+1);