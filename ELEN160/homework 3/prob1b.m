t=0:10000;

a=[.1,.1];
b=[-.1,-.1];
c=[.5,0];

[t,x]=ode45(@prob1,t,a);
x1=x(:,1);
x2=x(:,2);

[t,x]=ode45(@prob1,t,b);
y1=x(:,1);
y2=x(:,2);

[t,x]=ode45(@prob1,t,c);
z1=x(:,1);
z2=x(:,2); 

plot(x1,x2,a(1),a(2),'o',y1,y2,b(1),b(2),'o',z1,z2,c(1),c(2),'o');