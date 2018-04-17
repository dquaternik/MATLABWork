function [ J ] = jack2( x1, x2, p)
% Finds jacobian at specific equillibrium and p value

J=zeros(2,2);
J(1,1)=-1-2*x1;
J(1,2)=1;
J(2,1)=p;
J(2,2)=-1-2*x2;
end

