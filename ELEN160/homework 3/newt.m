function [ E, x ] = newt( x0 )
%Way to solve for newtons method

syms p;
F=[0;0];
J=zeros(2,2);
x=x0;

F(1)=-x(1) - x(1)^2 + x(2);
F(2)=p*x(1) - x(2) - x(2)^2;

while(norm(F,inf)>1e-10)
    J(1,1)=-1 - 2*x(1);
    J(1,2)= 1;
    J(2,1)= p;
    J(2,2)= -1 -2*x(2);
    y=-inv(J)*F;
    x=x+y;
    F(1)=-x(1)+x(2)-3;
    F(2)=x(1)^2+x(1)*x(2)^2-1;
end