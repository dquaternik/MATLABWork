function [ xk ] = sequencer( x0,p,n )
%Compute a sequence x(k) from x(0),p, and Kmax=n.

xk=zeros(1,n);
t=1;
xk(1,t)=x0;
while t<n
    xk(1,t+1)=p*xk(t)*(1-xk(1,t));  
    t=t+1;
end
