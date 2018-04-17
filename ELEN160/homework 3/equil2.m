function [ eq ] = equil2( p )
%Gives equillibrium for p

eq=roots([-1 -2 -2 (p-1)]);
end

