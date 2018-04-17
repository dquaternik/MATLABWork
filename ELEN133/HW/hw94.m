n1=10;
n2=30;

points=1024;
f=[0 0.65 0.7 1.0];
a=[0 0.0 1.0 1.0];
b1=firpm(n1,f,a,'h');

[h,w]=freqz(b1,a,points,'whole');
figure(1);
plot(f,a);
figure(2);
plot(w,abs(h));
figure(3);
zplane(b1);