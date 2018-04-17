n=1;
w=pi/2;
h1=sin(w*n)/(pi*n);

n=3;
h3=sin(w*n)/(pi*n);

n=5;
h5=sin(w*n)/(pi*n);

hn=[h1 0 h3 0 h5];

[H1 w1]=plothmagphase(h1);
figure(2);
[H3 w3]=plothmagphase(h3);
figure(3);
[H5 w5]=plothmagphase(h5);
figure(4);
[HN wn]=plothmagphase(hn);