num1=[1];
dem1=[1 12 41 42];
sys1=tf(num1,dem1);
rlocus(sys1);

figure(2);
num2=[1 .05395];
dem2=[1 12.01 41.12 42.41 .42];
sys2=tf(num2,dem2);
rlocus(sys2);
figure(3);
feed2=feedback(sys2,1);
stepplot(feed2)
