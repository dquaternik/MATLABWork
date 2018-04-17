alpha = 0.95;
alpha2 = 0.99;
w = 2*pi*0.1;

a3=[1, -2*alpha*cos(w), alpha^2];
b3=[1, -alpha*cos(w)];
a4=[1, -2*alpha*cos(2*w), alpha^2];
b4=[1, -alpha*cos(2*w)];
a5=[1, -2*alpha2*cos(w), alpha2^2];
b5=[1, -alpha2*cos(w)];
a6=[1, -2*alpha*cos(w), alpha^2];
b6=[0, alpha*cos(w)];

l1=filter(b3,a3,x1);
l2=filter(b3,a3,x2);
l3=filter(b3,a3,x3);
l4=filter(b3,a3,x4);
l5=filter(b3,a3,x5);

m1=filter(b4,a4,x1);
m2=filter(b4,a4,x2);
m3=filter(b4,a4,x3);
m4=filter(b4,a4,x4);
m5=filter(b4,a4,x5);

n1=filter(b5,a5,x1);
n2=filter(b5,a5,x2);
n3=filter(b5,a5,x3);
n4=filter(b5,a5,x4);
n5=filter(b5,a5,x5);

o1=filter(b6,a6,x1);
o2=filter(b6,a6,x2);
o3=filter(b6,a6,x3);
o4=filter(b6,a6,x4);
o5=filter(b6,a6,x5);