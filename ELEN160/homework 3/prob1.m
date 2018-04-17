function [ F ] = prob1( t,x )
p=-1;
F=[0;0];
F(1)=x(2);
F(2)=-x(1)+p*(1-x(2)^2)*x(2);
