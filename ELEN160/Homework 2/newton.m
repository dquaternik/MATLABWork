%The system to be solved
%x1'=-x1+x2-3
%x2'=x1^2+x1*x2^2-1

x=[1 2];

for i=1:10
    F=[-x(1)+x(2)-3, x(1)^2+x(1)*x(2)^2-1];
    DF=[-1+1-3; 2*x(1)+x(2)^2+2*x(1)*x(2)];
    x1=x'-inv(DF)*F';
    x=x1;
end


rad=x1;
deg=(180/pi)*x1;