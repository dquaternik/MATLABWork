l = 2;
L1 = 1;
L2 = 1;
L3 = 1;
m1 = 1;
m2 = 1;

% The system of equations to solve
%l = L1cos(u1)+L2cos(u2)+L3cos(u3);
%0 = L1sin(u1)+L2sin(u2)+L3sin(u3);
%0 = m2tan(u1)-(m1+m2)tan(u2)+m1tan(u3);

u = [pi/3 pi/8 -pi/3]

for i = 1:10
    F = [L1*cos(u(1))+L2*cos(u(2))+L3*cos(u(3))-l, L1*sin(u(1))+L2*sin(u(2))+L3*sin(u(3)), m2*tan(u(1))-(m1+m2)*tan(u(2))+m1*tan(u(3))];
    DF = [-L1*sin(u(1)) -L2*sin(u(2)) -L3*sin(u(3)); L1*cos(u(1)) L2*cos(u(2)) L3*cos(u(3)); m2*sec(u(1))^2 -(m1+m2)*(sec(u(2))^2) m1*sec(u(3))^2];
    u1 = u' - inv(DF)*F';
    u = u1';
end

rad = u1;
deg = (180/pi)*u1;