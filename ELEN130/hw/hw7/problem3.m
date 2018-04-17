num1=[23948.1];
dem1=[1 60 800 0];
sys1=tf(num1,dem1);
feed1=feedback(sys1,1);
stepinfo(feed1)
stepplot(feed1)

figure(2);
num2=[3870000];
dem2=[1 84 2960 62400 576000 0];
sys2=tf(num2,dem2);
rlocus(sys2);
figure(3);
feed2=feedback(sys2,1);
stepplot(feed2)
stepinfo(feed2)
