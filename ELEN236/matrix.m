syms t;
t2=[-.5/11 -1/11; 11.5/11 1/11];
t1=[1 1; -11.5 -.5];
a=[exp(-11.5*t) 0; 0 exp(-.5*t)];

a1=t2*a;
Ad=a1*t1